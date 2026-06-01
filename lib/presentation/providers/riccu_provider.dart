
import 'package:flu_avm/config/config.dart';
import 'package:flu_avm/services/riccu_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final riccuProvider = FutureProvider.family<Riccu, String>((ref, id) async {

  final (riccu, error) = await RiccuService.getRiccu(id);

  if (riccu != null) return riccu;

  throw Exception(error);
});