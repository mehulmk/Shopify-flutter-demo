extension IntExtension on int {
  String toDateSuffix() {
    String suffix = 'th';
    final int digit = this % 10;
    if ((digit > 0 && digit < 4) && (this < 11 || this > 13)) {
      suffix = <String>['st', 'nd', 'rd'][digit - 1];
    }
    return suffix;
  }
}
