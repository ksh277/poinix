
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool chatNotification = true;
  bool communityNotification = true;
  bool donationNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        title: Text('설정',
            style: GoogleFonts.pretendard(
                fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('알림 설정',
              style: GoogleFonts.pretendard(
                  fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          SwitchListTile(
            title: Text('채팅 알림', style: GoogleFonts.pretendard()),
            value: chatNotification,
            activeColor: const Color(0xFF00C17C),
            onChanged: (val) => setState(() => chatNotification = val),
          ),
          SwitchListTile(
            title: Text('커뮤니티 알림', style: GoogleFonts.pretendard()),
            value: communityNotification,
            activeColor: const Color(0xFF00C17C),
            onChanged: (val) => setState(() => communityNotification = val),
          ),
          SwitchListTile(
            title: Text('나눔/받음 알림', style: GoogleFonts.pretendard()),
            value: donationNotification,
            activeColor: const Color(0xFF00C17C),
            onChanged: (val) => setState(() => donationNotification = val),
          ),
          const Divider(height: 32),
          Text('기타',
              style: GoogleFonts.pretendard(
                  fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          ListTile(
            title: Text('로그아웃', style: GoogleFonts.pretendard()),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text('회원탈퇴',
                style: GoogleFonts.pretendard(color: Colors.red)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
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
}
