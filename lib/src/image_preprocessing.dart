import 'dart:typed_data';
import 'package:image/image.dart' as img;

class ImagePreprocessor {
  /// Convert image to grayscale
  img.Image toGrayscale(img.Image image) {
    return img.grayscale(image);
  }

  /// Resize the image for consistent processing
  img.Image resize(img.Image image, int width, int height) {
    return img.copyResize(image, width: width, height: height);
  }

  /// Apply binary thresholding to enhance text visibility
  img.Image applyThreshold(img.Image image, int threshold) {
    for (var y = 0; y < image.height; y++) {
      for (var x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        final brightness = img.getLuminance(pixel);
        final newColor = brightness > threshold ? 0xFFFFFFFF : 0xFF000000;
        image.setPixel(x, y, newColor as img.Color);
      }
    }
    return image;
  }

  Uint8List processImage(Uint8List inputImage) {
    final image = img.decodeImage(inputImage)!;
    final grayscaleImage = toGrayscale(image);
    final resizedImage = resize(grayscaleImage, 800, 600);
    return Uint8List.fromList(img.encodePng(applyThreshold(resizedImage, 128)));
  }
}
