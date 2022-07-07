import 'package:bloc/bloc.dart';
import 'package:employes_data/model/model_hive.dart';
import 'package:employes_data/service/dio_service.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final DioService _dioService;
  UserBloc(this._dioService) : super(UserInitial());

  void init() {
    loadData();
  }

  void loadData() async {
    emit(UserLoadingState());
    final data = await _dioService.getReq();
    print('bloc output ::: $data');
    emit(UserLoadedState(data!));
  }
}
