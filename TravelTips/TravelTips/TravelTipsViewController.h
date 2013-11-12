//
//  ViewController.h
//  TravelTips
//
//  Created by Fred Schweig on 11/11/13.
//  Copyright (c) 2013 Johny Rulan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TravelTipsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate>
    @property (strong, nonatomic) NSMutableArray* countries;
@end
