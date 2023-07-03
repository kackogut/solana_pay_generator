import 'package:flutter/material.dart';

class ParametersInputScreen extends StatelessWidget {

  const ParametersInputScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Receive wallet address',
                ),
              ),
            )
          ],
        ),
      );
}
