extension ThousandSeparatorExtension on String {
  String get convertPrice {
    return replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},');
  }
}
