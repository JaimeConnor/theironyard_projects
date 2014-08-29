//
//  MCSTableViewCell.m
//  My Cool Spots
//
//  Created by Jaime Connor on 8/18/14.
//  Copyright (c) 2014 Jaime Connor. All rights reserved.
//

#import "MCSTableViewCell.h"

@implementation MCSTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setCoolSpotInfo:(NSDictionary *)coolSpotInfo
{
    _coolSpotInfo = coolSpotInfo;
//
//    NSURL * url = [NSURL URLWithString:coolSpotInfo[@"avatar_url"]];
    
    //NSURL * purl = [NSURL URLWithString:friendInfo[@"html_url"]];
    
//    NSData * data = [NSData dataWithContentsOfURL:url];
//
//    UIImage * image = [UIImage imageWithData:data];
//    
//    //NSData * pdata = [NSData dataWithContentsOfURL:purl];
//    
//    //UIWebView * pWebView = [UIWebViewNavigationTypeLinkClicked];
//    
//    
//    
//    friendImage.image = image;
//    
//    friendName.text = friendInfo[@"name"];
//    friendName.font = [UIFont fontWithName:@"HelveticaNeue-Ultralight" size:19.0];
//    
//    locationName.text = friendInfo[@"location"];
//    locationName.font = [UIFont fontWithName:@"Helvetica-light" size:12.0];
//    
//    //Turn NSString.text into NSNumber
//    
//    followers.text = friendInfo[@"followers"];
//    followers.font = [UIFont fontWithName:@"Helvetica-light" size:15.0];
//    
//    following.text = friendInfo[@"following"];
//    following.font = [UIFont fontWithName:@"Helvetica-light" size:15.0];
//    
//    NSLog(@"%@",friendInfo);
//    
//    if (friendInfo[@"followers"] > friendInfo[@"following"])
//    {
//        rightFollowerCircle.layer.borderColor = [[UIColor colorWithRed:50.0/255 green:248.0/255 blue:192.0/255 alpha:1.0] CGColor];
//        
//        [self.contentView addSubview:rightFollowerCircle];
//        
//        UIImage * leftFollowerCircleUpArrow = [UIImage imageNamed:@"upArrow"];
//        
//        [leftFollowerCircle setImage:leftFollowerCircleUpArrow forState:UIControlStateNormal];
//        
//        leftFollowerCircle.backgroundColor = [UIColor colorWithRed:58.0/255 green:58.0/255 blue:58.0/255 alpha:1.0];
//        
//        [self.contentView addSubview:leftFollowerCircle];
//        
    }
//
//    if (friendInfo[@"followers"] < friendInfo[@"following"])
//    {
//        rightFollowerCircle.layer.borderColor = [[UIColor colorWithRed:247.0/255 green:33.0/255 blue:88.0/255 alpha:1.0] CGColor];
//        [self.contentView addSubview:rightFollowerCircle];
//        
//        UIImage * leftFollowerCircleDownArrow = [UIImage imageNamed:@"downArrow"];
//        
//        [leftFollowerCircle setImage:leftFollowerCircleDownArrow forState:UIControlStateNormal];
//        
//        leftFollowerCircle.backgroundColor = [UIColor colorWithRed:58.0/255 green:58.0/255 blue:58.0/255 alpha:1.0];
//        
//        [self.contentView addSubview:leftFollowerCircle];
//        
//    }
//    
//    if (friendInfo[@"followers"] == friendInfo[@"following"])
//    {
//        rightFollowerCircle.backgroundColor = [UIColor colorWithRed:58.0/255 green:58.0/255 blue:58.0/255 alpha:1.0];
//        rightFollowerCircle.layer.borderColor = [[UIColor colorWithRed:128.0/255 green:128.0/255 blue:128.0/255 alpha:1.0] CGColor];
//        [self.contentView addSubview:rightFollowerCircle];
//        
//        leftFollowerCircle.backgroundColor = [UIColor colorWithRed:128.0/255 green:128.0/255 blue:128.0/255 alpha:1.0];
//        [self.contentView addSubview:leftFollowerCircle];
//        
//    }
//}
//
//
//
//
//- (void)profileClicked {
//    
//    NSLog(@"Profile Button Clicked");
//    
//    GFAViewController * profileClicked = [[GFAViewController alloc] init];
//    
//    [self.navigationController pushViewController:profileClicked animated:YES];
//    
//    profileClicked.friendInfo = self.friendInfo;
//    
//    
//    // push a new viewcontroller to the navigationcontroller
//    
//    // set viewcontroller friendInfo = self.friendInfo
//    
//}
//
//- (void)gistClicked
//{
//    GFAViewController * gistClicked = [[GFAViewController alloc] init];
//    
//    NSString * gistURL = [NSString stringWithFormat:@"https://gist.github.com/%@",self.friendInfo[@"login"]];
//    
//    gistClicked.friendInfo = @{@"html_url":gistURL};
//    
//    [self.navigationController pushViewController:gistClicked animated:YES];
//}



- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
