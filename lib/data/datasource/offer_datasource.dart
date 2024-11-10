import 'package:panfleto_app/core/base_datasource.dart';
import 'package:panfleto_app/data/model/offer_model.dart';

class OfferDatasource extends BaseDataSource {
  final _path = 'offer';

  Future<List<OfferModel>> getOffer() async {
    final list = await get(_path) as List;
    return list.map((e) => OfferModel.fromJson(e)).toList();
  }
}
