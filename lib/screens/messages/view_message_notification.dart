import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sme_app_aluno/controllers/messages.controller.dart';
import 'package:sme_app_aluno/models/message/message.dart';
import 'package:sme_app_aluno/screens/not_internet/not_internet.dart';
import 'package:sme_app_aluno/screens/students/list_studants.dart';
import 'package:sme_app_aluno/screens/widgets/buttons/eaicon_button.dart';
import 'package:sme_app_aluno/screens/widgets/cards/index.dart';
import 'package:sme_app_aluno/utils/conection.dart';
import 'package:sme_app_aluno/utils/date_format.dart';
import 'package:sme_app_aluno/utils/storage.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewMessageNotification extends StatefulWidget {
  final Message message;
  final int codigoAlunoEol;

  ViewMessageNotification(
      {@required this.message, @required this.codigoAlunoEol});

  @override
  _ViewMessageNotificationState createState() =>
      _ViewMessageNotificationState();
}

class _ViewMessageNotificationState extends State<ViewMessageNotification> {
  final Storage storage = Storage();
  MessagesController _messagesController;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool messageIsRead = true;

  @override
  void initState() {
    super.initState();
    _messagesController = MessagesController();
    _viewMessageUpdate(false);
  }

  _viewMessageUpdate(bool isNotRead) async {
    int usuarioId = await storage.readValueIntStorage("current_user_id");
    _messagesController.updateMessage(
        notificacaoId: widget.message.id,
        usuarioId: usuarioId,
        codigoAlunoEol: widget.codigoAlunoEol,
        mensagemVisualia: true);
  }

  Future<bool> _confirmDeleteMessage(int id) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Atenção"),
            content: Text("Você tem certeza que deseja excluir esta mensagem?"),
            actions: <Widget>[
              FlatButton(
                  child: Text("SIM"),
                  onPressed: () {
                    _removeMesageToStorage(id);
                    Navigator.of(context).pop(false);
                    Navigator.pop(context);
                  }),
              FlatButton(
                child: Text("NÃO"),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              )
            ],
          );
        });
  }

  _navigateToListMessage() async {
    String token = await storage.readValueStorage("token");
    String cpf = await storage.readValueStorage("current_cpf");
    String password = await storage.readValueStorage("current_cpf");

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ListStudants(
                  cpf: cpf,
                  password: password,
                  token: token,
                )));
  }

  Future<bool> _confirmNotReadeMessage(int id, scaffoldKey) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Atenção"),
            content: Text(
                "Você tem certeza que deseja marcar esta mensagem como não lida?"),
            actions: <Widget>[
              FlatButton(
                  child: Text("SIM"),
                  onPressed: () {
                    _viewMessageUpdate(true);
                    Navigator.of(context).pop(false);
                    var snackbar = SnackBar(
                        content: Text("Mensagem marcada como não lida"));
                    scaffoldKey.currentState.showSnackBar(snackbar);
                    setState(() {
                      messageIsRead = !messageIsRead;
                    });
                  }),
              FlatButton(
                child: Text("NÃO"),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              )
            ],
          );
        });
  }

  _removeMesageToStorage(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> ids = [];
    String currentName = prefs.getString("current_name");
    String json = prefs.getString("${currentName}_deleted_id");
    if (json != null) {
      ids = jsonDecode(json).cast<String>();
    }
    ids.add(id.toString());
    prefs.setString("${currentName}_deleted_id", jsonEncode(ids));
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.Offline) {
      BackgroundFetch.stop().then((int status) {
        print('[BackgroundFetch] stop success: $status');
      });
      return NotInteernet();
    } else {
      var size = MediaQuery.of(context).size;
      var screenHeight =
          (size.height - MediaQuery.of(context).padding.top) / 100;
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xffE5E5E5),
        appBar: AppBar(
          title: Text("Mensagens"),
          backgroundColor: Color(0xffEEC25E),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                _navigateToListMessage();
              }),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(screenHeight * 2.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: screenHeight * 2.5,
                ),
                AutoSizeText(
                  "MENSAGEM",
                  style: TextStyle(
                      color: Color(0xffDE9524), fontWeight: FontWeight.w500),
                ),
                CardMessage(
                  headerTitle: widget.message.categoriaNotificacao,
                  categoriaNotificacao: widget.message.categoriaNotificacao,
                  headerIcon: false,
                  recentMessage: false,
                  content: <Widget>[
                    Container(
                      width: screenHeight * 40,
                      child: AutoSizeText(
                        widget.message.titulo,
                        maxFontSize: 16,
                        minFontSize: 14,
                        maxLines: 5,
                        style: TextStyle(
                            color: Color(0xff666666),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 1.8,
                    ),
                    Container(
                      width: screenHeight * 41,
                      child: Html(
                        data: widget.message.mensagem,
                        onLinkTap: (url) => _launchURL(url),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 3,
                    ),
                    AutoSizeText(
                      DateFormatSuport.formatStringDate(
                          widget.message.criadoEm, 'dd/MM/yyyy'),
                      maxFontSize: 16,
                      minFontSize: 14,
                      maxLines: 2,
                      style: TextStyle(
                          color: Color(0xff666666),
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                  footer: true,
                  footerContent: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          EAIconButton(
                            iconBtn: Icon(
                              FontAwesomeIcons.trashAlt,
                              color: Color(0xffC65D00),
                            ),
                            screenHeight: screenHeight,
                            onPress: () =>
                                _confirmDeleteMessage(widget.message.id),
                          ),
                          SizedBox(
                            width: screenHeight * 2,
                          ),
                          Visibility(
                            visible: messageIsRead,
                            child: EAIconButton(
                                iconBtn: Icon(
                                  FontAwesomeIcons.envelope,
                                  color: Color(0xffC65D00),
                                ),
                                screenHeight: screenHeight,
                                onPress: () => _confirmNotReadeMessage(
                                    widget.message.id, scaffoldKey)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Container(
                        height: screenHeight * 6,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffC65D00), width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenHeight * 3),
                          ),
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            _navigateToListMessage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              AutoSizeText(
                                "VOLTAR",
                                maxFontSize: 16,
                                minFontSize: 14,
                                style: TextStyle(
                                    color: Color(0xffC65D00),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: screenHeight * 1,
                              ),
                              Icon(
                                FontAwesomeIcons.angleLeft,
                                color: Color(0xffffd037),
                                size: screenHeight * 4,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
