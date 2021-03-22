//
//  ViewController.swift
//  Photo_tutorial
//
//  Created by 김송현 on 2021/03/21.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileChangeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.profileImage.layer.cornerRadius = profileImage.frame.height/2
        self.profileChangeBtn.layer.cornerRadius = 10
        
        // 버튼 클릭 액션 설정
        self.profileChangeBtn.addTarget(self, action: #selector(onProfileChangeBtnClicked), for: .touchUpInside)
    }

    //프사 변경버튼 클릭할때
    @objc fileprivate func onProfileChangeBtnClicked(){
        //카메라 라이브러리 세팅
        var config = YPImagePickerConfiguration()
//        config.screens = [.library, .photo, .video]
        config.screens = [.library]
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
}

