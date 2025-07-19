import 'package:flutter/material.dart';

class SweetBillionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_castle.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SWEET BILLIONS',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {},
                child: Text('PLAY'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('FORTUNE WHEEL'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('SHOP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
