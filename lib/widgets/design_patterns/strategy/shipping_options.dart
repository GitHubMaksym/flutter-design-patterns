import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../design_patterns/strategy/ishipping_costs_strategy.dart';

class ShippingOptions extends StatelessWidget {
  final List<IShippingCostsStrategy> shippingOptions;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const ShippingOptions({
    @required this.shippingOptions,
    @required this.selectedIndex,
    @required this.onChanged,
  })  : assert(shippingOptions != null),
        assert(selectedIndex != null),
        assert(onChanged != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select shipping type:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            for (var i = 0; i < shippingOptions.length; i++)
              RadioListTile<int>(
                title: Text(shippingOptions[i].label),
                value: i,
                groupValue: selectedIndex,
                onChanged: onChanged,
                dense: true,
                activeColor: Colors.black,
              ),
          ],
        ),
      ),
    );
  }
}
