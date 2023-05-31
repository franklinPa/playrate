import 'package:flutter/material.dart';

import '../../../config/theme/font_theme.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextTheme textTheme = CustomTextTheme(context, Colors.black,).textTheme;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02,vertical:size.height * 0.01 ),
        child:  
        SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {

                },
              ),
              Text(
                'Home',
                style: textTheme.titleLarge
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search), 
                onPressed: () {
      
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}