class CatalogModel{
  static final items = [
    Item(
        009590586-011-40,
        "Roman GTMK Shoes",
        "Product Code: 009590586-011-40 availability: in stock",
        13995,
        "Black",
        "https://cdn.shopify.com/s/files/1/0016/0074/9623/products/IMG_5303.jpg"
    ),
    Item(
        009590586-011-40,
        "Bridgport Advice Shoes",
        "Feel the difference in comfort with our uniquely designed Technology which provides streamlined extra supportive cushioning in the foot-beds, where you need it... ",
        5495,
        "Black",
        "https://cdn.shopify.com/s/files/1/0016/0074/9623/products/IMG_1924.jpg"
    )
  ];
}


class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  Item(this.id, this.name, this.desc, this.price, this.color, this.imageUrl);
}