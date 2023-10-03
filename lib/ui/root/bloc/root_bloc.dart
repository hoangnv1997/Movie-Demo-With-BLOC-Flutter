import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviedemo/common/bloc/base_state.dart';

part 'root_event.dart';

part 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc() : super(const RootState()) {
    on<PageChanged>(_onPageChanged);
  }

  void _onPageChanged(
    PageChanged event,
    Emitter<RootState> emit,
  ) {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }
}
