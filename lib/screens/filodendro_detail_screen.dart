import 'package:flutter/material.dart';

class FilodendroDetailScreen extends StatefulWidget {
  final Map<String, dynamic> plant;

  const FilodendroDetailScreen({super.key, required this.plant});

  @override
  _FilodendroDetailScreenState createState() => _FilodendroDetailScreenState();
}

class _FilodendroDetailScreenState extends State<FilodendroDetailScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final plant = widget.plant;

    return Scaffold(
      backgroundColor: const Color(0xFFEAF5F2),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 180,
              child: Image.asset(plant['image'], fit: BoxFit.contain),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plant['name'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          _infoBox(Icons.calendar_today, "1 / week"),
                          _infoBox(Icons.water_drop, plant['amount']),
                          _infoBox(Icons.thermostat, "15–24 ºC"),
                          _infoBox(Icons.wb_cloudy, "Low light"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        isExpanded
                            ? 'The ${plant['name']} is an elegant, ever-expanding interior evergreen, perfect for creating a beautiful green corner in the house thanks to the wonderful ornamental foliage. This plant is low-maintenance and thrives in low-light environments, making it a perfect choice for homes or offices.'
                            : 'The ${plant['name']} is an elegant, ever-expanding interior evergreen, perfect for creating a beautiful green corner in the house thanks to the wonderful ornamental ...',
                        style: const TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Text(isExpanded ? "Read less" : "Read more"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBox(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F5F4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 20), const SizedBox(width: 8), Text(label)],
      ),
    );
  }
}
