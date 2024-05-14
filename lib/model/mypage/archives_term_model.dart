class ArchivesTermModel {
  List<Terms>? terms;

  ArchivesTermModel({this.terms});

  ArchivesTermModel.fromJson(Map<String, dynamic> json) {
    if (json['terms'] != null) {
      terms = <Terms>[];
      json['terms'].forEach((v) {
        terms!.add(new Terms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.terms != null) {
      data['terms'] = this.terms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Terms {
  int? id;
  String? koreanName;
  String? englishName;

  Terms({this.id, this.koreanName, this.englishName});

  Terms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    koreanName = json['koreanName'];
    englishName = json['englishName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['koreanName'] = this.koreanName;
    data['englishName'] = this.englishName;
    return data;
  }
}