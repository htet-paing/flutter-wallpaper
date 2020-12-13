import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hp_wallpaper/model/image_model.dart';
import 'package:share/share.dart';

class ImageScreen extends StatefulWidget {
  final Hit image;
  ImageScreen({this.image});
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );
  }

  void setWallpaperDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
            color: Colors.black,
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Set a Wallpaper', style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600
                )),
                Row(
                  children: [
                    Icon(Icons.home, color: Colors.white,),
                    SizedBox(width: 10.0,),
                    Text('Home Screen', style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.lock, color: Colors.white,),
                    SizedBox(width: 10.0,),
                    Text('Lock Screen', style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.phone_android, color: Colors.white,),
                    SizedBox(width: 10.0,),
                    Text('Both', style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (contxt, child) => Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: GestureDetector(
                onTap: () {
                  if (_controller.isCompleted) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                },
                child: CachedNetworkImage(
                  imageUrl: widget.image.largeImageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.translate(
                    offset: Offset(0, -_controller.value * 64.0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      height: 64.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0)
                        ),
                        boxShadow: [
                          BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 0.2),
                          blurRadius: 6.0
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back,
                              color: Colors.white,),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Visibility(
                            visible: true,
                            child: Container(
                              height: 64.0,
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FlatButton(
                                child: Text('set as wallpaper', style: TextStyle(
                                  color: Colors.white
                                ),),
                                onPressed: setWallpaperDialog,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Transform.translate(
                    offset: Offset(0, _controller.value * 64.0),
                    child: Container(
                      height: 64.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0)
                        ),
                        boxShadow: [
                          BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 0.2),
                          blurRadius: 6.0
                          )
                        ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 16.0,
                                  backgroundImage: NetworkImage(widget.image.userImageURL),
                                ),
                                SizedBox(width: 10.0),
                                Text(widget.image.user, style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  color: Colors.white
                                ),),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.share,
                                  color: Colors.white,),
                                  onPressed: () {
                                    Share.share(widget.image.pageURL);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.file_download,
                                  color: Colors.white,),
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                      msg: 'Downloading image..',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM
                                    );
                                  },
                                )
                              ],
                            )
                            
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}