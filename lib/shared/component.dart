import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talent/models/post_model.dart';
import 'package:talent/models/user_model.dart';
import 'package:talent/modules/User/video_widget_profile.dart';

Widget buildPost() => Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 10,
  margin: EdgeInsets.symmetric(horizontal: 8),
  child: Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'),
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: InkWell(
                onTap: (){
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'User name',
                          style: TextStyle(height: 1),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 15,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '2023/5/12',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )),
        ]),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 10),
        //   child: Container(
        //     color: Colors.grey,
        //     height: 1,
        //     width: double.infinity,
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'hey',
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 2, fontSize: 15),
            ),
          ],
        ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'))),
              ),


            ],
          ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.grey,
                        ),
                        onPressed: () {

                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '10',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                onTap: () {},
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: (){
                        },
                        icon: Icon(
                          Icons.chat,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '10',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),


      ],
    ),
  ),
);


Widget buildPostProfileImage({PostModel? model,function,Function? likeFun,like}) => Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.6),
        spreadRadius: 1,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  ),

  child:   Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'),
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: InkWell(
                onTap: (){
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${model!.name}',
                          style: TextStyle(height: 1),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 15,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Text('time: ${DateFormat('HH:mm').format(DateTime.parse(model.dateTime.toString()))}',style: TextStyle(color: Colors.grey),),
                        Text('date: ${DateFormat('MM-dd').format(DateTime.parse(model.dateTime.toString()))}',style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              )),
        ]),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 10),
        //   child: Container(
        //     color: Colors.grey,
        //     height: 1,
        //     width: double.infinity,
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            model.text==null?
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 2, fontSize: 15),
            ):
            Text(
              '${model.text}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 2, fontSize: 15),
            ),
          ],
        ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('${model.video}'))),
              ),


            ],
          ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        Row(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){
                  likeFun!();
                }, icon: Icon(CupertinoIcons.heart_fill,color: Colors.grey,)),
                like==null?Text(''):Text('${like.toString()}',)
              ],
            ),
            Spacer(),
            IconButton(onPressed: (){
              function();
            }, icon: Icon(Icons.chat,color: Colors.grey,)),
          ],
        )


      ],
    ),
  ),
);
Widget buildPostAdminImage({PostModel? model,function,Function? delFun,like}) => Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.6),
        spreadRadius: 1,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  ),

  child:   Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'),
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: InkWell(
                onTap: (){
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${model!.name}',
                          style: TextStyle(height: 1),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 15,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Text('time: ${DateFormat('HH:mm').format(DateTime.parse(model.dateTime.toString()))}',style: TextStyle(color: Colors.grey),),
                        Text('date: ${DateFormat('MM-dd').format(DateTime.parse(model.dateTime.toString()))}',style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              )),
          IconButton(onPressed: (){
            delFun!();
          }, icon: Icon(Icons.delete))
        ]),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 10),
        //   child: Container(
        //     color: Colors.grey,
        //     height: 1,
        //     width: double.infinity,
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            model.text==null?
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 2, fontSize: 15),
            ):
            Text(
              '${model.text}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 2, fontSize: 15),
            ),
          ],
        ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('${model.video}'))),
              ),


            ],
          ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        Row(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart_fill,color: Colors.grey,)),
                Text('${like.toString()}')
              ],
            ),
            Spacer(),
            IconButton(onPressed: (){
              function();
            }, icon: Icon(Icons.chat,color: Colors.grey,)),
          ],
        )


      ],
    ),
  ),
);
Widget buildPostProfileVideo({PostModel? model,function,Function ?likeFun,like}) => Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 10,

  margin: EdgeInsets.symmetric(horizontal: 8),
  child: Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'),
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: InkWell(
                onTap: (){
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${model!.name}',
                          style: TextStyle(height: 1),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 15,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Text('time: ${DateFormat('HH:mm').format(DateTime.parse(model.dateTime.toString()))}',style: TextStyle(color: Colors.grey),),
                        Text('date: ${DateFormat('MM-dd').format(DateTime.parse(model.dateTime.toString()))}',style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              )),
        ]),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 10),
        //   child: Container(
        //     color: Colors.grey,
        //     height: 1,
        //     width: double.infinity,
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            model.text==null?
                Text(''):
            Text(
              '${model.text}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 2, fontSize: 15),
            ),
          ],
        ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow)),
              Container(
                height: 250,
                width: double.infinity,
                child: VideoPlayerItem1(videoUrl: '${model.video}'),
              ),

            ],
          ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
        ),

        Row(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){
                  likeFun!();
                }, icon: Icon(CupertinoIcons.heart_fill,color: Colors.grey,)),
                like==null?
                Text(''):Text('$like')
              ],
            ),
            Spacer(),
            IconButton(onPressed: (){
              function();
            }, icon: Icon(Icons.chat,color: Colors.grey,)),
          ],
        )
      ],
    ),
  ),
);

Widget buildPostAdminVideo({PostModel? model,function,functionDel,like}) => Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.6),
        spreadRadius: 1,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  ),
  child:   Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'),
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: InkWell(
                onTap: (){
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${model!.name}',
                          style: TextStyle(height: 1),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 15,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Text('time: ${DateFormat('HH:mm').format(DateTime.parse(model.dateTime.toString()))}',style: TextStyle(color: Colors.grey),),
                        Text('date: ${DateFormat('MM-dd').format(DateTime.parse(model.dateTime.toString()))}',style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              )),
          IconButton(onPressed: (){
            functionDel();
          }, icon: Icon(Icons.delete,color: Colors.grey,))
        ]),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 10),
        //   child: Container(
        //     color: Colors.grey,
        //     height: 1,
        //     width: double.infinity,
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'hey',
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 2, fontSize: 15),
            ),
          ],
        ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow)),
              Container(
                height: 250,
                width: double.infinity,
                child: VideoPlayerItem1(videoUrl: '${model.video}'),
              ),

            ],
          ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
        ),

        Row(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart_fill,color: Colors.grey,)),
                Text('$like')
              ],
            ),
            Spacer(),
            IconButton(onPressed: (){
              function();
            }, icon: Icon(Icons.chat,color: Colors.grey,)),
          ],
        )
      ],
    ),
  ),
);


Widget buildPostAdmin() => Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 10,
  margin: EdgeInsets.symmetric(horizontal: 8),
  child: Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'),
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: InkWell(
                onTap: (){
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'User name',
                          style: TextStyle(height: 1),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 15,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '2023/5/12',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete,color: Colors.grey,)),
        ]),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 10),
        //   child: Container(
        //     color: Colors.grey,
        //     height: 1,
        //     width: double.infinity,
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'hey',
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 2, fontSize: 15),
            ),
          ],
        ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'))),
              ),


            ],
          ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.grey,
                        ),
                        onPressed: () {

                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '10',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                onTap: () {},
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: (){
                        },
                        icon: Icon(
                          Icons.chat,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '10',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),


      ],
    ),
  ),
);