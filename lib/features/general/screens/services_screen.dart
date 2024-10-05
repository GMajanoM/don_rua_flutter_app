import 'package:donrua_app/features/shared/shared.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
