import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingState());
  static OnBoardingCubit get(context) => BlocProvider.of(context);
  void changePageIndex(int index) {
    index=index;
    emit(OnBoardingState(currentPage: index));
  }
}
