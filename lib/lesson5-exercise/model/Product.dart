class Product {
  String name;
  String image;
  int price;
  bool favorite;
  int counter = 1;

  Product(this.name, this.image, this.price, this.favorite);
}

final List<Product> listProductInCart = [];

final List<Product> listProduct = [
  Product(
      "Nike AF1-1",
      "http://www.airforce1.us.com/images/A%20new%20interpretation%20of%20the%20popular%20legendary%20sneakers.%20Nike%20AF1%20%201%20(GS)%20for%20your%20shoe.png",
      93,
      false),
  Product(
      "Jordan AJ1",
      "http://www.airforce1.us.com/images/Air%20Jordan%20aj1%20aj1%20aj1%20black%20and%20red%20toe.jpeg",
      85,
      false),
  Product("Nike AF1-Craig", "http://www.airforce1.us.com/images/af2.png", 70,
      false),
  Product(
      "Nike AF1-2",
      "http://www.airforce1.us.com/images/make%20concerted%20efforts!%20march%20forward%20courageously!%20Nike%20Air%20Force%201%20LV8.png",
      94,
      false),
  Product(
      "Nike AF1-3",
      "http://www.airforce1.us.com/images/AF1%20HAS%20BEEN%20POPULAR%20ON%20THE%20STREETS%20SINCE%20ITS%20RELEASE.%20NIKE%20AIR%20FORCE%201%20'07%20LX%20MEN.jpg",
      92,
      false),
  Product(
      "Jordan 4",
      "http://www.airforce1.us.com/images/Air%20Jordan%20aj4%20all%20black.jpg",
      85,
      false),
  Product(
      "Air JD9",
      "http://www.airforce1.us.com/images/Air%20Jordan%20aj9%20all%20black%20A.jpg",
      84,
      false),
  Product(
      "Jordan 1-1",
      "http://www.airforce1.us.com/images/Air%20jordan%201%20original%20white%20purple.jpeg",
      82,
      false),
  // Product(
  //     "Mercurial",
  //     "https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/ef6e1a58-27db-4d64-b71f-564d80e0264c/mercurial-vapor-14-elite-fg-football-boots-GzzgK8.png",
  //     "140",
  //     false),
];
