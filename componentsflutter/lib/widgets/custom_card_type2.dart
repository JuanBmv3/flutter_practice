import 'package:componentsflutter/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2Screen extends StatelessWidget {
  const CustomCardType2Screen(
      {Key? key, required this.imageURL, this.imageTitle})
      : super(key: key);

  final String imageURL;
  final String? imageTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      shadowColor: AppTheme.primary.withOpacity(0.5),
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(imageURL),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover,
          ),
          
          if(imageTitle != null)
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: Text(imageTitle!),
          )
        ],
      ),
    );
  }
}
