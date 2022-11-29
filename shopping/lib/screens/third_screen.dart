import 'dart:io';
import 'package:camera/camera.dart';
import 'package:shopping/screens/fourth_screen.dart';
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

class ThirdScreenWidget extends StatefulWidget {
  final CameraDescription camera;
  const ThirdScreenWidget({Key? key, required this.camera}) : super(key: key);

  @override
  _ThirdScreenWidgetState createState() => _ThirdScreenWidgetState();
}

class _ThirdScreenWidgetState extends State<ThirdScreenWidget> {
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Color(0xFF9E9E9E),
                          width: 1,
                        ),
                      ),
                      child: FlutterFlowCountController(
                        decrementIconBuilder: (enabled) => FaIcon(
                          FontAwesomeIcons.minus,
                          color:
                              enabled ? Colors.blue : Color(0xFFEEEEEE),
                          size: 20,
                        ),
                        incrementIconBuilder: (enabled) => FaIcon(
                          FontAwesomeIcons.plus,
                          color: enabled ? Colors.blue : Color(0xFFEEEEEE),
                          size: 20,
                        ),
                        countBuilder: (count) => Text(
                          count.toString(),
                          style: GoogleFonts.getFont(
                            'Roboto',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        count: countControllerValue ??= 0,
                        updateCount: (count) =>
                            setState(() => countControllerValue = count),
                        stepSize: 1,
                      ),
                    ),
                    Text(
                      'price',
                      style: FlutterFlowTheme.of(context).title1,
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> TakePictureScreen(camera: widget.camera)));
                  },
                  text: 'add to cart',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: Colors.blue,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    //borderRadius: BorderRadius.circular(8),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    final route = MaterialPageRoute(builder: (context) => const HomePageWidget());
                    Navigator.push(context, route);
                  },
                  child: Container(
                  margin: const EdgeInsets.fromLTRB(25,1,25,3),
                    width: 85,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:  BorderRadius.circular(5),
                    ),
                    child: const Text("Fourth screen",
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
                      'cart',
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
                Center(
                child: FutureBuilder<List<Cart>>(
                  future: DatabaseHelper.inst.getCarts(),
                  builder: (BuildContext context,
                  AsyncSnapshot<List<Cart>>snapshot
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
                                      Expanded(child: Container(child: Text('Name: ${cart.name} | price: ${cart.price} | calories: ${cart.calories} | vitamins: ${cart.vitamins} | additives: ${cart.additives}'), width: 275,)),
                                    ],),
                                      
                                      onLongPress: () {
                                        DatabaseHelper.inst.delete(cart.id!);
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