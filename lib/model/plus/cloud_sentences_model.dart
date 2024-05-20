class CloudSentenceModel {
  String sentence;

  CloudSentenceModel(this.sentence);

  Map<String, dynamic> toJson() {
    return {
      'sentence': sentence,
    };
  }
}