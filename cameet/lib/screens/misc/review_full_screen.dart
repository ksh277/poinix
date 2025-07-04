
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewStepScreen extends StatefulWidget {
  const ReviewStepScreen({super.key});

  @override
  State<ReviewStepScreen> createState() => _ReviewStepScreenState();
}

class _ReviewStepScreenState extends State<ReviewStepScreen> {
  String? selectedMood;
  final List<String> options = [
    '제가 있는 곳 자리 줘서 거래했어요',
    '친절하고 매너가 좋아요',
    '시간 약속을 잘 지켜요',
    '응답이 빨라요'
  ];
  final Set<String> selectedOptions = {};

  void submit() {
    showDialog(
      context: context,
      builder: (_) => const ReviewCompleteDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final moods = [
      {'emoji': '😟', 'label': '별로예요'},
      {'emoji': '🙂', 'label': '좋아요'},
      {'emoji': '😁', 'label': '최고예요'},
    ];

    final canSubmit = selectedMood != null && selectedOptions.isNotEmpty;

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
              '딧빛이님과의 거래는 어땠나요?',
              style: GoogleFonts.pretendard(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: moods.map((m) {
                final isSelected = selectedMood == m['label'];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMood = m['label'];
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
                        Text(m['emoji']!, style: const TextStyle(fontSize: 26)),
                        const SizedBox(height: 8),
                        Text(m['label']!,
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
            const SizedBox(height: 20),
            ...options.map((opt) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CheckboxListTile(
                  value: selectedOptions.contains(opt),
                  onChanged: (v) {
                    setState(() {
                      if (v == true) {
                        selectedOptions.add(opt);
                      } else {
                        selectedOptions.remove(opt);
                      }
                    });
                  },
                  activeColor: const Color(0xFF00C17C),
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  title: Text(opt, style: GoogleFonts.pretendard(fontSize: 14)),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
              );
            }).toList(),
            const Spacer(),
            ElevatedButton(
              onPressed: canSubmit ? submit : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    canSubmit ? const Color(0xFF00C17C) : const Color(0xFFDDDDDD),
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

class ReviewCompleteDialog extends StatelessWidget {
  const ReviewCompleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      '제가 있는 곳 자리 줘서 거래했어요',
      '친절하고 매너가 좋아요',
      '시간 약속을 잘 지켜요',
    ];

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/thanks_icon.png', height: 80),
            const SizedBox(height: 20),
            Text('후기 작성 완료',
                style: GoogleFonts.pretendard(
                    fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text('사용자님의 후기가 캠밋을
더 따뜻하게 만들었어요.',
                textAlign: TextAlign.center,
                style: GoogleFonts.pretendard(fontSize: 14)),
            const SizedBox(height: 20),
            ...items.map((text) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle,
                          color: Color(0xFF00C17C), size: 18),
                      const SizedBox(width: 8),
                      Text(text,
                          style:
                              GoogleFonts.pretendard(color: Colors.black87)),
                    ],
                  ),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C17C),
                minimumSize: const Size.fromHeight(44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('닫기',
                  style: GoogleFonts.pretendard(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
