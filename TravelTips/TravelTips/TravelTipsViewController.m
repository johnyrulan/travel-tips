//
//  ViewController.m
//  TravelTips
//
//  Created by Johny Rulan on 11/11/13.
//  Copyright (c) 2013 Johny Rulan. All rights reserved.
//

#import "TravelTipsViewController.h"

@interface TravelTipsViewController ()
    @property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation TravelTipsViewController 

- (void)viewDidLoad
{
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
        
    // Parse JSON
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"countries"
                                                         ofType:@"json"];
    
    NSData* jsonData = [NSData dataWithContentsOfFile:filePath];
    
    self.countries = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:0
                                                       error:nil];
}

# pragma mark - Picker Actions
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.countries.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    NSDictionary* countryData = [self.countries objectAtIndex:row];
    return [countryData objectForKey:@"name"];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    
}

# pragma mark - Table Actions

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section %d", section];
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return <#expression#>
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 4 == 0) {
        return 120;
    }
    else {
        return 44;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NSDictionary* countryData = [self.countries objectAtIndex:indexPath.row];
    // tableCell.textLabel.text = [countryData objectForKey:@"name"];
    // tableCell.detailTextLabel.text = [countryData objectForKey:@"currency"];
    
    UITableViewCell* tableCell;
    
    if (indexPath.row % 4 == 0) {
        tableCell = [tableView dequeueReusableCellWithIdentifier:@"Image"];
    }
    else {
        tableCell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    }
    
    return tableCell;
}

@end
