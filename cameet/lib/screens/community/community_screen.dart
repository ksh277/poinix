
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = ['맛집', '꿀팁'];

  final List<Map<String, dynamic>> samplePosts = [
    {
      'image': 'assets/images/food1.jpg',
      'title': '제주 갈치와 해산물 소노벨 제...',
      'desc': '얼마 전 제주도에서 급캠핑 일정을 소화하고 급히 찾은 해산물 맛집이에...',
      'likes': 4,
      'comments': 9,
      'views': 0,
      'time': '1시간 전'
    },
    {
      'image': 'assets/images/food2.jpg',
      'title': '동해 맛집이 확실한 집',
      'desc': '동해에서 캠핑하고 다음날 목호에 있는 네이버 맛집 거동뚝배기 대박...',
      'likes': 17,
      'comments': 21,
      'views': 4,
      'time': '1시간 전'
    },
    {
      'image': 'assets/images/tip1.jpg',
      'title': '캠핑 처음인데 꿀팁 부탁드립니다',
      'desc': '처음이라 막 2일간 자다오라구요 캠핑고수님들 좋은 꿀팁있으면 부탁드...',
      'likes': 12,
      'comments': 3,
      'views': 8,
      'time': '2시간 전'
    },
    {
      'image': 'assets/images/tip2.jpg',
      'title': '강아지랑 캠핑 가보신 분?',
      'desc': '저희는 강아지랑 처음이네 캠핑하면서 주의점 공유해요~',
      'likes': 7,
      'comments': 2,
      'views': 1,
      'time': '2시간 전'
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: '검색',
            hintStyle: GoogleFonts.pretendard(color: Colors.white70),
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            filled: true,
            fillColor: Colors.transparent,
            border: InputBorder.none,
          ),
          style: GoogleFonts.pretendard(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline)),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          indicatorColor: Colors.white,
          tabs: tabs.map((t) => Tab(text: t)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPostList(samplePosts.sublist(0, 2)),
          _buildPostList(samplePosts.sublist(2)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00C17C),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: '물물교환'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '나눔/받음'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, size: 42), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '커뮤니티'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '내 정보'),
        ],
      ),
    );
  }

  Widget _buildPostList(List<Map<String, dynamic>> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    post['image'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post['title'],
                          style: GoogleFonts.pretendard(
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 4),
                      Text(post['desc'],
                          style: GoogleFonts.pretendard(
                              fontSize: 13, color: Colors.black54),
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.favorite_border,
                              size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text('${post['likes']}',
                              style: GoogleFonts.pretendard(fontSize: 12)),
                          const SizedBox(width: 12),
                          Icon(Icons.chat_bubble_outline,
                              size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text('${post['comments']}',
                              style: GoogleFonts.pretendard(fontSize: 12)),
                          const SizedBox(width: 12),
                          Icon(Icons.remove_red_eye,
                              size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text('${post['views']}',
                              style: GoogleFonts.pretendard(fontSize: 12)),
                          const Spacer(),
                          Text(post['time'],
                              style: GoogleFonts.pretendard(
                                  fontSize: 11, color: Colors.black45)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
