import 'Components/formCards/address_change_card.dart';
import 'Components/formCards/bank_change_card.dart';
import './Components/current_fund_card.dart';
import 'Components/formCards/frequency_change_card.dart';
import './Components/premium_redirection_card.dart';
import './Components/report_generation_card.dart';
import './Components/surrender_quote_card.dart';
import './Components/topup_cards.dart';
import 'package:flutter/material.dart';
import 'Models/change_screen_models.dart';
import 'Models/user_models.dart';

const Color Color1 = Color.fromRGBO(146, 132, 110, 1);
const Color Color2 = Color.fromRGBO(194, 183, 168, 0.6);
const Color Color3 = Color.fromRGBO(226, 221, 212, 0.3);

List<Color> colorsList = [
  Color(0xff59D8E6),
  Color(0xff00cfeb),
  Color(0xff00c6f2),
  Color(0xff00bcfa),
  Color(0xff00b2ff),
  Color(0xff00a6ff),
  Color(0xff009aff),
  Color(0xff008dff),
  Color(0xff007eff),
  Color(0xff006dff),
  Color(0xff0059ff),
  Color(0xff1c3ffd)
];

List<String> monthsList = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

List<double> monthPremiumList = [
  5000.00,
  10000.00,
  1243.56,
  6743.12,
  2691.00,
  7800,
  3000,
  2500.00,
  4500,
  979.23,
  6700.31,
  1300.00
];

List<PolicyPremium> listPolicyPremium = [
  PolicyPremium("Policy # 24569AB8712345455", "Endowment", '2/12/2020',
      '2/12/2035', 12675),
  PolicyPremium(
      "Policy # 34127AB87981454897", "ADB", '10/08/2015', '2/10/2033', 7685),
  PolicyPremium("Policy # 81234GQ8712345712", "Endowment", '20/3/2018',
      '2/12/2050', 1200),
  PolicyPremium("Policy # 24569AB8712345455", "Endowment", '2/12/2020',
      '2/12/2035', 12675),
  PolicyPremium(
      "Policy # 34127AB87981454897", "ADB", '10/08/2015', '2/10/2033', 7685),
  PolicyPremium("Policy # 81234GQ8712345712", "Endowment", '20/3/2018',
      '2/12/2050', 1200),
  PolicyPremium("Policy # 24569AB8712345455", "Endowment", '2/12/2020',
      '2/12/2035', 12675),
  PolicyPremium(
      "Policy # 34127AB87981454897", "ADB", '10/08/2015', '2/10/2033', 7685),
  PolicyPremium("Policy # 81234GQ8712345712", "Endowment", '20/3/2018',
      '2/12/2050', 1200),
];

List<ServiceRequest> serviceRequestList = [
  ServiceRequest(
      "SR # 24569AB8712345455", "pending", "21/12/2015", "10/03/2020"),
  ServiceRequest(
      "SR # 56122AB8712345490", "completed", "02/10/2018", "17/03/2025"),
  ServiceRequest(
      "SR # 37869CD8712342489", "pending", "21/12/2012", "08/10/2021"),
  ServiceRequest(
      "SR # 24569AB8712345455", "pending", "21/12/2015", "10/03/2020"),
  ServiceRequest(
      "SR # 90519AB8712347138", "completed", "19/01/2021", "02/04/2021"),
  ServiceRequest(
      "SR # 24569AB8712345455", "pending", "21/12/2015", "10/03/2020"),
  ServiceRequest(
      "SR # 56122AB8712345490", "completed", "02/10/2018", "17/03/2025"),
  ServiceRequest(
      "SR # 37869CD8712342489", "pending", "21/12/2012", "08/10/2021"),
  ServiceRequest(
      "SR # 24569AB8712345455", "pending", "21/12/2015", "10/03/2020"),
  ServiceRequest(
      "SR # 90519AB8712347138", "completed", "19/01/2021", "02/04/2021"),
  ServiceRequest(
      "SR # 24569AB8712345455", "pending", "21/12/2015", "10/03/2020"),
  ServiceRequest(
      "SR # 56122AB8712345490", "completed", "02/10/2018", "17/03/2025"),
  ServiceRequest(
      "SR # 37869CD8712342489", "pending", "21/12/2012", "08/10/2021"),
  ServiceRequest(
      "SR # 24569AB8712345455", "pending", "21/12/2015", "10/03/2020"),
  ServiceRequest(
      "SR # 90519AB8712347138", "completed", "19/01/2021", "02/04/2021"),
];

List<String> changesOptions = [
  'Address Change',
  'Frequency Change',
  'Bank Change',
  'Report Generation',
  'Surrender Quote',
  'Fund Switch',
  'Top-up',
  'Premium Redirection'
];

List<Widget> changesCards = [
  AddressChangeCard(),
  FrequencyChangeCard(),
  BankChangeCard(),
  ReportChangeCard(),
  SurrenderQuoteCard(),
  CurrentFundCard(),
  TopupCard(),
  PremiumRedirectionCard(),
];

List<BankChangeListClass> listBankChangeCardClass = [
  BankChangeListClass(
      policyNo: '34127AB87981454897',
      policyOwner: 'Atik Agarwal',
      lifeAssured: 'Pratik Agarwal',
      policyStatus: 'Active',
      startDate: '20/3/2018',
      billingFrequency: '3 months',
      paidToDate: '11/12/2020',
      premiumPayingStatus: 'Pending'),
  BankChangeListClass(
      policyNo: '24569AB8712345455',
      policyOwner: 'VR Ravichandran',
      lifeAssured: 'Ravichandran Ashwin',
      policyStatus: 'Active',
      startDate: '03/7/2016',
      billingFrequency: '6 months',
      paidToDate: '29/01/2021',
      premiumPayingStatus: 'Up to date'),
  BankChangeListClass(
      policyNo: '34127AB87981454897',
      policyOwner: 'Mayank Patel',
      lifeAssured: 'Life Assured',
      policyStatus: 'Inactive',
      startDate: '26/5/2017',
      billingFrequency: 'Yearly',
      paidToDate: '29/09/2019',
      premiumPayingStatus: 'Pending'),
  BankChangeListClass(
      policyNo: '34127AB87981454897',
      policyOwner: 'Atik Agarwal',
      lifeAssured: 'Pratik Agarwal',
      policyStatus: 'Active',
      startDate: '20/3/2018',
      billingFrequency: '3 months',
      paidToDate: '11/12/2020',
      premiumPayingStatus: 'Pending'),
  BankChangeListClass(
      policyNo: '24569AB8712345455',
      policyOwner: 'VR Ravichandran',
      lifeAssured: 'Ravichandran Ashwin',
      policyStatus: 'Active',
      startDate: '03/7/2016',
      billingFrequency: '6 months',
      paidToDate: '29/01/2021',
      premiumPayingStatus: 'Up to date'),
  BankChangeListClass(
      policyNo: '34127AB87981454897',
      policyOwner: 'Mayank Patel',
      lifeAssured: 'Life Assured',
      policyStatus: 'Inactive',
      startDate: '26/5/2017',
      billingFrequency: 'Yearly',
      paidToDate: '29/09/2019',
      premiumPayingStatus: 'Pending'),
  BankChangeListClass(
      policyNo: '34127AB87981454897',
      policyOwner: 'Atik Agarwal',
      lifeAssured: 'Pratik Agarwal',
      policyStatus: 'Active',
      startDate: '20/3/2018',
      billingFrequency: '3 months',
      paidToDate: '11/12/2020',
      premiumPayingStatus: 'Pending'),
  BankChangeListClass(
      policyNo: '24569AB8712345455',
      policyOwner: 'VR Ravichandran',
      lifeAssured: 'Ravichandran Ashwin',
      policyStatus: 'Active',
      startDate: '03/7/2016',
      billingFrequency: '6 months',
      paidToDate: '29/01/2021',
      premiumPayingStatus: 'Up to date'),
  BankChangeListClass(
      policyNo: '34127AB87981454897',
      policyOwner: 'Mayank Patel',
      lifeAssured: 'Life Assured',
      policyStatus: 'Inactive',
      startDate: '26/5/2017',
      billingFrequency: 'Yearly',
      paidToDate: '29/09/2019',
      premiumPayingStatus: 'Pending'),
  BankChangeListClass(
      policyNo: '34127AB87981454897',
      policyOwner: 'Atik Agarwal',
      lifeAssured: 'Pratik Agarwal',
      policyStatus: 'Active',
      startDate: '20/3/2018',
      billingFrequency: '3 months',
      paidToDate: '11/12/2020',
      premiumPayingStatus: 'Pending'),
  BankChangeListClass(
      policyNo: '24569AB8712345455',
      policyOwner: 'VR Ravichandran',
      lifeAssured: 'Ravichandran Ashwin',
      policyStatus: 'Active',
      startDate: '03/7/2016',
      billingFrequency: '6 months',
      paidToDate: '29/01/2021',
      premiumPayingStatus: 'Up to date'),
  BankChangeListClass(
      policyNo: '34127AB87981454897',
      policyOwner: 'Mayank Patel',
      lifeAssured: 'Life Assured',
      policyStatus: 'Inactive',
      startDate: '26/5/2017',
      billingFrequency: 'Yearly',
      paidToDate: '29/09/2019',
      premiumPayingStatus: 'Pending'),
];

List<Address> listAddresses = [
  Address(
    line1: '9, Harshit Nagar',
    line2: 'Shree Ram Chawk',
    line3: 'Mohba Bazar',
    pinCode: '492099',
    city: 'Raipur',
    mobile: '+91 8717892888',
    email: 'atikagarwal4@gmail.com',
    policyNo: '24569AB8712345455',
  ),
  Address(
    line1: 'H5, Hostel 5',
    line2: 'Manit Road',
    line3: '',
    pinCode: '462003',
    city: 'Bhopal',
    mobile: '+91 7987588988',
    email: 'mayankpatel@gmail.com',
    policyNo: '12369BH8712345488',
  ),
  Address(
    line1: '113, Bakar Mahal',
    line2: 'Sadar Bazar',
    line3: '',
    pinCode: '700120',
    city: 'Barrackpore',
    mobile: '+91 8236830500',
    email: 'sivshankaragarwal@gmail.com',
    policyNo: '87469AB8712345455',
  ),
  Address(
    line1: '7, Gujrati Colony',
    line2: 'Dhar Road',
    line3: 'Navlakha',
    pinCode: '478431',
    city: 'Indore',
    mobile: '+91 9340023761',
    email: 'vedantmathe@gmail.com',
    policyNo: '90269BH8712345455',
  ),
  Address(
    line1: '9, Harshit Nagar',
    line2: 'Shree Ram Chawk',
    line3: 'Mohba Bazar',
    pinCode: '492099',
    city: 'Raipur',
    mobile: '+91 8717892888',
    email: 'atikagarwal4@gmail.com',
    policyNo: '24569AB8712345455',
  ),
  Address(
    line1: 'H5, Hostel 5',
    line2: 'Manit Road',
    line3: '',
    pinCode: '462003',
    city: 'Bhopal',
    mobile: '+91 7987588988',
    email: 'mayankpatel@gmail.com',
    policyNo: '12369BH8712345488',
  ),
  Address(
    line1: '113, Bakar Mahal',
    line2: 'Sadar Bazar',
    line3: '',
    pinCode: '700120',
    city: 'Barrackpore',
    mobile: '+91 8236830500',
    email: 'sivshankaragarwal@gmail.com',
    policyNo: '87469AB8712345455',
  ),
  Address(
    line1: '7, Gujrati Colony',
    line2: 'Dhar Road',
    line3: 'Navlakha',
    pinCode: '478431',
    city: 'Indore',
    mobile: '+91 9340023761',
    email: 'vedantmathe@gmail.com',
    policyNo: '90269BH8712345455',
  ),
];

List<TopupCardClass> listTopupCardClass = [
  TopupCardClass(
      policyNo: '34127AB87981454897',
      policyStatus: 'Inactive',
      billingFrequency: 'Yearly',
      installmentPremium: '2000.00',
      premiumPayingStatus: 'Pending'),
  TopupCardClass(
      policyNo: '90731BC87984354721',
      policyStatus: 'Active',
      billingFrequency: 'Semi-Annual',
      installmentPremium: '7500.00',
      premiumPayingStatus: 'Pending'),
  TopupCardClass(
      policyNo: 'JH5643E87981454NH7',
      policyStatus: 'Active',
      billingFrequency: 'Monthly',
      installmentPremium: '500.00',
      premiumPayingStatus: 'Up to date'),
  TopupCardClass(
      policyNo: 'HFV999E87981455644',
      policyStatus: 'Inactive',
      billingFrequency: 'Quaterly',
      installmentPremium: '2100.00',
      premiumPayingStatus: 'Up to date'),
  TopupCardClass(
      policyNo: '34127AB87981454897',
      policyStatus: 'Inactive',
      billingFrequency: 'Yearly',
      installmentPremium: '2000.00',
      premiumPayingStatus: 'Pending'),
  TopupCardClass(
      policyNo: '90731BC87984354721',
      policyStatus: 'Active',
      billingFrequency: 'Semi-Annual',
      installmentPremium: '7500.00',
      premiumPayingStatus: 'Pending'),
  TopupCardClass(
      policyNo: 'JH5643E87981454NH7',
      policyStatus: 'Active',
      billingFrequency: 'Monthly',
      installmentPremium: '500.00',
      premiumPayingStatus: 'Up to date'),
  TopupCardClass(
      policyNo: 'HFV999E87981455644',
      policyStatus: 'Inactive',
      billingFrequency: 'Quaterly',
      installmentPremium: '2100.00',
      premiumPayingStatus: 'Up to date'),
  TopupCardClass(
      policyNo: '34127AB87981454897',
      policyStatus: 'Inactive',
      billingFrequency: 'Yearly',
      installmentPremium: '2000.00',
      premiumPayingStatus: 'Pending'),
  TopupCardClass(
      policyNo: '90731BC87984354721',
      policyStatus: 'Active',
      billingFrequency: 'Semi-Annual',
      installmentPremium: '7500.00',
      premiumPayingStatus: 'Pending'),
  TopupCardClass(
      policyNo: 'JH5643E87981454NH7',
      policyStatus: 'Active',
      billingFrequency: 'Monthly',
      installmentPremium: '500.00',
      premiumPayingStatus: 'Up to date'),
  TopupCardClass(
      policyNo: 'HFV999E87981455644',
      policyStatus: 'Inactive',
      billingFrequency: 'Quaterly',
      installmentPremium: '2100.00',
      premiumPayingStatus: 'Up to date'),
];
