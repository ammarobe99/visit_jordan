import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:visit_jordan/Firebase_Services/firebase_auth.dart';
import 'package:visit_jordan/Screens/login_screen.dart';

import 'package:visit_jordan/homepage.dart';
import 'package:visit_jordan/utils/colors.dart';
import 'package:visit_jordan/utils/utils.dart';
import 'package:visit_jordan/widgets/textfieldinput.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
 bool _isObscure3 = true;
  bool visible = false;
  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _email.dispose();
  //   _password.dispose();
  //   _username.dispose();
  // }

  // void selectImage() async {
  //   Uint8List im = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = im;
  //   });
  // }

  // void signUpUser() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   String res = await AuthMethods().signUpUser(
  //     email: _email.text,
  //     password: _password.text,
  //     username: _username.text,
  //   );
  //   setState(() {
  //     _isLoading = false;
  //   });
  //   if (res != 'success') {
  //     showSnackBar(context, res);
  //   } else {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => const LogInScreen()),
  //     );
  //   }
  // }

  void NavigateToLogIn() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LogInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //image
              Container(
                height: 84,
                width: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/petra.png'),
                  ),
                ),
              ),
              //spacing
              const SizedBox(
                height: 24,
              ),

              const SizedBox(
                height: 24,
              ),
              //textfield for username
              TextFieldInput(
                  textEditingController: username,
                  hintText: "enter your username",
                  textInputType: TextInputType.text),
              //spacing
              const SizedBox(
                height: 24,
              ),

              //textField For email
              TextFieldInput(
                  textEditingController: email,
                  hintText: "enter your email",
                  textInputType: TextInputType.emailAddress),
              //spacing
              const SizedBox(
                height: 24,
              ),
              //textField For password
              TextFormField(
              
                controller: password,
                obscureText: _isObscure3,
                          decoration: InputDecoration(
                             enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                             contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                           focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                             hintText: "enter your password",
                            suffixIcon: IconButton(
                              
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                })),
               
               
              ),
              //spacing
              const SizedBox(
                height: 24,
              ),

              //spacing
              const SizedBox(
                height: 24,
              ),
              //sign up button
              InkWell(
                onTap: (() async {
                try {
                  var authopject = FirebaseAuth.instance;
                  UserCredential myUser =
                      await authopject.createUserWithEmailAndPassword(
                          email: email.text, password: password.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("added sucessfully")));
                 await FirebaseFirestore.instance
                      .collection('users').doc(myUser.user!.uid)
                      .set({"username": username.text,
                      "email":email.text,
                      "password":password.text});
                       Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return LogInScreen();
                  })));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("The Email Address Is Used ")));
                }
              }),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text("Sign up"),
                ),
              ),
              //spacing
              const SizedBox(
                height: 24,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      'already have an account ?',
                    ),
                  ),
                  GestureDetector(
                    onTap: NavigateToLogIn,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        ' Log in.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
