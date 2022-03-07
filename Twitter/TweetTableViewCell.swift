//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Mia Elena on 2/28/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var retweetOutlet: UIButton!
    @IBOutlet weak var favoriteOutlet: UIButton!
    
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    //Function associated with retweet and favorite buttons
    func setRetweeted(_ isRetweeted: Bool){
        if (isRetweeted){
            retweetOutlet.setImage(UIImage(named: "retweet-icon-green"), for:
                                    UIControl.State.normal)
            retweetOutlet.isEnabled = false
        } else {
            retweetOutlet.setImage(UIImage(named: "retweet-icon"), for:
                                    UIControl.State.normal)
            retweetOutlet.isEnabled = true
        }
    }
    
    @IBAction func retweetButton(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error in retweeting: \(error)")
        })
        
    }
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited) {
            favoriteOutlet.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
            
        } else {
            favoriteOutlet.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
