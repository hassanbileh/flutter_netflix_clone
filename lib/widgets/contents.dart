import 'package:flutter/material.dart';

import '../models/content.dart';

class ContentsList extends StatelessWidget {
  final String title;
  final List<Content> contents;
  final bool? isOriginals;
  const ContentsList({
    super.key,
    required this.title,
    required this.contents,
    this.isOriginals,
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
        
        // separate originals and others
        (isOriginals != false) ? 
        // is Originals
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          height: 400.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contents.length,
            itemBuilder: (context, index) {
              
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 400,
                    width: 200,
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
                    height: 400,
                    width: 200,
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
                            0.25,
                            1
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
        )
        : 
        // is not originals
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contents.length,
            itemBuilder: (context, index) {
              
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 200.0,
                    width: 130.0,
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
                    height: 200.0,
                    width: 130.0,
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
                            0.25,
                            1
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
            
      ],
    );
  }
}
