import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:new_social_app/shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10,
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                Image(
                  image: NetworkImage(
                      'https://image.freepik.com/free-photo/excited-amazed-guy-with-red-hair-beard-wears-blank-t-shirt-pointing-he-right-side-copy-space_295783-14769.jpg'),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                    child: Text(
                      'Communicate With Friends',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => buildPostItem(),
          ),
        ],
      ),
    );
  }

  Widget buildPostItem() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              'https://image.freepik.com/free-photo/surprised-male-face-through-paper-hole-emotional-astonished-young-man-wears-yellow-headgear_273609-25550.jpg'),
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Aly Eldin Muhammad',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.blue,
                                  size: 14,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'January 24, 2021 at 6:00 Pm',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.more_horiz)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      color: Colors.grey[300],
                      height: 1,
                      width: double.infinity,
                    ),
                  ),
                  Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                  Container(
                    width: double.infinity,
                    child: Wrap(
                      children: [
                        Container(
                            height: 25,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                '#SoftWare',
                                style: TextStyle(color: Colors.brown),
                              ),
                            )),
                        Container(
                            height: 25,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                '#SoftWare',
                                style: TextStyle(color: Colors.brown),
                              ),
                            )),
                        Container(
                            height: 25,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                '#SooooooooooooftWare',
                                style: TextStyle(color: Colors.brown),
                              ),
                            )),
                        Container(
                            height: 25,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                '#SoftWare',
                                style: TextStyle(color: Colors.brown),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.freepik.com/free-photo/excited-amazed-guy-with-red-hair-beard-wears-blank-t-shirt-pointing-he-right-side-copy-space_295783-14769.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              children: [
                                Icon(
                                  IconBroken.Heart,
                                  size: 24,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('120 Likes'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  IconBroken.Chat,
                                  size: 24,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('63 Comments'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      color: Colors.grey[300],
                      height: 1,
                      width: double.infinity,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      'https://image.freepik.com/free-photo/surprised-male-face-through-paper-hole-emotional-astonished-young-man-wears-yellow-headgear_273609-25550.jpg'),
                                ),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                child: Text(
                                  'Write a Comment..',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                IconBroken.Heart,
                                size: 24,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Like'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
