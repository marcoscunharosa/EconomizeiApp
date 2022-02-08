enum AmountType {
  unidade,
  grama,
  kilograma,
}

extension AmountTypeExtension on AmountType {
  String get title {
    switch (this) {
      case AmountType.unidade:
        return "un";
      case AmountType.grama:
        return "g";
      case AmountType.kilograma:
        return "Kg";
      default:
        return "null";
    }
  }

}
