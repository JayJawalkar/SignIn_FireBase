import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signup_signin/screens/home.dart';
import 'package:signup_signin/screens/signup.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passCotroller = new TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(83, 138, 214, 1),
              Color.fromRGBO(134, 231, 214, 0.8)
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 140),
                child: const Icon(
                  Icons.data_thresholding,
                  size: 160,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Enter Email id",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),

                    //hintText: "Enter Email Id",
                    prefixIcon: Icon(Icons.person_outline_sharp),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(27.0),
                      ),
                      borderSide: BorderSide(width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(27.0),
                      ),
                      borderSide: BorderSide(width: 3.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  controller: _passCotroller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    labelText: "Enter Password",
                    labelStyle:
                        const TextStyle(fontSize: 20, color: Colors.black),

                    //hintText: "Enter Email Id",
                    prefixIcon: const Icon(Icons.lock_outline),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(27.0),
                      ),
                      borderSide: BorderSide(width: 3.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(27.0),
                      ),
                      borderSide: BorderSide(width: 3.0),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isObscure,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              FloatingActionButton.extended(
                label: const Text(
                  "Log In",
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.blue[100],
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passCotroller.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  }).onError(
                    (error, stackTrace) {
                      Fluttertoast.showToast(
                          msg: "Incorrect UserName or Password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                  );
                },

                //child: c
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
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
