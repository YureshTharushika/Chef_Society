



import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/shared/shared_widgets.dart';
import 'package:chefsociety/widgets/image_pick_and_confirm_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewRecipe extends StatefulWidget {
  const AddNewRecipe({ Key? key }) : super(key: key);

  @override
  _AddNewRecipeState createState() => _AddNewRecipeState();
}

class _AddNewRecipeState extends State<AddNewRecipe> {

  final _recipeFormKey = GlobalKey<FormState>();  
  final user = FirebaseAuth.instance.currentUser!;

  final titleController = TextEditingController();
  final ingredientsController = TextEditingController(); 
  final directionsController = TextEditingController();
  final urlImage = 'https://images.unsplash.com/photo-1575116703938-36c55eff7c4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=418&q=80';  

  String title = '';
  String category = '';
  String ingredients = '';
  String directions = '';
  String recipePhotoUrl = '';

  var myInitialItem = 'Any';
  final items = [ 'Any',
                  'Appetisers',
                  'Baked Goods',
                  'Breakfast',
                  'Dessert',
                  'Dinner',
                  'Drinks',
                  'Lunch',
                  'Main-Course',
                  'Salads',
                  'Side-Dishes',
                  'Snacks',
                  'Soups'
                  ];
  

  @override
  void initState(){
    super.initState();
    titleController.addListener(() => setState(() { }));
    ingredientsController.addListener(() => setState(() { }));
    directionsController.addListener(() => setState(() { }));

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
    final destination = 'RecipeImages/$imageName';

    task = FirebaseApi.uploadFile(destination , imagefile!);
    setState(() {});

    if(task == null) return;

    final snapshot = await task!.whenComplete((){});
    final recipePicURL = await snapshot.ref.getDownloadURL();

    recipePhotoUrl = recipePicURL;

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
        title: const Text('Make Your Recipe'),
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: SingleChildScrollView(
          reverse: true,

          
        child:  Form(
          key: _recipeFormKey,
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
                  hintText: 'My new recipe',
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

              const Text('Choose Category:',
              style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,),
              ),
              const SizedBox(height: 5,),

              // Category Dropdown Menu
              buildDropDownMenu(),


                // Category Dropdown Menu Ends

              const SizedBox(height: 10,),

              // Ingredients Form Field
              TextFormField(

                controller: ingredientsController,
                textInputAction: TextInputAction.done,
                decoration:  InputDecoration(
                  labelText: 'Ingredients',
                  hintText: 'Required ingredients',
                  suffixIcon: ingredientsController.text.isEmpty? Container(width: 0,) : IconButton(
                    onPressed: () => ingredientsController.clear(), 
                    icon: const Icon(Icons.close)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  
                ),

                //maxLength: 75,
                maxLines: 5,
                
                validator: ( val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter ingredients';
                          }
                    return null;
                    },
                onChanged: (val){
                  setState(() => ingredients = val);
                },
              ),

              // Ingredients Form Field Ends

              const SizedBox(height: 10,),

              // Directions Form Field
              TextFormField(

                controller: directionsController,
                textInputAction: TextInputAction.done,
                decoration:  InputDecoration(
                  labelText: 'Cooking Directions',
                  hintText: 'Here goes cooking directions!',
                  suffixIcon: directionsController.text.isEmpty? Container(width: 0,) : IconButton(
                    onPressed: () => directionsController.clear(), 
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
                    return 'Please enter cooking directions';
                          }
                    return null;
                    },
                onChanged: (val){
                  setState(() => directions = val);
                },
              ),

              // Directions Form Field Ends

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
                    setState(() => category = value);

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
                    
                    if(_recipeFormKey.currentState!.validate()){
                    //call function here
                    await DatabaseService().addNewRecipe(title, category , ingredients , directions, user.uid, user.displayName!,user.photoURL!,recipePhotoUrl);
                    titleController.clear();
                    ingredientsController.clear();
                    directionsController.clear();
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