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
        selectedIndex: drawerIndex,
        isLoggedIn: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BigImage(
              size: size,
              imageUrl: 'assets/img/church.jpeg',
              alignment: CrossAxisAlignment.start,
              extras: [
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
                  width: size.width * 0.55,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.calendar_month_rounded),
                        SizedBox(width: 8),
                        Text(
                          'Observar eventos',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  ModuleCards(size: size),
                  const SizedBox(height: 25),
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
                      const SizedBox(height: 25),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActivityCard(
                        title: 'Actividad matutina',
                        description:
                            'Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                        imagePath: 'assets/img/ave-maria.png',
                        status: 'Activa',
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Noticias recientes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ModuleNews(size: size),
                  const SizedBox(height: 25),
                  DonationSection(size: size)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModuleNews extends StatelessWidget {
  const ModuleNews({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.42,
      width: size.width * 0.95,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          RecentNewsCard(
              title: 'Helo',
              description: "Holaaaaaaaaaaaaaaaaaaaaaa",
              imageUrl: 'assets/img/church-inside.png',
              date: '25/05/2222'),
          RecentNewsCard(
              title: 'Helo',
              description: "Holaaaaaaaaaaaaaaaaaaaaaa",
              imageUrl: 'assets/img/church-inside.png',
              date: '25/05/2222'),
        ],
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

class ActivityCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String status;

  const ActivityCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      width: size.width * 0.95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
