class GovernorateModel {
  final int id;
  final String key;
  final String name;
  final List<CityModel> cities;

  const GovernorateModel({
    required this.id,
    required this.key,
    required this.name,
    required this.cities,
  });
}

class CityModel {
  final int id;
  final String key;
  final String name;

  const CityModel({required this.id, required this.key, required this.name});
}

class LocationData {
  static const List<GovernorateModel> governorates = [
    GovernorateModel(
      id: 1,
      key: "damascus",
      name: "Damascus",
      cities: [
        CityModel(id: 1, key: "mazzeh", name: "Mazzeh"),
        CityModel(id: 2, key: "kafrsouseh", name: "Kafr Souseh"),
        CityModel(id: 3, key: "barzeh", name: "Barzeh"),
        CityModel(id: 4, key: "meidan", name: "Meidan"),
        CityModel(id: 5, key: "ruken_al_din", name: "Rukneddine"),
        CityModel(id: 6, key: "bab_touma", name: "Bab Touma"),
        CityModel(id: 7, key: "bab_sharqi", name: "Bab Sharqi"),
        CityModel(id: 8, key: "tishreen", name: "Tishreen"),
        CityModel(id: 9, key: "al_qanawat", name: "Al-Qanawat"),
        CityModel(id: 10, key: "abu_rummaneh", name: "Abu Rummaneh"),
        CityModel(id: 11, key: "shaalan", name: "Shaalan"),
        CityModel(id: 12, key: "dummar", name: "Dummar"),
        CityModel(id: 13, key: "al_midan", name: "Al-Midan"),
        CityModel(id: 14, key: "kassaa", name: "Kassaa"),
        CityModel(id: 15, key: "old_damascus", name: "Old Damascus"),
        CityModel(id: 16, key: "qasioun", name: "Qasioun"),
        CityModel(id: 17, key: "adawi", name: "Adawi"),
        CityModel(id: 18, key: "al_amara", name: "Al-Amara"),
        CityModel(id: 19, key: "abu_jamal", name: "Abu Jamal"),
        CityModel(id: 20, key: "harika", name: "Al-Hariqa"),
      ],
    ),
    GovernorateModel(
      id: 2,
      key: "rural_damascus",
      name: "Rural Damascus",
      cities: [
        CityModel(id: 21, key: "douma", name: "Douma"),
        CityModel(id: 22, key: "harasta", name: "Harasta"),
        CityModel(id: 23, key: "zamalka", name: "Zamalka"),
        CityModel(id: 24, key: "jobar", name: "Jobar"),
        CityModel(id: 25, key: "qaboun", name: "Qaboun"),
        CityModel(id: 26, key: "madaya", name: "Madaya"),
        CityModel(id: 27, key: "zabadani", name: "Al-Zabadani"),
        CityModel(id: 28, key: "wafideen", name: "Al-Wafideen"),
        CityModel(id: 29, key: "sayyida_zeinab", name: "Sayyidah Zaynab"),
        CityModel(id: 30, key: "darayya", name: "Darayya"),
        CityModel(id: 31, key: "moadamiyeh", name: "Moadamiyat al-Sham"),
        CityModel(id: 32, key: "qatana", name: "Qatana"),
        CityModel(id: 33, key: "kiswah", name: "Al-Kiswah"),
        CityModel(id: 34, key: "dmeir", name: "Al-Dumayr"),
        CityModel(id: 35, key: "al_tall", name: "Al-Tall"),
        CityModel(id: 36, key: "arbin", name: "Arbin"),
        CityModel(id: 37, key: "haran_al_awamid", name: "Harran al-Awamid"),
        CityModel(id: 38, key: "yabroud", name: "Yabroud"),
        CityModel(id: 39, key: "an_nabk", name: "An-Nabk"),
        CityModel(id: 40, key: "deir_atiyah", name: "Deir Atiyah"),
        CityModel(id: 41, key: "jayrud", name: "Jayrud"),
        CityModel(id: 42, key: "assal_al_ward", name: "Assal al-Ward"),
      ],
    ),
    GovernorateModel(
      id: 3,
      key: "aleppo",
      name: "Aleppo",
      cities: [
        CityModel(id: 43, key: "salah_al_din", name: "Salah al-Din"),
        CityModel(id: 44, key: "hanano", name: "Hanano"),
        CityModel(id: 45, key: "ashrafiyeh", name: "Al-Ashrafiyah"),
        CityModel(id: 46, key: "al_aziziyah", name: "Al-Aziziyah"),
        CityModel(id: 47, key: "seif_al_dawla", name: "Seif al-Dawla"),
        CityModel(id: 48, key: "al_furqan", name: "Al-Furqan"),
        CityModel(id: 49, key: "al_hamdaniya", name: "Al-Hamdaniya"),
        CityModel(id: 50, key: "al_sukari", name: "Al-Sukkari"),
        CityModel(id: 51, key: "al_shaar", name: "Al-Shaar"),
        CityModel(id: 52, key: "al_jamiliyeh", name: "Al-Jamiliyah"),
        CityModel(id: 53, key: "karm_al_jabal", name: "Karm al-Jabal"),
        CityModel(id: 54, key: "al_midan", name: "Al-Midan"),
        CityModel(id: 55, key: "sheikh_maqsood", name: "Sheikh Maqsood"),
        CityModel(id: 56, key: "bustan_al_qasr", name: "Bustan al-Qasr"),
        CityModel(id: 57, key: "al_aziziyah", name: "Al-Aziziyah"),
        CityModel(id: 58, key: "new_aleppo", name: "New Aleppo"),
        CityModel(id: 59, key: "old_city", name: "Old City"),
        CityModel(id: 60, key: "sheikh_najjar", name: "Sheikh Najjar"),
        CityModel(id: 61, key: "khan_al_asal", name: "Khan al-Asal"),
        CityModel(id: 62, key: "ramousah", name: "Al-Ramousah"),
        CityModel(id: 63, key: "al_layramoun", name: "Al-Layramoun"),
        CityModel(id: 64, key: "al_layramoun", name: "Al-Layramoun"),
        CityModel(id: 65, key: "al_haydariyah", name: "Al-Haydariyah"),
      ],
    ),
    GovernorateModel(
      id: 4,
      key: "homs",
      name: "Homs",
      cities: [
        CityModel(id: 66, key: "al_inshaat", name: "Al-Inshaat"),
        CityModel(id: 67, key: "al_waer", name: "Al-Waer"),
        CityModel(id: 68, key: "al_hamra", name: "Al-Hamra"),
        CityModel(id: 69, key: "bab_tadmur", name: "Bab Tadmur"),
        CityModel(id: 70, key: "al_khaldiyeh", name: "Al-Khalidiyah"),
        CityModel(id: 71, key: "al_bayada", name: "Al-Bayada"),
        CityModel(id: 72, key: "deir_ba_alba", name: "Deir Baalba"),
        CityModel(id: 73, key: "ghouta", name: "Ghouta"),
        CityModel(id: 74, key: "al_qusur", name: "Al-Qusour"),
        CityModel(id: 75, key: "al_zahraa", name: "Al-Zahraa"),
        CityModel(id: 76, key: "al_nuzha", name: "Al-Nuzha"),
        CityModel(id: 77, key: "al_sabeel", name: "Al-Sabeel"),
        CityModel(id: 78, key: "al_hamidiyah", name: "Al-Hamidiyah"),
        CityModel(id: 79, key: "al_qarabis", name: "Al-Qarabis"),
        CityModel(id: 80, key: "al_karama", name: "Al-Karama"),
        CityModel(id: 81, key: "al_salam", name: "Al-Salam"),
        CityModel(id: 82, key: "al_ghouta", name: "Al-Ghouta"),
        CityModel(id: 83, key: "al_hosn", name: "Al-Hosn"),
        CityModel(id: 84, key: "al_qaryatein", name: "Al-Qaryatayn"),
        CityModel(id: 85, key: "palmyra", name: "Palmyra"),
      ],
    ),
    GovernorateModel(
      id: 5,
      key: "hama",
      name: "Hama",
      cities: [
        CityModel(id: 86, key: "al_arbaeen", name: "Al-Arbaeen"),
        CityModel(id: 87, key: "al_nasiriya", name: "Al-Nasiriyah"),
        CityModel(id: 88, key: "al_kareem", name: "Al-Kareem"),
        CityModel(id: 89, key: "al_saboun", name: "Al-Saboun"),
        CityModel(id: 90, key: "al_baath", name: "Al-Baath"),
        CityModel(id: 91, key: "mhardeh", name: "Mhardeh"),
        CityModel(id: 92, key: "slimiyah", name: "Al-Salamiyah"),
        CityModel(id: 93, key: "kafr_zita", name: "Kafr Zita"),
        CityModel(id: 94, key: "latamina", name: "Al-Lataminah"),
        CityModel(id: 95, key: "taybat_al_imam", name: "Taybat al-Imam"),
        CityModel(id: 96, key: "soran", name: "Suran"),
        CityModel(id: 97, key: "kafr_nabudah", name: "Kafr Nabudah"),
        CityModel(id: 98, key: "halfaya", name: "Halfaya"),
        CityModel(id: 99, key: "maharda", name: "Maharda"),
        CityModel(id: 100, key: "qamhana", name: "Qamhana"),
        CityModel(id: 101, key: "al_latamna", name: "Al-Latamna"),
        CityModel(id: 102, key: "al_surmaniyah", name: "Al-Surmaniyah"),
        CityModel(id: 103, key: "al_mazzeh_hama", name: "Al-Mazzeh"),
        CityModel(id: 104, key: "al_suqailabiya", name: "Al-Suqaylabiyah"),
        CityModel(id: 105, key: "al_hamraa", name: "Al-Hamraa"),
      ],
    ),
    GovernorateModel(
      id: 6,
      key: "latakia",
      name: "Latakia",
      cities: [
        CityModel(id: 106, key: "al_ramleh", name: "Al-Ramleh"),
        CityModel(id: 107, key: "al_ziraa", name: "Al-Ziraa"),
        CityModel(id: 108, key: "corniche", name: "Corniche"),
        CityModel(id: 109, key: "qastal_maaf", name: "Qastal Maaf"),
        CityModel(id: 110, key: "jableh", name: "Jableh"),
        CityModel(id: 111, key: "qardaha", name: "Qardaha"),
        CityModel(id: 112, key: "slunfeh", name: "Slunfeh"),
        CityModel(id: 113, key: "baniyas", name: "Baniyas"),
        CityModel(id: 114, key: "al_haffa", name: "Al-Haffah"),
        CityModel(id: 115, key: "al_sheikh_daher", name: "Al-Sheikh Daher"),
        CityModel(id: 116, key: "al_daatour", name: "Al-Daatour"),
        CityModel(id: 117, key: "ras_al_basit", name: "Ras al-Bassit"),
        CityModel(id: 118, key: "kessab", name: "Kessab"),
        CityModel(id: 119, key: "al_sanamayn", name: "Al-Sanamayn"),
        CityModel(id: 120, key: "al_raml", name: "Al-Raml"),
        CityModel(id: 121, key: "al_bayda", name: "Al-Bayda"),
        CityModel(id: 122, key: "al_shamiya", name: "Al-Shamiyah"),
        CityModel(id: 123, key: "al_kabir", name: "Al-Kabir"),
        CityModel(id: 124, key: "al_safa", name: "Al-Safa"),
        CityModel(id: 125, key: "al_midan_latakia", name: "Al-Midan"),
      ],
    ),
    GovernorateModel(
      id: 7,
      key: "tartous",
      name: "Tartous",
      cities: [
        CityModel(id: 126, key: "tartous", name: "Tartous"),
        CityModel(id: 127, key: "al_sheikh_badr", name: "Al-Sheikh Badr"),
        CityModel(id: 128, key: "baniyas", name: "Baniyas"),
        CityModel(id: 129, key: "corniche", name: "Corniche"),
        CityModel(id: 130, key: "dreikish", name: "Dreikish"),
        CityModel(id: 131, key: "rabea", name: "Rabia"),
        CityModel(id: 132, key: "mashta_al_hilou", name: "Mashta al-Helu"),
        CityModel(id: 133, key: "bechmira", name: "Beshinmira"),
        CityModel(id: 134, key: "al_hamidiyah", name: "Al-Hamidiyah"),
        CityModel(id: 135, key: "al_dreikish", name: "Al-Dreikish"),
        CityModel(id: 136, key: "al_kadmus", name: "Al-Qadmus"),
        CityModel(id: 137, key: "al_safsafah", name: "Al-Safsafah"),
        CityModel(
          id: 138,
          key: "al_sheikh_badr_center",
          name: "Sheikh Badr Center",
        ),
        CityModel(id: 139, key: "al_tall", name: "Al-Tall"),
        CityModel(id: 140, key: "al_kadmous", name: "Al-Qadmus"),
        CityModel(id: 141, key: "al_rastan_tartous", name: "Al-Rastan"),
        CityModel(id: 142, key: "al_sudan", name: "Al-Sudan"),
        CityModel(id: 143, key: "al_sisiya", name: "Al-Sisiya"),
        CityModel(id: 144, key: "al_bayada", name: "Al-Bayada"),
        CityModel(id: 145, key: "al_hamra_tartous", name: "Al-Hamra"),
      ],
    ),
    GovernorateModel(
      id: 8,
      key: "idlib",
      name: "Idlib",
      cities: [
        CityModel(id: 146, key: "idlib", name: "Idlib"),
        CityModel(id: 147, key: "maarret_al_numan", name: "Maarat al-Numan"),
        CityModel(id: 148, key: "saraqib", name: "Saraqib"),
        CityModel(id: 149, key: "khan_sheikhoun", name: "Khan Shaykhun"),
        CityModel(id: 150, key: "jisir_al_shughur", name: "Jisr al-Shughur"),
        CityModel(id: 151, key: "binnish", name: "Binnish"),
        CityModel(id: 152, key: "taftanaz", name: "Taftanaz"),
        CityModel(id: 153, key: "araq", name: "Ariha"),
        CityModel(id: 154, key: "sarmin", name: "Sarmin"),
        CityModel(id: 155, key: "kafr_nabl", name: "Kafr Nabl"),
        CityModel(id: 156, key: "maaret_al_tamasrin", name: "Maarat Misrin"),
        CityModel(id: 157, key: "harem", name: "Harem"),
        CityModel(id: 158, key: "darkosh", name: "Darkush"),
        CityModel(id: 159, key: "salqin", name: "Salqin"),
        CityModel(id: 160, key: "al_dana", name: "Al-Dana"),
        CityModel(id: 161, key: "ram_hamdan", name: "Ram Hamdan"),
        CityModel(id: 162, key: "kafr_aya", name: "Kafr Aya"),
        CityModel(id: 163, key: "kafr_sajna", name: "Kafr Sajna"),
        CityModel(id: 164, key: "tal_karah", name: "Tal Karah"),
        CityModel(id: 165, key: "zardana", name: "Zardana"),
      ],
    ),
    GovernorateModel(
      id: 9,
      key: "daraa",
      name: "Daraa",
      cities: [
        CityModel(id: 166, key: "daraa", name: "Daraa"),
        CityModel(id: 167, key: "busra_al_sham", name: "Bosra"),
        CityModel(id: 168, key: "nawa", name: "Nawa"),
        CityModel(id: 169, key: "jasem", name: "Jasim"),
        CityModel(id: 170, key: "tafss", name: "Tafas"),
        CityModel(id: 171, key: "mzeireb", name: "Muzayrib"),
        CityModel(id: 172, key: "sanamayn", name: "Al-Sanamayn"),
        CityModel(id: 173, key: "inkhilal", name: "Inkhil"),
        CityModel(id: 174, key: "hirak", name: "Al-Hirak"),
        CityModel(id: 175, key: "dael", name: "Dael"),
        CityModel(id: 176, key: "al_sheikh_maskin", name: "Al-Shaykh Maskin"),
        CityModel(id: 177, key: "namir", name: "Namir"),
        CityModel(id: 178, key: "ghabgab", name: "Ghabaghib"),
        CityModel(id: 179, key: "al_yadouda", name: "Al-Yadudah"),
        CityModel(id: 180, key: "al_tibneh", name: "Al-Tibni"),
        CityModel(id: 181, key: "tal_shihab", name: "Tell Shihab"),
        CityModel(id: 182, key: "khirbet_ghazaleh", name: "Khirbet Ghazaleh"),
        CityModel(id: 183, key: "al_harak", name: "Al-Harak"),
        CityModel(id: 184, key: "al_jiza", name: "Al-Jiza"),
        CityModel(id: 185, key: "al_manshiya", name: "Al-Manshiyah"),
      ],
    ),
    GovernorateModel(
      id: 10,
      key: "deir_ezzor",
      name: "Deir ez-Zor",
      cities: [
        CityModel(id: 186, key: "deir_ezzor", name: "Deir ez-Zor"),
        CityModel(id: 187, key: "al_mayadeen", name: "Al-Mayadin"),
        CityModel(id: 188, key: "al_bukamal", name: "Abu Kamal"),
        CityModel(id: 189, key: "al_busayra", name: "Al-Busayrah"),
        CityModel(id: 190, key: "al_susah", name: "Al-Susah"),
        CityModel(id: 191, key: "khasham", name: "Khasham"),
        CityModel(id: 192, key: "al_husseiniyah", name: "Al-Husseiniyah"),
        CityModel(id: 193, key: "al_jura", name: "Al-Jura"),
        CityModel(id: 194, key: "al_quriya", name: "Al-Quriyah"),
        CityModel(id: 195, key: "al_hawayej", name: "Al-Hawayij"),
        CityModel(id: 196, key: "al_tayana", name: "Al-Tayanah"),
        CityModel(id: 197, key: "al_tabni", name: "Al-Tibni"),
        CityModel(id: 198, key: "al_shuhail", name: "Al-Shuhail"),
        CityModel(id: 199, key: "al_abu_kamal", name: "Abu Kamal"),
        CityModel(id: 200, key: "al_husainiya", name: "Al-Husainiyah"),
        CityModel(id: 201, key: "al_jezira", name: "Al-Jazira"),
        CityModel(id: 202, key: "al_dhula", name: "Al-Dhula"),
        CityModel(id: 203, key: "al_baghouz", name: "Al-Baghuz"),
        CityModel(id: 204, key: "al_salihiyah", name: "Al-Salihiyah"),
        CityModel(id: 205, key: "al_omar", name: "Al-Omar"),
      ],
    ),
    GovernorateModel(
      id: 11,
      key: "raqqa",
      name: "Raqqa",
      cities: [
        CityModel(id: 206, key: "raqqa", name: "Raqqa"),
        CityModel(id: 207, key: "tal_abyad", name: "Tell Abyad"),
        CityModel(id: 208, key: "al_tabqa", name: "Al-Thawrah (Tabqa)"),
        CityModel(id: 209, key: "al_mansoura", name: "Al-Mansurah"),
        CityModel(id: 210, key: "al_karamah", name: "Al-Karamah"),
        CityModel(id: 211, key: "al_karama", name: "Al-Karama"),
        CityModel(id: 212, key: "al_hanida", name: "Al-Hanida"),
        CityModel(id: 213, key: "al_kasrat", name: "Al-Kasrat"),
        CityModel(id: 214, key: "al_resh", name: "Al-Resh"),
        CityModel(id: 215, key: "al_hisba", name: "Al-Hisba"),
        CityModel(id: 216, key: "al_rashid", name: "Al-Rashid"),
        CityModel(id: 217, key: "al_jurneyyah", name: "Al-Jurniyah"),
        CityModel(id: 218, key: "al_sabkha", name: "Al-Sabkhah"),
        CityModel(id: 219, key: "al_hol", name: "Al-Hawl"),
        CityModel(id: 220, key: "al_rasafa", name: "Al-Rusafa"),
        CityModel(id: 221, key: "al_sharakrak", name: "Al-Sharakrak"),
        CityModel(id: 222, key: "al_khafsa", name: "Al-Khafsa"),
        CityModel(id: 223, key: "al_masrab", name: "Al-Masrab"),
        CityModel(id: 224, key: "al_tabaqa_dam", name: "Tabqa Dam"),
        CityModel(id: 225, key: "al_qadisiya", name: "Al-Qadisiyah"),
      ],
    ),
    GovernorateModel(
      id: 12,
      key: "hasakah",
      name: "Al-Hasakah",
      cities: [
        CityModel(id: 226, key: "qamishli", name: "Qamishli"),
        CityModel(id: 227, key: "hasakah", name: "Al-Hasakah"),
        CityModel(id: 228, key: "malikiya", name: "Al-Malikiyah"),
        CityModel(id: 229, key: "ras_al_ayn", name: "Ras al-Ayn"),
        CityModel(id: 230, key: "al_shaddadi", name: "Al-Shaddadi"),
        CityModel(id: 231, key: "amuda", name: "Amuda"),
        CityModel(id: 232, key: "derbasiya", name: "Al-Darbasiyah"),
        CityModel(id: 233, key: "tirbespi", name: "Al-Qahtaniyah (Tirbespi)"),
        CityModel(id: 234, key: "al_mabrouka", name: "Al-Mabrouka"),
        CityModel(id: 235, key: "al_yaarubiyah", name: "Al-Yaarubiyah"),
        CityModel(id: 236, key: "al_hawl", name: "Al-Hawl"),
        CityModel(id: 237, key: "al_himma", name: "Al-Himma"),
        CityModel(id: 238, key: "al_ghazl", name: "Al-Ghazl"),
        CityModel(id: 239, key: "al_kasra", name: "Al-Kasrah"),
        CityModel(id: 240, key: "al_markada", name: "Markada"),
        CityModel(id: 241, key: "al_tayyana", name: "Al-Tayanah"),
        CityModel(id: 242, key: "al_sweidiya", name: "Al-Suwaydiyah"),
        CityModel(id: 243, key: "al_khaldiya", name: "Al-Khalidiyah"),
        CityModel(id: 244, key: "al_jawadiyah", name: "Al-Jawadiyah"),
        CityModel(id: 245, key: "al_talaq", name: "Al-Talaq"),
      ],
    ),
    GovernorateModel(
      id: 13,
      key: "quneitra",
      name: "Quneitra",
      cities: [
        CityModel(id: 246, key: "quneitra", name: "Quneitra"),
        CityModel(id: 247, key: "khan_arnabah", name: "Khan Arnabah"),
        CityModel(id: 248, key: "baath_city", name: "Baath City"),
        CityModel(id: 249, key: "al_rafid", name: "Al-Rafid"),
        CityModel(id: 250, key: "jubata_al_khashab", name: "Jubata al-Khashab"),
        CityModel(id: 251, key: "hadar", name: "Hadar"),
        CityModel(id: 252, key: "al_qahtaniyah", name: "Al-Qahtaniyah"),
        CityModel(id: 253, key: "bir_ajam", name: "Bir Ajam"),
        CityModel(id: 254, key: "masharah", name: "Masharah"),
      ],
    ),
    GovernorateModel(
      id: 14,
      key: "as_suwayda",
      name: "As-Suwayda",
      cities: [
        CityModel(id: 256, key: "as_suwayda", name: "As-Suwayda"),
        CityModel(id: 257, key: "salkhad", name: "Salkhad"),
        CityModel(id: 258, key: "shahba", name: "Shahba"),
        CityModel(id: 259, key: "qanawat", name: "Qanawat"),
        CityModel(id: 260, key: "al_qurayya", name: "Al-Qurayya"),
        CityModel(id: 261, key: "ariqah", name: "Ariqah"),
        CityModel(id: 262, key: "al_mazraa", name: "Al-Mazraa"),
        CityModel(id: 263, key: "thaala", name: "Thaala"),
        CityModel(id: 264, key: "shaqqa", name: "Shaqqa"),
        CityModel(id: 265, key: "al_ruha", name: "Al-Ruha"),
      ],
    ),
  ];

  /// Return list of governorate keys for dropdowns
  static List<String> getGovernorateKeys() =>
      governorates.map((g) => g.key).toList();

  /// Return list of city keys for a governorate key
  static List<String> getCitiesKeys(String governorateKey) {
    try {
      final g = governorates.firstWhere((g) => g.key == governorateKey);
      return g.cities.map((c) => c.key).toList();
    } catch (_) {
      return [];
    }
  }

  /// Return governorate id for a governorate key, or null if not found.
  static int? getGovernorateId(String governorateKey) {
    try {
      final g = governorates.firstWhere((g) => g.key == governorateKey);
      return g.id;
    } catch (_) {
      return null;
    }
  }

  /// Return city id for a governorate key + city key, or null if not found.
  static int? getCityId(String governorateKey, String cityKey) {
    try {
      final g = governorates.firstWhere((g) => g.key == governorateKey);
      final c = g.cities.firstWhere((c) => c.key == cityKey);
      return c.id;
    } catch (_) {
      return null;
    }
  }
}
