enum Transmission {
  automatic,
  manual,
}

extension TransmissionExtension on Transmission {
  String get transmissionName {
    switch (this) {
      case Transmission.automatic:
        return 'Automatic';
      case Transmission.manual:
        return 'Manual';
      default:
        return '';
    }
  }

  static Transmission fromString(String value) {
    switch (value.toLowerCase()) {
      case 'automatic':
        return Transmission.automatic;
      case 'manual':
        return Transmission.manual;
      default:
        throw ArgumentError('Invalid value: $value');
    }
  }
}
