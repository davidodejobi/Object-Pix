import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:object_pix/src/core/core.dart';
import 'package:object_pix/src/shared/utils/utils.dart';

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
