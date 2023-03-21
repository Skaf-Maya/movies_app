import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/home_screen_controller.dart';
import 'package:movies_app/controller/splash_screen_controller.dart';
import 'package:movies_app/utill/app_colors.dart';
import 'package:movies_app/utill/custom_themes.dart';
import 'package:movies_app/utill/dimensions.dart';
import 'package:movies_app/view/bottom_nav_bar.dart';
import 'package:movies_app/view/movie_details_screen.dart';
import 'package:movies_app/view/profile_screen.dart';
import 'package:movies_app/view/watchlist_screen.dart';
import 'package:movies_app/widgets/category_grid_view.dart';
import 'package:movies_app/widgets/header.dart';
import 'package:movies_app/widgets/movies_widget.dart';
import 'package:movies_app/widgets/textfield/custom_textfield.dart';

class HomeScreen extends StatelessWidget {
  // HomeScreen({Key? key}) : super(key: key);

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SplashScreenController splashScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: homeScreenController.selectCategory.value == -1 ?
      homeScreenController.selected.value == 0 ?
      home(context): homeScreenController.selected.value == 1 ? WatchlistScreen() :
      const ProfileScreen() :
      homeScreenController.selectCategory.value == 0 ?
      home(context): const Center(),
    ));
  }

  home(BuildContext context) {
    return  Container(
      color: AppColors.primaryColor,
      child: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                controller: homeScreenController.scrollController,
                slivers: [
                  SliverAppBar(
                    floating: true,
                    elevation: 0,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    backgroundColor: Theme.of(context).highlightColor,
                    actions: [
                      Header(
                        prefixIcon: null,
                        text: "Movies App",
                        suffixIcon: "assets/images/icons/notification.svg",
                        prefixTap: () {},
                        suffixTap: () {},
                      )
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(Dimensions.paddingLarge),
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: homeScreenController.search,
                            hintText: "Search",
                            textInputType: TextInputType.text,
                            focusNode: null,
                            nextNode: null,
                            borderRadius: 28,
                            prefix: "assets/images/icons/search.svg",
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10,),
                              splashScreenController.loading.value ?
                              Text(homeScreenController.selectCategory.value != -1 ?
                              splashScreenController.categoryName.toString() : "Trending Categories",
                                style: extraMediumRegular.copyWith(
                                    color: homeScreenController.selectCategory.value !=-1?
                                    AppColors.redColor : Colors.white,
                                    fontWeight: FontWeight.w800
                                ),) : const Center(),
                            ],
                          ),
                          const SizedBox(height: 30),
                          homeScreenController.selectCategory.value != 0 ?
                          GridView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingExtraDefault),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 1
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: splashScreenController.category.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    homeScreenController.selectCategory.value = 0;
                                    splashScreenController.getMovies(index);
                                  },
                                  child: CategoryGridView(
                                    text: splashScreenController.category[index].title,
                                    borderRadius: 8,
                                  ),
                                );
                              }) : !splashScreenController.loading.value ?
                          SizedBox(
                              height: Get.height / 2,
                              child: const Center(
                                child: CircularProgressIndicator(color: AppColors.lightGreyColor),
                              ),
                            ) : splashScreenController.movie.isEmpty ?
                          SizedBox(
                            height: Get.height / 2,
                            child: Center(
                              child: Text("Coming Soon",
                                style: largeTitleRegular.copyWith(
                                  color: AppColors.lightGreyColor
                                ),
                              ),
                            ),
                          ) :
                          ListView.builder(
                            itemCount: splashScreenController.movie.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() => MovieDetailsScreen(splashScreenController.movie[index]));
                                },
                                child: MoviesWidget(
                                  height: 95,
                                  image: "https://darsoft.b-cdn.net/assets/movies/${splashScreenController.movie[index].id}.jpg",
                                  borderRadius: 8,
                                  title: splashScreenController.movie[index].title,
                                  year: splashScreenController.movie[index].year,
                                  rating: splashScreenController.movie[index].rating.toString(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
