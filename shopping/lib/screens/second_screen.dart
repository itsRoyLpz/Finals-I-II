import 'package:camera/camera.dart';
import 'package:shopping/screens/comida.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'third_screen.dart';
import 'widgets/if_image.dart';

class SecondScreenWidget extends StatefulWidget {
  final String cal1;
  final String na1;
  final String im1;
  final String pre1;
  final String adi1;
  final String vit1;
  final CameraDescription camera;
  const SecondScreenWidget({Key? key, required this.camera, required this.im1, required this.na1, required this.pre1, required this.cal1, required this.vit1, required this.adi1}) : super(key: key);

  @override
  _SecondScreenWidgetState createState() => _SecondScreenWidgetState();
}

class _SecondScreenWidgetState extends State<SecondScreenWidget> {
  double? ratingBarValue;
  int? countControllerValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        toolbarHeight: 40,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: Container(child: siimagen(path: widget.im1,), width: 100, height: 300,)
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Container(child: siimagen(path: widget.im1,), width: 100, height: 300,)
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Text(
                    widget.na1,
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Text(
                        'clasification',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    RatingBar.builder(
                      onRatingUpdate: (newValue) =>
                          setState(() => ratingBarValue = newValue),
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                      ),
                      direction: Axis.horizontal,
                      initialRating: ratingBarValue ??= 3,
                      unratedColor: Colors.black,
                      itemCount: 5,
                      itemSize: 20,
                      glowColor: FlutterFlowTheme.of(context).secondaryColor,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Column(children: [Container(
                    height: 15,
                    width: double.infinity,
                  )],)
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'vitamins',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Text(
                              widget.vit1,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'additives',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Text(
                            widget.adi1,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'calories',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Text(
                            widget.cal1,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.18,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(232, 255, 255, 255),
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
                    Expanded(
                      child: Text(
                        '${widget.pre1} mx',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirdScreenWidget(camera: widget.camera)));
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
                    ),//borderRadius: BorderRadius.circular(8),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    final route = MaterialPageRoute(builder: (context) => Catalogue(camera: widget.camera,));
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
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.shopping_bag_sharp,
                color: Colors.black,
                size: 35,
              ),
              Text(
                'cart',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}