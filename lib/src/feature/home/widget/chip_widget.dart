import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:object_pix/src/core/core.dart';
import 'package:object_pix/src/shared/utils/utils.dart';

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
  final bool isSelected;

  const RotatedWords({
    super.key,
    required this.textInput,
    this.isSelected = false,
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
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.greyColor.shade700,
              ),
            ),
          );
        },
      ),
    );
  }
}
