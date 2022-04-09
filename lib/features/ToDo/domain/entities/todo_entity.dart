abstract class ITodoEntity{
  String name;
  bool concluded;

  ITodoEntity({
    required this.name,
    required this.concluded
  });

  ITodoEntity.fromJson(Map<String, dynamic> json)
  : name = json['name'],
    concluded = json['concluded'];

  Map<String, dynamic> toJson();   


}