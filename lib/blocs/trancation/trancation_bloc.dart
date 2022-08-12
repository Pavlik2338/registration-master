import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:registration/models/trancation_model.dart';
import 'package:registration/models/transaction_category.dart';
import 'package:registration/repositories/login_repository.dart';

import '../../repositories/transaction_repository.dart';
import '../../resources/constants/enums.dart';

part 'trancation_event.dart';
part 'trancation_state.dart';

class TrancationBloc extends Bloc<TrancationEvent, TrancationState> {
  final TransactionRepository repository;
  TrancationBloc({required this.repository}) : super(TrancationInitial()) {
    on<AddTrancationEvent>(_onAddTrancationEvent);
  }
  void _onAddTrancationEvent(
    AddTrancationEvent event,
    Emitter<TrancationState> emit,
  ) async {
    emit(TrancationLoading());
    bool transation = await repository.addTransaction(
      userName: 'z',
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
}
