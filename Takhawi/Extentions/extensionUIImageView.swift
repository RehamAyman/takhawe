//
//  extensionUIImageView.swift
//  Masar Ebdaa
//
//  Created by abdullah tarek on 19/09/2021.
//

import UIKit
import Kingfisher

extension UIImageView {

    func makeCircularPhoto(borderWidth width: CGFloat = 0.5, borderColor color: UIColor = .gray) {
        self.layer.borderWidth = width
        self.layer.masksToBounds = false
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }

    func makeRadiusImageView(borderWidth width: CGFloat, borderColor color: UIColor, cornerRadius radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }

    func setImage(image: String, loading: Bool? = true) {
//        if loading == true {
            self.kf.indicatorType = .activity
//        }
        self.kf.setImage(with: URL(string: image),
                         options: [.scaleFactor(UIScreen.main.scale),
                                   .transition(.none),
                                   .cacheOriginalImage],
                         progressBlock: nil) { (result) in

            switch result {
            case .success:
                print("image load successed")
            case .failure(let error):
                self.image = UIImage(named: "splashlogo")
                print("\(error.localizedDescription)")
            }
        }
    }

}

extension UIImage {

    func fixedOrientation() -> UIImage {
        // No-op if the orientation is already correct
        if imageOrientation == UIImage.Orientation.up {
            return self
        }

        // We need to calculate the proper transformation to make the image upright.
        // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
        var transform: CGAffineTransform = CGAffineTransform.identity

        if imageOrientation == UIImage.Orientation.down
            || imageOrientation == UIImage.Orientation.downMirrored {

            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: CGFloat(Double.pi))
        }

        if imageOrientation == UIImage.Orientation.left
            || imageOrientation == UIImage.Orientation.leftMirrored {

            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: CGFloat(Double.pi / 2))
        }

        if imageOrientation == UIImage.Orientation.right
            || imageOrientation == UIImage.Orientation.rightMirrored {

            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: CGFloat(-Double.pi / 2))
        }

        if imageOrientation == UIImage.Orientation.upMirrored
            || imageOrientation == UIImage.Orientation.downMirrored {

            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        }

        if imageOrientation == UIImage.Orientation.leftMirrored
            || imageOrientation == UIImage.Orientation.rightMirrored {

            transform = transform.translatedBy(x: size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        }

        // Now we draw the underlying CGImage into a new context, applying the transform
        // calculated above.
        let ctx: CGContext = CGContext(data: nil, width: Int(size.width), height: Int(size.height),
                                      bitsPerComponent: cgImage!.bitsPerComponent, bytesPerRow: 0,
                                      space: cgImage!.colorSpace!,
                                      bitmapInfo: cgImage!.bitmapInfo.rawValue)!

        ctx.concatenate(transform)

        if imageOrientation == UIImage.Orientation.left
            || imageOrientation == UIImage.Orientation.leftMirrored
            || imageOrientation == UIImage.Orientation.right
            || imageOrientation == UIImage.Orientation.rightMirrored {

            ctx.draw(cgImage!, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))

        } else {
            ctx.draw(cgImage!, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }

        // And now we just create a new UIImage from the drawing context
        let cgimg: CGImage = ctx.makeImage()!
        let imgEnd: UIImage = UIImage(cgImage: cgimg)

        return imgEnd
    }
}
