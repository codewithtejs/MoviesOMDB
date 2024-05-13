//
//  MovieTableViewCell.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import UIKit
import SDWebImage

protocol MovieCellDelegate {
    func didPressButton(_ tag: Int)
}

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var btnAction: UIButton!
    
    // MARK: - Properties
    var cellDelegate: MovieCellDelegate?
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Public Methods
    func setupCell(_ vm: MovieViewModel) {
        self.lblTitle.text = vm.title
        self.lblYear.text = vm.year
        self.imgPoster.sd_setImage(with: URL(string: vm.poster))
        self.btnAction.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    // MARK: - Action
    @objc func buttonPressed(_ sender: UIButton) {
        cellDelegate?.didPressButton(sender.tag)
    }
    
    // MARK: - Override Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
