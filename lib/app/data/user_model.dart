import 'package:ugodubai/app/data/base_model.dart';

class UserListRes extends BaseRes {
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
  int? agentId;
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
      this.agentId,
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
    userName = json['userName'];
    mobile = json['mobile'];
    userNickname = json['userNickname'];
    birthday = json['birthday'];
    userPassword = json['userPassword'];
    userSalt = json['userSalt'];
    userStatus = json['userStatus'];
    userEmail = json['userEmail'];
    sex = json['sex'];
    avatar = json['avatar'];
    deptId = json['deptId'];
    remark = json['remark'];
    isAdmin = json['isAdmin'];
    agentId = json['agentId'];
    address = json['address'];
    describe = json['describe'];
    lastLoginIp = json['lastLoginIp'];
    lastLoginTime = json['lastLoginTime'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
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
    data['userName'] = userName;
    data['mobile'] = mobile;
    data['userNickname'] = userNickname;
    data['birthday'] = birthday;
    data['userPassword'] = userPassword;
    data['userSalt'] = userSalt;
    data['userStatus'] = userStatus;
    data['userEmail'] = userEmail;
    data['sex'] = sex;
    data['avatar'] = avatar;
    data['deptId'] = deptId;
    data['remark'] = remark;
    data['isAdmin'] = isAdmin;
    data['agentId'] = agentId;
    data['address'] = address;
    data['describe'] = describe;
    data['lastLoginIp'] = lastLoginIp;
    data['lastLoginTime'] = lastLoginTime;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
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
    deptId = json['deptId'];
    parentId = json['parentId'];
    ancestors = json['ancestors'];
    deptName = json['deptName'];
    orderNum = json['orderNum'];
    leader = json['leader'];
    phone = json['phone'];
    email = json['email'];
    status = json['status'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['deptId'] = deptId;
    data['parentId'] = parentId;
    data['ancestors'] = ancestors;
    data['deptName'] = deptName;
    data['orderNum'] = orderNum;
    data['leader'] = leader;
    data['phone'] = phone;
    data['email'] = email;
    data['status'] = status;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
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
