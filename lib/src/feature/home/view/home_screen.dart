import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:object_pix/src/shared/utils/utils.dart';

import '../controller/home_controller.dart';
import '../widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            const ModelDisplayWidget(),
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
                    child: Consumer(
                      builder: (_, ref, __) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...(ref
                                        .watch(homeProvider)
                                        .categoryList
                                        .modelCategories ??
                                    [])
                                .map(
                              (e) => InkWell(
                                onTap: () {
                                  ref
                                      .read(homeProvider.notifier)
                                      .selectedCategory = e;
                                },
                                child: SizedBox(
                                  height: .75.sh /
                                      (ref
                                                  .watch(homeProvider)
                                                  .categoryList
                                                  .modelCategories ??
                                              [])
                                          .length,
                                  width: .2.sw,
                                  child: Center(
                                    child: RotatedWords(
                                      textInput: e.abbreviatedName ?? '',
                                      isSelected: e ==
                                          ref
                                              .watch(homeProvider)
                                              .selectedCategory,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
