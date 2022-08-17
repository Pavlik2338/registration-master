part of 'trancation_bloc.dart';

abstract class TrancationState extends Equatable {
  const TrancationState();

  @override
  List<Object> get props => [];
}

class TrancationInitial extends TrancationState {}

class TrancationFound extends TrancationState {
  final Stream stream;
  TrancationFound({required this.stream});
}

class TrancationLoading extends TrancationState {}

class TrancationSuccess extends TrancationState {}

class TrancationError extends TrancationState {}
