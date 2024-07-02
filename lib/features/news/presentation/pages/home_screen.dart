import 'package:flutter/material.dart';
import 'package:news_flutter/features/news/data/models/news_model.dart';
import 'package:news_flutter/features/news/data/datasources/viewModels/news_view_models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int selectButtonIndex = 0;
  List<NewsModel> _newsList = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final newsViewModel = NewsViewModel();
    final news = await newsViewModel.getNews();
    setState(() {
      _newsList = [news];
    });
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            selectButtonIndex == 0 ? Colors.red : Colors.grey,
                        width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectButtonIndex = 0;
                      });
                    },
                    child: Text(
                      'General',
                      style: TextStyle(
                          color:
                              selectButtonIndex == 0 ? Colors.red : Colors.grey,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            selectButtonIndex == 1 ? Colors.red : Colors.grey,
                        width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectButtonIndex = 1;
                      });
                    },
                    child: Text(
                      'Health',
                      style: TextStyle(
                          color:
                              selectButtonIndex == 1 ? Colors.red : Colors.grey,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            selectButtonIndex == 2 ? Colors.red : Colors.grey,
                        width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectButtonIndex = 2;
                      });
                    },
                    child: Text(
                      'Finance',
                      style: TextStyle(
                          color:
                              selectButtonIndex == 2 ? Colors.red : Colors.grey,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
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
        Container(
          width: 380,
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: const Color.fromARGB(161, 158, 158, 158), width: 1.0)),
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
                      child: Stack(children: [
                        Image.network(
                            _newsList[0].articles[0].urlToImage.toString(),
                            width: 350,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Text('No Image'),
                          );
                        }),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 10),
                              child: const Positioned(
                                  child: CircleAvatar(
                                radius:
                                    20, // Adjust the size of the avatar as needed
                                backgroundColor: Colors
                                    .white, // Background color of the avatar
                                child: Icon(
                                  Icons
                                      .person, // Replace with your preferred icon
                                  color: Colors.black, // Icon color
                                  size: 30, // Size of the icon
                                ),
                              )),
                            ),
                            Text(
                              _newsList[0].articles[0].source.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 150, left: 10),
                          child: Column(
                            children: [
                              Text(
                                _newsList[0].articles[0].publishedAt.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 247, 255, 246),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      _newsList[0].articles[0].title,
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
        //add listview here
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _newsList[0].articles.length,
            itemBuilder: (context, index) {
              return Container(
                width: 350,
                height: 100,
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
                        width: 300,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                              _newsList[0]
                                  .articles[index + 1]
                                  .urlToImage
                                  .toString(),
                              width: 350,
                              height: 200,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Text('No Image'),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        _newsList[0].articles[index + 1].title,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _newsList[0].articles[index + 1].author.toString(),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
