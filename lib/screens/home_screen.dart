import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/services/api_service.dart';
import 'package:webtoon/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          var webtoon = snapshot.data![index];
          return Webtoon(
            id: webtoon.id,
            title: webtoon.title,
            thumb: webtoon.thumb,
          );
        }),
        separatorBuilder: (context, index) {
          return const SizedBox(width: 40);
        },
        itemCount: snapshot.data!.length);
  }
}
