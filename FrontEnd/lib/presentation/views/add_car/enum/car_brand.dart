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
}
