

class MyInfo {
  MyInfo({this.teamId});
  final String? teamId;

  MyInfo.fromMap(Map<String,Object?> json) :
  this(
    teamId: json['teamId']! as String,
  );
  Map<String,Object?> toJson(){
    return {
      'teamId' : teamId,
    };
  }
  

}
