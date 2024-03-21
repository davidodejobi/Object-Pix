import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:object_pix/src/core/core.dart';
import 'package:object_pix/src/shared/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 20.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Object Pix',
                          style: context.bodyMedium.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        28.hi,
                        Text(
                          'Collection Name',
                          style: context.displaySmall.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        24.hi,
                        Container(
                          height: .4.sh,
                          width: .5.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                              ),
                            ),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10.r,
                                spreadRadius: 2.r,
                                offset: Offset(0, 10.h),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 20.w,
                              bottom: 32.h,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.0),
                                    Colors.black.withOpacity(0.9),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )),
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '04',
                                  style: context.displayLarge.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                12.hi,
                                Text(
                                  'Photo by John Doe on Unsplash',
                                  style: context.labelMedium.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        24.hi,
                        Wrap(
                          spacing: 12.w,
                          runSpacing: 12.h,
                          children: [
                            ...[
                              'Fast',
                              'Convenient',
                              'Automatic',
                              'Efficient',
                              'Cropped',
                              'Pixel-perfect',
                              'Minimalistic',
                              'AI-powered',
                              'Image-capture',
                              'App'
                            ].map(
                              (e) => Wrap(
                                spacing: 12.w,
                                runSpacing: 12.h,
                                children: [
                                  ChipWidget(
                                    onTap: () {},
                                    text: e,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                20.wi,
                SizedBox(
                  width: .2.sw,
                ),
              ],
            ),
            Container(
              width: .2.sw,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 12,
                    spreadRadius: 0,
                    offset: const Offset(-4, 0),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  16.hi,
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('menu'.svg),
                  ),
                  32.hi,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...["Camera", "Gallery", "Settings", "Help", "About"]
                            .map(
                          (e) => SizedBox(
                            height: .1.sh,
                            width: .2.sw,
                            child: Center(
                              child: RotatedWords(textInput: e),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  32.hi,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ChipWidget({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 6.w,
        ),
        decoration: BoxDecoration(
          border: isSelected
              ? null
              : Border.all(
                  color: AppColors.greyColor.shade600,
                ),
          borderRadius: BorderRadius.circular(8.r),
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              const Icon(
                Icons.check,
                size: 20,
              ),
              6.wi,
            ],
            Text(
              text,
              style: context.bodySmall.copyWith(
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? AppColors.whiteColor
                    : AppColors.primaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RotatedWords extends StatelessWidget {
  final String textInput;
  final Color? color;

  const RotatedWords({
    super.key,
    required this.textInput,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 4,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: textInput.length,
        itemBuilder: (context, index) {
          final char = textInput[index];
          return Transform.rotate(
            angle: 90 * math.pi / 180,
            child: Text(
              char,
              textAlign: TextAlign.center,
              style: context.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                height: .65,
                color: color ?? AppColors.greyColor.shade700,
              ),
            ),
          );
        },
      ),
    );
  }
}
