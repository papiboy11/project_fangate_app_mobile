import 'package:flutter/material.dart';
import 'dart:async';

class DelaiAnimation extends StatefulWidget {
  final Widget child;
  final int delay; // Ensure delay is an int

  const DelaiAnimation({
    super.key, // Use super parameter for 'key'
    required this.child,
    required this.delay,
  });

  @override
  State<DelaiAnimation> createState() => _DelaiAnimationState();
}

class _DelaiAnimationState extends State<DelaiAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );

    _animOffset = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
