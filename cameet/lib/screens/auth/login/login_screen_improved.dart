
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C17C),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Cameet',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              '캠퍼들을 위한',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const Text(
              '따뜻한 나눔의 커뮤니티',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                '114.37 × 29.23',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/camp_illustration.png',
              height: 200,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
            const Spacer(),
            Column(
              children: [
                _buildLoginButton(
                  icon: Icons.apple,
                  text: 'Apple로 시작하기',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
                const SizedBox(height: 16),
                _buildLoginButton(
                  iconAsset: 'assets/icons/google.png',
                  text: 'Google로 시작하기',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
                const SizedBox(height: 16),
                _buildLoginButton(
                  iconAsset: 'assets/icons/kakao.png',
                  text: '카카오로 시작하기',
                  backgroundColor: Color(0xFFFFE812),
                  textColor: Colors.black,
                ),
                const SizedBox(height: 20),
                const Text(
                  '이미 계정이 있어요',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton({
    IconData? icon,
    String? iconAsset,
    required String text,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      width: 320,
      height: 52,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(icon, color: textColor, size: 20)
          else if (iconAsset != null)
            Image.asset(iconAsset, height: 20),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
