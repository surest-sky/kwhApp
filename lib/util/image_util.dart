import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class ImageUtil {
  static Future<String> imageSelect() async {
    String imagePath = "";
    final ImagePicker _picker = ImagePicker();
    final XFile? tempImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (tempImage != null) {
      imagePath = tempImage.path;
      var imageFile = File(imagePath);
      var imageBytes = await imageFile.readAsBytes();
      return base64Encode(imageBytes);
    }
    return "";
  }

  static Future<File?> imageSelectFile() async {
    String imagePath = "";
    final ImagePicker _picker = ImagePicker();
    final XFile? tempImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (tempImage != null) {
      imagePath = tempImage.path;
      return File(imagePath);
    }
  }
}
