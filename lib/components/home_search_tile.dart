import 'package:flutter/material.dart';
import 'package:hypertrophy_app/constants.dart';
import 'package:hypertrophy_app/components/rounded_button.dart';

class HomeSearchTile extends StatelessWidget {
  const HomeSearchTile({super.key, required this.textFieldOnChanged, required this.searchButtonOnPressed});
  
  final Function(String) textFieldOnChanged;
  final Function() searchButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextField(
            onChanged: textFieldOnChanged,
            decoration: kTextFieldDecoration,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: RoundedButton(
              color: kBrandAccentColor,
              textColor: Colors.white,
              onPressed: searchButtonOnPressed,
              title: 'Search'),
        )
      ],
    );
  }
}
