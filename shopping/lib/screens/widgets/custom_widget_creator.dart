import 'package:flutter/material.dart';

import '../../helpers/database_helper.dart';
import '../models/cart_model.dart';


class CustomItem extends StatefulWidget {
  final Cart cart;

  CustomItem({Key? key, required this.cart}) : super(key: key);

  @override
  State<CustomItem> createState() => _CustomItemState();
}

class _CustomItemState extends State<CustomItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: 
      Text('Name: ${widget.cart.name} | price: ${widget.cart.price} | calories: ${widget.cart.calories} | vitamins: ${widget.cart.vitamins} | additives: ${widget.cart.additives}'),
        onLongPress: () {
          DatabaseHelper.inst.delete(widget.cart.id!);
          setState(() {
                                
          });
        },
      );
  }
}