//
//  UIColor+i7HexColor.m
//  
//
//  Created by Jonas Schnelli on 01.07.10.
//  Copyright 2010 include7 AG. All rights reserved.
//

#import "UIColor+i7HexColor.h"


@implementation UIColor (i7HexColor)

+ (UIColor *)colorWithHexString:(NSString *)hexString {
	
	/* convert the string into a int */
	unsigned int colorValue;
	NSString *hexStringCleared = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
	if(hexStringCleared.length == 3) {
		/* short color form */
		/* im lazy, maybe you have a better idea to convert from #fff to #ffffff */
		hexStringCleared = [NSString stringWithFormat:@"%@%@%@%@%@%@", [hexStringCleared substringWithRange:NSMakeRange(0, 1)],[hexStringCleared substringWithRange:NSMakeRange(0, 1)],
												[hexStringCleared substringWithRange:NSMakeRange(1, 1)],[hexStringCleared substringWithRange:NSMakeRange(1, 1)],
												[hexStringCleared substringWithRange:NSMakeRange(2, 1)],[hexStringCleared substringWithRange:NSMakeRange(2, 1)]];
	}
	if(hexStringCleared.length == 6) {
		hexStringCleared = [hexStringCleared stringByAppendingString:@"ff"];
	}
	[[NSScanner scannerWithString:hexStringCleared] scanHexInt:&colorValue];
	
	/* now build the UIColor with standard allocators */
	return [UIColor colorWithRed:((colorValue)&0xFF)/255.0 
					green:((colorValue>>8)&0xFF)/255.0 
					 blue:((colorValue>>16)&0xFF)/255.0 
					alpha:((colorValue>>24)&0xFF)/255.0];
	
}

@end
