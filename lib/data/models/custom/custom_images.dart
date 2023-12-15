class CustomImages {
  List<String> urlList = [];
  List<String> iconUrlList = [];

  CustomImages({this.urlList = const [], this.iconUrlList = const []});

  CustomImages.fromJson(Map<String, dynamic> json) {
    if (json['urlList'] != null) {
      urlList = [];
      json['urlList'].forEach((v) {
        urlList.add(v);
      });
    }
    if (json['iconUrlList'] != null) {
      iconUrlList = [];
      json['iconUrlList'].forEach((v) {
        iconUrlList.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['urlList'] = urlList;
    data['iconUrlList'] = iconUrlList;
    return data;
  }
}
