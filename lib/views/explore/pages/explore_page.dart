import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_flutter_app/data/shop/model/groceries_model.dart';
import 'package:restaurant_flutter_app/data/shop/repository/search_groceries_repository.dart';
import 'package:restaurant_flutter_app/views/common_widgets/search_text_field.dart';
import 'package:restaurant_flutter_app/views/explore/widgets/explore_text_view.dart';
import 'package:restaurant_flutter_app/views/explore/widgets/search_item_view.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Color selectedColor = Color(0xff53B175);
  late List<GroceriesModel> _searchGroList = [];
  final _searchGroceriesRepository = SearchGroceriesRepository();

  @override
  void initState() {
    super.initState();
    _searchGroList = _searchGroceriesRepository.getSearchGroceries();
  }

  @override
  Widget build(BuildContext context) {
    Color unselectedColor = Theme.of(context).iconTheme.color ?? Colors.black;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const ExploreTextView(),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(child: SearchTextField()),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: SvgPicture.asset(
                    'assets/svg/fillter.svg',
                    colorFilter: ColorFilter.mode(
                      unselectedColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: _searchGroList.length, 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5, 
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  GroceriesModel data = _searchGroList[index];
                  return SearchItemView(data: data);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
