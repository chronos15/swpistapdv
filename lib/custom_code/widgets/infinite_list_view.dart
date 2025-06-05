// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:m_s_framework_flutter_p5iajh/backend/schema/structs/index.dart"
    as m_s_framework_flutter_p5iajh_data_schema;
import "package:m_s_framework_flutter_p5iajh/backend/schema/enums/enums.dart"
    as m_s_framework_flutter_p5iajh_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class InfiniteListView extends StatefulWidget {
  const InfiniteListView({
    super.key,
    this.width,
    this.height,
    required this.cardWidget,
    required this.actOnFinish,
    required this.listJson,
  });

  final double? width;
  final double? height;
  final Widget Function(dynamic jsonValue) cardWidget;
  final Future<void> Function(int iPage, int iDemmand) actOnFinish;
  final List<dynamic> listJson;

  @override
  State<InfiniteListView> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isLoading = false;
  final int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    setState(() {
      _isLoading = true;
    });
    await widget.actOnFinish(_currentPage, _pageSize);
    setState(() {
      _currentPage++;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.listJson.length + 1,
        itemBuilder: (context, index) {
          if (index < widget.listJson.length) {
            final item = widget.listJson[index];
            return widget.cardWidget(item);
          } else {
            return _isLoading
                ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : const SizedBox();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
