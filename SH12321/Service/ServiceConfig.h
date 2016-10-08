//
//  ServiceConfig.h
//  SH12321
//
//  Created by Tommy on 6/13/16.
//  Copyright © 2016 12321. All rights reserved.
//

#ifndef ServiceConfig_h
#define ServiceConfig_h

static NSString * const APP_API_BASIC_URL_TEST = @"http://12321.shyytx.cn/index.php/";
//static NSString * const APP_API_BASIC_URL_DEBUG = @"http://12321.shyytx.cn/index.php/";
//static NSString * const APP_API_BASIC_URL_RELEASE = @"http://api.romic.orz.meimi.me/";

#define BASIC_URL  APP_API_BASIC_URL_TEST

static NSString * const GET_TOKEN = @"App/getToken";

static NSString * const GET_CODE = @"App/getCode";

static NSString * const GET_USER_TOKEN = @"App/getUserToken";

static NSString * const GET_UPLOAD_PIC = @"App/uploadPic";

static NSString * const GET_NEWS_LIST = @"App/newsList";

static NSString * const GET_NEWS_DETAIL = @"App/getNewsDetails";

static NSString * const GET_REPORT_LIST = @"App/reportList";

static NSString * const GET_REPORT_DETAIL = @"App/getReportDetails";


static NSString * const COMMIT_REPORT_CRANK_CALL = @"App/harassMobile";

static NSString * const COMMIT_REPORT_SCRAM_CALL = @"App/cheatMobile";

static NSString * const COMMIT_REPORT_MESSAGE = @"App/reportMessage";

static NSString * const COMMIT_REPORT_WEBSITE = @"App/reportWebsite";

static NSString * const COMMIT_REPORT_WIFI = @"App/reportWifi";

static NSString * const COMMIT_REPORT_EMAIL = @"App/";

static NSString * const COMMIT_REPORT_APP = @"App/reportApp";

static NSString * const COMMIT_REPORT_FAKE_BASIC_STATION = @"App/reportBaseStation";

static NSString * const COMMIT_REPORT_PHONE_NUMBER_IDENTIFICATION = @"App/reportRealName";

static NSString * const COMMIT_REPORT_INFO_REVEAL = @"App/messageOut";

static NSString * const COMMIT_REPORT_BAD_NEWS = @"App/reportOpinion";

static NSString * const COMMIT_REPORT_FRIGMENT = @"App/reportIPR";

static NSString * const COMMIT_REPORT_OTHERS = @"App/reportOther";

static NSString * const COMMIT_UPDATE_VERSION = @"App/updateVersion";

static NSString * const COMMIT_REPORT_FEEDBACK = @"App/reportFeedback";

static NSString * const COMMIT_USER_ADD_USERINFO = @"App/addUserInfo";

static NSString * const COMMIT_USER_GET_USERINFO = @"App/getUserInfo";

static NSString * const COMMIT_USER_MODIFY_USERINFO = @"App/alterUserInfo";



#endif /* ServiceConfig_h */
