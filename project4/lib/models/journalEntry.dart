class JournalEntry {
  final int id;
  final String title;
  final String body;
  final DateTime date;
  final int rating;

  JournalEntry({
    this.id,
    this.title, 
    this.body, 
    this.date, 
    this.rating
  });

  String get getTitle => '$title';
  String get getDate => '$date';
  String get getBody => '$body';
  String get getRating => '$rating';
  String get getID => '$id';

}