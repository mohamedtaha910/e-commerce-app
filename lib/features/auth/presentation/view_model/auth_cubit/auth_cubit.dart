// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // ---------------------------- Register Function --------------------------------
  Future<void> registerUser({
		required String email,
		required String password,
	}) async {
		emit(RegisterLoadingState());
		var auth = FirebaseAuth.instance;
		try {
			UserCredential user = await auth.createUserWithEmailAndPassword(
				email: email,
				password: password,
			);
			emit(RegisterSuccessState());
		} on FirebaseAuthException catch (e) {
			if(e.code == 'email-already-in-use') {
				emit(RegisterErrorState(
					'The account already exists for that email.')
				);
			}else if(e.code == 'weak-password') {
				emit(RegisterErrorState(
					'The password provided is too weak.')
				);
			}else{
				emit(RegisterErrorState('something went wrong'));
			} 
		}catch (e) {
			emit(RegisterErrorState('There was an error'));
		}
	}
		
	// ---------------------------- Login Function --------------------------------
		
	Future<void> loginUser({
		required String email,
		required String password,
	}) async {
		emit(LoginLoadingState());
		var auth = FirebaseAuth.instance;
		try {
			UserCredential user = await auth.signInWithEmailAndPassword(
				email: email,
				password: password,
			);
			emit(LoginSuccessState());
		}on FirebaseAuthException catch (e) {
			if (e.code == 'user-not-found') {
				emit(LoginErrorState('No user found for that email.'));
			} else if (e.code == 'wrong-password') {
				emit(LoginErrorState(
					'Wrong password provided for that user.')
				);
			}else{
				emit(LoginErrorState('The email or password is incorrect'));
			}
		}
		catch (e) {
			emit(LoginErrorState('something went wrong'));
		}
	}
}

