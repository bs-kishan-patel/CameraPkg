#if os(iOS)

import UIKit
public class CameraHandler {
    public static func presentCamera(from viewController: UIViewController, delegate: CameraDelegate) {
        let cameraVC = CameraViewController()
        cameraVC.delegate = delegate
        viewController.present(cameraVC, animated: true, completion: nil)
    }
}
#endif
