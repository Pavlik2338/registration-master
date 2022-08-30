import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/pages/add_transaction/add_transaction_page.dart';

import '../../blocs/trancation/trancation_bloc.dart';
import '../../repositories/transaction_repository.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(repository: TransactionRepository()),
      child: const AddTrancationLisiner(),
    );
  }
}
