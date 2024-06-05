import 'package:flutter/material.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:news_app/Services/api_services.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getBreakingNews(),
        builder: (BuildContext context,
            AsyncSnapshot<List<NewsModel>> snapshot) {
          if(snapshot.hasData){
            List<NewsModel>articleList=snapshot.data??[];
            return ListView.builder(
              itemCount:articleList.length ,
                itemBuilder:(context,index){
                return Card(
                  child:Text(articleList[index].title.toString(),style:Theme.of(context).textTheme.titleLarge?.copyWith(color:Colors.pink ) ,) ,
                );

            } );
          }
          return Center(child:CircularProgressIndicator() ,);//circular

          }

      ),
    );
  }
}
// if (snapshot.connectionState == ConnectionState.waiting) {
// return const Center(child: CircularProgressIndicator());
// } else if (snapshot.hasError) {
// return Center(child: Text('Error: ${snapshot.error}'));
// } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// return const Center(child: Text('No data found'));
// } else {
// List<NewsModel> articleList = snapshot.data!;
// return ListView.builder(
// itemCount: articleList.length,
// itemBuilder: (context, index) {
// return Card(
// child: ListTile(
// title: Text(articleList[index].title.toString()),
// subtitle: Text(articleList[index].description.toString()),
// onTap: () {
// // Handle article tap
// },
// ),
// );
// },
// );