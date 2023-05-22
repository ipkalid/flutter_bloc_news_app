import 'dart:ui';

extension StringExtensions on String {
  Color toColor() {
    var hash = 0;
    for (var i = 0; i < length; i++) {
      hash = codeUnitAt(i) + ((hash << 5) - hash);
    }
    String c = (hash & 0x00FFFFFF).toRadixString(16).toUpperCase();
    String hex = "FF00000".substring(0, 8 - c.length) + c;
    int colorHashedValue = int.parse(hex, radix: 16);
    return Color(colorHashedValue);
  }

  String get getInitials => isNotEmpty
      ? trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
      : '';
}
