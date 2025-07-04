
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  String? selected;

  final options = [
    {'emoji': '😟', 'label': '별로예요'},
    {'emoji': '🙂', 'label': '좋아요'},
    {'emoji': '😁', 'label': '최고예요'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: Text('후기 작성',
            style: GoogleFonts.pretendard(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '딧빛어님과의 거래는 어땠나요?',
              style: GoogleFonts.pretendard(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: options.map((option) {
                final isSelected = selected == option['label'];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = option['label'];
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFF2FDF8)
                          : const Color(0xFFF5F5F5),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF00C17C)
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(option['emoji']!, style: const TextStyle(fontSize: 26)),
                        const SizedBox(height: 8),
                        Text(option['label']!,
                            style: GoogleFonts.pretendard(
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? const Color(0xFF00C17C)
                                  : Colors.black87,
                            )),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: selected != null ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selected != null
                    ? const Color(0xFF00C17C)
                    : const Color(0xFFDDDDDD),
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('등록하기',
                  style: GoogleFonts.pretendard(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
