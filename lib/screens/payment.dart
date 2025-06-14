import 'package:flutter/material.dart';
import 'package:testing/widgets/header.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: Header(title: "Select Payment",)),);
  }
}
