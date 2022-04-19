class PorscheCarModelType {
  int id_type;
  int id_model;
  String desc_type;
  double price_type;
  int status_del;
  String desc_model;

  PorscheCarModelType({
    this.id_type,
    this.id_model,
    this.desc_type,
    this.price_type,
    this.status_del,
    this.desc_model
  });

  factory PorscheCarModelType.fromJson(Map<String, dynamic> json) {
    return PorscheCarModelType(
      id_type: json['id_type'],
      id_model: json['id_model'],
      desc_type: json['desc_type'],
      price_type: json['price_type'],
      desc_model: json['desc_model'],
      status_del: json['status_del']
    );
  }
}