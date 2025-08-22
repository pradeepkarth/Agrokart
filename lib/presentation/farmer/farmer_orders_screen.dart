import 'package:flutter/material.dart';

class FarmerOrdersScreen extends StatelessWidget {
  const FarmerOrdersScreen({Key? key}) : super(key: key);

  // Sample data for incoming orders
  final List<Map<String, dynamic>> sampleOrders = const [
    {
      'buyerName': 'John Doe',
      'quantity': '500 kg',
      'status': 'Pending',
    },
    {
      'buyerName': 'Jane Smith',
      'quantity': '1 ton',
      'status': 'Accepted',
    },
    {
      'buyerName': 'Peter Jones',
      'quantity': '250 kg',
      'status': 'Rejected',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incoming Orders'),
      ),
      body: ListView.builder(
        itemCount: sampleOrders.length,
        itemBuilder: (context, index) {
          final order = sampleOrders[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buyer: ${order['buyerName']}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text('Quantity: ${order['quantity']}'),
                  const SizedBox(height: 8.0),
                  Text('Status: ${order['status']}'),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (order['status'] == 'Pending') ...[
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Implement Accept logic
                          },
                          child: const Text('Accept'),
                        ),
                        const SizedBox(width: 8.0),
                        OutlinedButton(
                          onPressed: () {
                            // TODO: Implement Reject logic
                          },
                          child: const Text('Reject'),
                        ),
                      ] else if (order['status'] == 'Accepted') ...[
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Implement Mark Shipped logic
                          },
                          child: const Text('Mark Shipped'),
                        ),
                      ],
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