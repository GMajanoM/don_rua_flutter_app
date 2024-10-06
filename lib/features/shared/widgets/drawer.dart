import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

enum AllowedRoles { secretary, priest, user }

class DrawerItem {
  final IconData icon;
  final String title;
  final String url;
  final List<AllowedRoles> allowedRoles;
  final bool isSpecial;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.url,
    required this.allowedRoles,
    this.isSpecial = false,
  });
}

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final bool isLoggedIn;

  const CustomDrawer(
      {super.key, required this.selectedIndex, required this.isLoggedIn});

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
        url: '/home',
      ),
      DrawerItem(
        icon: Icons.church_rounded,
        title: 'Servicios Parroquiales',
        allowedRoles: [
          AllowedRoles.secretary,
          AllowedRoles.priest,
          AllowedRoles.user,
        ],
        url: '/services',
      ),
      DrawerItem(
        icon: Icons.group_add_rounded,
        title: 'Sobre Nosotros',
        allowedRoles: [
          AllowedRoles.secretary,
          AllowedRoles.priest,
          AllowedRoles.user,
        ],
        url: '/about-us',
      ),
      DrawerItem(
        icon: Icons.schedule_rounded,
        title: 'Horario de Misas',
        allowedRoles: [
          AllowedRoles.secretary,
          AllowedRoles.priest,
          AllowedRoles.user,
        ],
        url: '/schedules',
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
          url: '/my-account',
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
              url: '/login',
            )
          : DrawerItem(
              icon: Icons.logout_rounded,
              title: 'Cerrar Sesión',
              allowedRoles: [
                AllowedRoles.secretary,
                AllowedRoles.priest,
                AllowedRoles.user,
              ],
              url: '/logout',
            ),
      DrawerItem(
        icon: Icons.monetization_on_rounded,
        title: 'Donaciones',
        allowedRoles: [
          AllowedRoles.secretary,
          AllowedRoles.priest,
          AllowedRoles.user,
        ],
        url: '/donations',
        isSpecial: true,
      ),
    ];

    final size = MediaQuery.of(context).size;

    return NavigationDrawer(
      selectedIndex: selectedIndex,
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
                    onTap: () {
                      context.go(item.url);
                    },
                    icon: item.icon,
                    title: item.title,
                    isSpecial: item.isSpecial,
                    isSelected: index == selectedIndex,
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
                    isSpecial: item.isSpecial,
                    isSelected: false,
                  );
                },
              ),
              const SizedBox(height: 16),
              const ConnectionsCard(phoneNumber: '2526 9700'),
            ],
          ),
        ),
      ],
    );
  }
}

class ConnectionsCard extends StatelessWidget {
  final String phoneNumber;

  const ConnectionsCard({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      width: size.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Conexiones',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Bootstrap.whatsapp, color: Colors.green),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Bootstrap.facebook, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Bootstrap.instagram, color: Colors.pink),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Bootstrap.envelope, color: Colors.orange),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.phone, color: Colors.orange),
              const SizedBox(width: 8),
              Text(phoneNumber),
            ],
          ),
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final String title;
  final bool isSelected;
  final bool isSpecial;

  const DrawerButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.isSpecial,
    required this.isSelected,
  });

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
            color: isSpecial
                ? colors.secondary
                : isSelected
                    ? colors.tertiary
                    : null,
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
