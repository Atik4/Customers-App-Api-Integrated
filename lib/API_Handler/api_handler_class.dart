import '../Components/rider_info.dart';
import '../Models/user_models.dart';

class ApiHandler {
  PremiumInfo getRiderInfo(String policyNo) {
    PremiumInfo premiumInfo = PremiumInfo('VR RAVICHANDRAN', '# 1231314671',
        'XYZ 7614', '15 Jan 2015', '31 Jan 2021', '15 Jan 2035', '15 Jan 2045');
    return premiumInfo;
  }
}
