enum CarBrands { toyota, honda, ford, other }

extension CarBrandExtension on CarBrands {
  String get brandName {
    switch (this) {
      case CarBrands.toyota:
        return 'Toyota';
      case CarBrands.honda:
        return 'Honda';
      case CarBrands.ford:
        return 'Ford';
      case CarBrands.other:
        return 'Other';
      default:
        return '';
    }
  }

  static CarBrands fromString(String value) {
    switch (value.toLowerCase()) {
      case 'toyota':
        return CarBrands.toyota;
      case 'honda':
        return CarBrands.honda;
      case 'ford':
        return CarBrands.ford;
      case 'other':
        return CarBrands.other;
      default:
        throw ArgumentError('Invalid value: $value');
    }
  }
}
