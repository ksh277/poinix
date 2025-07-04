
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C17C),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단 로고 + 아이콘
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cameet',
                    style: GoogleFonts.pretendard(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/icons/notification.png', height: 24),
                      const SizedBox(width: 12),
                      Image.asset('assets/icons/chat.png', height: 24),
                    ],
                  ),
                ],
              ),
            ),
            // 추천 텍스트
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '친구한테 캠밋 추천하고\n500포인트 받자!',
                style: GoogleFonts.pretendard(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Image.asset('assets/images/coin_promo.png', height: 70),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    _buildItemCard(
                      image: 'assets/images/item_meat.png',
                      title: '삼겹살700g',
                      content: '한입만 3개랑 변경하고 싶어요~',
                      tag: '육즙',
                      time: '오늘 12:41 마감',
                      viewers: '12명 참여 중',
                      thumbs: [
                        'assets/thumbs/1.png',
                        'assets/thumbs/2.png',
                        'assets/thumbs/3.png',
                        'assets/thumbs/4.png',
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildItemCard(
                      image: 'assets/images/item_bus.png',
                      title: '버섯 1팩',
                      content: '과자랑 변경하실 분?',
                      tag: '육즙',
                      time: '오늘 12:02 마감',
                      viewers: '3명 참여 중',
                      thumbs: [
                        'assets/thumbs/5.png',
                        'assets/thumbs/6.png',
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF00C17C),
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: '물물교환',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 6),
              child: const Icon(Icons.add_circle, size: 42),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: '커뮤니티',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '마이',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {},
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildItemCard({
    required String image,
    required String title,
    required String content,
    required String tag,
    required String time,
    required String viewers,
    required List<String> thumbs,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: GoogleFonts.pretendard(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(content, style: GoogleFonts.pretendard(color: Colors.black54, fontSize: 13)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange),
                ),
                child: const Text('거래중', style: TextStyle(color: Colors.orange, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFE5F9EE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(tag, style: const TextStyle(color: Color(0xFF00C17C), fontSize: 12)),
              ),
              const SizedBox(width: 8),
              Text(time, style: const TextStyle(fontSize: 12, color: Colors.black45)),
              const SizedBox(width: 8),
              Text(viewers, style: const TextStyle(fontSize: 12, color: Colors.black45)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: thumbs.map((path) => Padding(
              padding: const EdgeInsets.only(right: 6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(path, width: 30, height: 30),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
