import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

List text = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    sendRequest(
        "https://dehghanifard.ir/%d8%a2%d9%85%d9%88%d8%b2%d8%b4-%d8%a8%d8%b1%d9%86%d8%a7%d9%85%d9%87-%d9%86%d9%88%db%8c%d8%b3%db%8c-%d8%ba%db%8c%d8%b1-%d9%87%d9%85%d8%b2%d9%85%d8%a7%d9%86-%d8%af%d8%b1-%d8%b2%d8%a8%d8%a7%d9%86-%d8%af/");

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: ListView.builder(
          itemCount: text.length,
          itemBuilder: (context, index) {
            return Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  text[index],
                  style: TextStyle(color: Colors.amber),
                ));
          },
        ),
      ),
    );
  }
}

sendRequest(String url) async {
  final response = await http.get(Uri.parse(url));

  // if (response.statusCode == 200) {
  //   var article = parse(response.body);
  //   return article.getElementsByTagName("p").toList().forEach((element) {
  //     if (article.getElementsByTagName("p").length > 20) {
  //       text.add(element.text);
  //     }
  //   });
  // } else {
  //   throw Exception('Failed to load article data');
  // }
}

Future<void> saveDataArticle(String data) async {
  final box = await Hive.openBox("article");
  await box.put("data", data);
  await box.close();
}
