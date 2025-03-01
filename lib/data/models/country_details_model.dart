class CountryDetailsModel {
  CountryDetailsModel({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.borders,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.gini,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
  });

  final Name? name;
  final List<String> tld;
  final String? cca2;
  final String? ccn3;
  final String? cca3;
  final String? cioc;
  final bool? independent;
  final String? status;
  final bool? unMember;
  final Currencies? currencies;
  final Idd? idd;
  final List<String> capital;
  final List<String> altSpellings;
  final String? region;
  final String? subregion;
  final Languages? languages;
  final Map<String, Translation> translations;
  final List<double> latlng;
  final bool? landlocked;
  final List<String> borders;
  final num? area;
  final Demonyms? demonyms;
  final String? flag;
  final Maps? maps;
  final num? population;
  final Gini? gini;
  final String? fifa;
  final Car? car;
  final List<String> timezones;
  final List<String> continents;
  final Flags? flags;
  final CoatOfArms? coatOfArms;
  final String? startOfWeek;
  final CapitalInfo? capitalInfo;
  final PostalCode? postalCode;

  factory CountryDetailsModel.fromJson(Map<String, dynamic> json){
    return CountryDetailsModel(
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      tld: json["tld"] == null ? [] : List<String>.from(json["tld"]!.map((x) => x)),
      cca2: json["cca2"],
      ccn3: json["ccn3"],
      cca3: json["cca3"],
      cioc: json["cioc"],
      independent: json["independent"],
      status: json["status"],
      unMember: json["unMember"],
      currencies: json["currencies"] == null ? null : Currencies.fromJson(json["currencies"]),
      idd: json["idd"] == null ? null : Idd.fromJson(json["idd"]),
      capital: json["capital"] == null ? [] : List<String>.from(json["capital"]!.map((x) => x)),
      altSpellings: json["altSpellings"] == null ? [] : List<String>.from(json["altSpellings"]!.map((x) => x)),
      region: json["region"],
      subregion: json["subregion"],
      languages: json["languages"] == null ? null : Languages.fromJson(json["languages"]),
      translations: Map.from(json["translations"]).map((k, v) => MapEntry<String, Translation>(k, Translation.fromJson(v))),
      latlng: json["latlng"] == null ? [] : List<double>.from(json["latlng"]!.map((x) => x)),
      landlocked: json["landlocked"],
      borders: json["borders"] == null ? [] : List<String>.from(json["borders"]!.map((x) => x)),
      area: json["area"],
      demonyms: json["demonyms"] == null ? null : Demonyms.fromJson(json["demonyms"]),
      flag: json["flag"],
      maps: json["maps"] == null ? null : Maps.fromJson(json["maps"]),
      population: json["population"],
      gini: json["gini"] == null ? null : Gini.fromJson(json["gini"]),
      fifa: json["fifa"],
      car: json["car"] == null ? null : Car.fromJson(json["car"]),
      timezones: json["timezones"] == null ? [] : List<String>.from(json["timezones"]!.map((x) => x)),
      continents: json["continents"] == null ? [] : List<String>.from(json["continents"]!.map((x) => x)),
      flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
      coatOfArms: json["coatOfArms"] == null ? null : CoatOfArms.fromJson(json["coatOfArms"]),
      startOfWeek: json["startOfWeek"],
      capitalInfo: json["capitalInfo"] == null ? null : CapitalInfo.fromJson(json["capitalInfo"]),
      postalCode: json["postalCode"] == null ? null : PostalCode.fromJson(json["postalCode"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name?.toJson(),
    "tld": tld.map((x) => x).toList(),
    "cca2": cca2,
    "ccn3": ccn3,
    "cca3": cca3,
    "cioc": cioc,
    "independent": independent,
    "status": status,
    "unMember": unMember,
    "currencies": currencies?.toJson(),
    "idd": idd?.toJson(),
    "capital": capital.map((x) => x).toList(),
    "altSpellings": altSpellings.map((x) => x).toList(),
    "region": region,
    "subregion": subregion,
    "languages": languages?.toJson(),
    "translations": Map.from(translations).map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
    "latlng": latlng.map((x) => x).toList(),
    "landlocked": landlocked,
    "borders": borders.map((x) => x).toList(),
    "area": area,
    "demonyms": demonyms?.toJson(),
    "flag": flag,
    "maps": maps?.toJson(),
    "population": population,
    "gini": gini?.toJson(),
    "fifa": fifa,
    "car": car?.toJson(),
    "timezones": timezones.map((x) => x).toList(),
    "continents": continents.map((x) => x).toList(),
    "flags": flags?.toJson(),
    "coatOfArms": coatOfArms?.toJson(),
    "startOfWeek": startOfWeek,
    "capitalInfo": capitalInfo?.toJson(),
    "postalCode": postalCode?.toJson(),
  };

}

class CapitalInfo {
  CapitalInfo({
    required this.latlng,
  });

  final List<double> latlng;

  factory CapitalInfo.fromJson(Map<String, dynamic> json){
    return CapitalInfo(
      latlng: json["latlng"] == null ? [] : List<double>.from(json["latlng"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "latlng": latlng.map((x) => x).toList(),
  };

}

class Car {
  Car({
    required this.signs,
    required this.side,
  });

  final List<String> signs;
  final String? side;

  factory Car.fromJson(Map<String, dynamic> json){
    return Car(
      signs: json["signs"] == null ? [] : List<String>.from(json["signs"]!.map((x) => x)),
      side: json["side"],
    );
  }

  Map<String, dynamic> toJson() => {
    "signs": signs.map((x) => x).toList(),
    "side": side,
  };

}

class CoatOfArms {
  CoatOfArms({
    required this.png,
    required this.svg,
  });

  final String? png;
  final String? svg;

  factory CoatOfArms.fromJson(Map<String, dynamic> json){
    return CoatOfArms(
      png: json["png"],
      svg: json["svg"],
    );
  }

  Map<String, dynamic> toJson() => {
    "png": png,
    "svg": svg,
  };

}

class Currencies {
  Currencies({
    required this.lsl,
    required this.zar,
  });

  final Lsl? lsl;
  final Lsl? zar;

  factory Currencies.fromJson(Map<String, dynamic> json){
    return Currencies(
      lsl: json["LSL"] == null ? null : Lsl.fromJson(json["LSL"]),
      zar: json["ZAR"] == null ? null : Lsl.fromJson(json["ZAR"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "LSL": lsl?.toJson(),
    "ZAR": zar?.toJson(),
  };

}

class Lsl {
  Lsl({
    required this.name,
    required this.symbol,
  });

  final String? name;
  final String? symbol;

  factory Lsl.fromJson(Map<String, dynamic> json){
    return Lsl(
      name: json["name"],
      symbol: json["symbol"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "symbol": symbol,
  };

}

class Demonyms {
  Demonyms({
    required this.eng,
    required this.fra,
  });

  final Eng? eng;
  final Eng? fra;

  factory Demonyms.fromJson(Map<String, dynamic> json){
    return Demonyms(
      eng: json["eng"] == null ? null : Eng.fromJson(json["eng"]),
      fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "eng": eng?.toJson(),
    "fra": fra?.toJson(),
  };

}

class Eng {
  Eng({
    required this.f,
    required this.m,
  });

  final String? f;
  final String? m;

  factory Eng.fromJson(Map<String, dynamic> json){
    return Eng(
      f: json["f"],
      m: json["m"],
    );
  }

  Map<String, dynamic> toJson() => {
    "f": f,
    "m": m,
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

class Gini {
  Gini({
    required this.the2017,
  });

  final double? the2017;

  factory Gini.fromJson(Map<String, dynamic> json){
    return Gini(
      the2017: json["2017"],
    );
  }

  Map<String, dynamic> toJson() => {
    "2017": the2017,
  };

}

class Idd {
  Idd({
    required this.root,
    required this.suffixes,
  });

  final String? root;
  final List<String> suffixes;

  factory Idd.fromJson(Map<String, dynamic> json){
    return Idd(
      root: json["root"],
      suffixes: json["suffixes"] == null ? [] : List<String>.from(json["suffixes"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "root": root,
    "suffixes": suffixes.map((x) => x).toList(),
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

class Maps {
  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  final String? googleMaps;
  final String? openStreetMaps;

  factory Maps.fromJson(Map<String, dynamic> json){
    return Maps(
      googleMaps: json["googleMaps"],
      openStreetMaps: json["openStreetMaps"],
    );
  }

  Map<String, dynamic> toJson() => {
    "googleMaps": googleMaps,
    "openStreetMaps": openStreetMaps,
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

  final Translation? eng;
  final Translation? sot;

  factory NativeName.fromJson(Map<String, dynamic> json){
    return NativeName(
      eng: json["eng"] == null ? null : Translation.fromJson(json["eng"]),
      sot: json["sot"] == null ? null : Translation.fromJson(json["sot"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "eng": eng?.toJson(),
    "sot": sot?.toJson(),
  };

}

class Translation {
  Translation({
    required this.official,
    required this.common,
  });

  final String? official;
  final String? common;

  factory Translation.fromJson(Map<String, dynamic> json){
    return Translation(
      official: json["official"],
      common: json["common"],
    );
  }

  Map<String, dynamic> toJson() => {
    "official": official,
    "common": common,
  };

}

class PostalCode {
  PostalCode({
    required this.format,
    required this.regex,
  });

  final String? format;
  final String? regex;

  factory PostalCode.fromJson(Map<String, dynamic> json){
    return PostalCode(
      format: json["format"],
      regex: json["regex"],
    );
  }

  Map<String, dynamic> toJson() => {
    "format": format,
    "regex": regex,
  };

}