class ProfileModel {
  final String nickname;
  final int reward;
  final List<List<Attendances>> attendances; // List<List<Attendances>>로 변경

  ProfileModel({
    required this.nickname,
    required this.reward,
    required this.attendances,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      nickname: json['nickname'],
      reward: json['reward'],
      attendances: (json['attendances']['attendances'] as List)
          .map((attendancesList) => (attendancesList as List)
          .map((attendances) => Attendances.fromJson(attendances))
          .toList())
          .toList(),
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
