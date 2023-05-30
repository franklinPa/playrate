import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02,vertical:size.height * 0.01 ),
        child:  
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu), 
                onPressed: () {
      
                },
              ),
              Text(
                'Home',
                
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: size.height * 0.03,
                ),
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