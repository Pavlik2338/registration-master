part of 'trancation_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class AddTrancationEvent extends TransactionEvent {
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

class EditTrancationEvent extends TransactionEvent {
  final String? id;
  final TransactionType type;
  final bool status;
  final DateTime date;
  final TransactionCategory category;
  final double value;
  final String description;
  const EditTrancationEvent(
      {this.id,
      required this.type,
      required this.category,
      required this.date,
      required this.status,
      required this.value,
      this.description = ''});
}

class ChangeReadinessEvent extends TransactionEvent {
  final TransactionModel transaction;
  const ChangeReadinessEvent({required this.transaction});
}

class DeleteTransactionEvent extends TransactionEvent {
  final TransactionModel transaction;
 const DeleteTransactionEvent({required this.transaction});
}

class FetchEvent extends TransactionEvent {
  final bool onlyYear;
 const FetchEvent({this.onlyYear = false});
}

class DateChanged extends TransactionEvent {
  final MonthYear? newDate;
  final int? year;

  const DateChanged({this.newDate, this.year});
}

class FilledFields extends TransactionEvent {
  final double? value;
  final DateTime? date;
  final TransactionCategory? category;
 const FilledFields(
      {required this.value, required this.category, required this.date});
}
