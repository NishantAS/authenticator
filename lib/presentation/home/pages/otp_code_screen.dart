import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OtpCodeScreen extends StatelessWidget {
  const OtpCodeScreen({super.key, @PathParam("secret") required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
        centerTitle: true,
      ),
    );
  }
}
