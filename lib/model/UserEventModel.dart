/*
* 用户通知
* */
class UserEventModel {
  int? id;
  String? type;
  Actor? actor;
  Repo? repo;
  bool? public;
  String? createdAt;
  Payload? payload;

  UserEventModel(
      {this.id,
        this.type,
        this.actor,
        this.repo,
        this.public,
        this.createdAt,
        this.payload});

  UserEventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
    repo = json['repo'] != null ? new Repo.fromJson(json['repo']) : null;
    public = json['public'];
    createdAt = json['created_at'];
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.actor != null) {
      data['actor'] = this.actor!.toJson();
    }
    if (this.repo != null) {
      data['repo'] = this.repo!.toJson();
    }
    data['public'] = this.public;
    data['created_at'] = this.createdAt;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    return data;
  }
}

class Actor {
  int? id;
  String? login;
  String? name;
  String? avatarUrl;
  String? url;
  String? htmlUrl;
  String? remark;

  Actor(
      {this.id,
        this.login,
        this.name,
        this.avatarUrl,
        this.url,
        this.htmlUrl,
        this.remark});

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    name = json['name'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
    htmlUrl = json['html_url'];
    remark = json['remark'];
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
    return data;
  }
}

class Repo {
  int? id;
  String? fullName;
  String? humanName;
  String? url;
  Namespace? namespace;

  Repo({this.id, this.fullName, this.humanName, this.url, this.namespace});

  Repo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    humanName = json['human_name'];
    url = json['url'];
    namespace = json['namespace'] != null
        ? new Namespace.fromJson(json['namespace'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['human_name'] = this.humanName;
    data['url'] = this.url;
    if (this.namespace != null) {
      data['namespace'] = this.namespace!.toJson();
    }
    return data;
  }
}

class Namespace {
  int? id;
  String? type;
  String? name;
  String? path;
  String? htmlUrl;

  Namespace({this.id, this.type, this.name, this.path, this.htmlUrl});

  Namespace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    path = json['path'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['path'] = this.path;
    data['html_url'] = this.htmlUrl;
    return data;
  }
}

class Payload {
  String? refType;
  String? ref;
  String? defaultBranch;
  String? description;

  Payload({this.refType, this.ref, this.defaultBranch, this.description});

  Payload.fromJson(Map<String, dynamic> json) {
    print("payload:$json");
    refType = json['ref_type'];
    ref = json['ref'];
    defaultBranch = json['default_branch'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ref_type'] = this.refType;
    data['ref'] = this.ref;
    data['default_branch'] = this.defaultBranch;
    data['description'] = this.description;
    return data;
  }
}
