// Define LoginCubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/src/Login/api.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> validateForm(String mobile, device_id) async {

    if (mobile.isEmpty || mobile=='' ) {
      emit(LoginErrorState('Mobile and Password cannot be empty'));
    }
    // else if(password.isEmpty){
    //   emit(LoginErrorState('password cannot be empty'));
    // }
    else if(mobile.isEmpty){
      emit(LoginErrorState('Mobile number cannot be empty'));
    }
    else if(!RegExp(r'^\d{10}$').hasMatch(mobile)){
      emit(LoginErrorState('Invalid mobile number'));
    }
    // else if(!RegExp(r'^\d{6}$').hasMatch(password)){
    //   emit(LoginErrorState('Password must be at least 6 character'));
    // }
    else{
      final statusCode = await API().getUserByMobile(mobile, device_id);
      try{
        if (statusCode == null) {
          emit(LoginErrorState('An error occurred. Please try again.'));
        } else if (statusCode == 200) {
          emit(LoginValidState());
        } else {
          emit(LoginErrorState('User not Exist')); // Or interpret other codes accordingly
        }
      }catch(e){
        print('error!!!');
      }
      final response = await API().getUserByMobile(mobile, device_id);

      if (response == null) {
        emit(LoginErrorState('An error occurred. Please try again.'));
      } else {
        // Check for existence based on response data structure
        if (response['exists'] == true || response['data'] != null) {
          emit(LoginValidState());
        } else {
          emit(LoginErrorState('User not Exist'));
        }
      }
    }
  }
}
