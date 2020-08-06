import '../base.dart';
import '../category/base.dart';

abstract class OrdinalScaleState<V, D> extends CategoryScaleState<V, D> {
  bool get isSorted => this['isSorted'] as bool ?? false;
  set isSorted(bool value) => this['isSorted'] = value;
}

abstract class OrdinalScaleComponent<S extends OrdinalScaleState<V, D>, V, D>
  extends CategoryScaleComponent<S, V, D>
{
  OrdinalScaleComponent([Scale props]) : super(props);

  // operations

  int compare(V a, V b);

  @override
  void assign() {
    if (!state.isSorted) {
      state.values.sort(compare);
    }

    super.assign();
  }
}
