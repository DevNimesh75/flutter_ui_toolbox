import 'package:flutter/material.dart';
import 'package:flutter_ui_toolbox/flutter_ui_toolbox.dart';

class AnimatedListViewExample extends StatelessWidget {
  const AnimatedListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedListView(
        itemCount: 20,
        itemBuilder: (_, index) {
          return const Padding(
            padding: EdgeInsets.all(30),
            child: Text('hello'),
          );
        },
        onNextPage: () {
          log('Call your next page data');
        },
        onSwipeRefresh: () async {
          return await 1.secondsDelay;
        },
      ),
    );
  }
}
