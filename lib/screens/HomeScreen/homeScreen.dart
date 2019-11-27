import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Gotham-Book',
        scaffoldBackgroundColor: Color(0XFF161d21),
        primaryColorDark: Color(0XFF161d21),
        primaryColor: Color(0xFF51fa8f),
        accentColor: Color(0xFF51fa8f),
      ),
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
        ),
        body: SlidesScreen(),
      ),
    );
  }
}

class SlidesScreen extends StatefulWidget {
  @override
  _SlidesScreenState createState() => _SlidesScreenState();
}

class _SlidesScreenState extends State<SlidesScreen> {
  final PageController controller = PageController(viewportFraction: 0.9);
  int currentPage = 0;
  List<String> headings = ["PRODUCTION DESIGN", "DEVELOPMENT", "TESTING & QA"];
  List<List<String>> allslidesContent = [
    ["Mobile & Web", "Smart TV", "IOT"],
    ["IOS and TVOS", "Android and IOS", "ETC"],
    ["UX Reviews", "Usability and Testing", "More and More"]
  ];

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      int next = controller.page.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: allslidesContent.length,
      itemBuilder: (context, index) {
        bool active = currentPage == index;

        return _buildView(active, headings[index],
            itemList: allslidesContent[index]);
      },
    );
  }

  Widget _buildView(bool active, String heading,
      {@required List<String> itemList}) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 200;

    List<Widget> widgetList = [];
    for (String item in itemList) {
      widgetList.add(Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Text(
          item,
          style: TextStyle(fontSize: 20),
        ),
      ));
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
      curve: Curves.easeOutQuint,
      padding: EdgeInsets.all(20),
      height: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black87,
                blurRadius: blur,
                offset: Offset(offset, offset))
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                heading,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                color: Theme.of(context).primaryColor,
                height: 4,
                width: 150,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: widgetList)
        ],
      ),
    );
  }
}
