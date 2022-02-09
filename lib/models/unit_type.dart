enum UnitType {
  unidade,
  grama,
  kilograma,
}

extension AmountTypeExtension on UnitType {
  String get title {
    switch (this) {
      case UnitType.unidade:
        return "un";
      case UnitType.grama:
        return "g";
      case UnitType.kilograma:
        return "Kg";
      default:
        return "null";
    }
  }

}
