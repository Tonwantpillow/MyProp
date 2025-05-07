import 'package:flutter/widgets.dart';

class WelcomeHome extends StatelessWidget{
  const WelcomeHome({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome. Ton',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            ),
        )
      ],
    );
  }
}