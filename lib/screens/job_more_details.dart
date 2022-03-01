
import 'package:chefsociety/shared/constants.dart';
import 'package:flutter/material.dart';


class JobMoreDetails extends StatefulWidget {

  final String title;
  final String description;
  final String salary;
  final String contact;
  final String displayname;
  final String photourl;
  final String jobpicurl;
  
  
  const JobMoreDetails({ Key? key,
      required this.title,
      required this.description,
      required this.salary,
      required this.contact,
      required this.displayname,
      required this.photourl,
      required this.jobpicurl,
      
  }) : super(key: key);

  @override
  _JobMoreDetailsState createState() => _JobMoreDetailsState();
}

class _JobMoreDetailsState extends State<JobMoreDetails> {

   


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.35),
                  padding: EdgeInsets.only(
                      top: size.height * 0.10,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin),
                      height: 600,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                        ),
                      ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Contact Details",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 25, 220, 30),
                        child: Text(
                          "\07${widget.contact}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Information",
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPaddin),
                        child: Text(widget.description),
                      ),
                    ],
                  ),
                ),
                productTitleWithImage(context),
              ],
            ))
      ],
    ),
    ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new),
        color: Colors.white,
        onPressed: () => Navigator.pop(context),
      ),
      actions: const [
        SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }


Widget productTitleWithImage(context){


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Job Description",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\Rs${widget.salary}",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 35.0,
                height: 25,
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(30, 180, 30, 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(width: 2),
                          image: DecorationImage(
                            image: NetworkImage(widget.jobpicurl),
                            fit: BoxFit.cover,
                          ),
                          ),
                          ),
                          ),
            ],
          ),
        ],
      ),
    );
  }



}