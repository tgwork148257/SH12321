//
//  ReportPhoneNumberIndentificationVC.m
//  SH12321
//
//  Created by Tommy on 6/23/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportPhoneNumberIndentificationVC.h"
#import "SHOperatorsListVC.h"
#import "SHIllegalReasonListVC.h"
#import "UploadImageItemView.h"

@interface ReportPhoneNumberIndentificationVC () <SelectTimeViewDelegate, UITextViewDelegate, SelectTypeViewDelegate, SHOperatorsListVCDelegate, SHIllegalReasonListVCDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, SHAreasListVCDelegate>

@end

@implementation ReportPhoneNumberIndentificationVC{
    
    UIScrollView *scrollView;
    UIView *reportView;
    ReportItemLabel *reportTypeLabel;
    SelectTypeView *reportStoreTypeView;
    
    SelectItemView *selectIllegalReasonItemView;
    
    ReportItemLabel *reportStoreNameLabel;
    ReportItemTextField *reportStoreNameTextField;
    
    ReportItemLabel *reportPhoneNumberLabel;
    ReportItemTextField *reportPhoneNumberTextField;
    
    SelectItemView *selectTimeItemView;
    SelectItemView *selectOperatorsItemView;
    
    ReportItemLabel *reportEntityStoreAdressLabel;
    SelectItemView *cityView;
    SelectItemView *areaView;
    SelectItemView *streetView;
    ReportItemTextView *detailAdressTextView;
    
    ReportItemLabel *reportInternetStoreLabel;
    ReportItemTextField *reportInternetStoreTextField;
    
    ReportItemLabel *reportTimeLengthLabel;
    SelectTypeView *reportTimeLengthView;
    
    UploadImageItemView *orderUploadImageItemView;
    
    UploadImageItemView *ownUploadImageItemView;
    
    ReportItemLabel *reportContentLabel;
    ReportItemTextView *reportContentTextView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
    
    NSArray *storeTypeArr;
    NSArray *internetStoreIllegalReasonArr;
    NSArray *entityStoreIllegalReasonArr;
    NSArray *crankTypeArr;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报骚扰电话";
    [super viewDidLoad];
    
    self.view.backgroundColor = grayBgColor;
    
    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    
    storeTypeArr = @[@"实体店",@"网店"];
    internetStoreIllegalReasonArr = @[@"配送已激活卡，预选号环节不要求上传身份证扫描信息",
                                      @"配送已激活卡，预选号环节未对上传身份信息联网核验",
                                      @"配送已激活卡，物流环节未确认'人、证、网上提交信息一致",
                                      @"配送未激活卡，收卡后未上传或未联网核验本人身份信息",
                                      @"无授权代理标志"];
    entityStoreIllegalReasonArr = @[@"无需本人身份证原件即售卡",@"无二代证识别设备",@"无统一的授权代理标志"];
    crankTypeArr = @[@"色情",@"发票",@"赌博",@"违禁品",@"高利贷",@"反动",@"广告骚扰"];
    [self addSubviews];
}

- (void)addSubviews{
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H + TABBAR_H)];
    [self.view addSubview:scrollView];
    
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    [scrollView addSubview:reportView];
    
    reportTypeLabel = [ReportItemLabel initWithY:0 title:@"举报类型" superView:reportView];
    reportStoreTypeView = [SelectTypeView initWithY:reportTypeLabel.y + reportTypeLabel.height superView:reportView];
    [reportStoreTypeView addTitles:storeTypeArr];
    reportStoreTypeView.delegate = self;
    
    selectIllegalReasonItemView = [SelectItemView initWithY:reportStoreTypeView.y + reportStoreTypeView.height itemStr:@"违规原因" superView:reportView];
    selectTimeItemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *selectIllegalReasonTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectIllegalReason)];
    [selectTimeItemView addGestureRecognizer:selectIllegalReasonTap];
    
    reportStoreNameLabel = [ReportItemLabel initWithY:reportStoreTypeView.y + reportStoreTypeView.height title:@"网店或者实体店名称" superView:reportView];
    reportStoreNameTextField = [ReportItemTextField initWithY:reportStoreNameLabel.y + reportStoreNameLabel.height placeholder:@"请填写网店或者实体店名称" superView:reportView];
    
    reportPhoneNumberLabel = [ReportItemLabel initWithY:reportStoreNameTextField.y + reportStoreNameTextField.height title:@"手机号码" superView:reportView];
    reportPhoneNumberTextField = [ReportItemTextField initWithY:reportPhoneNumberLabel.y + reportPhoneNumberLabel.height placeholder:@"请填写购买的手机号码" superView:reportView];
    
    selectTimeItemView = [SelectItemView initWithY:reportPhoneNumberTextField.y + reportPhoneNumberTextField.height itemStr:@"选择购卡时间" superView:reportView];
    selectTimeItemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *selectTimeItemViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectTime)];
    [selectTimeItemView addGestureRecognizer:selectTimeItemViewTap];
    
    selectOperatorsItemView = [SelectItemView initWithY:selectTimeItemView.y + selectTimeItemView.height itemStr:@"选择运营商" superView:reportView];
    selectOperatorsItemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *selectOperatorsTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectOperatorsTap)];
    [selectOperatorsItemView addGestureRecognizer:selectOperatorsTap];
    
    reportEntityStoreAdressLabel = [ReportItemLabel initWithY:selectOperatorsItemView.y + selectOperatorsItemView.height title:@"实体店地址" superView:reportView];
    cityView = [SelectItemView initWithY:reportEntityStoreAdressLabel.y + reportEntityStoreAdressLabel.height itemStr:@"上海市" superView:reportView];
    areaView = [SelectItemView initWithY:cityView.y + cityView.height itemStr:@"选择区县" superView:reportView];
    areaView.userInteractionEnabled = YES;
    UITapGestureRecognizer *areaViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(areaViewTap)];
    [areaView addGestureRecognizer:areaViewTap];
    
    streetView = [SelectItemView initWithY:areaView.y + areaView.height itemStr:@"选择街道" superView:reportView];
    detailAdressTextView = [ReportItemTextView initWithY:streetView.y + streetView.height placeholder:@"请输入详细地址" superView:reportView];
    detailAdressTextView.delegate = self;
    
    
    reportInternetStoreLabel = [ReportItemLabel initWithY:detailAdressTextView.y + detailAdressTextView.height title:@"网店或者实体店名称" superView:reportView];
    reportInternetStoreTextField = [ReportItemTextField initWithY:reportInternetStoreLabel.y + reportInternetStoreLabel.height placeholder:@"请填写网店或者实体店名称" superView:reportView];
    
    orderUploadImageItemView = [UploadImageItemView initWithY:reportInternetStoreTextField.y + reportInternetStoreTextField.height title:@"订单确认照片" superView:reportView];
    orderUploadImageItemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *orderUploadImageItemViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(orderUploadImageItemViewTap)];
    [orderUploadImageItemView addGestureRecognizer:orderUploadImageItemViewTap];
    
    ownUploadImageItemView = [UploadImageItemView initWithY:orderUploadImageItemView.y + orderUploadImageItemView.height title:@"本人持卡照片" superView:reportView];
    ownUploadImageItemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *ownUploadImageItemViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ownUploadImageItemViewTap)];
    [ownUploadImageItemView addGestureRecognizer:ownUploadImageItemViewTap];
    
    
    reportContentLabel = [ReportItemLabel initWithY:ownUploadImageItemView.y + ownUploadImageItemView.height title:@"骚扰内容" superView:reportView];
    reportContentTextView = [ReportItemTextView initWithY:reportContentLabel.y + reportContentLabel.height placeholder:@"请输入骚扰内容" superView:reportView];
    reportContentTextView.delegate = self;
    
    reportView.frame = CGRectMake(0, 0, DEVICE_W, reportContentTextView.y + reportContentTextView.height);
    
    
    
    commitBtn = [CommitButton initWithY:reportView.y + reportView.height + commitBtnTopGap superView:scrollView];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
    scrollView.contentSize = CGSizeMake(DEVICE_W, commitBtn.y + commitBtn.height + commitBtnBottomGap);
    
}

- (void)textViewDidChange:(UITextView *)textView{
    if (!EMPTY_STRING(textView.text)) {
        for (UIView *view in textView.subviews) {
            if (view.tag == placeholderLabelTag) {
                TGLabel *placeholderLabel = (TGLabel *)view;
                placeholderLabel.hidden = YES;
            }
        }
    }else{
        for (UIView *view in textView.subviews) {
            if (view.tag == placeholderLabelTag) {
                TGLabel *placeholderLabel = (TGLabel *)view;
                placeholderLabel.hidden = NO;
            }
        }
    }
}


- (void)selectTypeStr:(NSString *)str{
    if ([str isEqualToString:[storeTypeArr objectAtIndex:0]]) {
        
        reportTimeLengthLabel.hidden = YES;
        reportTimeLengthView.hidden = YES;
        
        selectTimeItemView.hidden = YES;
        
        reportContentLabel.hidden = YES;
        reportContentTextView.hidden = YES;
        
        reportView.height = reportContentTextView.y + reportContentTextView.height;
        
    }else{
        
        
        reportTimeLengthLabel.hidden = NO;
        reportTimeLengthView.hidden = NO;
        
        selectTimeItemView.hidden = NO;
        
        reportContentLabel.hidden = NO;
        reportContentTextView.hidden = NO;
        
        reportView.height = reportContentTextView.y + reportContentTextView.height;
    }
    
    commitBtn.y = reportView.y + reportView.height + commitBtnTopGap;
    
    scrollView.contentSize = CGSizeMake(DEVICE_W, commitBtn.y + commitBtn.height + commitBtnBottomGap);
}

#pragma mark - Select Area
- (void)areaViewTap{
    SHAreasListVC *vc = [[SHAreasListVC alloc] init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)backArea:(NSString *)backAreaStr{
    [areaView addItemStr:backAreaStr];
}

#pragma mark - select illegal reason
- (void)selectIllegalReason{
    SHIllegalReasonListVC *vc = [[SHIllegalReasonListVC alloc] init];
    
    if ([reportStoreTypeView getSelectIndex] == 0) {
        vc.tableviewData = entityStoreIllegalReasonArr;
    }else{
        vc.tableviewData = internetStoreIllegalReasonArr;
    }
    
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)backIllegalReason:(NSString *)backReasonStr{
    [selectIllegalReasonItemView addItemStr:backReasonStr];
}

#pragma mark - select Operators
- (void)selectOperatorsTap{
    SHIllegalReasonListVC *vc = [[SHIllegalReasonListVC alloc] init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)backOperators:(NSString *)backOperatorsStr{
    [selectOperatorsItemView addItemStr:backOperatorsStr];
}

#pragma mark - select Time
- (void)selectTime{
    SelectTimeView *selectTimeView = [SelectTimeView initWithY:DEVICE_H - selectTimeViewH superView:self.view];
    selectTimeView.delegate = self;
    [selectTimeView addSubviews];
}

- (void)selectTimeWithYear:(NSString *)yaer month:(NSString *)month day:(NSString *)day time:(NSString *)time{
    NSString *dateTimeStr = [[[yaer stringByAppendingString:month] stringByAppendingString:day] stringByAppendingString:time];
    [selectTimeItemView addItemStr:dateTimeStr];
}


- (void)commitReport{
    model.reportStoreType = [reportStoreTypeView getSelectIndex];
    model.reportName = reportStoreNameTextField.text;
//    model.reportCrankCallType = [reportCrankTypeView getSelectIndex];
//    model.reportCrankCallStatus = [reportCrankFormView getSelectIndex];
    model.reportTimeLength = [reportTimeLengthView getSelectIndex];
    model.reportTime = [selectTimeItemView itemStr];
    model.reportContent = reportContentTextView.text;
    [[TGService sharedInstance] commitReportWithData:model success:^(id responseObject) {
        [TGToast showWithText:@"举报成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^{
        [TGToast showWithText:@"举报失败，请重试"];
    }];
}

- (void)orderUploadImageItemViewTap{
    UIActionSheet *ac = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
    [ac showInView:self.view];
}

- (void)ownUploadImageItemViewTap{
    UIActionSheet *ac = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
    [ac showInView:self.view];
}

#pragma mark -- actionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0://拍照
        {
            [self startCameraControllerFromViewController: self
                                            usingDelegate: self];
            break;
        }
        case 1://本地相册
        {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            
            //指定源类型前，检查图片源是否可用
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
                //指定源的类型
                //        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                
                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                
                //在选定图片之前，用户可以简单编辑要选的图片。包括上下移动改变图片的选取范围，用手捏合动作改变图片的大小等。
                imagePicker.allowsEditing = YES;
                
                //实现委托，委托必须实现UIImagePickerControllerDelegate协议，来对用户在图片选取器中的动作
                imagePicker.delegate = self;
                
                //设置完iamgePicker后，就可以启动了。用以下方法将图像选取器的视图“推”出来
                [self presentViewController:imagePicker animated:YES completion:^{ }];
            }else{
                UIAlertView *alert =[[UIAlertView alloc] initWithTitle:nil message:@"相机不能用" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil];
                [alert show];
            }
            break;
        }
        case 2: //取消
            break;
        default:
            break;
    }
}

- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller
                                   usingDelegate: (id <UIImagePickerControllerDelegate,
                                                   UINavigationControllerDelegate>) delegate{
    // here, check the device is available  or not
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeCamera] == NO)
        || (delegate == nil)|| (controller == nil)) return NO;
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    cameraUI.allowsEditing = YES;    //是否在拍照时让编辑
    cameraUI.delegate = delegate;
    [controller presentViewController:cameraUI animated:YES completion:^{}];
    return YES;
}

#pragma  mark UIImagePickerControllerDelegate协议的方法
//用户点击图像选取器中的“cancel”按钮时被调用，这说明用户想要中止选取图像的操作
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

//用户点击选取器中的“choose”按钮时被调用，告知委托对象，选取操作已经完成，同时将返回选取图片的实例
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
//    uploadImage = image;
//    friendsPicImageView.image = image;
//    [self uploadPicAndCreateCommunity];
    [picker dismissViewControllerAnimated:YES completion:^{}];
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    }
}



@end
