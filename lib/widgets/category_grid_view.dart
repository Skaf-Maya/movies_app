import 'package:flutter/material.dart';
import 'package:movies_app/utill/app_colors.dart';
import 'package:movies_app/utill/custom_themes.dart';

class CategoryGridView extends StatelessWidget {

  final String text;
  final double? borderRadius;

  CategoryGridView({
    required this.text,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightWhiteColor,
                borderRadius: BorderRadius.circular(borderRadius == null ? 0 : 8),
              ),
              child: Center(
                child: Text(text,
                    style: defaultTitleRegular.copyWith(
                        color: AppColors.redColor,
                        fontWeight: FontWeight.w800
                    )
                ),
              )
          ),
        ),

      ],
    );
  }
}