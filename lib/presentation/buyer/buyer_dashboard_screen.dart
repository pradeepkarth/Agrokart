import 'package:flutter/material.dart';

class BuyerDashboardScreen extends StatelessWidget {
  const BuyerDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buyer Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar Placeholder
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by crop, farmer, or location...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Filters Placeholder
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(label: Text('Crop Type')),
                Chip(label: Text('Price')),
                Chip(label: Text('Harvest Date')),
              ],
            ),
            const SizedBox(height: 16.0),

            // Listings Placeholder (List/Grid View)
            Expanded(
              child: Center(
                child: Text(
                  'Placeholder for listings (List/Grid View)',
                  style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}