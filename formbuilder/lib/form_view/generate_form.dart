import 'package:cumulations_form_annotations/cumulations_form_annotations.dart';
import 'package:flutter/material.dart';
part "generate_form.g.dart"; // add this line at the top of the file

@FormGenerate("Test feilds")
class TextFieldsView {
  @Field("Full name", FieldType.TextInput)
  String? fname;
  @Field("Email", FieldType.TextInput)
  String? emailId;
  TextFieldsView({this.fname, this.emailId, this.gender});
  @Field("Gender", FieldType.SingleSelect, requiredFiled: true)
  @Options(options: {1: "Male", 2: "Female"})
  int? gender;
}
