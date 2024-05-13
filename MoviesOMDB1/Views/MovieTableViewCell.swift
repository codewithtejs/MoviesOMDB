//
//  MovieTableViewCell.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import UIKit
import SDWebImage
class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var btnAction: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(_ vm : MovieViewModel){
        self.lblTitle.text = vm.title
        self.lblYear.text = vm.year
        self.imgPoster.sd_setImage(with: URL(string: vm.poster))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
