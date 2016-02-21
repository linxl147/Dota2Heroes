//
//  DetailTableViewController.m
//  Dota2Heroes
//
//  Created by 林先龙 on 16/2/21.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "DetailTableViewController.h"
#import "AbilityTableViewCell.h"
#import "BioTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface DetailTableViewController ()
{
    NSString *docPath;
}

@property NSString *heroBio;
@property (weak, nonatomic) IBOutlet UIImageView *heroFullImageView;
@property NSURL *heroFullImageURL;
@property NSMutableDictionary *abilityList;


@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
#pragma mark -- full Image --

    self.heroFullImageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://cdn.dota2.com.cn/apps/dota2/images/heroes/%@_vert.jpg", self.heroName]];
    
    [self.heroFullImageView sd_setImageWithURL:self.heroFullImageURL];
    
#pragma mark -- Bio --
    self.heroBio =[NSDictionary dictionaryWithContentsOfFile:[docPath stringByAppendingPathComponent:@"HeroesDetail.plist"]][self.heroName][@"bio"];
    
#pragma mark -- ability --
    
    NSDictionary *allAbility = [NSDictionary dictionaryWithContentsOfFile:[docPath stringByAppendingPathComponent:@"Ability.plist"]];
    self.abilityList = [NSMutableDictionary dictionary];
    
    for (NSString *name in allAbility) {
        if ([name hasPrefix:[self.heroName stringByAppendingString:@"_"]])
        {
            [self.abilityList setObject:allAbility[name] forKey:name];
        }
    }
    
#pragma mark -- UI -- 
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Ability";
    } else{
        return @"Bio";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return self.abilityList.count;
    } else{
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        AbilityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AbilityCell" forIndexPath:indexPath];
        cell.abilityNameLabel.text = self.abilityList[[self.abilityList allKeys][indexPath.row]][@"dname"];
        cell.abilityDetailLabel.text = self.abilityList[[self.abilityList allKeys][indexPath.row]][@"desc"];
        cell.abilityDetailLabel.numberOfLines = 0;
        
        
        NSURL *abillityImageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://cdn.dota2.com/apps/dota2/images/abilities/%@_hp2.png", [self.abilityList allKeys][indexPath.row]]];
        NSLog(@"%@", abillityImageURL);
        
        [cell.abilityImageView sd_setImageWithURL:abillityImageURL];
        
        return cell;
    } else{
        BioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BioCell" forIndexPath:indexPath];
        cell.textLabel.text = self.heroBio;
        cell.textLabel.numberOfLines = 0;
        return cell;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
