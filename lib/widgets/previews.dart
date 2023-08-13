import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui/models/content.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  const Previews({
    super.key,
    required this.title,
    required this.contentList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('previews'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 120.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 130,
                      margin: const EdgeInsets.symmetric(horizontal: 6.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            contentList[index].imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                            color: contentList[index].color ??
                                const Color(0xFF000000),
                            width: 4.0),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 130,
                      margin: const EdgeInsets.symmetric(horizontal: 6.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.black87,
                            Colors.black45,
                            Colors.transparent,
                          ],
                          stops: [0,0.25,1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: contentList[index].color ??
                                const Color(0xFF000000),
                            width: 4.0),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0.0,
                      right: 0,
                      child: SizedBox(
                        height: 60.0,
                        child: Image.asset(contentList[index].titleImageUrl!),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
