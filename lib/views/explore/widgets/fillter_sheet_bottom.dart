import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/views/common_widgets/app_button.dart';
import 'package:restaurant_flutter_app/views/explore/widgets/filtter_icon.dart';

class FillterSheetBottom extends StatefulWidget {
  final VoidCallback filterOnClick;
  const FillterSheetBottom({super.key ,required this.filterOnClick});

  @override
  State<FillterSheetBottom> createState() => _FillterSheetBottomState();
}

class _FillterSheetBottomState extends State<FillterSheetBottom> {
  final Map<String, bool> _categories = {
    'Eggs': false,
    'Noodles & Pasta': false,
    'Chips & Crisps': false,
    'Fast Food': false,
  };

  final Map<String, bool> _brands = {
    'Individual Callection': false,
    'Cocola': false,
    'Ifad': false,
    'Kazi Farmas': false,
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        builder: (context) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.80,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),
                  StatefulBuilder(
                    builder: (context, setSheetState) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _categories.keys.map((key) {
                        return CheckboxListTile(
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          contentPadding: EdgeInsets.zero,
                          title: Text(key),
                          value: _categories[key],
                          checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          activeColor: const Color(0xff53B175),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            setSheetState(() {
                              _categories[key] = value ?? false;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    'Brands',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),

                  StatefulBuilder(
                    builder: (context, setSheetState) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _brands.keys.map((key) {
                        return CheckboxListTile(
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          contentPadding: EdgeInsets.zero,
                          title: Text(key),
                          value: _brands[key],
                          checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          activeColor: const Color(0xff53B175),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            setSheetState(() {
                              _brands[key] = value ?? false;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20,),
                  AppBotton(text: 'Apply Filter', onPressed: () {
                    Navigator.pop(context);
                    widget.filterOnClick();
                  },)
                ],
              ),
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: FiltterIcon(),
      ),
    );
  }
}
