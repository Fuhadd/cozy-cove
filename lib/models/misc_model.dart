class MiscModel {
  final String id;
  final String name;

  MiscModel({
    required this.id,
    required this.name,
  });

  static MiscModel fromJson(json) => MiscModel(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

List<MiscModel> quests = [
  MiscModel(id: "1", name: "Cooking"),
  MiscModel(id: "2", name: "Career Coaching"),
  MiscModel(id: "3", name: "Music"),
  MiscModel(id: "4", name: "Enterpreneurship"),
  MiscModel(id: "5", name: "Cciences"),
  MiscModel(id: "6", name: "Musician"),
  MiscModel(id: "7", name: "Gaming"),
  MiscModel(id: "8", name: "Entertainment"),
  MiscModel(id: "9", name: "Design"),
  MiscModel(id: "10", name: "Health & Fitness"),
  MiscModel(id: "11", name: "Marketing"),
  MiscModel(id: "12", name: "Beauty/MUA"),
  MiscModel(id: "13", name: "Community"),
];
