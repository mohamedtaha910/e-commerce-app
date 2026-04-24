part of 'favourite_cubit.dart';

abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteSuccess extends FavouriteState {
  final List<Product> favourites;
  FavouriteSuccess(this.favourites);
}

class FavouriteError extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}
