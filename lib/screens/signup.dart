import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup_signin/screens/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passCotroller = new TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(134, 231, 214, 0.8),
            Color.fromRGBO(83, 138, 214, 1),
          ]),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 150.0, left: 10, right: 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Enter User Name",
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
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Enter Email Id",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),

                  //hintText: "Enter Email Id",
                  prefixIcon: Icon(Icons.mail_outline),
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
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
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
              height: 50,
            ),
            FloatingActionButton.extended(
              label: const Text(
                "Sign Up",
                style: TextStyle(fontSize: 20),
              ),

              backgroundColor: Colors.blue[100],
              onPressed: () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passCotroller.text)
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                });
              },
              //child: c
            ),
          ],
        ),
      ),
    );
  }
}
