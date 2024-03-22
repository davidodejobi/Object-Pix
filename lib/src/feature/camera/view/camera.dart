import 'package:flutter/material.dart';

import '../../../data/model/camera/screen_params.dart';
import '../widget/detector_widget.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenParams.screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      key: GlobalKey(),
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const DetectorWidget(),
    );
  }
}
