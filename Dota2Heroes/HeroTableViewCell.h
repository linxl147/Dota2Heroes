//
//  HeroTableViewCell.h
//  Dota2Heroes
//
//  Created by 林先龙 on 16/2/21.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@end
