//
//  GetListItem.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "GetListItem.h"

@implementation GetListItem

//微博内容转模型
- (void)WeiboconfigWithDictionary:(NSDictionary *)dictionary{
    /**微博内容信息*/
    self.created_at=[dictionary objectForKey:@"created_at"];
    self.source=[dictionary objectForKey:@"source"];
    self.text=[dictionary objectForKey:@"text"];
    self.thumbnail_pic=[dictionary objectForKey:@"thumbnail_pic"];
    self.bmiddle_pic=[dictionary objectForKey:@"bmiddle_pic"];
    self.original_pic=[dictionary objectForKey:@"original_pic"];
    self.reposts_count=[dictionary objectForKey:@"reposts_count"];
    self.comments_count=[dictionary objectForKey:@"comments_count"];
    self.attitudes_count=[dictionary objectForKey:@"attitudes_count"];
    self.ID=[dictionary objectForKey:@"id"];
    self.pic_urls=[dictionary objectForKey:@"pic_urls"];
    /**用户信息*/
    self.screen_name=[[dictionary objectForKey:@"user"] objectForKey:@"screen_name"];
    self.location=[[dictionary objectForKey:@"user"] objectForKey:@"location"];
    self.describe=[[dictionary objectForKey:@"user"] objectForKey:@"description"];
    self.profile_image_url=[[dictionary objectForKey:@"user"] objectForKey:@"profile_image_url"];
    self.gender=[[dictionary objectForKey:@"user"] objectForKey:@"gender"];
    self.followers_count=[[dictionary objectForKey:@"user"] objectForKey:@"followers_count"];
    self.friends_count=[[dictionary objectForKey:@"user"] objectForKey:@"friends_count"];
    self.statuses_count=[[dictionary objectForKey:@"user"] objectForKey:@"statuses_count"];
    self.favourites_count=[[dictionary objectForKey:@"user"] objectForKey:@"favourites_count"];
    self.created_atuser=[[dictionary objectForKey:@"user"] objectForKey:@"created_atuser"];
    self.verified=[[dictionary objectForKey:@"user"] objectForKey:@"verified"];
}

//微博评论转模型
- (void)CommentconfigwithDictionary:(NSDictionary *)dictionary{
    /**评论信息*/
    self.COMprofile_image_url=[[dictionary objectForKey:@"user"] objectForKey:@"profile_image_url"];
    self.COMscreen_name=[[dictionary objectForKey:@"user"] objectForKey:@"screen_name"];
    self.COMcreated_at=[dictionary objectForKey:@"created_at"];
    self.COMsource=[dictionary objectForKey:@"source"];
    self.COMtext=[dictionary objectForKey:@"text"];
}



@end
