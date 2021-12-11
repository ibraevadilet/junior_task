import 'package:dio/dio.dart';
import 'package:junior_test/ui/actions/item/ActionsWidget/actions_widget_bloc/stack_model.dart';
import 'package:junior_test/ui/actions/item/ActionsWidget/api.dart';
import 'package:junior_test/ui/actions/item/ActionsWidget/exceptions.dart';

class AppProvider {
  Future postLoginData(json) async {
    print(json);
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet(json);
      if (response.statusCode == 200) {
        return StackModel.fromJson(response.data);
      }
      throw AppExceptions.catchError(response);
    } catch (e) {
      print(e);
      throw AppExceptions.catchError(e);
    }
  }
}
