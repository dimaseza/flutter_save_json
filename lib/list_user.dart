import 'package:flutter/material.dart';
import 'package:latihan_simpan_json/models/user.dart';

class ListUser extends StatelessWidget {
  final List<User> user;

  ListUser(this.user);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: user == null ? 0 : user.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user[index].name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  user[index].position,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  user[index].email,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFBEBEBE),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  user[index].city,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
