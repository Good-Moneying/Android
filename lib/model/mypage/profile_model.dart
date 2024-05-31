class ProfileModel {
  String? level;
  String? profileUrl;
  String? nickname;
  int? reward;
  int? follower;
  int? followee;
  Attendances? attendances;
  List<Counts>? counts;

  ProfileModel(
      {this.level,
        this.profileUrl,
        this.nickname,
        this.reward,
        this.follower,
        this.followee,
        this.attendances,
        this.counts});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    profileUrl = json['profileUrl'];
    nickname = json['nickname'];
    reward = json['reward'];
    follower = json['follower'];
    followee = json['followee'];
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
    data['level'] = this.level;
    data['profileUrl'] = this.profileUrl;
    data['nickname'] = this.nickname;
    data['reward'] = this.reward;
    data['follower'] = this.follower;
    data['followee'] = this.followee;
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
  int? dayOfWeekValue;
  bool? isAttendant;
  bool? attendant;

  Data({this.dayOfWeekValue, this.isAttendant, this.attendant});

  Data.fromJson(Map<String, dynamic> json) {
    dayOfWeekValue = json['dayOfWeekValue'];
    isAttendant = json['isAttendant'];
    attendant = json['attendant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dayOfWeekValue'] = this.dayOfWeekValue;
    data['isAttendant'] = this.isAttendant;
    data['attendant'] = this.attendant;
    return data;
  }
}

class Counts {
  String? categoryName;
  String? logoUrl;
  int? count;

  Counts({this.categoryName, this.logoUrl, this.count});

  Counts.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    logoUrl = json['logoUrl'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    data['logoUrl'] = this.logoUrl;
    data['count'] = this.count;
    return data;
  }
}