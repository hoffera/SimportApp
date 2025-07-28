import 'dart:async';

import 'package:flutter/material.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class TestPageView extends StatefulWidget {
  const TestPageView({super.key});

  @override
  State<TestPageView> createState() => _TestPageViewState();
}

class _TestPageViewState extends State<TestPageView> {
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;
  @override
  void initState() {
    super.initState();
  }

  Future<void> _refresh() async {
    await Future<void>.delayed(const Duration(seconds: 3));

    /// When all needed is done change state.
    _controller.sink.add(SwipeRefreshState.hidden);
  }

  @override
  Widget build(BuildContext context) {
    return SwipeRefresh.material(
      stateStream: _stream,
      onRefresh: () {
        _refresh().ignore();
      },
      padding: const EdgeInsets.symmetric(vertical: 10),

      children: [],
    );
  }
}
