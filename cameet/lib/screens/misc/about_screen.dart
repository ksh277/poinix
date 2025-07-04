
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        title: Text('앱 정보',
            style: GoogleFonts.pretendard(
                fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Cameet',
              style: GoogleFonts.pretendard(
                  fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('버전 1.0.0 (Build 17)',
              style:
                  GoogleFonts.pretendard(fontSize: 14, color: Colors.black54)),
          const SizedBox(height: 24),
          Text('개발자 정보',
              style: GoogleFonts.pretendard(
                  fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('제작', style: GoogleFonts.pretendard()),
            subtitle: Text('Cameet Dev Team',
                style: GoogleFonts.pretendard(fontSize: 13)),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('이메일', style: GoogleFonts.pretendard()),
            subtitle: Text('support@cameet.app',
                style: GoogleFonts.pretendard(fontSize: 13)),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('사이트', style: GoogleFonts.pretendard()),
            subtitle: Text('https://cameet.app',
                style: GoogleFonts.pretendard(fontSize: 13)),
          ),
          const Divider(height: 32),
          Text('법적 정보',
              style: GoogleFonts.pretendard(
                  fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('이용약관', style: GoogleFonts.pretendard()),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('개인정보처리방침', style: GoogleFonts.pretendard()),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
