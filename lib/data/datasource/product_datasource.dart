import 'package:panfleto_app/core/base_datasource.dart';
import 'package:panfleto_app/data/model/unique_product_model.dart';

class UniqueProductDatasource extends BaseDataSource {
  
  final _path = 'uniqueproduct';

  Future<List<UniqueProductModel>> getProductsByMarket(int marketId) async {
    final list = await get('$_path/market/$marketId') as List;
    return list.map((e) => UniqueProductModel.fromJson(e)).toList();
  }

}