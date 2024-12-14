class UserInformationDTO {
  String id;
  String? email;
  String? name;
  String? knownAs;
  String? avatar;

  UserInformationDTO(
      {required this.id, this.email, this.name, this.knownAs, this.avatar});
}
