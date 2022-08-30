part of 'trancation_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TrancationInitial extends TransactionState {}

class FillFields extends TransactionState {
  final bool success;
 const FillFields({required this.success});
}

class TrancationLoading extends TransactionState {}

class TrancationSuccess extends TransactionState {}

class TrancationError extends TransactionState {}

class FetchLoadingState extends TransactionState {}

class FetchState extends TransactionState {
  final List<TransactionModel> transactions;

  const FetchState(this.transactions);
}
