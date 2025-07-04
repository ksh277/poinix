import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recommended = [
      'assets/images/camp1.jpg',
      'assets/images/camp2.jpg',
      'assets/images/camp3.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.location_on_outlined),
            SizedBox(width: 8),
            Text('양천구 목동'),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CarouselSlider(
            items: recommended
                .map((e) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text(e)),
                    ))
                .toList(),
            options: CarouselOptions(
              height: 180,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
          ),
          const SizedBox(height: 24),
          Text('금주의 인기 아이템',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...List.generate(
            5,
            (index) => ListTile(
              leading: const Icon(Icons.star_border),
              title: Text('인기 아이템 ${index + 1}'),
              subtitle: const Text('설명글이 여기에 표시됩니다.'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
          ),
          child: const Text('캠핑장 입장'),
        ),
      ),
    );
  }
}
