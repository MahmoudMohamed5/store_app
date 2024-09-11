import 'package:store_app/helper/api.dart';

class GetAllCategoriesService {
  Future<dynamic> getAllCategories() async {
    List<dynamic> data = await Api().get('https://fakestoreapi.com/products/categories');
    return data;
  }
}