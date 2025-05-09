import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeHome extends StatelessWidget{
  const WelcomeHome({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: 'Welcome,',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Ton',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.blueAccent,
                )
              )
            ]
          )
        )
      ],
    );
  }
}