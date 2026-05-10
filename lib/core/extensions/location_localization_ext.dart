import 'package:flutter/widgets.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

extension LocationLocalizationExt on BuildContext {
  /// =====================
  /// GOVERNORATES
  /// =====================

  String govLabel(String key) {
    switch (key) {
      case "damascus":
        return tr.gov_damascus;
      case "aleppo":
        return tr.gov_aleppo;
      case "homs":
        return tr.gov_homs;
      case "hama":
        return tr.gov_hama;
      case "latakia":
        return tr.gov_latakia;
      case "tartous":
        return tr.gov_tartous;
      case "idlib":
        return tr.gov_idlib;
      case "daraa":
        return tr.gov_daraa;
      case "deir_ezzor":
        return tr.gov_deir_ezzor;
      case "raqqa":
        return tr.gov_raqqa;
      case "hasakah":
        return tr.gov_hasakah;
      default:
        return key;
    }
  }

  /// =====================
  /// CITIES
  /// =====================

  String cityLabel(String key) {
    switch (key) {
      case "mazzeh":
        return tr.city_mazzeh;
      case "barzeh":
        return tr.city_barzeh;
      case "mezzah_86":
        return tr.city_mezzah_86;
      case "kafrsouseh":
        return tr.city_kafrsouseh;
      case "ruken_al_din":
        return tr.city_ruken_al_din;
      case "old_damascus":
        return tr.city_old_damascus;

      case "salah_al_din":
        return tr.city_salah_al_din;
      case "hanano":
        return tr.city_hanano;
      case "ashrafieh":
        return tr.city_ashrafieh;
      case "aziziyeh":
        return tr.city_aziziyeh;
      case "jamiliyeh":
        return tr.city_jamiliyeh;
      case "seif_al_dawla":
        return tr.city_seif_al_dawla;

      case "al_inshaat":
        return tr.city_al_inshaat;
      case "al_waer":
        return tr.city_al_waer;
      case "al_hamra":
        return tr.city_al_hamra;
      case "bab_tadmur":
        return tr.city_bab_tadmur;

      case "al_arbaeen":
        return tr.city_al_arbaeen;
      case "al_nasiriya":
        return tr.city_al_nasiriya;
      case "al_kareem":
        return tr.city_al_kareem;

      case "al_ramleh":
        return tr.city_al_ramleh;
      case "al_ziraa":
        return tr.city_al_ziraa;
      case "corniche":
        return tr.city_corniche;

      case "al_sheikh_badr":
        return tr.city_al_sheikh_badr;
      case "baniyas":
        return tr.city_baniyas;
      case "corniche_tartous":
        return tr.city_corniche_tartous;

      case "idlib_center":
        return tr.city_idlib_center;
      case "maarret_al_numan":
        return tr.city_maarret_al_numan;
      case "saraqib":
        return tr.city_saraqib;

      case "daraa_city":
        return tr.city_daraa_city;
      case "busra_al_sham":
        return tr.city_busra_al_sham;
      case "nawa":
        return tr.city_nawa;

      case "deir_ezzor_city":
        return tr.city_deir_ezzor_city;
      case "al_mayadeen":
        return tr.city_al_mayadeen;
      case "al_bukamal":
        return tr.city_al_bukamal;

      case "raqqa_city":
        return tr.city_raqqa_city;
      case "tal_abyad":
        return tr.city_tal_abyad;

      case "hasakah_city":
        return tr.city_hasakah_city;
      case "qamishli":
        return tr.city_qamishli;
      case "malikiya":
        return tr.city_malikiya;

      default:
        return key;
    }
  }
}
