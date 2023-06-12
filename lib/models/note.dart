class Note {
  String id;
  final String title;
  final String isi;

  Note({
    this.id = '',
    required this.title,
    required this.isi,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isi': isi,
      };

  static Note fromJson(Map<String, dynamic> json) =>
      Note(title: json['title'], isi: json['isi']);
}
