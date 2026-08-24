class ProductModel {
  String? status;
  Meta? meta;
  List<Data>? data;

  ProductModel({this.status, this.meta, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = <String, dynamic>{};
    mapData['status'] = this.status;
    if (this.meta != null) {
      mapData['meta'] = this.meta!.toJson();
    }
    if (this.data != null) {
      mapData['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return mapData;
  }
}

class Meta {
  Meta();

  Meta.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? tagline;
  String? description;
  String? price;
  String? currency;
  String? image;
  Map<String, dynamic>? specs;

  Data({
    this.id,
    this.name,
    this.tagline,
    this.description,
    this.price,
    this.currency,
    this.image,
    this.specs,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagline = json['tagline'];
    description = json['description'];
    price = json['price'];
    currency = json['currency'];
    image = json['image'];
    specs = json['specs'] != null ? Map<String, dynamic>.from(json['specs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['tagline'] = this.tagline;
    data['description'] = this.description;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['image'] = this.image;
    if (this.specs != null) {
      data['specs'] = this.specs!;
    }
    return data;
  }
}