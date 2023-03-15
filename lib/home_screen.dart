import 'package:flutter/material.dart';
import './task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<dynamic> w = [];
  List<TaskModel> tasks = [
    TaskModel(title: 'Flutter'),
    TaskModel(title: 'API'),
    TaskModel(title: 'PROVIDER'),
    TaskModel(title: 'HTTP', subTitle: "SUB http"),
  ];
  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final subTitle = TextEditingController();

    return Scaffold(
        appBar: AppBar(title: Center(child: Text("To do Mcamp"))),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        // width: 50,
                        // height: 300,
                        color: Colors.blueGrey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              TextField(
                                controller: title,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: subTitle,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        if (title.text != null &&
                                            title.text.isNotEmpty) {
                                          tasks.add(TaskModel(
                                              title: title.text,
                                              subTitle: subTitle.text));
                                          Navigator.pop(context);
                                        } else {
                                          Navigator.pop(context);
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                  child: Text(" add title"));
                                            },
                                          );
                                        }
                                      });
                                    },
                                    color: Colors.blueAccent,
                                    child: Row(
                                      children: const [
                                        Text(
                                          'ADD',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(Icons.add)
                                      ],
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    color: Colors.green,
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),
        body: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(tasks[index].title),
                    Text(tasks[index].subTitle.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  tasks.remove(tasks[index]);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              )),
                        ),
                        Checkbox(
                            value: tasks[index].isDone,
                            onChanged: (value) {
                              setState(() {
                                tasks[index].isDone = !tasks[index].isDone;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              );
            }));
  }
}
