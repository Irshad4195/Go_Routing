import 'package:flutter/material.dart';

class SwipeDirectionDetector extends StatefulWidget {
  const SwipeDirectionDetector(
      {super.key, required this.children, required this.onSwipe, required this.onDoubleTap});

  final Widget children;
  final VoidCallback onSwipe;
  final VoidCallback onDoubleTap;

  @override
  State<SwipeDirectionDetector> createState() => _SwipeDirectionDetectorState();
}

class _SwipeDirectionDetectorState extends State<SwipeDirectionDetector> {
  DragStartDetails? startVerticalDragDetails;
  DragUpdateDetails? updateVerticalDragDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (details) {
        startVerticalDragDetails = details;
      },
      onVerticalDragUpdate: (details) {
        updateVerticalDragDetails = details;
      },
      onVerticalDragEnd: (details) {
        final dx = updateVerticalDragDetails!.globalPosition.dx -
            startVerticalDragDetails!.globalPosition.dx;
        final dy = updateVerticalDragDetails!.globalPosition.dy -
            startVerticalDragDetails!.globalPosition.dy;

        if (dx.abs() < dy.abs()) {
          if (dy < 0 && dy.abs() > 50) {
            widget.onSwipe();
          } else if (dy > 0 && dy.abs() > 50) {
            widget.onSwipe();
          }
        }
      },
      onTap: () {},
      onDoubleTap: widget.onDoubleTap,
      child: widget.children,
    );
  }
}
