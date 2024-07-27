extension MapExtension on Map<String, bool> {
  bool validate() {
    bool isValid = isNotEmpty;
    final values = this.values.toList();
    for (final item in values) {
      if (!item) {
        isValid = false;
        break;
      }
    }
    return isValid;
  }
}
