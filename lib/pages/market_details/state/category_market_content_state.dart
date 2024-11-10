import 'package:flutter/material.dart';
import 'package:panfleto_app/data/datasource/offer_datasource.dart';
import 'package:panfleto_app/data/datasource/product_datasource.dart';
import 'package:panfleto_app/data/model/unique_product_model.dart';
import 'package:panfleto_app/enum/loading_state.dart';

class CategoryMarketContentState extends ChangeNotifier {
  void init(int? marketId) {
    if (marketId != null) {
      getProductsByMarket(marketId);
    }
  }

  List<Object> contents = [];
  List<UniqueProductModel> products = [];
  LoadingState _loadingState = LoadingState.loaded;
  LoadingState get loadingState => _loadingState;

  void getOffers() async {
    _loadingState = LoadingState.loading;
    notifyListeners();
    contents += await OfferDatasource().getOffer();
    notifyListeners();
    _loadingState = LoadingState.loaded;
  }

  void getProductsByMarket(int marketId) async {
    _loadingState = LoadingState.loading;
    notifyListeners();
    products += await UniqueProductDatasource().getProductsByMarket(marketId);
    notifyListeners();
    _loadingState = LoadingState.loaded;
  }
}
