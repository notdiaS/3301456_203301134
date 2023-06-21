import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../utils/database_helper.dart';
import '../SubScreen/notesDet.dart';


class AppPage3 extends StatefulWidget {
  const AppPage3({super.key});

  @override
  State<AppPage3> createState() => _NoteHomeUIState();
}

class _NoteHomeUIState extends State<AppPage3> {

  insertdatabase(title, description) {
    NoteDbHelper.instance.insert({
      NoteDbHelper.coltitle: title,
      NoteDbHelper.coldescription: description,
      NoteDbHelper.coldate: DateTime.now().toString(),
    });
  }

  updatedatabase(snap, index, tittle, description) {
    NoteDbHelper.instance.update({
      NoteDbHelper.colid: snap.data![index][NoteDbHelper.colid],
      NoteDbHelper.coltitle: tittle,
      NoteDbHelper.coldescription: description,
      NoteDbHelper.coldate: DateTime.now().toString(),
    });
  }

  deletedatabase(snap, index) {
    NoteDbHelper.instance.delete(snap.data![index][NoteDbHelper.colid]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sSecondaryColor,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: sPrimaryColor),
          backgroundColor: sAssistColor,
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          title: const Padding(
            padding: EdgeInsets.only(left: 100),
            child: Text('Note(s)'),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: FutureBuilder(
            future: NoteDbHelper.instance.queryAll(),
            builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snap) {
              if (snap.hasData) {
                return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        deletedatabase(snap, index);
                      },
                      background: Container(
                          color: Colors.red, child: const Icon(Icons.delete)),
                      child: Card(
                        color: sPrimaryColor,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return NotesDet(
                                    title: snap.data![index]
                                    [NoteDbHelper.coltitle],
                                    description: snap.data![index]
                                    [NoteDbHelper.coldescription]);
                              },
                            ));

                            //
                          },
                          leading: IconButton(

                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    var title = '';
                                    var description = '';
                                    return AlertDialog(
                                      backgroundColor: sPrimaryColor,
                                      title: const Text('Edit Note'),
                                      content: Column(

                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            onChanged: (value) {
                                              title = value;
                                            },
                                            decoration: InputDecoration(
                                                hintText: snap.data![index]
                                                [NoteDbHelper.coltitle]),
                                          ),
                                          TextField(
                                              onChanged: (value) {
                                                description = value;
                                              },
                                              decoration: InputDecoration(
                                                  hintText: snap.data![index][
                                                  NoteDbHelper
                                                      .coldescription])),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            style: TextButton.styleFrom(foregroundColor: sSecondaryColor),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel')),
                                        TextButton(
                                            style: TextButton.styleFrom(foregroundColor: sSecondaryColor),
                                            onPressed: () {
                                              updatedatabase(snap, index,
                                                  title, description);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Save'))
                                      ],
                                    );
                                  },
                                );//
                              },
                              icon: const Icon(Icons.edit)),
                          title:
                          Text(snap.data![index][NoteDbHelper.coltitle]),
                          subtitle: Text(
                              snap.data![index][NoteDbHelper.coldescription]),
                          trailing: Text(snap.data![index][NoteDbHelper.coldate]
                              .toString()
                              .substring(0, 10)),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  // child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              var tittle = '';
              var description = '';
              return AlertDialog(
                backgroundColor: sPrimaryColor,
                title: const Text('Add Note'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                        onChanged: (value) {
                          tittle = value;
                        },
                        decoration: const InputDecoration(hintText: 'Title')),
                    TextField(
                      cursorColor: sSecondaryColor,
                        onChanged: (value) {
                          description = value;
                        },
                        decoration:
                        const InputDecoration(hintText: 'Description')),
                  ],
                ),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(foregroundColor: sSecondaryColor),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  TextButton(
                      style: TextButton.styleFrom(foregroundColor: sSecondaryColor),
                      onPressed: () {
                        insertdatabase(tittle, description);
                        Navigator.pop(context);
                      },
                      child: const Text('Save'))
                ],
              );
            },
          );
        },
        backgroundColor: sPrimaryColor,
        foregroundColor: sSecondaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

