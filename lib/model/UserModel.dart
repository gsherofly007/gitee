/*
* 用户相关model
* */
class UserModel {
  int? id;
  String? login;
  String? name;
  String? avatarUrl;
  String? url;
  String? htmlUrl;
  String? remark;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  String? blog;
  Null? weibo;
  Null? bio;
  int? publicRepos;
  int? publicGists;
  int? followers;
  int? following;
  int? stared;
  int? watched;
  String? createdAt;
  String? updatedAt;
  Null? email;

  UserModel(
      {this.id,
        this.login,
        this.name,
        this.avatarUrl,
        this.url,
        this.htmlUrl,
        this.remark,
        this.followersUrl,
        this.followingUrl,
        this.gistsUrl,
        this.starredUrl,
        this.subscriptionsUrl,
        this.organizationsUrl,
        this.reposUrl,
        this.eventsUrl,
        this.receivedEventsUrl,
        this.type,
        this.blog,
        this.weibo,
        this.bio,
        this.publicRepos,
        this.publicGists,
        this.followers,
        this.following,
        this.stared,
        this.watched,
        this.createdAt,
        this.updatedAt,
        this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    name = json['name'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
    htmlUrl = json['html_url'];
    remark = json['remark'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    blog = json['blog'];
    weibo = json['weibo'];
    bio = json['bio'];
    publicRepos = json['public_repos'];
    publicGists = json['public_gists'];
    followers = json['followers'];
    following = json['following'];
    stared = json['stared'];
    watched = json['watched'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['name'] = this.name;
    data['avatar_url'] = this.avatarUrl;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['remark'] = this.remark;
    data['followers_url'] = this.followersUrl;
    data['following_url'] = this.followingUrl;
    data['gists_url'] = this.gistsUrl;
    data['starred_url'] = this.starredUrl;
    data['subscriptions_url'] = this.subscriptionsUrl;
    data['organizations_url'] = this.organizationsUrl;
    data['repos_url'] = this.reposUrl;
    data['events_url'] = this.eventsUrl;
    data['received_events_url'] = this.receivedEventsUrl;
    data['type'] = this.type;
    data['blog'] = this.blog;
    data['weibo'] = this.weibo;
    data['bio'] = this.bio;
    data['public_repos'] = this.publicRepos;
    data['public_gists'] = this.publicGists;
    data['followers'] = this.followers;
    data['following'] = this.following;
    data['stared'] = this.stared;
    data['watched'] = this.watched;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['email'] = this.email;
    return data;
  }
}
