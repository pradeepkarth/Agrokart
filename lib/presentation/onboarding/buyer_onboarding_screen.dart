import 'package:flutter/material.dart';

class BuyerOnboardingScreen extends StatelessWidget {
  const BuyerOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buyer Onboarding'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Your Name',
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Your Address',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contact Number',
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement buyer onboarding logic
                  // Navigate to Buyer Dashboard after onboarding
                },
                child: const Text('Complete Onboarding'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}