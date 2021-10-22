import 'package:test_apps/provider/profil_provider.dart';

class ModelProfil{
  String? uuid, mogawers_code, full_name, email, password, id_device, gender, profil_picture, edu;
  int? id_mogawers, birthdate, level, gawean_selesai, pending_payment, downline_count, balance, points;
  bool? termsAgreed, is_phone_active;

  ModelProfil(
      {this.uuid,
      this.mogawers_code,
      this.full_name,
      this.email,
      this.password,
      this.id_device,
      this.gender,
      this.profil_picture,
      this.edu,
      this.id_mogawers,
      this.birthdate,
      this.level,
      this.gawean_selesai,
      this.pending_payment,
      this.downline_count,
      this.balance,
      this.points,
      this.termsAgreed,
      this.is_phone_active});

  factory ModelProfil.fromJson(Map<String, dynamic> json) {

    return ModelProfil(
      uuid: json['uuid'],
      termsAgreed: json['termsAgreed'],
      id_device: json['id_device'],
      id_mogawers: json['id_mogawers'],
      full_name: json['full_name'],
      edu: json['edu'],
      email: json['email'],
      password: json['password'],
      profil_picture: json['profile_picture'],
      gawean_selesai: json['gawean_selesai'],
      gender: json['gender'],
      birthdate: json['birthdate'],
      level: json['level'],
      mogawers_code: json['mogawers_code'],
      downline_count: json['douwnline_count'],
      pending_payment: json['pending_payment'],
      is_phone_active: json['is_phone_active'],
      balance: json['balance'],
      points: json['points']
    );
  }


}