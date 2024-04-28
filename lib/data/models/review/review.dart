class Review {
  int id = 0;
  int? userId;
  int storeId = 0;
  String? contents;
  String? description;

  Review(
      {this.id = 0,
      this.userId,
      this.storeId = 0,
      this.contents,
      this.description});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    storeId = json['store_id'];
    contents = json['contents'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['store_id'] = storeId;
    data['contents'] = contents;
    data['description'] = description;
    return data;
  }
}
