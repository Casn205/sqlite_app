import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';
import '../models/note_model.dart';

class NoteDetailView extends StatelessWidget {
  final Note? note;
  final NoteController noteController = Get.find();

  NoteDetailView({this.note});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: note?.title ?? '');
    final contentController = TextEditingController(text: note?.content ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(note == null ? 'Nueva Nota' : 'Editar Nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Contenido'),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text(note == null ? 'Agregar' : 'Actualizar'),
              onPressed: () {
                if (note == null) {
                  noteController.addNote(
                    titleController.text,
                    contentController.text,
                  );
                } else {
                  noteController.updateNote(
                    Note(
                      id: note!.id,
                      title: titleController.text,
                      content: contentController.text,
                    ),
                  );
                }
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}