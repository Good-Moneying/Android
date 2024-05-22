class CloudSpecificModel {
  int? thinkingId;
  int? userId;
  int? newsLetterId;
  String? thumbnailUrl;
  String? comment;
  String? summarizedComment;
  bool? isCloudExist;
  List<String>? thinkingCloud;

  CloudSpecificModel(
      {this.thinkingId,
        this.userId,
        this.newsLetterId,
        this.thumbnailUrl,
        this.comment,
        this.summarizedComment,
        this.isCloudExist,
        this.thinkingCloud});

  CloudSpecificModel.fromJson(Map<String, dynamic> json) {
    thinkingId = json['thinkingId'];
    userId = json['userId'];
    newsLetterId = json['newsLetterId'];
    thumbnailUrl = json['thumbnailUrl'];
    comment = json['comment'];
    summarizedComment = json['summarizedComment'];
    isCloudExist = json['isCloudExist'];
    thinkingCloud = json['thinkingCloud'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thinkingId'] = this.thinkingId;
    data['userId'] = this.userId;
    data['newsLetterId'] = this.newsLetterId;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['comment'] = this.comment;
    data['summarizedComment'] = this.summarizedComment;
    data['isCloudExist'] = this.isCloudExist;
    data['thinkingCloud'] = this.thinkingCloud;
    return data;
  }
}