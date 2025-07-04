
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      'title': '캠핑장에서 물물교환!',
      'desc': '주변 캠퍼와 필요한 물품을 교환해요',
      'image': 'assets/images/onboarding1.png',
    },
    {
      'title': '나눔으로 따뜻한 만남!',
      'desc': '남는 물품은 이웃과 나누고 받으세요',
      'image': 'assets/images/onboarding2.png',
    },
    {
      'title': '커뮤니티와 소통해요!',
      'desc': '캠핑 리뷰, 꿀팁, 후기 공유도 가능해요',
      'image': 'assets/images/onboarding3.png',
    },
  ];

  void next() {
    if (currentIndex < pages.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      // 시작하기 → 다음 화면 이동 처리
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // 건너뛰기 처리
                },
                child: Text('건너뛰기',
                    style: GoogleFonts.pretendard(color: Colors.grey)),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (i) => setState(() => currentIndex = i),
                itemBuilder: (context, i) {
                  final page = pages[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Image.asset(page['image']!,
                            height: 260, fit: BoxFit.contain),
                        const SizedBox(height: 40),
                        Text(page['title']!,
                            style: GoogleFonts.pretendard(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        Text(page['desc']!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.pretendard(fontSize: 14)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  pages.length,
                  (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentIndex == i ? 16 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentIndex == i
                              ? const Color(0xFF00C17C)
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: next,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C17C),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(currentIndex < pages.length - 1 ? '다음' : '시작하기',
                      style: GoogleFonts.pretendard(
                          color: Colors.white, fontSize: 16)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
