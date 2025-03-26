

import 'package:using_bloc/core/model/base_model.dart';
import '../service/base_service.dart';

abstract class BaseRepository<S extends BaseService, T extends BaseModel> {

  Future<List<T>> getList({Map<String, dynamic>? queryParams});


}