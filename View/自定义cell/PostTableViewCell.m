//
//  PostTableViewCell.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import "PostTableViewCell.h"

@implementation PostTableViewCell

- (void)PostlayoutCell:(PostListItem *)item{
    [self LoadData:item];
    [self LoadFrame:item];
}

- (void)LoadData:(PostListItem *)item{
    //头像数据
    UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.myprofile_image_url]]];;
        self.profile_image_url.image=image;
    
    //昵称
    self.screen_name.text=item.myscreen_name;
    
    //时间
    self.created_at.text=item.mycreated_at;
    
    //来源
    self.source.text=item.mysource;
    
    //内容
    self.text.text=item.mytext;
    
    /**转发图片*/
    self.reposts.image=[UIImage imageNamed:@"reposts"];
    
    /**转发数*/
    if([[[[NSNumberFormatter alloc] init] stringFromNumber:item.myreposts_count] compare:@"0"]!=NSOrderedSame)
        self.reposts_count.text=[[[NSNumberFormatter alloc] init] stringFromNumber:item.myreposts_count];
    else
        self.reposts_count.text=@"转发";
    
    /**评论图片*/
    self.comments.image=[UIImage imageNamed:@"comments"];
    /**评论数*/
    if([[[[NSNumberFormatter alloc] init] stringFromNumber:item.mycomments_count] compare:@"0"]!=NSOrderedSame)
        self.comments_count.text=[[[NSNumberFormatter alloc] init] stringFromNumber:item.mycomments_count];
    else
        self.comments_count.text=@"评论";
    
    /**点赞图片*/
    self.attitudes.image=[UIImage imageNamed:@"attitudes"];
    /**点赞数*/
    if([[[[NSNumberFormatter alloc] init] stringFromNumber:item.myattitudes_count] compare:@"0"]!=NSOrderedSame)
        self.attitudes_count.text=[[[NSNumberFormatter alloc] init] stringFromNumber:item.myattitudes_count];
    else
        self.attitudes_count.text=@"赞";
    
    
}

- (void)LoadFrame:(PostListItem *)item{
    
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
    
    /**发博时间Frame*/
    CGSize created_atSize=[self.created_at sizeThatFits:CGSizeMake(300, 9999)];//最宽为300
    CGFloat created_at_X=screen_name_X;
    CGFloat created_at_Y=screen_name_Height+15;
    CGFloat created_at_Width=created_atSize.width;
    CGFloat created_at_Height=created_atSize.height;
    self.created_at.frame=CGRectMake(created_at_X, created_at_Y, created_at_Width, created_at_Height);
    
    /**微博来源*/
    CGSize source_atSize=[self.source sizeThatFits:CGSizeMake(300, 9999)];//最宽为300
    CGFloat source_at_X=created_at_X+created_at_Width+10;
    CGFloat source_at_Y=created_at_Y;
    CGFloat source_at_Width=source_atSize.width;
    CGFloat source_at_Height=source_atSize.height;
    self.source.frame=CGRectMake(source_at_X, source_at_Y, source_at_Width, source_at_Height);
    
    /**微博内容*/
    self.text.numberOfLines=0;//多行显示
    CGSize textSize=[self.text sizeThatFits:CGSizeMake(370, 9999)];//最宽为370
    CGFloat text_X=10;
    CGFloat text_Y=75;
    CGFloat text_Width=textSize.width;
    CGFloat text_Height=textSize.height;
    self.text.frame=CGRectMake(text_X, text_Y, text_Width, text_Height);
    
    /**转发按钮*/
    CGFloat reposts_X=40;
    CGFloat reposts_Y=text_Y+text_Height+35;
    CGFloat reposts_Width=60;
    CGFloat reposts_Height=20;
    self.btnreposts.frame=CGRectMake(reposts_X, reposts_Y, reposts_Width, reposts_Height);
    self.reposts.frame=CGRectMake(reposts_X, reposts_Y, 20, 20);
    self.reposts_count.frame=CGRectMake(reposts_X+25, reposts_Y, 40, 20);

    /**评论按钮*/
    CGFloat comments_X=170;
    CGFloat comments_Y=text_Y+text_Height+35;
    CGFloat comments_Width=60;
    CGFloat comments_Height=20;
    self.btncomments.frame=CGRectMake(comments_X, comments_Y, comments_Width, comments_Height);
    self.comments.frame=CGRectMake(comments_X, comments_Y, 20, 20);
    self.comments_count.frame=CGRectMake(comments_X+25, comments_Y, 40, 20);
    
    /**点赞按钮*/
    CGFloat attitudes_X=300;
    CGFloat attitudes_Y=text_Y+text_Height+35;
    CGFloat attitudes_Width=60;
    CGFloat attitudes_Height=20;
    self.btnattitudes.frame=CGRectMake(attitudes_X, attitudes_Y, attitudes_Width, attitudes_Height);
    self.attitudes.frame=CGRectMake(attitudes_X, attitudes_Y, 20, 20);
    self.attitudes_count.frame=CGRectMake(attitudes_X+25, attitudes_Y, 40, 20);
    
    /**Cell的高度*/
    self.PostCellHeight=text_Y+text_Height+60;
    
    
    
    
    
    
}





/**初始化创造控件*/
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        //我的头像
        [self.contentView addSubview:({
            self.profile_image_url=[[UIImageView alloc] initWithFrame:CGRectZero];
            self.profile_image_url.contentMode=UIViewContentModeScaleAspectFit;
            self.profile_image_url;
        })];
        //我的昵称
        [self.contentView addSubview:({
            self.screen_name=[[UILabel alloc] init];
            self.screen_name;
        })];
        //发博时间
        [self.contentView addSubview:({
            self.created_at=[[UILabel alloc] init];
            self.created_at;
        })];
        //微博内容
        [self.contentView addSubview:({
            self.text=[[UILabel alloc] init];
            self.text;
        })];
        //微博来源
        [self.contentView addSubview:({
            self.source=[[UILabel alloc] init];
            self.source;
        })];
        //转发按钮
        [self.contentView addSubview:({
            self.btnreposts=[UIButton buttonWithType:UIButtonTypeCustom];
            self.btnreposts;
        })];
        //转发图片
        [self.contentView addSubview:({
            self.reposts=[[UIImageView alloc] init];
            self.reposts;
        })];
        //转发数
        [self.contentView addSubview:({
            self.reposts_count=[[UILabel alloc] init];
            self.reposts_count;
        })];
        //评论按钮
        [self.contentView addSubview:({
            self.btncomments=[UIButton buttonWithType:UIButtonTypeCustom];
            self.btncomments;
        })];
        //评论图片
        [self.contentView addSubview:({
            self.comments=[[UIImageView alloc] init];
            self.comments;
        })];
        //评论数
        [self.contentView addSubview:({
            self.comments_count=[[UILabel alloc] init];
            self.comments_count;
        })];
        //点赞按钮
        [self.contentView addSubview:({
            self.btnattitudes=[UIButton buttonWithType:UIButtonTypeCustom];
            self.btnattitudes;
        })];
        //点赞图片
        [self.contentView addSubview:({
            self.attitudes=[[UIImageView alloc] init];
            self.attitudes;
        })];
        //点赞数
        [self.contentView addSubview:({
            self.attitudes_count=[[UILabel alloc] init];
            self.attitudes_count;
        })];
    }
    return self;
}


@end
