import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ludo/homepage/service/home.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../conf/env.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  final _controllerTextEditing = TextEditingController();
  final _fomeKey = GlobalKey<FormState>();
  String ammount = "0";
  double totalammount = 0.0;
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
        child: Form(
          key: _fomeKey,
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
                    "Deposit",
                    style:
                        GoogleFonts.aboreto(color: Colors.white, fontSize: 25),
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
                  onChanged: (value) {
                    setState(() {
                      ammount = value;
                      int a = int.parse(ammount);
                      double b = (18 / 100) * a;
                      totalammount = a - b;
                    });
                  },
                  decoration: InputDecoration(
                    label: Text(
                      "Enter amount to be deposit ?",
                      style: GoogleFonts.montserrat(color: Colors.white),
                    ),
                    errorStyle: GoogleFonts.montserrat(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: Colors.orange.shade800, width: 3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: Colors.orange.shade800, width: 3)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Amount required";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Total amount to be deposit\n ($ammount) - GST = $totalammount",
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.montserrat(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 180,
              ),
              GestureDetector(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final String? userId = prefs.getString('userId');
                    if (_fomeKey.currentState!.validate()) {
                      final service = HomeServiece(createDio());
                      HomeBalanceModel response = await service.updateBalance(
                          userId!, true, totalammount);
                          Navigator.pop(context);
                    }
                  },
                  child: gooleLoginButton(context))
            ],
          ),
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
        child: Text(
      "PAY",
      style: GoogleFonts.aboreto(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
    )),
  );
}
