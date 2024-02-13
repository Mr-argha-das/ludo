import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ludo/conf/env.dart';
import 'package:ludo/gameingane/constants.dart';
import 'package:ludo/gameingane/ludo_provider.dart';
import 'package:ludo/gameingane/providers/dice_exchange.dart';

import 'package:ludo/gameingane/widgets/board_widget.dart';
import 'package:ludo/gameingane/widgets/dice_widget.dart';
import 'package:provider/provider.dart';

class Ludo2GameEngineMainScreen extends StatefulWidget {
  const Ludo2GameEngineMainScreen({super.key});

  @override
  State<Ludo2GameEngineMainScreen> createState() =>
      _Ludo2GameEngineMainScreenState();
}

class _Ludo2GameEngineMainScreenState extends State<Ludo2GameEngineMainScreen> {
  LudoPlayerType? currentPlayer;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyData(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.blue.shade800,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(MyTheme.backgroundimage))),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Consumer<MyData>(builder: (context, myData, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          "TWO Player",
                          style: GoogleFonts.aboreto(
                              color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (myData.value == LudoPlayerType.green) ...[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        height: 85,
                                        width: 85,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                width: 5, color: Colors.green)),
                                        child: const Center(
                                            child: SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: DiceWidget(),
                                        )),
                                      ),
                                    ),
                                  ],
                                ],
                              )),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  
                                ],
                              ))
                            ],
                          ),
                        ),
                        BoardWidget(
                          callBack: (LudoPlayerType value) {
                            log("///////////////////////");
                            log(value.toString());
                            
                            WidgetsBinding.instance?.addPostFrameCallback((_) {
                              setState(() {
                                Provider.of<MyData>(context, listen: false).value =
                                value;
                              });
                            });
                          }, playersTrueFalse: false,
                        ),
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  
                                ],
                              )),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (myData.value == LudoPlayerType.blue) ...[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        height: 85,
                                        width: 85,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                width: 5, color: Colors.blue)),
                                        child: const Center(
                                            child: SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: DiceWidget(),
                                        )),
                                      ),
                                    )
                                  ],
                                ],
                              ))
                            ],
                          ),
                        ),
                      ],
                    )),
                  ],
                );
              }),
              Consumer<LudoProvider>(
                builder: (context, value, child) => value.winners.length == 3
                    ? Container(
                        color: Colors.black.withOpacity(0.8),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/images/thankyou.gif"),
                              const Text("Thank you for playing 😙",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  textAlign: TextAlign.center),
                              Text(
                                  "The Winners is: ${value.winners.map((e) => e.name.toUpperCase()).join(", ")}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 30),
                                  textAlign: TextAlign.center),
                              const Divider(color: Colors.white),
                              const Text(
                                  "This game made with Flutter ❤️ by Mochamad Nizwar Syafuan",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                  textAlign: TextAlign.center),
                              const SizedBox(height: 20),
                              const Text("Refresh your browser to play again",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
