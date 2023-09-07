library flutter_verification_code_field;

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@protected
List<FocusNode> useFocusNodeList({
  required int length,
  String? debugLabel,
}) {
  assert(length > 0, 'Length must be positive');
  return use(
    _FocusNodeListHook(debugLabel: debugLabel, length: length),
  );
}

class _FocusNodeListHook extends Hook<List<FocusNode>> {
  const _FocusNodeListHook({
    required this.length,
    this.debugLabel,
  });

  final String? debugLabel;
  final int length;

  @override
  _FocusNodeListHookState createState() {
    return _FocusNodeListHookState();
  }
}

class _FocusNodeListHookState
    extends HookState<List<FocusNode>, _FocusNodeListHook> {
  late final List<FocusNode> _focusNodes = [];

  @override
  void initHook() {
    for (var i = 0; i < hook.length; i++) {
      _focusNodes.add(FocusNode(debugLabel: '${hook.debugLabel}$i'));
    }
  }

  @override
  List<FocusNode> build(BuildContext context) => _focusNodes;

  @override
  void dispose() {
    for (final f in _focusNodes) {
      f.dispose();
    }
  }

  @override
  String get debugLabel => 'useFocusNodeList';
}
