// ignore_for_file: public_member_api_docs, sort_constructors_first
class MyInfo {
  final int? teamId; //팀 아이디
  final String name; //유저 이름
  final String? photoUrl; //프로필 사진 URL

  MyInfo({
    this.teamId,
    required this.name,
    this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'photoUrl': photoUrl,
    };
  }

  factory MyInfo.fromMap(Map<String, dynamic> map) {
    return MyInfo(
      teamId: map['teamId'] != null ? map['teamId'] as int : null,
      name: map['name'] as String,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
    );
  }
}
