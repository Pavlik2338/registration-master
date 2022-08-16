import 'package:flutter/material.dart';
import 'package:registration/widgets/appbar.dart';
import 'package:registration/widgets/buttons/back_button.dart';
import 'package:registration/widgets/buttons/main_button.dart';
import 'package:registration/widgets/buttons/switch_field.dart';
import 'package:registration/models/transaction_category.dart';
import '../resources/constants/enums.dart';
import '../widgets/textfields/date_textfield.dart';
import '../widgets/textfields/description.dart';
import '../widgets/textfields/dropdown_textfield.dart';
import '../widgets/textfields/money_field.dart';

class EditTransaction extends StatelessWidget {
  final String id;
  final DateTime date;
  final double value;
  final String? description;
  final TransactionType type;
  final TransactionCategory category;
  EditTransaction({required this.id,required this.value, required this.type,required this.category,required this.date, this.description});
  List<String> dropItem = [
    ExtensionCategory(TransactionCategory.salariesMg).transactionCategory,
    ExtensionCategory(TransactionCategory.internalHr).transactionCategory,
    ExtensionCategory(TransactionCategory.externalHr).transactionCategory,
    ExtensionCategory(TransactionCategory.credit).transactionCategory,
    ExtensionCategory(TransactionCategory.dividends).transactionCategory,
    ExtensionCategory(TransactionCategory.bankCharges).transactionCategory,
    ExtensionCategory(TransactionCategory.taxes).transactionCategory,
    ExtensionCategory(TransactionCategory.awards).transactionCategory,
    ExtensionCategory(TransactionCategory.others).transactionCategory,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11),
                    child: CustomBackButton(),
                  ),
                  Text(
                    'Edit transaction',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ],
              ),
            ),
            SwitchField(
              firstLebel: 'Profit',
              secondLebel: 'Loss',
              switchTitle: 'Transaction Type',
            ),
            SwitchField(
              firstLebel: 'OK',
              secondLebel: "Wait",
              switchTitle: 'Status',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: DateTextField(
                callback: (p) {},
              ),
            ),
            DropDownField(
              dropItem: dropItem,
              callback: (p) {},
              hint: ExtensionCategory(category).transactionCategory,
              startCategory: category,
            ),
            MoneyField(nameField: "Enter Amount"),
            DescriptionField(
              nameField: "Description",
              onChanged: ((s) {}),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: MainButtonDark(
                name: 'Edit',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
