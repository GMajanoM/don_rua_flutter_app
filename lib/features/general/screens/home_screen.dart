import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    const drawerIndex = 0;

    return Scaffold(
      appBar: getAppbar(size),
      drawer: const CustomDrawer(
        index: drawerIndex,
        isLoggedIn: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    constraints: BoxConstraints(maxHeight: size.height * 0.3),
                    child: Image.asset(
                      'assets/img/church.jpeg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(maxHeight: size.height * 0.3),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Texto de Apoyo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          'Título de Ejemplo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Descripción de la iglesia y visión que se tiene. Reflexiones, practicas, enseñanzas, en adultos y jóvenes.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: size.width * 0.5,
                          child: FilledButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Icon(Icons.calendar_month_rounded),
                                SizedBox(width: 8),
                                Text('Observar eventos'),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  ModuleCards(size: size),
                  const SizedBox(height: 16),
                  const Divider(),
                  Column(
                    children: [
                      const Text(
                        'Última actividad',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      CustomCard(
                          title: 'Información de Importancia',
                          color: colors.secondary,
                          status: 'Programado',
                          information:
                              'Et incididunt non ut deserunt tempor. In do commodo Lorem eiusmod cupidatat nisi adipisicing est do aliqua labore laboris aliqua. Excepteur cupidatat Lorem deserunt sint. Qui sint et qui quis nisi quis sunt consectetur.',
                          coversWidth: true),
                      const SizedBox(height: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModuleCards extends StatelessWidget {
  const ModuleCards({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.15,
      width: size.width * 0.95,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          ModuleCard(
            title: 'Misas, Adoraciones y Confesiones',
            imgUrl: 'assets/img/church-inside.png',
            onTap: () {},
          ),
          ModuleCard(
            title: 'Actividades',
            imgUrl: 'assets/img/ave-maria.png',
            onTap: () {},
          ),
          ModuleCard(
            title: 'Historia',
            imgUrl: 'assets/img/offices.png',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
