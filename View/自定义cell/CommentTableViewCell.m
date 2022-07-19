//
//  CommentTableViewCell.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import "CommentTableViewCell.h"
#import "SDAutoLayout.h"
#import "SDWebImage.h"

@implementation CommentTableViewCell

- (void)CommentlayoutCell:(GetListItem *)item{
    [self LoadData:item];//加载数据
    [self LoadFrame:item];//加载控件大小位置
}


//加载数据
- (void)LoadData:(GetListItem *)item{
  
    /**头像数据*/
    [self.profile_image_url sd_setImageWithURL:[NSURL URLWithString:item.COMprofile_image_url] placeholderImage:[UIImage imageNamed:@"4"]];

    /**昵称数据*/
    self.screen_name.text=item.COMscreen_name;
    self.screen_name.textColor=[UIColor orangeColor];
    
    /**发博时间数据*/
    self.created_at.text=[self SetTimeString:item.COMcreated_at]; 
    
    /**微博来源*/
    self.source.text=[self SetSource:item.COMsource];
    /**微博内容数据*/
    if(item.COMtext_raw){
        self.text.text = item.COMtext_raw;
    }
    else
        self.text.text=item.COMtext;
}

- (void)setModel:(GetListItem *)model{
    _model = model;
    [self CommentlayoutCell:_model];
    [self setupAutoHeightWithBottomView:self.created_at bottomMargin:10];
}


//加载控件大小位置
- (void)LoadFrame:(GetListItem *)item{
    
    /**头像Frame*/
    _profile_image_url.sd_layout
    .widthIs(50)
    .heightIs(50)
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 10);
    /**设置圆角*/
    self.profile_image_url.layer.masksToBounds=YES;
    self.profile_image_url.layer.cornerRadius=25/2;
    
    /**昵称Frame*/
    self.screen_name.sd_layout
    .heightIs(15)
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.profile_image_url, 10)
    .rightSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    
    
    /**评论内容Frame*/
    self.text.numberOfLines = 0;
    self.text.sd_layout
    .leftEqualToView(self.screen_name)
    .topSpaceToView(self.screen_name, 8)
    .rightSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    
    /**时间*/
    self.created_at.sd_layout
    .leftEqualToView(self.text)
    .topSpaceToView(self.text, 10)
    .widthIs(80)
    .heightIs(15);
    /**来源*/
    self.source.sd_layout
    .leftSpaceToView(self.created_at, 20)
    .topEqualToView(self.created_at)
    .widthIs(200)
    .heightIs(15);
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
