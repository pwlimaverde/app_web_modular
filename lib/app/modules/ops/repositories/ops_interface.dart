import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:flutter_modular/flutter_modular.dart';


abstract class IOpsRepository extends Disposable{
  Stream<List<OpsModel>> getOpsAll();
  Future upProd(OpsModel model);
  Future canProd(OpsModel model);
}