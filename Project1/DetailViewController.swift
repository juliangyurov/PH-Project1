//
//  DetailViewController.swift
//  Project1
//
//  Created by Yulian Gyuroff on 17.09.23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedNumber: Int?
    var numberImages: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        //title = selectedImage
        if let selNum = selectedNumber, let numImg = numberImages{
            title = "Picture \(selNum+1) of \(numImg)"
        }else{
            title = selectedImage
        }
        //selectedImage = nil
        //assert(((selectedImage?.isEmpty) != nil), "selecteImage is nil")
        assert(selectedImage != nil, "selectedImage is nil")
        assert(!selectedImage!.isEmpty,"selectedImage is empty")
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped(){
        let vc = UIActivityViewController(activityItems: ["Check my app Project1"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
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
