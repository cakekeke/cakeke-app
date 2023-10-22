class User {
  int id = 0;
  String name = '';
  String userId = '';
  String sex = '';
  int age = 0;
  String createdOn = '';
  String updatedOn = '';
  String description = '';

  User(
      {this.id = 0,
      this.name = '',
      this.userId = '',
      this.sex = '',
      this.age = 0,
      this.createdOn = '',
      this.updatedOn = '',
      this.description = ''});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['userId'];
    sex = json['sex'];
    age = json['age'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    description = json['description'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['userId'] = userId;
    data['sex'] = sex;
    data['age'] = age;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['description'] = description;
    return data;
  }
}
