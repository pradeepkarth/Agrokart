import 'package:flutter/material.dart';

class BuyerOrdersScreen extends StatelessWidget {
  const BuyerOrdersScreen({Key? key}) : super(key: key);

  // Sample data for buyer orders
  final List<Map<String, dynamic>> sampleOrders = const [
    {
      'farmerName': 'Green Acres Farm',
      'crop': 'Tomatoes',
      'quantity': '100 kg',
      'status': 'Booked',
    },
    {
      'farmerName': 'Sunny Meadows',
      'crop': 'Potatoes',
      'quantity': '500 kg',
      'status': 'Confirmed',
    },
    {
      'farmerName': 'Oakwood Orchard',
      'crop': 'Apples',
      'quantity': '200 kg',
      'status': 'Shipped',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: sampleOrders.length,
          itemBuilder: (context, index) {
            final order = sampleOrders[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Farmer: ${order['farmerName']}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text('Crop: ${order['crop']}'),
                    const SizedBox(height: 4.0),
                    Text('Quantity: ${order['quantity']}'),
                    const SizedBox(height: 4.0),
                    Text('Status: ${order['status']}'),
                    // TODO: Add actions based on order status (e.g., Track button)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}