
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WriteHistoryScreen extends StatefulWidget {
  const WriteHistoryScreen({super.key});

  @override
  State<WriteHistoryScreen> createState() => _WriteHistoryScreenState();
}

class _WriteHistoryScreenState extends State<WriteHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> posts = [
    {
      'image': 'assets/images/food2.jpg',
      'title': '동해 맛집이 확실한 집',
      'desc': '동해에서 캠핑하고 다음날 목호에 있는 웨이팅 맛집 거통닭수육에 대...',
      'likes': 17,
      'comments': 24,
      'views': 214,
      'time': '1시간 전',
    },
    {
      'image': 'assets/images/dog.jpg',
      'title': '강아지랑 캠핑 가보신 분??',
      'desc': '강아지랑 캠핑은 처음인데 준비할게...',
      'likes': 24,
      'comments': 8,
      'views': 435,
      'time': '2시간 전',
    }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        title: Text('작성 기록',
            style: GoogleFonts.pretendard(
                fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.white))
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs: const [
            Tab(text: '작성한 글'),
            Tab(text: '댓글단 글'),
            Tab(text: '좋아한 글'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPostList(),
          Center(child: Text('댓글단 글 없음')),
          Center(child: Text('좋아요한 글 없음')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00C17C),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: '물물교환'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '나눔/받음'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 42), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '커뮤니티'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '내 정보'),
        ],
      ),
    );
  }

  Widget _buildPostList() {
    return ListView.builder(
      itemCount: posts.length,
      padding: const EdgeInsets.only(top: 12),
      itemBuilder: (context, index) {
        final post = posts[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(post['image'],
                      width: 80, height: 80, fit: BoxFit.cover),
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
                          const Icon(Icons.thumb_up_off_alt,
                              size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text('${post['likes']}',
                              style: GoogleFonts.pretendard(fontSize: 12)),
                          const SizedBox(width: 12),
                          const Icon(Icons.comment_outlined,
                              size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text('${post['comments']}',
                              style: GoogleFonts.pretendard(fontSize: 12)),
                          const SizedBox(width: 12),
                          const Icon(Icons.remove_red_eye,
                              size: 14, color: Colors.grey),
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
