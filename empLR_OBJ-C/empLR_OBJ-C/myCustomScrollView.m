//
//  myCustomScrollView.m
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 28/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "myCustomScrollView.h"

@implementation myCustomScrollView
- (BOOL)touchesShouldCancelInContentView:(UIView *)view
   {
       NSLog(@"touchesShouldCancelInContentView");

       if (view.tag == 99)
           return NO;
       else
           return YES;
   }

@end
