part of 'trancation_bloc.dart';

abstract class TrancationState extends Equatable {
  const TrancationState();

  @override
  List<Object> get props => [];
}

class TrancationInitial extends TrancationState {}

class TrancationLoading extends TrancationState {}

class TrancationSuccess extends TrancationState {}

class TrancationError extends TrancationState {}
