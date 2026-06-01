import 'package:flu_avm/config/config.dart';
import 'package:flu_avm/models/rickapi_responsio.dart';

class RiccuMapper {

  static Riccu rickApiRiccuToEntity( Map<String, dynamic> json) {
    final result = Result.fromJson(json);

    return Riccu(
      id: result.id,
      nomen: result.name,
      status: statusValues.reverse[result.status] ?? 'unknown',
      origio: result.origin.name,
      faciemImaginem: result.image,
      
    );
  }
}