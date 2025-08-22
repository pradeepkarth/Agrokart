import 'package:flutter/material.dart';

class BuyerProductDetailScreen extends StatelessWidget {
  const BuyerProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder for Product Image Gallery
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Placeholder for Crop Name and Variety
            Text(
              'Crop Name: Sample Tomato', // Sample Data
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Variety: Sample Hybrid 123', // Sample Data
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16.0),

            // Placeholder for Farmer Details
            Text(
              'Farmer: Sample Farmer Name', // Sample Data
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Location: Sample Farm Location', // Sample Data
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16.0),

            // Placeholder for Product Details
            Text(
              'Expected Yield Date: 2024-09-30', // Sample Data
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Price per Unit: \$2.50/kg', // Sample Data
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Minimum Order Quantity: 10 kg', // Sample Data
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24.0),

            // Pre-Book Now Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement navigation to Pre-Booking screen
                },
                child: const Text('Pre-Book Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}