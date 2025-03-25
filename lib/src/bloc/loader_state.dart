import 'package:equatable/equatable.dart';

class LoaderState extends Equatable {
  final bool isLoading;

  const LoaderState(this.isLoading);

  @override
  List<Object?> get props => [isLoading];
}
