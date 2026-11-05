import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinta Inspirasi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1769E8)),
        fontFamily: 'Poppins',
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedTab = 0;

  static const _blue = Color(0xFF1769E8);
  static const _ink = Color(0xFF20232B);
  static const _muted = Color(0xFF747985);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 5, 16, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildAttendanceCard(),
                    const SizedBox(height: 16),
                    _buildQuickMenu(),
                    const SizedBox(height: 20),
                    _buildSectionHeading('Ringkasan Hari Ini', 'Lihat Semua'),
                    const SizedBox(height: 9),
                    _buildSummaryCards(),
                    const SizedBox(height: 13),
                    _buildRecentActivity(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 62,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            const Icon(Icons.menu, size: 22, color: Color(0xFF555A64)),
            const SizedBox(width: 15),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Pagi,',
                    style: TextStyle(fontSize: 11, color: _muted),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Adhi Puspito 👋',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: _ink,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 104,
              height: 60,
              child: Image.asset(
                'assets/images/buildingdashboard.png',
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
            const SizedBox(width: 9),
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.notifications_none, size: 24, color: _ink),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: _blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(13, 12, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: _blue.withValues(alpha: 0.8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFFEAF1FF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.access_time, size: 21, color: _blue),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Absensi Hari Ini',
                          style: TextStyle(fontSize: 9, color: _muted),
                        ),
                        const SizedBox(width: 7),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF9E9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'On-Time',
                            style: TextStyle(
                              fontSize: 7,
                              color: Color(0xFF40A83C),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      '09:02 WIB',
                      style: TextStyle(
                        color: _blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                      'Check-in',
                      style: TextStyle(fontSize: 9, color: _muted),
                    ),
                  ],
                ),
              ),
              Container(width: 1, height: 54, color: const Color(0xFFE2E5EC)),
              const SizedBox(width: 13),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF0F1F6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.login,
                        size: 19,
                        color: Color(0xFF8A8E98),
                      ),
                    ),
                    const SizedBox(width: 9),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          '–',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: _ink,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          'Check-out',
                          style: TextStyle(fontSize: 9, color: _muted),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 15, color: _blue),
              const SizedBox(width: 4),
              const Expanded(
                child: Text(
                  'Kantor Pusat - Purwokerto',
                  style: TextStyle(fontSize: 9, color: _ink),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: const Color(0xFFEEF3FF),
                  foregroundColor: _blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: const Row(
                  children: [
                    Text('Lihat Detail', style: TextStyle(fontSize: 8)),
                    SizedBox(width: 3),
                    Icon(Icons.chevron_right, size: 14),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickMenu() {
    const items = [
      _MenuItem('Absensi', 'assets/images/absen.png', Color(0xFFDCE8FF)),
      _MenuItem(
        'Tracking\nLokasi',
        'assets/images/lokasi.png',
        Color(0xFFD5F0DC),
      ),
      _MenuItem('Penggajian', 'assets/images/gajidash.png', Color(0xFFF2D8F3)),
      _MenuItem('Izin & Cuti', 'assets/images/ICDASH.png', Color(0xFFFFE7D7)),
      _MenuItem('Pengajuan', 'assets/images/ajuan.png', Color(0xFFD8F3F4)),
      _MenuItem('Karyawan', 'assets/images/karyadash.png', Color(0xFFF8DADA)),
      _MenuItem('Laporan', 'assets/images/laporan.png', Color(0xFFF3F0D8)),
      _MenuItem('Other', 'assets/images/other.png', Color(0xFFF1F1F1)),
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              'Menu Cepat',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: _ink,
              ),
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 82,
            ),
            itemBuilder: (context, index) => _QuickMenuTile(item: items[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeading(String title, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: _ink,
              ),
            ),
          ),
          Text(action, style: const TextStyle(fontSize: 10, color: _blue)),
        ],
      ),
    );
  }

  Widget _buildSummaryCards() {
    const summaries = [
      _Summary(
        '128',
        'Kehadiran',
        '8%',
        Color(0xFF18C653),
        Icons.person_add_alt_1,
      ),
      _Summary('5', 'Terlambat', '2%', Color(0xFFFFAD00), Icons.access_time),
      _Summary(
        '2',
        'Absent',
        '8%',
        Color(0xFFE53935),
        Icons.person_off_outlined,
      ),
      _Summary('18', 'WFH', '8%', Color(0xFF315CE5), Icons.home_work_outlined),
    ];

    return Row(
      children: [
        for (var index = 0; index < summaries.length; index++) ...[
          if (index > 0) const SizedBox(width: 6),
          Expanded(child: _SummaryCard(summary: summaries[index])),
        ],
      ],
    );
  }

  Widget _buildRecentActivity() {
    return Container(
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 11, 16, 4),
            child: Text(
              'Aktivitas Terbaru',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: _ink,
              ),
            ),
          ),
          const _ActivityRow(
            name: 'Ageng Saputro',
            detail: 'Check-in di Kantor Pusat',
            time: '09:12',
          ),
          const _ActivityRow(
            name: 'Bayu Eka Mulyono',
            detail: 'Check-in di Kantor Cabang',
            time: '09:14',
          ),
          const Divider(height: 1, color: Color(0xFFE7E8EC)),
          Center(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                minimumSize: const Size(0, 31),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                foregroundColor: _blue,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Lihat Semua Aktivitas', style: TextStyle(fontSize: 9)),
                  SizedBox(width: 2),
                  Icon(Icons.chevron_right, size: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    const tabs = [
      _NavItem('Beranda', Icons.home_filled),
      _NavItem('Absensi', Icons.access_time),
      _NavItem('Pengajuan', Icons.insert_drive_file_outlined),
      _NavItem('User Manage', Icons.settings_suggest_outlined),
      _NavItem('Profil', Icons.account_circle_outlined),
    ];

    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 4, 16, 12),
        padding: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF242A35).withValues(alpha: 0.1),
              blurRadius: 16,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            for (var index = 0; index < tabs.length; index++)
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => _selectedTab = index),
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          tabs[index].icon,
                          size: 21,
                          color: _selectedTab == index
                              ? _blue
                              : const Color(0xFF333640),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          tabs[index].label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 8,
                            color: _selectedTab == index ? _blue : _ink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.11),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}

class _MenuItem {
  const _MenuItem(this.label, this.asset, this.color);

  final String label;
  final String asset;
  final Color color;
}

class _QuickMenuTile extends StatelessWidget {
  const _QuickMenuTile({required this.item});

  final _MenuItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(top: 3),
            decoration: BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.16),
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                item.asset,
                width: 20,
                height: 20,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.apps, size: 19, color: Color(0xFF555A64)),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item.label,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 8,
              height: 1.15,
              color: Color(0xFF363941),
            ),
          ),
        ],
      ),
    );
  }
}

class _Summary {
  const _Summary(this.value, this.label, this.change, this.color, this.icon);

  final String value;
  final String label;
  final String change;
  final Color color;
  final IconData icon;
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.summary});

  final _Summary summary;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      padding: const EdgeInsets.fromLTRB(10, 10, 7, 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEDEEF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: summary.color.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: summary.color.withValues(alpha: 0.12),
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(summary.icon, size: 16, color: summary.color),
          ),
          const SizedBox(height: 6),
          Text(
            summary.value,
            style: TextStyle(
              fontSize: 16,
              height: 1,
              color: summary.color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            summary.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 8,
              color: _DashboardPageState._muted,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Icon(Icons.keyboard_arrow_up, size: 11, color: summary.color),
              Text(
                summary.change,
                style: TextStyle(fontSize: 7, color: summary.color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActivityRow extends StatelessWidget {
  const _ActivityRow({
    required this.name,
    required this.detail,
    required this.time,
  });

  final String name;
  final String detail;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: Color(0xFFDDF6E4),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              size: 18,
              color: Color(0xFF28C76F),
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: _DashboardPageState._ink,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  detail,
                  style: const TextStyle(
                    fontSize: 8,
                    color: _DashboardPageState._muted,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 8,
              color: _DashboardPageState._muted,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  const _NavItem(this.label, this.icon);

  final String label;
  final IconData icon;
}
