import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/logic/cubit/app_cubit.dart';

import '../widgets/widgets.dart';

//Sign in page
//ignore: must_be_immutable
class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    Future signin() async {
      BlocProvider.of<AppCubit>(context)
          .emailSignIn(email: email, pass: password, context: context);
      Navigator.pushReplacementNamed(context, 'home');
    }

    return Scaffold(
      backgroundColor: Color(0xFF252525),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: mytextFieldDecoration.copyWith(
                      hintText: 'Enter Your Email'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: mytextFieldDecoration.copyWith(
                      hintText: 'Enter Your Password'),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                MaterialButtonWidget(
                    color: Colors.deepOrangeAccent,
                    text: 'Log In',
                    function: () {
                      signin();
                    }),
                const SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Not Signed up yet ?', style: TextStyle(color: Colors.white),),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'signup');
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
