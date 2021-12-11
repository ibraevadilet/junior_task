import 'package:junior_test/ui/actions/item/ActionsWidget/actions_widget_bloc/stack_model.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../exceptions.dart';
import 'app_repository.dart';

part 'actions_widget_bloc_event.dart';
part 'actions_widget_bloc_state.dart';

class ActionsWidgetBlocBloc
    extends Bloc<ActionsWidgetBlocEvent, ActionsWidgetBlocState> {
  AppRepository repository = AppRepository();

  ActionsWidgetBlocBloc(this.repository) : super(ActionsWidgetBlocInitial());

  @override
  Stream<ActionsWidgetBlocState> mapEventToState(
    ActionsWidgetBlocEvent event,
  ) async* {
    if (event is LoadedEvent) {
      var json = {"page": event.page, "count": event.count};

      try {
        var data = await repository.postLoginData(json);
        yield ActionsWidgetBlocLoaded(data);
      } catch (e) {
        yield ActionsWidgetBlocException(AppExceptions.catchError(e));
      }
    }
  }
}
