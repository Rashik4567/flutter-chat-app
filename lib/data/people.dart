class People {
  final String name;
  final String? avatar;

  People({
    required this.name,
    this.avatar,
  });
}

List<People> active = [
  People(name: "Rashik"),
  People(name: "Alex"),
  People(name: "Glinda"),
];
