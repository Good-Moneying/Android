class RequiredPostModel {
  String comment;

  RequiredPostModel(this.comment);

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
    };
  }
}