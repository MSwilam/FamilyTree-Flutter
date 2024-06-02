import 'package:common_flutter/provider/commonCoreProvider.dart';
import 'package:common_flutter/shared/colors.dart';
import 'package:common_flutter/shared/constants.dart';
import 'package:common_flutter/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:family_tree/models/appSettings.dart';
import 'package:family_tree/screens/tree_graphview.dart';
import 'package:graphview/GraphView.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class TreeFamily extends StatelessWidget {
  TreeFamily({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  //text field state

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TreeViewPage(),
                      ),
                    ),
                child: const Text(
                  'Tree View (BuchheimWalker)',
                  style: TextStyle(fontSize: 30),
                )),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () => {},
                child: const Text(
                  'Graph Cluster View (FruchtermanReingold)',
                  style: TextStyle(fontSize: 30),
                )),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                color: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () => {},
                child: const Text(
                  "Layered View (Sugiyama)",
                  style: TextStyle(fontSize: 30),
                )),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () => {},
                child: const Text(
                  'Tree View From Json(BuchheimWalker)',
                  style: TextStyle(fontSize: 30),
                )),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () => {},
                child: const Text(
                  'Layer Graph From Json ',
                  style: TextStyle(fontSize: 30),
                )),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                var graph = new Graph();

                Node node1 = Node.Id('One');
                Node node2 = Node.Id('Two');
                Node node3 = Node.Id('Three');
                Node node4 = Node.Id('Four');
                Node node5 = Node.Id('Five');
                Node node6 = Node.Id('Six');
                Node node7 = Node.Id('Seven');
                Node node8 = Node.Id('Eight');
                Node node9 = Node.Id('Nine');
                graph.addEdge(node1, node2);
                graph.addEdge(node1, node4);
                graph.addEdge(node2, node3);
                graph.addEdge(node2, node5);
                graph.addEdge(node3, node6);
                graph.addEdge(node4, node5);
                graph.addEdge(node4, node7);
                graph.addEdge(node5, node6);
                graph.addEdge(node5, node8);
                graph.addEdge(node6, node9);
                graph.addEdge(node7, node8);
                graph.addEdge(node8, node9);
                var builder = FruchtermanReingoldAlgorithm();

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => GraphScreen(graph, builder, null)),
                // );
              },
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'Square Grid (FruchtermanReingold)',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                var graph = new Graph();

                Node node1 = Node.Id('One');
                Node node2 = Node.Id('Two');
                Node node3 = Node.Id('Three');
                Node node4 = Node.Id('Four');
                Node node5 = Node.Id('Five');
                Node node6 = Node.Id('Six');
                Node node7 = Node.Id('Seven');
                Node node8 = Node.Id('Eight');
                Node node9 = Node.Id('Nine');
                Node node10 = Node.Id('Ten');

                graph.addEdge(node1, node2);
                graph.addEdge(node1, node3);
                graph.addEdge(node2, node4);
                graph.addEdge(node2, node5);
                graph.addEdge(node2, node3);
                graph.addEdge(node3, node5);
                graph.addEdge(node3, node6);
                graph.addEdge(node4, node7);
                graph.addEdge(node4, node8);
                graph.addEdge(node4, node5);
                graph.addEdge(node5, node8);
                graph.addEdge(node5, node9);
                graph.addEdge(node5, node6);
                graph.addEdge(node9, node6);
                graph.addEdge(node10, node6);
                graph.addEdge(node7, node8);
                graph.addEdge(node8, node9);
                graph.addEdge(node9, node10);

                var builder = FruchtermanReingoldAlgorithm();

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => GraphScreen(graph, builder, null)),
                // );
              },
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'Triangle Grid (FruchtermanReingold)',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DecisionTreeScreen()),
                // );
              },
              color: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'Decision Tree (Sugiyama)',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget createNode(String nodeText) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          nodeText,
          style: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
