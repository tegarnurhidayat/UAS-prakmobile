class Product {
  final int id;
  final String title, harga, person, start_bid, status, image, deskripsi;

  Product(
      {required this.id,
      required this.title,
      required this.harga,
      required this.person,
      required this.start_bid,
      required this.status,
      required this.image,
      required this.deskripsi});

  factory Product.fromJSON(Map parsedJson) {
    return Product(
        id: parsedJson['id'],
        title: parsedJson['title'],
        harga: parsedJson['harga'],
        person: parsedJson['person'],
        start_bid: parsedJson['start_bid'],
        status: parsedJson['status'],
        image: parsedJson['image'],
        deskripsi: parsedJson['deskripsi']);
  }
}
