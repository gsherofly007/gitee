class UserMessageListModel {
  int? totalCount;
  List<UserMessageModel>? list;

  UserMessageListModel({this.totalCount, this.list});

  UserMessageListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    if (json['list'] != null) {
      list = <UserMessageModel>[];
      json['list'].forEach((v) {
        list!.add(UserMessageModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    if (this.list != null) {
      data['list'] = this.list?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserMessageModel {
  int? id;
  Sender? sender;
  bool? unread;
  String? content;
  String? updatedAt;
  String? url;
  String? htmlUrl;

  UserMessageModel(
      {this.id,
        this.sender,
        this.unread,
        this.content,
        this.updatedAt,
        this.url,
        this.htmlUrl});

  UserMessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender =
    json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    unread = json['unread'];
    content = json['content'];
    updatedAt = json['updated_at'];
    url = json['url'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sender != null) {
      data['sender'] = sender?.toJson();
    }
    data['unread'] = this.unread;
    data['content'] = this.content;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    return data;
  }
}

class Sender {
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

  Sender(
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
        this.type});

  Sender.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
