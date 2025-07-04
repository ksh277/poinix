
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationDetailScreen extends StatelessWidget {
  const DonationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        title: Text('나눔 상세',
            style: GoogleFonts.pretendard(
                fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.white))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // 상단 이미지 + 상태
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset('assets/images/item_meat_detail.jpg',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('나눔중 · 오늘 12:41 마감',
                            style: GoogleFonts.pretendard(fontSize: 13)),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 16,
                      child: Icon(Icons.bookmark_border, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // 작성자 정보
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      backgroundImage:
                          AssetImage('assets/images/profile_sample.jpg'),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('열백산더 대왕',
                            style: GoogleFonts.pretendard(
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 2),
                        Text('나눔지수 56.8°C 🔥',
                            style: GoogleFonts.pretendard(
                                fontSize: 12, color: Colors.orange)),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00C17C),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text('채팅하기',
                          style: GoogleFonts.pretendard(color: Colors.white)),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text('삼겹살 300g',
                    style: GoogleFonts.pretendard(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('14시간 전',
                    style: GoogleFonts.pretendard(
                        fontSize: 13, color: Colors.black45)),
                const SizedBox(height: 12),
                Text(
                  '삼겹살 오늘 다 먹어요 ㅎㅎ #바베큐하시는분 가져가도 됌~',
                  style: GoogleFonts.pretendard(fontSize: 14),
                ),
                const SizedBox(height: 20),
                Text('나눔장소',
                    style: GoogleFonts.pretendard(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('가산디지털 103동 앞',
                    style: GoogleFonts.pretendard(fontSize: 14)),
                const SizedBox(height: 20),
                Text('요청자 3명',
                    style: GoogleFonts.pretendard(
                        fontSize: 14, color: Colors.black54)),
                const SizedBox(height: 4),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF00C17C)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text('요청자 보기',
                      style: GoogleFonts.pretendard(
                          color: const Color(0xFF00C17C))),
                ),
                const SizedBox(height: 20),
                Text('신고 목록',
                    style: GoogleFonts.pretendard(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('판매자를 신뢰할 수 없어요',
                        style: GoogleFonts.pretendard(fontSize: 13)),
                    Text('신고 2건',
                        style: GoogleFonts.pretendard(
                            fontSize: 13, color: Colors.black45)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C17C),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text('나눔 요청하기',
                  style:
                      GoogleFonts.pretendard(color: Colors.white, fontSize: 16)),
            ),
          )
        ],
      ),
    );
  }
}
