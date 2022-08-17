import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:registration/models/trancation_model.dart';
import 'package:registration/models/transaction_category.dart';
import 'package:registration/models/user_model.dart';
import 'package:registration/repositories/login_repository.dart';

import '../../repositories/transaction_repository.dart';
import '../../resources/constants/enums.dart';

part 'trancation_event.dart';
part 'trancation_state.dart';

class TrancationBloc extends Bloc<TrancationEvent, TrancationState> {
  final TransactionRepository repository;
  TrancationBloc({required this.repository}) : super(TrancationInitial()) {
    on<AddTrancationEvent>(_onAddTrancationEvent);
    on<ChangeReadinessEvent>(_onChangeReadiness);
    on<DeleteTransactionEvent>(_onDeleteTransaction);
    on<EditTrancationEvent>(_onEditTransaction);
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
    if (change) {
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
    if (transaction) {
      emit(TrancationSuccess());
    } else {
      emit(TrancationError());
    }
  }

  void _onFound(
    FoundDateEvent event,
    Emitter<TrancationState> emit,
  ) async {
    emit(TrancationLoading());
    Stream? stream =
        await repository.foundTransaction(month: event.month, year: event.year);
    emit(TrancationFound(stream: stream!));
  }
}
