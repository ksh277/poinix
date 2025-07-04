
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

Widget buildIntroHeader(BuildContext context, int currentStep) {
  final steps = ["Cameet", "물물교환", "나눔/받음", "커뮤니티"];
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: List.generate(steps.length, (index) {
            return Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 12,
                  color: index == currentStep ? Colors.white : Colors.white54,
                ),
                if (index < steps.length - 1)
                  Container(width: 16, height: 1, color: Colors.white),
              ],
            );
          }),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.white),
            foregroundColor: Colors.white,
          ),
          onPressed: () {},
          child: Text('건너뛰기'),
        ),
      ],
    ),
  );
}

Widget buildBottomBubble(String text) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(text),
          ),
        ),
        SizedBox(width: 8),
        Column(
          children: [
            Image.asset(
              'assets/icons/bubble_icon.png',
              width: 40,
              height: 40,
            ),
            const Text('눌러서 계속', style: TextStyle(color: Colors.white)),
          ],
        )
      ],
    ),
  );
}


class IntroCommunityScreen extends StatelessWidget {
  const IntroCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C17C),
      body: SafeArea(
        child: Column(
          children: [
            buildIntroHeader(context, 3),
            const SizedBox(height: 16),
            const Text(
              '커뮤니티 소개',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Image.asset('assets/images/intro_community.png', height: 200),
            const Spacer(),
            buildBottomBubble('마지막으로 커뮤니티 기능을 소개할게요. 커뮤니티는 위치기반으로, 동일 캠핑장을 이용중인 사용자들을 중심으로 제공해요.'),
          ],
        ),
      ),
    );
  }
}
