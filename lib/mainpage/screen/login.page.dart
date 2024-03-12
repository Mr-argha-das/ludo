import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ludo/conf/env.dart';
import 'package:ludo/homepage/main.home.dart';
import 'package:ludo/mainpage/model/login.model.dart';
import 'package:ludo/mainpage/model/signup.model.dart';
import 'package:ludo/mainpage/service/api.login.service.dart';
import 'package:ludo/mainpage/service/google.login.dart';
import 'package:ludo/mainpage/service/login.api.service.dart';
import 'package:ludo/mainpage/service/phone.login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
   String codeCountry = "";
   bool lodar = false;
   
  final _fromKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.blue.shade800,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(MyTheme.backgroundimage))),
          child: lodar?  LoadingAnimationWidget.inkDrop(color: Colors.white, size: 25): Form(
            key: _fromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/logo.png"),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10),
                            child: Container(
                              height: 85,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InternationalPhoneNumberInput(
                                  
                                  onInputChanged: (PhoneNumber number) {
                                    setState(() {
                                      codeCountry = number.dialCode.toString();
                                    });
                                  },
                                  onInputValidated: (bool value) {
                                    print(value);
                                  },
                                  selectorConfig: const SelectorConfig(
                                    useEmoji: true,
                                    trailingSpace: true,
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.black),
                                  initialValue: number,
                                  textFieldController: controller,
                                  formatInput: true,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  inputDecoration: InputDecoration(
                                    label: Text(
                                      "Phone Number",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.black),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade800,
                                            width: 3)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade800,
                                            width: 3)),
                                  ),
                                  onSaved: (PhoneNumber number) {
                                    print('On Saved: $number');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          lodar =true;
                        });
                        if(_fromKey.currentState!.validate()){
                         await LudoPhonelogin.sendOtp(context, number: controller.text, iscode: codeCountry, callBack: (){
                           lodar = false;
                         }, mobileno: controller.text);
                        }
                      },
                      child: phoneNumber(context,controller.text, codeCountry , _fromKey)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "------- OR -------",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    gooleLoginButton(context, (value){
                      setState(() {
                        lodar = value;
                      });
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    // faceBookLoginButton(context)
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

GestureDetector phoneNumber(context, number, isocode, key) {
  return GestureDetector(
    
    child: Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 1,
            blurRadius: 12,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Center(
          child: Text(
        "Sign up",
        style: GoogleFonts.aboreto(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 22),
      )),
    ),
  );
}

GestureDetector gooleLoginButton(context, Function callBack) {
  return GestureDetector(
    onTap: () async {
     try{
      callBack(true);
       UserCredential data = await GoogleFirebaseService.signInWithGoogle();
      log(data.additionalUserInfo!.profile.toString());
      if (data.credential!.accessToken != null) {

                            
                          final userService = UserLoginSignup(createDio());
                           Map<String, dynamic>  userDataGoogle = jsonDecode(data.additionalUserInfo!.profile.toString());
                          SignUpResponse userData =
                              await userService.signupp(userDataGoogle["id"], "");
                          if (userData.data == null) {
                            final userLoginService = UserLogin(createDio());
                            LoginUpResponse responseData =
                                await userLoginService.login(userDataGoogle["id"]);
                            if (responseData.status == true) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePageMain()),
                                  (route) => false);
                            }
                          } else {
                            // ignore: use_build_context_synchronously
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePageMain()),
                                (route) => false);
                          }
                
      }
     }catch (e){
       callBack(false);
     }
    },
    child: Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Image.network(
              'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png'),
        ),
      ),
    ),
  );
}

Container faceBookLoginButton(context) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width - 50,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 50, 103, 174),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Colors.black38,
          spreadRadius: 1,
          blurRadius: 12,
          offset: const Offset(4, 4),
        ),
      ],
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Image.network(
            'https://logos-world.net/wp-content/uploads/2020/04/Facebook-Emblem.png'),
      ),
    ),
  );
}
