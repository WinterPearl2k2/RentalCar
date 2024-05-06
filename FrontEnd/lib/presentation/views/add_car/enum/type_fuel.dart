enum TypeFuel {
  dieselFuel,
  gasFuel,
  hybridFuel,
  electricFuel
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
}
