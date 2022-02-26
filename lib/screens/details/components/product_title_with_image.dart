import 'package:flutter/material.dart';
import 'package:chefsociety/models/Product.dart';

import '../../../constants.dart';

//inside page of the job description
class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Job Description",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\Rs${product.price}",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 35.0,
                height: 25,
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(30, 180, 30, 30),
                      decoration: BoxDecoration(
                          color: product.color,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(width: 2),
                          image: DecorationImage(
                            image: AssetImage(product.image),
                            fit: BoxFit.cover,
                          )))),
            ],
          )
        ],
      ),
    );
  }
}
