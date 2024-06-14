class UserDataModel {
  UserDataModel({
    this.id = "",
    this.pseudonym = "",
    this.email = "",
    this.pass = "",
    this.avatarUrl = "",
    this.currentHealth,
    this.healthDetails,
    this.primaryHealthGoal,
    this.secondaryHealthGoal,
    this.hobby,
    this.healthGoal,
    this.hobbyDetails,
    this.selectedInterests,
  });

  String id;
  String pseudonym;
  String email;
  String pass;
  String avatarUrl;
  int? currentHealth;
  int? healthGoal;
  String? healthDetails;
  String? primaryHealthGoal;
  String? secondaryHealthGoal;
  String? hobby;
  String? hobbyDetails;
  List<String>? selectedInterests;

  factory UserDataModel.fromJson(json) => UserDataModel(
        id: json["id"] ?? "",
        pseudonym: json["pseudonym"] ?? "",
        email: json["email"] ?? "",
        pass: json["pass"] ?? "",
        avatarUrl: json["avatarUrl"] ?? "",
        currentHealth: json["currentHealth"],
        healthDetails: json["healthDetails"],
        healthGoal: json["healthGoal"],
        primaryHealthGoal: json["primaryHealthGoal"],
        secondaryHealthGoal: json["secondaryHealthGoal"],
        hobby: json["hobby"],
        hobbyDetails: json["hobbyDetails"],
        selectedInterests: json['selectedInterests'] != null
            ? List<String>.from(json['selectedInterests'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pseudonym": pseudonym,
        "email": email,
        "pass": pass,
        "avatarUrl": avatarUrl,
        "currentHealth": currentHealth,
        "healthDetails": healthDetails,
        "healthGoal": healthGoal,
        "primaryHealthGoal": primaryHealthGoal,
        "secondaryHealthGoal": secondaryHealthGoal,
        "hobby": hobby,
        "hobbyDetails": hobbyDetails,
        "selectedInterests": selectedInterests,
      };
}
