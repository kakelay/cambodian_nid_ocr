import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cambodian_nid_ocr/cambodian_nid_ocr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OcrExample(),
    );
  }
}

class OcrExample extends StatelessWidget {
  final CambodianNidOcr ocr = CambodianNidOcr();

  void pickAndProcessImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageBytes = await pickedImage.readAsBytes();
      final result = await ocr.extractIdDetails(imageBytes);

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text('ID Details: $result'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cambodian NID OCR')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => pickAndProcessImage(context),
          child: Text('Pick and Process Image'),
        ),
      ),
    );
  }
}
