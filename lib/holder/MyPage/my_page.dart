import 'package:flutter/material.dart';

import '../../components/custom_app_bar.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(micon: Icons.home),
        body: MyPageBody(),
      ),
    );
  }
}

class MyPageBody extends StatelessWidget {
  const MyPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverPersistentHeader(delegate: TabBarDelegate(), pinned: true)
        ];
      },
      body: TabBarView(
        children: [
          ScreenA(),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 2,
              crossAxisCount: 1,
              mainAxisSpacing: 2,
            ),
            itemCount: 42,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 2 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      "https://picsum.photos/id/${index + 1}/400/400",
                      fit: BoxFit.cover),
                ),
              );
            },
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 2,
              crossAxisCount: 1,
              mainAxisSpacing: 2,
            ),
            itemCount: 42,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 2 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      "https://picsum.photos/id/${index + 1}/400/400",
                      fit: BoxFit.cover),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 300,
            color: Colors.greenAccent,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 40,
            (context, index) {
              return Container(
                height: 40,
                // 보는 재미를 위해 인덱스에 아무 숫자나 곱한 뒤 255로
                // 나눠 다른 색이 보이도록 함.
                color: Color.fromRGBO(
                    (index * 45) % 255, (index * 70) % 255, (index * 25), 1.0),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return TabBar(
      tabs: [
        Tab(
          icon: Icon(Icons.grid_on),
        ),
        Tab(
          icon: Icon(Icons.meeting_room),
        )
      ],
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
