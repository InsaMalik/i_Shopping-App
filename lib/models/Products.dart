class Products {
  final String name;
  final String category;
  final double price;
  final double? oldprice;
  final String imageUrl;
  final String description;
  final bool isfavorite;

  Products({
    required this.name,
    required this.category,
    required this.price,
    this.oldprice,
    required this.imageUrl,
    required this.description,
    this.isfavorite= false,
  });

  static int? get length => null;
}

final List<Products> products = [
  Products(
    name: "Shoes",
    category: "Footware",
    price: 175.0,
    oldprice:300.0,
    imageUrl: "images/shoe.jpg",
    description: "Description of product 1",
  ),
   Products(
    name: "Laptop",
    category: "Electronics",
    price: 180.0,
    oldprice:300.0,
    isfavorite: true,
    imageUrl: "images/laptop.jpg",
    description: "Description of product 2",
  ),
   Products(
    name: "Jordar Shoes",
    category: "Footware",
    price: 180.0,
    oldprice:300.0,
    imageUrl: "images/shoe2.jpg",
    description: "Description of product 3",
  ), Products(
    name: "Puma",
    category: "Footware",
    isfavorite: true,
    price: 170.0,
    oldprice:300.0,
    imageUrl: "images/shoes2.jpg",
    description: "Description of product 4",
  ),
];