
/**
 *  gitee相关接口
 */

//服务器相关
const kServerUrl =  "https://gitee.com/";
const kClientId = "1abc433bdef04fd12d0e5d3d35ec66e20e74d09af983f2b7437fb8d00d339d18";
const kClientSecret = "d9939416a88c1499eeeba12aa0e78bfe4c4bde164a26522dc902f6dc87b2d667";
//登录相关api
const kLoginApi = "/oauth/token";
// const kRefreshTokenApi = "/oauth/token?grant_type=refresh_token&refresh_token=";
//获取授权用户资料
const kMyUserProfileApi = "api/v5/user";
//用户profile
const kUserProfileApi = "api/v5/users/";
//用户关注状态
const kUserFollowSateApi = "api/v5/user/following/";

//动态
const kUserEvents = "api/v5/users/{username}/events";
//

//获取授权用户的所有私信
const kMessagesApi = "api/v5/notifications/messages";
