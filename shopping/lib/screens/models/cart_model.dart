import 'dart:convert';

class Cart {
  final int?id;
  final String name;
  final String price;
  final String calories;
  final String vitamins;
  final String additives;
  final String image;

  Cart (
    {
      this.id, required this.name, required this.price, required this.calories, required this.vitamins, required this.additives, required this.image
    }
  );
  factory Cart.fromMap(Map<String, dynamic>json) =>
    Cart(id: json['id'], name: json['name'], price: json['price'], calories: json['calories'], vitamins: json['vitamins'], additives: json['additives'], image: json['image']);

    Map<String, dynamic> toMap() {
      return{
        'ID': id,
        'name': name,
        'price': price,
        'calories': calories,
        'vitamins': vitamins,
        'additives': additives,
        'image': image
      };
    }
}