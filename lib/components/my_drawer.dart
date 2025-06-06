import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/auth/auth_service.dart';
import 'package:fooddeliveryapp/components/my_drawer_tile.dart';
import '../auth/login_or_register.dart';
import '../pages/settings_page.dart';
//боковая панель настроек
//вместо того чтобы каждый раз писать ListTile с одинаковыми стилями,
// мы просто используем MyDrawerTile с нужными параметрами.
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout(){
    final authService = AuthService();
    authService.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top:100.0),
            child: Icon(Icons.lock_open_rounded,
            size: 80, color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(//разделительная полоска между значком замка сверху и остальными разделами
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home list tile
          MyDrawerTile(//это из my_drawer_tile мы создали там и используем здесь
            text:"H O M E",
            icon:Icons.home,
            onTap: ()=>Navigator.pop(context),),

          //settings list tile
          MyDrawerTile(
            text:"S E T T I N G S",
            icon:Icons.settings,
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsPage(),),);
              
            },),
          const Spacer(),
          //logout list tile
          MyDrawerTile(
            text:"L O G O U T",
            icon:Icons.logout,
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginOrRegister(),),);
            },),
          const SizedBox(height: 25,),
        ],
      ),
    );
  }
}
