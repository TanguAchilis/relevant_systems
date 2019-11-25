import 'package:flutter/material.dart';

class NormalInputField extends StatefulWidget {
  NormalInputField({
    this.labelText, this.onChanged, this.validator
  });
  final labelText;
  final String Function (String) validator;
  final void Function (String) onChanged;


  @override
  _NormalInputFieldState createState() => _NormalInputFieldState();
}

class _NormalInputFieldState extends State<NormalInputField> {
  bool focus=false;

  @override
  Widget build(BuildContext context) {
    var  screensize=MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey)
      ),
      child: Container(
         padding: EdgeInsets.only(left: screensize.width/50),
        height: screensize.height/10,
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: focus?Theme.of(context).primaryColorDark:Colors.transparent,width:10 ))
        ),
        child: TextFormField(
          onTap: (){
            setState(() {
              focus=true;
              
            });
          },
           validator: widget.validator,
          onChanged: widget.onChanged,
          
          onEditingComplete: (){
            setState(() {
            focus=false;
          });
          FocusScope.of(context).unfocus();} ,
          decoration: InputDecoration(
            labelText: widget.labelText,
             border: InputBorder.none,
          ),
        
        ),
      ),
    );
  }
}