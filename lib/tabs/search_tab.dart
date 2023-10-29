import 'package:flutter/material.dart';
import 'package:movies_development/myTheme.dart';
import 'package:movies_development/search/search_movie_delegate.dart';

class SearchTab extends StatelessWidget {
  //create list of movie used api
  void updateList(String value) {
    //function that filter our list
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.black,
          child: Center(child: Image.asset('assets/images/Group 22.png')),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(25),
                        color: MyTheme.greyColor),
                    child: TextField(
                        style: TextStyle(color: MyTheme.white),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          hintText: "Search",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: MyTheme.greyBorderColor, fontSize: 20),
                          prefixIcon: InkWell(
                            onTap: () => showSearch(
                                context: context,
                                delegate: SearchMovieDelegate()),
                            child: Icon(
                              Icons.search,
                              color: MyTheme.white,
                              size: 20,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Expanded(child: ListView.builder(
        //   itemCount: ,
        //     itemBuilder: (context,index)=>ListTile()
        // ),
        // ),
      ],
    );
  }
}
