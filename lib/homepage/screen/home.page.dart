import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ludo/conf/env.dart';
import 'package:ludo/conf/multiornot.dart';
import 'package:ludo/deposit/main.deposit.dart';
import 'package:ludo/gameingane/game.main.dart';
import 'package:ludo/homepage/service/home.service.dart';
import 'package:ludo/settings/main.setting.dart';
import 'package:ludo/tictactoe/main.tictactoe.dart';
import 'package:ludo/withdrawal/withdrawal.main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBalanceModel? balanceResponse;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  Future<HomeBalanceModel> getBalance() async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('userId');
    log(userId.toString());
    final homeService = HomeServiece(createDio());
     final data  = await homeService.getBalance(userId!);
    log("//////////////");
   return data;
  }
  @override
  Widget build(BuildContext context) {
    Future<HomeBalanceModel>  data = getBalance();
    data!.then((value){
      setState(() {
        balanceResponse = value;
      });
    });
    return Material(
      color: Colors.blue.shade800 ,
      child: balanceResponse == null?  const Center(
        child: CircularProgressIndicator(color: Colors.white,),
      )  : Scaffold(
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
                      color: const Color.fromARGB(255, 221, 136, 8), width: 4),
                ),
                child: const Center(
                  child: Icon(
                    Icons.logout,
                    color: Color.fromARGB(255, 221, 136, 8),
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            "Let's Play",
            style: GoogleFonts.aboreto(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
          actions:  [
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
                      "₹ ${balanceResponse?.data.balance}",
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const WithDrawalMain()));
                      },
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const Deposit()));
                      },
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
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        PlayerChose.player == false;
                      });
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => MainTicTacToe()));
                    },
                    child: Column(
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
                                  image: AssetImage('assets/images/tictactoe.png'))),
                        ),
                        Text(
                          "Tic Tac Toe",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        PlayerChose.player == true;
                      });
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => GameEngineMain()));
                    },
                    child: Column(
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
                    ),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const MainSetting()));
                    },
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
                        child: Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 221, 136, 8),
                          size: 28,
                        ),
                      ),
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
                      child: Icon(
                        Icons.support_agent,
                        color: Color.fromARGB(255, 221, 136, 8),
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showShareSheet();
                    },
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
                        child: Icon(
                          Icons.share,
                          color: Color.fromARGB(255, 221, 136, 8),
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showShareSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 8, right: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "https://bigbuddy.site/ludogmae/ZSF1234",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    "if you share this link to your friends or close once and if that person download this app then you will get 10 rupees on each download",
                    textAlign: TextAlign.center,
                  )),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "COPY",
                      style: GoogleFonts.aboreto(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
