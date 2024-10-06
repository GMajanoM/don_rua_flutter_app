import 'package:donrua_app/features/shared/shared.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 4, vsync: this);

    const drawerIndex = 1;

    final size = MediaQuery.of(context).size;

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: getAppbar(size),
      drawer: const CustomDrawer(selectedIndex: drawerIndex, isLoggedIn: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BigImage(
              size: size,
              imageUrl: 'assets/img/offices.png',
              extras: [
                Column(
                  children: [
                    const SizedBox(height: 75),
                    const Text(
                      'Servicios Parroquiales',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Divider(color: colors.secondary, thickness: 5),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: ActivityCards(
                size: size,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            height: 100,
                            width: 250,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/img/ave-maria.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            height: 100,
                            width: 250,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/img/ave-maria.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            height: 100,
                            width: 250,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/img/ave-maria.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  Container(
                    constraints: BoxConstraints(maxHeight: size.height * 0.35),
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          controller: controller,
                          indicator: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: colors.primary,
                                width: 2,
                              ),
                            ),
                          ),
                          tabs: const [
                            Tab(child: Text('Misas')),
                            Tab(child: Text('Adoraciones')),
                            Tab(child: Text('Confesiones')),
                            Tab(child: Text('Contacto')),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.25,
                          child: TabBarView(
                            controller: controller,
                            children: [
                              Tab(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Horarios de misas',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'Cupidatat deserunt id exercitation nisi. Esse tempor nostrud in adipisicing magna nulla deserunt ea Lorem laboris enim elit.',
                                      ),
                                      const SizedBox(height: 8),
                                      FilledButton.icon(
                                        label: const Text('Agendar'),
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.calendar_month_rounded),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Tab(
                                child: Text('Adoraciones'),
                              ),
                              const Tab(
                                child: Text('Confesiones'),
                              ),
                              const Tab(
                                child: Text('Contacto'),
                              ),
                            ],
                          ),
                        ),
                      ],
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

enum SelectedActivity {
  masses,
  baptisms,
  firstCommunion,
  marriages,
  juvenileGroups,
  courts
}

class ActivityCards extends StatefulWidget {
  const ActivityCards({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<ActivityCards> createState() => _ActivityCardsState();
}

class _ActivityCardsState extends State<ActivityCards> {
  SelectedActivity selected = SelectedActivity.masses;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.15,
      width: widget.size.width * 0.95,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          ModuleCard(
            title: 'Misas, Adoraciones y Confesiones',
            imgUrl: 'assets/img/ave-maria.png',
            onTap: () {
              setState(() {
                selected = SelectedActivity.masses;
              });
            },
            isSelected: selected == SelectedActivity.masses,
          ),
          ModuleCard(
            title: 'Bautizos',
            imgUrl: 'assets/img/ave-maria.png',
            onTap: () {
              setState(() {
                selected = SelectedActivity.baptisms;
              });
            },
            isSelected: selected == SelectedActivity.baptisms,
          ),
          ModuleCard(
            title: 'Primeras comuniones y confirmaciones',
            imgUrl: 'assets/img/ave-maria.png',
            onTap: () {
              setState(() {
                selected = SelectedActivity.firstCommunion;
              });
            },
            isSelected: selected == SelectedActivity.firstCommunion,
          ),
          ModuleCard(
            title: 'Matrimonios y celebraciones',
            imgUrl: 'assets/img/ave-maria.png',
            onTap: () {
              setState(() {
                selected = SelectedActivity.marriages;
              });
            },
            isSelected: selected == SelectedActivity.marriages,
          ),
          ModuleCard(
            title: 'Grupos Juveniles',
            imgUrl: 'assets/img/ave-maria.png',
            onTap: () {
              setState(() {
                selected = SelectedActivity.juvenileGroups;
              });
            },
            isSelected: selected == SelectedActivity.juvenileGroups,
          ),
          ModuleCard(
            title: 'Canchas',
            imgUrl: 'assets/img/ave-maria.png',
            onTap: () {
              setState(() {
                selected = SelectedActivity.courts;
              });
            },
            isSelected: selected == SelectedActivity.courts,
          ),
        ],
      ),
    );
  }
}
