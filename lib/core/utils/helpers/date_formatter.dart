/// Date/time formatting helpers for display-only use (no `intl` dependency).
class DateFormatter {
  DateFormatter._();

  /// Returns the date portion `YYYY-MM-DD` of an ISO-8601 string (the part
  /// before `T`). Returns `null` for null/empty input, and the original string
  /// trimmed if it doesn't contain `T`.
  static String? toDateOnly(String? iso) {
    if (iso == null) return null;
    final trimmed = iso.trim();
    if (trimmed.isEmpty) return null;
    final t = trimmed.indexOf('T');
    return t == -1 ? trimmed : trimmed.substring(0, t);
  }
}
