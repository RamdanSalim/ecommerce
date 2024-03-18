import 'dart:convert';
import 'package:hive/hive.dart';

import '../models/product_adpater.dart';

class ProductAdapterAdapter extends TypeAdapter<ProductAdapter> {
  @override
  final int typeId = 0;

  @override
  ProductAdapter read(BinaryReader reader) {
    dynamic mapData = reader.read();
    String jsonData = json.encode(mapData);
    Map<String, dynamic> dataMap = json.decode(jsonData);
    return ProductAdapter(
      id: dataMap['id'],
      name: dataMap['name'],
      price: dataMap['price'],
      image: dataMap['image'],
      quantity: dataMap['quantity'],
    );
  }

  @override
  void write(BinaryWriter writer, ProductAdapter obj) {
    writer.write(obj.toJson());
  }
}
