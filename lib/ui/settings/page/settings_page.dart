import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedemo/common/bloc/bloc_builder_creation.dart';
import 'package:moviedemo/common/color/app_color.dart';
import 'package:moviedemo/common/widget/base_page.dart';
import 'package:moviedemo/main/main_develop.dart';
import 'package:moviedemo/ui/settings/bloc/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBasePage(
      appBar: _buildAppBar(context),
      body: BlocProvider(
        create: (context) => getIt<SettingsBloc>(),
        child: _buildBodyWidget(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.transparent,
      toolbarHeight: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColor.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  Widget _buildBodyWidget() {
    return createBlocBuilder<SettingsEvent, SettingsState, SettingsBloc>(
      buildWhen: (previous, current) => false,
      shouldShowLoadingFullScreen: true,
      builder: (context, state) {
        return Center(
          child: Text('Settings Page'),
        );
      },
    );
  }
}
