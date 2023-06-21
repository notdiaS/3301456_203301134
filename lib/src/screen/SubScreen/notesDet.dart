import 'package:flutter/material.dart';
import 'package:myapp/src/constants/colors.dart';

class NotesDet extends StatefulWidget {
  var title;
  var description;

  NotesDet({required this.title, required this.description});

  @override
  State<NotesDet> createState() => _DescriptionNoteState();
}

class _DescriptionNoteState extends State<NotesDet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sSecondaryColor,
      appBar: AppBar(
        backgroundColor: sPrimaryColor,
        foregroundColor: sSecondaryColor,
        title: const Text('Note Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Card(
                    color: sPrimaryColor,
                    child: ListTile(
                      title: Text(widget.title),
                      subtitle: Text(widget.description),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
