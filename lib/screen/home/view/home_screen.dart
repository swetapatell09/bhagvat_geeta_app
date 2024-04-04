import 'package:bhagvat_geeta_app/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("|| भगवद गीता ||"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                providerR!.setThemeData();
              },
              icon: Icon(providerW!.theme == true
                  ? Icons.light_mode
                  : Icons.dark_mode))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: providerW!.chapterList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  providerR!
                      .getVerse(providerR!.chapterList[index]!.chapter_number!);
                  Navigator.pushNamed(context, 'detail');
                  providerR!.setIndex(index);
                },
                child: Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.deepOrangeAccent),
                  child: Row(
                    children: [
                      Text("${providerR!.chapterList[index].chapter_number}"),
                      SizedBox(
                        width: 20,
                      ),
                      Text("${providerR!.chapterList[index].name_sanskrit}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
