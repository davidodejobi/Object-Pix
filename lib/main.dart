import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/core/core.dart';
import 'src/feature/onboarding/view/onbaord_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Animate.restartOnHotReload = true;
  await Hive.initFlutter();
  await Hive.openBox<dynamic>(AppConstants.user);

  runApp(const ProviderScope(
    child: ObjectPixApp(),
  ));
}

class ObjectPixApp extends StatelessWidget {
  const ObjectPixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Object Pix',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(material3: false),
          home: const OnboardScreen(),
          routes: const {},
        );
      },
    );
  }
}
