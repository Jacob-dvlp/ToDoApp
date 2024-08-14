import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/src/infra/demain/usecases/usecases.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserLocalUsecaseI usecaseI;
  UserCubit({required this.usecaseI}) : super(UserInitial()) {
    getUser();
  }

  Future getUser() async {
    emit(UserLoadingState());
    final data = await usecaseI.getUser();
    return data.fold(
      (error) => emit(UserErrorState(error: error.error!)),
      (data) => emit(
        UserLoadedState(userEntite: data),
      ),
    );
  }

  Future logout() async {
    emit(UserLoadingState());
    final data = await usecaseI.deleteUser();
    return data.fold(
      (error) => emit(UserErrorState(error: error.error!)),
      (logout) => emit(
        UserLogoutState(),
      ),
    );
  }
}
