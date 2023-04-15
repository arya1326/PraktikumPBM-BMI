import 'package:flutter/material.dart';
import 'package:latihan/home_screen.dart';
import 'package:latihan/signup_screen.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({Key? key}) : super(key: key);
  static const nameRoute = "/login";

  final _formKey = GlobalKey<FormState>();
  final usernameControl = TextEditingController();
  final passwordControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args;
        // ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String username= 'username';
    // ignore: prefer_const_declarations
    final String password = 'password';
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
             Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b)
          ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 191, 255, .9),
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Welcome back!',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 191, 255, .9),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              /*email*/ SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: usernameControl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a valid username!";
                    } else {
                      return null;
                    }
                    },
                    // obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /*password*/ SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: passwordControl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a valid password!";
                    } else {
                    return null;
                    }
                    },
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: const Icon(
                      Icons.remove_red_eye,
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    if (username != null &&
                    password != null) {
                    Navigator.of(context).pushNamed(HomeScreen.nameRoute,
                      arguments: usernameControl.text);
                  } else {
                    _formKey.currentState!.validate();
                  }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              // ),

              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    child: const Text('Sign up'),
                    onPressed: () {
                      /// to add a Signup Screen
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen())
                      );
                        },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}