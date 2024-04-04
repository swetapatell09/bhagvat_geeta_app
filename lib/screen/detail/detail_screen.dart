import 'package:bhagvat_geeta_app/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              Text("${providerR!.chapterList[providerW!.index].name_sanskrit}"),
        ),
        body: Column(
          children: [
            Image.network(
              "${providerR!.chapterList[providerW!.index].imageUrl}",
              height: 200,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: providerW!.verseList.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          border: Border.all(width: 2, color: Colors.grey)),
                      child: Center(
                          child: Text(
                        "${providerW!.verseList[index].text}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
