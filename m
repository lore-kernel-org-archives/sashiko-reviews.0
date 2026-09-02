Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01371361DD0
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 18:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372009; cv=fail; b=E4kaPrS/uVMXVbptFJxjIntU62mpj1TmHGunF3s+p562z+CWLVxAMBZASL8aOKkY53De818Q/xAQmpMQNsj4noGFzUkcZlJqMtI2Rbk0L4ayIhzRn5FPDtvImkzURoENV/1Lvyu+AXxyEgOmTMTZKng72sq5qUdnAxGJ+mCzbrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372009; c=relaxed/simple;
	bh=crpU4+R7QUgjTPvcjLzJhXwAKV2O5mD6kaeEEsZkaR4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I3BB67SDyZQEzN7aFDv0sWB8rYZQikJD55HnUspEn/MK8XvB8IQGKzhI8qcgXq7scAxupSU6j9MSo9U+flQCxemICQlufLWULXZSZVnNY/GZh4Ba+IT91/jT7QiOV8wowdLyAMyxPejfWRXs+d+rqhKJULLHFpCoufwN5mEF7FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHUS8JvM; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHUS8JvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788372008; x=1819908008;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=crpU4+R7QUgjTPvcjLzJhXwAKV2O5mD6kaeEEsZkaR4=;
  b=nHUS8JvMIpNegzU8q6hcxFy1fiV8rD6WSlttDQ9dP8hKfrUlNJswyUsT
   SbfnkqS+DlxFoG5mWXpZ8q4MTnmpwaPdcnKg5iZESfhPoE0GAX9FhJ/5l
   factrltUOXFo8jswXD3g3qFD862vOhxsnond77aegqjdsyYlTyJNFGhxA
   q33S9VWTDqL6e0AIcW5tz3b1khRI7ctNE6GaMYtndymHNMFJhqd12Z1uB
   ixCyOllcsOwqa2g95vj5L9B0Pg1fJ1ryGAj2kT4va/A4aXZq2g4MXe/ug
   qJETdXHBkg3OKms1V3+quVOeDPxq4vK+iJ2AxyQhrxl3GEL6OYxtFpMNq
   g==;
X-CSE-ConnectionGUID: jNA6GRtrSn+JB7uhs1YDLg==
X-CSE-MsgGUID: mRXDoDFIQRS+nhX05QDd2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99503810"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="99503810"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 11:00:07 -0700
X-CSE-ConnectionGUID: Zhd65wU6QQGK5VXzK/kHow==
X-CSE-MsgGUID: tgBpTw2AQwmFfs7KCOSJlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="307687312"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 11:00:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:00:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 11:00:05 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.48)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:00:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEX/sz/o9tudF4P68A8YzMBA8uyljtlNKH77MyXRnfB9OPam0CjdFnEP6YmVKdp5awIXgPrHkUOKLMBpa/zHVGhaDON8H8jUn5F/nEilPw3O5FsoZPjwoGtvCF36LOpjVQbEi8dyLKdCUyC3pBxpLWZwqr2tqgxfsh0PrmIUvmqob5cIBtPsgCbp4TGYjjl7E1DGMS5ltcoFb/MUUTqFB6tk8k+pQHJqq8a9B7n/PEfXP4boXmQdapIgfOdA6+ShtFcUixu8Xn1QOpGi0ZuCgRajhfHrTqgkxncEm037NB8R9iMKfXODgO/O4TKcyTNt3KF5SMKs08ftC83iOXEcng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crpU4+R7QUgjTPvcjLzJhXwAKV2O5mD6kaeEEsZkaR4=;
 b=HwzZ7jGyHXtKAXxI4lhi5WxPFGSv6EMJ58hkwWieACTuzbVoaMpvaMH3rhSsHiyafxGVOynwGwu5KPTabkX3jQqP4i7LsQnOI5fOGpQTXBbI06H6YtZkoWL4HI+QHY4LWv5s3nnsTwhTx5zZ6b05Hws/2K/cDNfwN/LF135KNVvWsQRgsYx1j9O8BI1FcK2PitSUXSdc0uJb8vMaEFlbLJo4LixlTKKWjkTZ5LPzM2OSoP4rQBMjETSNTl26zdO52ZHPECmuBROLZVhRWbtn2FlsCZFOP989UE+HKAzi+jUE217QS0dPqSIS9wupGu3PysnTgXMOL/qGOkTI9qOKNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA3PR11MB992400.namprd11.prod.outlook.com (2603:10b6:208:61e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 18:00:03 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 18:00:03 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V20 13/15] drm/xe: Expose bad VRAM pages via debugfs
Thread-Topic: [PATCH V20 13/15] drm/xe: Expose bad VRAM pages via debugfs
Thread-Index: AQHdOusZQrlbqx2zWkWqa074q8mFSLa7gkyAgAARN5A=
Date: Wed, 2 Sep 2026 18:00:03 +0000
Message-ID: <DS0PR11MB8718649F24B45B53641BB69D81B72@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-30-tejas.upadhyay@intel.com>
 <20260902165659.F104D1F000E9@smtp.kernel.org>
In-Reply-To: <20260902165659.F104D1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|IA3PR11MB992400:EE_
x-ms-office365-filtering-correlation-id: 308dee44-f0e2-4684-34b1-08df091c03d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|6133799003|3023799007|22082099003|18002099003|38070700021|11063799006|10067099003|4143699003;
x-microsoft-antispam-message-info: jfr1qK06jYoejV/E2HyIzIOJYiR7NESaVMZyMcsiGCK6oeiN96O0WpKXMY0oyNEWzc/3iCzu4fG2oH+fZcqdQkpJywJoVizawHEL/V1a2C5tWcXJOU6wjCGX2B08eq0OCNHhH6rwWlfs5A0G9Wc4/9tey7CXye94Dplq6X0kUF6QWgxCY8CTrkiGVvFfo495kTJAfX+VDcsUOKLdw/MzeOykgIn6gq+N7taOraPa4zKrBa+2LgDSoR7o+fYIw9GtEznqS/hn3l3mWZzyEUWvu39D36RXKjjxyp6gSBs5E0jsdLbLnYb59xPPGxDrl9V28eCgHMBGHzx0mWqWD7fnOUZxdYqAWoV1n+mNaerriX0U3oJnvcDLyhgJINUB4I6vxVhdlGcTn5KNl3ntcCl2FNNeP4PW4L6WwlVsf+OaIoW78+vnVdBPf1Q7ftQsiwqOPOzYscQ29irQ8O86Bddutb69C2Yc4UcWAL06VrlaWjYsQU4g/3FF33kMNkkHMRtv96zxWaBZkKlBJxjD0uxZLY3qXGy8U1EprIr9CU9TlodT3+oXECXcou+z7X6L9OxCdRCNo5/GIh+xDqPGTj3SgWzuGLTsicvzJUTwFu8CWZt7NOJGDWt13W/nGwoT9+T+hWxmG9xf5WyDqd4X+IOJC6uP4d7qnaZ+7R50zeboXgk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003)(38070700021)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUQwNkxjMWpGay9Xck03YlUwSS83SFA5a1lDN0ZPSFJQSGFwVGJjUGdFOVd0?=
 =?utf-8?B?SWRZMnRZOFQ2WDBjWkZkTDNuV3FyUGFhL3NoTWRCUlYwUmUvcGNZd0VkWjNY?=
 =?utf-8?B?WWJmMmRuTDBnanVDMDZONWlsRDFObGtIbGtaK3J1RU4yTmVXeEZvUjhGNkhq?=
 =?utf-8?B?WEprbmowejEzNGljZTJ5d2RCd2lIMmRGU3lYcFJCNzIyMWJESHpDU0duRXht?=
 =?utf-8?B?T3Rqd09oUUJUYkJvK01sUGs3MlBycUlWbWlSMzBkNFJZT3IzaWpBWXZzZVNa?=
 =?utf-8?B?M0lUZVZkcGp3L3dnanU0VnpCUDZKZmY3OUtuTDg4WC94Q2lRKzBxcVVaazRR?=
 =?utf-8?B?dmhuSWZ4THdwRjZweDZtN3BWT1ArYlJqM1lVUFp4czU2a1hJNU1uUW83a1Ez?=
 =?utf-8?B?Y0xjeTR5eldpaHZuRFFDU3I0eVhONmNPZlNlT1Zhc2xwaEttWDlCSXhoWWJz?=
 =?utf-8?B?OWdIRUFFdTBnalJxUmRPUUdZdmFOckhVUWNLNDhGMS9kR1RRTHZVQXNIZXNW?=
 =?utf-8?B?ZGdVVmhmV2xnT05HT3NRS3IyU0ZPSURKVUZJMlVCM25yaCtibVFENmg4cTBn?=
 =?utf-8?B?UUxRMFRXbjdaVjZkRHNhczEyclhmNW5UNVZyV3F4dDJQSUpncTdqb1RRTUtW?=
 =?utf-8?B?U2FJdTVLOW11NUFpeHZWcEpTN3FHanVxRWMxUGNONzFEbkpyQUZRa2NBdTFv?=
 =?utf-8?B?VTl0b1J3Qk9QOE5GeW1pOC9DajdYQmlwK3BJVis0TTdNNkhsQTZhZGFwVGR4?=
 =?utf-8?B?d0Rxc1RPK0lmeEhqbnVCM0xadUczNzNtQXlKM1crWFBXdnN0RkRSTloySmhz?=
 =?utf-8?B?ZFJHQWYweVRON3c2OEgzQUJIdk1UeGhwNkU5ZlJrdzVOTlF4RFcvZFJIUDBj?=
 =?utf-8?B?V1dOeWMvK0w0TGdMQmtZV3Mva3ZFajZGeUdTMWJLNjZCUzJTdGYrcmI5L1Fj?=
 =?utf-8?B?bUpNUHNRN0M4V0g2aFdId0VOY25jRUR0YUFJaXpyYnFCWWFLaHFOcEZCOTB0?=
 =?utf-8?B?cFFDVG1paytHVE93RXR5dW52alFOKy9GWU5waGFqbUNmV2c5OHYwYkxlWmgy?=
 =?utf-8?B?QW1QWFhsRGhidGwyRkthTkJIalFEdlVEU01KeVJCem1NdGZOZDlOMWxqdkYr?=
 =?utf-8?B?TmQyMnMwVi8rK0tiNGtyTUlObG5vdHVqYUNLLzZjWXdLUTFFS3VDY2l0aGV0?=
 =?utf-8?B?dkIxRDFIaEVnaEc0WVliR0QrakN5NUc2R21HQ211VHJkbjJDRG10UU5Gbk9F?=
 =?utf-8?B?VDVpb2lrY3R3ckF1NzUxVXFlWGxrSmIzeURqMkc2c0RNRHpGSHNPOGg0WVl4?=
 =?utf-8?B?SHRDU1EzWmFNYmVrdGVCVnduUDBwNWNzTmkxMk1KMzE5QUVLQUY4cHluN3Bu?=
 =?utf-8?B?V1dqcGhZbm9DMUUrblRTVVdGZFgvWHJ1dGxpdXdsTzhoMzhlQ0owZDBBSjZp?=
 =?utf-8?B?NmtRWmt0NThmOHhxbEt1R0xVMkNTMmV5T2hiQ0VENlhVRGk5NUdOaGJkSHBD?=
 =?utf-8?B?cDZROTF3dXhqNVd5aUUrYWlBVVZNYkZ0TnJ5c0FGREZJT0llU3hRODErOStZ?=
 =?utf-8?B?WlZPdGIyRkUwYW91eGFVM2U2bXJrZ3N3SlBxL3hoNnFnZDVGaHpFMmJTSitr?=
 =?utf-8?B?dXB5VjRmbjhsSER4dXdOMldiRmZ2angzaERMTUV6T0hUOGExMXFMRCs4OVhD?=
 =?utf-8?B?Yy94NFRQbklTem5WTFFXdTNUR3JDRHBCVlovMXNxdGZrWlRhNVhKT1MxVnZ3?=
 =?utf-8?B?R1BlUHRlZGlkUXNyWElsSjdtdU8yOWY2aGNHSDlCR25GMDY3MVhvZ0IwRmd5?=
 =?utf-8?B?SmlDcXgwRURKZlhvRW5va1V0dkE0c28rVlRoc1czNzFWUnJJc0szMGY5OGhn?=
 =?utf-8?B?TGExSzhuZVBiZGxiV2dCM2VJK1lqd3dlY3c0WmxsYU5JRmxFK0pRZDkxR21C?=
 =?utf-8?B?YWxSWVloY2JkakQ4MVRWN1h1SjRNdzFXaGJ1ZEtCdmJxanlIbEtIUCtSOTZU?=
 =?utf-8?B?STJiTHBLN2NPWTF5NFRJY0U1U2EzekE0cGhsbm9vTHhIaXVkOUhycE5ZUm8v?=
 =?utf-8?B?Y29Fek5SZWEvVU92cm9kWGZrOHlQamtGNFFnemxpT1dmQ1pUbEZBZjZUYXVa?=
 =?utf-8?B?U1FFNXZqdzdBK00rcE9pemhJZjZkZ2VHd2NjbjZuNmJyYUNWTWFhRXRQV010?=
 =?utf-8?B?TWlPc1p3R1NIQWxFbmFINUZoRHQrS1pLdHRRRURibUw3dG1KcE5LZ21vRHI2?=
 =?utf-8?B?NjZMeDFpclZKTDhzYnFDOTRZZllPWVZIc0dqdDFtSytldFRHdjFQOTNxbmlQ?=
 =?utf-8?B?RE9kYXJSZDRqQW9PTmpmN3dTSFQwS2UvdHg3TUlXTm4vSTRGVE1Tdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: P4csUmQlZ2ZMiwmiebEbfEBdLRqQjbbGA6DR9QMu1/ERWxdCvFViA0np3S3OOHIh6kjY8k6kgyeRuq9NDsh8A4H3H7dk4tI3pOXIlSkwqTurwok+ssp5qrS1YfODUa88ISll2hw6Lsku0Z9Zk7FTOLDth+qQu9FhaCRebmVkQXx4uepxFi79mg9TgC8gMtUKDzL6Ce08qibppN9h6YImIw4u38NKZ0idNqOWPQN961Obo7yzA0CXdGEvmXQzlF4qGRk6mIanUPqr5HLxZwyZqUBLIMr+BVqqVbfHSKptM6o/jfMgBw0S8ocHsSlhZs7Z2JAulTCZYX99wk6MvxEyWA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308dee44-f0e2-4684-34b1-08df091c03d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 18:00:03.7237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D7GXiC5N6al8MshgeB0bh+EOKW0KAayf0TzEt5MYb4MHCaN8tx+AAt7qlAPSQCiuqSYok4RKwgyevCJ6bQPX6KljMgaS1lqrgHmsn78ixCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB992400
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMDIgU2VwdGVtYmVyIDIw
MjYgMjI6MjcNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29t
Pg0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggVjIwIDEzLzE1XSBkcm0veGU6IEV4cG9zZSBiYWQgVlJBTSBwYWdlcyB2aWEgZGVidWdm
cw0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZp
ZXcgZm91bmQgMiBwb3RlbnRpYWwgaXNzdWUocykNCj4gdG8gY29uc2lkZXI6DQo+IC0gW0xvd10g
RGVidWdmcyBvdXRwdXQgY29tcHV0ZXMgR1BVIFZSQU0gcGFnZSBmcmFtZSBudW1iZXJzIGFuZCBz
aXplcw0KPiB1c2luZyBob3N0IENQVSBtYWNyb3MgKFBBR0VfU0hJRlQgYW5kIFBBR0VfU0laRSks
IGNhdXNpbmcgc2lsZW50IHRydW5jYXRpb24NCj4gYW5kIGluY29ycmVjdCByZXBvcnRpbmcgb24g
YXJjaGl0ZWN0dXJlcyB3aXRoIG5vbi00SyBDUFUgcGFnZXMuDQo+IC0gW0xvd10gVGhlIFZSQU0g
bWF4X3BhZ2VzIGxpbWl0IGlzIHByaW50ZWQgZ2xvYmFsbHkgdXNpbmcgb25seSB0aWxlIDAncw0K
PiBtYW5hZ2VyLCBpZ25vcmluZyBsaW1pdHMgb2Ygb3RoZXIgdGlsZXMgb24gbXVsdGktdGlsZSBk
ZXZpY2VzLg0KPiAtLQ0KPiANCj4gY29tbWl0IGMxMjg0MWQwNzNhNjE5ZTVlZGViOGM4MzA2YWRm
NmZkMDMwNDJlZGQNCj4gQXV0aG9yOiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50
ZWwuY29tPg0KPiANCj4gZHJtL3hlOiBFeHBvc2UgYmFkIFZSQU0gcGFnZXMgdmlhIGRlYnVnZnMN
Cj4gDQo+IFRoaXMgY29tbWl0IGFkZHMgYSBkZWJ1Z2ZzIGZpbGUgdG8gc2hvdyBvZmZsaW5lZCBh
bmQgcXVldWVkIFZSQU0gcGFnZXMNCj4gYWNyb3NzIGFsbCB0aWxlcywgZGlzcGxheWluZyB0aGUg
cGFnZSBmcmFtZSBudW1iZXIsIEdQVSBwYWdlIHNpemUsIGFuZCBzdGF0dXMNCj4gZmxhZy4NCj4g
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3IuYw0K
PiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21nci5jDQo+ID4gaW5kZXggMDA1
NjljNTI3OWE4My4uZDlkYTI0NTRkOTY4ZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdHRtX3ZyYW1fbWdyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dHRtX3ZyYW1fbWdyLmMNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gQEAgLTkxNywzICs5MTgsNjEg
QEAgaW50IHhlX3R0bV92cmFtX2hhbmRsZV9hZGRyX2ZhdWx0KHN0cnVjdA0KPiB4ZV9kZXZpY2Ug
KnhlLCB1NjQgYWRkcikNCj4gPiAgCXJldHVybiB4ZV90dG1fdnJhbV9yZXNlcnZlX3BhZ2VfYXRf
YWRkcih4ZSwgYWRkciAtIHZyLT5kcGFfYmFzZSwNCj4gPiB2cmFtX21nciwgbW0pOyAgfSAgRVhQ
T1JUX1NZTUJPTCh4ZV90dG1fdnJhbV9oYW5kbGVfYWRkcl9mYXVsdCk7DQo+ID4gKw0KPiA+ICtz
dGF0aWMgaW50IHZyYW1fYmFkX3BhZ2VzX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICp1
bnVzZWQpIHsNCj4gPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gbS0+cHJpdmF0ZTsNCj4gPiAr
CXN0cnVjdCB4ZV90dG1fdnJhbV9vZmZsaW5lX3Jlc291cmNlICpwb3M7DQo+ID4gKwlzdHJ1Y3Qg
dHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbjsNCj4gPiArCXN0cnVjdCB4ZV90dG1fdnJhbV9tZ3Ig
Km1ncjsNCj4gPiArCXN0cnVjdCB4ZV90aWxlICp0aWxlOw0KPiA+ICsJdTggaWQ7DQo+ID4gKw0K
PiA+ICsJbWFuID0gdHRtX21hbmFnZXJfdHlwZSgmeGUtPnR0bSwgWEVfUExfVlJBTTApOw0KPiA+
ICsJaWYgKG1hbikNCj4gPiArCQkvKiBUT0RPIEhvb2sgd2l0aCBSQVMgdG8gc2hvdyBtYXhfcGFn
ZXMgZmV0Y2hlZCBmcm9tIEZXDQo+ICovDQo+ID4gKwkJc2VxX3ByaW50ZihtLCAibWF4X3BhZ2Vz
OiAlZFxuIiwNCj4gPiArCQkJICAgdG9feGVfdHRtX3ZyYW1fbWdyKG1hbiktPm1heF9wYWdlcyk7
DQo+IA0KPiBbU2V2ZXJpdHk6IExvd10NCj4gRG9lcyB0aGlzIGNvcnJlY3RseSByZXByZXNlbnQg
dGhlIGxpbWl0IGZvciBtdWx0aS10aWxlIGRldmljZXM/DQo+IA0KPiBCeSBxdWVyeWluZyBvbmx5
IHRoZSBtYW5hZ2VyIGZvciBYRV9QTF9WUkFNMCwgaXQgc2VlbXMgdGhlIG1heF9wYWdlcw0KPiB2
YWx1ZSBpcyBwcmludGVkIGFzIGEgZ2xvYmFsIGxpbWl0LCB3aGljaCBtaWdodCBpZ25vcmUgaW5k
ZXBlbmRlbnQgb2ZmbGluZSBxdWV1ZQ0KPiBsaW1pdHMgY29uZmlndXJlZCBvbiBzdWJzZXF1ZW50
IHRpbGVzLg0KDQpUaGlzIHdpbGwgY29tZSBmcm9tIFJBUyBwb3N0IGludGVncmF0aW9uIHdpdGgg
UkFTIGFuZCBpdCB3aWxsIGJlIHNhbWUgZm9yIGFsbCB0aWxlLg0KDQo+IA0KPiA+ICsNCj4gPiAr
CWZvcl9lYWNoX3RpbGUodGlsZSwgeGUsIGlkKSB7DQo+ID4gKwkJc3RydWN0IHhlX3ZyYW1fcmVn
aW9uICp2ciA9IHRpbGUtPm1lbS52cmFtOw0KPiA+ICsNCj4gPiArCQltYW4gPSB0dG1fbWFuYWdl
cl90eXBlKCZ4ZS0+dHRtLCBYRV9QTF9WUkFNMCArIGlkKTsNCj4gPiArCQlpZiAoIW1hbiB8fCAh
dnIpDQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsJCW1nciA9IHRvX3hlX3R0bV92cmFtX21nciht
YW4pOw0KPiA+ICsNCj4gPiArCQlyY3VfcmVhZF9sb2NrKCk7DQo+ID4gKw0KPiA+ICsJCWxpc3Rf
Zm9yX2VhY2hfZW50cnlfcmN1KHBvcywgJm1nci0+b2ZmbGluZWRfcGFnZXMsDQo+IG9mZmxpbmVk
X2xpbmspIHsNCj4gPiArCQkJdTY0IHBmbjsNCj4gPiArDQo+ID4gKwkJCXBmbiA9IChwb3MtPmFk
ZHIgKyB2ci0+ZHBhX2Jhc2UpID4+IFBBR0VfU0hJRlQ7DQo+ID4gKwkJCXNlcV9wcmludGYobSwg
IjB4JTAxNmxseCA6IDB4JTAxNmx4IDogUlxuIiwgcGZuLA0KPiBQQUdFX1NJWkUpOw0KPiANCj4g
W1NldmVyaXR5OiBMb3ddDQo+IENhbiB0aGlzIGNhdXNlIGluY29ycmVjdCBQRk4gY2FsY3VsYXRp
b24gYW5kIHBhZ2Ugc2l6ZSByZXBvcnRpbmcgb24NCj4gYXJjaGl0ZWN0dXJlcyB3aXRoIGEgbm9u
LTRLIENQVSBwYWdlIHNpemU/DQo+IA0KPiBVc2luZyB0aGUgaG9zdCBDUFUgbWFjcm9zIFBBR0Vf
U0hJRlQgYW5kIFBBR0VfU0laRSB0byBjb21wdXRlIEdQVQ0KPiBWUkFNIGFkZHJlc3NlcyBjb3Vw
bGVzIHRoZSBoYXJkd2FyZSBtZW1vcnkgdG9wb2xvZ3kgdG8gaG9zdCBDUFUgcGFnZQ0KPiBib3Vu
ZGFyaWVzLg0KPiBPbiBhIHN5c3RlbSB3aXRoIDY0SyBDUFUgcGFnZXMsIHNoaWZ0aW5nIHRoZSA0
Sy1hbGlnbmVkIEdQVSBhZGRyZXNzIGJ5IDE2DQo+IHRydW5jYXRlcyB0aGUgbG93ZXIgNCBiaXRz
IG9mIHRoZSBHUFUgUEZOLCBhbmQgcmVwb3J0cyA2NEsgYXMgdGhlIFZSQU0gcGFnZQ0KPiBzaXpl
IGluc3RlYWQgb2YgNEsuDQoNCldlIGhhdmUgNEsgYWxpZ25lZCBwYWdlcyBldmVyeXdoZXJlIHNv
IGZvciBDUkkgaXQgY292ZXJzIGFscmlnaHQuDQoNClRlamFzDQo+IA0KPiA+ICsJCX0NCj4gPiAr
DQo+ID4gKwkJbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UocG9zLCAmbWdyLT5xdWV1ZWRfcGFnZXMs
DQo+IHF1ZXVlZF9saW5rKSB7DQo+ID4gKwkJCXU2NCBwZm47DQo+ID4gKw0KPiA+ICsJCQlwZm4g
PSAocG9zLT5hZGRyICsgdnItPmRwYV9iYXNlKSA+PiBQQUdFX1NISUZUOw0KPiA+ICsJCQlzZXFf
cHJpbnRmKG0sICIweCUwMTZsbHggOiAweCUwMTZseCA6ICVjXG4iLA0KPiA+ICsJCQkJICAgcGZu
LCBQQUdFX1NJWkUsIHBvcy0+c3RhdHVzID8gJ0YnIDogJ1AnKTsNCj4gDQo+IFtTZXZlcml0eTog
TG93XQ0KPiBUaGlzIGhhcyB0aGUgc2FtZSBQQUdFX1NISUZUIGFuZCBQQUdFX1NJWkUgaG9zdCBD
UFUgbWFjcm8gY291cGxpbmcgYXMNCj4gYWJvdmUsIHdoaWNoIG1heSB0cnVuY2F0ZSB0aGUgUEZO
IGFuZCByZXBvcnQgdGhlIHdyb25nIHNpemUgb24gbm9uLTRLIENQVQ0KPiBhcmNoaXRlY3R1cmVz
Lg0KPiANCj4gPiArCQl9DQo+ID4gKw0KPiA+ICsJCXJjdV9yZWFkX3VubG9jaygpOw0KPiA+ICsJ
fQ0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+IA0KPiBbIC4uLiBdDQo+IA0KPiAt
LQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtw0KPiBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA5MDIxNDUzNDMuNDY1Njg2LTE3LQ0KPiB0ZWphcy51cGFkaHlheUBpbnRlbC5jb20/
cGFydD0xMw0K
