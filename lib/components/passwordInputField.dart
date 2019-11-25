import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
 PasswordInputField({
    this.labelText,this.validator, this.onChanged, this.onEditingComplete
  });
  final String labelText;
  final String Function (String) validator;
  final void Function (String) onChanged;
  final void Function () onEditingComplete;

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  
  bool hidePassword = true;
  bool focus=false;

  @override
  Widget build(BuildContext context) {
     var screensize = MediaQuery.of(context).size;
    return Container(
      
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
      child: Container(
        padding: EdgeInsets.only(left: screensize.width/40),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: focus?Theme.of(context).primaryColor:Colors.transparent,width:10 ))
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
          obscureText: hidePassword,
          decoration: InputDecoration(
           
            labelText: widget.labelText,
             border: InputBorder.none,
             suffixIcon: IconButton(
               color:Theme.of(context).accentColor,
               icon:  hidePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
               onPressed: (){
                 setState(() {
                  
                   hidePassword=!hidePassword;
                 });
               },
             )
          ),
        
        ),
      ),
    )
    ;
  }
}