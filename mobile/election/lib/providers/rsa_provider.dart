import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:election/constants/constants.dart';

class RSA {
  late BigInt decryptedSharedKey;
  Future<void> shareKeys() async {
    int p = generatePrime(2);
    int q = generatePrime(2);
    int n = p * q;
    int phiN = (p - 1) * (q - 1);
    int e = coPrime(phiN);
    int d = generatePrivateKey(e, phiN);

    try {
      final response = await http
          .post(Uri.parse('$hostUrl/shareKeys/'), body: {'e': e, 'n': n});
      final responseData = json.decode(response.body);
      final decryptedSharedKey = decoder(responseData['key'], d, n);
    } catch (e) {
      rethrow;
    }
  }

  bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i <= sqrt(n); i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  int generatePrime(int bits) {
    var rng = Random();
    int min = pow(2, bits - 1).toInt();
    int max = (pow(2, bits) - 1).toInt();
    int p = rng.nextInt(max - min) + min;
    while (!isPrime(p)) {
      p = rng.nextInt(max - min) + min;
    }
    return p;
  }

  int coPrime(int phiOfN) {
    int e = 2;
    while (true) {
      if (findGcd(e, phiOfN) == 1) {
        break;
      }
      e++;
    }
    return e;
  }

  int findGcd(int a, int b) {
    if (b == 0) {
      return a;
    } else {
      return findGcd(b, a % b);
    }
  }

  int generatePrivateKey(int e, int phiOfN) {
    int d = 2;
    while (true) {
      if ((d * e) % phiOfN == 1) {
        break;
      }
      d++;
    }
    return d;
  }

  String decoder(List<int> message, int d, int n) {
    List<int> decryptedText = [];
    for (var element in message) {
      decryptedText.add(decrypter(element, d, n));
    }
    return String.fromCharCodes(decryptedText);
  }

  int decrypter(int element, int d, int n) {
    return (pow(element, d) % n).toInt();
  }
}
