part of 'root_bloc.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();
}
class PageChanged extends RootEvent {
  final int pageIndex;

  const PageChanged({required this.pageIndex});

  @override
  List<Object?> get props => [pageIndex];
}