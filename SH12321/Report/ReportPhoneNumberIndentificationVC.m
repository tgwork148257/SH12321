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
    SelectItemView *areaView;
    ReportItemTextView *detailAdressTextView;
    
    ReportItemLabel *reportStoreLabel;
    ReportItemTextField *reportStoreTextField;
    
    ReportItemLabel *reportTimeLengthLabel;
    SelectTypeView *reportTimeLengthView;
    
    UploadImageItemView *storeUploadImageItemView;
    
    UploadImageItemView *ownUploadImageItemView;
    
    ReportItemLabel *reportContentLabel;
    ReportItemTextView *reportContentTextView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
    
    BOOL isClickStoreImageItemView;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报骚扰电话";
    [super viewDidLoad];
    
    self.view.backgroundColor = grayBgColor;
    
    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    

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
    areaView = [SelectItemView initWithY:reportEntityStoreAdressLabel.y + reportEntityStoreAdressLabel.height itemStr:@"选择区县" superView:reportView];
    areaView.userInteractionEnabled = YES;
    UITapGestureRecognizer *areaViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(areaViewTap)];
    [areaView addGestureRecognizer:areaViewTap];
    
    detailAdressTextView = [ReportItemTextView initWithY:areaView.y + areaView.height placeholder:@"请输入详细地址" superView:reportView];
    detailAdressTextView.delegate = self;
    
    
    reportStoreLabel = [ReportItemLabel initWithY:detailAdressTextView.y + detailAdressTextView.height title:@"实体店或者网店名称" superView:reportView];
    reportStoreTextField = [ReportItemTextField initWithY:reportStoreLabel.y + reportStoreLabel.height placeholder:@"请填写实体店或者实网店名称" superView:reportView];
    
    storeUploadImageItemView = [UploadImageItemView initWithY:reportStoreTextField.y + reportStoreTextField.height title:@"实体店或者订单确认照片" superView:reportView];
    storeUploadImageItemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *storeUploadImageItemViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(storeUploadImageItemViewTap)];
    [storeUploadImageItemView addGestureRecognizer:storeUploadImageItemViewTap];
    
    ownUploadImageItemView = [UploadImageItemView initWithY:storeUploadImageItemView.y + storeUploadImageItemView.height title:@"本人持卡照片" superView:reportView];
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
        [reportStoreNameLabel addText:@"实体店名称"];
        [reportStoreLabel addText:@"实体店地址"];
        reportStoreTextField.placeholder = @"请填写实体店地址";
        reportStoreNameTextField.placeholder = @"请填写实体店名称";
        [storeUploadImageItemView addTitle:@"实体店照片"];
        
        reportEntityStoreAdressLabel.hidden = YES;
        
        areaView.hidden = YES;
        
        detailAdressTextView.hidden = YES;
        
        reportStoreLabel.y = reportEntityStoreAdressLabel.y;
        
    }else{
        [reportStoreNameLabel addText:@"网店名称"];
        [reportStoreLabel addText:@"网店地址"];
        reportStoreTextField.placeholder = @"请填写网店地址";
        reportStoreNameTextField.placeholder = @"请填写网店名称";
        [storeUploadImageItemView addTitle:@"订单确认照片"];
        
        reportEntityStoreAdressLabel.hidden = NO;
        
        areaView.hidden = NO;
        
        detailAdressTextView.hidden = NO;
        
        reportStoreLabel.y = detailAdressTextView.y + detailAdressTextView.height;
    }
    
    reportStoreTextField.y = reportStoreLabel.y + reportStoreLabel.height;
    
    storeUploadImageItemView.y = reportStoreTextField.y + reportStoreTextField.height;
    
    ownUploadImageItemView.y = storeUploadImageItemView.y + storeUploadImageItemView.height;
    
    reportContentLabel.y = ownUploadImageItemView.y + ownUploadImageItemView.height;
    
    reportContentTextView.y = reportContentLabel.y + reportContentLabel.height;
    
    reportView.height = reportContentTextView.y + reportContentTextView.height;
    
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
    if (EMPTY_STRING(reportStoreTypeView.typeTitle)) {
        [TGToast showWithText:@"请先选择举报类型"];
        return;
    }
    SHIllegalReasonListVC *vc = [[SHIllegalReasonListVC alloc] init];
    
    if ([reportStoreTypeView selectIndex] == 0) {
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
    SHOperatorsListVC *vc = [[SHOperatorsListVC alloc] init];
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
    NSString *dateTimeStr = [NSString stringWithFormat:@"%@年%@月%@日: %@",yaer, month, day, time];
    [selectTimeItemView addItemStr:dateTimeStr];
}


- (void)commitReport{
//    if (EMPTY_STRING(reportStoreNameTextField.text)) {
//        [TGToast showWithText:@"请输入举报店名称"];
//        return;
//    }
    
    if (EMPTY_STRING(reportPhoneNumberTextField.text)) {
        [TGToast showWithText:@"请输入举报号码"];
        return;
    }
    
    
    if (EMPTY_STRING([selectTimeItemView itemStr])) {
        [TGToast showWithText:@"请选择举报时间"];
        return;
    }
    
    if (EMPTY_STRING([selectTimeItemView itemStr])) {
        [TGToast showWithText:@"请选择举报时间"];
        return;
    }
    
    model.reportType = ReportPhoneNumberIndentification;
    model.reportTypeStr = reportStoreTypeView.typeTitle;
    model.reportName = reportStoreNameTextField.text;
    model.buyTime = [selectTimeItemView itemStr];
    model.reportBuyNumber = reportPhoneNumberTextField.text;
    model.reportOperatorsTypeStr = [selectOperatorsItemView itemStr];
    model.reportAdress = detailAdressTextView.text;
    model.userImageStr = nil;
    model.storeImageStr = nil;
    model.reportContent = reportContentTextView.text;
    [[TGService sharedInstance] commitReportWithData:model success:^(id responseObject) {
        if ([[responseObject objectForKey:@"code"] integerValue] == 200) {
            [TGToast showWithText:@"举报成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [TGToast showWithText:@"举报失败"];
        }
    } fail:^{
        [TGToast showWithText:@"举报失败，请重试"];
    }];
}

- (void)storeUploadImageItemViewTap{
    UIActionSheet *ac = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
    [ac showInView:self.view];
    isClickStoreImageItemView = YES;
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [self startCameraControllerFromViewController: self
//                                        usingDelegate: self];
//    }];
//    UIAlertAction *localPhotosAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
//        
//        //指定源类型前，检查图片源是否可用
//        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
//            //指定源的类型
//            //        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
//            
//            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//            
//            //在选定图片之前，用户可以简单编辑要选的图片。包括上下移动改变图片的选取范围，用手捏合动作改变图片的大小等。
//            imagePicker.allowsEditing = YES;
//            
//            //实现委托，委托必须实现UIImagePickerControllerDelegate协议，来对用户在图片选取器中的动作
//            imagePicker.delegate = self;
//            
//            //设置完iamgePicker后，就可以启动了。用以下方法将图像选取器的视图“推”出来
//            [self presentViewController:imagePicker animated:YES completion:^{ }];
//        }else{
//            UIAlertView *alert =[[UIAlertView alloc] initWithTitle:nil message:@"相机不能用" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil];
//            [alert show];
//        }
//    }];
//    [alertController addAction:cancelAction];
//    [alertController addAction:cameraAction];
//    [alertController addAction:localPhotosAction];
//    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)ownUploadImageItemViewTap{
    UIActionSheet *ac = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
    [ac showInView:self.view];
    isClickStoreImageItemView = NO;
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
    if (isClickStoreImageItemView == YES) {
        [storeUploadImageItemView addImageView:image];
    }else{
        [ownUploadImageItemView addImageView:image];
    }
//    [self uploadPicAndCreateCommunity];
    [picker dismissViewControllerAnimated:YES completion:^{}];
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    }
}


@end
