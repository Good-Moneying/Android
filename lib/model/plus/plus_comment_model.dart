class PlusCommentModel {
  String comment;

  PlusCommentModel(this.comment);

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
    };
  }
}