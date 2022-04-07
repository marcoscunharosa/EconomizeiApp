import 'package:economizei_app/models/plate_part.dart';

class PlateTemplate {
  String? name;
  List<String> daysOfConsuming;
  late List<PlatePart> plateParts;

  PlateTemplate({this.name, required this.daysOfConsuming}) {
    plateParts = [];
  }
}
