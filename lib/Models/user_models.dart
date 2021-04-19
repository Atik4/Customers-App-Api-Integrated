class PremiumInfo {
  String name;
  String policyNo;
  String agentNo;
  String startDate, endDate, dueDate, riskEndDate;
  //PolicyPremium policyPremium;

  PremiumInfo(this.name, this.policyNo, this.agentNo, this.startDate,
      this.endDate, this.riskEndDate, this.dueDate);
}

class BenefitDetails {
  String survivalBenefit,
      onMaturity,
      onDeath,
      onAccidentalDeath,
      criticalIllness;

  BenefitDetails(this.survivalBenefit, this.onMaturity, this.onDeath,
      this.onAccidentalDeath, this.criticalIllness);
}

class FundSummary {
  double capf, balf, intf, divf;
  FundSummary(this.capf, this.balf, this.intf, this.divf);
}

class Endowment {
  double totalAmount, premium;
  DateTime startDate, endDate, riskEndDate;
  Endowment(this.totalAmount, this.premium, this.startDate, this.endDate,
      this.riskEndDate);
}

class Adb {
  double totalAmount, premium;
  DateTime startDate, endDate, riskEndDate;
  Adb(this.totalAmount, this.premium, this.startDate, this.endDate,
      this.riskEndDate);
}

class Cir {
  double totalAmount, premium;
  DateTime startDate, endDate, riskEndDate;
  Cir(this.totalAmount, this.premium, this.startDate, this.endDate,
      this.riskEndDate);
}

class BenefitSummary {
  Endowment endowment;
  Adb adb;
  Cir cir;
  BenefitSummary(this.endowment, this.adb, this.cir);
}

class BankDetails {
  String ifsc, bankName, branch;
  String maxAmount;
  String terminationDate;
  BankDetails(this.ifsc, this.bankName, this.branch, this.maxAmount,
      this.terminationDate);
}

class PremiumFrequency {
  String frequency;
  PremiumFrequency(this.frequency);
}

class SurrenderQuotation {
  double surrenderValues, totalFundBalances, reversionaryBonus;
  SurrenderQuotation(
      this.surrenderValues, this.totalFundBalances, this.reversionaryBonus);
}

class CurrentFundDirections {
  double capf, balf, intf, divf;
  CurrentFundDirections(this.capf, this.balf, this.intf, this.divf);
}

class FuturePremiumRedirections {
  double capf, balf, dalf, ealf, half;
  FuturePremiumRedirections(
      {this.capf, this.balf, this.dalf, this.ealf, this.half});
}

class ServiceRequest {
  String srNo, status;
  String srDate, completionDate;
  ServiceRequest(this.srNo, this.status, this.srDate, this.completionDate);
}

class ServiceRequestStatus {
  String srNo, status;
  String srDate, completionDate;
  ServiceRequestStatus(
      this.srNo, this.status, this.srDate, this.completionDate);
}

class PolicyPremium {
  String policyNo, product;
  String startDate, endDate;
  double premium;
  PolicyPremium(
      this.policyNo, this.product, this.startDate, this.endDate, this.premium);
}

class Address {
  String line1, line2, line3;
  String pinCode, city;
  String email, mobile;
  String policyNo;
  Address({
    this.line1,
    this.line2,
    this.line3,
    this.city,
    this.pinCode,
    this.email,
    this.mobile,
    this.policyNo,
  });
}

class SurrenderQuotationDetails {
  double surrenderValues, totalFundBalances, reversionaryBonus;

  SurrenderQuotationDetails(
      this.surrenderValues, this.totalFundBalances, this.reversionaryBonus);
}

class LoanDetails {
  double surrenderValues, totalFundBalances, reversionaryBonus;

  LoanDetails(
      this.surrenderValues, this.totalFundBalances, this.reversionaryBonus);
}

class CurrentFundCardDetails {
  String CAPF, BALF, INTF, DIVF;

  CurrentFundCardDetails(this.CAPF, this.BALF, this.INTF, this.DIVF);
}

class BankChangeListClass {
  String policyNo, policyOwner, lifeAssured, policyStatus;
  String startDate, premiumPayingStatus, billingFrequency;
  String paidToDate;
  BankChangeListClass(
      {this.policyNo,
      this.policyOwner,
      this.lifeAssured,
      this.policyStatus,
      this.startDate,
      this.billingFrequency,
      this.paidToDate,
      this.premiumPayingStatus});
}
