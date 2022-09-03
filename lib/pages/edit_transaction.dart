import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/trancation/trancation_bloc.dart';
import 'package:registration/resources/constants/category_list.dart';
import 'package:registration/resources/localization/english_localization.dart';
import 'package:registration/widgets/appbar.dart';
import 'package:registration/widgets/buttons/back_button.dart';
import 'package:registration/widgets/buttons/main_button.dart';
import 'package:registration/widgets/buttons/switch_field.dart';
import 'package:registration/resources/constants/transaction_category.dart';
import '../resources/constants/enums.dart';

import '../widgets/textfields/date_textfield.dart';
import '../widgets/textfields/description.dart';
import '../widgets/textfields/dropdown_textfield.dart';
import '../widgets/textfields/money_field.dart';
import 'package:intl/intl.dart';


class EditTransaction extends StatelessWidget {
  final String id;
  final DateTime date;
  final bool status;
  final double value;
  final String? description;
  final TransactionType type;
  final TransactionCategory category;
  EditTransaction(
      {Key? key, required this.id,
      required this.status,
      required this.value,
      required this.type,
      required this.category,
      required this.date,
      this.description}) : super(key: key);
  late DateTime currectDate = date;
  late bool currentStatus = status;
  late double currentValue = value;
  late String? currentDescription = description;
  late TransactionType currentType = type;
  late TransactionCategory currentCategory = category;

  void saveType(TransactionType newType) {
    currentType = newType;
  }

  void saveStatus(bool newStatus) {
    currentStatus = newStatus;
  }

  void saveDate(DateTime newDate) {
    currectDate = newDate;
  }

  saveCategory(TransactionCategory newCategory) {
    currentCategory = newCategory;
  }

  
  int index = 0;
  TextEditingController moneyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int indexChange(dynamic param) {
    index = 0;
    if (param == TransactionType.loss) {
      return index = 1;
    } else if (param == false) {
      return index = 1;
    }
    return index;
  }

  @override
  Widget build(BuildContext context) {
    moneyController.text = value.toString();
    descriptionController.text = description.toString();
    dateController.text = DateFormat('yyyy-MM-dd').format(date);
    return BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state is TrancationLoading) {
          Navigator.pushNamed(context, '/splash');
        }
        if (state is TrancationError) {
          final snackBar = SnackBar(
            content: const Text(Localization.wrong),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is TrancationSuccess) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
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
                      Localization.editTransaction,
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
                firstLebel:  Localization.profit,
                secondLebel:  Localization.loss,
                switchTitle:  Localization.transactionType,
                index: indexChange(type),
                saveType: saveType,
              ),
              SwitchField(
                firstLebel:  Localization.statusOk,
                secondLebel:  Localization.statusWait,
                switchTitle:  Localization.status,
                index: indexChange(status),
                saveStatus: saveStatus,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: DateTextField(
                  callback: saveDate,
                  controller: dateController,
                ),
              ),
              DropDownField(
                dropItem: CategoryList().dropItem,
                callback: saveCategory,
                hint: ExtensionCategory(category).transactionCategory,
                startCategory: category,
              ),
              MoneyField(
                nameField: Localization.money,
                controller: moneyController,
              ),
              DescriptionField(
                nameField:  Localization.description,
                onChanged: ((s) {}),
                controller: descriptionController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: MainButtonDark(
                  name: Localization.edit,
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                    context.read<TransactionBloc>().add(EditTrancationEvent(
                        id: id,
                        status: currentStatus,
                        value: double.parse(moneyController.text.trim()),
                        type: currentType,
                        category: currentCategory,
                        date: currectDate,
                        description: descriptionController.text));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
