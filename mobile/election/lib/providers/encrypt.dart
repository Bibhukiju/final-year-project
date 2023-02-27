import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:election/constants/constants.dart';

class Encrypt {
  // String encryptTheVote(String stringifiedVote, int encryptionKey, int n) {
  //   // Encodes the string to integer first
  //   final encodedVote = BigInt.from(99);
  //   //encoder('hello asodadasd');
  //   print('encodeVote => $encodedVote');
  //   // Encodes vote
  //   // Equivalents to pow(encodedVote, encryptionKey) mod n
  //   final encryptedVote =
  //       encodedVote.modPow(BigInt.from(encryptionKey), BigInt.from(n));
  //   final encrVote = encodedVote.modPow(
  //       BigInt.parse(encryptionKey.toString()), BigInt.parse(n.toString()));
  //   final enVote = encodedVote.pow(encryptionKey) % BigInt.parse(n.toString());
  //   print(' encry[p => $encryptedVote, $encrVote, $enVote');

  //   //final decrypt = encryptedVote.modPow(BigInt.from(3577), BigInt.from(7913));
  //   final dcVote = encryptedVote.pow(587) % BigInt.parse(n.toString());
  //   print('decrypt: $dcVote');

  //   return encryptedVote.toString();
  // }

  /// Converts Plain Text to the Integer using ASCII value
  /// Ex: '~H~E~L~L~O!~ (PT) => 126072126069126076126076126079126
  // BigInt encoder(String stringifiedVote) {
  //   String initString = '';
  //   for (var i = 0; i < stringifiedVote.length; i++) {
  //     final asciiCode = stringifiedVote.codeUnitAt(i);
  //     if (asciiCode.toString().length < 3) {
  //       initString = initString + makeStringThreeDigit(asciiCode);
  //       continue;
  //     }
  //     initString = initString + asciiCode.toString();
  //   }
  //   return BigInt.parse(initString);
  // }

  // to encrypt the given number
  dynamic encrypt(int message, int e, int n) {
    final encrpytedText = pow(message, e) % n;
    print('encrypted text: $encrpytedText');
    return encrpytedText;
  }

// first converting each character to its ASCII value and
// then encoding it then decoding the number to get the
// ASCII and converting it to character
  List<int> encoders(String message, int e, int n) {
    List<int> form = [];
    // calling the encrypting function in encoding function
    for (var i = 0; i < message.length; i++) {
      if (checkCharIsNumberOrNot(message[i])) {
        //console.log("number is detected in the string");
        form.add(encrypt(int.parse(message[i]), e, n));
      } else {
        form.add(encrypt(message[i].codeUnitAt(0), e, n));
      }
    }
    return form;
  }

  bool checkCharIsNumberOrNot(String message) {
    const numberArray = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    final noOfNumbers =
        numberArray.where((element) => element == message).toList();
    return noOfNumbers.isNotEmpty ? true : false;
  }

  /// Makes integer three digit by padding 0 to the left
  /// Ex: 1 => 001, 23 => 023, 453 => 453
  // String makeStringThreeDigit(int i) {
  //   return i.toString().padLeft(3, '0');
  // }

  Future<Map<String, dynamic>> assignPublicKey() async {
    print('assigns public key');
    try {
      final response = await http.get(
        Uri.parse('$hostUrl/publickey'),
      );
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      print(response.body);
      return {
        'e': responseData['message']['e'],
        'n': responseData['message']['n']
      };
    } catch (e) {
      throw Exception();
    }
  }
}
