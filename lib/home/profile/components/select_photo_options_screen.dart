import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectPhotoOptionsScreen extends StatelessWidget {

  final Function(ImageSource source) onTap;

  const SelectPhotoOptionsScreen({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.shade300,
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [


            ElevatedButton(onPressed: ()=>onTap(ImageSource.gallery),
                child: Text("Browse Gallery")),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'OR',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: ()=>onTap(ImageSource.camera),
                child: Text("Use a Camera")),
          ])
        ],
      ),
    );
  }
}
