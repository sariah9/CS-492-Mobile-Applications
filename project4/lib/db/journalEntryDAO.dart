import 'database_manager.dart';
import '../models/journalEntry.dart';

class JournalEntryDAO {
  static Future<List<JournalEntry>> journalEntries(DatabaseManager dbm) async{
    final journalRecords = await dbm.selectEntries();
    return journalRecords.map((record) {
      return JournalEntry(
        title: record['title'],
        body: record['body'],
        rating: record['rating'],
        date: DateTime.parse(record['date'])
      );
    }).toList();
  }
}