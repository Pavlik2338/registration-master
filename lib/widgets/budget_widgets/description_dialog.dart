import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/trancation_model.dart';

class DiscriptionDialog {
  final BuildContext contexta;
  final TransactionModel transaction;
  DiscriptionDialog({required this.contexta, required this.transaction});
  void dialog() {
    showModalBottomSheet(
        context: contexta,
        builder: (BuildContext context) {
          return Container( 
              decoration: const BoxDecoration(
    
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(142, 220, 161, 255),
            Color.fromARGB(136, 78, 195, 245),
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
            child: ListView(
              children: <Widget>[
               const Align(alignment: Alignment.topCenter,
                  child:  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Description ',style: TextStyle(fontSize: 12),),
                  )),
                Center(
                  child: Text(
                    transaction.description == null
                        ? 'Вescription is missing.'
                        : transaction.description!,
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
