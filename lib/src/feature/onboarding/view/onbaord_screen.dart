// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:object_pix/src/data/service/local/hive_storage.dart';
import 'package:object_pix/src/shared/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/core.dart';
import '../../../data/model/model.dart';
import '../../home/view/home_screen.dart';

class OnboardScreen extends HookWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentIndex = useState(0);
    //TODO: use this for animation later
    final List<double> scrollPercentages = [
      0.0,
      0.0,
      0.0
    ]; // Assuming there are 3 pages

    void handleScroll() {
      for (int i = 0; i < scrollPercentages.length; i++) {
        double pageOffset = i * MediaQuery.of(context).size.width;
        double currentPageScroll = (pageController.offset - pageOffset) /
            MediaQuery.of(context).size.width;
        scrollPercentages[i] = currentPageScroll.clamp(0.0, 1.0);
        log(': ${scrollPercentages[i]}');
      }
    }

    // final scrollPercentage = useState(0.0);

    useEffect(() {
      pageController.addListener(handleScroll);
      return () {
        pageController.removeListener(handleScroll);
      };
    }, [
      pageController,
    ]);

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
                      height: .45.sh,
                      width: double.infinity,
                      child: Column(
                        children: [
                          20.hi,
                          LayoutBuilder(builder: (context, constraints) {
                            if (constraints.maxWidth > 600) {
                              return Image.asset(
                                'onboard${data.image}'.png,
                                height: .35.sh,
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Image.asset(
                                'onboard${data.image}'.png,
                                height: .35.sh,
                                fit: BoxFit.fill,
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
                            style: context.headlineLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          32.hi,
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
              bottom: .018.sh,
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
                        dotColor: AppColors.primaryColor.withOpacity(0.2),
                        activeDotColor: AppColors.primaryColor,
                        radius: 3.0,
                        dotHeight: 10,
                        dotWidth: 12,
                        strokeWidth: 3,
                        spacing: 8.0,
                      ),
                    ),
                    .03.sh.hi,
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
