import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  final String title;
  final Color color;
  final icon;
  final Function onTap;
  const SocialButtonWidget({
    Key? key,
    required this.title,
    required this.color,
    this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
