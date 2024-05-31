class CommentModel {
  int? commentId;
  int? userId;
  int? newsLetterId;
  String? content;
  String? perspective;
  bool? isPrivate;
  String? createdDate;
  String? updatedDate;

  CommentModel(
      {this.commentId,
        this.userId,
        this.newsLetterId,
        this.content,
        this.perspective,
        this.isPrivate,
        this.createdDate,
        this.updatedDate});

  CommentModel.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
    userId = json['userId'];
    newsLetterId = json['newsLetterId'];
    content = json['content'];
    perspective = json['perspective'];
    isPrivate = json['isPrivate'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    data['userId'] = this.userId;
    data['newsLetterId'] = this.newsLetterId;
    data['content'] = this.content;
    data['perspective'] = this.perspective;
    data['isPrivate'] = this.isPrivate;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
