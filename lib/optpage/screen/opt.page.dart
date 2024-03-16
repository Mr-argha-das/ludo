import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ludo/conf/env.dart';
import 'package:ludo/homepage/main.home.dart';
import 'package:ludo/mainpage/model/login.model.dart';
import 'package:ludo/mainpage/model/signup.model.dart';
import 'package:ludo/mainpage/service/api.login.service.dart';
import 'package:ludo/mainpage/service/login.api.service.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OptPage extends StatefulWidget {
  final String verificationId;
  final String mobileno;
  const OptPage(
      {super.key, required this.verificationId, required this.mobileno});

  @override
  State<OptPage> createState() => _OptPageState();
}

class _OptPageState extends State<OptPage> {
  final _otpController = TextEditingController();
  bool wrongotp = false;
  bool lodar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.blue.shade800,
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(MyTheme.backgroundimage))),
      child: lodar
          ? Center(
              child:
                  LoadingAnimationWidget.inkDrop(color: Colors.white, size: 25),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Verify OTP",
                      style: GoogleFonts.aboreto(
                          color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "OTP Sent",
                      style: GoogleFonts.aboreto(
                          color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                
                    Image.asset("assets/logo.png"),
                    const SizedBox(
                      height: 40,
                    ),
                    const Expanded(child: SizedBox()),
                    Expanded( 
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _otpController,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text(
                              "Enter OTP",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    color: Colors.orange.shade800, width: 3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    color: Colors.orange.shade800, width: 3)),
                          ),
                        ),
                      ),
                    ),
                  
                wrongotp
                    ? Text(
                        "OTP not matched",
                        style: GoogleFonts.montserrat(
                            color: Colors.red, fontSize: 18),
                      )
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: GestureDetector(
                    onTap: () async {
                      // setState(() {
                      //   wrongotp = true;
                      //   lodar = true;
                      // });
                      // try {
                      //   PhoneAuthCredential credential =
                      //       await PhoneAuthProvider.credential(
                      //           verificationId: widget.verificationId,
                      //           smsCode: _otpController.text.toString());
                      //   FirebaseAuth.instance
                      //       .signInWithCredential(credential)
                      //       .then((value) async {
                      //     final userService = UserLoginSignup(createDio());
                      //     SignUpResponse userData =
                      //         await userService.signupp(widget.mobileno, "");
                      //     if (userData.data == null) {
                      //       final userLoginService = UserLogin(createDio());
                      //       LoginUpResponse responseData =
                      //           await userLoginService.login(widget.mobileno);
                      //       if (responseData.status == true) {
                      //         // ignore: use_build_context_synchronously
                      //         Navigator.pushAndRemoveUntil(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => const HomePageMain()),
                      //             (route) => false);
                      //       }
                      //     } else {
                      //       // ignore: use_build_context_synchronously
                      //       Navigator.pushAndRemoveUntil(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => HomePageMain()),
                      //           (route) => false);
                      //     }
                      //   });
                      // } catch (e) {
                      //   setState(() {
                      //     wrongotp = true;
                      //     lodar = false;
                      //   });
                      // }
                    },
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 12,
                                offset: Offset(4, 4),
                                color: Colors.black54)
                          ]),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "SUBMIT",
                              style: GoogleFonts.aboreto(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    ));
  }
}
