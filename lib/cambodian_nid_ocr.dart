library cambodian_nid_ocr;

import 'dart:typed_data';

import 'src/image_preprocessing.dart';
import 'src/ocr_engine.dart';
import 'src/text_parser.dart';

class CambodianNidOcr {
  final _preprocessor = ImagePreprocessor();
  final _ocrEngine = OcrEngine();
  final _textParser = TextParser();

  Future<Map<String, String>> extractIdDetails(Uint8List imageBytes) async {
    final processedImage = _preprocessor.processImage(imageBytes);
    final rawText = _ocrEngine.recognizeText(processedImage);
    return _textParser.parseIdDetails(rawText);
  }
}
