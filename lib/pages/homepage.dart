import 'package:flix/api/api_provider.dart';
import 'package:flix/model/data_model.dart';
import 'package:flix/pages/category_page.dart';
import 'package:flix/pages/titile_info.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final postDetails = PostDetails();
  late Future<List<Show>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = postDetails.apicall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FutureBuilder(
          future: _futurePosts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error ${snapshot.error}"),
              );
            } else {
              final List<Show> allPosts = snapshot.data!;
              // Group the posts by category
              final Map<String, List<Show>> postsByCategory = {};
              for (final post in allPosts) {
                if (postsByCategory.containsKey(post.category)) {
                  postsByCategory[post.category]!.add(post);
                } else {
                  postsByCategory[post.category] = [post];
                }
              }
              return Column(
                children: [
                  const SizedBox(height: 30),
                  for (final category in postsByCategory.keys)
                    _buildSection(
                        category, category, 200, postsByCategory[category]!),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildSection(
      String title, String category, double height, List<Show> posts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryPage(category: category, posts: posts),
                    ),
                  );
                },
                child: const Text(
                  "See All",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: height,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: posts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to Post Details Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TitleInfo(
                          info: posts[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(posts[index].poster),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    // height: 200,
                    width: 140,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
