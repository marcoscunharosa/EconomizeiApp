class AllPlatePartsUnity {
  static final List<UnityOfPlatePart> allUnities = [
    UnityOfPlatePart(
        singular: 'colher de servir', plural: 'colheres de servir'),
    UnityOfPlatePart(singular: 'colher de chá', plural: 'colheres de chá'),
    UnityOfPlatePart(singular: 'colher de sopa', plural: 'colheres de sopa'),
    UnityOfPlatePart(singular: 'colher de sobremesa', plural: 'colheres de sobremesa'),
    UnityOfPlatePart(singular: 'concha', plural: 'conchas'),
    UnityOfPlatePart(singular: 'colher grande', plural: 'colheres grandes'),
    UnityOfPlatePart(singular: 'fatia', plural: 'fatias'),
    UnityOfPlatePart(singular: 'grama', plural: 'gramas'),
    UnityOfPlatePart(singular: 'copo', plural: 'copos'),
    UnityOfPlatePart(singular: 'caneca', plural: 'canecas'),
    UnityOfPlatePart(singular: 'garrafa', plural: 'garrafas'),
    UnityOfPlatePart(singular: 'unidade', plural: 'unidades'),
    UnityOfPlatePart(
        singular: 'pegador de macarrão', plural: 'pegadores de macarrão'),
    UnityOfPlatePart(singular: 'pedaço', plural: 'pedaços'),
    UnityOfPlatePart(singular: 'passada', plural: 'passadas')
  ];

  static UnityOfPlatePart getUnity(String val) {
    var unity = allUnities.firstWhere((element) => element.singular == val);
    return unity;
  }
}

class UnityOfPlatePart {
  String singular, plural;
  UnityOfPlatePart({required this.singular, required this.plural});
}
