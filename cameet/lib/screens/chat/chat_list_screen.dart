
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> chats = [
    {
      'title': '캠핑전국',
      'time': '08:20',
      'lastMessage': '안녕하세요 이 물건 너무 마음에 드...',
      'thumbnail': 'assets/images/item1.jpg',
      'badge': 1,
      'status': ''
    },
    {
      'title': '캠핑중독자',
      'time': '방금',
      'lastMessage': '물 2개랑 소주 1병은 가능해요.',
      'thumbnail': 'assets/images/item2.jpg',
      'badge': 2,
      'status': ''
    },
    {
      'title': '삼천포',
      'time': '어제',
      'lastMessage': '주목주목!!!! 당장 물건을 내놓지 않...',
      'thumbnail': 'assets/images/item3.jpg',
      'badge': 0,
      'status': '거래완료'
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text('채팅',
            style: GoogleFonts.pretendard(
                color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text('전체',
                  style: GoogleFonts.pretendard(color: Colors.grey)))
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color(0xFF00C17C),
          tabs: const [
            Tab(text: '물물교환'),
            Tab(text: '나눔/받음'),
            Tab(text: '커뮤니티'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildChatList(chats),
          _buildChatList([chats[0], chats[2]]),
          _buildChatList([]),
        ],
      ),
    );
  }

  Widget _buildChatList(List<Map<String, dynamic>> chatList) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final chat = chatList[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: const AssetImage('assets/images/profile_sample.jpg'),
            radius: 24,
          ),
          title: Row(
            children: [
              Text(chat['title'],
                  style: GoogleFonts.pretendard(fontWeight: FontWeight.w500)),
              const Spacer(),
              Text(chat['time'],
                  style: GoogleFonts.pretendard(
                      fontSize: 12, color: Colors.grey)),
            ],
          ),
          subtitle: Text(chat['lastMessage'],
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.pretendard(fontSize: 13)),
          trailing: chat['status'] == '거래완료'
              ? Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E0E0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('거래완료',
                      style: GoogleFonts.pretendard(fontSize: 11)),
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(chat['thumbnail'],
                          width: 48, height: 48, fit: BoxFit.cover),
                    ),
                    if (chat['badge'] > 0)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFF6B00),
                          ),
                          child: Text('${chat['badge']}',
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.white)),
                        ),
                      )
                  ],
                ),
        );
      },
    );
  }
}
