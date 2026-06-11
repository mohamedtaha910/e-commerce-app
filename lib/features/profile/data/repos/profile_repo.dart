import 'package:image_picker/image_picker.dart';

abstract class ProfileRepo {
  Future<void> addProfileImage(XFile image);
  Future<void> removeProfileImage();
}
