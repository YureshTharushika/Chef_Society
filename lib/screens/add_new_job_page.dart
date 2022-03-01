import 'package:flutter/material.dart';

class AddNewJobPage extends StatefulWidget {
  const AddNewJobPage({ Key? key }) : super(key: key);

  @override
  _AddNewJobPageState createState() => _AddNewJobPageState();
}

class _AddNewJobPageState extends State<AddNewJobPage> {
  @override
  Widget build(BuildContext context) {
    final sampledata1 = TextEditingController();
    final sampledata2 = TextEditingController();
    final sampledata3 = TextEditingController();
    final sampledata4 = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add New Job"),
        ),
        body: Stack(
          children: [
              Container(
                    decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background/chefbg8.jpg"),
                        fit: BoxFit.cover)
                        ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(3),
                  child: Container(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                       
                        const SizedBox(
                          height: 65,
                        ),
                        TextFormField(
                            controller: sampledata1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Title",
                            ),
                            ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            controller: sampledata2,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Description",
                            ),
                            ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            controller: sampledata3,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Budget",
                            ),
                            ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                            controller: sampledata4,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Location",
                            ),
                            ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                           
                          },
                          child: Text('Choose images'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            
                          },
                          child: Text("Publish"),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        )
        );
  }
}