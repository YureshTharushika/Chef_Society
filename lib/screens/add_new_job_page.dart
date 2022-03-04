
import 'dart:io';
import 'package:chefsociety/shared/shared_widgets.dart';
import 'package:chefsociety/widgets/image_pick_and_confirm_button.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:chefsociety/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewJobPage extends StatefulWidget {
  const AddNewJobPage({ Key? key }) : super(key: key);

  @override
  _AddNewJobPageState createState() => _AddNewJobPageState();
}

class _AddNewJobPageState extends State<AddNewJobPage> {

  final _jobFormKey = GlobalKey<FormState>();  
  final user = FirebaseAuth.instance.currentUser!;

  final titleController = TextEditingController();
  final cityController = TextEditingController();
  final descriptionController = TextEditingController(); 
  final salaryController = TextEditingController();
  final contactController = TextEditingController();
  
  final urlImage = 'https://images.unsplash.com/photo-1575116703938-36c55eff7c4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=418&q=80';  

  String title = '';
  String country = '';
  String city = '';
  String description = '';
  double salary = 0;
  int contact = 0;
  String jobPhotoUrl = '';

  var myInitialItem = 'India';
  final items = [ 'India',
                  'Sri Lanka',
                  'United Kingdom',
                  'United States'
                  ];
  

  @override
  void initState(){
    super.initState();
    titleController.addListener(() => setState(() { }));
    cityController.addListener(() => setState(() { }));
    descriptionController.addListener(() => setState(() { }));
    salaryController.addListener(() => setState(() { }));
    contactController.addListener(() => setState(() { }));

  }

  UploadTask? task;
  File? imagefile;

  Future pickImage() async{

    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      
      final imageTemporary = File(image.path);
       setState(()=>imagefile = imageTemporary);
    } on Exception catch (e) {
      print(e.toString());
    }

  }

  Future uploadImage() async{
    if(imagefile==null) return;

    final imageName = basename(imagefile!.path);
    final destination = 'JobImages/$imageName';

    task = FirebaseApi.uploadFile(destination , imagefile!);
    setState(() {});

    if(task == null) return;

    final snapshot = await task!.whenComplete((){});
    final jobPicURL = await snapshot.ref.getDownloadURL();

    jobPhotoUrl = jobPicURL;

  }

  Widget uploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
    stream: task.snapshotEvents,
    builder: (context, snapshot){
              if(snapshot.hasData){
                  final snap = snapshot.data!;
                  final progress = snap.bytesTransferred/snap.totalBytes;
                  final persentage = (progress*100).toStringAsFixed(2);

                  return Text(
                    '$persentage %',
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),
                  );
              }else{
                return Container();
              }
    },
    );


  @override
  Widget build(BuildContext context) {
    
    final imageSelection = imagefile !=null? 'Photo Selected' : 'No Photo Selected';


    return BackgroundImageWidget(
      image: NetworkImage(urlImage), 
      child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Setup Job Advertiesment'),
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: SingleChildScrollView(
          reverse: true,

          
        child:  Form(
          key: _jobFormKey,
          child: Column(
            children: <Widget>[


              const SizedBox(height: 5,),

              imagefile !=null? ClipRRect(
                child: Image.file(imagefile!,fit: BoxFit.cover,
                ),
              ): const Image(image: NetworkImage('https://images.unsplash.com/photo-1611262588024-d12430b98920?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
              ),

              const SizedBox(height: 10,),

              ImagePickAndConfirmButton(
                title: 'Pick a Photo',
                icon:Icons.image_outlined ,
                onClicked:()=> pickImage(),
              ),
              Text(
                imageSelection,
                style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
              const SizedBox(height: 10,),

              ImagePickAndConfirmButton(
                title: 'Confirm',
                icon:Icons.done ,
                onClicked:()=> uploadImage(),
              ),
              task != null? uploadStatus(task!): Container(),


              const SizedBox(height: 10,),
              
              // Title Form Field
              TextFormField(

                controller: titleController,
                decoration:  InputDecoration(
                  labelText: 'Title',
                  hintText: 'Your job title',
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

              // Title Form Field Ends

              const SizedBox(height: 10,),

              const Text('Choose Country:',
              style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,),
              ),
              const SizedBox(height: 5,),

              // Country Dropdown Menu
              buildDropDownMenu(),


                // Country Dropdown Menu Ends

              const SizedBox(height: 10,),


              // City Form Field
              TextFormField(

                controller: cityController,
                decoration:  InputDecoration(
                  labelText: 'City',
                  hintText: 'Your city/town',
                  suffixIcon: cityController.text.isEmpty? Container(width: 0,) : IconButton(
                    onPressed: () => cityController.clear(), 
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
                    return 'Please enter a city';
                          }
                    return null;
                    },
                onChanged: (val){
                  setState(() => city = val);
                },
              ),

              // City Form Field Ends

              const SizedBox(height: 10,),

              // description Form Field
              TextFormField(

                controller: descriptionController,
                textInputAction: TextInputAction.done,
                decoration:  InputDecoration(
                  labelText: 'Description',
                  hintText: 'Job description and requirements',
                  suffixIcon: descriptionController.text.isEmpty? Container(width: 0,) : IconButton(
                    onPressed: () => descriptionController.clear(), 
                    icon: const Icon(Icons.close)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  
                ),

                //maxLength: 75,
                maxLines: 10,
                
                validator: ( val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter job description';
                          }
                    return null;
                    },
                onChanged: (val){
                  setState(() => description = val);
                },
              ),

              // description Form Field Ends

              const SizedBox(height: 10,),

              // salary Form Field
              TextFormField(

                controller: salaryController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                textInputAction: TextInputAction.done,
                decoration:  InputDecoration(
                  labelText: 'Budget',
                  hintText: 'Estimated monthly salary',
                  suffixIcon: salaryController.text.isEmpty? Container(width: 0,) : IconButton(
                    onPressed: () => salaryController.clear(), 
                    icon: const Icon(Icons.close)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  
                ),

                  maxLength: 8,
                //maxLines: 10,
                
                validator: ( val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter monthly salary';
                          }
                    return null;
                    },
                onChanged: (val){
                  setState(() => salary = double.parse(val));
                },
              ),

              // salary Form Field Ends

              const SizedBox(height: 10,),

              TextFormField(

                controller: contactController,
                keyboardType: const TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]')),],
                textInputAction: TextInputAction.done,
                decoration:  InputDecoration(
                  labelText: 'Contact',
                  hintText: 'Enter your contact number',
                  suffixIcon: contactController.text.isEmpty? Container(width: 0,) : IconButton(
                    onPressed: () => contactController.clear(), 
                    icon: const Icon(Icons.close)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  
                ),

                  maxLength: 12,
                //maxLines: 10,
                
                validator: ( val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter contact number';
                          }
                    return null;
                    },
                onChanged: (val){
                  setState(() => contact = int.parse(val));
                },
              ),

              const SizedBox(height: 10,),

              // Submit Button

               buildSubmitButton(),
              
              // Submit Button Ends
              const SizedBox(height: 10,),
              
            ],
            
          ),
          ),
        ),
      ),
    ),
    );
  }

Widget buildDropDownMenu(){
  return Container(
                // margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade600 , width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child:  DropdownButton<String>(
                  value: myInitialItem,
                  iconSize: 36,
                  icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.grey.shade800,),
                  isExpanded: true,
                  onChanged: (value){
                    myInitialItem = value!;
                    setState(() => country = value);

                  },
                  
                  items: items.map((items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  ),
                  ), 
              );
}

Widget buildSubmitButton(){

  return ElevatedButton(

                 style: ElevatedButton.styleFrom(shape: const StadiumBorder(),
                 minimumSize: const Size.fromHeight(40),
                 primary: Colors.green),
                
                child: const Text('PUBLISH',
                          style: TextStyle(color: Colors.white),
                          ),
                
                onPressed: () async{
                  if(imagefile !=null){
                    
                    if(_jobFormKey.currentState!.validate()){
                    //call function here
                    await DatabaseService().addNewJob(title, country , city , description, salary, contact, user.uid, user.displayName!,user.photoURL!,jobPhotoUrl);
                    titleController.clear();
                    cityController.clear();
                    descriptionController.clear();
                    salaryController.clear();
                    contactController.clear();
                  }else{
                  const Center(child: Text('Something went wrong!'));
                  }

                  }else{
                    const Center(child: Text('Please select and confirm a photo!'));
                  }
                  
                },
              );
}



}



