import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/movie_details_controller.dart';
import 'package:movies_app/controller/splash_screen_controller.dart';
import 'package:movies_app/controller/watchlist_screen_controller.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/utill/app_colors.dart';
import 'package:movies_app/utill/custom_themes.dart';
import 'package:movies_app/utill/dimensions.dart';
import 'package:movies_app/widgets/button/custom_button.dart';
import 'package:movies_app/widgets/header.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailsScreen extends StatefulWidget {
  // ProductDetailsScreen({Key? key}) : super(key: key);
  WatchlistScreenController watchlistScreenController = Get.put(WatchlistScreenController());

  MovieElement movie;
  MovieDetailsScreen(this.movie){
    movie.favorite.value = watchlistScreenController.isFavorite(movie);
  }

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailsScreenController movieDetailsScreenController = Get.put(MovieDetailsScreenController());
  SplashScreenController splashScreenController = Get.find();
  WatchlistScreenController watchlistScreenController = Get.put(WatchlistScreenController());

  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: splashScreenController.movie.first.youtubeVideoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Container(
          color: AppColors.primaryColor,
          child: SafeArea(
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      prefixIcon: Icons.arrow_back_ios,
                      prefixTap: () {
                        Get.back();
                      },
                      text: widget.movie.title,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingExtraLarge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: YoutubePlayer(
                              controller: youtubePlayerController,
                              showVideoProgressIndicator: false,
                            ),
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            height: 125,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.lightWhiteColor,
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: NetworkImage("https://darsoft.b-cdn.net/assets/movies/${widget.movie.id}.jpg",),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingLarge),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(widget.movie.title,
                                          style: extraDefaultTitleRegular.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(widget.movie.year,
                                              style: extraMediumRegular.copyWith(
                                                  color: AppColors.lightGreyColor,
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                            const SizedBox(width: 50),
                                            SvgPicture.asset("assets/images/icons/star.svg",width: 16),
                                            const SizedBox(width: 10),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 3),
                                              child: Text("${widget.movie.rating}/10",
                                                style: extraDefaultTitleRegular.copyWith(
                                                    color: AppColors.lightGreyColor,
                                                    fontWeight: FontWeight.w800
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        widget.movie.favorite.value ? const Center() :
                                        InkWell(
                                          onTap: () {
                                            widget.movie.favorite.value = !widget.movie.favorite.value;
                                            watchlistScreenController.addToWatchList(widget.movie, context);
                                          },
                                          child: CustomButton(
                                            height: 33,
                                            width: 150,
                                            borderRadius: 20,
                                            buttonText: "Add to Watchlist",
                                            textStyle: smallTitleRegular.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Summary",
                                style: mediumTitleRegular.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(widget.movie.summary,
                                style: smallTitleRegular.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text("Director: ${widget.movie.director}",
                                style: smallTitleRegular.copyWith(
                                    color: AppColors.lightGreyColor,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text("Writers: ${widget.movie.writers}",
                                style: smallTitleRegular.copyWith(
                                    color: AppColors.lightGreyColor,
                                    fontWeight: FontWeight.w500
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingExtraLarge),
                          child: Text("Cast",
                            style: mediumTitleRegular.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingExtraDefault),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: Dimensions.paddingDefault),
                                child: InkWell(
                                  onTap: () {
                                    if(movieDetailsScreenController.activeIndex.value == 0) {
                                      return;
                                    } else {
                                      movieDetailsScreenController.setIndex(--movieDetailsScreenController.activeIndex.value);
                                    }
                                  },
                                  child: Container(
                                      color: AppColors.primaryColor,
                                      child: const Icon(Icons.arrow_back_ios,color: AppColors.redColor)),
                                ),
                              ),
                              SizedBox(
                                  width: Get.width * 0.8,
                                  height: 100,
                                  child: Center(
                                    child: ScrollablePositionedList.builder(
                                      itemScrollController: movieDetailsScreenController.itemScrollController,
                                      itemCount: widget.movie.actors.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context,index){
                                        return GestureDetector(
                                            onTap: () {
                                              movieDetailsScreenController.setIndex(index);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: AspectRatio(
                                                      aspectRatio: 1,
                                                      child: ClipOval(
                                                        child: CachedNetworkImage(
                                                          fit: BoxFit.cover,
                                                          imageUrl: "https://darsoft.b-cdn.net/assets/artists/${widget.movie.actors[index].id}.jpg",
                                                          errorWidget: (context, url, error) => Image.asset(
                                                              fit: BoxFit.cover,"assets/loading-gif.gif"),
                                                          placeholder: (context, url) =>
                                                              Shimmer.fromColors(
                                                                  baseColor: AppColors.lightWhiteColor,
                                                                  highlightColor: AppColors.lightGreyColor,
                                                                  child: Image.asset(
                                                                      fit: BoxFit.cover,"assets/loading-gif.gif")),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Center(
                                                      child: Text(widget.movie.actors[index].name,
                                                        maxLines: 2,
                                                        style: extraSmallTitleRegular.copyWith(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w500
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                        );
                                      },
                                    ),
                                  )
                              ),
                              InkWell(
                                onTap: () {
                                  movieDetailsScreenController.setIndex(++movieDetailsScreenController.activeIndex.value);
                                },
                                child: Container(
                                    color: AppColors.primaryColor,
                                    child: const Icon(Icons.arrow_forward_ios,color: AppColors.redColor)),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
