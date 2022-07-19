//
//  HomeTableViewCell.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "HomeTableViewCell.h"
#import "SDAutoLayout.h"

@implementation HomeTableViewCell

- (void)HomelayoutTableViewCellWithItem:(GetListItem *)item{
    [self SetData:item];
    [self SetFrame:item];
    
    /**网页链接*/
    [self.btnURL addTarget:self action:@selector(Loadurl) forControlEvents:UIControlEventTouchUpInside];
    /**评论*/
    [self.btncomments addTarget:self action:@selector(Loadcomment) forControlEvents:(UIControlEventTouchUpInside)];
    
}

- (void)setModel:(GetListItem *)model{
    _model = model;
    [self HomelayoutTableViewCellWithItem:_model];
    [self setupAutoHeightWithBottomView:self.comments_count bottomMargin:12];

}



- (void)Loadurl{
    Singleton *single=[[Singleton alloc] init];
    single.URLString=_urlstr;
    NSNotification *note=[NSNotification notificationWithName:@"点击进入网址" object:self];
    [[NSNotificationCenter defaultCenter] postNotification:note];
    NSNotification *note1=[NSNotification notificationWithName:@"传网址" object:nil userInfo:_dicURL];
    [[NSNotificationCenter defaultCenter] postNotification:note1];  
}

- (void)Loadcomment{
    NSNotification *note = [NSNotification notificationWithName:@"评论" object:self];
    [[NSNotificationCenter defaultCenter] postNotification:note];
}


//设置数据Data
- (void)SetData:(GetListItem *)item{
    /**微博ID*/
    self.ID=[[[NSNumberFormatter alloc] init] stringFromNumber:item.ID];;
    
    /**头像数据*/
    [self.profile_image_url sd_setImageWithURL:[NSURL URLWithString:item.profile_image_url] placeholderImage:[UIImage imageNamed:@"4"]];
    
    /**昵称数据*/
    self.screen_name.text=item.screen_name;
    self.screen_name.textColor=[UIColor orangeColor];
    
    /**发博时间数据*/
    self.created_at.text=[self getTimeString:item.created_at];
    
    /**微博来源*/
    self.source.text=[self SetSource:item.source];
    
    /**网页链接*/
    if([self isURL:(NSString *)item.text] == YES){
        self.URL.text = @"网页链接";
        self.URL.textColor = [UIColor blueColor];
        }
    else
        self.URL.text = nil;
    
    /**微博内容数据*/
    [item.text stringByRemovingPercentEncoding];
//    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"[]{}（#%-*+=_）\\|~(＜＞$%^&*)_+ qwertyuiopasdfghjklzxcvbnm\"?/1234567890QWERTYUIOPASDFGHJKLZXCVBNM.<>"];
//    
//    item.text = [[item.text componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString: @""];
    if(item.text_raw){
        self.text.text = item.text_raw;
    }
    else
        self.text.text=item.text;
    
    /**九宫格微博内容图片*/
    switch (item.pic_urls.count) {
        case 0:_imageHeigh=0;break;
        case 1:[self LoadOnePictureData:item];break;
        case 2:[self LoadTwoPictureData:item];break;
        case 3:[self LoadThreePictureData:item];break;
        case 4:[self LoadFourPictureData:item];break;
        case 5:[self LoadFivePictureData:item];break;
        case 6:[self LoadSixPictureData:item];break;
        case 7:[self LoadSevenPictureData:item];break;
        case 8:[self LoadEightPictureData:item];break;
        case 9:[self LoadEightPictureData:item];break;
    }
    
    /**转发图片*/
    self.reposts.image=[UIImage imageNamed:@"reposts"];
    
    /**转发数*/
    if([[[[NSNumberFormatter alloc] init] stringFromNumber:item.reposts_count] compare:@"0"]!=NSOrderedSame)
        self.reposts_count.text=[[[NSNumberFormatter alloc] init] stringFromNumber:item.reposts_count];
    else
        self.reposts_count.text=@"转发";
    
    /**评论图片*/
    self.comments.image=[UIImage imageNamed:@"comments"];
    /**评论数*/
    if([[[[NSNumberFormatter alloc] init] stringFromNumber:item.comments_count] compare:@"0"]!=NSOrderedSame)
        self.comments_count.text=[[[NSNumberFormatter alloc] init] stringFromNumber:item.comments_count];
    else
        self.comments_count.text=@"评论";
    
    /**点赞图片*/
    self.attitudes.image=[UIImage imageNamed:@"attitudes"];
    /**点赞数*/
    if([[[[NSNumberFormatter alloc] init] stringFromNumber:item.attitudes_count] compare:@"0"]!=NSOrderedSame)
        self.attitudes_count.text=[[[NSNumberFormatter alloc] init] stringFromNumber:item.attitudes_count];
    else
        self.attitudes_count.text=@"赞";
    NSLog(@"");
}


//设置位置Frame
- (void)SetFrame:(GetListItem *)item{
    /**头像Frame*/
    self.profile_image_url.layer.masksToBounds=YES; //设置圆角
    self.profile_image_url.layer.cornerRadius=25;
    self.profile_image_url.sd_layout
    .widthIs(50)
    .heightIs(50)
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 10);
    
    /**昵称Frame*/
    self.screen_name.sd_layout
    .heightIs(15)
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.profile_image_url, 10)
    .rightSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    
    /**发博时间Frame*/
    self.created_at.sd_layout
    .heightIs(15)
    .widthIs(80)
    .topSpaceToView(self.screen_name, 10)
    .leftEqualToView(self.screen_name);

    /**微博来源*/
    self.source.sd_layout
    .leftSpaceToView(self.created_at, 20)
    .topEqualToView(self.created_at)
    .widthIs(200)
    .heightIs(15);
    
    /**微博内容*/
    self.text.numberOfLines=0;//多行显示
    self.text.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.profile_image_url, 15)
    .widthIs(370)
    .autoHeightRatio(0);

    /**网页链接*/
    self.URL.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.text, 5)
    .heightIs(20)
    .widthIs(200);
    self.btnURL.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.text, 5)
    .heightIs(20)
    .widthIs(200);
    
    /**九宫格微博Frame图片*/
    switch (item.pic_urls.count) {
        case 0:_imageHeigh=0;break;
        case 1:[self LoadOnePictureFrame:item];break;
        case 2:[self LoadTwoPictureFrame:item];break;
        case 3:[self LoadThreePictureFrame:item];break;
        case 4:[self LoadFourPictureFrame:item];break;
        case 5:[self LoadFivePictureFrame:item];break;
        case 6:[self LoadSixPictureFrame:item];break;
        case 7:[self LoadSevenPictureFrame:item];break;
        case 8:[self LoadEightPictureFrame:item];break;
        case 9:[self LoadNinePictureFrame:item];break;
    }
    
    /**转发按钮*/
    self.btnreposts.sd_layout
    .leftSpaceToView(self.contentView, 40)
    .topSpaceToView(self.text, 35+self.imageHeigh)
    .widthIs(60)
    .heightIs(20);
    self.reposts.sd_layout
    .leftEqualToView(self.btnreposts)
    .topEqualToView(self.btnreposts)
    .widthIs(20)
    .heightIs(20);
    self.reposts_count.sd_layout
    .leftSpaceToView(self.contentView, 65)
    .topEqualToView(self.btnreposts)
    .widthIs(40)
    .heightIs(20);
    
    /**评论按钮*/
    self.btncomments.sd_layout
    .leftSpaceToView(self.contentView, 170)
    .topSpaceToView(self.text, 35+self.imageHeigh)
    .widthIs(60)
    .heightIs(20);
    self.comments.sd_layout
    .leftEqualToView(self.btncomments)
    .topEqualToView(self.btncomments)
    .widthIs(20)
    .heightIs(20);
    self.comments_count.sd_layout
    .leftSpaceToView(self.contentView, 195)
    .topEqualToView(self.btncomments)
    .widthIs(40)
    .heightIs(20);
    
    /**点赞按钮*/
    self.btnattitudes.sd_layout
    .leftSpaceToView(self.contentView, 300)
    .topSpaceToView(self.text, 35+self.imageHeigh)
    .widthIs(60)
    .heightIs(20);
    self.attitudes.sd_layout
    .leftEqualToView(self.btnattitudes)
    .topEqualToView(self.btnattitudes)
    .widthIs(20)
    .heightIs(20);
    self.attitudes_count.sd_layout
    .leftSpaceToView(self.contentView, 325)
    .topEqualToView(self.btnattitudes)
    .widthIs(40)
    .heightIs(20);
}


- (BOOL)isURL:(NSString *)url {
    
    NSRange range = [url rangeOfString:@"http"];
    if(range.location == NSNotFound){
        return NO;
    }
    else
        return YES;
}


/**格式化时间数据*/
- (NSString *) getTimeString : (NSString *) string {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    NSDate* inputDate = [inputFormatter dateFromString:string];
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"HH:mm:ss"];
    NSString *str = [outputFormatter stringFromDate:inputDate];
    NSLog(@"");
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
    NSLog(@"");
    return source;
}



//加载图片数据Data
/**one*/
- (void)LoadOnePictureData:(GetListItem *)item{
    [self.thumbnail_pic1 sd_setImageWithURL:[NSURL URLWithString:item.original_pic] placeholderImage:[UIImage imageNamed:@"4"]];
}
/**two*/
- (void)LoadTwoPictureData:(GetListItem *)item{
    [self LoadOnePictureData:item];
    [self.thumbnail_pic2 sd_setImageWithURL:[NSURL URLWithString:[item.pic_urls[1] objectForKey:@"thumbnail_pic"]] placeholderImage:[UIImage imageNamed:@"4"]];
}
/**three*/
- (void)LoadThreePictureData:(GetListItem *)item{
    [self LoadTwoPictureData:item];
    [self.thumbnail_pic3 sd_setImageWithURL:[NSURL URLWithString:[item.pic_urls[2] objectForKey:@"thumbnail_pic"]] placeholderImage:[UIImage imageNamed:@"4"]];
}
/**four*/
- (void)LoadFourPictureData:(GetListItem *)item{
    [self LoadThreePictureData:item];
    [self.thumbnail_pic4 sd_setImageWithURL:[NSURL URLWithString:[item.pic_urls[3] objectForKey:@"thumbnail_pic"]] placeholderImage:[UIImage imageNamed:@"4"]];
}
/**five*/
- (void)LoadFivePictureData:(GetListItem *)item{
    [self LoadFourPictureData:item];
    [self.thumbnail_pic5 sd_setImageWithURL:[NSURL URLWithString:[item.pic_urls[4] objectForKey:@"thumbnail_pic"]] placeholderImage:[UIImage imageNamed:@"4"]];
}
/**six*/
- (void)LoadSixPictureData:(GetListItem *)item{
    [self LoadFivePictureData:item];
    [self.thumbnail_pic6 sd_setImageWithURL:[NSURL URLWithString:[item.pic_urls[5] objectForKey:@"thumbnail_pic"]] placeholderImage:[UIImage imageNamed:@"4"]];
}
/**seven*/
- (void)LoadSevenPictureData:(GetListItem *)item{
    [self LoadSixPictureData:item];
    [self.thumbnail_pic7 sd_setImageWithURL:[NSURL URLWithString:[item.pic_urls[6] objectForKey:@"thumbnail_pic"]] placeholderImage:[UIImage imageNamed:@"4"]];
}
/**eight*/
- (void)LoadEightPictureData:(GetListItem *)item{
    [self LoadSevenPictureData:item];
    [self.thumbnail_pic8 sd_setImageWithURL:[NSURL URLWithString:[item.pic_urls[7] objectForKey:@"thumbnail_pic"]] placeholderImage:[UIImage imageNamed:@"4"]];
}
/**nine*/
- (void)LoadNinePictureData:(GetListItem *)item{
    [self LoadEightPictureData:item];
    [self.thumbnail_pic9 sd_setImageWithURL:[NSURL URLWithString:[item.pic_urls[8] objectForKey:@"thumbnail_pic"]] placeholderImage:[UIImage imageNamed:@"4"]];
}


//加载图片位置Frame
/**one*/
- (void)LoadOnePictureFrame:(GetListItem *)item{
    self.thumbnail_pic1.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.contentView, 30).heightIs(330).widthIs(330);
    self.imageHeigh=330;
}
/**two*/
- (void)LoadTwoPictureFrame:(GetListItem *)item{
    self.thumbnail_pic1.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.contentView, 10).heightIs(180).widthIs(180);
    self.thumbnail_pic2.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic1, 10).heightIs(180).widthIs(180);
    self.imageHeigh=180;
}
/**three*/
- (void)LoadThreePictureFrame:(GetListItem *)item{
    self.thumbnail_pic1.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic2.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic1, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic3.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic2, 10).heightIs(350/3).widthIs(350/3);
    self.imageHeigh=350/3;
}
/**four*/
- (void)LoadFourPictureFrame:(GetListItem *)item{
    self.thumbnail_pic1.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.contentView, 10).heightIs(180).widthIs(180);
    self.thumbnail_pic2.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic1, 10).heightIs(180).widthIs(180);
    self.thumbnail_pic3.sd_layout.topSpaceToView(self.thumbnail_pic1, 10).leftSpaceToView(self.contentView, 10).heightIs(180).widthIs(180);
    self.thumbnail_pic4.sd_layout.topSpaceToView(self.thumbnail_pic2, 10).leftSpaceToView(self.thumbnail_pic3, 10).heightIs(180).widthIs(180);
    self.imageHeigh=370;
}
/**five*/
- (void)LoadFivePictureFrame:(GetListItem *)item{
    self.thumbnail_pic1.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic2.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic1, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic3.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic2, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic4.sd_layout.topSpaceToView(self.thumbnail_pic1, 10).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic5.sd_layout.topSpaceToView(self.thumbnail_pic2, 10).leftSpaceToView(self.thumbnail_pic4, 10).heightIs(350/3).widthIs(350/3);
    self.imageHeigh=700/3+10;
}
/**six*/
- (void)LoadSixPictureFrame:(GetListItem *)item{
    self.thumbnail_pic1.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic2.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic1, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic3.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic2, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic4.sd_layout.topSpaceToView(self.thumbnail_pic1, 10).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic5.sd_layout.topSpaceToView(self.thumbnail_pic2, 10).leftSpaceToView(self.thumbnail_pic4, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic6.sd_layout.topSpaceToView(self.thumbnail_pic3, 10).leftSpaceToView(self.thumbnail_pic5, 10).heightIs(350/3).widthIs(350/3);
    self.imageHeigh=700/3+10;
}
/**seven*/
- (void)LoadSevenPictureFrame:(GetListItem *)item{
    self.thumbnail_pic1.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic2.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic1, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic3.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic2, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic4.sd_layout.topSpaceToView(self.thumbnail_pic1, 10).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic5.sd_layout.topSpaceToView(self.thumbnail_pic2, 10).leftSpaceToView(self.thumbnail_pic4, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic6.sd_layout.topSpaceToView(self.thumbnail_pic3, 10).leftSpaceToView(self.thumbnail_pic5, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic7.sd_layout.topSpaceToView(self.thumbnail_pic4, 10).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.imageHeigh=370;
}
/**eight*/
- (void)LoadEightPictureFrame:(GetListItem *)item{
    self.thumbnail_pic1.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic2.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic1, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic3.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic2, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic4.sd_layout.topSpaceToView(self.thumbnail_pic1, 10).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic5.sd_layout.topSpaceToView(self.thumbnail_pic2, 10).leftSpaceToView(self.thumbnail_pic4, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic6.sd_layout.topSpaceToView(self.thumbnail_pic3, 10).leftSpaceToView(self.thumbnail_pic5, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic7.sd_layout.topSpaceToView(self.thumbnail_pic4, 10).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic8.sd_layout.topSpaceToView(self.thumbnail_pic5, 10).leftSpaceToView(self.thumbnail_pic7, 10).heightIs(350/3).widthIs(350/3);
    self.imageHeigh=370;
}
/**nine*/
- (void)LoadNinePictureFrame:(GetListItem *)item{
    self.thumbnail_pic1.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic2.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic1, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic3.sd_layout.topSpaceToView(self.text, 20).leftSpaceToView(self.thumbnail_pic2, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic4.sd_layout.topSpaceToView(self.thumbnail_pic1, 10).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic5.sd_layout.topSpaceToView(self.thumbnail_pic2, 10).leftSpaceToView(self.thumbnail_pic4, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic6.sd_layout.topSpaceToView(self.thumbnail_pic3, 10).leftSpaceToView(self.thumbnail_pic5, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic7.sd_layout.topSpaceToView(self.thumbnail_pic4, 10).leftSpaceToView(self.contentView, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic8.sd_layout.topSpaceToView(self.thumbnail_pic5, 10).leftSpaceToView(self.thumbnail_pic7, 10).heightIs(350/3).widthIs(350/3);
    self.thumbnail_pic9.sd_layout.topSpaceToView(self.thumbnail_pic6, 10).leftSpaceToView(self.thumbnail_pic8, 10).heightIs(350/3).widthIs(350/3);
    self.imageHeigh=370;
}


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
        //发博时间
        [self.contentView addSubview:({
            self.created_at=[[UILabel alloc] init];
            self.created_at;
        })];
        
        //微博来源
        [self.contentView addSubview:({
            self.source=[[UILabel alloc] init];
            self.source;
        })];
        
        //微博内容
        [self.contentView addSubview:({
            self.text=[[UILabel alloc] init];
            self.text;
        })];
        
        //网页链接
        [self.contentView addSubview:({
            self.btnURL=[UIButton buttonWithType:UIButtonTypeCustom];
            self.btnURL;
        })];
        
        //网页链接
        [self.contentView addSubview:({
            self.URL=[[UILabel alloc] init];
            self.URL;
        })];
        
        //微博图片 九张
        [self.contentView addSubview:({
            self.thumbnail_pic1=[[UIImageView alloc] init];
            self.thumbnail_pic1.contentMode=UIViewContentModeScaleAspectFit;
            self.thumbnail_pic1;
        })];
        [self.contentView addSubview:({
            self.thumbnail_pic2=[[UIImageView alloc] init];
            self.thumbnail_pic2.contentMode=UIViewContentModeScaleAspectFit;
            self.thumbnail_pic2;
        })];
        [self.contentView addSubview:({
            self.thumbnail_pic3=[[UIImageView alloc] init];
            self.thumbnail_pic3.contentMode=UIViewContentModeScaleAspectFit;
            self.thumbnail_pic3;
        })];
        [self.contentView addSubview:({
            self.thumbnail_pic4=[[UIImageView alloc] init];
            self.thumbnail_pic4.contentMode=UIViewContentModeScaleAspectFit;
            self.thumbnail_pic4;
        })];
        [self.contentView addSubview:({
            self.thumbnail_pic5=[[UIImageView alloc] init];
            self.thumbnail_pic5.contentMode=UIViewContentModeScaleAspectFit;
            self.thumbnail_pic5;
        })];
        [self.contentView addSubview:({
            self.thumbnail_pic6=[[UIImageView alloc] init];
            self.thumbnail_pic6.contentMode=UIViewContentModeScaleAspectFit;
            self.thumbnail_pic6;
        })];
        [self.contentView addSubview:({
            self.thumbnail_pic7=[[UIImageView alloc] init];
            self.thumbnail_pic7.contentMode=UIViewContentModeScaleAspectFit;
            self.thumbnail_pic7;
        })];
        [self.contentView addSubview:({
            self.thumbnail_pic8=[[UIImageView alloc] init];
            self.thumbnail_pic8.contentMode=UIViewContentModeScaleAspectFit;
            self.thumbnail_pic8;
        })];
        [self.contentView addSubview:({
            self.thumbnail_pic9=[[UIImageView alloc] init];
            self.thumbnail_pic9.contentMode=UIViewContentModeScaleAspectFit;
            self.thumbnail_pic9;
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
