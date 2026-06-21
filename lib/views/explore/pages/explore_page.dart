import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_flutter_app/data/shop/model/groceries_model.dart';
import 'package:restaurant_flutter_app/data/shop/repository/explore_groceries_repository.dart';
import 'package:restaurant_flutter_app/data/shop/use_case/filltered_items_use_case.dart';
import 'package:restaurant_flutter_app/views/common_widgets/search_text_field.dart';
import 'package:restaurant_flutter_app/views/explore/widgets/explore_text_view.dart';
import 'package:restaurant_flutter_app/views/explore/widgets/fillter_sheet_bottom.dart';
import 'package:restaurant_flutter_app/views/explore/widgets/filtter_icon.dart';
import 'package:restaurant_flutter_app/views/explore/widgets/search_item_view.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Color selectedColor = Color(0xff53B175);
  late List<GroceriesModel> _exploreGroList = [];
  final _exploreGroceriesRepository = ExploreGroceriesRepository();
  late final FillteredItemsUseCase _fillteredGroceriesUseCase;

  List<GroceriesModel> _filteredGroList = [];

  @override
  void initState() {
    super.initState();
    _exploreGroList = _exploreGroceriesRepository.getSearchGroceries();
    _fillteredGroceriesUseCase = FillteredItemsUseCase(
      exploreReo: _exploreGroceriesRepository,
    );
    _filteredGroList = _exploreGroList;
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const ExploreTextView(),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                    onChanged: (searchQuery) {
                      setState(() {
                        _filteredGroList = _fillteredGroceriesUseCase
                            .fillteredItems(searchQuery);
                      });
                    },
                  ),
                ),
                FillterSheetBottom(),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: _filteredGroList.isEmpty
                  ? const Center(child: Text("No products found!"))
                  : GridView.builder(
                      itemCount: _filteredGroList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.85,
                          ),
                      itemBuilder: (context, index) {
                        GroceriesModel data = _filteredGroList[index];
                        return InkWell(
                          onTap: () {},
                          child: SearchItemView(data: data),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
