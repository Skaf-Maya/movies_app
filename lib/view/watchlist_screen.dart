import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/home_screen_controller.dart';
import 'package:movies_app/controller/watchlist_screen_controller.dart';
import 'package:movies_app/utill/app_colors.dart';
import 'package:movies_app/utill/custom_themes.dart';
import 'package:movies_app/utill/dimensions.dart';
import 'package:movies_app/widgets/header.dart';
import 'package:movies_app/widgets/movies_widget.dart';
import 'package:movies_app/widgets/textfield/custom_textfield.dart';

class WatchlistScreen extends StatelessWidget {
  WatchlistScreen({Key? key}) : super(key: key);

  HomeScreenController homeScreenController = Get.find();
  WatchlistScreenController watchlistScreenController = Get.put(WatchlistScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: AppColors.primaryColor,
      child: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                controller: watchlistScreenController.scrollController,
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
                              Text("Watchlist",
                                style: extraMediumRegular.copyWith(
                                    color: AppColors.lightRedColor,
                                    fontWeight: FontWeight.w800
                                ),),
                            ],
                          ),
                          const SizedBox(height: 30),
                          watchlistScreenController.watchList.isEmpty ?
                          SizedBox(
                            height: Get.height / 2,
                            child: Center(
                              child: Text("No Data View",
                                style: largeTitleRegular.copyWith(
                                    color: AppColors.lightGreyColor
                                ),
                              ),
                            ),
                          ) :
                          ListView.builder(
                            itemCount: watchlistScreenController.watchList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index) {
                              return InkWell(
                                onTap: () {

                                },
                                child: MoviesWidget(
                                  height: 95,
                                  image: "https://darsoft.b-cdn.net/assets/movies/${watchlistScreenController.watchList[index].id}.jpg",
                                  borderRadius: 8,
                                  title: watchlistScreenController.watchList[index].title,
                                  year: watchlistScreenController.watchList[index].year,
                                  rating: watchlistScreenController.watchList[index].rating.toString(),
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
    )
    );
  }
}
