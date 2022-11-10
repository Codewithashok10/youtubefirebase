import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends GetxController {
  XFile? image;
  ImagePicker picker = ImagePicker();
  getImage() async {
    var i = await picker.pickImage(source: ImageSource.gallery);
    if (i != null) {
      image = i;
    }
  }
}
