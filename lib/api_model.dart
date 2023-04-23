class ApiModel {
  String? couponName;
  String? categoryName;
  String? couponDetail;
  String? expiryDate;
  String? couponType;
  String? storeName;
  String? storeDetail;
  StoreImage? storeImage;
  String? storeUrl;
  String? storeAddress;
  String? storePhoneNumber;

  ApiModel(
      {this.couponName,
        this.categoryName,
        this.couponDetail,
        this.expiryDate,
        this.couponType,
        this.storeName,
        this.storeDetail,
        this.storeImage,
        this.storeUrl,
        this.storeAddress,
        this.storePhoneNumber});

  ApiModel.fromJson(Map<dynamic, dynamic> json) {
    couponName = json['coupon_name'];
    categoryName = json['category_name'];
    couponDetail = json['coupon_detail'];
    expiryDate = json['expiry_date'];
    couponType = json['coupon_type'];
    storeName = json['store_name'];
    storeDetail = json['store_detail'];
    storeImage = json['store_image'] != null
        ? new StoreImage.fromJson(json['store_image'])
        : null;
    storeUrl = json['store_url'];
    storeAddress = json['store_address'];
    storePhoneNumber = json['store_phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_name'] = this.couponName;
    data['category_name'] = this.categoryName;
    data['coupon_detail'] = this.couponDetail;
    data['expiry_date'] = this.expiryDate;
    data['coupon_type'] = this.couponType;
    data['store_name'] = this.storeName;
    data['store_detail'] = this.storeDetail;
    if (this.storeImage != null) {
      data['store_image'] = this.storeImage?.toJson();
    }
    data['store_url'] = this.storeUrl;
    data['store_address'] = this.storeAddress;
    data['store_phone_number'] = this.storePhoneNumber;
    return data;
  }
}

class StoreImage {
  String? iD;
  String? postAuthor;
  String? postDate;
  String? postDateGmt;
  String? postContent;
  String? postTitle;
  String? postExcerpt;
  String? postStatus;
  String? commentStatus;
  String? pingStatus;
  String? postPassword;
  String? postName;
  String? toPing;
  String? pinged;
  String? postModified;
  String? postModifiedGmt;
  String? postContentFiltered;
  String? postParent;
  String? guid;
  String? menuOrder;
  String? postType;
  String? postMimeType;
  String? commentCount;
  String? podItemId;

  StoreImage(
      {this.iD,
        this.postAuthor,
        this.postDate,
        this.postDateGmt,
        this.postContent,
        this.postTitle,
        this.postExcerpt,
        this.postStatus,
        this.commentStatus,
        this.pingStatus,
        this.postPassword,
        this.postName,
        this.toPing,
        this.pinged,
        this.postModified,
        this.postModifiedGmt,
        this.postContentFiltered,
        this.postParent,
        this.guid,
        this.menuOrder,
        this.postType,
        this.postMimeType,
        this.commentCount,
        this.podItemId});

  StoreImage.fromJson(Map<dynamic, dynamic> json) {
    iD = json['ID'];
    postAuthor = json['post_author'];
    postDate = json['post_date'];
    postDateGmt = json['post_date_gmt'];
    postContent = json['post_content'];
    postTitle = json['post_title'];
    postExcerpt = json['post_excerpt'];
    postStatus = json['post_status'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    postPassword = json['post_password'];
    postName = json['post_name'];
    toPing = json['to_ping'];
    pinged = json['pinged'];
    postModified = json['post_modified'];
    postModifiedGmt = json['post_modified_gmt'];
    postContentFiltered = json['post_content_filtered'];
    postParent = json['post_parent'];
    guid = json['guid'];
    menuOrder = json['menu_order'];
    postType = json['post_type'];
    postMimeType = json['post_mime_type'];
    commentCount = json['comment_count'];
    podItemId = json['pod_item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['post_author'] = this.postAuthor;
    data['post_date'] = this.postDate;
    data['post_date_gmt'] = this.postDateGmt;
    data['post_content'] = this.postContent;
    data['post_title'] = this.postTitle;
    data['post_excerpt'] = this.postExcerpt;
    data['post_status'] = this.postStatus;
    data['comment_status'] = this.commentStatus;
    data['ping_status'] = this.pingStatus;
    data['post_password'] = this.postPassword;
    data['post_name'] = this.postName;
    data['to_ping'] = this.toPing;
    data['pinged'] = this.pinged;
    data['post_modified'] = this.postModified;
    data['post_modified_gmt'] = this.postModifiedGmt;
    data['post_content_filtered'] = this.postContentFiltered;
    data['post_parent'] = this.postParent;
    data['guid'] = this.guid;
    data['menu_order'] = this.menuOrder;
    data['post_type'] = this.postType;
    data['post_mime_type'] = this.postMimeType;
    data['comment_count'] = this.commentCount;
    data['pod_item_id'] = this.podItemId;
    return data;
  }
}
