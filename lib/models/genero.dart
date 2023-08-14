class Genero {
  int id;
  String name;

  Genero({required this.id, required this.name});

  factory Genero.fromMap(Map<String, dynamic> map) {
    return Genero(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}
