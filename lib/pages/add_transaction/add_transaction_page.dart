import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/trancation/trancation_bloc.dart';
import 'package:registration/resources/constants/transaction_category.dart';
import 'package:registration/resources/constants/category_list.dart';
import 'package:registration/resources/localization/english_localization.dart';
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
  const AddTrancationLisiner({Key? key}) : super(key: key);

  @override
  State<AddTrancationLisiner> createState() => AddTrancationLisinerState();
}

class AddTrancationLisinerState extends State<AddTrancationLisiner> {
  TextEditingController valueController = TextEditingController();
  TextEditingController description = TextEditingController();

  TransactionType? type = TransactionType.loss;
  bool? status = false;
  DateTime? date;
  TransactionCategory category = TransactionCategory.awards;
 
 

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
                      Localization.addTransaction,
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
                firstLebel: Localization.profit,
                secondLebel: Localization.loss,
                switchTitle: Localization.transactionType,
                saveType: saveType,
              ),
              SwitchField(
                firstLebel: Localization.statusOk,
                secondLebel: Localization.statusWait,
                switchTitle: Localization.status,
                saveStatus: saveStatus,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: DateTextField(
                  callback: saveDate,
                 
                ),
              ),
              DropDownField(
                dropItem: CategoryList().dropItem,
                callback: saveCategory,
              ),
              MoneyField(
                nameField: Localization.money,
                controller: valueController,
                
              ),
              DescriptionField(
                controller: description,
                nameField: Localization.description,
                 onChanged: ((s) {}),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: MainButtonDark(
                    name: Localization.add,
                    onPressed: () {
                      context.read<TransactionBloc>().add(
                            AddTrancationEvent(
                                type: type!,
                                category: category,
                                date: date!,
                                status: status!,
                                value:
                                    double.parse(valueController.text.trim()),
                                description: description.text),
                          );
                    }),
              )
            ],
          ),
        )),
      ),
    );
  }
}
