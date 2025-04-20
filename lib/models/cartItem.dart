import 'package:isar/isar.dart';
import 'product.dart';

part 'cartItem.g.dart';

@collection
class CartItem {
  Id id = Isar.autoIncrement;

  late String name;
  late double price;
  late String description;
  late String image;
  late String category;

  CartItem();

  CartItem.fromProduct(Product product) {
    name = product.name;
    price = product.price;
    description = product.description;
    image = product.image;
    category = product.category;
  }

  Product toProduct() => Product.create(
    name: name,
    price: price,
    description: description,
    image: image,
    category: category,
  );
}
