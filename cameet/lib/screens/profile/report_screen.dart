
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String? selectedReason;
  final TextEditingController _detailController = TextEditingController();

  final List<String> reasons = [
    '부적절한 언어를 사용했어요',
    '거래와 관련없는 메시지를 보냈어요',
    '사기 또는 허위 정보가 의심돼요',
    '기타 (직접 입력)'
  ];

  @override
  Widget build(BuildContext context) {
    final canSubmit = selectedReason != null;

    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        title: Text('신고하기',
            style: GoogleFonts.pretendard(
                fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/images/profile_sample.jpg'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('딧빛어',
                      style: GoogleFonts.pretendard(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 2),
                  Text('나눔지수 62.3°C 🔥',
                      style: GoogleFonts.pretendard(
                          fontSize: 13, color: Colors.orange)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('신고 사유를 선택해주세요',
              style: GoogleFonts.pretendard(
                  fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          ...reasons.map((r) => RadioListTile<String>(
                title: Text(r, style: GoogleFonts.pretendard()),
                value: r,
                groupValue: selectedReason,
                activeColor: const Color(0xFF00C17C),
                onChanged: (val) => setState(() => selectedReason = val),
              )),
          const SizedBox(height: 16),
          if (selectedReason == '기타 (직접 입력)')
            TextField(
              controller: _detailController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: '자세한 사유를 입력해주세요',
                hintStyle: GoogleFonts.pretendard(),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: canSubmit ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    canSubmit ? const Color(0xFF00C17C) : const Color(0xFFCCCCCC),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('신고하기',
                  style: GoogleFonts.pretendard(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
