import 'package:e_commerce_app/features/profile/data/repos/profile_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepoImplementation implements ProfileRepo {
  final FirebaseAuth auth;
  ProfileRepoImplementation({required this.auth});

  Future<Box<dynamic>> _openBox() async {
    final user = auth.currentUser;

    if (user == null) {
      throw Exception('User not logged in');
    }
    final uid = user.uid;

    return await Hive.openBox<dynamic>('Profile_$uid');
  }

  @override
  Future<void> addProfileImage(XFile image) async {
    final box = await _openBox();

    box.put('profile_image', image.path);
  }

  @override
  Future<void> removeProfileImage() async {
    final box = await _openBox();
    box.clear();
  }

  @override
  Future<String> fetchProfileImage() async {
    final box = await _openBox();
    return box.values.toList().first;
  }
}
