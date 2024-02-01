import 'package:flutter/material.dart';

import 'chats/chats_shop_screen.dart';

class ChatsBlocScreen extends StatefulWidget {
  const ChatsBlocScreen({super.key});

  @override
  State<ChatsBlocScreen> createState() => _ChatsBlocScreenState();
}

class _ChatsBlocScreenState extends State<ChatsBlocScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Shop",
              ),
              Tab(
                text: "Friend",
              ),
            ],
          ),
          title: const Text('Chat'),
        ),
        body: TabBarView(
          children: [
            const ChatsShopScreen(),
            Container(
              color: Colors.green[100],
            ),
          ],
        ),
      ),
    );
  }
}
