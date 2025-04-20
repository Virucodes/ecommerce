import 'package:isar/isar.dart';

part 'product.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement; // Auto-incremented ID

  late String name;
  late double price;
  late String description;
  late String image;
  late String category;

  Product();

  // Optional named constructor if needed
  Product.create({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });
}
