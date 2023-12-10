import 'package:flutter/material.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).error),
      ),
      body: const Column(
        children: [
          // Error content goes here
        ],
      ),
    );
  }
}
