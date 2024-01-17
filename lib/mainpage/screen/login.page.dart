import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ludo/conf/env.dart';
import 'package:ludo/homepage/main.home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.blue.shade800,
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(MyTheme.backgroundimage))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Select To login",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 13,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePageMain()));
                    },
                    child: gooleLoginButton(context)),
                const SizedBox(
                  height: 20,
                ),
                faceBookLoginButton(context)
              ],
            ))
          ],
        ),
      ),
    );
  }
}

Container gooleLoginButton(context) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width - 50,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade800,
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
  );
}

Container faceBookLoginButton(context) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width - 50,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 50, 103, 174),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade800,
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
