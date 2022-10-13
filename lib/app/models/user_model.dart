

class UserModel {
  final int id;
  final String name;
  final String email;
  //Total de figurinhas do album
  final int totalAlbum;
  //Total de figurinhas que eu tenho
  final int totalStickers;
  //Total de figurinhas duplicadas
  final int totalDuplicates;
  //Total de figurinhas que faltam para completar o album
  final int totalComplete;
  //Pocentagem de figurinhas que eu tenho
  final int totalCompletePercent;

  UserModel({required this.id, required this.name, required this.email, required this.totalAlbum, required this.totalStickers, required this.totalDuplicates, required this.totalComplete, required this.totalCompletePercent});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'totalAlbum': totalAlbum,
      'totalStickers': totalStickers,
      'totalDuplicates': totalDuplicates,
      'totalComplete': totalComplete,
      'totalCompletePercent': totalCompletePercent
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"] ?? 0,
      name: map['name'], 
      email: map['email'], 
      totalAlbum: map['total_album'], 
      totalStickers: map['total_stickers'], 
      totalDuplicates: map['total_duplicates'], 
      totalComplete: map['total_complete'], 
      totalCompletePercent: map['total_complete_percent']
      );
  }
}