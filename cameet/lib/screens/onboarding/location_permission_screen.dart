
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Image.asset('assets/images/location_permission.png',
                  height: 220, fit: BoxFit.contain),
              const SizedBox(height: 40),
              Text('내 위치 기반 캠핑 커뮤니티',
                  style: GoogleFonts.pretendard(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Text(
                '현재 위치를 기반으로 근처 캠핑장과
소통하고 교환할 수 있어요.',
                textAlign: TextAlign.center,
                style: GoogleFonts.pretendard(fontSize: 14),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // 위치 권한 요청 로직
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C17C),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text('위치 권한 허용하기',
                      style: GoogleFonts.pretendard(
                          color: Colors.white, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  // 나중에 하기 처리
                },
                child: Text('나중에 할게요',
                    style: GoogleFonts.pretendard(color: Colors.grey)),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
