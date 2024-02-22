import 'package:flutter/material.dart';
import 'package:ludo/optpage/screen/opt.page.dart';
class MainOtpPage extends StatefulWidget {
  final String mobileno;
  final String verificationId;

  const MainOtpPage({super.key, required this.verificationId, required this.mobileno});

  @override
  State<MainOtpPage> createState() => _MainOtpPageState();
}

class _MainOtpPageState extends State<MainOtpPage> {
  @override
  Widget build(BuildContext context) {
    return  OptPage(verificationId: widget.verificationId, mobileno: widget.mobileno);
  }
}