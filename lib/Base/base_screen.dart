import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'base_controller.dart';

abstract class BaseWidgetObx<T extends BaseController> extends StatelessWidget {
  const BaseWidgetObx({Key? key,}) : super(key: key);



  T get controller => GetInstance().find<T>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => vmBuilder());
  }

  Widget vmBuilder();
}

// ignore: must_be_immutable
abstract class BaseWidget<T extends BaseController> extends StatelessWidget {
  //T get controller => GetInstance().find<T>(tag: tag);
  final String? tag;
  late T controller;

  BaseWidget({Key? key, this.tag}) : super(key: key) {
    if (Get.isRegistered<T>(tag: tag)) {
      controller = GetInstance().find<T>(tag: tag);
    }
  }
}

// ignore: must_be_immutable
abstract class BaseScreen<T extends BaseController> extends StatelessWidget {
  final String? tag;
  late T controller;

  late BuildContext context;

  T putController();

  BaseScreen({Key? key, this.tag, bool isKeep = false}) : super(key: key) {
    setController(isKeep);
  }

  void setController(bool isKeep) {
    if (!Get.isRegistered<T>(tag: tag)) {
      controller = GetInstance().put(putController(), permanent: isKeep, tag: tag);
    } else {
      controller = GetInstance().find<T>(tag: tag);
    }
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    // return GetBuilder<T>(
    //   builder: (controller) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value:  const SystemUiOverlayStyle(),
        child: builder());
    // },
    // );
  }

  Widget builder();
}
