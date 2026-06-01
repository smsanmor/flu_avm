import 'package:dio/dio.dart';
import 'package:flu_avm/mappers/riccu_mapper.dart';

class RiccuService {
  static getRiccu<String>(String riccuId) async {
    
    final dio = Dio();

    try {
      final responsio = await dio.get('https://rickandmortyapi.com/api/characte/$riccuId');

      final riccu = RiccuMapper.rickApiRiccuToEntity(responsio.data);

      return (riccu, 'Data obtenida correctamente');

    } catch (e) {

      return (null, 'No se pudo obtener el Rick');

    }
    
    }
  }