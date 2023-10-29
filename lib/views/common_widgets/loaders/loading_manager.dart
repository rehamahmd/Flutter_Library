import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/src/request_status_controller.dart';
import 'package:flutter_app/enums/enums.dart';
import 'package:flutter_app/views/styles/styles.dart';

import 'app_page_loading.dart';
import 'failed_loading.dart';

class LoadingManager extends StatefulWidget {
  final bool isLoading;
  final bool isNotPage;
  final bool askOnBack;
  final bool stopRefresh;
  final RequestStatus? status;
  final double? notPageHeight;
  final double? failedToLoadHeight;
  final Future<void> Function()? onRefresh;
  final Widget child;

  const LoadingManager({
    Key? key,
    required this.isLoading,
    this.onRefresh,
    required this.child,
    this.isNotPage = false,
    this.stopRefresh = false,
    this.notPageHeight,
    this.askOnBack = false,
    this.failedToLoadHeight,
    this.status = RequestStatus.success,
  }) : super(key: key);

  @override
  _LoadingManagerState createState() => _LoadingManagerState();
}

class _LoadingManagerState extends State<LoadingManager> {
  bool _isLoading = false;

  @override
  void initState() {
    // to load data if load not start
    if (widget.onRefresh != null && widget.status == null) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        widget.onRefresh!();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget? _placeHolder;

    // if loading of still not start in loading (true or null)
    // return loading widget
    if (widget.isLoading != false || widget.status == null || _isLoading) {
      _placeHolder = widget.isNotPage
          ? SizedBox(height: widget.notPageHeight, child: const APageLoading())
          : const APageLoading();
    } else if (widget.status != RequestStatus.success) {
      // if failed return failed widget
      _placeHolder = Center(
        child: SizedBox(
          height: widget.failedToLoadHeight ?? AppResponsive.size.width,
          child: FailedLoading(
            message: RequestStatusController.getStatusMessage(
              status: widget.status,
            ),
            onReload: () async {
              _isLoading = true;
              setState(() {});
              if (widget.onRefresh != null) await widget.onRefresh!();
              _isLoading = false;
              setState(() {});
            },
          ),
        ),
      );
    }

    if (widget.stopRefresh || widget.onRefresh == null) {
      return AnimatedSize(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 400),
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400), child: _placeHolder ?? widget.child),
      );
    }

    // if load end successfully return loaded widget
    return RefreshIndicator(
        onRefresh: widget.onRefresh!,
        child: AnimatedSize(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 400),
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400), child: _placeHolder ?? widget.child),
        ),);
  }
}
