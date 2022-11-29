//FORMULARIO PARA INGRESAR DATOS DEL USUARIO SOBRE COMIDA DE GATOS
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/helpers/database_helper_cats.dart';
import 'package:shopping/screens/models/cart_model_food.dart';

import '../helpers/database_helper.dart';
import 'models/cart_model.dart';
import 'third_screen.dart';

class InsertFood extends StatefulWidget {
  final String ImagePath;
  final CameraDescription camera;
  InsertFood({Key? key, required this.ImagePath, required this.camera}) : super(key: key);

  @override
  State<InsertFood> createState() => _InsertFoodState();
}

class _InsertFoodState extends State<InsertFood> {
  final textControllerName = TextEditingController();
  final textControllerPrice = TextEditingController();
  final textControllerCalories = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite DB"),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            TextFormField(controller: textControllerName,
             decoration: InputDecoration(
              icon: Icon(Icons.view_comfortable_outlined),
              labelText: 'Product Name'
              ), 
              ),
            TextFormField(controller: textControllerPrice,
             decoration: InputDecoration(
              icon: Icon(Icons.text_format_outlined),
              labelText: "Product Price"
              ), 
              ),
            TextFormField(controller: textControllerCalories,
             decoration: InputDecoration(
              icon: Icon(Icons.view_comfortable_outlined),
              labelText: 'Product Brand'
              ), 
              ),

          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () async {
          DatabaseHelperCat.inst.add(Food(name : textControllerName.text,
          price : textControllerPrice.text,
          brand : textControllerCalories.text,
          image: widget.ImagePath,
          ));

//NO REPETIR DATOS EN LA BASE DE DATOS
          setState(() {
            textControllerName.clear();
            textControllerPrice.clear();
            textControllerCalories.clear();

          });
        },
      ),
    );
  }
}