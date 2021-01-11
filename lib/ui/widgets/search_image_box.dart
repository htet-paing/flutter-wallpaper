import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_wallpaper/bloc/searchImage/searchimage_bloc.dart';

class SearchImgeBox extends StatefulWidget {
  @override
  _SearchImgeBoxState createState() => _SearchImgeBoxState();
}

class _SearchImgeBoxState extends State<SearchImgeBox> {
  TextEditingController textEditingController = TextEditingController();
  SearchimageBloc searchImageBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: MediaQuery.of(context).size.width * 0.08,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF222222),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: TextFormField(
                  controller: textEditingController,
                  autofocus: true,
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {
                    setState(() {
                      searchImageBloc =
                          BlocProvider.of<SearchimageBloc>(context);
                      searchImageBloc.add(SearchImages(query: textEditingController.text));
                    });
                  },
                  cursorColor: Color(0xFFdddddd),
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins-Regular",
                      color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search.. ",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white54,
                      fontFamily: "Poppins-Regular",
                    ),
                    suffixIcon: InkWell(
                      child: Icon(
                        Icons.close,
                        size: 23,
                        color: Color(0xFF888888),
                      ),
                      onTap: () {
                        setState(() {
                          textEditingController.clear();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
