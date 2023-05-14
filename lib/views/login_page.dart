import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goethestudent/utils/reusable_widget.dart';
import 'package:goethestudent/views/dashboard_page.dart';
import 'package:goethestudent/views/sign_up_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _passwordTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Colors.teal
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20,MediaQuery.of(context).size.height*0.3, 20,0),
          child: Column(
            children: [
              SizedBox(height: 100,),
              reusableTextField("Enter Username", Icons.person_outline, false, _emailTextController),
              SizedBox(height: 20,),
              reusableTextField("Enter Password", Icons.lock_outline,true, _passwordTextController),
              SizedBox(height: 20,),
              SignInSignUpButton(context, true, (){
                FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>DashBoardPage()));
                }).onError((error, stackTrace) {print("Error: ${error}");});
              }),
              SignUpOption(),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                SignInWithGoogle();
              }, child: Text("Sign in with google"))
            ],
          ),
        ),
      ),
    ),
    );
  }
  SignInWithGoogle() async{
    GoogleSignInAccount? googleUser=await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;
    AuthCredential credential=GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken:googleAuth?.idToken
    );
    UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
    if(userCredential.user!=null){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DashBoardPage()));
    }
  }

  Row SignUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",style: TextStyle(color: Colors.white70)),
        GestureDetector(onTap:(){
          print("Login Successfully");
          Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUpScreen())).onError((error, stackTrace){
            print("Error: ${error}");
          });
        },
          child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)
      ],
    );
  }
}
