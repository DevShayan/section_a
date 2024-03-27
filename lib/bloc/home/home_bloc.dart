import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/home/home_event.dart';
import 'package:section_a/bloc/home/home_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState()) {
    
    on((event, emit) => emit(HomeScreenState.fromState(state)));
  }

  void fetchData() {
    // GoogleAPI api = GoogleAPI();
    // api.fetchAttnOfUser("");
  }
}