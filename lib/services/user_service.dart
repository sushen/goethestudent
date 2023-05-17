import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goethestudent/models/student_booked.dart';
import 'package:goethestudent/utils/show_snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  User? user;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Get.showSnackbar(const GetSnackBar(
            message:
                "You already have an account with this email. Use other login method.",
            duration: Duration(seconds: 3),
          ));
        } else if (e.code == 'invalid-credential') {
          Get.showSnackbar(const GetSnackBar(
            message: "Invalid Credential!",
            duration: Duration(seconds: 3),
          ));
        } else if (e.code == 'wrong-password') {
          Get.showSnackbar(const GetSnackBar(
            message: "Wrong password!",
            duration: Duration(seconds: 3),
          ));
        }
      } catch (e) {
        Get.showSnackbar(const GetSnackBar(
          message: "Unknown Error. Try again later",
          duration: Duration(seconds: 3),
        ));
      }
    }

    return user;
  }

  // Future<User?> signInWithFacebook() async {
  //   User? user;
  //   try {
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
  //     final OAuthCredential facebookCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //     final UserCredential userCredential =
  //         await auth.signInWithCredential(facebookCredential);
  //     user = userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     Get.showSnackbar(GetSnackBar(
  //       message: e.message,
  //       duration: const Duration(seconds: 3),
  //     ));
  //   }
  //   return user;
  // }

  Future<void> bookedStudentClass(
      StudentBookModel studentBookModel, BuildContext context) async {
    final userCollection = firebaseFirestore.collection("bookedclass");
    //final uid = auth.currentUser!.uid;

    int timestamp = DateTime.now().millisecondsSinceEpoch;
    final newUser = StudentBookModel(
            teacherName: studentBookModel.teacherName,
            rating: studentBookModel.rating,
            classList: studentBookModel.classList,
            userName: studentBookModel.userName,
            email: studentBookModel.email,
            uid: studentBookModel.uid,
            amount: studentBookModel.amount,
            bookedData: timestamp.toString(),
            paymentMethod: "Nagad")
        .toJson();

    userCollection.doc("uids").set(newUser).whenComplete(() {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      Navigator.of(context).pop();
      showSnackBar(context, "Successfully Booked");
    });
  }
}
