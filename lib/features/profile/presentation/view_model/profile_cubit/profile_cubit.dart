// import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  String? imagePath = '';

  void loadProfileImage() async {
    emit(ProfileLoading());
    imagePath = await profileRepo.fetchProfileImage();
    emit(ProfileSuccess(imagePath!));
  }

  void addProfileImage(XFile image) async {
    emit(ProfileLoading());
    imagePath = image.path;
    await profileRepo.addProfileImage(image);
    loadProfileImage();
    emit(ProfileSuccess(image.path));
  }

  void removeProfileImage() async {
    emit(ProfileLoading());
    await profileRepo.removeProfileImage();
    imagePath = '';
    emit(ProfileSuccess(imagePath!));
  }
}
