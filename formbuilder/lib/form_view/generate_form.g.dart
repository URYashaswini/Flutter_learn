// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'generate_form.dart';
// **************************************************************************
// FormGenerator
// **************************************************************************
extension GeneratedModel on TextFieldsView {
      static Map<String, dynamic> formData = <String, dynamic>{};
  static final formKey = GlobalKey<FormState>();
                              getView() {
                              return _FormWidget(data: this);
                              }

                              getFormData() {
                                if (formKey.currentState?.validate() ?? false) {
                                  return formData;
                                }
                              }
                              
                              TextFieldsView fromMap(Map<String, dynamic> json) {
                                return TextFieldsView(
                                  fname: json['fname'],
emailId: json['emailId'],
gender: json['gender'],
                                );
                              }
                              
Map<dynamic, String> getgenderEntry() {
        return {1: "Male", 2: "Female"};
        }
}
class _FormWidget extends StatefulWidget {
                            _FormWidget({Key? key, required this.data}) : super(key: key);
                            TextFieldsView data;

                            @override
                            State<_FormWidget> createState() => _FormWidgetState();
                          }
class _FormWidgetState extends State<_FormWidget> {
String? fname;
String? emailId;
dynamic gender;
                         @override
                         void initState() {
fname = widget.data.fname != null ? widget.data.fname.toString() : null;
                    GeneratedModel.formData["fname"] = fname;
emailId = widget.data.emailId != null ? widget.data.emailId.toString() : null;
                    GeneratedModel.formData["emailId"] = emailId;
gender = widget.data.gender != null ? widget.data.gender : null;
                    GeneratedModel.formData["gender"] = gender;
}
@override
  Widget build(BuildContext context) {
    var maxWidth = 200.0;
return Form(
      key: GeneratedModel.formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          "Test feilds",
          style: TextStyle(color: Colors.blue),
          textAlign: TextAlign.left,
        ),
      ),
LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth >= (maxWidth*3)) {
                  var ratio = constraints.maxWidth/220;
                  return buildWithGridRow(3,ratio,constraints.maxWidth);
                } else if(constraints.maxWidth < (maxWidth*3) && constraints.maxWidth >= (maxWidth*2)) {
                  var ratio = constraints.maxWidth/140;
                  return buildWithGridRow(2,ratio,constraints.maxWidth);
                }else {
                  var ratio = constraints.maxWidth/100;
                  // if(ratio>2.5) ratio+=3;
                  // else if(ratio>1.5) ratio+=2;
                  // else ratio+=1;
                  return buildWithGridRow(1,ratio,constraints.maxWidth);
                }
              },
            ),
])
);
}
buildWithGridRow(int crossAxisCount,double childAspectRatio,double width){
    return GridView.count(
          crossAxisSpacing: 8,
          mainAxisSpacing: 0,
          padding: EdgeInsets.all(8),
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          physics: NeverScrollableScrollPhysics(),
      shrinkWrap : true,
          children: <Widget>[
//FieldType.TextInput
Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Container(
              width:(width/crossAxisCount)-50,
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: "Full name",
                    style: TextStyle(color: Colors.grey),
                    children: []),
              ),
            ),
          TextFormField(
            initialValue: fname,
            textInputAction: TextInputAction.next,
            // decoration: InputDecoration(hintText: "hint"),
            onChanged: (value) {
              setState(() {
            fname = value;
            GeneratedModel.formData["fname"] = value;
          });
            },
            
          ),
        ],
      ),
//FieldType.TextInput
Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Container(
              width:(width/crossAxisCount)-50,
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: "Email",
                    style: TextStyle(color: Colors.grey),
                    children: []),
              ),
            ),
          TextFormField(
            initialValue: emailId,
            textInputAction: TextInputAction.next,
            // decoration: InputDecoration(hintText: "hint"),
            onChanged: (value) {
              setState(() {
            emailId = value;
            GeneratedModel.formData["emailId"] = value;
          });
            },
            
          ),
        ],
      ),
//FieldType.SingleSelect
Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width:(width/crossAxisCount)-50,
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: "Gender",
                    style: TextStyle(color: Colors.grey),
                    children: [TextSpan(
        text: "*", 
        style: TextStyle(color: Colors.red)),]),
              ),
            ),
DropdownButtonFormField(
        isExpanded: true,
        value: gender,
        items: widget.data
            .getgenderEntry().entries
            .map((e) => DropdownMenuItem(
                  value: e.key,
                  child: Text(e.value),
                ))
            .toList(),
        onChanged: (val) {
          setState(() {
            gender = val;
            GeneratedModel.formData["gender"] = val;
          });
        },
        validator: (data) {
                    if (data == null) return "Select Gender";

                    return null;
                  },
      ),
      ]),
],);
    }
}

