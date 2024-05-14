class HomeModel {
  final NewsLetter todayNewsLetter;
  final List<NewsLetter> realtimeTrendNewsLetters;
  final List<NewsLetter> customizeNewsLetters;
  final TodayTerm todayTerm;

  HomeModel({
    required this.todayNewsLetter,
    required this.realtimeTrendNewsLetters,
    required this.customizeNewsLetters,
    required this.todayTerm,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json)
  => HomeModel(
    todayNewsLetter: NewsLetter.fromJson(json["todayNewsLetter"]),
    realtimeTrendNewsLetters: List<NewsLetter>.from(json["realtimeTrendNewsLetters"].map((x) => NewsLetter.fromJson(x))),
    customizeNewsLetters: List<NewsLetter>.from(json["customizeNewsLetters"].map((x) => NewsLetter.fromJson(x))),
    todayTerm: TodayTerm.fromJson(json["todayTerm"]),
  );

  Map<String, dynamic> toJson() => {
    "todayNewsLetter": todayNewsLetter.toJson(),
    "realtimeTrendNewsLetters": List<dynamic>.from(realtimeTrendNewsLetters.map((x) => x.toJson())),
    "customizeNewsLetters": List<dynamic>.from(customizeNewsLetters.map((x) => x.toJson())),
    "todayTerm": todayTerm.toJson(),
  };
}

class NewsLetter {
  final int id;
  final String thumbnail;
  final String title;
  final String createdAt;
  final String keywords;
  final String? category;
  final bool isScrapped;
  final String type;

  NewsLetter({
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.createdAt,
    required this.keywords,
    required this.category,
    required this.isScrapped,
    required this.type,
  });

  factory NewsLetter.fromJson(Map<String, dynamic> json) => NewsLetter(
    id: json["id"],
    thumbnail: json["thumbnail"],
    title: json["title"],
    createdAt: json["createdAt"],
    keywords: json["keywords"],
    category: json["category"],
    isScrapped: json["isScrapped"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "thumbnail": thumbnail,
    "title": title,
    "createdAt": createdAt,
    "keywords": keywords,
    "category": category,
    "isScrapped": isScrapped,
    "type": type,
  };
}

class TodayTerm {
  final int termId;
  final String englishName;
  final String koreanName;
  final String description;
  final String? category;
  final bool isScrapped;

  TodayTerm({
    required this.termId,
    required this.englishName,
    required this.koreanName,
    required this.description,
    required this.category,
    required this.isScrapped,
  });

  factory TodayTerm.fromJson(Map<String, dynamic> json) => TodayTerm(
    termId: json["termId"],
    englishName: json["englishName"],
    koreanName: json["koreanName"],
    description: json["description"],
    category: json["category"],
    isScrapped: json["isScrapped"],
  );

  Map<String, dynamic> toJson() => {
    "termId": termId,
    "englishName": englishName,
    "koreanName": koreanName,
    "description": description,
    "category": category,
    "isScrapped": isScrapped,
  };
}
