//
//  FullSizeImageViewController.swift
//  MVCMVVM
//
//  Created by Macbook on 10/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import UIKit

class FullSizeImageViewController: UIViewController {
    var image:Image!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
      _ =  image.getImage { (Image) in
            DispatchQueue.main.async { [weak self] in
                self?.imageView.image = Image
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
