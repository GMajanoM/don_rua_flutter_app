import 'package:flutter/material.dart';

enum AllowedRoles { secretary, priest, user }

class DrawerItem {
  final IconData icon;
  final String title;
  final List<AllowedRoles> allowedRoles;
  final bool isSpecial;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.allowedRoles,
    this.isSpecial = false,
  });
}

class CustomDrawer extends StatelessWidget {
  final int index;
  final bool isLoggedIn;

  const CustomDrawer(
      {super.key, required this.index, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    final List<DrawerItem> generalDrawerItems = [
      DrawerItem(
        icon: Icons.home_rounded,
        title: 'Inicio',
        allowedRoles: [
          AllowedRoles.secretary,
          AllowedRoles.priest,
          AllowedRoles.user,
        ],
      ),
      DrawerItem(
        icon: Icons.church_rounded,
        title: 'Servicios Parroquiales',
        allowedRoles: [
          AllowedRoles.secretary,
          AllowedRoles.priest,
          AllowedRoles.user,
        ],
      ),
      DrawerItem(
        icon: Icons.group_add_rounded,
        title: 'Sobre Nosotros',
        allowedRoles: [
          AllowedRoles.secretary,
          AllowedRoles.priest,
          AllowedRoles.user,
        ],
      ),
      DrawerItem(
        icon: Icons.schedule_rounded,
        title: 'Horario de Misas',
        allowedRoles: [
          AllowedRoles.secretary,
          AllowedRoles.priest,
          AllowedRoles.user,
        ],
      ),
    ];

    final List<DrawerItem> sessionDrawerItems = [
      if (isLoggedIn)
        DrawerItem(
          icon: Icons.person_outlined,
          title: 'Mi Cuenta',
          allowedRoles: [
            AllowedRoles.secretary,
            AllowedRoles.priest,
            AllowedRoles.user,
          ],
        ),
      !isLoggedIn
          ? DrawerItem(
              icon: Icons.login_rounded,
              title: 'Iniciar Sesión',
              allowedRoles: [
                AllowedRoles.secretary,
                AllowedRoles.priest,
                AllowedRoles.user,
              ],
            )
          : DrawerItem(
              icon: Icons.logout_rounded,
              title: 'Cerrar Sesión',
              allowedRoles: [
                AllowedRoles.secretary,
                AllowedRoles.priest,
                AllowedRoles.user,
              ],
            ),
      DrawerItem(
        icon: Icons.monetization_on_rounded,
        title: 'Donaciones',
        allowedRoles: [
          AllowedRoles.secretary,
          AllowedRoles.priest,
          AllowedRoles.user,
        ],
        isSpecial: true,
      ),
    ];

    final size = MediaQuery.of(context).size;

    return NavigationDrawer(
      selectedIndex: index,
      children: [
        SizedBox(
          height: size.height * 0.1,
          child: Image.asset('assets/img/logo-color.png'),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: generalDrawerItems.length,
                itemBuilder: (context, index) {
                  final item = generalDrawerItems[index];

                  return DrawerButton(
                    onTap: () {},
                    icon: item.icon,
                    title: item.title,
                    isSpecial: item.isSpecial,
                  );
                },
              ),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: sessionDrawerItems.length,
                itemBuilder: (context, index) {
                  final item = sessionDrawerItems[index];

                  return DrawerButton(
                      onTap: () {},
                      icon: item.icon,
                      title: item.title,
                      isSpecial: item.isSpecial);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DrawerButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final String title;
  final bool isSpecial;

  const DrawerButton(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.title,
      required this.isSpecial});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSpecial ? colors.secondary : null,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 16),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
