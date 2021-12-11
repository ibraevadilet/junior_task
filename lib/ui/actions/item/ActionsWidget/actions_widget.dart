// ignore: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:junior_test/ui/actions/item/ActionsItemArguments.dart';

import '../ActionsItemWidget.dart';
import 'actions_widget_bloc/actions_widget_bloc_bloc.dart';
import 'actions_widget_bloc/app_repository.dart';
import 'actions_widget_bloc/stack_model.dart';

class ActionsWidget extends StatefulWidget {
  @override
  State<ActionsWidget> createState() => _ActionsWidgetState();
}

class _ActionsWidgetState extends State<ActionsWidget> {
  final bloc = ActionsWidgetBlocBloc(AppRepository());
  ScrollController _scrollController;
  int currentPage = 1;
  List<ListElement> dataList = [];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        currentPage = currentPage + 1;
        bloc.add(LoadedEvent("$currentPage", "4"));
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
    bloc.add(LoadedEvent("$currentPage", "4"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: <String, WidgetBuilder>{
          '/actionItemWidget': (context) => ActionsItemWidget(),
        },
        home: Scaffold(
            key: _key,
            appBar: AppBar(
              backgroundColor: Colors.grey.shade900,
              centerTitle: true,
              title: const Text("Акции"),
            ),
            body: Center(
              child: BlocProvider(
                create: (context) => bloc,
                child:
                    BlocConsumer<ActionsWidgetBlocBloc, ActionsWidgetBlocState>(
                  listener: (context, state) {
                    if (state is ActionsWidgetBlocLoaded) {
                      setState(() {
                        dataList
                            .addAll(state.data.serverResponse.body.promo.list);
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is ActionsWidgetBlocException) {
                      return Center(
                        child: Text(state.message.message),
                      );
                    } else if (state is ActionsWidgetBlocLoaded) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StaggeredGridView.countBuilder(
                          controller: _scrollController,
                          staggeredTileBuilder: (index) =>
                              StaggeredTile.count(2, index.isEven ? 2 : 4),
                          crossAxisCount: 4,
                          itemCount: dataList.length,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          itemBuilder: (context, index) => BuilderImage(
                            data: dataList,
                            index: index,
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            )));
  }
}

class BuilderImage extends StatelessWidget {
  final dynamic data;
  final int index;
  const BuilderImage({Key key, this.index, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/actionItemWidget",
            arguments: ActionsItemArguments(data[index].id));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Stack(children: [
            Center(
              child: Text(
                data[index].name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Text(
                data[index].shop,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ]),
        ),
        height: 190.0,
        width: MediaQuery.of(context).size.width - 100.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black,
            image: DecorationImage(
                image: const NetworkImage(
                    "https://cs1.gtavicecity.ru/screenshots/9a0d4/2019-06/original/5efe951ad8c73404b65ebb6a31e0c7c193edcb63/727725-14890506673136-083a0d-rrrsrsrrs-2-.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.dstATop))),
      ),
    );
  }
}
