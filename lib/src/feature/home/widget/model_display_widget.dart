import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:object_pix/src/shared/utils/utils.dart';

import '../../camera/view/camera.dart';
import '../controller/home_controller.dart';
import 'chip_widget.dart';

class ModelDisplayWidget extends HookConsumerWidget {
  const ModelDisplayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.watch(homeProvider);
    return Row(
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
                  homeController.selectedCategory.name ?? '',
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
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        homeController.selectedCategory.image ?? '',
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
                          ((homeController.categoryList.modelCategories!
                                      .indexOf(
                                          homeController.selectedCategory) +
                                  1)
                              .toString()
                              .padLeft(2, '0')),
                          style: context.displayLarge.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        12.hi,
                        Text(
                          homeController.selectedCategory.description ?? '',
                          style: context.labelMedium.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ).padRight(8),
                      ],
                    ),
                  ),
                ),
                24.hi,
                Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: [
                    ...(homeController.selectedCategory.subCategories ?? [])
                        .map(
                      (e) => Wrap(
                        spacing: 12.w,
                        runSpacing: 12.h,
                        children: [
                          ChipWidget(
                            onTap: () {
                              homeController.selectCategory(e);
                              context.push(const CameraScreen(), context);
                            },
                            text: e.name ?? '',
                            isSelected: e == homeController.selectedSubCategory,
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
    );
  }
}
