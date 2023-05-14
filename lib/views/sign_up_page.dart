import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goethestudent/utils/reusable_widget.dart';
import 'package:goethestudent/views/dashboard_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _usernameTextController =TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _passWordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page"),backgroundColor: Colors.greenAccent,),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.teal
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20,MediaQuery.of(context).size.height*0.25,20,0),
            child: Column(
              children: [
                reusableTextField("Enter Username", Icons.person_outline, false, _usernameTextController),
                SizedBox(height: 20,),
                reusableTextField("Enter Email Address", Icons.email_outlined, false, _emailTextController),
                SizedBox(height: 20,),
                reusableTextField("Enter Password", Icons.lock_outline, false, _passWordController),
                SizedBox(height: 20,),
                SignInSignUpButton(context, false,(){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passWordController.text).then((value){
                    print("Created A New Account");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardPage()));
                  }).onError((error, stackTrace){print("Error: ${error}");});
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
