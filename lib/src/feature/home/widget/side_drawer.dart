import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:object_pix/src/shared/utils/utils.dart';

import '../../../core/core.dart';
import '../controller/home_controller.dart';
import '../widget/widget.dart';

class SideDrawer extends HookConsumerWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.watch(homeProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        16.hi,
        IconButton(
          onPressed: () => ref.read(homeProvider.notifier).toggleSideDrawer =
              !homeController.toggleSideDrawer,
          icon: SvgPicture.asset('menu'.svg),
        ).padRight(16),
        32.hi,
        Expanded(
          child: homeController.toggleSideDrawer
              ? ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  children: [
                    ...((ref.watch(homeProvider).categoryList.modelCategories ??
                            [])
                        .map(
                      (e) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          ref.read(homeProvider.notifier).toggleSideDrawer =
                              !ref.read(homeProvider.notifier).toggleSideDrawer;
                          ref.read(homeProvider.notifier).selectedCategory = e;
                        },
                        title: Text(
                          e.name ?? '',
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.w500,
                            color: e == homeController.selectedCategory
                                ? AppColors.primaryColor
                                : AppColors.greyColor.shade600,
                          ),
                        ),
                      ),
                    )),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...(ref.watch(homeProvider).categoryList.modelCategories ??
                            [])
                        .map(
                      (e) => InkWell(
                        onTap: () {
                          ref.read(homeProvider.notifier).selectedCategory = e;
                        },
                        child: SizedBox(
                          height: .75.sh /
                              (homeController.categoryList.modelCategories ??
                                      [])
                                  .length,
                          width: .2.sw,
                          child: Center(
                            child: RotatedWords(
                              textInput: e.abbreviatedName ?? '',
                              isSelected: e == homeController.selectedCategory,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
