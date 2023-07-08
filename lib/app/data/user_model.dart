class UserListRes {
  int? code;
  String? message;
  UserListData? data;

  UserListRes({this.code, this.message, this.data});

  UserListRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? UserListData?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class UserListData {
  List<User>? user;
  int? currentPage;
  int? total;

  UserListData({this.user, this.currentPage, this.total});

  UserListData.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user?.add(User.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user?.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = currentPage;
    data['total'] = total;
    return data;
  }
}

class User {
  int? id;
  String? userName;
  String? mobile;
  String? userNickname;
  int? birthday;
  String? userPassword;
  String? userSalt;
  int? userStatus;
  String? userEmail;
  int? sex;
  String? avatar;
  int? deptId;
  String? remark;
  int? isAdmin;
  String? address;
  String? describe;
  String? lastLoginIp;
  String? lastLoginTime;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Dept? dept;
  List<RoleInfo>? roleInfo;
  dynamic post;

  User(
      {this.id,
      this.userName,
      this.mobile,
      this.userNickname,
      this.birthday,
      this.userPassword,
      this.userSalt,
      this.userStatus,
      this.userEmail,
      this.sex,
      this.avatar,
      this.deptId,
      this.remark,
      this.isAdmin,
      this.address,
      this.describe,
      this.lastLoginIp,
      this.lastLoginTime,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.dept,
      this.roleInfo,
      this.post});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    mobile = json['mobile'];
    userNickname = json['user_nickname'];
    birthday = json['birthday'];
    userPassword = json['user_password'];
    userSalt = json['user_salt'];
    userStatus = json['user_status'];
    userEmail = json['user_email'];
    sex = json['sex'];
    avatar = json['avatar'];
    deptId = json['dept_id'];
    remark = json['remark'];
    isAdmin = json['is_admin'];
    address = json['address'];
    describe = json['describe'];
    lastLoginIp = json['last_login_ip'];
    lastLoginTime = json['last_login_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    dept = json['dept'] != null ? Dept?.fromJson(json['dept']) : null;
    if (json['roleInfo'] != null) {
      roleInfo = <RoleInfo>[];
      json['roleInfo'].forEach((v) {
        roleInfo?.add(RoleInfo.fromJson(v));
      });
    }
    post = json['post'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['mobile'] = mobile;
    data['user_nickname'] = userNickname;
    data['birthday'] = birthday;
    data['user_password'] = userPassword;
    data['user_salt'] = userSalt;
    data['user_status'] = userStatus;
    data['user_email'] = userEmail;
    data['sex'] = sex;
    data['avatar'] = avatar;
    data['dept_id'] = deptId;
    data['remark'] = remark;
    data['is_admin'] = isAdmin;
    data['address'] = address;
    data['describe'] = describe;
    data['last_login_ip'] = lastLoginIp;
    data['last_login_time'] = lastLoginTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (dept != null) {
      data['dept'] = dept?.toJson();
    }
    if (roleInfo != null) {
      data['roleInfo'] = roleInfo?.map((v) => v.toJson()).toList();
    }
    data['post'] = post;
    return data;
  }
}

class Dept {
  int? deptId;
  int? parentId;
  String? ancestors;
  String? deptName;
  int? orderNum;
  String? leader;
  String? phone;
  String? email;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Dept(
      {this.deptId,
      this.parentId,
      this.ancestors,
      this.deptName,
      this.orderNum,
      this.leader,
      this.phone,
      this.email,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Dept.fromJson(Map<String, dynamic> json) {
    deptId = json['dept_id'];
    parentId = json['parent_id'];
    ancestors = json['ancestors'];
    deptName = json['dept_name'];
    orderNum = json['order_num'];
    leader = json['leader'];
    phone = json['phone'];
    email = json['email'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['dept_id'] = deptId;
    data['parent_id'] = parentId;
    data['ancestors'] = ancestors;
    data['dept_name'] = deptName;
    data['order_num'] = orderNum;
    data['leader'] = leader;
    data['phone'] = phone;
    data['email'] = email;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class RoleInfo {
  int? roleId;
  String? name;

  RoleInfo({this.roleId, this.name});

  RoleInfo.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['roleId'] = roleId;
    data['name'] = name;
    return data;
  }
}
