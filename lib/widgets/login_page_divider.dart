import 'package:flutter/material.dart';

class LoginPageDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Expanded(
            child: Divider(
              height: 5,
              color: Color.fromRGBO(117, 117, 117, 1),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'or',
              style: TextStyle(color: Color.fromRGBO(117, 117, 117, 1)),
            ),
          ),
          Expanded(
            child: Divider(
              height: 5,
              color: Color.fromRGBO(117, 117, 117, 1),
            ),
          )
        ],
      ),
    );
  }
}
