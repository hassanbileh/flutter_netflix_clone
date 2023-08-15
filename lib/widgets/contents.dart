import 'package:flutter/material.dart';

import '../models/content.dart';

class ContentsList extends StatelessWidget {
  final String title;
  final List<Content> contents;
  final bool? isOriginals;
  final Function() onTap;
  const ContentsList({
    super.key,
    required this.title,
    required this.contents,
    this.isOriginals, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            height: (isOriginals != false) ? 400.0 : 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: contents.length,
              itemBuilder: (context, index) {
                
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height:(isOriginals != false) ? 400.0 : 200.0,
                      width: (isOriginals != false) ? 200.0 : 130.0,
                      margin: const EdgeInsets.symmetric(horizontal: 6.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: AssetImage(
                            contents[index].imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                        
                      ),
                    ),
                    Container(
                      height:(isOriginals != false) ? 400.0 : 200.0,
                      width: (isOriginals != false) ? 200.0 : 130.0,
                      margin: const EdgeInsets.symmetric(horizontal: 6.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black45,
                              Colors.transparent,
                            ],
                            stops: [
                              0,
                              0.1,
                              0.8
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                        border: Border.all(
                            color: contents[index].color ??
                                const Color(0xFF000000),
                            width: 4.0),
                      ),
                    ),
                    
                  ],
                );
              
              },
            ),
          ),
        ),
            
      ],
    );
  }
}
