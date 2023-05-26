import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String error;
  const ErrorText({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorText(
        error: error,
      ),
    );
  }
}
