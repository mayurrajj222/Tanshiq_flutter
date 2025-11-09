import 'package:flutter/material.dart';

void main() {
  runApp(const TanishqApp());
}

class TanishqApp extends StatelessWidget {
  const TanishqApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF8D493A);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tanishq',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Georgia',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _heroController = PageController();
  int _heroIndex = 0;
  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
    _heroController.addListener(() {
      final page = _heroController.page?.round();
      if (page != null && page != _heroIndex) {
        setState(() => _heroIndex = page);
      }
    });
  }

  @override
  void dispose() {
    _heroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const _SideDrawer(),
      body: IndexedStack(
        index: _currentTab,
        children: [
          _buildHomeTab(context),
          _buildJewPlansTab(context),
          _buildDigiGoldTab(context),
          _buildCategoriesTab(context),
          _buildGiftingTab(context),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF8D493A),
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: _currentTab,
        onTap: (index) => setState(() => _currentTab = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.diamond_outlined), label: 'Jew Plans'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: 'Digi Gold'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Gifting'),
        ],
      ),
    );
  }

  Widget _buildHomeTab(BuildContext context) {
    return SafeArea(
      key: const ValueKey('home-tab'),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Builder(
                        builder: (ctx) => _IconCircle(
                          icon: Icons.menu,
                          onTap: () => Scaffold.of(ctx).openDrawer(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Tanishq',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                        ),
                      ),
                      _IconCircle(icon: Icons.notifications_none, onTap: () {}),
                      const SizedBox(width: 8),
                      _IconCircle(icon: Icons.favorite_border, onTap: () {}),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.brown.shade100),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey.shade600),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Search for jewellery on Tanishq',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Icon(Icons.camera_alt_outlined, color: Colors.grey.shade600),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      _IconCircle(icon: Icons.shopping_bag_outlined, onTap: () {}),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 220,
                  child: PageView(
                    controller: _heroController,
                    children: const [
                      _HeroCard(
                        image: 'images/1tg.png',
                        title: 'Tanishq presents\nFloral Bloom',
                        subtitle: 'SHOP NOW',
                      ),
                      _HeroCard(
                        image: 'images/2tg.png',
                        title: 'Explore Our Gold\nBestsellers',
                        subtitle: 'EXPLORE',
                      ),
                      _HeroCard(
                        image: 'images/3tg.png',
                        title: 'Celebrate Every\nFestive Moment',
                        subtitle: 'SHOP NOW',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                _Dots(current: _heroIndex, total: 3),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2E9DD),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.login, color: Color(0xFF8D493A)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Login to get exclusive deals & offers',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.close, color: Color(0xFF8D493A)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 120,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      _CategoryCard(title: 'Festive', image: 'images/1tg.png'),
                      _CategoryCard(title: 'Earrings', image: 'images/2tg.png'),
                      _CategoryCard(title: 'Pendants', image: 'images/3tg.png'),
                      _CategoryCard(title: 'Gold Coin', image: 'images/1tg.png'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stunning Every Ear',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Look at our brand new earring collection just for you',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: const [
                      Expanded(
                        child: _HighlightTile(
                          title: 'Earrings',
                          image: 'images/2tg.png',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _HighlightTile(
                          title: 'Rings',
                          image: 'images/3tg.png',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Recommended For You',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 220,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    children: [
                      _ProductTile(
                        image: 'images/1tg.png',
                        title: 'Round Gold Jali Work Stud Earrings',
                        price: '₹12 399',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const ProductDetailPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 12),
                      const _ProductTile(
                        image: 'images/2tg.png',
                        title: 'Florid Filigree Stud Earrings',
                        price: '₹11 899',
                      ),
                      const SizedBox(width: 12),
                      const _ProductTile(
                        image: 'images/3tg.png',
                        title: 'Rosette Bloom Stud Earrings',
                        price: '₹13 199',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 220,
            right: 0,
            child: _LiveChatPill(),
          ),
        ],
      ),
    );
  }

  Widget _buildJewPlansTab(BuildContext context) {
    final plans = [
      {
        'title': 'Golden Harvest Plan',
        'description': 'Save a little every month and redeem the full value in handcrafted jewellery of your choice.',
        'highlights': [
          'Start with just ₹3 000/month',
          'Flexible tenure from 6 to 36 months',
          'Get up to 75% of your 12th installment as a loyalty bonus'
        ],
      },
      {
        'title': 'Anuttara Gold Savings',
        'description': 'Grow your gold portfolio with assured purity and transparent savings.',
        'highlights': [
          'Pure 22KT BIS-hallmarked gold every time',
          'Pause or top-up payments without penalties',
          'Dedicated jewellery consultant on maturity'
        ],
      },
    ];

    return SafeArea(
      key: const ValueKey('plans-tab'),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
        children: [
          Text(
            'Plan Your Dream Jewellery',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            'Choose a gold savings plan that keeps every celebration covered.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
          ),
          const SizedBox(height: 24),
          for (final plan in plans)
            _buildInfoCard(
              context: context,
              title: plan['title']! as String,
              description: plan['description']! as String,
              highlights: List<String>.from(plan['highlights']! as List),
              icon: Icons.savings_outlined,
            ),
          _buildInfoCard(
            context: context,
            title: 'Smart Gold SIP',
            description: 'Automate your monthly investment in 24KT digital gold and convert to jewellery anytime.',
            highlights: const [
              'Start with ₹1 000 SIP',
              'Live gold rate locking',
              'Instant redemption for store or online purchases'
            ],
            icon: Icons.timeline_outlined,
            badge: 'Trending',
          ),
        ],
      ),
    );
  }

  Widget _buildDigiGoldTab(BuildContext context) {
    return SafeArea(
      key: const ValueKey('digi-tab'),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
        children: [
          Text(
            'Digi Gold by Tanishq',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            'Buy, store and sell certified 24KT gold instantly at live market rates.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
          ),
          const SizedBox(height: 24),
          _buildInfoCard(
            context: context,
            title: 'Live Tracking Dashboard',
            description: 'Monitor your digital gold weight and average cost in real time with smart alerts.',
            highlights: const [
              'Track Gram-wise growth',
              'Set price alerts for instant action',
              'Download investment statements'
            ],
            icon: Icons.show_chart,
          ),
          _buildInfoCard(
            context: context,
            title: 'Convert To Jewellery',
            description: 'Exchange your Digi Gold balance for any design online or across 350+ stores.',
            highlights: const [
              'Zero conversion charges',
              'Exclusive digi-to-jewel offers',
              'Doorstep delivery with insurance'
            ],
            icon: Icons.swap_horiz,
          ),
          _buildInfoCard(
            context: context,
            title: 'Secure Locker',
            description: 'Your gold is stored in insured vaults with daily audits and BIS certification.',
            highlights: const [
              'Free insured storage',
              'Sell back anytime at live rate',
              '100% RBI compliant trusteeship'
            ],
            icon: Icons.lock_outline,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesTab(BuildContext context) {
    final categories = [
      {'title': 'Necklaces', 'image': 'images/1tg.png'},
      {'title': 'Bangles', 'image': 'images/2tg.png'},
      {'title': 'Bracelets', 'image': 'images/3tg.png'},
      {'title': 'Mangalsutras', 'image': 'images/1tg.png'},
      {'title': 'Gold Coins', 'image': 'images/2tg.png'},
      {'title': 'Kids Collection', 'image': 'images/3tg.png'},
    ];
    final width = MediaQuery.of(context).size.width;
    final cardWidth = (width - 16 * 2 - 12) / 2;

    return SafeArea(
      key: const ValueKey('categories-tab'),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
        children: [
          Text(
            'Shop By Category',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            'Discover handcrafted gold designs curated for every milestone.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: categories
                .map(
                  (category) => SizedBox(
                    width: cardWidth,
                    child: _CategoryPoster(
                      title: category['title']! as String,
                      image: category['image']! as String,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftingTab(BuildContext context) {
    final giftingIdeas = [
      {
        'title': 'Wedding Radiance Hampers',
        'description': 'Curated bridal jewellery boxes with matching hair ornaments, bangles and gift vouchers.',
        'highlights': [
          'Select from Rose, Heritage & Minimal trousseaus',
          'Include a personalised message card',
          'Free doorstep delivery in premium packaging'
        ],
      },
      {
        'title': 'Festive Gold Coins',
        'description': 'Bless your loved ones with auspicious coins crafted in 24KT gold and embossed motifs.',
        'highlights': [
          'Available in 1g to 50g denominations',
          'Custom engraving available',
          'Complimentary velvet keepsake box'
        ],
      },
      {
        'title': 'Corporate Gratitude Sets',
        'description': 'Choose from signature gold-plated pens, bookmarks and desk accents for milestone celebrations.',
        'highlights': [
          'Bulk pricing with personalisation',
          'Dedicated gifting concierge',
          'Ships within 5 working days'
        ],
      },
    ];

    return SafeArea(
      key: const ValueKey('gifting-tab'),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
        children: [
          Text(
            'Tanishq Gifting Studio',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            'Thoughtful gold gifts that celebrate every milestone, big or small.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
          ),
          const SizedBox(height: 24),
          for (final idea in giftingIdeas)
            _buildInfoCard(
              context: context,
              title: idea['title']! as String,
              description: idea['description']! as String,
              highlights: List<String>.from(idea['highlights']! as List),
              icon: Icons.card_giftcard,
            ),
          _buildInfoCard(
            context: context,
            title: 'Virtual Gifting Appointment',
            description: 'Book a stylist-assisted video call to curate surprise jewellery hampers with live try-ons.',
            highlights: const [
              'Schedule within 2 hours',
              'Coordinate group gifting effortlessly',
              'Global delivery with insurance'
            ],
            icon: Icons.support_agent,
            badge: 'Concierge',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required BuildContext context,
    required String title,
    required String description,
    required List<String> highlights,
    IconData icon = Icons.diamond_outlined,
    String? badge,
  }) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F4EE),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.brown.shade100),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  color: Color(0xFF8D493A),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        if (badge != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFD8C7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              badge!,
                              style: theme.textTheme.labelSmall?.copyWith(
                                    color: const Color(0xFF8D493A),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700, height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          for (final highlight in highlights)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.circle, size: 8, color: Color(0xFF8D493A)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      highlight,
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade800, height: 1.4),
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

class _IconCircle extends StatelessWidget {
  const _IconCircle({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.brown.shade100),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
          ],
        ),
        child: Icon(icon, color: Colors.grey.shade700, size: 20),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.image, required this.title, required this.subtitle});

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.15), Colors.black.withOpacity(0.55)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: const Color(0xFF8D493A), letterSpacing: 1.2),
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

class _Dots extends StatelessWidget {
  const _Dots({required this.current, required this.total});

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        total,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == current ? const Color(0xFF8D493A) : const Color(0xFFD7C3B3),
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.brown.shade100),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600, color: Colors.grey.shade800),
            ),
          ),
        ],
      ),
    );
  }
}

class _HighlightTile extends StatelessWidget {
  const _HighlightTile({required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(image, fit: BoxFit.cover, height: 160),
          Container(
            height: 160,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.55)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.image, required this.title, required this.price, this.onTap});

  final String image;
  final String title;
  final String price;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.brown.shade100),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
              child: Image.asset(image, height: 110, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    price,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: const Color(0xFF8D493A), fontWeight: FontWeight.w700),
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

class _LiveChatPill extends StatelessWidget {
  const _LiveChatPill();

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          color: Color(0xFF8D493A),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: Text(
          'Live Chat',
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 1.1),
        ),
      ),
    );
  }
}

class _SideDrawer extends StatelessWidget {
  const _SideDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
                ],
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFF8D493A),
                    radius: 24,
                    child: Text(
                      'Hi',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Guest!',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: const Color(0xFF8D493A), fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7EEE4),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey.shade700),
                        ),
                        Text(
                          '₹500 off',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: const Color(0xFF8D493A), fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'on your first order',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              color: Color(0xFF8D493A),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 24),
                children: const [
                  _DrawerTile(title: 'My Profile', badge: 'New'),
                  _DrawerTile(title: 'Order History'),
                  _DrawerSection(title: 'Shop By'),
                  _DrawerTile(title: 'All Jewellery'),
                  _DrawerTile(title: 'Metal'),
                  _DrawerTile(title: 'Collections'),
                  _DrawerSection(title: 'Shop For'),
                  _DrawerTile(title: 'Men'),
                  _DrawerTile(title: 'Kids'),
                  _DrawerTile(title: 'Jewellery Plans'),
                  _DrawerTile(title: 'Gift Card'),
                  _DrawerTile(title: 'Gold Rate'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({required this.title, this.badge});

  final String title;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F4EE),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.brown.shade100),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.grey.shade800, fontWeight: FontWeight.w500),
                    ),
                  ),
                  if (badge != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFD8C7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        badge!,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: const Color(0xFF8D493A), fontWeight: FontWeight.w600),
                      ),
                    ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade500),
          ],
        ),
      ),
    );
  }
}

class _DrawerSection extends StatelessWidget {
  const _DrawerSection({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: const Color(0xFF8D493A), fontWeight: FontWeight.w600, letterSpacing: 0.8),
      ),
    );
  }
}

class _CategoryPoster extends StatelessWidget {
  const _CategoryPoster({required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: 4 / 5,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final PageController _galleryController = PageController();
  int _page = 0;

  final List<String> _images = const ['images/1tg.png', 'images/2tg.png', 'images/3tg.png'];

  @override
  void initState() {
    super.initState();
    _galleryController.addListener(() {
      final next = _galleryController.page?.round();
      if (next != null && next != _page) {
        setState(() => _page = next);
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 320,
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: _galleryController,
                          itemCount: _images.length,
                          itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(28),
                              child: Image.asset(_images[index], fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: _Dots(current: _page, total: _images.length),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 72,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        final selected = index == _page;
                        return GestureDetector(
                          onTap: () => _galleryController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                          child: Container(
                            width: 70,
                            margin: EdgeInsets.only(right: index == _images.length - 1 ? 0 : 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: selected ? const Color(0xFF8D493A) : Colors.grey.shade300,
                                width: selected ? 2 : 1,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(_images[index], fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Round Gold Jali Work Stud Earrings',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'SKU ID : 501720SKIAAA002JA002278',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey.shade600, letterSpacing: 0.6),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text(
                              '₹ 12 399',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w700, color: const Color(0xFF8D493A)),
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Price Breakup',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: const Color(0xFF8D493A), fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _ActionChip(onTap: () {}, label: 'View Similar', icon: Icons.filter_none),
                            _ActionChip(onTap: () {}, label: 'Try It On', icon: Icons.camera_alt_outlined),
                            _IconCircle(icon: Icons.share, onTap: () {}),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Divider(),
                        const SizedBox(height: 24),
                        Text(
                          'Product Description',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Finely crafted round stud earrings with intricate jali work that adds elegance to your festive look.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey.shade700, height: 1.5),
                        ),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8D493A),
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          ),
          onPressed: () {},
          child: const Text(
            'Add To Cart',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  const _ActionChip({required this.onTap, required this.label, required this.icon});

  final VoidCallback onTap;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: const Color(0xFF8D493A)),
            const SizedBox(width: 8),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: const Color(0xFF8D493A), fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}