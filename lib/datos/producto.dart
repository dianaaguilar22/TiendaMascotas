class Producto {
   final String nombre;
   final String categoria;
   final String tipo;
   

   Producto({required this.nombre,required this.categoria,required this.tipo});


   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = nombre;
    data['categoria'] = categoria;
    data['tipo'] = tipo;
    
    return data;
  }
}