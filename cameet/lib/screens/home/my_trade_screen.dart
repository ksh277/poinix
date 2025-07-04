
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTradeScreen extends StatefulWidget {
  const MyTradeScreen({super.key});

  @override
  State<MyTradeScreen> createState() => _MyTradeScreenState();
}

class _MyTradeScreenState extends State<MyTradeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tradeItems = [
    {
      'image': 'assets/images/lettuce.jpg',
      'title': '쌈 채소',
      'location': '오토캠핑 203호',
      'category': '음식',
      'user': '알렉곰아',
      'status': '거래중',
      'likes': 301
    }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        elevation: 0,
        title: Text('나의 거래',
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
          unselectedLabelColor: Colors.white60,
          tabs: const [
            Tab(text: '거래중'),
            Tab(text: '거래완료'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTradeList(tradeItems),
          Center(child: Text('거래완료 항목 없음')),
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

  Widget _buildTradeList(List<Map<String, dynamic>> items) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16)),
                child: Image.asset(
                  item['image'],
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title'],
                          style: GoogleFonts.pretendard(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 2),
                      Text(item['location'],
                          style: GoogleFonts.pretendard(
                              fontSize: 12, color: Colors.black54)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5F9EE),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(item['category'],
                                style: GoogleFonts.pretendard(
                                    fontSize: 12, color: const Color(0xFF00C17C))),
                          ),
                          const SizedBox(width: 6),
                          Text(item['user'],
                              style: GoogleFonts.pretendard(
                                  fontSize: 12, color: Colors.black45)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    if (item['status'] == '거래중')
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('거래중',
                            style: GoogleFonts.pretendard(
                                color: Colors.orange, fontSize: 11)),
                      ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.favorite, size: 14, color: Colors.green),
                        const SizedBox(width: 2),
                        Text('${item['likes']}',
                            style: GoogleFonts.pretendard(fontSize: 12)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
