import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:object_pix/src/core/core.dart';

import '../controller/home_controller.dart';
import '../widget/side_drawer.dart';
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
            Consumer(
              builder: (_, ref, __) {
                final homeController = ref.watch(homeProvider);
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: homeController.toggleSideDrawer ? .7.sw : .2.sw,
                  decoration: BoxDecoration(
                    color: homeController.toggleSideDrawer
                        ? AppColors.whiteColor.withOpacity(.95)
                        : AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 0,
                        offset: const Offset(-4, 0),
                      ),
                    ],
                  ),
                  child: const SideDrawer(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
