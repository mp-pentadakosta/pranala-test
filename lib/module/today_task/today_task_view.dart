import 'package:flutter/material.dart';
import 'package:pranala_test/module/today_task/today_task_service.dart';
import 'package:provider/provider.dart';

import '../../component/card_component.dart';

class TodayTaskView extends StatelessWidget {
  const TodayTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToDayTaskService>(
      create: (context) => ToDayTaskService()..getTodayTasksFirst(context),
      child: _BodyTaskView(),
    );
  }
}

class _BodyTaskView extends StatefulWidget {
  const _BodyTaskView();

  @override
  State<_BodyTaskView> createState() => _BodyTaskViewState();
}

class _BodyTaskViewState extends State<_BodyTaskView> {
  late ScrollController scrollController_;

  @override
  void initState() {
    scrollController_ = ScrollController();
    scrollController_.addListener(() {
      if (scrollController_.position.pixels ==
              scrollController_.position.maxScrollExtent &&
          !context.read<ToDayTaskService>().isLoadingMore) {
        context.read<ToDayTaskService>().getTodayTasks(
          context,
          pageData: context.read<ToDayTaskService>().page + 1,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDayTaskService>(
      builder:
          (context, value, child) => Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 24.0,
            ),
            child:
                value.isLoading && value.todayTask.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                      controller: scrollController_,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...value.todayTask.map(
                            (e) => CardComponent(
                              status: e.completed,
                              title: e.title,
                            ),
                          ),
                          if (value.isLoadingMore)
                            const Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: CircularProgressIndicator(),
                            ),
                        ],
                      ),
                    ),
          ),
    );
  }
}
