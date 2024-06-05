import 'package:flutter/material.dart';
import 'package:news_app/Screens/breaking_news.dart';

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
            child: AppBar(
              title:Text("NEWS APP") ,
              bottom: TabBar(tabs: [
                Text("Breaking News"),
                Text("All News")
              ]) ,
            )),
        body:TabBarView(
          children: [
            BreakingNews(),
            Container(color:Colors.yellow ,),
          ],

        ),

      ),
    );
  }
}
