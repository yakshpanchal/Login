// Define LoginCubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/src/Login/api.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> validateForm(String mobile, String password) async {
    if (password.isEmpty || mobile.isEmpty || mobile=='' || password == '') {
      emit(LoginErrorState('Mobile and Password cannot be empty'));
    }
    else if(password.isEmpty){
      emit(LoginErrorState('password cannot be empty'));
    }
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
      // emit(LoginValidState());
      final apicall = await API().getUserByMobile(mobile, password);

      try{
        if(apicall == 200){
          emit(LoginValidState());
        }
        else{
          emit(LoginErrorState('User not Exist'));
        }
      }catch(e){
        print('error!!!');
      }
    }
  }
}