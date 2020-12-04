//
//  ViewController.m
//  ObjCResult
//
//  Created by Andrii Serohin on 15.07.2020.
//  Copyright © 2020 Andrii Serohin. All rights reserved.
//

#import "ViewController.h"
#import "PBResult.h"

#import "ObjCResult-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getWithResult:[PBResult success:@"Value"]];
}


@end
