//
//  ViewController.swift
//  ImagePicker-Demo
//
//  Created by 黄海燕 on 2020/7/16.
//  Copyright © 2020 Herriat. All rights reserved.
//

import UIKit
import AVKit


class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    //懒加载图片控制器
    lazy var imagePickerCon:UIImagePickerController = {
        let imagePickerController = UIImagePickerController.init()
        //设置代理
        imagePickerController.delegate = self
        //指定图片控制器类型
        imagePickerController.sourceType = .photoLibrary
//        imagePickerController.mediaTypes = [kUTTypeImage as String]
        //设置不需要编辑
        imagePickerController.allowsEditing = false
        return imagePickerController;
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClick(_ sender: Any) {
        //通过摄像头来采集
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.imagePickerCon.sourceType = .camera
        }else{
            //通过图片库来采集
            self.imagePickerCon.sourceType = .photoLibrary
        }
        self.present(self.imagePickerCon, animated: true, completion: nil)
    }
    
}

extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    //完成采集图片后的回调处理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    //取消采集图片的处理
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
