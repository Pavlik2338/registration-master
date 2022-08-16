import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/trancation/trancation_bloc.dart';
import 'package:registration/models/transaction_category.dart';
import 'package:registration/resources/validators/validators.dart';
import 'package:registration/widgets/buttons/back_button.dart';
import 'package:registration/widgets/buttons/main_button.dart';
import 'package:registration/widgets/buttons/switch_field.dart';
import 'package:registration/widgets/textfields/date_textfield.dart';
import 'package:registration/widgets/textfields/money_field.dart';

import '../../resources/constants/enums.dart';
import '../../widgets/appbar.dart';
import '../../widgets/textfields/description.dart';
import '../../widgets/textfields/dropdown_textfield.dart';

class AddTrancationLisiner extends StatefulWidget {
  @override
  State<AddTrancationLisiner> createState() => AddTrancationLisinerState();
}

class AddTrancationLisinerState extends State<AddTrancationLisiner> {
  TextEditingController valueController = TextEditingController();
  TextEditingController description = TextEditingController();
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
  TransactionType? type = TransactionType.loss;
  bool? status = false;
  DateTime? date;
  TransactionCategory category = TransactionCategory.awards;
  final _formKeyDate = GlobalKey<FormState>();
  final _formKeyMoney = GlobalKey<FormState>();
  void saveType(TransactionType newType) {
    type = newType;
  }

  void saveStatus(bool newStatus) {
    status = newStatus;
  }

  void saveDate(DateTime newDate) {
    date = newDate;
  }

  saveCategory(TransactionCategory newCategory) {
    category = newCategory;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TrancationBloc, TrancationState>(
      listener: (context, state) {
        if (state is TrancationLoading) {
          Navigator.pushNamed(context, '/splash');
        }
        if (state is TrancationError) {
          final snackBar = SnackBar(
            content: const Text('Have wrong'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is TrancationSuccess) {
          Navigator.pushNamed(context, '/home');
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SafeArea(
            child: Padding(
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
                      'Add a transaction',
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
                secondLebel: "Loss",
                switchTitle: 'Transaction type',
                saveType: saveType,
              ),
              SwitchField(
                firstLebel: 'OK',
                secondLebel: "Wait",
                switchTitle: 'Status',
                saveStatus: saveStatus,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: DateTextField(
                  key: _formKeyDate,
                  callback: saveDate,
                  validator: (text) =>
                      Validators().validateRequiredFields(text),
                ),
              ),
              DropDownField(
                dropItem: dropItem,
                callback: saveCategory,
              ),
              MoneyField(
                key: _formKeyMoney,
                nameField: "Enter Amount",
                controller: valueController,
                validator: (text) => Validators().validateMoney(text),
              ),
              DescriptionField(
                controller: description,
                nameField: "Description",
                onChanged: ((s) {}),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: MainButtonDark(
                    name: 'Add',
                    onPressed: () {
                      if (_formKeyDate.currentState!.validate() &
                          _formKeyMoney.currentState!.validate()) {
                        context.read<TrancationBloc>().add(
                              AddTrancationEvent(
                                  type: type!,
                                  category: category,
                                  date: date!,
                                  status: status!,
                                  value:
                                      double.parse(valueController.text.trim()),
                                  description: description.text),
                            );
                      }
                    }),
              )
            ],
          ),
        )),
      ),
    );
  }
}
