import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(this.data, this.mine);

  final Map<String, dynamic> data;
  final bool mine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          !mine
              ? Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(data["senderPhotoUrl"])),
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                data["imgUrl"] != null
                    ? Image.network(
                        data["imgUrl"],
                        width: 250,
                      )
                    : Text(
                        data["text"],
                        style: TextStyle(fontSize: 16),
                        textAlign: mine ? TextAlign.end : TextAlign.start,
                      ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    data["senderName"],
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                mine
                    ? Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(data["senderPhotoUrl"])),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
