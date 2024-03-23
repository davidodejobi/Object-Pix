import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:object_pix/src/shared/utils/image_utils.dart';
import 'package:object_pix/src/shared/utils/utils.dart';

import '../../../data/model/camera/recognition.dart';
import '../../../data/model/camera/screen_params.dart';
import '../../home/controller/home_controller.dart';
import '../service/detector_service.dart';
import 'box_widget.dart';

// class DetectorWidget extends StatefulHookConsumerWidget {
//   const DetectorWidget({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _DetectorWidgetState();
// }
// class _DetectorWidgetState extends ConsumerState<DetectorWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
/// [DetectorWidget] sends each frame for inference
class DetectorWidget extends StatefulHookConsumerWidget {
  /// Constructor
  const DetectorWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetectorWidgetState();
  // State<DetectorWidget> createState() => _DetectorWidgetState();
}

class _DetectorWidgetState extends ConsumerState<DetectorWidget>
    with WidgetsBindingObserver {
  /// List of available cameras
  late List<CameraDescription> cameras;

  /// Controller
  CameraController? _cameraController;

  // use only when initialized, so - not null
  get _controller => _cameraController;

  /// Object Detector is running on a background [Isolate]. This is nullable
  /// because acquiring a [Detector] is an asynchronous operation. This
  /// value is `null` until the detector is initialized.
  Detector? _detector;
  StreamSubscription? _subscription;

  /// Results to draw bounding boxes
  List<Recognition>? results;

  /// Realtime stats
  Map<String, String>? stats;

  ///image found boolean
  bool _imageFound = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initStateAsync();
  }

  void _initStateAsync() async {
    // initialize preview and CameraImage stream
    _initializeCamera();
    // Spawn a new isolate
    Detector.start().then((instance) {
      setState(() {
        _detector = instance;
        _subscription = instance.resultsStream.stream.listen((values) {
          setState(() {
            results = values['recognitions'];
            stats = values['stats'];
          });
        });
      });
    });
  }

  /// Initializes the camera by setting [_cameraController]
  void _initializeCamera() async {
    cameras = await availableCameras();
    // cameras[0] for back-camera
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
      enableAudio: false,
    )..initialize().then((_) async {
        await _controller.startImageStream(onLatestImageAvailable);
        setState(() {});

        /// previewSize is size of each image frame captured by controller
        ///
        /// 352x288 on iOS, 240p (320x240) on Android with ResolutionPreset.low
        ScreenParams.previewSize = _controller.value.previewSize!;
      });
  }

  @override
  Widget build(BuildContext context) {
    // Return empty container while the camera is not initialized
    if (_cameraController == null || !_controller.value.isInitialized) {
      return const SizedBox.shrink();
    }

    var aspect = 1 / _controller.value.aspectRatio;

    return Stack(
      children: [
        AspectRatio(
          aspectRatio: aspect,
          child: CameraPreview(
            _controller,
          ),
        ),
        AspectRatio(
          aspectRatio: aspect,
          child: _boundingBoxes(),
        ),
      ],
    );
  }

  Future<XFile?> _captureImage() async {
    try {
      // Capture the image
      XFile? capturedImage;
      if (_cameraController != null) {
        capturedImage = await _cameraController!.takePicture();
      }

      // Check if image capture was successful
      return capturedImage;
    } catch (e) {
      log('Error capturing image: $e');
    }

    return null; // Return null if image capture fails
  }

  /// Returns Stack of bounding boxes
  Widget _boundingBoxes() {
    setState(() {
      _imageFound = false;
    });
    if (results == null) {
      return const SizedBox.shrink();
    }

    String objectName = ref.watch(homeProvider).selectedSubCategory.name ?? '-';

    Recognition? actualResult;

    for (var result in results!) {
      if (result.label == ref.watch(homeProvider).selectedSubCategory.name) {
        actualResult = result;
        if (_cameraController != null) {
          _cameraController!.setFocusMode(FocusMode.auto);
          //check the location (Rect) of the image compared to the phone screen size. If it's big enough, don't zoom but if it's far zoom
          _cameraController!
              .setZoomLevel(calculateZoomLevel(result.renderLocation.left / 2));
          setState(() {
            _imageFound = true;
          });
          Future.delayed(const Duration(milliseconds: 2000), () {
            _captureImage().then((value) {
              if (value != null) {
                saveImage(
                  value,
                  objectName + DateTime.now().toIso8601String(),
                );
              }
            });
          });
        }
      }
    }
    return actualResult == null
        ? const SizedBox.shrink()
        : Stack(
            children: [
              BoxWidget(result: actualResult),
              if (_imageFound)
                Lottie.asset(
                  'countdown'.json,
                )
            ],
          );
  }

  /// Callback to receive each frame [CameraImage] perform inference on it
  void onLatestImageAvailable(CameraImage cameraImage) async {
    _detector?.processFrame(cameraImage);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        _cameraController?.stopImageStream();
        _detector?.stop();
        _subscription?.cancel();
        break;
      case AppLifecycleState.resumed:
        _initStateAsync();
        break;
      default:
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cameraController?.dispose();
    _detector?.stop();
    _subscription?.cancel();
    super.dispose();
  }
}
