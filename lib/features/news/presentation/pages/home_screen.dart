import 'package:flutter/material.dart';
import 'package:news_flutter/features/news/data/datasources/remote/news_remote_data_source.dart';
import 'package:news_flutter/features/news/data/models/article_model.dart';

import 'package:news_flutter/features/news/presentation/pages/news_detail_screen.dart';

import 'package:news_flutter/features/news/presentation/widget/catagory_button.dart';
import 'package:news_flutter/features/news/presentation/widget/news_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int selectButtonIndex = 0;
  List<Article> _newsList = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    try {
      final news = await NewsRemoteDataSource().fetchNews();

      setState(() {
        _newsList =
            news.articles; // Assuming articles is already a List<NewsModel>
      });
    } catch (e) {
      print('Error fetching news: $e');
      // Handle error (show error message, update UI accordingly)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "INBOUND",
                  style: TextStyle(fontSize: 21, fontStyle: FontStyle.normal),
                ),
                Row(
                  children: [
                    Text(
                      "NEWS",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.newspaper_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      //add line between appbar and body

      body: Column(children: [
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                  color: Color.fromARGB(111, 158, 158, 158), width: 1.0),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        CategoryButtons(
          selectButtonIndex: selectButtonIndex,
          onButtonPressed: (index) {
            setState(() {
              selectButtonIndex = index;
            });
          },
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text("Inbound Now!",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewsDetail(article: _newsList[0]);
            }));
          },
          child: Container(
            width: 380,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: const Color.fromARGB(161, 158, 158, 158),
                    width: 1.0)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 350,
                      height: 200,
                      margin: const EdgeInsets.only(top: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: _newsList.isEmpty
                            ? Center(child: CircularProgressIndicator())
                            : Image.network(_newsList[0].urlToImage,
                                width: 350, fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Text('No Image'),
                                );
                              }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        _newsList.isEmpty ? '' : _newsList[0].title,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 10, left: 10),
            child: const Text("Other News:",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.red))),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _newsList.length,
            itemBuilder: (context, index) {
              return NewsListItemWidget(article: _newsList[index + 1]);
            },
          ),
        ),
      ]),
    );
  }
}
