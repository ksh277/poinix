
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


class IntroCameetScreen extends StatelessWidget {
  const IntroCameetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C17C),
      body: SafeArea(
        child: Column(
          children: [
            buildIntroHeader(context, 0),
            const SizedBox(height: 16),
            const Text(
              '캠핑자원의 효율적 소비',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Image.asset('assets/images/intro_cameet.png', height: 220),
            const Spacer(),
            buildBottomBubble('안녕하세요, 알렉산도 대왕님! Cameet은 물물교환과 나눔을 통해 캠핑 자원의 효율적 소비를 추구하는 서비스에요.'),
          ],
        ),
      ),
    );
  }
}
