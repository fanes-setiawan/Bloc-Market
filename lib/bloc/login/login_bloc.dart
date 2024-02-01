// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocmarket/data/datasources/api_data_sources.dart';
import 'package:blocmarket/data/models/request/login_model.dart';
import 'package:blocmarket/data/models/response/login_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiDataSources dataSources;
  LoginBloc(
    this.dataSources,
  ) : super(LoginInitial()) {
    on<LoginSaveEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await dataSources.login(event.request);
      await ApiDataSources().addTokenPrefs(result.accessToken.toString());
      emit(LoginLoaded(model: result));
    });
  }
}
