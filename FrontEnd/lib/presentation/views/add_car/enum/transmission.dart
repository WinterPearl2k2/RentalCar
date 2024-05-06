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
}
