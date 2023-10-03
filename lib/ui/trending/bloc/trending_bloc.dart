import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviedemo/common/bloc/base_state.dart';

part 'trending_event.dart';

part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc() : super(const TrendingState()) {
    on<TrendingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
