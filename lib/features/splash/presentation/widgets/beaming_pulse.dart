import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';

class BeamPulse extends StatefulWidget {
  const BeamPulse({super.key});

  @override
  BeamPulseState createState() => BeamPulseState();
}

class BeamPulseState extends State<BeamPulse>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: Icon(
        LucideIcons.activity,
        size: AppIconSizes.lg,
        color: Colors.white.withValues(alpha: 0.6),
      ),
      builder: (context, child) {
        return Opacity(opacity: _animation.value, child: child);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
