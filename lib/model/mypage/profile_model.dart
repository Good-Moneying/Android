class ProfileModel {
  String? nickname;
  int? reward;
  Attendances? attendances;
  List<Counts>? counts;

  ProfileModel({this.nickname, this.reward, this.attendances, this.counts});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    reward = json['reward'];
    attendances = json['attendances'] != null
        ? new Attendances.fromJson(json['attendances'])
        : null;
    if (json['counts'] != null) {
      counts = <Counts>[];
      json['counts'].forEach((v) {
        counts!.add(new Counts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['reward'] = this.reward;
    if (this.attendances != null) {
      data['attendances'] = this.attendances!.toJson();
    }
    if (this.counts != null) {
      data['counts'] = this.counts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attendances {
  List<Data>? data;

  Attendances({this.data});

  Attendances.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? dayOfWeek;
  bool? isAttendant;
  bool? attendant;

  Data({this.dayOfWeek, this.isAttendant, this.attendant});

  Data.fromJson(Map<String, dynamic> json) {
    dayOfWeek = json['dayOfWeek'];
    isAttendant = json['isAttendant'];
    attendant = json['attendant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dayOfWeek'] = this.dayOfWeek;
    data['isAttendant'] = this.isAttendant;
    data['attendant'] = this.attendant;
    return data;
  }
}

class Counts {
  String? category;
  int? count;

  Counts({this.category, this.count});

  Counts.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['count'] = this.count;
    return data;
  }
}