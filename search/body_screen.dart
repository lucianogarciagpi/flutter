import 'package:flutter/material.dart';

class BodyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      child: Column(
        children: <Widget>[

	 /// Botão para voltar para Home	
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Icon(Icons.close, color: Colors.grey,),
                onTap: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context){
                            return (HomeScreen());
                          }
                      )
                  );
                },
              ),
            ],
          ),

	  /// Titulo para o campo TextField	
          Padding(
              padding: EdgeInsets.only(top: 50, bottom: 50),
            child: Text(
              "Para quem é o produto?",
              style: TextStyle(
              fontSize: 36,
              ),
            ),
          ),
	
	  /// Campo para pesquisar		
          Container(
            child: Consumer<UsuarioManager>(
              builder: (_, usuarioManager, __) {
                  return Card(
                    child: ListTile(
                      title: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Nome, cpf ou cnpj",
                          border: InputBorder.none,
                        ),
                        onChanged: (string) async {
                          final search = controllerSearch;
                          usuarioManager.search = search as String;
                        },
                      ),
                    ),
                  );

              }
            ),

          ),

          /// Exibição da Lista
          Expanded(
            child: Consumer<UsuarioManager>(
              builder: (_, usuarioManager, __){
                final filteredUsers = usuarioManager.filteredUsers;
                return ListView.builder(
                    padding: const EdgeInsets.all(4),
                    itemCount: filteredUsers.length,
                    itemBuilder: (_, index ){
                      return UsuarioListTile(filteredUsers[index]);
                    }
                );
              },
            ),
          ),
        ],
      )
    );
  }
}