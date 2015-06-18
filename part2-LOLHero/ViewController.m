//
//  ViewController.m
//  part2-LOLHero
//
//  Created by Apple on 15/6/14.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "TTHero.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *heros;

@end

@implementation ViewController
//懒加载，保证heros只创建一遍就可以了
- (NSArray *)heros
{
    if (!_heros){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"heros.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array){
            TTHero *hero = [TTHero heroWithDict:dict];
            [arrayM addObject:hero];
        
        }
        
        _heros = [arrayM copy];
    }
    return _heros;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
/**
 *  可实现，可不实现，定义有几组，默认返回1（一组），只在tableview的group样式下有效。
 *
 *  @param tableView 当前tableview
 *
 *  @return 有几组
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

/**
 *  必须实现的数据源方法，定义每个section有几行
 *
 *  @param tableView 当前tableview
 *  @param section   第几组
 *
 *  @return 每个section有几行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    return -1;
}

/**
 *  必须实现的数据源方法，返回每个cell的样式，类型为UITableViewCell，它继承于view
 *
 *  @param tableView 当前tableview
 *  @param indexPath 索引 indexpath.section(第几组) indexpath.row(第几行)
 *
 *  @return UITableViewCell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"heroCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    TTHero *hero = self.heros[indexPath.row];
    
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
    return  cell;
}

#pragma mark - UITableViewDelegate
/**
 *  行高
 *
 *  @param tableView 当前tableview
 *  @param indexPath 索引 indexpath.section(第几组) indexpath.row(第几行)
 *
 *  @return 高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

/**
 *  选中行的索引，用来触发选中时的动作
 *
 *  @param tableView 同上
 *  @param indexPath 同上
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"%ld,%ld",(long)indexPath.section,(long)indexPath.row] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
@end
