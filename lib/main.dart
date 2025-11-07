import 'package:flutter/material.dart';

void main() {
  runApp(const TanshiuqRoot());
}

class TanshiuqRoot extends StatelessWidget {
  const TanshiuqRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return CartProvider(
      controller: CartController(),
      child: const TanshiuqApp(),
    );
  }
}

class CartController extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void add(int quantity) {
    if (quantity <= 0) return;
    _count += quantity;
    notifyListeners();
  }
}

class CartProvider extends InheritedNotifier<CartController> {
  const CartProvider({
    super.key,
    required CartController controller,
    required super.child,
  }) : super(notifier: controller);

  static CartController of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<CartProvider>();
    assert(provider != null, 'CartProvider not found in context');
    return provider!.notifier!;
  }
}

class TanshiuqApp extends StatelessWidget {
  const TanshiuqApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFFB88C4A);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tanshiuq Couture Jewellery',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seed,
          brightness: Brightness.dark,
        ).copyWith(
          surface: const Color(0xFF17151D),
          onSurface: Colors.white,
          primaryContainer: seed.withOpacity(0.25),
          onPrimaryContainer: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFF110F16),
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Serif',
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      home: const TanshiuqHome(),
    );
  }
}

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.images,
    required this.description,
    required this.highlights,
    required this.materials,
    required this.story,
  });

  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final int reviewCount;
  final List<String> images;
  final String description;
  final List<String> highlights;
  final Map<String, String> materials;
  final String story;
}

const _heroGradient = LinearGradient(
  colors: [Color(0xFF201825), Color(0xFF110F16)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const _accentGradient = LinearGradient(
  colors: [Color(0xFFB88C4A), Color(0xFFC8A86C)],
);

class TanshiuqHome extends StatelessWidget {
  const TanshiuqHome({super.key});

  static final List<Product> _curated = [
    const Product(
      id: 'aurora-tiara',
      name: 'Aurora Celestial Tiara',
      category: 'Signature Couture',
      price: 3899,
      rating: 4.9,
      reviewCount: 128,
      images: [
        'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?auto=format&fit=crop&w=1400&q=80',
        'https://images.unsplash.com/photo-1543294001-f7cd5d7fb516?auto=format&fit=crop&w=1400&q=80',
        'https://images.unsplash.com/photo-1519681393784-d120267933ba?auto=format&fit=crop&w=1400&q=80',
      ],
      description:
          'A regal symphony of hand-cut moonstones and diamonds, elevated with 18k rose gold filigree detailing.',
      highlights: [
        'Hand-set Aurora Blue moonstones',
        '18K recycled rose gold',
        'Invisible diamond pavé halo',
      ],
      materials: {
        'Metal': '18k Rose Gold (conflict-free)',
        'Gemstone': 'Aurora Moonstone & DEF Diamonds',
        'Artistry': '104 hours of handcrafting',
      },
      story:
          'Inspired by twilight over the Tanshiuq ateliers in Jaipur, the Aurora Celestial Tiara honours constellations that guide modern royalty. Each moonstone is precision set to mirror the gentle gradient of dusk.',
    ),
    const Product(
      id: 'nocturne-ears',
      name: 'Nocturne Cascade Earrings',
      category: 'Evening Muse',
      price: 1299,
      rating: 4.8,
      reviewCount: 86,
      images: [
        'https://images.unsplash.com/photo-1529933037704-7208bc65ed0d?auto=format&fit=crop&w=1200&q=80',
        'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=1200&q=80',
      ],
      description:
          'Asymmetric cascades of midnight sapphires and rare Tahitian pearls floating on whisper-fine chains.',
      highlights: [
        'Floating pearl illusion setting',
        'Hand-polished midnight sapphires',
        'Ultra-light titanium core',
      ],
      materials: {
        'Metal': '18k Blackened White Gold',
        'Gemstone': 'Tahitian Pearls & AAA Sapphires',
        'Length': '11.4 cm drop',
      },
      story:
          'The Nocturne Cascade celebrates the poetry of midnight galas. Hand-articulated links create a weightless motion that dances with every turn.',
    ),
  ];

  static final List<Map<String, String>> _collections = [
    {
      'title': 'Celestial Heirlooms',
      'subtitle': 'One-of-a-kind constellations',
      'image':
          'https://images.unsplash.com/photo-1541781286675-059aa460546f?auto=format&fit=crop&w=1200&q=80',
    },
    {
      'title': 'Modern Maharani',
      'subtitle': 'Seven-piece bridal curation',
      'image':
          'https://images.unsplash.com/photo-1542382209-5c2c43004c21?auto=format&fit=crop&w=1200&q=80',
    },
    {
      'title': 'Everyday Radiance',
      'subtitle': 'Effortless layering essentials',
      'image':
          'https://images.unsplash.com/photo-1530023367847-a683933f4175?auto=format&fit=crop&w=1200&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBody: true,
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: _heroGradient),
        child: CustomScrollView(
          slivers: [
            _buildHeroAppBar(context),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    _buildEditorialCard(colorScheme),
                    const SizedBox(height: 32),
                    _SectionHeading(
                      title: 'Atelier Highlights',
                      actionLabel: 'View all',
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 320,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(right: 24),
                        itemBuilder: (context, index) {
                          final product = _curated[index % _curated.length];
                          return _ProductCard(product: product);
                        },
                        separatorBuilder: (_, __) => const SizedBox(width: 20),
                        itemCount: _curated.length,
                      ),
                    ),
                    const SizedBox(height: 32),
                    _SectionHeading(
                      title: 'Signature Collections',
                      actionLabel: 'Explore',
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    _CollectionGrid(collections: _collections),
                    const SizedBox(height: 32),
                    _SectionHeading(
                      title: 'Concierge Moments',
                      actionLabel: 'Book now',
                      onTap: () {},
                    ),
                    const SizedBox(height: 18),
                    _ConciergeCard(colorScheme: colorScheme),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildHeroAppBar(BuildContext context) {
    final cart = CartProvider.of(context);
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      expandedHeight: 240,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            _NetImage(
              url:
                  'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?auto=format&fit=crop&w=1400&q=80',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.35),
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xFF110F16)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 96, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Tanshiuq',
                    style: TextStyle(
                      fontSize: 44,
                      letterSpacing: 6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Couture jewellery for luminous souls. Crafted in Jaipur, adored globally.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFE8D9C3),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _FrostedIconButton(
              icon: Icons.search,
              onTap: () {},
            ),
            const SizedBox(width: 12),
            Stack(
              clipBehavior: Clip.none,
              children: [
                _FrostedIconButton(
                  icon: Icons.shopping_bag_outlined,
                  onTap: () {},
                ),
                Positioned(
                  right: -2,
                  top: -2,
                  child: AnimatedBuilder(
                    animation: cart,
                    builder: (_, __) => cart.count == 0
                        ? const SizedBox.shrink()
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFB88C4A),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${cart.count}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
    );
  }

  Widget _buildEditorialCard(ColorScheme colorScheme) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFF282231), Color(0xFF16121D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
              child: _NetImage(
                url:
                    'https://images.unsplash.com/photo-1530023367847-a683933f4175?auto=format&fit=crop&w=900&q=80',
                width: 190,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.2),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'The Luminous Atelier',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Reserve a private craftsmanship tour with our master artisans and discover bespoke brilliance.',
                  style: TextStyle(
                    color: colorScheme.onSurface.withOpacity(0.74),
                    height: 1.4,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: _accentGradient,
                  ),
                  child: const Text(
                    'Schedule atelier experience',
                    style: TextStyle(
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.title,
    required this.actionLabel,
    required this.onTap,
  });

  final String title;
  final String actionLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                actionLabel,
                style: TextStyle(
                  color: colorScheme.primary,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.north_east,
                size: 16,
                color: colorScheme.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 900),
            pageBuilder: (_, animation, __) => FadeTransition(
              opacity: animation,
              child: ProductDetailPage(product: product),
            ),
          ),
        );
      },
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            colors: [Color(0xFF241E2C), Color(0xFF161219)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.36),
              blurRadius: 30,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'product_${product.id}',
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                child: AspectRatio(
                  aspectRatio: 4 / 5,
                  child: _NetImage(url: product.images.first, fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      product.category.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 11,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: colorScheme.primary,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${product.rating.toStringAsFixed(1)} · ${product.reviewCount} reviews',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '₹${product.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
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

class _CollectionGrid extends StatelessWidget {
  const _CollectionGrid({required this.collections});

  final List<Map<String, String>> collections;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 220,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
      ),
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final collection = collections[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.04)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              _NetImage(
                url: collection['image']!,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.25),
                colorBlendMode: BlendMode.darken,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xFF140F18)],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      collection['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      collection['subtitle']!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFFE9DCC9),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: _accentGradient,
                      ),
                      child: const Icon(
                        Icons.north_east,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ConciergeCard extends StatelessWidget {
  const _ConciergeCard({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Color(0xFF1E1922), Color(0xFF0F0C12)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: _accentGradient,
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Tanshiuq White Glove',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Personal stylists on your schedule',
                    style: TextStyle(fontSize: 12, color: Color(0xFFC8B59D)),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.keyboard_arrow_right_rounded,
                color: colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Create your bespoke jewel story with a master stylist via virtual salon or at the Tanshiuq Atelier lounge.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.68),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 14,
            runSpacing: 12,
            children: const [
              _TagChip(label: 'Virtual styling'),
              _TagChip(label: 'Try-on kits'),
              _TagChip(label: 'Heritage upgrades'),
              _TagChip(label: 'Worldwide delivery'),
            ],
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
        color: Colors.white.withOpacity(0.05),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, letterSpacing: 0.6),
      ),
    );
  }
}

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final PageController _galleryController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _galleryController.addListener(() {
      final page = _galleryController.page?.round();
      if (page != null && page != _currentPage) {
        setState(() => _currentPage = page);
      }
    });
  }

  @override
  void dispose() {
    _galleryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: _FrostedIconButton(
          icon: Icons.chevron_left,
          onTap: () => Navigator.of(context).pop(),
        ),
        actions: [
          _FrostedIconButton(
            icon: Icons.favorite_border,
            onTap: () {},
          ),
          const SizedBox(width: 12),
          _FrostedIconButton(
            icon: Icons.share,
            onTap: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B1520), Color(0xFF0F0D15)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              SizedBox(
                height: 360,
                child: PageView.builder(
                  controller: _galleryController,
                  itemCount: product.images.length,
                  itemBuilder: (context, index) {
                    final image = product.images[index];
                    return Hero(
                      tag: 'product_${product.id}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: _NetImage(
                          url: image,
                          fit: BoxFit.cover,
                          color: Colors.black.withOpacity(0.1),
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              _GalleryIndicator(count: product.images.length, index: _currentPage),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.category.toUpperCase(),
                                  style: TextStyle(
                                    letterSpacing: 1.5,
                                    fontSize: 12,
                                    color: colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '₹${product.price.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    size: 18,
                                    color: colorScheme.primary,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${product.rating.toStringAsFixed(1)} • ${product.reviewCount} reviews',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        product.description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.72),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        'Highlights',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Column(
                        children: product.highlights
                            .map(
                              (highlight) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 8,
                                      width: 8,
                                      margin: const EdgeInsets.only(top: 6),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: _accentGradient,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        highlight,
                                        style: TextStyle(
                                          height: 1.4,
                                          color: Colors.white.withOpacity(0.75),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 28),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white.withOpacity(0.08)),
                          color: Colors.white.withOpacity(0.02),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Materiality',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 14),
                            ...product.materials.entries.map(
                              (entry) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 38,
                                      height: 38,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: _accentGradient,
                                      ),
                                      child: const Icon(
                                        Icons.diamond,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            entry.key,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            entry.value,
                                            style: TextStyle(
                                              color: Colors.white.withOpacity(0.68),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        'Tanshiuq Muse Story',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        product.story,
                        style: TextStyle(
                          height: 1.5,
                          color: Colors.white.withOpacity(0.72),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(24, 18, 24, 32),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF161119), Color(0xFF0E0B12)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 24,
              offset: Offset(0, -12),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Colors.white.withOpacity(0.08)),
                  color: Colors.white.withOpacity(0.05),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Estimated Delivery',
                      style: TextStyle(fontSize: 11, letterSpacing: 0.6),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '5-7 days, insured shipping',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            _AddToCartButton(product: product),
          ],
        ),
      ),
    );
  }
}

class _GalleryIndicator extends StatelessWidget {
  const _GalleryIndicator({required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 4,
          width: i == index ? 40 : 18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: i == index ? _accentGradient : null,
            color: i == index
                ? null
                : Colors.white.withOpacity(0.25),
          ),
        ),
      ),
    );
  }
}

class _FrostedIconButton extends StatelessWidget {
  const _FrostedIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white.withOpacity(0.08),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Icon(icon, size: 20, color: Colors.white),
      ),
    );
  }
}

class _NetImage extends StatelessWidget {
  const _NetImage({
    required this.url,
    this.fit,
    this.color,
    this.colorBlendMode,
    this.width,
    this.height,
  });

  final String url;
  final BoxFit? fit;
  final Color? color;
  final BlendMode? colorBlendMode;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      color: color,
      colorBlendMode: colorBlendMode,
      width: width,
      height: height,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: const Color(0x11111111),
          alignment: Alignment.center,
          child: const SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: const Color(0x22111111),
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image_outlined, color: Colors.white54),
        );
      },
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = CartProvider.of(context);
    return GestureDetector(
      onTap: () {
        cart.add(1);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color(0xFF201A24),
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Color(0xFFB88C4A)),
                const SizedBox(width: 12),
                Expanded(child: Text('Added "${product.name}" to cart.')),
              ],
            ),
            action: SnackBarAction(
              label: 'VIEW',
              textColor: const Color(0xFFB88C4A),
              onPressed: () {},
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: _accentGradient,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFB88C4A).withOpacity(0.45),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
        child: Row(
          children: const [
            Icon(Icons.shopping_bag, color: Colors.black),
            SizedBox(width: 10),
            Text(
              'Add to Cart',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
