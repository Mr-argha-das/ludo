import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ludo/optpage/main.otp.dart';

class LudoPhonelogin {
  static Future sendOtp(context, {required String number, required String iscode, required Function callBack, required String mobileno}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '$iscode $number',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        callBack();
      },
      codeSent: (String verificationId, int? resendToken) {
       Navigator.push(context, CupertinoPageRoute(builder: (context) => MainOtpPage( verificationId: verificationId, mobileno: mobileno,)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  
  
}
