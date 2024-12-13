import 'package:flutter/material.dart';

class CartControls extends StatefulWidget {
   CartControls({super.key});

  @override
  State<CartControls> createState() => _CartControlsState();
}

class _CartControlsState extends State<CartControls> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    ColorScheme textTheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 100,
          color: Colors.red,
        ),
      ],
    );
  }
  //  TODO:  Build  Minus  Button
  Widget _buildMinusButton(){
    return IconButton(onPressed: () {
      setState(() {
        if (_count > 1) {
          _count++;
        }
      });
    }
      
    , icon: Icon(Icons.remove),
      tooltip: 'Decrease Cart Count',
    );
  }
//  TODO:  Build  Cart  Number
//  TODO:  Build  Plus  Button
//  TODO:  Build  Add  Cart  Button
}
