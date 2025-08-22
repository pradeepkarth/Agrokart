import 'package:flutter/material.dart';

class FarmerListingsScreen extends StatelessWidget {
  const FarmerListingsScreen({Key? key}) : super(key: key);

  // Sample data for crop listings
  final List<Map<String, dynamic>> sampleListings = const [
    {
      'cropName': 'Tomato',
      'variety': 'Hybrid',
      'status': 'Available',
      'expectedYieldDate': '2023-10-26',
      'minimumOrderQuantity': 100,
      'pricePerUnit': 2.5,
      'imageUrl': 'https://via.placeholder.com/150', // Placeholder image
    },
    {
      'cropName': 'Potato',
      'variety': 'Russet',
      'status': 'Booked',
      'expectedYieldDate': '2023-11-15',
      'minimumOrderQuantity': 500,
      'pricePerUnit': 1.2,
      'imageUrl': 'https://via.placeholder.com/150', // Placeholder image
    },
    {
      'cropName': 'Onion',
      'variety': 'Yellow',
      'status': 'Sold Out',
      'expectedYieldDate': '2023-11-01',
      'minimumOrderQuantity': 200,
      'pricePerUnit': 0.8,
      'imageUrl': 'https://via.placeholder.com/150', // Placeholder image
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Listings'),
      ),
      body: ListView.builder(
        itemCount: sampleListings.length,
        itemBuilder: (context, index) {
          final listing = sampleListings[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
 crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Placeholder for image
 SizedBox(
 width: 80,
 height: 80,
                        child: Image.network(
                          "https://i.pinimg.com/736x/45/95/69/4595691a13283d02b402a24a26ef6ac9.jpg",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.image_not_supported);
                          },
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${listing['cropName']} - ${listing['variety']}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Status: ${listing['status']}',
                              style: TextStyle(
                                color: listing['status'] == 'Available'
                                    ? Colors.green
                                    : listing['status'] == 'Booked'
                                        ? Colors.orange
                                        : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text('Expected Yield: ${listing['expectedYieldDate']}'),
                            const SizedBox(height: 4.0),
                            Text('Min Order: ${listing['minimumOrderQuantity']} kg/ton'),
                            const SizedBox(height: 4.0),
                            Text('Price: \$${listing['pricePerUnit']} / unit'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // TODO: Implement Edit functionality
                        },
                        child: const Text('Edit'),
                      ),
                      const SizedBox(width: 8.0),
                      TextButton(
                        onPressed: () {
                          // TODO: Implement Mark Sold Out functionality
                        },
                        child: const Text('Mark Sold Out'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}