import 'package:panfleto_app/core/base_datasource.dart';
import 'package:panfleto_app/data/model/market_model.dart';

class MarketDatasource extends BaseDataSource {
  final _path = 'market';

  Future<List<MarketModel>> getMarket() async {
    final list = await get(_path) as List;
    return list.map((e) => MarketModel.fromJson(e)).toList();
  }
}
