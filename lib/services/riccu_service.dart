import 'package:dio/dio.dart';

class RiccuService {
  static getRiccu<String>(String riccuId) async {
    
    final dio = Dio();

    try {
      final responsio = await dio.get('https://rickandmortyapi.com/api/characte/$riccuId');


    } catch (e) {

      
    }
    
    }
  }