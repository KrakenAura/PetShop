class Pet {
  final int id;
  final String name;
  final Category category;

  Pet({
    required this.id,
    required this.name,
    required this.category,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      name: json['name'],
      category: Category.fromJson(json['category']),
    );
  }
}

// Mendefinisikan kelas Category di dalam file yang sama
class Category {
  final int id;
  final String name;

  Category(
      {required this.id,
      required this.name}); // Perbaikan: Tambahkan konstruktor

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}
