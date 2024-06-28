import 'package:demo_app/models/NewsModel.dart';
import 'package:demo_app/screens/newsScreen/bloc/NewsScreen_bloc.dart';
import 'package:demo_app/screens/newsScreen/bloc/NewsScreen_event.dart';
import 'package:demo_app/screens/newsScreen/bloc/NewsScreen_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Newsscreen extends StatefulWidget {
   final TextEditingController searchText = TextEditingController();

  @override
  State<Newsscreen> createState() => _NewsscreenState();
}

class _NewsscreenState extends State<Newsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  String searchText = widget.searchText.text.trim();
                  context.read<NewsscreenBloc>().add(SearchnewsEvent(searchTerm: searchText));
                },
                icon: Icon(Icons.search)),
            Expanded(
              child: TextField(
                controller: widget.searchText,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none
                ),
              ),
            ),
          ],
        ),
      ),
      body:
      BlocBuilder<NewsscreenBloc,NewsscreenState> (
        builder: (context,state) {
          if (state is NewsInitial) {
            return Center(child: Text("Your data is being fetched...please wait"));
          } else if (state is NewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context,index) {
                final article =  state.articles[index];
                return Newsmodel(
                  title: article['title'] ?? 'No Title',
                  description: article['description'] ?? 'No Description',
                  publishedAt: article['publishedAt'] ?? 'No Date',
                  imageUrl: article['urlToImage'] ?? 'https://res.cloudinary.com/dlramkpev/image/upload/v1718040217/lms/naozwhguvxmeaf8hvuxl.jpg',
                );
              },
            );
          } else if (state is NewsError) {
            return Center(child: Text(state.message));
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}
