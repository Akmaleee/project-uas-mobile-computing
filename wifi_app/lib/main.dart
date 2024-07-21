import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wi-Fi App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Wi-Fi Info'),
        ),
        body: Center(
          child: WifiInfoButton(),
        ),
      ),
    );
  }
}

class WifiInfoButton extends StatefulWidget {
  @override
  _WifiInfoButtonState createState() => _WifiInfoButtonState();
}

class _WifiInfoButtonState extends State<WifiInfoButton> {
  String _wifiInfo = 'Press the button to get Wi-Fi Info';

  Future<void> _getWifiInfo() async {
    final info = NetworkInfo();
    String? ssid;
    String? ip;
    String? bssid;

    try {
      ssid = await info.getWifiName(); // Nama SSID Wi-Fi
      ip = await info.getWifiIP();     // Alamat IP
      bssid = await info.getWifiBSSID(); // BSSID

      setState(() {
        _wifiInfo = 'SSID: $ssid\n'
            'IP Address: $ip\n'
            'BSSID: $bssid\n';
      });
    } catch (e) {
      setState(() {
        _wifiInfo = 'Failed to get Wi-Fi info: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _getWifiInfo,
          child: Text('Get Wi-Fi Info'),
        ),
        SizedBox(height: 20),
        Text(
          _wifiInfo,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
