import 'package:flutter/material.dart';

import '../models/cart_manager.dart';
import '../models/models.dart';

class ItemDetails extends StatefulWidget {
  final Item item;
  final CartManager cartManager;
  final Function() quantityUpdated;
  const ItemDetails(
      {super.key,
      required this.item,
      required this.cartManager,
      required this.quantityUpdated});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  Widget _itemImage (){
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        
        height: 200,
        // width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            scale: 3,
            image: NetworkImage(widget.item.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  Widget _mostLikedBadge(ColorScheme colorScheme){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(4),
        child: Text('1st Most Liked'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
  final colorscheme  = Theme.of(context).colorScheme;
    return  Padding(
      padding: EdgeInsets.all(8),
      child: Wrap(
        children: [
          Column(
            children: [
              Text(widget.item.name),
              SizedBox(height: 16,),
              _itemImage(),
              SizedBox(height: 16,),

              _mostLikedBadge(colorscheme),
              SizedBox(height: 16,),

              Text(widget.item.description),
            ],
          )
        ],
      ),
    );
  }
  //  TODO:  Create  Most  Liked  Badge 
//  TODO:  Create  Item  Image 
//  TODO:  Create  Cart  Contro
}
