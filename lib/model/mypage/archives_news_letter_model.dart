class ArchivesNewsLetterModel {
  List<NewsLetters>? newsLetters;

  ArchivesNewsLetterModel({this.newsLetters});

  ArchivesNewsLetterModel.fromJson(Map<String, dynamic> json) {
    if (json['newsLetters'] != null) {
      newsLetters = <NewsLetters>[];
      json['newsLetters'].forEach((v) {
        newsLetters!.add(new NewsLetters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newsLetters != null) {
      data['newsLetters'] = this.newsLetters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsLetters {
  int? id;
  String? title;
  String? category;
  String? createdAt;

  NewsLetters({this.id, this.title, this.category, this.createdAt});

  NewsLetters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['category'] = this.category;
    data['createdAt'] = this.createdAt;
    return data;
  }
}