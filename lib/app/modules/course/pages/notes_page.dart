import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iesb_college/app/models/Course.dart';
import 'package:iesb_college/app/modules/course/course_store.dart';
import 'package:iesb_college/app/modules/course/models/note_dto.dart';
import 'package:iesb_college/app/shared/ui_helpers.dart';
import 'package:mobx/mobx.dart';

class NotesPage extends StatefulWidget {
  final Course course;

  const NotesPage({super.key, required this.course});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  var store = Modular.get<CourseStore>();
  late final ReactionDisposer _disposer;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    store.clearNotes();
    store.getNotes(widget.course.id!);

    _disposer = when((_) => store.notes.isNotEmpty, () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    _disposer(); // Dispose the reaction when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tipo = widget.course.type == 1 ? "bimestral" : "semestral";
    var tipo2 = widget.course.type == 1 ? "bimestrais" : "semestrais";
    var quantidade = widget.course.type == 1 ? 4 : 2;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.name),
        elevation: 3,
      ),
      floatingActionButton: Observer(builder: (context) {
        var habilita = store.notes.length < quantidade;
        return habilita
            ? FloatingActionButton(
                onPressed: () => _dialogBuilder(context),
                child: const Icon(Icons.add),
              )
            : SizedBox.shrink(); // Return an empty widget when not enabled
      }),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Essa matéria é $tipo, então você precisa inserir suas $quantidade notas $tipo2.',
              style: const TextStyle(fontSize: 18),
            ),
            verticalSpaceSmall,
            Expanded(
              child: Observer(builder: (context) {
                return Column(
                  children: [
                    store.notes.isEmpty
                        ? const Center(
                            child: Text('Nenhuma nota cadastrada'),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: store.notes.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    title: Text(
                                      'Nota: ${store.notes[index].value.toString()}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                    Text(
                      'Média atual: ${store.calculateAverage().toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    var dto = NoteDTO();
    dto.courseId = widget.course.id;
    String? errorMessage;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Adicionar nota'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Nota',
                      errorText: errorMessage,
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,1}')),
                    ],
                    onChanged: (String value) {
                      setState(() {
                        errorMessage = null; // Reset error message on change
                        if (value.isNotEmpty) {
                          dto.value = double.tryParse(value);
                        }
                      });
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Salvar'),
                  onPressed: () {
                    setState(() {
                      if (dto.value == null ||
                          dto.value! < 0 ||
                          dto.value! > 10) {
                        errorMessage = 'A nota deve estar entre 0 e 10';
                      } else {
                        store.addNote(dto);
                        Navigator.of(context).pop();
                      }
                    });
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
