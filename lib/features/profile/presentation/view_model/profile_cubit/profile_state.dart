part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileSuccess extends ProfileState {
  final String imagePath;
  ProfileSuccess(this.imagePath);
}
class ProfileError extends ProfileState {}

