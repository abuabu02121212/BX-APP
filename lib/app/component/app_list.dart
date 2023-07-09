import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../http/dio_util.dart';

class AppList extends StatefulWidget {
  const AppList({super.key, required this.apiUrl, required this.builder});
  final String apiUrl;
  final Widget Function(dynamic) builder;

  @override
  State<AppList> createState() => _AppListState();
}

class _AppListState extends State<AppList> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  // 总数
  int _t = 0;
  // page
  int _page = 1;
  // 每页条数
  int _page_size = 10;
  // 当前页数据
  List<Map<String, dynamic>> _d = [];
  // 页面数据
  final List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    // var res = await httpUtil.get(widget.apiUrl, {});
    print('第 $_page 页');
    // mock data

    setState(() {
      _data.addAll([
        {
          "id": 1,
          "name": "name1",
          "age": 18,
        },
        {
          "id": 2,
          "name": "name2",
          "age": 19,
        },
        {
          "id": 3,
          "name": "name3",
          "age": 20,
        },
        {
          "id": 4,
          "name": "name4",
          "age": 21,
        },
        {
          "id": 5,
          "name": "name5",
          "age": 22,
        },
        {
          "id": 6,
          "name": "name6",
          "age": 23,
        },
        {
          "id": 7,
          "name": "name7",
          "age": 24,
        },
        {
          "id": 8,
          "name": "name8",
          "age": 25,
        },
        {
          "id": 9,
          "name": "name9",
          "age": 26,
        },
        {
          "id": 10,
          "name": "name10",
          "age": 27,
        },
      ]);
    });
  }

  void _onRefresh() async {
    // monitor network fetch
    _page = 1;
    await Future.delayed(const Duration(milliseconds: 1000));
    _data.clear();
    _refreshController.resetNoData();
    _refreshController.refreshCompleted();
    await Future.delayed(const Duration(milliseconds: 1000));
    _getData();
    // if failed,use refreshFailed()
    // _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    _page++;
    await Future.delayed(const Duration(milliseconds: 1000));
    _getData();
    if (_page >= 3) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        header: CustomHeader(
          builder: (BuildContext context, RefreshStatus? mode) {
            Widget body;
            if (mode == RefreshStatus.idle) {
              body = const Text("下拉刷新");
            } else if (mode == RefreshStatus.refreshing) {
              body = const CircularProgressIndicator();
            } else if (mode == RefreshStatus.failed) {
              body = const Text("刷新失败！点击重试！");
            } else if (mode == RefreshStatus.canRefresh) {
              body = const Text("松手,刷新!");
            } else {
              body = const Text("刷新完成");
            }
            return Container(
              height: 55.0,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 25.w,
                  color: Colors.white,
                ),
                child: Center(child: body)
              ),
            );
          },
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text("上拉加载");
            } else if (mode == LoadStatus.loading) {
              body = const CircularProgressIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text("加载失败！点击重试！");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("松手,加载更多!");
            } else {
              body = const Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 25.w,
                  color: Colors.white,
                ),
                child: Center(child: body)
              ),
            );
          },
        ),
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return widget.builder(_data[index]);
          },
        )
    );
  }
}
