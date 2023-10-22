class SignUser {
  String userId = '';
  String sex = '';
  int age = 0;
  String password = '';
  String servicePurpose = '';
  String image = '';

  SignUser(
      {this.userId = '',
      this.sex = '',
      this.age = 0,
      this.password = '',
      this.servicePurpose = '',
      this.image = ''});

  SignUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    sex = json['sex'];
    age = json['age'];
    password = json['password'];
    servicePurpose = json['servicePurpose'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['servicePurpose'] = servicePurpose;
    data['sex'] = sex;
    data['age'] = age;
    data['password'] = password;
    data['image'] = image;
    return data;
  }

  SignUser copyWith({
    String? userId,
    String? email,
    String? sex,
    int? age,
    String? password,
    String? servicePurpose,
    String? image,
  }) {
    return SignUser(
      userId: userId ?? this.userId,
      sex: sex ?? this.sex,
      age: age ?? this.age,
      password: password ?? this.password,
      servicePurpose: servicePurpose ?? this.servicePurpose,
      image: image ?? this.image,
    );
  }
}
