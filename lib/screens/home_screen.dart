import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10, // 그림자 흐림 정도
                offset: const Offset(0, 2), // 그림자 위치 조정
              ),
            ],
          ),
          child: AppBar(
            elevation: 0.0,
            title: const Center(
              child: Text(
                "Today's 툰s",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            foregroundColor: Colors.green,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
