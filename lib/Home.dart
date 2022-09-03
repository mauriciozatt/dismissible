import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _vLista = ['Maurício', 'Teste', 'teste1', 'teste22'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _vLista.length,
                  itemBuilder: (context, i) {
                    ///Dismissible é usado para possibilitar arrastar para os lados os registros de uma lista por exemplo
                    return Dismissible(
                      key: Key(_vLista[i]),
                      child: ListTile(
                        title: Text(_vLista[i].toString()),
                      ),
                      direction: DismissDirection.endToStart,

                      ///Meu background recebe um Widget....
                      background: Container(
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.delete),
                          ],
                        ),
                      ),


                      onDismissed: (DirecaoEscolhida) {
                        if (DirecaoEscolhida.toString() == DismissDirection.endToStart.toString()) {
                          setState(() {
                            _vLista.removeAt(i);
                          });
                        }
                      },
                    );
                  }))
        ],
      ),
    );
  }
}
