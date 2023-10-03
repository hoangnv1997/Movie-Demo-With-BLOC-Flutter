import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviedemo/common/bloc/base_state.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
