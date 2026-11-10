import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IoT Monitoring Dashboard',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
      ),
      home: const IotDashboardScreen(),
    );
  }
}

class IotDashboardScreen extends StatefulWidget {
  const IotDashboardScreen({super.key});

  @override
  State<IotDashboardScreen> createState() => _IotDashboardScreenState();
}

class _IotDashboardScreenState extends State<IotDashboardScreen> {
  bool isConnected = true;
  String brokerUrl = "broker.hivemq.com";
  String mqttTopic = "kampus/iot/kelas1/sensor";
  String lastUpdate = "10:15:30 WIB";
  
  double currentTemp = 30.5;
  double currentHumidity = 75.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.hub_rounded, color: Color(0xFF4F46E5), size: 24),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IoT Monitoring',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF0F172A),
                  ),
                ),
                Text(
                  'Dashboard Monitoring Sensor',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isConnected ? const Color(0xFFDCFCE7) : const Color(0xFFFEE2E2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: isConnected ? Colors.green.shade700 : Colors.red.shade700,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    isConnected ? 'Connected' : 'Disconnected',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isConnected ? const Color(0xFF15803D) : const Color(0xFFB91C1C),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. CARDS SENSOR
            Row(
              children: [
                // Card Suhu
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFF7ED), Color(0xFFFFEDD5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFEA580C)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.thermostat_rounded, color: Color(0xFFEA580C), size: 26),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Temperature',
                          style: TextStyle(fontSize: 13, color: Color(0xFF475569), fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$currentTemp°C',
                          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFEA580C)),
                        ),
                        const SizedBox(height: 6),
                        const Row(
                          children: [
                            Icon(Icons.sensors, size: 12, color: Color(0xFFEA580C)),
                            SizedBox(width: 4),
                            Text(
                              'Sensor DHT11',
                              style: TextStyle(fontSize: 11, color: Color(0xFFEA580C), fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Card Kelembapan
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFF0FDFA), Color(0xFFCCFBF1)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF0D9488)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.water_drop_rounded, color: Color(0xFF0D9488), size: 26),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Humidity',
                          style: TextStyle(fontSize: 13, color: Color(0xFF475569), fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${currentHumidity.toInt()}%',
                          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0D9488)),
                        ),
                        const SizedBox(height: 6),
                        const Row(
                          children: [
                            Icon(Icons.sensors, size: 12, color: Color(0xFF0D9488)),
                            SizedBox(width: 4),
                            Text(
                              'Sensor DHT11',
                              style: TextStyle(fontSize: 11, color: Color(0xFF0D9488), fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 2. KARTU MQTT CONNECTION
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.wifi_tethering_rounded, color: Color(0xFF4F46E5), size: 20),
                      SizedBox(width: 8),
                      Text('MQTT Connection', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.dns_outlined, size: 18, color: Color(0xFF64748B)),
                          SizedBox(width: 8),
                          Text('Broker', style: TextStyle(fontSize: 13, color: Color(0xFF64748B), fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Text(brokerUrl, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                    ],
                  ),
                  const Divider(height: 20, color: Color(0xFFF1F5F9)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.topic_outlined, size: 18, color: Color(0xFF64748B)),
                          SizedBox(width: 8),
                          Text('Topic', style: TextStyle(fontSize: 13, color: Color(0xFF64748B), fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Text(mqttTopic, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                    ],
                  ),
                  const Divider(height: 20, color: Color(0xFFF1F5F9)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.access_time_rounded, size: 18, color: Color(0xFF64748B)),
                          SizedBox(width: 8),
                          Text('Last Update', style: TextStyle(fontSize: 13, color: Color(0xFF64748B), fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Text(lastUpdate, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 3. MONITORING HISTORY
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Monitoring History', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                          SizedBox(height: 2),
                          Text('Temperature (°C) Over Time', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(color: const Color(0xFFEEF2FF), borderRadius: BorderRadius.circular(8)),
                        child: const Text('Dummy Data', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF4F46E5))),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: CustomPaint(painter: ColorfulWavePainter()),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(12)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Waktu', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF475569))),
                        Text('Suhu (°C)', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFEA580C))),
                        Text('Kelembapan (%)', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0D9488))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("10:00", style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF334155))),
                        Text("28.0 °C", style: TextStyle(color: Color(0xFFEA580C), fontWeight: FontWeight.bold)),
                        Text("70 %", style: TextStyle(color: Color(0xFF0D9488), fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("10:05", style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF334155))),
                        Text("29.0 °C", style: TextStyle(color: Color(0xFFEA580C), fontWeight: FontWeight.bold)),
                        Text("72 %", style: TextStyle(color: Color(0xFF0D9488), fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("10:10", style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF334155))),
                        Text("28.5 °C", style: TextStyle(color: Color(0xFFEA580C), fontWeight: FontWeight.bold)),
                        Text("74 %", style: TextStyle(color: Color(0xFF0D9488), fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("10:15", style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF334155))),
                        Text("30.5 °C", style: TextStyle(color: Color(0xFFEA580C), fontWeight: FontWeight.bold)),
                        Text("75 %", style: TextStyle(color: Color(0xFF0D9488), fontWeight: FontWeight.bold)),
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

class ColorfulWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = const Color(0xFF4F46E5)
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final paintFill = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF4F46E5).withOpacity(0.2),
          const Color(0xFF4F46E5).withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final paintGrid = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..strokeWidth = 1;

    canvas.drawLine(Offset(0, size.height * 0.25), Offset(size.width, size.height * 0.25), paintGrid);
    canvas.drawLine(Offset(0, size.height * 0.65), Offset(size.width, size.height * 0.65), paintGrid);

    final path = Path();
    final points = [
      Offset(size.width * 0.05, size.height * 0.8),
      Offset(size.width * 0.35, size.height * 0.4),
      Offset(size.width * 0.65, size.height * 0.6),
      Offset(size.width * 0.95, size.height * 0.2),
    ];

    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 0; i < points.length - 1; i++) {
      final p1 = points[i];
      final p2 = points[i + 1];
      final controlPoint1 = Offset(p1.dx + (p2.dx - p1.dx) / 2, p1.dy);
      final controlPoint2 = Offset(p1.dx + (p2.dx - p1.dx) / 2, p2.dy);
      path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy, p2.dx, p2.dy);
    }

    final fillPath = Path.from(path)
      ..lineTo(points.last.dx, size.height)
      ..lineTo(points.first.dx, size.height)
      ..close();

    canvas.drawPath(fillPath, paintFill);
    canvas.drawPath(path, paintLine);

    final paintNode = Paint()
      ..color = const Color(0xFF4F46E5)
      ..style = PaintingStyle.fill;

    final paintWhiteInner = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (var point in points) {
      canvas.drawCircle(point, 6, paintNode);
      canvas.drawCircle(point, 3, paintWhiteInner);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}