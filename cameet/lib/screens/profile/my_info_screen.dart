
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        title: Text('Cameet',
            style: GoogleFonts.pretendard(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none, color: Colors.white)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline, color: Colors.white)),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage('assets/images/profile_sample.jpg'),
                ),
                const SizedBox(height: 12),
                Text('알렉산도 대왕',
                    style: GoogleFonts.pretendard(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5F9EE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('프로필 수정',
                      style: GoogleFonts.pretendard(
                          fontSize: 12, color: Color(0xFF00C17C))),
                )
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildSection('나의 거래', ['거래중', '거래완료']),
          const Divider(height: 32),
          _buildSection('작성 기록', ['작성한 글', '댓글단 글']),
          const Divider(height: 32),
          _buildSection('알림 ON/OFF', []),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00C17C),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: '물물교환'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '나눔/받음'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 42), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '커뮤니티'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '내 정보'),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.pretendard(
                  fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          ...items.map((item) => ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(item, style: GoogleFonts.pretendard()),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              )),
        ],
      ),
    );
  }
}
