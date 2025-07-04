
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SOSScreen extends StatefulWidget {
  const SOSScreen({super.key});

  @override
  State<SOSScreen> createState() => _SOSScreenState();
}

class _SOSScreenState extends State<SOSScreen> {
  bool pressed = false;

  void _onLongPressStart(_) {
    setState(() => pressed = true);
  }

  void _onLongPressEnd(_) {
    setState(() => pressed = false);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('구조 요청 전송됨',
            style: GoogleFonts.pretendard(fontWeight: FontWeight.bold)),
        content: Text('근처 관리자에게 긴급 구조 요청이 전송되었어요.',
            style: GoogleFonts.pretendard(fontSize: 14)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('확인', style: GoogleFonts.pretendard()))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pressed ? Colors.red.shade100 : const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        title: Text('긴급 구조 요청',
            style: GoogleFonts.pretendard(
                fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Text('현재 위치: 전라남도 목포시 ○○캠핑장',
              style: GoogleFonts.pretendard(color: Colors.black87)),
          const SizedBox(height: 40),
          GestureDetector(
            onLongPressStart: _onLongPressStart,
            onLongPressEnd: _onLongPressEnd,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: pressed ? Colors.red.shade700 : Colors.red,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.shade200,
                    blurRadius: 16,
                    spreadRadius: 4,
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Text('SOS',
                  style: GoogleFonts.pretendard(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 40),
          Text('긴급 상황일 경우
SOS 버튼을 길게 눌러 구조를 요청하세요.',
              textAlign: TextAlign.center,
              style: GoogleFonts.pretendard(fontSize: 14)),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
