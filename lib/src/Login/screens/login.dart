import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Widget/CustomElevatedButton.dart';
import '../../Widget/CustomText.dart';
import '../../Widget/CustomTextField.dart';
import '../Cubit/login_cubit.dart';
import '../Cubit/login_state.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => LoginCubit(),
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          text: 'Login / Signup',
                          textcolor: Colors.black,
                          textsize: 20,
                          fontweight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormFiled(
                        labelText: 'Mobile',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: _mobileController,
                        enabled: true,
                        keyboardType: TextInputType.phone,
                        obscureText: false,
                        // Set obscureText to true for password
                        onChanged: (value) {
                          // Perform validation here if needed
                          BlocProvider.of<LoginCubit>(context).validateForm(_mobileController.text, _passwordController.text);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormFiled(
                        labelText: 'Password',
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        controller: _passwordController,
                        enabled: true,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        // Set obscureText to true for password
                        onChanged: (value) {
                          // Perform validation here if needed
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          if (state is LoginErrorState) {
                            return Text(
                              state.errorMessage,
                              style: TextStyle(color: Colors.red),
                            );
                          }
                          return Container();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return CustomElevetedButton(
                            buttonText: 'Submit',
                            backgroundColor: Colors.indigo,
                            textColor: Colors.white,
                            elevation: 4,
                            borderRadius: 3,
                            onPressed: () {
                              final mobile = _mobileController.text;
                              final password = _passwordController.text;
                              context
                                  .read<LoginCubit>()
                                  .validateForm(mobile, password);
                            },
                            buttonWidth: 400,
                            buttonHeight: 50,
                            buttontextSize: 16,
                          );
                        },
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          if (state is LoginValidState) {
                            return Text(
                              'User Exist',
                              style: TextStyle(color: Colors.green),
                            );
                          }
                          else if(state is LoginErrorState){
                            return Text(
                              'User Not Exist',
                              style: TextStyle(color: Colors.red),
                            );
                          }
                          else{
                            return Container();
                          }

                        },
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
