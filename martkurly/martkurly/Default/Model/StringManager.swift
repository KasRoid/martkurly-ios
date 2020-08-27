//
//  StringManager.swift
//  martkurly
//
//  Created by Doyoung Song on 8/19/20.
//  Copyright © 2020 Team3x3. All rights reserved.
//

import UIKit

// 사용법: StringManager.HomeVC.howToUse.rawValue
// 새로운 값을 추가할 때는 case 를 생성하고 = 옆에 String 을 입력

struct StringManager {

    // 문단 띄어쓰기 적용하기
    func setParagraphStyle(text: String, spacing: CGFloat) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        return attributedString
    }

    enum General: String {
        case something = ""
    }

    enum HomeVC: String {
        case howToUse = "이렇게 여기에 원하는 텍스트를 여기에 입력하고 뷰컨에서 자동완성으로 사용하세요"
    }

    enum whyKurly: String {
        case title = "WHY KURLY"
    }

    let whyKurly = [
        ["title": "깐깐한 상품위원회",
         "content": "나와 내 가족이 먹고 쓸 상품을 고르는 마음으로 \n매주 상품을 직접 먹어보고, 경험해보고 \n성분, 맛, 안정성 등 다각도의 기준을 통과한 \n상품만을 판매합니다.",
         "info": "",
         "imageName": "01_check"
        ],
        ["title": "차별화된 Kurly Only 상품",
         "content": "전국 각지와 해외의 훌륭한 생산자가 믿고 \n선택하는 파트너, 마켓컬리. 2천여 개가 넘는 \n컬리 단독 브랜드, 스펙의 Kurly Only 상품을 \n믿고 만나보세요.",
         "info": "(온라인 기준 / 자사몰, 직구 제외)",
         "imageName": "02_only"
        ],
        ["title": "신선한 풀콜드체인 배송",
         "content": "온라인 업계 최초로 산지에서 문 앞까지 상온, \n냉장, 냉동 상품을 분리 포장 후 최적의 온도를 \n유지하는 냉장 배송 시스템, 풀콜드체인으로 \n상품을 신선하게 전해드립니다.",
         "info": "(샛별배송에 한함)",
         "imageName": "03_cold"
        ],
        ["title": "고객, 생산자를 위한 최선의 가격",
         "content": "매주 대형 마트와 주요 온라인 마트의 가격 변동 \n상황을 확인해 신선식품은 품질을 타협하지 않는 \n선에서 최선의 가격으로, 가공식품은 언제나 \n합리적인 가격으로 정기 조정합니다.",
         "info": "",
         "imageName": "04_price"
        ],
        ["title": "환경을 생각하는 지속 가능한 유통",
         "content": "친환경 포장재부터 생산자가 상품에만 집중할 수 \n있는 직매입 유통구조까지, 지속 가능한 유통을 \n고민하며 컬리를 있게 하는 모든 환경(생산자, \n커뮤니티, 직원)이 더 나아질 수 있도록 노력합니다.",
         "info": "",
         "imageName": "05_eco"
        ]
    ]

    enum orderCancelNotice: String {
        case orderCancelNoticeTitle = "주문 취소 안내"

        case depositIdentify1 = "[입금 확인]단계"
        case depositIdentify2 = "마이컬리 > 주문 내역 상세페이지에서"
        case depositIdentify3 = "직접 취소하실 수 있습니다."

        case depositIdentifyAfter1 = "[입금 확인] 이후 단계"
        case depositIdentifyAfter2 = "고객행복센터로 문의해주세요."

        case paymentCancelRefund1 = "결제 승인 취소 / 환불"
        case paymentCancelRefund2 = "결제 수단에 따라 영업일 기준 3~7일 내에 처리해드립니다."
    }

    enum orderCancelMoreNotice: String {
        case orderCancel = "주문 취소 관련"

        case orderCancel1 = "∙ [상품 준비 중] 이후 단계에는 취소가 제한되는 점 고객님의 양해 \n   부탁드립니다."
        case orderCancel2 = "∙ 비회원은 모바일 App / Web > 마이컬리 > 비회원 주문 조회 페\n   이지에서 주문을 취소하실 수 있습니다."
        case orderCancel3 = "∙ 일부 예약 상품은 배송 3~4일 전에만 취소하실 수 있습니다."
        case orderCacnel4 = "∙ 주문 상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매\n   해 주세요."

        case paymentRefund = "결제 승인 취소 / 환불 관련"

        case paymentRefund1 = "∙ 카드 환불은 카드사 정책에 따르며, 자세한 사항은 카드사에 문의\n   해주세요."
        case paymentRefund2 = "∙ 결제 취소 시, 사용하신 적립금과 쿠폰도 모두 복원됩니다."
    }

    enum changeAndRefund: String {
        case changeAndRefundTitle = "교환 및 환불 안내"

        case changeAndRefund1 = "고객님의 단순 변심으로 인한 반품은"
        case changeAndRefund2 = "어려울 수 있으니 양해 부탁드립니다."
    }

    enum productErrorCase: String {
        case productErrorCase1 = "상품이 표시∙광고 내용과 다르거나 부패한 경우 등 상품에 문제가 \n있는 정도에 따라 재배송, 일부 환불, 전액 환불해드립니다."

        case freshColdFreeze = "신선 / 냉장 / 냉동 식품"
        case freshColdFreeze1 = "상품을 받은 날부터 2일 이내에 상품 상태를 확인할 수 있는 사진\n을 첨부해 1:1 문의 게시판에 남겨주세요."

        case expirationDate = "유통기한 30일 이상 식품"
        case expirationDate1 = "(신선 / 냉장 / 냉동 제외) & 기타 상품"
        case expirationDate2 = "상품을 받은 날부터 3개월 이내 또는 문제가 있다는 사실을 알았\n거나 알 수 있었던 날부터 30일 이내에 상품의 상태를 확인할 수 \n있는 사진을 첨부해 1:1 문의 게시판에 남겨주세요."

        case reference = "※ 상품에 문제가 있는 것으로 확인되면 배송비는 컬리가 부담합\n니다."
    }

    enum changeMindAndOrderError: String {
        case freshColdFreeze = "신선 / 냉장 / 냉동 식품"

        case freshColdFreeze1 = "재판매가 불가한 상품의 특성상, 단순 변심, 주문 착오 시 교환 및 \n반품이 어려운 점 양해 부탁드립니다. 상품에 따라 조금씩 맛이 다\n를 수 있으며, 개인의 기호에 따라 같은 상품도 다르게 느낄실 수 \n있습니다."

        case expirationDateOver = "유통기한 30일 이상 식품"
        case expirationDateOver1 = "(신선 / 냉장 / 냉동 제외) & 기타 상품"
        case expirationDateOver2 = "상품을 받은 날부터 7일 이내에 1:1 문의 게시판에 남겨주세요."

        case reference = "※ 단순 변심으로 인한 교환 또는 환불의 경우 고객님께서 배송비 \n6,000원을 부담하셔야 합니다. (주문 건 배송비를 결제하셨을 경\n우 3,000원)"
    }

    enum notExchangeAndReturn: String {
        case line = "다음에 해당하는 교환∙반품 신청은 처리가 어려울 수 있으니 양해 \n부탁드립니다."

        case line1 = "∙ 소비자에게 책임 있는 사유로 상품이 멸실 또는 훼손된 경우 (포\n   장지 훼손으로 인해 재판매가 불가능한 상품의 경우, 단순 변심\n   에 의한 반품이 어렵습니다.)"
        case line2 = "∙ 일부 예약 상품은 배송 3~4일 전에만 취소하실 수 있습니다."
        case line3 = "∙ 소비자의 주문에 따라 개별적으로 생산되는 상품이 이미 제작 진\n   행된 경우"
    }

    enum Sign: String {
        case idTextField = "아이디를 입력해주세요"
        case pwTextField = "비밀번호를 입력해주세요"
        case nameTextField = "이름을 입력해주세요"
        case emailTextField = "이메일을 입력해주세요"
        case login = "로그인"
        case confirm = "확인"
        case forgotID = "아이디 찾기"
        case forgotPW = "비밀번호 찾기"
        case signUp = "회원가입"
    }

    enum SignUpError: String {
        case id1 = "6자 이상의 영문 혹은 영문과 숫자를 조합"
        case id2 = "아이디 중복확인"
        case pw1 = "10자 이상 입력"
        case pw2 = "영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합"
        case pw3 = "동일한 숫자가 3개 이상 연속 사용 불가"
        case pw4 = "동일한 비밀번호를 입력해주세요"
        case address = "배송지에 따라 상품 정보가 달라질 수 있습니다."
    }

    let signUpTextFieldsInfo = [
        [
            "아이디": "예: martkurly12"
        ],
        [
            "비밀번호": "비밀번호를 입력해주세요"
        ],
        [
            "비밀번호 확인": "비밀번호를 한번 더 입력해주세요"
        ],
        [
            "이름": "이름을 입력해주세요"
        ],
        [
            "이메일": "예: martkurly@kurly.com"
        ],
        [
            "휴대폰": "숫자만 입력해주세요"
        ]
    ]

    enum SignUp: String {
        case checkDuplicate = "중복확인"
        case checkPhoneNumber = "인증번호 받기"
        case address = "주소"
        case addtionalAddress = "나머지 주소를 입력해주세요"
        case addtionalAddressInfo = "배송지에 따라 상품 정보가 달라질 수 있습니다."
        case birthday = "생년월일"
        case gender = "성별"
        case male = "남자"
        case female = "여자"
        case unknown = "선택안함"
        case additionalInfo  = "추가입력 사항"
        case additionalInfoSubtitle = "추천인 아이디와 참여 이벤트명 중 하나만 선택 가능합니다"
        case recommender = "추천인"
        case eventName = "참여 이벤트 명"
    }

    let agreement = [
        [
            "title": "전체 동의합니다.",
            "subtitle": "",
            "info": "선택 항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.",
            "type": "title"
        ],
        [
            "title": "이용약관 동의",
            "subtitle": "(필수)",
            "info": "",
            "type": "page"
        ],
        [
            "title": "개인정보처리방침 동의",
            "subtitle": "(필수)",
            "info": "",
            "type": "page"
        ],
        [
            "title": "개인정보처리방침 동의",
            "subtitle": "(선택)",
            "info": "",
            "type": "page"
        ],
        [
            "title": "무료배송, 할인쿠폰 등 혜택/정보 수신 동의",
            "subtitle": "(선택)",
            "info": "",
            "type": "choice"
        ],
        [
            "title": "본인은 만 14세 이상입니다.",
            "subtitle": "(필수)",
            "info": "",
            "type": "normal"
        ]
    ]

    let agreementPromotion = ["동의 시 한 달 간 [5% 적립] + [무제한 무료배송]", "(첫 주문 후 적용)"]

}
