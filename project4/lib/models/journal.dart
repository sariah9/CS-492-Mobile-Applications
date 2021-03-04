import 'journalEntry.dart';

class Journal {
  final List<JournalEntry> entries;
  Journal({List<JournalEntry> entries = const <JournalEntry>[]}) : this.entries = entries;

  bool get isEmpty => entries.isEmpty;
  List<JournalEntry> get getEntries => entries;
}
