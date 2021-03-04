class JournalEntryDTO {
  String title;
  String body;
  int rating;
  DateTime date;

  String toString() => 'Title: $title, Body: $body, Rating: $rating, Date: $date';
}
