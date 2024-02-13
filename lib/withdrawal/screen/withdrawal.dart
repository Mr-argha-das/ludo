import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../conf/env.dart';


class WithDrawal extends StatefulWidget {
  const WithDrawal({super.key});

  @override
  State<WithDrawal> createState() => _WithDrawalState();
}

class _WithDrawalState extends State<WithDrawal> {
  final _controllerTextEditing = TextEditingController();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "WITHDRAWAL",
                  style: GoogleFonts.aboreto(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _controllerTextEditing,
                keyboardType: TextInputType.number,
                style: GoogleFonts.montserrat(color: Colors.white),

                
                decoration: InputDecoration(
                  label: Text(
                    "Enter amount to be Withdrawal ?",
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: Colors.orange.shade800, width: 3)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: Colors.orange.shade800, width: 3)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Aftet Withdrawal the system will be transfer withdrawal within 1 day", style: GoogleFonts.montserrat(color: Colors.white),),
            ),
           
            const SizedBox(
              height: 180,
            ),
            gooleLoginButton(context)
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
      child: Text("WITHDRAWAL", style: GoogleFonts.aboreto(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),)
    ),
  );
}