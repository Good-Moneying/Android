class NewsLetterModel {
  final String publishedAt;
  final String? editor;
  final List<Block> blocks;
  final List<Comment> comments;
  final bool isCommented;

  NewsLetterModel({
    required this.publishedAt,
    required this.editor,
    required this.blocks,
    required this.comments,
    required this.isCommented,
  });

  factory NewsLetterModel.fromJson(Map<String, dynamic> json) {
    return NewsLetterModel(
      publishedAt: json['publishedAt'],
      editor: json['editor'],
      blocks: List<Block>.from(json['blocks'].map((block) => Block.fromJson(block))),
      comments: List<Comment>.from(json['comments'].map((comment) => Comment.fromJson(comment))),
      isCommented: json['isCommented'],
    );
  }
}

class Block {
  final String type;
  final String content;

  Block({required this.type, required this.content});

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      type: json['type'],
      content: json['content'],
    );
  }
}

class Comment {
  final String nickname;
  final String content;

  Comment({required this.nickname, required this.content});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      nickname: json['nickname'],
      content: json['content'],
    );
  }
}
