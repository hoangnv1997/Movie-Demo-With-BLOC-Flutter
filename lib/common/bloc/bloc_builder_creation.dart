import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedemo/common/bloc/base_state.dart';
import 'package:moviedemo/common/widget/loading_progress.dart';

typedef BlocStateCallback<S> = void Function(BuildContext context, S? state);

/// Create a [BlocBuilder] with its state extends [BaseState] and its Bloc
/// extends [BaseBloc]. Using defined [BlocStateCallback] callbacks to handle
/// corresponding state.
///
/// Using [onLoading] if state is loading. Using [onSuccess] if state is
/// success...
BlocBuilder<B, S>
    createBlocBuilder<E, S extends BaseState, B extends Bloc<E, S>>({
  Key? key,
  required BlocWidgetBuilder<S> builder,
  BlocBuilderCondition<S>? buildWhen,
  bool? shouldShowLoadingFullScreen,
  B? bloc,
}) {
  return BlocBuilder<B, S>(
    bloc: bloc,
    key: key,
    builder: (context, state) {
      if (shouldShowLoadingFullScreen ?? false) {
        if (state.status == BlocStatus.loading) {
          return const LoadingProgress();
        }
      }
      return builder.call(context, state);
    },
    buildWhen: buildWhen,
  );
}
