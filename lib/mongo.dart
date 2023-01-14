import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

class MongoData {
  static var db, productos;

  static connect() async {
    String mongo =
        "mongodb+srv://diana:dianas123@tiendamascotas.2eac8lb.mongodb.net/mascotas?retryWrites=true&w=majority";
    
    db = await Db.create(mongo);

    await db.open();
    inspect(db);

    productos = db.collection("productos");
    
  }

  static Future<List> obtenerProductos()  {
    try {
      final product =  productos.find().toList();
      
      return product;
    } catch (e) {
      
      return Future.value(["Fallo"]);
    }
  }

  
}