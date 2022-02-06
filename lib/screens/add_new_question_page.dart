import 'package:chefsociety/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AddNewQuestionPage extends StatefulWidget {
  const AddNewQuestionPage({Key? key}) : super(key: key);

  @override
  State<AddNewQuestionPage> createState() => _AddNewQuestionPageState();
}

class _AddNewQuestionPageState extends State<AddNewQuestionPage> {

  final _questionFormKey = GlobalKey<FormState>();  
  final user = FirebaseAuth.instance.currentUser!;

  final titleController = TextEditingController();
  final questionBodyController = TextEditingController();
  final tagsController = TextEditingController();


  String title = '';
  String question = '';
  String tags = '';


  @override
  void initState(){
    super.initState();
    titleController.addListener(() => setState(() { }));
    questionBodyController.addListener(() => setState(() { }));
    tagsController.addListener(() => setState(() { }));
    

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Ask Your Question'),
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: SingleChildScrollView(
          reverse: true,
        child: Form(
          key: _questionFormKey,
          child: Column(
            children: [

              const SizedBox(height: 5,),

              TextFormField(

                controller: titleController,
                decoration:  InputDecoration(
                  labelText: 'Title',
                  hintText: 'Ask your question short and specific',
                  suffixIcon: titleController.text.isEmpty? Container(width: 0,) : IconButton(
                    onPressed: () => titleController.clear(), 
                    icon: const Icon(Icons.close)),
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(16),
                  ),
                  
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  
                ),

                maxLength: 75,
                validator: ( val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a title';
                          }
                    return null;
                    },
                onChanged: (val){
                  setState(() => title = val);
                },
              ),



              const SizedBox(height: 10,),

              TextFormField(

                controller: questionBodyController,
                textInputAction: TextInputAction.done,
                decoration:  InputDecoration(
                  labelText: 'Question Body',
                  hintText: 'Properly describe your question here',
                  suffixIcon: questionBodyController.text.isEmpty? Container(width: 0,) : IconButton(
                    onPressed: () => questionBodyController.clear(), 
                    icon: const Icon(Icons.close)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  
                ),

                //maxLength: 75,
                maxLines: 12,
                
                validator: ( val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter cooking directions';
                          }
                    return null;
                    },
                onChanged: (val){
                  setState(() => question = val);
                },
              ),

              const SizedBox(height: 10,),

              TextFormField(

                controller: tagsController,
                textInputAction: TextInputAction.done,
                decoration:  InputDecoration(
                  labelText: 'Tags',
                  hintText: 'Add upto 4 tags about your question',
                  suffixIcon: tagsController.text.isEmpty? Container(width: 0,) : IconButton(
                    onPressed: () => tagsController.clear(), 
                    icon: const Icon(Icons.close)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  
                ),

                //maxLength: 75,
                maxLines: 2,
                
                validator: ( val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter at least 1 tag';
                          }else if(val.split(",").length>4){
                    return 'Please enter 4 or less tags';
                          }
                    return null;
                    },
                onChanged: (val){
                  setState(() => tags = val);
                },
              ),

              const SizedBox(height: 10,),

              buildSubmitButton(),

              const SizedBox(height: 10,),

            ],
          ),
          ),
          ),
      ),
    );
  }

  Widget buildSubmitButton(){

  return ElevatedButton(

                 style: ElevatedButton.styleFrom(shape: const StadiumBorder(),
                 minimumSize: const Size.fromHeight(40),
                 primary: Colors.green),
                
                child: const Text('POST',
                          style: TextStyle(color: Colors.white),
                          ),
                
                onPressed: () async{
                  
                    
                    if(_questionFormKey.currentState!.validate()){
                    //call function here
                    await DatabaseService().addNewQuestion(title, question , tags , user.uid, user.displayName!,user.photoURL!);
                    titleController.clear();
                    questionBodyController.clear();
                    tagsController.clear();
                  }else{
                  const Center(child: Text('Something went wrong!'));
                  }

                  
                  
                },
              );
}


}