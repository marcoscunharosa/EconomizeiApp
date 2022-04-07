import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final Function goToEditMeals;
  const NavigationDrawerWidget({Key? key, required this.goToEditMeals})
      : super(key: key);
  Widget _getSectionTitle(String title) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 10),
            child: Text(
              title,
              style: TextStyle(
                color: const Color(0xFFCF8F8F),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getItemOfSection(IconData icon, String text, Function onTapFuction) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      child: ListTile(
        onTap: () {
          onTapFuction();
        },
        leading: Icon(
          icon,
          color: const Color(0xFFEE0F55),
        ),
        title: Text(text,
            style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
        trailing: const Icon(
          Icons.arrow_forward_ios_sharp,
          size: 16,
          color: const Color(0xFFCF8F8F),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFF8F8F8),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 20),
                child: IconButton(
                  onPressed: () => {Navigator.pop(context)},
                  icon: Icon(
                    Icons.close,
                    color: Color(0xFFEE0F55),
                    size: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                      child: Icon(Icons.account_circle_sharp, size: 60),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Fulano de tal',
                          style: TextStyle(
                              fontSize: 18,
                              color: const Color(0xFFEE0F55),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'fulanodetal@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xFFCF8F8F),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                _getSectionTitle('Perfil'),
                _getItemOfSection(
                    Icons.account_circle, 'Informações do perfil', () {}),
                _getItemOfSection(Icons.edit, 'Minhas refeições', () {
                  Navigator.pop(context);
                  goToEditMeals();
                }),
                _getSectionTitle('Geral'),
                _getItemOfSection(
                    Icons.notifications, 'Gerenciar notificações', () {}),
                _getItemOfSection(
                    Icons.build, 'Configurações avançadas', () {}),
                _getSectionTitle('Sobre'),
                _getItemOfSection(Icons.info, 'Sobre nós', () {}),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Sair",
                      style: TextStyle(
                          color: const Color(0xFFEE0F55), fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
