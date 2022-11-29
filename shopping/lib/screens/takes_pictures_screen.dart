//TOMAR FOTO Y GUARDAR LA RUTA DE LA FOTO EN EL FORMULARIO
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping/screens/formulary.dart';

import 'insert_screen.dart';

class TakePhotoScreen extends StatefulWidget {
  final CameraDescription camera;
  const TakePhotoScreen({Key? key, required this.camera}) : super(key: key);

  @override
  State<TakePhotoScreen> createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  
  @override
  void initState() {
    super.initState();
    _controller  = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Take a picture of your product"),),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try{
            await _initializeControllerFuture;

            final image = await _controller.takePicture();
            final iname = image.name;
            Directory? documentDirectory = await getExternalStorageDirectory();
            String path = join(documentDirectory!.path, iname);
            image.saveTo(path);
            if (!mounted) {
              return ;
            }
            await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InsertFood(ImagePath: image.path, camera: widget.camera)));
          } catch (e){}
        },
        child: const Icon(Icons.camera_alt),
        ),
    );
  }
}