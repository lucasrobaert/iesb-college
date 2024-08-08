extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  int toInt({int defaultValue = 0}) {
    return int.tryParse(this) ?? defaultValue;
  }

  double toDouble({double defaultValue = 0}) {
    return double.tryParse(this) ?? defaultValue;
  }
}
