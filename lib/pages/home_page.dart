import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Draggble Scrollable'),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Center(child: Text('Hola Mundo', style: TextStyle( color: Colors.white ))),

          BottomModal()

        ],

      )
   );
  }
}


class BottomModal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          child: ListaItems( scrollController ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )
          ),
        );
      },
    );
  }
}


class ListaItems extends StatelessWidget {

  final ScrollController scrollController;

  final items = new List(40);

  ListaItems( this.scrollController );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: this.scrollController,
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(
        title: Text('Item: $index'),
      ),
    );
  }
}