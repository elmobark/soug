//
//  proCell.swift
//  Soug
//
//  Created by Mobark on 21/12/2019.
//  Copyright © 2019 Mobark. All rights reserved.
//

import UIKit

class proCell: UITableViewCell {

    @IBOutlet weak var mark: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var aprox: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var imagev: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func inition(pro:Product){
        name.text = pro.name
        city.text = pro.city
        state.text = pro.status
        aprox.text = pro.ask
        price.text = pro.price
        mark.text = pro.mark
        imagev.downloaded(from: utils().BASE_IMAGE+pro.image)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        print(link)
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
