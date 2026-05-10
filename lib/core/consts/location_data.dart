class LocationData {
  static const String damascus = "damascus";
  static const String aleppo = "aleppo";
  static const String homs = "homs";
  static const String hama = "hama";
  static const String latakia = "latakia";
  static const String tartous = "tartous";
  static const String idlib = "idlib";
  static const String daraa = "daraa";
  static const String deirEzzor = "deir_ezzor";
  static const String raqqa = "raqqa";
  static const String hasakah = "hasakah";

  /// Governorates list
  static const List<String> governorates = [
    damascus,
    aleppo,
    homs,
    hama,
    latakia,
    tartous,
    idlib,
    daraa,
    deirEzzor,
    raqqa,
    hasakah,
  ];

  /// Cities mapped by governorate
  static const Map<String, List<String>> cities = {
    damascus: [
      "mazzeh",
      "barzeh",
      "mezzah_86",
      "kafrsouseh",
      "ruken_al_din",
      "old_damascus",
    ],

    aleppo: [
      "salah_al_din",
      "hanano",
      "ashrafieh",
      "aziziyeh",
      "jamiliyeh",
      "seif_al_dawla",
    ],

    homs: ["al_inshaat", "al_waer", "al_hamra", "bab_tadmur"],

    hama: ["al_arbaeen", "al_nasiriya", "al_kareem"],

    latakia: ["al_ramleh", "al_ziraa", "corniche"],

    tartous: ["al_sheikh_badr", "baniyas", "corniche_tartous"],

    idlib: ["idlib_center", "maarret_al_numan", "saraqib"],

    daraa: ["daraa_city", "busra_al_sham", "nawa"],

    deirEzzor: ["deir_ezzor_city", "al_mayadeen", "al_bukamal"],

    raqqa: ["raqqa_city", "tal_abyad"],

    hasakah: ["hasakah_city", "qamishli", "malikiya"],
  };

  static List<String> getCities(String governorate) {
    return cities[governorate] ?? [];
  }
}
