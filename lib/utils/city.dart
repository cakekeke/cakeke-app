List<Map<String, String>> districts = [
  {"city": "서울시", "district": "강남구"},
  {"city": "서울시", "district": "서초구"},
  {"city": "서울시", "district": "강북구"},
  {"city": "서울시", "district": "관악구"},
  {"city": "서울시", "district": "구로구"},
  {"city": "서울시", "district": "노원구"},
  {"city": "서울시", "district": "동대문구"},
  {"city": "서울시", "district": "마포구"},
  {"city": "서울시", "district": "서대문구"},
  {"city": "서울시", "district": "강동구"},
  {"city": "서울시", "district": "성동구"},
  {"city": "서울시", "district": "성북구"},
  {"city": "서울시", "district": "송파구"},
  {"city": "서울시", "district": "양천구"},
  {"city": "서울시", "district": "영등포구"},
  {"city": "서울시", "district": "용산구"},
  {"city": "서울시", "district": "은평구"},
  {"city": "서울시", "district": "강서구"},
  {"city": "서울시", "district": "광진구"},
  {"city": "서울시", "district": "금천구"},
  {"city": "서울시", "district": "도봉구"},
  {"city": "서울시", "district": "중구"},
  {"city": "서울시", "district": "종로구"},
  {"city": "성남시", "district": "중원구"},
  {"city": "성남시", "district": "수정구"},
  {"city": "성남시", "district": "분당구"},
];

List<String?> seoulDistricts = districts
    .where((district) => district['city'] == '서울시')
    .map((district) => district['district'])
    .toList();

List<String?> seongnamDistricts = districts
    .where((district) => district['city'] == '성남시')
    .map((district) => district['district'])
    .toList();
