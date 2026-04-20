import 'package:flutter/material.dart';

class JumpingDots extends StatefulWidget {
  const JumpingDots({super.key});

  @override
  JumpingDotsState createState() => JumpingDotsState();
}

class JumpingDotsState extends State<JumpingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.6),
              shape: BoxShape.circle,
            ),
          ),
          builder: (context, child) {
            final delay = index * 0.2;
            final value = (_controller.value - delay) % 1.0;
            final offset = -10 * (0.5 - (value - 0.5).abs()) * 2;

            return Transform.translate(offset: Offset(0, offset), child: child);
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
