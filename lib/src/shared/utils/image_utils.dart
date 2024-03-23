import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:exif/exif.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image/image.dart' as image_lib;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<image_lib.Image?> convertCameraImageToImage(
    CameraImage cameraImage) async {
  image_lib.Image image;

  if (cameraImage.format.group == ImageFormatGroup.yuv420) {
    image = convertYUV420ToImage(cameraImage);
  } else if (cameraImage.format.group == ImageFormatGroup.bgra8888) {
    image = convertBGRA8888ToImage(cameraImage);
  } else if (cameraImage.format.group == ImageFormatGroup.jpeg) {
    image = convertJPEGToImage(cameraImage);
  } else if (cameraImage.format.group == ImageFormatGroup.nv21) {
    image = convertNV21ToImage(cameraImage);
  } else {
    return null;
  }

  return image;
}

image_lib.Image convertYUV420ToImage(CameraImage cameraImage) {
  final width = cameraImage.width;
  final height = cameraImage.height;

  final uvRowStride = cameraImage.planes[1].bytesPerRow;
  final uvPixelStride = cameraImage.planes[1].bytesPerPixel!;

  final yPlane = cameraImage.planes[0].bytes;
  final uPlane = cameraImage.planes[1].bytes;
  final vPlane = cameraImage.planes[2].bytes;

  final image = image_lib.Image(width: width, height: height);

  var uvIndex = 0;

  for (var y = 0; y < height; y++) {
    var pY = y * width;
    var pUV = uvIndex;

    for (var x = 0; x < width; x++) {
      final yValue = yPlane[pY];
      final uValue = uPlane[pUV];
      final vValue = vPlane[pUV];

      final r = yValue + 1.402 * (vValue - 128);
      final g = yValue - 0.344136 * (uValue - 128) - 0.714136 * (vValue - 128);
      final b = yValue + 1.772 * (uValue - 128);

      image.setPixelRgba(x, y, r.toInt(), g.toInt(), b.toInt(), 255);

      pY++;
      if (x % 2 == 1 && uvPixelStride == 2) {
        pUV += uvPixelStride;
      } else if (x % 2 == 1 && uvPixelStride == 1) {
        pUV++;
      }
    }

    if (y % 2 == 1) {
      uvIndex += uvRowStride;
    }
  }
  return image;
}

image_lib.Image convertBGRA8888ToImage(CameraImage cameraImage) {
  // Extract the bytes from the CameraImage
  final bytes = cameraImage.planes[0].bytes;

  // Create a new Image instance
  final image = image_lib.Image.fromBytes(
    width: cameraImage.width,
    height: cameraImage.height,
    bytes: bytes.buffer,
    order: image_lib.ChannelOrder.rgba,
  );

  return image;
}

image_lib.Image convertJPEGToImage(CameraImage cameraImage) {
  // Extract the bytes from the CameraImage
  final bytes = cameraImage.planes[0].bytes;

  // Create a new Image instance from the JPEG bytes
  final image = image_lib.decodeImage(bytes);

  return image!;
}

image_lib.Image convertNV21ToImage(CameraImage cameraImage) {
  // Extract the bytes from the CameraImage
  final yuvBytes = cameraImage.planes[0].bytes;
  final vuBytes = cameraImage.planes[1].bytes;

  // Create a new Image instance
  final image = image_lib.Image(
    width: cameraImage.width,
    height: cameraImage.height,
  );

  // Convert NV21 to RGB
  convertNV21ToRGB(
    yuvBytes,
    vuBytes,
    cameraImage.width,
    cameraImage.height,
    image,
  );

  return image;
}

void convertNV21ToRGB(Uint8List yuvBytes, Uint8List vuBytes, int width,
    int height, image_lib.Image image) {
  // Conversion logic from NV21 to RGB
  // ...

  // Example conversion logic using the `imageLib` package
  // This is just a placeholder and may not be the most efficient method
  for (var y = 0; y < height; y++) {
    for (var x = 0; x < width; x++) {
      final yIndex = y * width + x;
      final uvIndex = (y ~/ 2) * (width ~/ 2) + (x ~/ 2);

      final yValue = yuvBytes[yIndex];
      final uValue = vuBytes[uvIndex * 2];
      final vValue = vuBytes[uvIndex * 2 + 1];

      // Convert YUV to RGB
      final r = yValue + 1.402 * (vValue - 128);
      final g = yValue - 0.344136 * (uValue - 128) - 0.714136 * (vValue - 128);
      final b = yValue + 1.772 * (uValue - 128);

      // Set the RGB pixel values in the Image instance
      image.setPixelRgba(x, y, r.toInt(), g.toInt(), b.toInt(), 255);
    }
  }
}

/// ROTATION changes - not working as need to be from the Exif (which is empty)

Future<int> getExifRotation(CameraImage cameraImage) async {
  final exifData = await readExifFromBytes(cameraImage.planes[0].bytes);
  final ifd = exifData['Image Orientation'];

  if (ifd != null) {
    return ifd.values.toList()[0];
  }
  return 1;
}

image_lib.Image applyExifRotation(image_lib.Image image, int exifRotation) {
  if (exifRotation == 1) {
    return image_lib.copyRotate(image, angle: 0);
  } else if (exifRotation == 3) {
    return image_lib.copyRotate(image, angle: 180);
  } else if (exifRotation == 6) {
    return image_lib.copyRotate(image, angle: 90);
  } else if (exifRotation == 8) {
    return image_lib.copyRotate(image, angle: 270);
  }

  return image;
}

// Future<void> saveImage(
//   image_lib.Image image,
//   String name,
// ) async {
//   Uint8List bytes = image_lib.encodeJpg(image);

//   // Request permission to write to external storage
//   if (!Platform.isIOS) {
//     var status = await Permission.storage.request();
//     if (status != PermissionStatus.granted) {
//       debugPrint('Permission denied');
//       return;
//     }
//   }

//   // Get the external storage directory
//   Directory? externalDir = await getExternalStorageDirectory();
//   if (externalDir == null) {
//     debugPrint('External storage directory not available');
//     return;
//   }

//   // Create a directory named 'images' in the external storage directory
//   String directoryPath = '${externalDir.path}/images';
//   Directory directory = Directory(directoryPath);
//   if (!await directory.exists()) {
//     await directory.create(recursive: true);
//   }

//   // Create the file path
//   String filePath = '$directoryPath/$name.jpg';

//   // Write the bytes to the file
//   File fileOnDevice = File(filePath);
//   await fileOnDevice.writeAsBytes(bytes, flush: true);

//   // Check if the file exists after saving
//   bool exists = await fileOnDevice.exists();
//   if (exists) {
//     debugPrint('Image saved successfully at: $filePath');

//     // Use Flutter File Dialog to show a file save dialog
//     try {
//       final params = SaveFileDialogParams(sourceFilePath: fileOnDevice.path);
//       final finalPath = await FlutterFileDialog.saveFile(params: params);
//       if (finalPath != null) {
//         debugPrint('File saved at: $finalPath');
//       } else {
//         debugPrint('File save cancelled');
//       }
//     } catch (e) {
//       debugPrint('Error saving file: $e');
//     }
//   } else {
//     debugPrint('Failed to save image!');
//   }
// }

Future<void> saveImage(XFile capturedImage, String name) async {
  // Read the captured image file
  File capturedFile = File(capturedImage.path);

  // Request permission to write to external storage
  if (!Platform.isIOS) {
    var status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      debugPrint('Permission denied');
      return;
    }
  }

  // Get the external storage directory
  Directory? externalDir = await getExternalStorageDirectory();
  if (externalDir == null) {
    debugPrint('External storage directory not available');
    return;
  }

  // Create a directory named 'images' in the external storage directory
  String directoryPath = '${externalDir.path}/images';
  Directory directory = Directory(directoryPath);
  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }

  // Create the file path
  String filePath = '$directoryPath/$name.jpg';

  // Copy the captured image file to the desired location
  await capturedFile.copy(filePath);

  // Check if the file exists after saving
  bool exists = File(filePath).existsSync();
  if (exists) {
    debugPrint('Image saved successfully at: $filePath');

    // Use Flutter File Dialog to show a file save dialog
    try {
      final params = SaveFileDialogParams(sourceFilePath: filePath);
      final finalPath = await FlutterFileDialog.saveFile(params: params);
      if (finalPath != null) {
        debugPrint('File saved at: $finalPath');
      } else {
        debugPrint('File save cancelled');
      }
    } catch (e) {
      debugPrint('Error saving file: $e');
    }
  } else {
    debugPrint('Failed to save image!');
  }
}

double calculateZoomLevel(double left) {
  final screenWidth = 1.sw;
  // Calculate the distance of the image from the center of the screen
  double distanceFromCenter = (left - screenWidth / 2).abs();

  // Normalize the distance to a value between 0 and 1
  double normalizedDistance = min(distanceFromCenter / (screenWidth / 2), 1.0);

  // Scale the normalized distance to the desired zoom range (e.g., 0.5 to 2.0)
  double zoomLevel = 0.5 + (normalizedDistance * 1.5);

  return zoomLevel;
}
