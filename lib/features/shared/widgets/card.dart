import 'package:flutter/material.dart';

class CustomCardCarousel extends StatefulWidget {
  final List<Map<String, dynamic>> cards;

  const CustomCardCarousel({
    super.key,
    required this.cards,
  });

  @override
  _CustomCardCarouselState createState() => _CustomCardCarouselState();
}

class _CustomCardCarouselState extends State<CustomCardCarousel> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                controller: _controller,
                itemCount: widget.cards.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  final card = widget.cards[index];
                  return CustomCard(
                    title: card['title'],
                    color: card['color'],
                    status: card['status'],
                    information: card['information'],
                    coversWidth: true,
                  );
                },
              ),
              Positioned(
                bottom: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton.filledTonal(
                      onPressed: _currentIndex > 0
                          ? () {
                              _controller.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          : null,
                      icon: Icon(
                        Icons.arrow_back,
                        color:
                            _currentIndex > 0 ? Colors.white : Colors.grey[400],
                      ),
                    ),
                    Row(
                      children: List.generate(widget.cards.length, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? widget.cards[index]['color']
                                : Colors.grey[300],
                          ),
                        );
                      }),
                    ),
                    IconButton.filledTonal(
                      onPressed: _currentIndex < widget.cards.length - 1
                          ? () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          : null,
                      icon: Icon(
                        Icons.arrow_forward,
                        color: _currentIndex < widget.cards.length - 1
                            ? Colors.white
                            : Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final Color color;
  final String status;
  final String information;
  final bool coversWidth;

  const CustomCard({
    super.key,
    required this.title,
    required this.color,
    required this.status,
    required this.information,
    required this.coversWidth,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.6,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: size.width * 0.3),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            information,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
