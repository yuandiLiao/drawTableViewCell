//
//  ExampleViewController.m
//  drawTableViewCell
//
//  Created by yuandiLiao on 2017/6/1.
//  Copyright © 2017年 yuandiLiao. All rights reserved.
//

#import "ExampleViewController.h"
#import "UITableView+MoveCell.h"

@interface ExampleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = [[NSMutableArray alloc] init];
    if (self.count) {
        for (NSInteger i = 0; i<4; i++) {
            NSMutableArray *array = [[NSMutableArray alloc] init];
            for (NSInteger j = 0; j<10; j++) {
                [array addObject:[NSString stringWithFormat:@"我是第%ld组第%ld个",(long)i,j]];
            }
            [self.dataArray addObject:array];
        }

    }else{
        for (NSInteger i = 0; i<30; i++) {
            [self.dataArray addObject:[NSString stringWithFormat:@"我是第%ld个",i]];
        }
    }
    [self.view addSubview:self.tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.count) {
        return self.dataArray.count;
    }else{
        return 1;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.count) {
        NSArray *array = self.dataArray[section];
        return array.count;
    }else{
        return self.dataArray.count;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (tableViewCell == nil) {
        tableViewCell = [[UITableViewCell alloc] init];
    }
    if (self.count) {
        NSArray *array = self.dataArray[indexPath.section];
        tableViewCell.textLabel.text = array[indexPath.row];

    }else{
        tableViewCell.textLabel.text = self.dataArray[indexPath.row];
    }
    tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableViewCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        __weak typeof(self) weakSelf = self;
        [_tableView setDataWithArray:self.dataArray withBlock:^(NSMutableArray *newArray) {
            weakSelf.dataArray = newArray;
        }];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
