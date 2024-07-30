import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'there is no weather 😔 Start',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              Text(
                'searching now 🔍',
                style: TextStyle(color: Colors.black, fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }
}
