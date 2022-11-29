import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:url_launcher/url_launcher.dart';
void main() async {
  runApp(const Contacts());
}
class Contacts extends StatelessWidget {
  const Contacts ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List<Contact>? Contacts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
  }

//OBTENER CONTACTOS CON TODO Y SUS PROPIEDADES
//SE IMPRIMIERON LOS CONTACTOS PARA VER SI SON CONSUMIDOS DEL TELEFÓNO CELULAR

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      Contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(Contacts);
      //SE MUESTRA LA LISTA DE CONTACTOS
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "***  CONTACTS  ***",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          elevation: 0,
        ),
      
      
      
      
      //CHECAR SI EL CONTACTO ESTÁ VACÍO PARA MOSTRAR UNA BARRA DE PROGRESO CIRCULAR
        body: (Contacts) == null
            ? Center(child: CircularProgressIndicator())
            //EN CASO DE NO ESTAR VACÍA MOSTRAMOS LOS CONTACTOS
            : ListView.builder(
              //AQUÍ PRIMERO SE OBTIENE LA FOTO DEL CONTACTO 
                itemCount: Contacts!.length,
                itemBuilder: (BuildContext context, int index) {
                  Uint8List? image = Contacts![index].photo;
                  //AQUÍ SE OBTIENE EL NUMERO DE TELÉFONO Y SI ESTÁ VACIO SE OBTENE SOLO --
                  String num = (Contacts![index].phones.isNotEmpty) ? (Contacts![index].phones.first.number) : "--";
                  return ListTile(
                    //AQUÍ AL REVISAR SI LA IMAGEN ES NULA SE IMPRIME UN AVATAR CIRUCLAR 
                      leading: (Contacts![index].photo == null)
                          ? const CircleAvatar(child: Icon(Icons.person))
                          //SI TIENE FOTO EL CONTACTO, MOSTRAREMOS ESA FOTO
                          : CircleAvatar(backgroundImage: MemoryImage(image!)),
                          //OBTENEMOS NOMBRE DEL CONTACTO DE ACUERDO A LA POSICIÓN
                      title: Text(
                          "${Contacts![index].name.first} ${Contacts![index].name.last}"),
                      //TENEMOS EL NUMERO DE TELÉFONO Y SE MUESTRA DEDPENDIENDO DE LO QUE SE GUARDÓ
                      subtitle: Text(num),
                      //CON ESTE SE PERMITE HACER UNA LLAMADA DE TELÉFONO AL CONTACTO
                      onTap: () {
                        if (Contacts![index].phones.isNotEmpty) {
                          launch('tel: ${num}');
                        }
                      });
                },
              ));
  }
}