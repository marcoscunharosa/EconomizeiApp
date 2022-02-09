enum ProductType{
  bebidas,
  ingredientes,
  utensilios,
  panificacao,
  laticinio,
  hortifruti,
  graos,
  proteinas, 
  enlatados,
  molhos,
  temperos,
  massas,
  doces,
  congelados
}
extension ProductTypeExtension on ProductType{
  String get name {
    switch(this){
      case ProductType.bebidas:
        return "Bebidas";
      case ProductType.ingredientes:
        return "Ingredientes";
      case ProductType.utensilios:
        return "Utensílios";
      case ProductType.panificacao:
        return "Panificação";
      case ProductType.laticinio:
        return "Laticínios";
      case ProductType.hortifruti:
        return "Hortifruti";
      case ProductType.graos:
        return "Grãos e Cereais";
      case ProductType.proteinas:
        return "Carnes e aves";
      case ProductType.enlatados:
        return "Enlatados";
      case ProductType.molhos:
        return "Molhos";
      case ProductType.temperos:
        return "Temperos";
      case ProductType.massas:
        return "Massas";
      case ProductType.doces:
        return "Doces e Guloseimas";
      case ProductType.congelados:
        return "Congelados";
    }
  }
}