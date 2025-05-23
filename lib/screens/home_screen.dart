import 'package:flutter/material.dart';
import 'package:plant_app/screens/filodendro_detail_screen.dart';
// Make sure to import your detail screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plants = [
      {
        'name': 'Filodendro Atom',
        'amount': '250 ml',
        'image': 'assets/images/filodendro.jpg',
        'color': Colors.green[100],
        'statusIcon': Icons.water_drop_outlined,
        'statusColor': Colors.green,
      },
      {
        'name': 'Monstera Deliciosa',
        'amount': '500 ml',
        'image': 'assets/images/monstera.jpg',
        'color': Colors.blue[100],
        'statusIcon': Icons.water_drop_outlined,
        'statusColor': Colors.blue,
      },
      {
        'name': 'Chlorophytum',
        'amount': '500 ml',
        'image': 'assets/images/chlorophytum.jpg',
        'color': Colors.orange[100],
        'statusIcon': Icons.water_drop_outlined,
        'statusColor': Colors.orange,
      },
      {
        'name': 'Kentiapalm',
        'amount': '250 ml',
        'image': 'assets/images/kentiapalm.jpg',
        'color': Colors.grey[300],
        'statusIcon': Icons.check,
        'statusColor': Colors.grey,
      },
    ];

    final olderPlant = {
      'name': 'Peperomia Obtusifolia',
      'amount': '250 ml',
      'image': 'assets/images/peperomia.jpg',
      'color': Colors.pink[100],
      'statusIcon': Icons.water_drop_outlined,
      'statusColor': Colors.pink,
    };

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.settings, color: Colors.grey),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFD4E7EC),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Water Me, Please!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),

                // Plant Cards with navigation
                ...plants.map(
                  (plant) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => FilodendroDetailScreen(plant: plant),
                        ),
                      );
                    },
                    child: PlantCard(plant),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  'Fri, February 7',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),

                // Older plant card with navigation
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                FilodendroDetailScreen(plant: olderPlant),
                      ),
                    );
                  },
                  child: PlantCard(olderPlant),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  final Map<String, dynamic> plant;
  const PlantCard(this.plant, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: plant['color'],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              plant['image'],
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  plant['amount'],
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.8),
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(plant['statusIcon'], color: plant['statusColor']),
          ),
        ],
      ),
    );
  }
}
