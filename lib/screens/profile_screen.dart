import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/util/constants.dart';

class ProfileScreen extends StatefulWidget {
  final String userId; // current id of user
  ProfileScreen({this.userId});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _profilePic() {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(
          "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
    );
  }

  Widget _headerElements() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "12",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
            Text(
              "posts",
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "323",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
            Text(
              "following",
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "444",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
            Text(
              "followers",
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ],
    );
  }

  Widget _headerBtn() {
    return Container(
      width: 200,
      child: FlatButton(
        onPressed: () {},
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(
          "Edit Profile",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _userNameBio(String name, String bio) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            height: 80,
            child: Text(
              bio,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: userRef.document(widget.userId).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          User user = User.fromDoc(snapshot.data);

          return ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Row(
                  children: <Widget>[
                    _profilePic(),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          _headerElements(),
                          _headerBtn(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              _userNameBio(user.name,user.bio),
            ],
          );
        },
      ),
    );
  }
}
