//
//  ViewController.swift
//  DPIconFontExample-Swift
//
//  Created by 张鹏 on 2021/1/14.
//

import UIKit
import DPIconFont

class ViewController: UIViewController {
    
    /// 文本
    @IBOutlet weak var textLabel: UILabel!
    
    /// 图片
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textLabel.font = ICFFont(66)
        self.textLabel.text = "\u{e602}"
        self.imageView.image = ICFSymbolImage("\u{e602}", 100)
    }
}

