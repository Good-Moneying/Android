class ProfileModel {
  String? nickname;
  int? reward;
  Attendances? attendances;

  ProfileModel({this.nickname, this.reward, this.attendances});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    reward = json['reward'];
    attendances = json['attendances'] != null
        ? new Attendances.fromJson(json['attendances'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['reward'] = this.reward;
    if (this.attendances != null) {
      data['attendances'] = this.attendances!.toJson();
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