class DetailSurveyModel {
  int? id;
  int? creatorId;
  String? description;
  List<int>? agreedUserIds;
  List<int>? disagreedUserIds;
  List<Comments>? comments;

  DetailSurveyModel(
      {this.id,
        this.creatorId,
        this.description,
        this.agreedUserIds,
        this.disagreedUserIds,
        this.comments});

  DetailSurveyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creatorId = json['creatorId'];
    description = json['description'];
    agreedUserIds = json['agreedUserIds'].cast<int>();
    disagreedUserIds = json['disagreedUserIds'].cast<int>();
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['creatorId'] = this.creatorId;
    data['description'] = this.description;
    data['agreedUserIds'] = this.agreedUserIds;
    data['disagreedUserIds'] = this.disagreedUserIds;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int? id;
  int? surveyId;
  String? content;
  int? authorId;
  String? createdAt;
  String? updatedAt;

  Comments(
      {this.id,
        this.surveyId,
        this.content,
        this.authorId,
        this.createdAt,
        this.updatedAt});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surveyId = json['surveyId'];
    content = json['content'];
    authorId = json['authorId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['surveyId'] = this.surveyId;
    data['content'] = this.content;
    data['authorId'] = this.authorId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
