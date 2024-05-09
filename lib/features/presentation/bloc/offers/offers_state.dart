
part of 'offers_bloc.dart';
abstract class OffersState extends Equatable {
  const OffersState();

  @override
  List<Object?> get props => [];
}

class OffersLoading extends OffersState {}

class OffersLoaded extends OffersState {
  final Offers offers;

  const OffersLoaded(this.offers);

  @override
  List<Object?> get props => [offers];
}

class OffersError extends OffersState {
  final String message;

  const OffersError(this.message);

  @override
  List<Object?> get props => [message];
}
