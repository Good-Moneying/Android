class ProfileModel{
  final String nickname;
  final int reward;
  final List<Attendances> attendances;

  ProfileModel({
    required this.nickname,
    required this.reward,
    required this.attendances,
});

  factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(
        nickname: json['nickname'],
        reward: json['reward'],
        attendances: List<Attendances>.from(json['attendances'].map((attendances)=>Attendances.fromJson(attendances)))
    );
  }
}

class Attendances{
  final String dayOfWeek;
  final bool isAttendant;
  final bool attendant;

  Attendances({
    required this.attendant,
    required this.dayOfWeek,
    required this.isAttendant
});
  factory Attendances.fromJson(Map<String, dynamic> json){
    return Attendances(
        attendant: json['attendant'],
        dayOfWeek: json['dayOfWeek'],
        isAttendant: json['isAttendant']);
  }
}
