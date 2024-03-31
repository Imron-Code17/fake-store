extension CapitalizeFirstLetter on String {
  String get capitalizeFirstLetter {
    if (isEmpty) {
      return this;
    }
    return toLowerCase().split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      } else {
        return '';
      }
    }).join(' ');
  }
}
