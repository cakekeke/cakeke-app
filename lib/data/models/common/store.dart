class Store {
  int id = 0;
  String name = '';
  String roadAddress = '';
  String latitude = '';
  String longitude = '';
  String description = '';
  String startTime = '';
  String endTime = '';
  String phoneNumber = '';
  String reservationLink = '';
  int numberOfReviews = 0;
  List<String> imgUrlList = [];
  String representImgUrl = '';
  double starRating = 0;
  String hashTag = '';

  Store({
    this.id = 0,
    this.name = '',
    this.roadAddress = '',
    this.latitude = '',
    this.longitude = '',
    this.description = '',
    this.startTime = '',
    this.endTime = '',
    this.phoneNumber = '',
    this.reservationLink = '',
    this.numberOfReviews = 0,
    this.imgUrlList = const [],
    this.representImgUrl = '',
    this.starRating = 0,
    this.hashTag = '',
  });

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roadAddress = json['roadAddress'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    description = json['description'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    phoneNumber = json['phoneNumber'];
    reservationLink = json['reservationLink'];
    numberOfReviews = json['numberOfReviews'] ?? 0;
    imgUrlList = [];
    if (json['imgUrlList'] != null) {
      json['imgUrlList'].forEach((v) {
        imgUrlList.add(v);
      });
    }
    representImgUrl = json['representImgUrl'] ?? '';
    hashTag = json['hashTag'];
    starRating = json['starRating'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['roadAddress'] = roadAddress;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['description'] = description;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['phoneNumber'] = phoneNumber;
    data['reservationLink'] = reservationLink;
    data['numberOfReviews'] = numberOfReviews;
    data['imgUrlList'] = imgUrlList;
    data['representImgUrl'] = representImgUrl;
    data['hashTag'] = hashTag;
    data['starRating'] = starRating;
    return data;
  }

  Store copyWith({
    int? id,
    String? name,
    String? roadAddress,
    String? latitude,
    String? longitude,
    String? description,
    String? startTime,
    String? endTime,
    String? phoneNumber,
    String? reservationLink,
    int? numberOfReviews,
    List<String>? imgUrlList,
    String? representImgUrl,
    String? hashTag,
    double? starRating,
  }) {
    return Store(
      id: id ?? this.id,
      name: name ?? this.name,
      roadAddress: roadAddress ?? this.roadAddress,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      reservationLink: reservationLink ?? this.reservationLink,
      numberOfReviews: numberOfReviews ?? this.numberOfReviews,
      imgUrlList: imgUrlList ?? this.imgUrlList,
      representImgUrl: representImgUrl ?? this.representImgUrl,
      hashTag: hashTag ?? this.hashTag,
      starRating: starRating ?? this.starRating,
    );
  }
}
