import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ludo/conf/env.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        elevation: 1,
        centerTitle: false,
        leading: Center(
          
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade800,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(
                          color: const Color.fromARGB(255, 221, 136, 8),
                          width: 4),
                    ),
                    child: const Center(
                      child: Icon(Icons.logout, color:  Color.fromARGB(255, 221, 136, 8), size: 20,),
                    ),
                  ),
          ),
        ),
        title: Text(
          "Let's Play",
          style: GoogleFonts.aboreto(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          Container(
            height: 40,
            width: 150,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(-4, 4))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "₹  10000000",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
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
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.circular(400),
                        border: Border.all(
                            color: const Color.fromARGB(255, 221, 136, 8),
                            width: 4),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black54,
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(-4, 4))
                        ]),
                    child: Center(
                      child: Text(
                        "WITHDRAWAL",
                        style: GoogleFonts.aboreto(
                            color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.circular(400),
                        border: Border.all(
                            color: const Color.fromARGB(255, 221, 136, 8),
                            width: 4),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black54,
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(-4, 4))
                        ]),
                    child: Center(
                      child: Text(
                        "DEPOSIT",
                        style: GoogleFonts.aboreto(
                            color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Games",
              style: GoogleFonts.aboreto(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: const DecorationImage(
                              image: AssetImage('assets/ludo.jpg'))),
                    ),
                    Text(
                      "Two Player",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: const DecorationImage(
                              image: AssetImage('assets/ludo.jpg'))),
                    ),
                    Text(
                      "Multi Player",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.all(
                        color: const Color.fromARGB(255, 221, 136, 8),
                        width: 4),
                  ),
                  child: const Center(
                    child: Icon(Icons.settings, color:  Color.fromARGB(255, 221, 136, 8), size: 28,),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),

                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.all(
                        color: const Color.fromARGB(255, 221, 136, 8),
                        width: 4),
                  ),
                  child: const Center(
                    child: Icon(Icons.support_agent, color:  Color.fromARGB(255, 221, 136, 8), size: 30,),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                 Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.all(
                        color: const Color.fromARGB(255, 221, 136, 8),
                        width: 4),
                  ),
                  child: const Center(
                    child: Icon(Icons.balance, color:  Color.fromARGB(255, 221, 136, 8), size: 30,),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
