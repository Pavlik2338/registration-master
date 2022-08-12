import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/pages/add_transaction_page.dart';

import '../blocs/trancation/trancation_bloc.dart';
import '../repositories/transaction_repository.dart';

class AddTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrancationBloc(repository: TransactionRepository()),
      child: AddTrancationLisiner(),
    );
  }
}
