
import 'package:bloc/bloc.dart';
import 'package:maliya_mobile/utils/utils_helper.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase cubit, Change change) {
    UtilsHelper.log(" ");
    UtilsHelper.log(
        "************ STATE CHANGE START IN \"${cubit.runtimeType}\" ******************");
    UtilsHelper.log('${cubit.runtimeType} $change');
    UtilsHelper.log('${cubit.runtimeType} ${change.currentState.toString()}');
    UtilsHelper.log(
        "************* STATE CHANGE END IN \"${cubit.runtimeType}\" *******************");
    UtilsHelper.log(" ");
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    UtilsHelper.log(" ");
    UtilsHelper.log(
        "++++++++++++++++++ STATE TRANSITION START IN \"${bloc.runtimeType}\" +++++++++++++++++++");
    UtilsHelper.log('${bloc.runtimeType} $transition');
    UtilsHelper.log(
        '${bloc.runtimeType} ${transition.currentState.toString()}');
    UtilsHelper.log(
        "++++++++++++++++++ STATE TRANSITION END IN \"${bloc.runtimeType}\" +++++++++++++++++++");
    UtilsHelper.log(" ");
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase cubit, Object error, StackTrace stackTrace) {
    super.onError(cubit, error, stackTrace);

    UtilsHelper.log(
        "============================================================================");
    UtilsHelper.log(
        "===================== BLOC ERROR IN ${cubit.runtimeType} ===================");
    UtilsHelper.log(
        "============================================================================");

    UtilsHelper.log(
        '\nSTACK TRACE START ->>>>>>>\n ${cubit.runtimeType} $error $stackTrace  \n<<<<<<<<- STACK TRACE ENDS\n');
  }
}
