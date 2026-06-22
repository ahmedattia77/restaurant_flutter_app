import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/terms_and_privacy_idget.dart';
import 'package:restaurant_flutter_app/views/common_widgets/app_button.dart';

class CartBottomSheet {
  static void show(
    BuildContext context, {
    required VoidCallback placeholderCallBack,
    required VoidCallback closeSheetCallBack,
  }) {
    const TextStyle _textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    final Map<String, Widget> _listTitleData = {
      'Delivery': Text('Select Method', style: _textStyle),
      'Payment': SvgPicture.asset('assets/svg/pay.svg', height: 25, width: 25),
      'Promo Code': Text('Pick discount', style: _textStyle),
      'Total Cost': Text('\$13.97', style: _textStyle),
    };

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.60,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () => closeSheetCallBack(),
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _listTitleData.keys.map((key) {
                    return ListTile(
                      shape: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).dividerColor,
                          width: 0.2,
                        ),
                      ),
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        key,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _listTitleData[key]!,
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                TermsAndPrivacyWidget(),
                const SizedBox(height: 20),
                AppBotton(
                  text: 'Place Order',
                  onPressed: () => placeholderCallBack(),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
