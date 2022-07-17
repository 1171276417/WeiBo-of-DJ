//
//  HomeTableViewCell.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)HomelayoutTableViewCellWithItem:(GetListItem *)item{
    [self SetData:item];
    [self SetFrame:item];
    
    /**网页链接*/
    [self.btnURL addTarget:self action:@selector(Loadurl) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)Loadurl{
    Singleton *single=[[Singleton alloc] init];
    single.URLString=_urlstr;
    NSNotification *note=[NSNotification notificationWithName:@"点击进入网址" object:self];
    [[NSNotificationCenter defaultCenter] postNotification:note];
    
//    WebViewController *webVC=[[WebViewController alloc] init];
//
//    [[NSNotificationCenter defaultCenter] addObserver:webVC selector:@selector(geturl:) name:@"传网址" object:nil];
    NSNotification *note1=[NSNotification notificationWithName:@"传网址" object:nil userInfo:_dicURL];
    [[NSNotificationCenter defaultCenter] postNotification:note1];  
}


/**设置数据*/
- (void)SetData:(GetListItem *)item{
    /**微博ID*/
    self.ID=[[[NSNumberFormatter alloc] init] stringFromNumber:item.ID];;
    
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
    
    /**发博时间数据*/
    self.created_at.text=[self getTimeString:item.created_at];
    
    /**微博来源*/
    self.source.text=[self SetSource:item.source];
    
    /**微博内容数据*/
    self.text.text=item.text;
    
    /**网页链接*/
    _urlstr=(NSString *)[self getURLFromStr:(NSString *)item.text];
    _urlcount=[self getURLFromStr:(NSString *)item.text].count;
    if(_urlcount){
        self.URL.text=@"网页链接";
        self.URL.textColor=[UIColor blueColor];
        _dicURL=@{@"url":_urlstr};
        Singleton *single=[[Singleton alloc] init];
        single.URLString=_urlstr;
    }
    else{
        _url_Height=0;
    }
    
    
    /**九宫格微博内容图片*/
    switch (item.pic_urls.count) {
        case 0:_imageHeigh=0;break;
        case 1:[self LoadDataimagenum1:item];break;
        case 2:[self LoadDataimagenum2:item];break;
        case 3:[self LoadDataimagenum3:item];break;
        case 4:[self LoadDataimagenum4:item];break;
        case 5:[self LoadDataimagenum5:item];break;
        case 6:[self LoadDataimagenum6:item];break;
        case 7:[self LoadDataimagenum7:item];break;
        case 8:[self LoadDataimagenum8:item];break;
        case 9:[self LoadDataimagenum9:item];break;
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


/**设置位置和大小*/
- (void)SetFrame:(GetListItem *)item{
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
    _text_Height=textSize.height;
    self.text.frame=CGRectMake(text_X, text_Y, text_Width, _text_Height);
    
    /**网页链接*/
    CGSize urlSize=[self.URL sizeThatFits:CGSizeMake(300, 999)];
    CGFloat url_X=10;
    CGFloat url_Y=text_Y+_text_Height+5;
    CGFloat url_Width=urlSize.width;
    if(_urlcount){
        _url_Height=urlSize.height;
    }
    else{
        _url_Height=0;

    }
    self.URL.frame=CGRectMake(url_X, url_Y, url_Width, _url_Height);
    self.btnURL.frame=CGRectMake(url_X, url_Y, url_Width, _url_Height);
    
    
    /**转发按钮*/
    CGFloat reposts_X=40;
    CGFloat reposts_Y=text_Y+_text_Height+_imageHeigh+35+_url_Height;
    CGFloat reposts_Width=60;
    CGFloat reposts_Height=20;
    self.btnreposts.frame=CGRectMake(reposts_X, reposts_Y, reposts_Width, reposts_Height);
    self.reposts.frame=CGRectMake(reposts_X, reposts_Y, 20, 20);
    self.reposts_count.frame=CGRectMake(reposts_X+25, reposts_Y, 40, 20);

    /**评论按钮*/
    CGFloat comments_X=170;
    CGFloat comments_Y=text_Y+_text_Height+_imageHeigh+35+_url_Height;
    CGFloat comments_Width=60;
    CGFloat comments_Height=20;
    self.btncomments.frame=CGRectMake(comments_X, comments_Y, comments_Width, comments_Height);
    self.comments.frame=CGRectMake(comments_X, comments_Y, 20, 20);
    self.comments_count.frame=CGRectMake(comments_X+25, comments_Y, 40, 20);
    
    /**点赞按钮*/
    CGFloat attitudes_X=300;
    CGFloat attitudes_Y=text_Y+_text_Height+_imageHeigh+35+_url_Height;
    CGFloat attitudes_Width=60;
    CGFloat attitudes_Height=20;
    self.btnattitudes.frame=CGRectMake(attitudes_X, attitudes_Y, attitudes_Width, attitudes_Height);
    self.attitudes.frame=CGRectMake(attitudes_X, attitudes_Y, 20, 20);
    self.attitudes_count.frame=CGRectMake(attitudes_X+25, attitudes_Y, 40, 20);
    
    /**Cell的高度*/
    self.HomeCellHeight=text_Y+_text_Height+_imageHeigh+60+_url_Height;
    
}


- (BOOL)isURL:(NSString *)url {
    if(url.length < 1)
        return NO;
    if (url.length>4 && [[url substringToIndex:4] isEqualToString:@"www."]) {
        url = [NSString stringWithFormat:@"http://%@",url];
    } else {
        url = url;
    }
    NSString *urlRegex = @"(https|http|ftp|rtsp|igmp|file|rtspt|rtspu)://((((25[0-5]|2[0-4]\\d|1?\\d?\\d)\\.){3}(25[0-5]|2[0-4]\\d|1?\\d?\\d))|([0-9a-z_!~*'()-]*\\.?))([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\\.([a-z]{2,6})(:[0-9]{1,4})?([a-zA-Z/?_=]*)\\.\\w{1,5}";

NSPredicate* urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegex];

    return [urlTest evaluateWithObject:url];
}

- (NSArray*)getURLFromStr:(NSString *)string {
    NSError *error;
    //可以识别url的正则表达式
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";

    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
    options:NSRegularExpressionCaseInsensitive
    error:&error];

    NSArray *arrayOfAllMatches = [regex matchesInString:string
    options:0
    range:NSMakeRange(0, [string length])];

    //NSString *subStr;
    NSMutableArray *arr=[[NSMutableArray alloc] init];

    for (NSTextCheckingResult *match in arrayOfAllMatches){
        NSString* substringForMatch;
        substringForMatch = [string substringWithRange:match.range];
        [arr addObject:substringForMatch];
    }
    return arr;
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



//加载一张图片
- (void)LoadDataimagenum1:(GetListItem *)item{
    dispatch_queue_global_t downloadQueue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue=dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.original_pic]]];;
        dispatch_async(mainQueue, ^{
            self.thumbnail_pic1.image=image;
        });
    });
    self.thumbnail_pic1.frame=CGRectMake(20, 95+_text_Height, 300, 300);
    self.imageHeigh=300;
}
//加载两张图片
- (void)LoadDataimagenum2:(GetListItem *)item{
    [self LoadDataimagenum1:item];
    dispatch_queue_global_t downloadQueue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue=dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[item.pic_urls[1] objectForKey:@"thumbnail_pic"]]]];;
        dispatch_async(mainQueue, ^{
            self.thumbnail_pic2.image=image;
        });
    });
    self.thumbnail_pic1.frame=CGRectMake(10, 95+_text_Height, 180, 180);
    self.thumbnail_pic2.frame=CGRectMake(20, 95+_text_Height, 180, 180);
    self.imageHeigh=180;
}
//加载三张图片
- (void)LoadDataimagenum3:(GetListItem *)item{
    [self LoadDataimagenum2:item];
    dispatch_queue_global_t downloadQueue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue=dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[item.pic_urls[2] objectForKey:@"thumbnail_pic"]]]];;
        dispatch_async(mainQueue, ^{
            self.thumbnail_pic3.image=image;
        });
    });
    self.thumbnail_pic1.frame=CGRectMake(12, 95+_text_Height, 114, 114);
    self.thumbnail_pic2.frame=CGRectMake(138, 95+_text_Height, 114, 114);
    self.thumbnail_pic3.frame=CGRectMake(264, 95+_text_Height, 114, 114);
    self.imageHeigh=114;
}
//加载四张图片
- (void)LoadDataimagenum4:(GetListItem *)item{
    [self LoadDataimagenum3:item];
    dispatch_queue_global_t downloadQueue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue=dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[item.pic_urls[3] objectForKey:@"thumbnail_pic"]]]];;
        dispatch_async(mainQueue, ^{
            self.thumbnail_pic4.image=image;
        });
    });
    self.thumbnail_pic1.frame=CGRectMake(30, 95+_text_Height, 150, 150);
    self.thumbnail_pic2.frame=CGRectMake(210, 95+_text_Height, 150, 150);
    self.thumbnail_pic3.frame=CGRectMake(30, 265+_text_Height, 150, 150);
    self.thumbnail_pic4.frame=CGRectMake(210, 265+_text_Height, 150, 150);
    self.imageHeigh=320;
    
}
//加载五张图片
- (void)LoadDataimagenum5:(GetListItem *)item{
    [self LoadDataimagenum4:item];
    dispatch_queue_global_t downloadQueue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue=dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[item.pic_urls[4] objectForKey:@"thumbnail_pic"]]]];;
        dispatch_async(mainQueue, ^{
            self.thumbnail_pic5.image=image;
        });
    });
    self.thumbnail_pic1.frame=CGRectMake(12, 95+_text_Height, 114, 114);
    self.thumbnail_pic2.frame=CGRectMake(138, 95+_text_Height, 114, 114);
    self.thumbnail_pic3.frame=CGRectMake(264, 95+_text_Height, 114, 114);
    self.thumbnail_pic4.frame=CGRectMake(12, 221+_text_Height, 114, 114);
    self.thumbnail_pic5.frame=CGRectMake(138, 221+_text_Height, 114, 114);
    self.imageHeigh=240;
}
//加载六张图片
- (void)LoadDataimagenum6:(GetListItem *)item{
    [self LoadDataimagenum5:item];
    dispatch_queue_global_t downloadQueue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue=dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[item.pic_urls[5] objectForKey:@"thumbnail_pic"]]]];;
        dispatch_async(mainQueue, ^{
            self.thumbnail_pic6.image=image;
        });
    });
    self.thumbnail_pic1.frame=CGRectMake(12, 95+_text_Height, 114, 114);
    self.thumbnail_pic2.frame=CGRectMake(138, 95+_text_Height, 114, 114);
    self.thumbnail_pic3.frame=CGRectMake(264, 95+_text_Height, 114, 114);
    self.thumbnail_pic4.frame=CGRectMake(12, 221+_text_Height, 114, 114);
    self.thumbnail_pic5.frame=CGRectMake(138, 221+_text_Height, 114, 114);
    self.thumbnail_pic6.frame=CGRectMake(264, 221+_text_Height, 114, 114);
    self.imageHeigh=240;
}
//加载七张图片
- (void)LoadDataimagenum7:(GetListItem *)item{
    [self LoadDataimagenum6:item];
    dispatch_queue_global_t downloadQueue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue=dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[item.pic_urls[6] objectForKey:@"thumbnail_pic"]]]];;
        dispatch_async(mainQueue, ^{
            self.thumbnail_pic7.image=image;
        });
    });
    self.thumbnail_pic1.frame=CGRectMake(12, 95+_text_Height, 114, 114);
    self.thumbnail_pic2.frame=CGRectMake(138, 95+_text_Height, 114, 114);
    self.thumbnail_pic3.frame=CGRectMake(264, 95+_text_Height, 114, 114);
    self.thumbnail_pic4.frame=CGRectMake(12, 221+_text_Height, 114, 114);
    self.thumbnail_pic5.frame=CGRectMake(138, 221+_text_Height, 114, 114);
    self.thumbnail_pic6.frame=CGRectMake(264, 221+_text_Height, 114, 114);
    self.thumbnail_pic7.frame=CGRectMake(12, 347+_text_Height, 114, 114);
    self.imageHeigh=366;
}
//加载八张图片
- (void)LoadDataimagenum8:(GetListItem *)item{
    [self LoadDataimagenum7:item];
    dispatch_queue_global_t downloadQueue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue=dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[item.pic_urls[7] objectForKey:@"thumbnail_pic"]]]];;
        dispatch_async(mainQueue, ^{
            self.thumbnail_pic8.image=image;
        });
    });
    self.thumbnail_pic1.frame=CGRectMake(12, 95+_text_Height, 114, 114);
    self.thumbnail_pic2.frame=CGRectMake(138, 95+_text_Height, 114, 114);
    self.thumbnail_pic3.frame=CGRectMake(264, 95+_text_Height, 114, 114);
    self.thumbnail_pic4.frame=CGRectMake(12, 221+_text_Height, 114, 114);
    self.thumbnail_pic5.frame=CGRectMake(138, 221+_text_Height, 114, 114);
    self.thumbnail_pic6.frame=CGRectMake(264, 221+_text_Height, 114, 114);
    self.thumbnail_pic7.frame=CGRectMake(12, 347+_text_Height, 114, 114);
    self.thumbnail_pic8.frame=CGRectMake(138, 347+_text_Height, 114, 114);
    self.imageHeigh=366;
}
//加载九张图片
- (void)LoadDataimagenum9:(GetListItem *)item{
    [self LoadDataimagenum8:item];
    dispatch_queue_global_t downloadQueue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue=dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[item.pic_urls[8] objectForKey:@"thumbnail_pic"]]]];;
        dispatch_async(mainQueue, ^{
            self.thumbnail_pic9.image=image;
        });
    });
    self.thumbnail_pic1.frame=CGRectMake(12, 95+_text_Height, 114, 114);
    self.thumbnail_pic2.frame=CGRectMake(138, 95+_text_Height, 114, 114);
    self.thumbnail_pic3.frame=CGRectMake(264, 95+_text_Height, 114, 114);
    self.thumbnail_pic4.frame=CGRectMake(12, 221+_text_Height, 114, 114);
    self.thumbnail_pic5.frame=CGRectMake(138, 221+_text_Height, 114, 114);
    self.thumbnail_pic6.frame=CGRectMake(264, 221+_text_Height, 114, 114);
    self.thumbnail_pic7.frame=CGRectMake(12, 347+_text_Height, 114, 114);
    self.thumbnail_pic8.frame=CGRectMake(138, 347+_text_Height, 114, 114);
    self.thumbnail_pic9.frame=CGRectMake(264, 347+_text_Height, 114, 114);
    self.imageHeigh=366;
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
