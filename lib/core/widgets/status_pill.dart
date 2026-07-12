import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

/// A compact status badge with a colored dot + label, tinted by [tone]. Used
/// across the operations features (invoice status, payment status, debt status).
class StatusPill extends StatelessWidget {
  const StatusPill({
    super.key,
    required this.label,
    required this.tone,
    this.outlined = false,
  });

  final String label;
  final StatusPillTone tone;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final colors = _toneColors(tone, context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: outlined ? Colors.transparent : colors.bg,
        border: Border.all(color: colors.border, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: colors.dot,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: context.text.labelSmall?.copyWith(
              color: colors.text,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  ({Color bg, Color border, Color text, Color dot}) _toneColors(
    StatusPillTone t,
    BuildContext context,
  ) {
    return switch (t) {
      StatusPillTone.positive => (
        bg: const Color(0xFF10B981).withAlpha(25),
        border: const Color(0xFF10B981).withAlpha(80),
        text: const Color(0xFF047857),
        dot: const Color(0xFF10B981),
      ),
      StatusPillTone.warning => (
        bg: const Color(0xFFF59E0B).withAlpha(25),
        border: const Color(0xFFF59E0B).withAlpha(80),
        text: const Color(0xFFB45309),
        dot: const Color(0xFFF59E0B),
      ),
      StatusPillTone.negative => (
        bg: const Color(0xFFEF4444).withAlpha(25),
        border: const Color(0xFFEF4444).withAlpha(80),
        text: const Color(0xFFB91C1C),
        dot: const Color(0xFFEF4444),
      ),
      StatusPillTone.neutral => (
        bg: context.muted.withAlpha(40),
        border: context.muted.withAlpha(120),
        text: context.colors.onSurface,
        dot: context.muted,
      ),
      StatusPillTone.info => (
        bg: const Color(0xFF3B82F6).withAlpha(25),
        border: const Color(0xFF3B82F6).withAlpha(80),
        text: const Color(0xFF1D4ED8),
        dot: const Color(0xFF3B82F6),
      ),
    };
  }
}

/// Visual tone for a [StatusPill]. Map a domain status to a tone in the
/// feature's helper (e.g. debt `paid` → `positive`, `overdue` → `negative`).
enum StatusPillTone { positive, warning, negative, neutral, info }
