//
//  BGShareViewController.m
//  WCProject
//
//  Created by dangMac on 16/7/22.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BGShareViewController.h"
#import "CWStarRateView.h"
#import "WCTool.h"
#import "wcHeader.h"


@interface BGShareViewController ()<UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *canteenName;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *recommend;
@property (weak, nonatomic) IBOutlet UIView *bgStar;
@property (weak, nonatomic) IBOutlet UIImageView *menuImageView;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end

@implementation BGShareViewController


- (void)setStarUI{
    
    CWStarRateView *start = [[CWStarRateView alloc] initWithFrame:CGRectMake(0, -5, 180, 30) numberOfStars:5];
    [self.bgStar addSubview:start];
    start.scorePercent = 0.5;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBGImage];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setStarUI];
    [self navigationStyle];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setBGImage{
    
    //附加毛玻璃效果
    UIVisualEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectview.frame = self.view.bounds;
    [self.bgImageView addSubview:effectview];
    
}

- (void)navigationStyle{
    self.title = @"分享";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:245.0/255 green:228.0/255 blue:0 alpha:1.0];
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}

//取消第一响应者
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.canteenName resignFirstResponder];
    [self.address resignFirstResponder];
    [self.recommend resignFirstResponder];
}
- (IBAction)seeSee:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    __weak typeof(self) ws = self;
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [ws openPhoto];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"打开相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [ws openPicture];
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


//打开相机的操作
- (void)openPhoto{
    UIImagePickerControllerSourceType sourseType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourseType;
        
        [self presentViewController:picker animated:YES completion:^{
            NSLog(@"打开相机成功");
        }];
    }else{
        NSLog(@"模拟器打开失败");
    }
}

//打开相册
- (void)openPicture{
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        
        [self presentViewController:picker animated:YES completion:^{
            NSLog(@"打开相册成功");
        }];
    }else{
        NSLog(@"打开相册失败");
    }
}
#pragma mark ----相册代理
//当选择一张图片后进入到这个协议方法里
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        NSData *data1;
        if (UIImagePNGRepresentation(image) == nil)
        {
            data1 = UIImageJPEGRepresentation(image, 1);
        }
        else
        {
            data1 = UIImagePNGRepresentation(image);
        }
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data1 attributes:nil];
        //得到选择后沙盒中图片的完整路径
        NSString *filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        long long abc = [self fileSizeAtPath:filePath];
        if (abc < 1024000) {
            self.menuImageView.image = image;
        }
        else {
            //如果图片尺寸过大则压缩
            UIImage *small = [WCTool imageWithImageSimple:image scaledToSize:CGSizeMake(image.size.width/4, image.size.height/4)];
            NSData *data;
            if (UIImagePNGRepresentation(small) == nil)
            {
                data = UIImageJPEGRepresentation(small, 0.25);
            }
            else
            {
                data = UIImagePNGRepresentation(small);
            }
            [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
            self.menuImageView.image = small;
        }
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:^{
            NSLog(@"关闭相册界面");
        }];
    }
}
//判断文件的大小
- (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"您取消了选择图片222");
    }];
}

//上传操作
- (void)postData
{
    
    NSString *picUrl = @"";
    AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    __weak typeof(self) weakSelf = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [manage POST:picUrl parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //上传图片
        NSData *data = UIImageJPEGRepresentation(self.menuImageView.image, 1.0);
        [formData appendPartWithFileData:data name:@"report_pic_path" fileName:@"image.png" mimeType:@"png"];
        //name-->对应数据库存储的字段
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if ([dict[@"message"] isEqualToString:@"数据插入成功"])
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [weakSelf showSuccessMsg:@"上传成功！"];
            //沙盒中图片的完整路径
            NSString *string1 = [NSHomeDirectory() stringByAppendingString:@"/Documents/image.jpg"];
            NSFileManager *fileManage = [NSFileManager defaultManager];
            [fileManage removeItemAtPath:string1 error:nil];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [weakSelf showSuccessMsg:@"上传失败！"];
    }];
}


- (IBAction)shareMenu:(id)sender {
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setHidden:NO];
    
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
