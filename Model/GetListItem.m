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
    self.text_raw=[dictionary objectForKey:@"text_raw"];

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
    self.uid=[[dictionary objectForKey:@"user"] objectForKey:@"id"];

}
//微博评论转模型
- (void)CommentconfigwithDictionary:(NSDictionary *)dictionary{
    /**评论信息*/
    self.COMprofile_image_url=[[dictionary objectForKey:@"user"] objectForKey:@"profile_image_url"];
    self.COMscreen_name=[[dictionary objectForKey:@"user"] objectForKey:@"screen_name"];
    self.COMcreated_at=[dictionary objectForKey:@"created_at"];
    self.COMsource=[dictionary objectForKey:@"source"];
    self.COMtext=[dictionary objectForKey:@"text"];
    self.COMtext_raw=[dictionary objectForKey:@"text_raw"];

}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.created_at forKey:@"created_at"];
    [coder encodeObject:self.source forKey:@"source"];
    [coder encodeObject:self.text forKey:@"text"];
    [coder encodeObject:self.text_raw forKey:@"text_raw"];
    [coder encodeObject:self.thumbnail_pic forKey:@"thumbnail_pic"];
    [coder encodeObject:self.bmiddle_pic forKey:@"bmiddle_pic"];
    [coder encodeObject:self.original_pic forKey:@"original_pic"];
    [coder encodeObject:self.reposts_count forKey:@"reposts_count"];
    [coder encodeObject:self.comments_count forKey:@"comments_count"];
    [coder encodeObject:self.attitudes_count forKey:@"attitudes_count"];
    [coder encodeObject:self.ID forKey:@"ID"];
    [coder encodeObject:self.pic_urls forKey:@"pic_urls"];
    [coder encodeObject:self.location forKey:@"location"];
    [coder encodeObject:self.description forKey:@"description"];
    [coder encodeObject:self.profile_image_url forKey:@"profile_image_url"];
    [coder encodeObject:self.gender forKey:@"gender"];
    [coder encodeObject:self.followers_count forKey:@"followers_count"];
    [coder encodeObject:self.friends_count forKey:@"friends_count"];
    [coder encodeObject:self.statuses_count forKey:@"statuses_count"];
    [coder encodeObject:self.favourites_count forKey:@"favourites_count"];
    [coder encodeObject:self.created_atuser forKey:@"created_atuser"];
    [coder encodeObject:self.verified forKey:@"verified"];
    [coder encodeObject:self.uid forKey:@"uid"];

}

- (id)initWithCoder:(NSCoder *)coder{
    self.created_at = [coder decodeObjectForKey:@"created_at"];
    self.source = [coder decodeObjectForKey:@"source"];
    self.text = [coder decodeObjectForKey:@"text"];
    self.text_raw = [coder decodeObjectForKey:@"text_raw"];
    self.thumbnail_pic = [coder decodeObjectForKey:@"thumbnail_pic"];
    self.bmiddle_pic = [coder decodeObjectForKey:@"bmiddle_pic"];
    self.original_pic = [coder decodeObjectForKey:@"original_pic"];
    self.reposts_count = [coder decodeObjectForKey:@"reposts_count"];
    self.comments_count = [coder decodeObjectForKey:@"comments_count"];
    self.attitudes_count = [coder decodeObjectForKey:@"attitudes_count"];
    self.ID = [coder decodeObjectForKey:@"ID"];
    self.pic_urls = [coder decodeObjectForKey:@"pic_urls"];
    self.location = [coder decodeObjectForKey:@"location"];
 //   self.description = [coder decodeObjectForKey:@"description"];
    self.profile_image_url = [coder decodeObjectForKey:@"profile_image_url"];
    self.gender = [coder decodeObjectForKey:@"gender"];
    self.followers_count = [coder decodeObjectForKey:@"followers_count"];
    self.friends_count = [coder decodeObjectForKey:@"friends_count"];
    self.statuses_count = [coder decodeObjectForKey:@"statuses_count"];
    self.favourites_count = [coder decodeObjectForKey:@"favourites_count"];
    self.created_atuser = [coder decodeObjectForKey:@"created_atuser"];
    self.verified = [coder decodeObjectForKey:@"verified"];
    self.uid = [coder decodeObjectForKey:@"uid"];

    return self;
}





@end
