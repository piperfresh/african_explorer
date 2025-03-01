class CountryModel {
  CountryModel({
    required this.flags,
    required this.name,
    required this.capital,
    required this.languages,
  });

  final Flags? flags;
  final Name? name;
  final List<String> capital;
  final Languages? languages;

  factory CountryModel.fromJson(Map<String, dynamic> json){
    return CountryModel(
      flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      capital: json["capital"] == null ? [] : List<String>.from(json["capital"]!.map((x) => x)),
      languages: json["languages"] == null ? null : Languages.fromJson(json["languages"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "flags": flags?.toJson(),
    "name": name?.toJson(),
    "capital": capital.map((x) => x).toList(),
    "languages": languages?.toJson(),
  };

}

class Flags {
  Flags({
    required this.png,
    required this.svg,
    required this.alt,
  });

  final String? png;
  final String? svg;
  final String? alt;

  factory Flags.fromJson(Map<String, dynamic> json){
    return Flags(
      png: json["png"],
      svg: json["svg"],
      alt: json["alt"],
    );
  }

  Map<String, dynamic> toJson() => {
    "png": png,
    "svg": svg,
    "alt": alt,
  };

}

class Languages {
  Languages({
    required this.eng,
    required this.sot,
  });

  final String? eng;
  final String? sot;

  factory Languages.fromJson(Map<String, dynamic> json){
    return Languages(
      eng: json["eng"],
      sot: json["sot"],
    );
  }

  Map<String, dynamic> toJson() => {
    "eng": eng,
    "sot": sot,
  };

}

class Name {
  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  final String? common;
  final String? official;
  final NativeName? nativeName;

  factory Name.fromJson(Map<String, dynamic> json){
    return Name(
      common: json["common"],
      official: json["official"],
      nativeName: json["nativeName"] == null ? null : NativeName.fromJson(json["nativeName"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "common": common,
    "official": official,
    "nativeName": nativeName?.toJson(),
  };

}

class NativeName {
  NativeName({
    required this.eng,
    required this.sot,
  });

  final Eng? eng;
  final Eng? sot;

  factory NativeName.fromJson(Map<String, dynamic> json){
    return NativeName(
      eng: json["eng"] == null ? null : Eng.fromJson(json["eng"]),
      sot: json["sot"] == null ? null : Eng.fromJson(json["sot"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "eng": eng?.toJson(),
    "sot": sot?.toJson(),
  };

}

class Eng {
  Eng({
    required this.official,
    required this.common,
  });

  final String? official;
  final String? common;

  factory Eng.fromJson(Map<String, dynamic> json){
    return Eng(
      official: json["official"],
      common: json["common"],
    );
  }

  Map<String, dynamic> toJson() => {
    "official": official,
    "common": common,
  };

}





