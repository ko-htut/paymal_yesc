import 'package:admin/data/myprefs.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  String tem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae9e9),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/paymal_logo.png'),
                    ),
                    borderRadius: BorderRadius.circular(100)),
              ),
              SizedBox(
                child: Card(
                  child: Container(
                    width: 340,
                    height: (tem == '') ? 360 : 370,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white),
                    padding: const EdgeInsets.all(32),
                    child: Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Email',
                              style:
                                  _textStyle(18, fontWeight: FontWeight.bold),
                            ),
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            child: Text(
                              'Password',
                              style:
                                  _textStyle(18, fontWeight: FontWeight.bold),
                            ),
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  MyPrefs.setBool('loggedIn', true).then((value) {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen(),));
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Text('Log In'),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  TextStyle _textStyle(double size,
      {FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(fontWeight: fontWeight, fontSize: size);
  }
}
