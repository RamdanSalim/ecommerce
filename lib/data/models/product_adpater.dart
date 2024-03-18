import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ProductAdapter extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String image;

  @HiveField(4)
  int quantity;

  ProductAdapter({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }
}
