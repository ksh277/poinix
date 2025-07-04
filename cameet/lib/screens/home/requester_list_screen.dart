
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequesterListScreen extends StatelessWidget {
  const RequesterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final requesters = [
      {
        'name': '딧빛어',
        'score': '62.3',
        'message': '삼겹살 정말 좋아해요! 캠핑 중이라 꼭 필요해요~',
        'image': 'assets/images/profile1.jpg'
      },
      {
        'name': '캠퍼열정러',
        'score': '74.1',
        'message': '저도 나눔 희망합니다. 꼭 부탁드려요!',
        'image': 'assets/images/profile2.jpg'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        title: Text('요청자 목록',
            style: GoogleFonts.pretendard(
                fontWeight: FontWeight.bold, color: Colors.white)),
        leading: const BackButton(color: Colors.white),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemCount: requesters.length,
        itemBuilder: (context, index) {
          final r = requesters[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(r['image']),
                  radius: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(r['name'],
                          style: GoogleFonts.pretendard(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 2),
                      Text('나눔지수 ${r['score']}°C 🔥',
                          style: GoogleFonts.pretendard(
                              fontSize: 13, color: Colors.orange)),
                      const SizedBox(height: 6),
                      Text(r['message'],
                          style: GoogleFonts.pretendard(fontSize: 13),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00C17C),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text('채팅하기',
                          style: GoogleFonts.pretendard(
                              color: Colors.white, fontSize: 12)),
                    ),
                    const SizedBox(height: 6),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.orange),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text('요청 수락',
                          style: GoogleFonts.pretendard(
                              color: Colors.orange, fontSize: 12)),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
