
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text('정말 탈퇴하시겠어요?',
          style: GoogleFonts.pretendard(fontWeight: FontWeight.bold)),
      content: Text(
        '탈퇴 시 계정 정보, 거래 내역, 나눔 지수 등이 모두 삭제되며 복구할 수 없습니다.',
        style: GoogleFonts.pretendard(fontSize: 14),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('취소', style: GoogleFonts.pretendard()),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            // 탈퇴 로직 여기에 연결
          },
          child: Text('탈퇴하기',
              style: GoogleFonts.pretendard(color: Colors.red)),
        )
      ],
    );
  }
}
