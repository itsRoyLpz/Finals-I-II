import 'dart:io';

import 'package:flutter/cupertino.dart';

class siimagen extends StatefulWidget {
  String?path;
  siimagen({Key? key, this.path}) : super(key: key);

  @override
  State<siimagen> createState() => _siimagenState();
}

class _siimagenState extends State<siimagen> {
  @override
  Widget build(BuildContext context) {
    if (widget.path == '') {
      return Placeholder(
        fallbackHeight: 100,
        fallbackWidth: 100,
      );
    }else{
      return Image.file(File(widget.path!));
    }
  }
}