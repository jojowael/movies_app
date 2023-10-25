import 'package:flutter/material.dart';
import 'package:movies_development/myTheme.dart';

class SearchTab extends StatelessWidget {
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
                        decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      hintText: "Search",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              color: MyTheme.greyBorderColor, fontSize: 20),
                      prefixIcon: Icon(
                        Icons.search,
                        color: MyTheme.white,
                        size: 20,
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
      ],
    );
    // Container(
    //   height: 35,
    //   decoration: BoxDecoration(
    //       border: Border.all(color: Colors.white),
    //     borderRadius: BorderRadius.circular(25),
    //     color: MyTheme.greyColor
    //   ),
    //   child: Row(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Icon(Icons.search, color: MyTheme.white,
    //         size: 20,),
    //       ),
    //       SizedBox(width: 20,),
    //       Text('Search',
    //       style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.greyBorderColor,fontSize: 20),
    //       )
    //     ],
    //   ),
    // ),
    //
    //
    //           ),
    //         )
    // ]
    //   );
  }
}
