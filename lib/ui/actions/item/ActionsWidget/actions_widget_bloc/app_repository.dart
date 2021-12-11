import 'package:junior_test/ui/actions/item/ActionsWidget/actions_widget_bloc/app_provider.dart';

class AppRepository {
  Future postLoginData(json) {
    AppProvider provider = AppProvider();
    return provider.postLoginData(json);
  }
}
