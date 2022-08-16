part of 'trancation_bloc.dart';

abstract class TrancationEvent extends Equatable {
  const TrancationEvent();

  @override
  List<Object> get props => [];
}

class AddTrancationEvent extends TrancationEvent {
  final String? id;
  final TransactionType type;
  final bool status;
  final DateTime date;
  final TransactionCategory category;
  final double value;
  final String description;
  const AddTrancationEvent(
      {this.id,
      required this.type,
      required this.category,
      required this.date,
      required this.status,
      required this.value,
      this.description = ''});
}

class EditTrancationEvent extends TrancationEvent {}

class ChangeReadinessEvent extends TrancationEvent {
  final TransactionModel transaction;
  ChangeReadinessEvent({required this.transaction});
}
