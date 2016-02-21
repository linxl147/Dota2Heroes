//
//  AbilityTableViewCell.h
//  Dota2Heroes
//
//  Created by 林先龙 on 16/2/21.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AbilityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *abilityImageView;
@property (weak, nonatomic) IBOutlet UILabel *abilityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *abilityDetailLabel;

@end
