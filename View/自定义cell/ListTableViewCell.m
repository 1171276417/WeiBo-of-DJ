//
//  ListTableViewCell.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

//重写初始化方法 创造控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        //用户头像
        [self.contentView addSubview:({
            self.profile_image_url=[[UIImageView alloc] initWithFrame:CGRectZero];
            self.profile_image_url.contentMode=UIViewContentModeScaleAspectFit;
            self.profile_image_url;
        })];
        //用户昵称
        [self.contentView addSubview:({
            self.screen_name=[[UILabel alloc] init];
            self.screen_name;
        })];
        //微博内容
        [self.contentView addSubview:({
            self.text=[[UILabel alloc] init];
            self.text;
        })];
    }
    return self;
}


- (void)ListlayoutTableViewCellWithItem:(GetListItem *)item{
    [self LoadData:item];
    [self LoadFrame:item];
}

- (void)LoadData:(GetListItem *)item{
    /**头像数据*/
    dispatch_queue_global_t downloadQueue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue=dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.profile_image_url]]];;
        dispatch_async(mainQueue, ^{
            self.profile_image_url.image=image;
        });
    });//异步加载图片
    
    /**昵称数据*/
    self.screen_name.text=item.screen_name;
    self.screen_name.textColor=[UIColor orangeColor];
    
    /**微博内容数据*/
    self.text.text=item.text;

}

- (void)LoadFrame:(GetListItem *)item{
    /**头像Frame*/
    CGFloat profile_image_X=12;
    CGFloat profile_image_Y=12;
    CGFloat profile_image_Width=50;
    CGFloat profile_image_Height=50;
    self.profile_image_url.frame=CGRectMake(profile_image_X, profile_image_Y, profile_image_Width, profile_image_Height);
    self.profile_image_url.layer.masksToBounds=YES; //设置圆角
    self.profile_image_url.layer.cornerRadius=profile_image_Width/2;
    
    /**昵称Frame*/
    CGSize screen_nameSize=[self.screen_name sizeThatFits:CGSizeMake(300, 9999)];//最宽为300
    CGFloat screen_name_X=CGRectGetMaxX(self.profile_image_url.frame)+profile_image_X+5;
    CGFloat screen_name_Y=15;
    CGFloat screen_name_Width=screen_nameSize.width;
    CGFloat screen_name_Height=screen_nameSize.height;
    self.screen_name.frame=CGRectMake(screen_name_X, screen_name_Y, screen_name_Width, screen_name_Height);
    
    /**微博内容*/
    CGSize textSize=[self.text sizeThatFits:CGSizeMake(370, 9999)];//最宽为370
    CGFloat text_X=screen_name_X;
    CGFloat text_Y=screen_name_Y+screen_name_Height+5;
    CGFloat text_Width=320;
    CGFloat text_Height=textSize.height;
    self.text.frame=CGRectMake(text_X, text_Y, text_Width, text_Height);
    
    _ListCellHeight=profile_image_Y+profile_image_Height+10;
}







@end
