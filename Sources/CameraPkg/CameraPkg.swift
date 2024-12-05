// The Swift Programming Language
// https://docs.swift.org/swift-book

#if os(iOS)
import UIKit

public protocol CameraDelegate: AnyObject {
    func didCaptureImage(_ image: UIImage)
    func didCancelCamera()
}

public class CameraViewController: UIViewController {
    public weak var delegate: CameraDelegate?

    override public func viewDidLoad() {
        super.viewDidLoad()
        openCamera()
    }

    private func openCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            delegate?.didCaptureImage(image)
        }
        picker.dismiss(animated: true, completion: nil)
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        delegate?.didCancelCamera()
        picker.dismiss(animated: true, completion: nil)
    }
}
#endif

