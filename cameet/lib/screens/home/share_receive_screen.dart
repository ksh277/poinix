
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShareReceiveScreen extends StatelessWidget {
  const ShareReceiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFEFFFF8),
        appBar: AppBar(
          backgroundColor: const Color(0xFF00C17C),
          elevation: 0,
          leading: const Icon(Icons.location_on, color: Colors.white),
          title: Text('양천구 목동',
              style: GoogleFonts.pretendard(color: Colors.white, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            labelColor: const Color(0xFF00C17C),
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(child: Text('나눔', style: GoogleFonts.pretendard())),
              Tab(child: Text('받음', style: GoogleFonts.pretendard())),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildListTab(context, isGive: true),
            _buildListTab(context, isGive: false),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF00C17C),
          unselectedItemColor: Colors.grey,
          currentIndex: 1,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: '물물교환'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '나눔/받음'),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 42), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: '커뮤니티'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '마이'),
          ],
        ),
      ),
    );
  }

  Widget _buildListTab(BuildContext context, {required bool isGive}) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildShareCard(
          image: 'assets/images/item_don.png',
          title: '어묵탕',
          subtitle: '따뜻한 어묵탕 나눠요~ 1인분 기준...',
          label: '나눔중',
          tag: '국물',
          time: '오늘 12:41 마감',
          items: ['간편식 x2', '크림치즈 도넛외'],
          likes: 36,
        ),
        const SizedBox(height: 16),
        _buildShareCard(
          image: 'assets/images/item_galbi.png',
          title: '찜닭용 순가현_뒷가현',
          subtitle: '직접 만든 맛있는 닭찜 4~5인분...',
          label: '나눔중',
          tag: '반찬',
          time: '오늘 12:41 마감',
          items: ['계란찜 or 밥', '반찬 1종류'],
          likes: 22,
        ),
      ],
    );
  }

  Widget _buildShareCard({
    required String image,
    required String title,
    required String subtitle,
    required String label,
    required String tag,
    required String time,
    required List<String> items,
    required int likes,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: GoogleFonts.pretendard(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style: GoogleFonts.pretendard(
                            fontSize: 12, color: Colors.black54),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(label,
                    style: GoogleFonts.pretendard(
                        color: Colors.orange, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F9EE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(tag,
                    style: GoogleFonts.pretendard(
                        fontSize: 12, color: const Color(0xFF00C17C))),
              ),
              const SizedBox(width: 8),
              Text(time,
                  style: GoogleFonts.pretendard(
                      fontSize: 12, color: Colors.black45)),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items
                .map((item) => Row(
                      children: [
                        const Icon(Icons.crown, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(item,
                              style: GoogleFonts.pretendard(fontSize: 13)),
                        ),
                      ],
                    ))
                .toList(),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.favorite_border, size: 16, color: Colors.orange),
              const SizedBox(width: 4),
              Text('$likes',
                  style: GoogleFonts.pretendard(
                      fontSize: 13, color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }
}
