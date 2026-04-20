import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/splash/presentation/widgets/pill_container.dart';

class BouncingPill extends StatefulWidget {
  const BouncingPill({super.key});

  @override
  BouncingPillState createState() => BouncingPillState();
}

class BouncingPillState extends State<BouncingPill>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 750),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0,
      end: -20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: const PillContainer(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
