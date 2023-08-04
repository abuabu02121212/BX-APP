
import 'Log.dart';

class LoadMorePageIndexHelper {
  Map<String, int?> pageIndexMap = {};
  static const int allDataPageIndexMark = -2;

  int getRequestPageIndex(String listUIKey, int requestPageIndex) {
    int retIndex = 1;
    if (requestPageIndex == 1) {
      pageIndexMap[listUIKey] = 0;
    }else{
      int? pageIndex = pageIndexMap[listUIKey];
      retIndex = pageIndex! + 1;
    }
    Log.d2("listUIKey: $listUIKey   retIndex: $retIndex");
    return retIndex;
  }

  void updatePageIndex(String listUIKey) {
    int? pageIndex = pageIndexMap[listUIKey];
    pageIndexMap[listUIKey] = pageIndex! + 1;
  }

  bool isRequestedAllPage(String listUIKey) {
    return pageIndexMap[listUIKey] == allDataPageIndexMark;
  }

  void notifyRequestedAllPage(String listUIKey) {
    pageIndexMap[listUIKey] = allDataPageIndexMark;
  }

  void clear(String listUIKey) {
    pageIndexMap[listUIKey] = null;
  }
}
