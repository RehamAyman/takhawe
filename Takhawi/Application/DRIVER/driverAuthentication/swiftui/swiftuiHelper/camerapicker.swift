//
//  camerapicker.swift
//  Takhawi
//
//  Created by Reham Ayman on 03/02/2024.
//

import SwiftUI



struct imageCameraModel  {
    let image : UIImage
    let url : URL
}


struct CameraPickerView: UIViewControllerRepresentable {
    
    private var sourceType: UIImagePickerController.SourceType = .camera
    private let onImagePicked: (imageCameraModel) -> Void
    
    @Environment(\.presentationMode) private var presentationMode
    
    public init(onImagePicked: @escaping (imageCameraModel) -> Void) {
        self.onImagePicked =   onImagePicked
    }
    
    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = self.sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(
            onDismiss: { self.presentationMode.wrappedValue.dismiss() },
            onImagePicked: self.onImagePicked
        )
    }
    
    
    
    final public class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        private let onDismiss: () -> Void
        private let onImagePicked: (imageCameraModel) -> Void
        
        init(onDismiss: @escaping () -> Void, onImagePicked: @escaping (imageCameraModel ) -> Void) {
            self.onDismiss = onDismiss
            self.onImagePicked = onImagePicked
        }
        
        
        public func imagePickerController(_ picker: UIImagePickerController,
                                          didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                let imageUrl = info[.imageURL] as? URL
                let imgName = imageUrl?.lastPathComponent ?? ""
                let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
                let localPath = documentDirectory?.appending(imgName)
                let imag = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
                let data = imag.pngData()! as NSData
                      data.write(toFile: localPath!, atomically: true)
                      //let imageData = NSData(contentsOfFile: localPath!)!
                      let photoURL = URL.init(fileURLWithPath: localPath!)//NSURL(fileURLWithPath: localPath!)
                print("------------------")
                print(photoURL)
                    
                
                
                self.onImagePicked(imageCameraModel(image: image , url:  photoURL))
            }
            self.onDismiss()
        }
        public func imagePickerControllerDidCancel(_: UIImagePickerController) {
            self.onDismiss()
        }
    }
}
