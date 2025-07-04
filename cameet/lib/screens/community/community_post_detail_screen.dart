
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityPostDetailScreen extends StatelessWidget {
  const CommunityPostDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        title: Text('맛집',
            style: GoogleFonts.pretendard(
                fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필 정보
            Row(
              children: [
                const CircleAvatar(radius: 18, backgroundImage: AssetImage('assets/images/user_sample.jpg')),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('제주잇',
                        style: GoogleFonts.pretendard(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 2),
                    Text('1시간 전',
                        style: GoogleFonts.pretendard(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.favorite_border, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text('4', style: GoogleFonts.pretendard(fontSize: 12)),
                const SizedBox(width: 12),
                const Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text('9', style: GoogleFonts.pretendard(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 20),
            // 제목 + 내용
            Text('제주 갈치와 해산물 소노벨 제주맛집',
                style: GoogleFonts.pretendard(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            Text(
              '얼마 전 제주도에서 글램핑 일정을 소화하고 급히 찾은 해산물 맛집이에요~ '
              '제가 먹은 거는 통갈치 조림, 통갈치구이, 전복버터구이, 간장게장, 돌솥밥, 해물뚝배기 등 '
              '제주 로컬 식재료를 이용해 영양가 높은 별미만 쏙쏙 골라 먹었어요~ 정말 맛있었습니다!',
              style: GoogleFonts.pretendard(fontSize: 14),
            ),
            const SizedBox(height: 12),
            // 이미지 썸네일
            Row(
              children: [
                Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('assets/images/food1.jpg', height: 100, fit: BoxFit.cover))),
                const SizedBox(width: 8),
                Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('assets/images/food2.jpg', height: 100, fit: BoxFit.cover))),
                const SizedBox(width: 8),
                Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('assets/images/food3.jpg', height: 100, fit: BoxFit.cover))),
              ],
            ),
            const SizedBox(height: 12),
            // 해시태그
            Wrap(
              spacing: 8,
              children: [
                _buildTag('#맛집'),
                _buildTag('#부산'),
                _buildTag('#로컬맛'),
              ],
            ),
            const SizedBox(height: 16),
            // 좋아요 버튼
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border, color: Color(0xFF00C17C)),
                  label: Text('좋아요 1',
                      style: GoogleFonts.pretendard(color: Color(0xFF00C17C))),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF00C17C)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Text('댓글 0',
                style: GoogleFonts.pretendard(
                    fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: '댓글을 입력하세요',
                hintStyle: GoogleFonts.pretendard(),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: GoogleFonts.pretendard(fontSize: 13)),
    );
  }
}
