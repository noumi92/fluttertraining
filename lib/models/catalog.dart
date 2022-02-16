class Item{
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  Item(this.id, this.name, this.desc, this.price, this.color, this.imageUrl);
}
final products = [
  Item("id", "name", "desc", 12345, "color", "imageUrl"),
  Item("id", "name", "desc", 12345, "color", "imageUrl")
];