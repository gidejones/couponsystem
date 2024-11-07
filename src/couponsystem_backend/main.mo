import Array "mo:base/Array";

actor CouponSystem {
    stable var coupons: [Text] = [];  // Stores coupon codes

    // Add a new coupon
    public func addCoupon(code: Text): async Text {
        coupons := Array.append<Text>(coupons, [code]);  // Append new coupon code
        return "Coupon added: " # code;
    };

    // Redeem a coupon
    public func redeemCoupon(code: Text): async ?Text {
        switch (Array.find<Text>(coupons, func (x) { x == code })) {
            case (?coupon) {
                coupons := Array.filter<Text>(coupons, func (x) { x != code });  // Remove the redeemed coupon
                return ?coupon;  // Return redeemed coupon code
            };
            case null { return null; }  // Coupon not found
        };
    };

    // View all available coupons
    public func viewCoupons(): async [Text] {
        return coupons;
    };
};

