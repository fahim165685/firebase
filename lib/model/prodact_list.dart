class ProductList{
  String? name;
  String? price;
  String? makingTime;
  String? deliveryTime;
  String? productDescription;
  String? productImageURL;
  ProductList({this.name,this.price,this.makingTime,this.deliveryTime,this.productDescription,this.productImageURL});

  // ProductList.data(Map<String, dynamic>data){
  //   name = data['name'];
  //   price = data['price'];
  //   makingTime = data['makingTime'];
  //   deliveryTime = data['deliveryTime'];
  //   productDescription = data['productDescription'];
  //   productImageURL = data['productImageURL'];
  // }
  ProductList.fromJson(Map<String, dynamic>json){
  name = json['name'];
  price = json['price'];
  makingTime = json['makingTime'];
  deliveryTime = json['deliveryTime'];
  productDescription = json['productDescription'];
  productImageURL = json['productImageURL'];
  }

}