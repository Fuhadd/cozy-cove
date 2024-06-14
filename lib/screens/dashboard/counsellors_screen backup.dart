// import 'dart:developer';

// import 'package:cozy_cove/constants/custom_colors.dart';
// import 'package:cozy_cove/constants/custom_string.dart';
// import 'package:cozy_cove/dialogs_and_popups/error_dialog.dart';
// import 'package:cozy_cove/dialogs_and_popups/generic_dialog.dart';
// import 'package:cozy_cove/globals.dart';
// import 'package:cozy_cove/screens/app_view_model.dart';
// import 'package:cozy_cove/screens/authentication/sign_in/pseudonym_input_screen.dart';
// import 'package:cozy_cove/screens/authentication/sign_up/sign_in_screen.dart';
// import 'package:cozy_cove/utils/enum.dart';
// import 'package:cozy_cove/utils/spacers.dart';
// import 'package:cozy_cove/widgets/custom_border_button.dart';
// import 'package:cozy_cove/widgets/new_custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:solana_web3/buffer.dart';
// import 'package:solana_web3/programs.dart';
// import 'package:uni_links/uni_links.dart';
// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_phantom/flutter_phantom.dart';
// import 'package:uni_links/uni_links.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:solana_web3/solana_web3.dart' as web3;
// import 'package:solana_web3/programs/system.dart';

// class CounsellorScreen extends StatefulHookConsumerWidget {
//   static const routeName = '/CounsellorScreen';
//   const CounsellorScreen({super.key});

//   @override
//   ConsumerState<CounsellorScreen> createState() => _CounsellorScreenState();
// }

// class _CounsellorScreenState extends ConsumerState<CounsellorScreen> {
//   bool isButtonLoading = false;

//   Uri? _latestUri;
//   late StreamSubscription _sub;
//   String logger = "";
//   bool isLoading = false;
//   ScrollController scrollController = ScrollController();

//   final FlutterPhantom phantom = FlutterPhantom(
//     appUrl: "https://phantom.app",
//     deepLink: "app://mydeapp",
//   );

//   @override
//   void initState() {
//     super.initState();
//     _handleIncomingLinks();
//   }

//   @override
//   void dispose() {
//     _sub.cancel();
//     super.dispose();
//   }

//   Future<void> _handleIncomingLinks() async {
//     _sub = uriLinkStream.listen((Uri? link) {
//       _latestUri = link;
//       final queryParams = _latestUri?.queryParametersAll.entries.toList();

//       if (queryParams!.isNotEmpty) {
//         switch (queryParams[0].value[0].toString()) {
//           case "onConnect":
//             Map dataConnect = phantom.onConnectToWallet(queryParams);
//             inspect(dataConnect);

//             ref.read(publicKeyProvider.notifier).state = dataConnect.toString();

//             // Global.publicKey = dataConnect.toString();
//             textLogger(dataConnect.toString());
//             GenericDialog().showSimplePopup(
//               context: context,
//               type: InfoBoxType.success,
//               content: "Your wallet has been successfully connected.",
//               onOkPressed: () {
//                 Navigator.pop(context);
//               },
//             );

//             break;
//           case "onSignAndSendTransaction":
//             if (mounted) {
//               ref.read(hasPaidProvider.notifier).state = true;
//               Fluttertoast.showToast(msg: "Your Transaction was successfull");
//               // GenericDialog().showSimplePopup(
//               //   context: context,
//               //   type: InfoBoxType.success,
//               //   content: "Your Transaction was successfull",
//               //   onOkPressed: () {
//               //     Navigator.pop(context);
//               //   },
//               // );
//               // Map dataSignAndSendTransaction =
//               //     phantom.onCreateSignAndSendTransactionReceive(queryParams);
//               // inspect(dataSignAndSendTransaction);
//               ref.read(hasPaidProvider.notifier).state = true;
//             }

//             // textLogger(dataSignAndSendTransaction.toString());
//             break;
//           case "onDisconnect":
//             String dataDisconnect = phantom.onDisconnectReceive();
//             textLogger(dataDisconnect.toString());
//             break;
//           case "onSignTransaction":
//             web3.Transaction dataTransactionWithSign =
//                 phantom.onSignTransactionReceive(queryParams);
//             inspect(dataTransactionWithSign);
//             textLogger("transaction sign");

//             break;
//           case "onSignAllTransaction":
//             List<web3.Transaction> dataSignAllTransaction =
//                 phantom.onSignAllTransactionReceive(queryParams);
//             inspect(dataSignAllTransaction);
//             textLogger("All transactions sign");
//             break;
//           case "onSignMessage":
//             Map dataOnSignMessage = phantom.onSignMessageReceive(queryParams);
//             inspect(dataOnSignMessage);
//             textLogger(dataOnSignMessage.toString());

//             break;
//           default:
//         }
//       }
//     }, onError: (err) {
//       // Handle exception by warning the user their action did not succeed
//     });
//   }

//   void textLogger(String text) {
//     if (logger.isEmpty) {
//       setState(() {
//         logger = '$text'
//             '\n'
//             '--------------------------------------------------------'
//             '\n';
//       });
//     } else {
//       setState(() {
//         logger = '$logger'
//             '$text'
//             '\n'
//             '--------------------------------------------------------'
//             '\n';
//       });
//       Future.delayed(const Duration(milliseconds: 500), () {
//         scrollController.animateTo(
//           scrollController.position.maxScrollExtent,
//           curve: Curves.easeOut,
//           duration: const Duration(milliseconds: 500),
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cluster = web3.Cluster.devnet;
//     final connection = web3.Connection(cluster);

//     void connectToWallet() {
//       try {
//         setState(() {
//           isLoading = true;
//           isButtonLoading = true;
//         });
//         Uri uri = phantom.generateConnectUri(
//             cluster: "devnet", redirect: "onConnect");
//         setState(() {
//           isLoading = false;
//           isButtonLoading = false;
//         });
//         launchUrl(
//           uri,
//           mode: LaunchMode.externalNonBrowserApplication,
//         );
//       } catch (e) {
//         setState(() {
//           isLoading = false;
//           isButtonLoading = false;
//         });
//         const ErrorDialog(
//           errorMessage: "error,  could not connect to wallet ",
//         );
//         textLogger("error, $e");
//       }
//     }

//     Future<web3.Transaction> createTransactionTransfer() async {
//       final transaction = web3.Transaction(
//           feePayer: phantom.phantomWalletPublicKey,
//           recentBlockhash: (await connection.getLatestBlockhash()).blockhash);
//       transaction.add(
//         SystemProgram.transfer(
//           fromPublicKey: phantom.phantomWalletPublicKey,
//           toPublicKey: phantom.phantomWalletPublicKey,
//           lamports: web3.solToLamports(1),
//         ),
//       );

//       return transaction;
//     }

//     void signAndSendTransaction() async {
//       try {
//         setState(() {
//           isLoading = true;
//           isButtonLoading = true;
//         });
//         web3.Transaction transaction = await createTransactionTransfer();

//         web3.Buffer transactionSerialize = transaction
//             .serialize(const web3.SerializeConfig(requireAllSignatures: false));

//         final url = phantom.generateSignAndSendTransactionUri(
//             transaction: transactionSerialize,
//             redirect: "onSignAndSendTransaction");
//         setState(() {
//           isLoading = false;
//           isButtonLoading = true;
//         });
//         launchUrl(
//           url,
//           mode: LaunchMode.externalNonBrowserApplication,
//         );
//       } catch (e) {
//         setState(() {
//           isLoading = false;
//           isButtonLoading = true;
//         });

//         GenericDialog().showSimplePopup(
//           context: context,
//           type: InfoBoxType.success,
//           content: "error,  make sure your connect to wallet",
//           onOkPressed: () {
//             Navigator.pop(context);
//           },
//         );
//         textLogger("error,  make sure your connect to wallet \n \n <<$e>> ");
//       }
//     }

//     void signAndSendTransactionToProgram() async {
//       try {
//         setState(() {
//           isLoading = true;
//         });
//         final web3.PublicKey programId = web3.PublicKey.fromString(
//             "DWX4sCH7wFiNPXDxyJBMCT5m84xXFznbhhq1rqi1Fxuk");

//         var instruction = web3.TransactionInstruction(
//           keys: [
//             web3.AccountMeta(
//               phantom.phantomWalletPublicKey,
//               isSigner: true,
//               isWritable: false,
//             )
//           ],
//           programId: programId,
//         );

//         final transaction = web3.Transaction(
//             feePayer: phantom.phantomWalletPublicKey,
//             recentBlockhash: (await connection.getLatestBlockhash()).blockhash);
//         transaction.add(instruction);

//         web3.Buffer transactionSerialize = transaction
//             .serialize(const web3.SerializeConfig(requireAllSignatures: false));
//         final url = phantom.generateSignAndSendTransactionUri(
//             transaction: transactionSerialize,
//             redirect: "onSignAndSendTransaction");
//         setState(() {
//           isLoading = false;
//         });
//         launchUrl(
//           url,
//           mode: LaunchMode.externalNonBrowserApplication,
//         );
//       } catch (e) {
//         setState(() {
//           isLoading = false;
//         });
//         GenericDialog().showSimplePopup(
//           context: context,
//           type: InfoBoxType.success,
//           content: "error,  make sure your connect to wallet",
//           onOkPressed: () {
//             Navigator.pop(context);
//           },
//         );
//         textLogger("error,  make sure your connect to wallet \n \n <<$e>> ");
//       }
//     }

//     void disconnectToPhantom() {
//       try {
//         setState(() {
//           isLoading = true;
//         });
//         var url = phantom.generateDisconnectUri(redirect: "onDisconnect");
//         setState(() {
//           isLoading = false;
//         });
//         launchUrl(
//           url,
//           mode: LaunchMode.externalNonBrowserApplication,
//         );
//       } catch (e) {
//         setState(() {
//           isLoading = false;
//         });
//         GenericDialog().showSimplePopup(
//           context: context,
//           type: InfoBoxType.success,
//           content: "error,  make sure your connect to wallet",
//           onOkPressed: () {
//             Navigator.pop(context);
//           },
//         );
//         textLogger("error,  you are not connect to wallet");
//       }
//     }

//     void signTransaction() async {
//       try {
//         setState(() {
//           isLoading = true;
//         });
//         final web3.PublicKey programId = web3.PublicKey.fromString(
//             "DWX4sCH7wFiNPXDxyJBMCT5m84xXFznbhhq1rqi1Fxuk");
//         var instruction = web3.TransactionInstruction(
//           keys: [
//             web3.AccountMeta(
//               phantom.phantomWalletPublicKey,
//               isSigner: true,
//               isWritable: false,
//             ),
//           ],
//           programId: programId,
//         );

//         final transaction = web3.Transaction(
//             feePayer: phantom.phantomWalletPublicKey,
//             recentBlockhash: (await connection.getLatestBlockhash()).blockhash);
//         transaction.add(instruction);

//         String transactionString = web3.base58Encode(transaction
//             .serialize(const web3.SerializeConfig(requireAllSignatures: false))
//             .asUint8List());

//         final url = phantom.generateSignTransactionUri(
//             transaction: transactionString, redirect: "onSignTransaction");
//         setState(() {
//           isLoading = false;
//         });
//         launchUrl(
//           url,
//           mode: LaunchMode.externalNonBrowserApplication,
//         );
//       } catch (e) {
//         setState(() {
//           isLoading = false;
//         });
//         textLogger("error,  make sure your connect to wallet \n \n <<$e>> ");
//       }
//     }

//     void signAllTransaction() async {
//       try {
//         setState(() {
//           isLoading = true;
//         });
//         web3.Transaction transaction1 = await createTransactionTransfer();
//         web3.Transaction transaction2 = await createTransactionTransfer();
//         List<web3.Transaction> transactions = [transaction1, transaction2];
//         List<String> serializeTransactions = transactions
//             .map(
//               (e) => web3.base58Encode(e
//                   .serialize(
//                       const web3.SerializeConfig(requireAllSignatures: false))
//                   .asUint8List()),
//             )
//             .toList();
//         final url = phantom.generateUriSignAllTransactions(
//             transactions: serializeTransactions,
//             redirect: "onSignAllTransaction");
//         setState(() {
//           isLoading = false;
//         });
//         launchUrl(
//           url,
//           mode: LaunchMode.externalNonBrowserApplication,
//         );
//       } catch (e) {
//         setState(() {
//           isLoading = false;
//         });
//         textLogger("error,  make sure your connect to wallet \n \n <<$e>> ");
//       }
//     }

//     void signMessage() {
//       try {
//         setState(() {
//           isLoading = true;
//         });
//         final url = phantom.generateSignMessageUri(
//             redirect: "onSignMessage", message: "hello from flutter");
//         setState(() {
//           isLoading = false;
//         });
//         launchUrl(
//           url,
//           mode: LaunchMode.externalNonBrowserApplication,
//         );
//       } catch (e) {
//         setState(() {
//           isLoading = false;
//         });
//         textLogger("error,  make sure your connect to wallet \n \n <<$e>> ");
//       }
//     }

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // const GetHelpRow(),
//         Image.asset(
//           ConstantString.meetConsellor,
//         ),
//         verticalSpacer(30),
//         SizedBox(
//           // height: 100,
//           child: Column(
//             children: [
//               const AnimatedSwitcher(
//                 duration: Duration(milliseconds: 300),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Text(
//                     'Match with a Counsellor',
//                     // key: ValueKey<String>(titleTexts[_currentPage]),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 24,
//                         color: CustomColors.blackTextColor),
//                   ),
//                 ),
//               ),
//               verticalSpacer(10),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 8.0),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: AnimatedSwitcher(
//                     duration: Duration(milliseconds: 300),
//                     child: Align(
//                       alignment: Alignment.topCenter,
//                       child: Text(
//                         'Fill in a questionnaire to get the best match for your needs',
//                         // key: ValueKey<String>(subTitleTexts[_currentPage]),
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             // fontWeight: FontWeight.w00,
//                             fontSize: 14,
//                             height: 1.4,
//                             color: CustomColors.greyTextColor),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         verticalSpacer(40),

//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: ref.watch(publicKeyProvider).isNotEmpty
//               ? NewCustomButton(
//                   title: "Pay 10 USDC to continue",
//                   onTap: () {
//                     _showBottomModal(context, () {
//                       Navigator.pop(context);
//                       signAndSendTransaction();
//                     });

//                     // Navigator.pushNamed(context, PseudonyminputScreen.routeName);
//                   })
//               : NewCustomButton(
//                   isLoading: isButtonLoading,
//                   title: "Connect Wallet",
//                   onTap: () async {
//                     connectToWallet();
//                     // setState(() {
//                     //   isButtonLoading = true;
//                     // });
//                     // // LOGIC TO CONNECT WALLET COMES HERE
//                     // await Future.delayed(const Duration(seconds: 2));
//                     // setState(() {
//                     //   isButtonLoading = false;
//                     // });
//                     ref.read(hasConnectedWalletProvider.notifier).state = true;
//                   }),
//         ),
//         verticalSpacer(30),
//       ],
//     );
//   }

//   void _showBottomModal(BuildContext context, void Function()? onProceedTap) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 1.sh * 0.5,
//           color: CustomColors.whiteColor,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     verticalSpacer(10),
//                     Container(
//                       height: 7,
//                       width: 35,
//                       decoration: BoxDecoration(
//                           color: CustomColors.modalGreyColor,
//                           borderRadius: BorderRadius.circular(12)),
//                     )
//                   ],
//                 ),
//                 Image.asset(
//                   ConstantString.usdcImg,
//                 ),
//                 Column(
//                   children: [
//                     const Text(
//                       'You’re about to pay 10 USDC',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: CustomColors.checkTextColor,
//                       ),
//                     ),
//                     verticalSpacer(10),
//                     const Text(
//                       'A debit will occur on your wallet',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: CustomColors.modalLightColor),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 1,
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: CustomBorderButton(
//                                       title: "Cancel",
//                                       onTap: () {
//                                         Navigator.pop(context);
//                                       }),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           horizontalSpacer(15),
//                           Expanded(
//                             flex: 2,
//                             child: NewCustomButton(
//                                 title: "Proceed", onTap: onProceedTap),
//                           ),
//                         ],
//                       ),
//                       verticalSpacer(40),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
