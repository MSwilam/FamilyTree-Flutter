import 'package:family_tree/models/generalGrandparents.dart';
import 'package:family_tree/provider/generalGrandparentsProvider.dart';
import 'package:family_tree/services/generalGrandparentsService.dart';
import 'package:family_tree/shared/ScreenRoutes.dart';
import 'package:family_tree/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

GeneralGrandparentsService service = GeneralGrandparentsService();
List<GeneralGrandparents>? s;

class TreeViewPage extends StatefulWidget {
  @override
  _TreeViewPageState createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<TreeViewPage> {
  getData() async {
    s = await service
        .getGeneralGrandparentTree()
        .whenComplete(() => setState(() {}));
    AddTree();

    // service
    //     .getGeneralGrandparentTree()
    //     .then((value) => s = value as List<GeneralGrandparents>)
    //     .whenComplete(AddTree());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(('FamilyTree_Design').tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              generalGrandparentsRoute(context);
            },
          ),
          backgroundColor: appbarColor,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            s != null
                ? Expanded(
                    child: InteractiveViewer(
                        constrained: false,
                        boundaryMargin: EdgeInsets.all(100),
                        minScale: 0.01,
                        maxScale: 5.6,
                        child: GraphView(
                          graph: graph,
                          algorithm: BuchheimWalkerAlgorithm(
                              builder, TreeEdgeRenderer(builder)),
                          paint: Paint()
                            ..color = Colors.green
                            ..strokeWidth = 1
                            ..style = PaintingStyle.stroke,
                          builder: (Node node) {
                            // I can decide what widget should be shown here based on the id
                            var a = node.key!.value as int?;
                            return rectangleWidget(a);
                          },
                        )),
                  )
                : Text('Loading'),
          ],
        ));
  }

  Widget rectangleWidget(int? a) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.blue[100]!, spreadRadius: 1),
            ],
          ),
          child: Text(s![a!].arabicName!)),
    );
  }

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  AddTree() {
    if (s == null) {
    } else {
      List<Node>? Nodes = List.filled(s!.length, Node.Id(0));
      for (var i = 1; i < s!.length; i++) {
        Nodes[i] = Node.Id(i);
      }
      for (GeneralGrandparents element in s!) {
        if (element.parentId == 0) {
        } else {
          int Newid = element.id! - 1;
          int oldid = element.parentId! - 1;
          graph.addEdge(Nodes[oldid], Nodes[Newid]);
        }
      }

      // graph.addEdge(Nodes[0], Nodes[1]);
      // graph.addEdge(Nodes[0], Nodes[2]);
      // graph.addEdge(Nodes[1], Nodes[3]);
      // graph.addEdge(Nodes[1], Nodes[4]);
      // graph.addEdge(Nodes[1], Nodes[5]);

      builder
        ..siblingSeparation = (100)
        ..levelSeparation = (150)
        ..subtreeSeparation = (150)
        ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
    }
  }

  @override
  void initState() {
    getData();
    // graph.addEdge(Nodes[1], Nodes[2]);
    // graph.addEdge(Nodes[1], Nodes[3], paint: Paint()..color = Colors.red);
    // graph.addEdge(Nodes[1], Nodes[4], paint: Paint()..color = Colors.blue);
    // graph.addEdge(Nodes[2], Nodes[5]);
    // graph.addEdge(Nodes[2], Nodes[6]);
    // graph.addEdge(Nodes[6], Nodes[7], paint: Paint()..color = Colors.red);
    // graph.addEdge(Nodes[6], Nodes[8], paint: Paint()..color = Colors.red);
    // graph.addEdge(Nodes[4], Nodes[9]);
    // graph.addEdge(Nodes[4], Nodes[10], paint: Paint()..color = Colors.black);
    // graph.addEdge(Nodes[4], Nodes[11], paint: Paint()..color = Colors.red);
    // graph.addEdge(Nodes[11], Nodes[12]);
    // final node1 = Node.Id(1);
    // final node2 = Node.Id(2);
    // final node3 = Node.Id(3);
    // final node4 = Node.Id(4);
    // final node5 = Node.Id(5);
    // final node6 = Node.Id(6);
    // final node8 = Node.Id(7);
    // final node7 = Node.Id(8);
    // final node9 = Node.Id(9);
    // final node10 = Node.Id(10);
    // final node11 = Node.Id(11);
    // final node12 = Node.Id(12);
    // graph.addEdge(node1, node2);
    // graph.addEdge(node1, node3, paint: Paint()..color = Colors.red);
    // graph.addEdge(node1, node4, paint: Paint()..color = Colors.blue);
    // graph.addEdge(node2, node5);
    // graph.addEdge(node2, node6);
    // graph.addEdge(node6, node7, paint: Paint()..color = Colors.red);
    // graph.addEdge(node6, node8, paint: Paint()..color = Colors.red);
    // graph.addEdge(node4, node9);
    // graph.addEdge(node4, node10, paint: Paint()..color = Colors.black);
    // graph.addEdge(node4, node11, paint: Paint()..color = Colors.red);
    // graph.addEdge(node11, node12);
  }
}
