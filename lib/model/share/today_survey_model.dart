class TodaySurveyModel {
  int? surveyId;
  String? createdAt;
  String? description;
  int? participants;
  String? creatorName;
  bool? isVoted;
  int? proportionOfAgree;
  int? proportionOfDisagree;

  TodaySurveyModel(
      {this.surveyId,
        this.createdAt,
        this.description,
        this.participants,
        this.creatorName,
        this.isVoted,
        this.proportionOfAgree,
        this.proportionOfDisagree});

  TodaySurveyModel.fromJson(Map<String, dynamic> json) {
    surveyId = json['surveyId'];
    createdAt = json['createdAt'];
    description = json['description'];
    participants = json['participants'];
    creatorName = json['creatorName'];
    isVoted = json['isVoted'];
    proportionOfAgree = json['proportionOfAgree'];
    proportionOfDisagree = json['proportionOfDisagree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surveyId'] = this.surveyId;
    data['createdAt'] = this.createdAt;
    data['description'] = this.description;
    data['participants'] = this.participants;
    data['creatorName'] = this.creatorName;
    data['isVoted'] = this.isVoted;
    data['proportionOfAgree'] = this.proportionOfAgree;
    data['proportionOfDisagree'] = this.proportionOfDisagree;
    return data;
  }
}
