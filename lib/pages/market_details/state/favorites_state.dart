import 'package:flutter/material.dart';
import 'package:panfleto_app/core/persistence_service.dart';
import 'package:panfleto_app/enum/loading_state.dart';

class FavoritesState extends ChangeNotifier {
  LoadingState loadingState = LoadingState.loading;

  void init() async {
    loadingState = LoadingState.loading;
    notifyListeners();
    favoriteOffers = await PersistenceService.getFavoriteOffers();
    loadingState = LoadingState.loaded;
    notifyListeners();
  }

  List<String> favoriteOffers = [];

  void addFavoriteOffer(String offerId) {
    PersistenceService.saveFavoriteOffer(offerId);
    favoriteOffers.add(offerId);
    notifyListeners();
  }

  void removeFavoriteOffer(String offerId) {
    PersistenceService.removeFavoriteOffer(offerId);
    favoriteOffers.remove(offerId);
    notifyListeners();
  }

  bool isFavoriteOffer(String offerId) {
    return favoriteOffers.contains(offerId);
  }
}
