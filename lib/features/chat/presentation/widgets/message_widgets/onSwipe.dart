import 'package:flutter/material.dart';
/*
class SwipeTo extends StatefulWidget {
  final Widget child;
  final VoidCallback onRightSwipe;

  SwipeTo({required this.child, required this.onRightSwipe});

  @override
  _SwipeToState createState() => _SwipeToState();
}

class _SwipeToState extends State<SwipeTo> {
  late Offset _initialSwipeOffset;
  late Offset _currentSwipeOffset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _handleSwipeStart,
      onHorizontalDragUpdate: _handleSwipeUpdate,
      onHorizontalDragEnd: _handleSwipeEnd,
      child: widget.child,
    );
  }

  void _handleSwipeStart(DragStartDetails details) {
    _initialSwipeOffset = details.localPosition;
    _currentSwipeOffset = _initialSwipeOffset;
  }

  void _handleSwipeUpdate(DragUpdateDetails details) {
    setState(() {
      _currentSwipeOffset = details.localPosition;
    });
  }

  void _handleSwipeEnd(DragEndDetails details) {
    if (_currentSwipeOffset.dx - _initialSwipeOffset.dx > 50) {
      // Right swipe threshold reached, trigger onRightSwipe callback
      widget.onRightSwipe();
    }
  }
}
*/