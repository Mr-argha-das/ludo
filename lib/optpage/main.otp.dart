import 'package:flutter/material.dart';
import 'package:ludo/optpage/screen/opt.page.dart';
class MainOtpPage extends StatefulWidget {
  final String verificationId;

  const MainOtpPage({super.key, required this.verificationId});

  @override
  State<MainOtpPage> createState() => _MainOtpPageState();
}

class _MainOtpPageState extends State<MainOtpPage> {
  @override
  Widget build(BuildContext context) {
    return  OptPage(verificationId: widget.verificationId,);
  }
}