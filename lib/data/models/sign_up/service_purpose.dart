class ServicePurpose {
  int id = 0;
  String description = '';

  ServicePurpose({
    this.id = 0,
    this.description = '',
  });

  ServicePurpose.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    return data;
  }
}
