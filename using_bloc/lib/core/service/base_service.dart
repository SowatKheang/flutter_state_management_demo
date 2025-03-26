
import '../model/base_model.dart';

abstract class BaseService<T extends BaseModel> {
  
  Future<List<T>> list({required Map<String, dynamic> queryParams, int offset = 0, int limit = 10});
  
  Future<T> getById(int id);
  
  // TODO add more methods here

}