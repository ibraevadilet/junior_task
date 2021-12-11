part of 'actions_widget_bloc_bloc.dart';

@immutable
abstract class ActionsWidgetBlocEvent {}

class LoadedEvent extends ActionsWidgetBlocEvent {
  String page;
  String count;
  LoadedEvent(this.page, this.count);
}
