import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateSearch extends StatelessWidget {
  const DateSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('From Date'),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 160,
                    height: 32,
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.event_note),
                          labelText: '06/12/2021',
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          isDense: true),
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) =>
                          (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                      onDateSelected: (DateTime value) {
                        print(value);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('To Date'),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 160,
                    height: 32,
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.event_note),
                          labelText: '06/12/2021',
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          isDense: true),
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) =>
                          (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                      onDateSelected: (DateTime value) {
                        print(value);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Corporate Name'),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 160,
                    height: 32,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        isDense: true,
                          contentPadding:const EdgeInsets.only(left: 12,right: 4),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.0))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text('All'),
                          value: 'All',
                          style: TextStyle(color: Colors.black54),
                          isDense: false,
                          onChanged: (newValue) {},
                          items: {'All', 'Name One', 'Name Two'}.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 32,
              ),
              SizedBox(
                width: 120,
                height: 32,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Search'),
                  style: ElevatedButton.styleFrom(primary: Color(0xff00447b)),
                ),
              )
            ],
          ),
        ),
       InkWell(onTap: (){}, child: Container(
         height: 32,
         alignment: Alignment.center,
         child: Row(
           children: [
             Text('Refresh',style: TextStyle(color: Colors.black87),),
             SizedBox(width: 8,),
             SvgPicture.asset(
               'assets/icons/refresh.svg',
               color: Colors.black,
               height: 18,
             ),
             SizedBox(width: 32,),
           ],
         ),
       ),)
      ],
    );
  }
}
