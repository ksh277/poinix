
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shareOptions = [
      {'icon': Icons.share, 'label': '인스타그램으로 공유'},
      {'icon': Icons.chat_bubble_outline, 'label': '카카오톡으로 공유'},
      {'icon': Icons.link, 'label': '링크 복사'},
      {'icon': Icons.qr_code, 'label': 'QR 코드 보기'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        title: Text('공유하기',
            style: GoogleFonts.pretendard(
                fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: shareOptions.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final option = shareOptions[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: Icon(option['icon'] as IconData,
                  color: const Color(0xFF00C17C)),
              title: Text(option['label'] as String,
                  style: GoogleFonts.pretendard(fontSize: 15)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${option['label']} 기능이 호출되었습니다.',
                      style: GoogleFonts.pretendard()),
                  duration: const Duration(seconds: 2),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
