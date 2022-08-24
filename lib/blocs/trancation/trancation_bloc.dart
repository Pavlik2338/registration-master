import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:registration/models/trancation_model.dart';
import 'package:registration/models/transaction_category.dart';
import 'package:registration/models/user_model.dart';
import 'package:registration/repositories/login_repository.dart';

import '../../models/month_year_model.dart';
import '../../repositories/transaction_repository.dart';
import '../../resources/constants/enums.dart';

part 'trancation_event.dart';
part 'trancation_state.dart';

class TrancationBloc extends Bloc<TrancationEvent, TrancationState> {
  List<TransactionModel> _transactions = [];
  MonthYear selectedDate = MonthYear.fromDateTime(DateTime.now());
  final TransactionRepository repository;
  TrancationBloc({required this.repository}) : super(TrancationInitial()) {
    on<AddTrancationEvent>(_onAddTrancationEvent);
    on<ChangeReadinessEvent>(_onChangeReadiness);
    on<DeleteTransactionEvent>(_onDeleteTransaction);
    on<EditTrancationEvent>(_onEditTransaction);
    on<FetchEvent>(_onFetch);
    on<DateChanged>(_onDateChanged);
  }
  void _onAddTrancationEvent(
    AddTrancationEvent event,
    Emitter<TrancationState> emit,
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
    Emitter<TrancationState> emit,
  ) async {
    emit(TrancationLoading());
    bool change = await repository.changeReadiness(
      transaction: event.transaction,
    );
    print(change);
    if (change) {
      add(FetchEvent());
      emit(TrancationSuccess());
    }
  }

  void _onDeleteTransaction(
    DeleteTransactionEvent event,
    Emitter<TrancationState> emit,
  ) async {
    emit(TrancationLoading());
    await repository.delete(
      transaction: event.transaction,
    );
    emit(TrancationSuccess());
    add(FetchEvent());
  }

  void _onEditTransaction(
    EditTrancationEvent event,
    Emitter<TrancationState> emit,
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
    add(FetchEvent());
    if (transaction) {
      emit(TrancationSuccess());
    } else {
      emit(TrancationError());
    }
  }

  Future<void> _onFetch(FetchEvent event, Emitter<TrancationState> emit) async {
    _transactions.clear();
    emit(FetchLoadingState());
    var allTransactions = await FirebaseFirestore.instance
        .collection('users')
        .doc(thisUser.username)
        .collection('transactions')
        .get();
    try {
      for (var i = 0; i < allTransactions.docs.length; i++) {
        var item = allTransactions.docs[i].data();
        _transactions.add(TransactionModel.fromJson(item));
      }

      final selectedTransactions = _transactions
          .where((tran) => repository.compareDate(tran.date, selectedDate))
          .toList();
      print(selectedTransactions.length);
      emit(FetchState(selectedTransactions));
    } catch (e) {
      print("Возникла ошибка при загрузке транзакций");
    }
  }

  void _onDateChanged(DateChanged event, Emitter<TrancationState> emit) {
    emit(FetchLoadingState());
    selectedDate = event.newDate;
    final _selectedTransactions = _transactions
        .where((tran) => repository.compareDate(tran.date, selectedDate))
        .toList();

    emit(FetchState(_selectedTransactions));
  }
}
