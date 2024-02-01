import 'package:flutter/material.dart';

class ChatsShopScreen extends StatefulWidget {
  const ChatsShopScreen({super.key});

  @override
  State<ChatsShopScreen> createState() => _ChatsShopScreenState();
}

class _ChatsShopScreenState extends State<ChatsShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CircleAvatar(
        radius: 28.0,
        backgroundColor: Colors.grey,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 24.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
