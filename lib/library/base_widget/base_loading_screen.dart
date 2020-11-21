import 'package:cesta_amiga/library/base_store/loading_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class BaseLoadingWidget extends StatefulWidget {
  final Widget body;

  BaseLoadingWidget({
    @required this.body,
  });

  @override
  _BaseLoadingWidgetState createState() => _BaseLoadingWidgetState();
}

class _BaseLoadingWidgetState extends State<BaseLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return this._buildContainer(context);
  }

  Widget _buildContainer(BuildContext context) {
    return Observer(
      name: this.widget.body.runtimeType.toString(),
      builder: (_) {
        return Stack(
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanDown: (detail) {
                FocusScope.of(context).unfocus();
              },
              child: this.widget.body,
            ),
            GetIt.I<LoadingStore>().isLoading
                ? Container(
                    color: Colors.transparent,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          Colors.blueAccent,
                        ),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  )
                : SizedBox.shrink()
          ],
        );
      },
    );
  }
}
