import 'dart:io';
import 'package:camera/camera.dart';
import 'package:shopping/helpers/database_helper_cats.dart';
import 'package:shopping/screens/contacts.dart';
import 'package:shopping/screens/formulary.dart';
import 'package:shopping/screens/fourth_screen.dart';
import 'package:shopping/screens/models/cart_model_food.dart';
import 'package:shopping/screens/takes_pictures_screen.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/database_helper.dart';
import 'models/cart_model.dart';
import 'take_pictures_screen.dart';

class Catalogue extends StatefulWidget {
  final CameraDescription camera;
  const Catalogue ({Key? key,required this.camera}) : super(key: key);

  @override
  _CatalogueWidgetState createState() => _CatalogueWidgetState();
}

class _CatalogueWidgetState extends State<Catalogue> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int? countControllerValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 57, 143, 209),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 131, 238),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
        
      ),
      body: SingleChildScrollView(child:
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.18,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '-CATALOGUE OF CATS FOOD-',
                      style: FlutterFlowTheme.of(context).title1,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    final route = MaterialPageRoute(builder: (context) => TakePhotoScreen(camera: widget.camera,));
                    Navigator.push(context, route);
                  },
                  child: Container(
                  margin: const EdgeInsets.fromLTRB(25,1,25,3),
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:  BorderRadius.circular(5),
                    ),
                    child: const Text("CATALOGUE OF CATS",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    final route = MaterialPageRoute(builder: (context) => Contacts());
                    Navigator.push(context, route);
                  },
                  child: Container(
                  margin: const EdgeInsets.fromLTRB(25,1,25,3),
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:  BorderRadius.circular(5),
                    ),
                    child: const Text("CONTACTS UNIT 2",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.shopping_bag_sharp,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text(
                      'Food',
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
                Center(
                child: FutureBuilder<List<Food>>(
                  future: DatabaseHelperCat.inst.getFood(),
                  builder: (BuildContext context,
                  AsyncSnapshot<List<Food>>snapshot
                  ){
                    if(!snapshot.hasData){
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: const Text('Loading...'),
                        ),
                      );
                    }else{
                      return snapshot.data!.isEmpty ?
                      Center(
                        child: Container(
                          child: const Text('No items in the list'),
                        ),
                      )
                      :
                      ListView(scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children:
                        snapshot.data!.map((cart) {
                          return Center(
                            child: ListTile(

                                    title: Row(children: [
                                      Expanded(child: Container(child: Image.file(File(cart.image)), height: 100, width: 100)),
                                      Expanded(child: Container(child: Text('Name: ${cart.name} | price: ${cart.price} | brand: ${cart.brand}'), width: 275,)),
                                    ],),
                                      
                                      onLongPress: () {
                                        DatabaseHelperCat.inst.delete(cart.id!);
                                        setState(() {
                                
                                        });
                                      },
                                  )
                          );
                        }).toList()
                      );
                    }
                  }
                  ,
                  ),
              )
                
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}