import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:registration/models/trancation_model.dart';

import 'package:registration/models/user_model.dart';


import '../../models/month_year_model.dart';
import '../../repositories/transaction_repository.dart';
import '../../resources/constants/enums.dart';

part 'trancation_event.dart';
part 'trancation_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  List<TransactionModel> transactions = [];
  MonthYear selectedDate = MonthYear.fromDateTime(DateTime.now());
  int selectedYear = DateTime.now().year;
  final TransactionRepository repository;
  TransactionBloc({required this.repository}) : super(TrancationInitial()) {
    on<AddTrancationEvent>(_onAddTrancationEvent);
    on<ChangeReadinessEvent>(_onChangeReadiness);
    on<DeleteTransactionEvent>(_onDeleteTransaction);
    on<EditTrancationEvent>(_onEditTransaction);
    on<FetchEvent>(_onFetch);
    on<DateChanged>(_onDateChanged);
  }
  void _onAddTrancationEvent(
    AddTrancationEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TrancationLoading());
    bool transation = await repository.addTransaction(
      userName: thisUser.username!,
      type: event.type,
      ready: event.status,
      date: event.date,
      category: event.category,
      value: event.value,
      description: event.description,
    );
    if (transation) {
      emit(TrancationSuccess());
    } else {
      emit(TrancationError());
    }
  }

  void _onChangeReadiness(
    ChangeReadinessEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TrancationLoading());
    bool change = await repository.changeReadiness(
      transaction: event.transaction,
    );
   
    if (change) {
      add(const FetchEvent());
      emit(TrancationSuccess());
    }
  }

  void _onDeleteTransaction(
    DeleteTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TrancationLoading());
    await repository.delete(
      transaction: event.transaction,
    );
    emit(TrancationSuccess());
    add(const FetchEvent());
  }

  void _onEditTransaction(
    EditTrancationEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TrancationLoading());
    bool transaction = await repository.editTransaction(
        id: event.id!,
        userName: thisUser.username!,
        type: event.type,
        ready: event.status,
        date: event.date,
        category: event.category,
        value: event.value);
    add(const FetchEvent());
    if (transaction) {
      emit(TrancationSuccess());
    } else {
      emit(TrancationError());
    }
  }

  Future<void> _onFetch(
      FetchEvent event, Emitter<TransactionState> emit) async {
    transactions.clear();
    emit(FetchLoadingState());
    var allTransactions = await FirebaseFirestore.instance
        .collection('users')
        .doc(thisUser.username)
        .collection('transactions')
        .get();
    try {
      for (var i = 0; i < allTransactions.docs.length; i++) {
        var item = allTransactions.docs[i].data();
        transactions.add(TransactionModel.fromJson(item));
      }
      if (event.onlyYear == false) {
        final selectedTransactions = transactions
            .where((tran) => repository.compareDate(tran.date, selectedDate))
            .toList();
        emit(FetchState(selectedTransactions));
      } else {
        final selectedTransactions = transactions
            .where((element) => element.date.year == selectedYear)
            .toList();
        emit(FetchState(selectedTransactions));
      }
    // ignore: empty_catches
    } catch (e) {
  
    }
  }

  void _onDateChanged(DateChanged event, Emitter<TransactionState> emit) {
    emit(FetchLoadingState());

    if (event.year == null) {
      final selectedTransactions = transactions
          .where((tran) => repository.compareDate(tran.date, event.newDate!))
          .toList();
      emit(FetchState(selectedTransactions));
    } else {
      final selectedTransactions =
          transactions.where((tran) => tran.date.year == event.year).toList();
      emit(FetchState(selectedTransactions));
    }
  }

  // void _onFieldsFill(
  //   FilledFields event,
  //   Emitter<TransactionState> emit,
  // ) async {

  //   bool success =
  //       repository.fieldsFill(event.value, event.date, event.category);
  //   emit(FillFields(success: success));
  // }
}
