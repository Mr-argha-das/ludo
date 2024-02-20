import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ludo/conf/env.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "SETTING",
                  style: GoogleFonts.aboreto(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(child: Text("Enter Your UPID for get Withdrawal ammount direct in your bank", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18),)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
               
                style: GoogleFonts.montserrat(color: Colors.white),

                decoration: InputDecoration(
                  label: Text(
                    "Enter your UPI ID",
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
             padding: const EdgeInsets.all(13.0),
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
                    color: Colors.black54
                  )
                ]
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Sound", style: GoogleFonts.aboreto(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.volume_up_rounded, color: Colors.black, size: 35,)
                  ],
                ),
              ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(13.0),
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
                    color: Colors.black54
                  )
                ]
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Deactivate account", style: GoogleFonts.aboreto(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
                    
                    
                  ],
                ),
              ),
             ),
           ),
           const SizedBox(
            height: 10,
           ),
           SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "MONEY",
                  style: GoogleFonts.aboreto(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Padding(
             padding: const EdgeInsets.all(13.0),
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
                    color: Colors.black54
                  )
                ]
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("₹ 1,000", style: GoogleFonts.aboreto(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
                    
                    
                  ],
                ),
              ),
             ),
           ),
             Padding(
              padding: const EdgeInsets.all(2.0),
              child: Center(child: Text("Total Deposit Amount", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18),)),
            ),
            Padding(
             padding: const EdgeInsets.all(13.0),
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
                    color: Colors.black54
                  )
                ]
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("₹ 1,000", style: GoogleFonts.aboreto(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
                    
                    
                  ],
                ),
              ),
             ),
           ),
             Padding(
              padding: const EdgeInsets.all(2.0),
              child: Center(child: Text("Total Withdrawal Amount", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18),)),
            ),
          ],
        ),
      ),
    );
  }
}
