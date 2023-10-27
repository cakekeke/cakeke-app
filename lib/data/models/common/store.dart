class Store {
  int id = 0;
  String name = '';
  String roadAddress = '';
  String latitude = '';
  String longitude = '';
  String summary = '';
  String description = '';
  double rating = 0;
  String startTime = '';
  String endTime = '';
  String phoneNumber = '';

  Store({
    this.id = 0,
    this.name = '',
    this.roadAddress = '',
    this.latitude = '',
    this.longitude = '',
    this.summary = '',
    this.description = '',
    this.rating = 0,
    this.startTime = '',
    this.endTime = '',
    this.phoneNumber = '',
  });

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roadAddress = json['roadAddress'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    summary = json['summary'];
    description = json['description'];
    rating = json['rating'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['roadAddress'] = roadAddress;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['summary'] = summary;
    data['description'] = description;
    data['rating'] = rating;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['phoneNumber'] = phoneNumber;
    return data;
  }

  Store copyWith({
    int? id,
    String? name,
    String? roadAddress,
    String? latitude,
    String? longitude,
    String? summary,
    String? description,
    double? rating,
    String? startTime,
    String? endTime,
    String? phoneNumber,
  }) {
    return Store(
      id: id ?? this.id,
      name: name ?? this.name,
      roadAddress: roadAddress ?? this.roadAddress,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      summary: summary ?? this.summary,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
