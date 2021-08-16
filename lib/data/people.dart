class People {
  final String name;
  final String? avatar_url;
  final String uid;

  People({
    required this.name,
    this.avatar_url,
    required this.uid,
  });
}

List<People> active = [
  People(name: "Rashik", uid: '1'),
  People(name: "Alex", uid: '2'),
  People(name: "Glinda", uid: '3'),
];

List<People> friends = [
  People(name: "Rashik", uid: '1'),
  People(name: "Alex", uid: '2'),
  People(name: "Hope", uid: '4'),
  People(name: "Anthony", uid: '5'),
  People(name: "Glinda", uid: '3'),
];
