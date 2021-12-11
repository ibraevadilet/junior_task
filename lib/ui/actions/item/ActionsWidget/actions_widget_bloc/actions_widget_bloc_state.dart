part of 'actions_widget_bloc_bloc.dart';

@immutable
abstract class ActionsWidgetBlocState {}

class ActionsWidgetBlocInitial extends ActionsWidgetBlocState {}

class ActionsWidgetBlocLoaded extends ActionsWidgetBlocState {
  final StackModel data;
  ActionsWidgetBlocLoaded(this.data);
}

class ActionsWidgetBlocException extends ActionsWidgetBlocState {
  final AppExceptions message;
  ActionsWidgetBlocException(this.message);
}
