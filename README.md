# ValueNotifierを使う例
ValueNotifier<T> classとは、値を保持するだけでなく、値の変更を通知することができるクラスです。

**使用例**
setState()を使わずに、値の変更を通知することができます。
カウンターを追加する例だとこのようになります。

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ValueNotifier'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              RaisedButton(
                child: Text('カウントアップ'),
                onPressed: () {
                  _counter.value++;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

ValueNotifierクラスの内部はこのようになっています。
```dart
/// A [ChangeNotifier] that holds a single value.
///
/// When [value] is replaced with something that is not equal to the old
/// value as evaluated by the equality operator ==, this class notifies its
/// listeners.
///
/// ## Limitations
///
/// Because this class only notifies listeners when the [value]'s _identity_
/// changes, listeners will not be notified when mutable state within the
/// value itself changes.
///
/// For example, a `ValueNotifier<List<int>>` will not notify its listeners
/// when the _contents_ of the list are changed.
///
/// As a result, this class is best used with only immutable data types.
///
/// For mutable data types, consider extending [ChangeNotifier] directly.
class ValueNotifier<T> extends ChangeNotifier implements ValueListenable<T> {
  /// Creates a [ChangeNotifier] that wraps this value.
  ValueNotifier(this._value) {
    if (kFlutterMemoryAllocationsEnabled) {
      MemoryAllocations.instance.dispatchObjectCreated(
        library: _flutterFoundationLibrary,
        className: '$ValueNotifier',
        object: this,
      );
    }
    _creationDispatched = true;
  }

  /// The current value stored in this notifier.
  ///
  /// When the value is replaced with something that is not equal to the old
  /// value as evaluated by the equality operator ==, this class notifies its
  /// listeners.
  @override
  T get value => _value;
  T _value;
  set value(T newValue) {
    if (_value == newValue) {
      return;
    }
    _value = newValue;
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
```

英語の部分を翻訳するとこのように書かれています。
>/// 単一の値を保持する [ChangeNotifier]。
///
/// [値] が古いものと等しくないものに置き換えられた場合
/// 等価演算子 == によって評価された値、このクラスはそのクラスに通知します
/// リスナー。
///
/// ## 制限事項
///
/// このクラスは、[値] の _identity_ が取得された場合にのみリスナーに通知するためです。
/// 変更があった場合、リスナーは、内部で可変状態になったときに通知されません。
/// 値自体が変化します。
///
/// たとえば、`ValueNotifier<List<int>>` はリスナーに通知しません
/// リストの_contents_が変更されたとき。
///
/// 結果として、このクラスは不変のデータ型でのみ使用するのが最適です。
///
/// 可変データ型の場合は、[ChangeNotifier] を直接拡張することを検討してください。

ValueListenableBuilderクラスとは、ValueNotifierクラスの値が変更されたときに、
リビルドするためのクラスです。

## ライフサイクルの仕組みを説明すると、このようになります。
Textを例に出すと...

1. ビルドされて、ValueNotifierクラスの値が変更される
2. ValueNotifierクラスの値が変更されると、ValueListenableBuilderクラスがリビルドされる
3. ValueListenableBuilderクラスがリビルドされると、ValueListenableBuilderクラスの中のbuilderが実行される
4. builderが実行されると、Textクラスがリビルドされる
5. Textクラスがリビルドされると、画面に表示される
6. なので、`Fuga -> Hoge`に変わる