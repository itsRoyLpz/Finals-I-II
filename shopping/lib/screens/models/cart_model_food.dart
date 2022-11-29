//AQUÍ SE PIDE LA BASE DE DATOS
import 'dart:convert';

class Food {
  final int?id;
  final String name;
  final String price;
  final String brand;
  final String image;

  Food (
    {
      this.id, required this.name, required this.price, required this.brand, required this.image
    }
  );
  factory Food.fromMap(Map<String, dynamic>json) =>
    Food(id: json['id'], name: json['name'], price: json['price'], brand: json['brand'], image: json['image']);

    Map<String, dynamic> toMap() {
      return{
        'ID': id,
        'name': name,
        'price': price,
        'brand': brand,
        'image': image
      };
    }
}