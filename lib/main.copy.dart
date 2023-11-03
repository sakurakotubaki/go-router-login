//
//
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // setStateを使わずに状態管理を行う為のクラス
//   final _counterNotifier = ValueNotifier<int>(0);
//   final _changeText = ValueNotifier<String>('Fuga');
//   final changeColor = ValueNotifier<Color>(Colors.red);
//   final checkBoxNotifier = ValueNotifier<bool>(false);
//
//   @override
//   Widget build(BuildContext context) {
//     logger.d('build()');
//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter App')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // クリックすると、カウントアップする
//             ValueListenableBuilder(
//               valueListenable: _counterNotifier,
//               builder: (context, value, _) {
//                 return Text('Count: $value');
//               },
//             ),
//             const SizedBox(height: 16),
//             // クリックするとテキストが変わる
//             ValueListenableBuilder(
//               valueListenable: _changeText,
//               builder: (context, value, _) {
//                 return Text('Text: $value');
//               },
//             ),
//             const SizedBox(height: 16),
//             // クリックすると、色が変わる
//             ValueListenableBuilder(
//               valueListenable: changeColor,
//               builder: (context, value, _) {
//                 return TextButton(
//                   onPressed: () {
//                     changeColor.value = Colors.blue;
//                   },
//                   child: Text(
//                     'Change Color',
//                     style: TextStyle(color: value, fontSize: 20),
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: 16),
//             // チェックすると、Hello Worldが表示される
//             ValueListenableBuilder(
//               valueListenable: checkBoxNotifier,
//               builder: (context, value, _) {
//                 return value
//                     ? const Text('Hello World')
//                     : const Text('Check Box');
//               },
//             ),
//             const SizedBox(height: 16),
//             // チェックボックスの状態を管理する
//             ValueListenableBuilder(
//               valueListenable: checkBoxNotifier,
//               builder: (context, value, _) {
//                 return Checkbox(
//                   value: value,
//                   onChanged: (value) {
//                     checkBoxNotifier.value = value!;
//                   },
//                 );
//               },
//             ),
//             const SizedBox(height: 16),
//             // ボタンを押すと、テキストが変わる
//             ElevatedButton(onPressed: () {
//               _changeText.value = 'Hoge';
//             }, child: const Text('Change Text')),
//           ],
//         ),
//       ),
//       // ボタンを押すと、カウントアップする
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _counterNotifier.value++;
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
//   // メモリリークを防ぐために、dispose()でValueNotifierを破棄する
//   @override
//   void dispose() {
//     logger.d('dispose()');
//     _counterNotifier.dispose();
//     super.dispose();
//   }
// }