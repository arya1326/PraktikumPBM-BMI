import 'package:flutter/material.dart';
import 'package:latihan/login_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final usernameControl = TextEditingController();
  final passwordControl = TextEditingController();
  
  var username;
  
  var password;
  // String username = "";
  // String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            ),
            const SizedBox(
                height: 30,
              ),
              /*username*/ SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: usernameControl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Buat Username !";
                    } else {
                      return null;
                    }
                  },
                    // obscureText: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    prefixIcon: const Icon(
                      Icons.person,
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
                    return "Buat Password Dahulu Beb";
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
              // /*login*/ Container(
              //   decoration: BoxDecoration(
              //     color: const Color.fromRGBO(0, 191, 255, .9),
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   height: 50,
              //   width: double.infinity,
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    username != null;
                    password != null;
                    // Navigate to Login Page
                    Navigator.of(context).pushNamed(LoginScreen.nameRoute,
                      // arguments: {'username': username, 'password': password},
                    );
                  }
                  },
                  child: const Text(
                    'Register',
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
            ],
      ),
    ),
    )
    );
  }
}