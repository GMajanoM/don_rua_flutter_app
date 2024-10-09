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
                Container(
                  constraints: BoxConstraints(maxWidth: size.width * 0.55),
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
                      CustomCardCarousel(
                        cards: [
                          {
                            'title': 'Información de Importancia',
                            'color': colors.secondary,
                            'status': 'Programado',
                            'information':
                                'Et incididunt non ut deserunt tempor. In do commodo Lorem eiusmod cupidatat nisi adipisicing est do aliqua labore laboris aliqua.',
                          },
                          {
                            'title': 'Actividad Matutina',
                            'color': colors.primary,
                            'status': 'Activa',
                            'information':
                                'Excepteur cupidatat Lorem deserunt sint. Qui sint et qui quis nisi quis sunt consectetur.',
                          },
                          const {
                            'title': 'Actividad Nocturna',
                            'color': Colors.purple,
                            'status': 'Finalizado',
                            'information':
                                'Qui sint et qui quis nisi quis sunt consectetur ad non deserunt tempor.',
                          },
                        ],
                      ),
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
                  DonationSection(size: size),
                  const SizedBox(height: 25),
                  const Text(
                    'Servicios Parroquiales',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const ParroquialServicesSection(),
                  const SizedBox(height: 25),
                  const Text(
                    'Obras Sociales',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const ObrasSocialesSection(),
                  const SizedBox(height: 20),
                  const Text(
                    'Blog Salesiano',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const BlogSalesianoCard(),
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
              title: 'Titulo de Ejemplo',
              description: "Descripción de la noticia",
              imageUrl: 'assets/img/church-inside.png',
              date: '25/05/2222'),
          RecentNewsCard(
              title: 'Titulo de Ejemplo',
              description: "Descripción de la noticia",
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

class BlogSalesianoCard extends StatelessWidget {
  const BlogSalesianoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                'assets/img/church-inside.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Container(
                    width: 60,
                    height: 4,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Visita el blog y nuestros proyectos culturales y actualizaciones nuevas en nuestra Parroquia.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti cumque reiciendis, nemo explicabo fuga.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Visitar',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
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

class ObrasSocialesSection extends StatelessWidget {
  const ObrasSocialesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.count(
            crossAxisCount: size.width > 600 ? 1 : 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 15,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              SocialWorkCard(
                icon: Icons.school,
                title: 'Escuela Salesiana Domingo Sabio',
              ),
              SocialWorkCard(
                icon: Icons.local_hospital,
                title: 'Clínica Parroquial María Auxiliadora',
              ),
              SocialWorkCard(
                icon: Icons.restaurant,
                title: 'Comedor de Ancianos Mamá Margarita',
              ),
              SocialWorkCard(
                icon: Icons.church,
                title: 'Oratorio Festivo Domingo Sabio',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ParroquialServicesSection extends StatelessWidget {
  const ParroquialServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ServicesCard(
                  imageUrl: 'assets/img/offices.png',
                  title: 'Misas, Adoraciones Y confesiones',
                  description:
                      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquam facilis quos suscipit excepturi.',
                ),
                ServicesCard(
                  imageUrl: 'assets/img/offices.png',
                  title: 'Bautizos y Matrimonios',
                  description:
                      'Eaque odio cumque lorem ipsum dolor sit amet consectetur.',
                ),
                ServicesCard(
                  imageUrl: 'assets/img/offices.png',
                  title: 'Eventos Especiales',
                  description:
                      'Explicabo fuga velit, enim eaque et eum nesciunt dignissimos.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
