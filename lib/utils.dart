import 'package:image_picker/image_picker.dart';

Future<List<int>?> pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? file = await _imagePicker.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  } else {
    print('No image selected');
    return null;
  }
}
