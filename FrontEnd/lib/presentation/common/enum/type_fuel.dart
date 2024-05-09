enum TypeFuel {
  dieselFuel,
  gasFuel,
  hybridFuel,
  electricFuel,
}

extension TypeFuelExtension on TypeFuel {
  String get fuelName {
    switch (this) {
      case TypeFuel.dieselFuel:
        return 'Diesel';
      case TypeFuel.gasFuel:
        return 'Gas';
      case TypeFuel.hybridFuel:
        return 'Hybrid';
      case TypeFuel.electricFuel:
        return 'Electric';
      default:
        return '';
    }
  }
  static TypeFuel fromString(String value) {
    switch (value.toLowerCase()) {
      case 'diesel':
        return TypeFuel.dieselFuel;
      case 'gas':
        return TypeFuel.gasFuel;
      case 'hybrid':
        return TypeFuel.hybridFuel;
      case 'electric':
        return TypeFuel.electricFuel;
      default:
        throw ArgumentError('Invalid value: $value');
    }
  }
}

