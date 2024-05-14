class ArchivesTermModel {
  List<int>? ids;

  ArchivesTermModel({this.ids});

  ArchivesTermModel.fromJson(Map<String, dynamic> json) {
    ids = json['ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ids'] = this.ids;
    return data;
  }
}