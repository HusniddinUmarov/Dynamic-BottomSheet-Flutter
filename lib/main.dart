import 'package:dynamic_bottom_sheet_flutter/bottom_sheet_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: DraggableSheet(child: Column(
          children: [
            BottomSheetItems(),
            SizedBox(height: 8,),
            BottomSheetItems(),
            SizedBox(height: 8,),
            BottomSheetItems(),
            SizedBox(height: 8,),
            BottomSheetItems(),
            SizedBox(height: 8,),
            BottomSheetItems(),
            SizedBox(height: 8,),
            BottomSheetItems(),
          ],
        )),
      )
    );
  }
}

class DraggableSheet extends StatefulWidget {
  final Widget child;
  const DraggableSheet({super.key, required this.child});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    controller.addListener(onChanged);
  }

  void onChanged(){
    final currentSize = controller.size;
    if(currentSize <= 0.05) collapse();
  }

  void collapse() => animateSheet(getSheet.snapSizes!.first);
  void anchor() => animateSheet(getSheet.snapSizes!.last);
  void expand() => animateSheet(getSheet.maxChildSize);
  void hide() => animateSheet(getSheet.minChildSize);

  void animateSheet(double size){
   controller.animateTo(size, duration: const Duration(microseconds: 50), curve: Curves.easeInOut);
  }

  DraggableScrollableSheet get getSheet => (sheet.currentWidget as DraggableScrollableSheet);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints){
      return DraggableScrollableSheet(
        key: sheet,
          initialChildSize: 0.5,
          maxChildSize: 0.95,
          minChildSize: 0,
          expand: true,
          snap: true,
          snapSizes: [
            60/constraints.maxHeight,
            0.5
          ],
          builder: (BuildContext context, ScrollController scrollController){
            return DecoratedBox(decoration:
            const BoxDecoration(
              color:  Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(0, 1)
                )
              ],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22))
            ),child: CustomScrollView(
              controller: scrollController,
                slivers: [
                  topButtonIndicator(),
                  SliverToBoxAdapter(
                    child: widget.child,
                  )
                ],
            ),);
          });
    });
  }

  SliverToBoxAdapter topButtonIndicator(){
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Center(
                child: Wrap(
                  children: [
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


