import 'package:flix/model/data_model.dart';
import 'package:flix/pages/titile_info.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  final List<Show> posts;

  const CategoryPage({super.key, required this.category, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text('Category: $category'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: posts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.7, crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 20, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TitleInfo(
                                          info: post,
                                        )));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(post.poster),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade700),
                            width: 140,
                            height: 250,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}



/*

ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          // Build your UI for each post item
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.description),
            // Display the post image using the post.img or post.images[0] depending on your data structure
            // Example:
            // leading: Image.network(post.img),
            onTap: () {
              // Navigate to Post Details Screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => PostInfo(post),
              //   ),
              // );
            },
          );
        },
      ),


 */