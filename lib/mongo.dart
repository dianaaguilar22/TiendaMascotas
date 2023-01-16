import 'dart:developer';

import 'package:mi_tienda_mascotas/datos/producto.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoData {
  static var db, productos;

  static connect() async {
    String mongo =
        "mongodb+srv://diana:dianis1234@tiendamascotas.2eac8lb.mongodb.net/mascotas?retryWrites=true&w=majority";
    
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

  static Future<List> obtenerAlimentoPerro()  {
    try {
      final product =  productos.find({"tipo":"AlimentoP"}).toList();
      
      return product;
    } catch (e) {
      
      return Future.value(["Fallo"]);
    }
  }
  static Future<List> obtenerAlimentoGato()  {
    try {
      final product =  productos.find({"tipo":"AlimentoG"}).toList();
      
      return product;
    } catch (e) {
      
      return Future.value(["Fallo"]);
    }
  }
  static Future<List> obtenerAlimentoAcc()  {
    try {
      final product =  productos.find({"tipo":"Accesorios"}).toList();
      
      return product;
    } catch (e) {
      
      return Future.value(["Fallo"]);
    }
  }
  static Future<List> obtenerCuidadoG()  {
    try {
      final product =  productos.find({"tipo":"CuidadoG"}).toList();
      
      return product;
    } catch (e) {
      
      return Future.value(["Fallo"]);
    }
  }
  static Future<List> obtenerCuidadoP()  {
    try {
      final product =  productos.find({"tipo":"CuidadoP"}).toList();
      
      return product;
    } catch (e) {
      
      return Future.value(["Fallo"]);
    }
  }
  static Future<List> obtenerCuidadoO()  {
    try {
      final product =  productos.find({"tipo":"CuidadoO"}).toList();
      
      return product;
    } catch (e) {
      
      return Future.value(["Fallo"]);
    }
  }
  static Future<List> obtenerAlimentoO()  {
    try {
      final product =  productos.find({"tipo":"AlimentoO"}).toList();
      
      return product;
    } catch (e) {
      
      return Future.value(["Fallo"]);
    }
  }
  static Future<List> obtenerJuguetes()  {
    try {
      final product =  productos.find({"tipo":"Juguetes"}).toList();
      
      return product;
    } catch (e) {
      
      return Future.value(["Fallo"]);
    }
  }

  static insert(Producto producto) async {
    await productos.insertOne(producto.toJson());
  }

  static delete(String id) async {
    await productos.remove(where.id(ObjectId.fromHexString(id)));
  }
}