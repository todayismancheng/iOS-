//
//  NSString+MCExtension.m
//  iOS工具类
//
//  Created by SGD on 16/12/8.
//  Copyright © 2016年 luoyang_. All rights reserved.
//

#import "NSString+MCCategory.h"

@implementation NSString (MCCategory)

- (CGFloat)heightWithFont:(CGFloat )font{
    
    CGSize size = [self sizeWithFont:font width:MAXFLOAT];
    return size.height;
}

- (CGFloat)widthWithFont:(CGFloat)font{
    
    CGRect textRect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                         options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                         context:nil];
    
    return ceil(textRect.size.width);
}

- (CGSize)singleLineSizeWithFont:(CGFloat)font{
    
    CGRect textRect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                         options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                         context:nil];
    CGFloat w = ceil(textRect.size.width);
    CGFloat h = font;
    return CGSizeMake(w, h);
}

- (CGSize)sizeWithFont:(CGFloat)font width:(CGFloat)width{
    
    CGRect textRect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                         options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                         context:nil];
    CGFloat h = ceil(textRect.size.height);
    
    return CGSizeMake(width, h);
}


- (NSDate *)dateWithDateFormat:(NSString *)formatStr{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatStr];
    NSDate *date = [formatter dateFromString:self];
    
    return date;
}

+ (NSString *)stringWithUUID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string;
}
@end
