import 'package:flutter/material.dart';
import 'package:ludo/deposit/screen/deposit.page.dart';

class Deposit extends StatefulWidget {
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  @override
  Widget build(BuildContext context) {
    return const DepositPage();
  }
}