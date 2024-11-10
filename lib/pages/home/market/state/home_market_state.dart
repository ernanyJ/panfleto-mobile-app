import 'package:flutter/material.dart';
import 'package:panfleto_app/data/datasource/market_datasource.dart';
import 'package:panfleto_app/data/model/market_model.dart';
import 'package:panfleto_app/enum/loading_state.dart';

class HomeState extends ChangeNotifier {
  List<MarketModel> marketList = [];

  LoadingState _loadingState = LoadingState.loading;
  get loadingState => _loadingState;

  Future<void> getMarkets() async {
    _loadingState = LoadingState.loading;
    notifyListeners();
    final dataSource = MarketDatasource();
    marketList = await dataSource.getMarket();
    _loadingState = LoadingState.loaded;
    notifyListeners();
  }
}
