import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/utill/app_colors.dart';
import 'package:movies_app/utill/custom_themes.dart';
import 'package:movies_app/utill/dimensions.dart';

class MoviesWidget extends StatelessWidget {
  final double height;
  final String image;
  final double? borderRadius;
  final String? title;
  final String? year;
  final String? rating;


  MoviesWidget({
    required this.height,
    required this.image,
    this.borderRadius,
    this.title,
    this.year,
    this.rating
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingExtraSmall),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightWhiteColor,
                borderRadius: BorderRadius.circular(borderRadius!),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.darkGreyColor,
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingDefault),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title!,
                      style: extraDefaultTitleRegular.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                    Text(year!,
                      style: extraDefaultTitleRegular.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/icons/star.svg"),
                        const SizedBox(width: 3),
                        Text("${rating}/10",
                          style: extraSmallTitleRegular.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}