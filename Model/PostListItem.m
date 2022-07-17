//
//  PostListItem.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "PostListItem.h"

@implementation PostListItem

- (void)PostWeiboDataDictionary:(NSDictionary *)dictionary{
    
    self.myimage=[dictionary objectForKey:@"thumbnail_pic"];
    self.mycreated_at=[dictionary objectForKey:@"created_at"];
    self.mysource=[dictionary objectForKey:@"source"];
    self.mytext=[dictionary objectForKey:@"text"];
    self.myprofile_image_url=[dictionary objectForKey:@"profile_image_url"];
    self.myscreen_name=[dictionary objectForKey:@"screen_name"];
    
    self.myreposts_count=[dictionary objectForKey:@"myreposts_count"];
    self.mycomments_count=[dictionary objectForKey:@"mycomments_count"];
    self.myattitudes_count=[dictionary objectForKey:@"myattitudes_count"];

}

@end
