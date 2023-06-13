import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/home_screen.dart';

import 'package:shop_app/screens/login/login_cubit/login_cubit.dart';

import 'package:shop_app/screens/register/register_screen.dart';
import 'package:shop_app/shared/components/function.dart';
import 'package:shop_app/shared/components/materials.dart';
import 'package:shop_app/shared/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_cubit/states.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, ShopLoginStates>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/image/login.png',
                          width: 350, height: 250),
                      const Text(
                        'Welcome back ,',
                        style: TextStyle(color: mainColor, fontSize: 25),
                      ),
                      Text(
                        'Login to continue',
                        style: TextStyle(color: mainColor, fontSize: 25),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defTextFormField(
                          controller: emailController,
                          textType: TextInputType.emailAddress,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          label: 'Email',
                          prefix: Icons.email_outlined),
                      defTextFormField(
                        onPressedsuffix: () {
                          LoginCubit.get(context).seePassword();
                        },
                        controller: passwordController,
                        isPassword: LoginCubit.get(context).seePasword,
                        textType: TextInputType.visiblePassword,
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        label: 'Password',
                        prefix: Icons.lock_outline,
                        suffix: LoginCubit.get(context).suffix,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          defaultButton(
                              onPressed: (() {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              }),
                              text: 'LOG IN',
                              color: Colors.white),
                          SizedBox(
                            height: 20,
                          ),
                          registerAsk(
                              context: context,
                              color: mainColor,
                              widget: RegisterScreen()), //wait for build
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, Object? state) {
          if (state is LoginSuccessState) {
            navigateAndFinish(context, HomeScreen());
          }
        },
      ),
    );
  }
}