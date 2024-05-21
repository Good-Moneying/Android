class NewsLetterModel {
  String? title;
  Editor? editor;
  String? publishedAt;
  String? summary;
  List<Body>? body;
  List<Comments>? comments;
  bool? isCommented;

  NewsLetterModel(
      {this.title,
        this.editor,
        this.publishedAt,
        this.summary,
        this.body,
        this.comments,
        this.isCommented});

  NewsLetterModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    editor =
    json['editor'] != null ? new Editor.fromJson(json['editor']) : null;
    publishedAt = json['publishedAt'];
    summary = json['summary'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    isCommented = json['isCommented'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.editor != null) {
      data['editor'] = this.editor!.toJson();
    }
    data['publishedAt'] = this.publishedAt;
    data['summary'] = this.summary;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['isCommented'] = this.isCommented;
    return data;
  }
}

class Editor {
  String? nickname;
  String? profileUrl;

  Editor({this.nickname, this.profileUrl});

  Editor.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    profileUrl = json['profileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['profileUrl'] = this.profileUrl;
    return data;
  }
}

class Body {
  String? type;
  String? content;

  Body({this.type, this.content});

  Body.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['content'] = this.content;
    return data;
  }
}

class Comments {
  String? userLevel;
  String? userNickname;
  String? userProfileUrl;
  String? perspective;
  String? content;
  int? likeCount;

  Comments(
      {this.userLevel,
        this.userNickname,
        this.userProfileUrl,
        this.perspective,
        this.content,
        this.likeCount});

  Comments.fromJson(Map<String, dynamic> json) {
    userLevel = json['userLevel'];
    userNickname = json['userNickname'];
    userProfileUrl = json['userProfileUrl'];
    perspective = json['perspective'];
    content = json['content'];
    likeCount = json['likeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userLevel'] = this.userLevel;
    data['userNickname'] = this.userNickname;
    data['userProfileUrl'] = this.userProfileUrl;
    data['perspective'] = this.perspective;
    data['content'] = this.content;
    data['likeCount'] = this.likeCount;
    return data;
  }
}