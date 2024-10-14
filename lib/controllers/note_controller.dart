import 'package:get/get.dart';
import '../models/note_model.dart';
import '../services/database_service.dart';

class NoteController extends GetxController {
  final DatabaseService _databaseService = DatabaseService();
  final RxList<Note> notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  Future<void> getNotes() async {
    notes.value = await _databaseService.getNotes();
  }

  Future<void> addNote(String title, String content) async {
    final note = Note(title: title, content: content);
    await _databaseService.insertNote(note);
    await getNotes();
  }

  Future<void> updateNote(Note note) async {
    await _databaseService.updateNote(note);
    await getNotes();
  }

  Future<void> deleteNote(int id) async {
    await _databaseService.deleteNote(id);
    await getNotes();
  }
}