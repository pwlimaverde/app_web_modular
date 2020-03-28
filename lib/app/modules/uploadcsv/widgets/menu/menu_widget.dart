import 'package:eco_web_mobx/app/modules/uploadcsv/uploadcsv_status.dart';
import 'package:eco_web_mobx/app/shared/utilitario/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuWidget extends StatelessWidget {
  var controller;

  MenuWidget({this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return _container();
    });
  }

  _container() {
    return Container(
      width: menuWidth,
      color: Colors.grey[400],
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.blueGrey,
            child: ListTile(
                leading: controller.status == UploadcsvStatus.loading
                    ? CircularProgressIndicator()
                    : IconButton(
                        icon: Icon(Icons.file_upload),
                        onPressed: () => controller.uploadOps(),
                      ),
                title: controller.status == UploadcsvStatus.loading
                    ? Text("Upando")
                    : Text("Upload")),
          ),
          Container(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.cloud),
                onPressed: () => _navOpsPage(),
              ),
              title: Text("Ops"),
            ),
          ),
          Container(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.star),
                onPressed: () => null,
              ),
              title: Text("Orçamento Flexo ..."),
            ),
          ),
        ],
      ),
    );
  }
}

_navOpsPage() {
  return Modular.to.pushNamed("/ops");
}