import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/logic/cubit/app_cubit.dart';

import '../widgets/widgets.dart';

//ignore:must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    Future signup() async {
      debugPrint(email);
      BlocProvider.of<AppCubit>(context)
          .emailSignUp(email: email, pass: password, context: context);
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
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
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
                    text: 'Sign Up',
                    function: () {
                      signup();
                    }),
                const SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Already have an account ?', style: TextStyle(color: Colors.white),),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'signin');
                    },
                    child: const Text(
                      'Sign in',
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
