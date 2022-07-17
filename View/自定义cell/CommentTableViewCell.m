//
//  CommentTableViewCell.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell

- (void)CommentlayoutCell:(GetListItem *)item{
    [self LoadData:item];//加载数据
    [self LoadFrame:item];//加载控件大小位置
}


//加载数据
- (void)LoadData:(GetListItem *)item{
  
    /**头像数据*/
    dispatch_queue_global_t downloadQueue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue=dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.COMprofile_image_url]]];;
        dispatch_async(mainQueue, ^{
            self.profile_image_url.image=image;
        });
    });//异步加载图片
    
    /**昵称数据*/
    self.screen_name.text=item.COMscreen_name;
    self.screen_name.textColor=[UIColor orangeColor];
    
    /**发博时间数据*/
    self.created_at.text=[self SetTimeString:item.COMcreated_at]; //item.COMcreated_at;
    
    /**微博来源*/
    self.source.text=[self SetSource:item.source];
    
    /**微博内容数据*/
    self.text.text=item.COMtext;
}

//加载控件大小位置
- (void)LoadFrame:(GetListItem *)item{
    
    /**头像Frame*/
    CGFloat profile_image_url_X=12;
    CGFloat profile_image_url_Y=12;
    CGFloat profile_image_url_Width=50;
    CGFloat profile_image_url_Height=50;
    self.profile_image_url.frame=CGRectMake(profile_image_url_X, profile_image_url_Y, profile_image_url_Width, profile_image_url_Height);
    
    /**设置圆角*/
    self.profile_image_url.layer.masksToBounds=YES;
    self.profile_image_url.layer.cornerRadius=profile_image_url_Width/2;
    
    /**昵称Frame*/
    CGSize screen_nameSize=[self.screen_name sizeThatFits:CGSizeMake(300, 9999)];//最宽为300
    CGFloat screen_name_X=CGRectGetMaxX(self.profile_image_url.frame)+profile_image_url_X+5;
    CGFloat screen_name_Y=12;
    CGFloat screen_name_Width=screen_nameSize.width;
    CGFloat screen_name_Height=screen_nameSize.height;
    self.screen_name.frame=CGRectMake(screen_name_X, screen_name_Y, screen_name_Width, screen_name_Height);
    
    /**评论内容Frame*/
    self.text.numberOfLines=0;//多行显示
    CGSize TextSize=[self.text sizeThatFits:CGSizeMake(315, 9999)];
    CGFloat Text_X=screen_name_X;
    CGFloat Text_Y=screen_name_Y+screen_name_Height+5;
    CGFloat Text_Width=TextSize.width;
    CGFloat Text_Height=TextSize.height;
    self.text.frame=CGRectMake(Text_X, Text_Y, Text_Width, Text_Height);
    
    /**时间*/
    CGSize created_atSize=[self.created_at sizeThatFits:CGSizeMake(300, 9999)];//最宽为300
    CGFloat created_at_X=screen_name_X;
    CGFloat created_at_Y=Text_Y+Text_Height+10;
    CGFloat created_at_Width=created_atSize.width;
    CGFloat created_at_Height=created_atSize.height;
    self.created_at.frame=CGRectMake(created_at_X, created_at_Y, created_at_Width, created_at_Height);
    
    /**来源*/
    CGSize source_Size=[self.source sizeThatFits:CGSizeMake(300, 9999)];
    CGFloat source_X=created_at_X+created_at_Width+10;
    CGFloat source_Y=created_at_Y;
    CGFloat source_Width=source_Size.width;
    CGFloat source_Hight=source_Size.height;
    self.source.frame=CGRectMake(source_X, source_Y, source_Width, source_Hight);
    
    
    self.CommentCellHeight=created_at_Y+created_at_Height+10;
    
}


/**格式化时间数据*/
- (NSString *) SetTimeString : (NSString *) string {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    NSDate* inputDate = [inputFormatter dateFromString:string];
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"HH:mm:ss"];
    NSString *str = [outputFormatter stringFromDate:inputDate];
    return str;
}

/**格式化来源数据*/
- (NSString *)SetSource:(NSString *)source
{
    NSRange range = [source rangeOfString:@">"];
    if(range.length!=0){
    source = [source substringFromIndex:range.location + range.length];
    range = [source rangeOfString:@"<"];
    source = [source substringToIndex:range.location];
    source = [NSString stringWithFormat:@"来自%@",source];
    }
    return source;
}


/**初始化创造控件*/
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        //评论头像
        [self.contentView addSubview:({
            self.profile_image_url=[[UIImageView alloc] initWithFrame:CGRectZero];
            self.profile_image_url.contentMode=UIViewContentModeScaleAspectFit;
            self.profile_image_url;
        })];
        //评论昵称
        [self.contentView addSubview:({
            self.screen_name=[[UILabel alloc] init];
            self.screen_name;
        })];
        //评论时间
        [self.contentView addSubview:({
            self.created_at=[[UILabel alloc] init];
            self.created_at;
        })];
        //评论内容
        [self.contentView addSubview:({
            self.text=[[UILabel alloc] init];
            self.text;
        })];
        //评论来源
        [self.contentView addSubview:({
            self.source=[[UILabel alloc] init];
            self.source;
        })];
    }
    return self;
}


@end
