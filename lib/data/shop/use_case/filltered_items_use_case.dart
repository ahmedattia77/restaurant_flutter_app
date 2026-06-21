import 'package:restaurant_flutter_app/data/shop/model/groceries_model.dart';
import 'package:restaurant_flutter_app/data/shop/repository/explore_groceries_repository.dart';

class FillteredItemsUseCase {
  ExploreGroceriesRepository exploreReo;
  FillteredItemsUseCase({required this.exploreReo});

  List<GroceriesModel> _getGroceries() => exploreReo.getSearchGroceries();

  List<GroceriesModel> fillteredItems(String searchQuery) {
    List<GroceriesModel> result = _getGroceries();
    return searchQuery.isEmpty
        ? result
        : result
              .where(
                (item) => item.title.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ),
              )
              .toList();
  }
}
