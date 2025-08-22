import 'package:flutter/material.dart';

class FarmerDashboardScreen extends StatelessWidget {
  const FarmerDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Stats',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 12.0),
                    const Text('Total Listings: 10'),
                    const SizedBox(height: 8.0),
                    const Text('Active Bookings: 5'),
                    const SizedBox(height: 8.0),
                    const Text('Pending Orders: 3'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to Add Product Screen
              },
              child: const Text('+ Add Product'),
            ),
            // TODO: Add more dashboard content here
          ],
        ),
      ),
    );
  }
}