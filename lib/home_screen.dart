import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const nameRoute = "/home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final heightBodyControl = TextEditingController();
  final weightBodyControl = TextEditingController();
  double heightBody = 0;
  double weightBody = 0;
  // ignore: non_constant_identifier_names
  double BMI = 0;
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments as String;
    final String username = args;
    return Scaffold(
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
      child: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Text(username),
                BMI == 0 ? const Text("Score BMI") : Text(BMI.toString()),
                TextFormField(
                  controller: heightBodyControl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "data not null";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.brown.shade100,
                      filled: true,
                      hintText: "Tinggi Badan"),
                ),
                TextFormField(
                  controller: weightBodyControl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "data not null";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.brown.shade100,
                      filled: true,
                      hintText: "Berat Badan"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        weightBody = double.parse(weightBodyControl.text);
                        heightBody = double.parse(heightBodyControl.text);
                        heightBody = heightBody / 100;
                        setState(() {
                          BMI = (weightBody) / (heightBody * heightBody);
                        });
                      }
                    },
                    child: const Text("Hitung")),
              ],
            ),
          )
        ],
      ),
    ),
    );

  }
}