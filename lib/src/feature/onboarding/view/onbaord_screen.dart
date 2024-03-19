// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:object_pix/src/data/service/local/hive_storage.dart';
import 'package:object_pix/src/shared/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/core.dart';
import '../../home/view/home_screen.dart';
import '../models/onboard.dart';

class OnboardScreen extends HookWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentIndex = useState(0);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: onboard.length,
              onPageChanged: (index) {
                currentIndex.value = index;
              },
              itemBuilder: (context, index) {
                final data = onboard[index];
                return Column(
                  children: [
                    SizedBox(
                      height: .5.sh,
                      width: double.infinity,
                      child: Column(
                        children: [
                          20.hi,
                          20.hi,
                          LayoutBuilder(builder: (context, constraints) {
                            if (constraints.maxWidth > 600) {
                              return Image.asset(
                                'onboard${data.image}'.png,
                                height: .35.sh,
                                width: .3.sw,
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Image.asset(
                                'onboard${data.image}'.png,
                                height: .35.sh,
                                width: .8.sw,
                                fit: BoxFit.cover,
                              );
                            }
                          })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            data.title,
                            style: context.headlineLarge,
                          ),
                          16.hi,
                          Text(
                            data.description,
                            textAlign: TextAlign.center,
                            style: context.bodyMedium.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryTextColor,
                            ),
                          ).padSymmetric(
                            horizontal: 16.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: .02.sh,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: SwapEffect(
                        dotColor: AppColors.primaryColor.withOpacity(0.5),
                        activeDotColor: AppColors.primaryColor,
                        dotHeight: 10,
                        dotWidth: 10,
                        strokeWidth: 3,
                        spacing: 8.0,
                      ),
                    ),
                    .05.sh.hi,
                    ElevatedButton(
                      onPressed: currentIndex.value == 2
                          ? () {
                              HiveService().save(AppConstants.onboard, true);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const HomeScreen();
                                  },
                                ),
                                (route) => false,
                              );
                            }
                          : () {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                      child: Text(
                        currentIndex.value == 2 ? 'Get Started' : 'Next',
                        style: context.bodyMedium.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}