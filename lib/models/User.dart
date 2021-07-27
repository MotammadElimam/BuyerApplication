// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
    User({
        this.id,
        this.email,
        this.confirmPassword,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.address,
        this.balance,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String email;
    dynamic confirmPassword;
    String firstName;
    String lastName;
    String phoneNumber;
    String address;
    String balance;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        confirmPassword: json["confirm_password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        address: json["Address"],
        balance: json["balance"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "confirm_password": confirmPassword,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "Address": address,
        "balance": balance,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
