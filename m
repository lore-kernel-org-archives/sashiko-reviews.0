Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A77025B082
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 05:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789624670; cv=fail; b=OXZjM8d+Z8hH9KeXDM9W6HpuAV+kepVEXy7UgROKdgLZGMsp6mhedfx+xpTsqFUmuBn8lB1bdkerO54cnsNfgBNL5+S8L39RCpV3Y0HHoj86K05R8qZbg0E0oDX1HKPQd4iMfZ6H3XbUkJ02jt/+Q6horN2BpdRdwc63zum7DAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789624670; c=relaxed/simple;
	bh=5Zc5fqGRInI3i9Q6G/u/87D05bHd0253Nyjm841IAnk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ec3zy5BksD00HsL9o1Gpxe9GQEAGh6wbsN3sab9t0kqd9+jW/BmPybmTEEQO4t4L4FfvOz3bACt4tdcKKTbE5pQcguxY9+JvR3VDBsghKFWoZefMJ/nCJWRd8Y7Kz/Nyq/rQ39hzSLMaJiBt8kbwOej3Swyhe/S4++Cro0J8QpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWT7k+VE; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWT7k+VE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789624667; x=1821160667;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5Zc5fqGRInI3i9Q6G/u/87D05bHd0253Nyjm841IAnk=;
  b=RWT7k+VEeF+fStJxDLNmawlkes8IriuQTQBgKJibZoVj6H7ogz6+gQ0/
   3ov14tNACX1eJzmr3Yj8uGIneWJRjphc+mRkMlaSRTZi+SHnd3d5cUptJ
   rFHPCLb0f6BOwCCTEKXXqnMuRWpQ7CtQKH1KfhFkNCk+PaTgPqiDDrg0w
   rKF+HHps8X9Sx5e+QxFNMUS27xWbx1aYOBazbOdYFPqAie5t65NhxJkMF
   P7gBpkclr4K6U66AhpR2aJvERbDcGLK5bg3p+U4MmtrXwnu2Klkpb4dxD
   1E4bYob8dDAkZXiSKGNfef5dTmfrKkDSRXuuTio5ctWt1Eg6lSgQ3BOPU
   Q==;
X-CSE-ConnectionGUID: T25GLN5RSpuoTBwJGJsCxQ==
X-CSE-MsgGUID: /TqLKnOPQs2WE8t/b1tw5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90030423"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90030423"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 22:57:47 -0700
X-CSE-ConnectionGUID: FbYuFhdoTKixTnKoBxJbUQ==
X-CSE-MsgGUID: 3jMP8R6wRLuKjZGcd+4jeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1794881"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 22:57:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 22:57:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 22:57:46 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 22:57:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SclOfUfzmGGByRPHVFntzS1umnK6lr/CRsEWTWDW46RVt+8oREyy4Fc6Hn7sdCHSWAovGamCFW2KaakGVqf0m4AUCkPUHMz4RAX8fQQ1+i2e+A8p89NZN1jcuW53lRf4VIP4aHwWJj3n9NjWXJ+muo8TH2IiZqFwVMYLlc7GMJfWuQ+XrH2dg6WfMThdG3CL7O30u2OEFRvUAxi9WYSIQLiWbECUakOP9njo3tsQFcqTzrQ5jX8M3vMB49hPvd7lcKDyx9sD+6si5QwWewBW/PW9UIArAUvVGICxekZhrsE3bcld1/pMrKscksb1m/s+K7gMbtnSKDnTtoI+esz8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Zc5fqGRInI3i9Q6G/u/87D05bHd0253Nyjm841IAnk=;
 b=IEWKAhrYRg+s1UXUwAExZTmS/UNgabY0diKNNl9dIBUuKa3ahj/X4HX4Og7sF4UkBzfgKNKZuAfoa9jTM2/kB/uGVFmSqU9C8ljXLTy2QPjC72hqL4Lu0BzRp0dBJlZUUET4W30KadedVchxq+PMOsI/k71DaudKJu8I2IPC5E6tElXAx+qxqAXmx64XgS7spDzue5CNGWyr4L1bek7o2auE0QwK3Ud92igUolYOGNSR/8omPd9aAQOVNZWd0L2vG6YuwFeFvQ2dEFb+SEnzi4nNgU7SLCUAW8kqRofOmq5rvllgiBz035Ure+fdlJgdT9TThKx7l7NZFiFN9q1Gvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH9PR11MB724247.namprd11.prod.outlook.com
 (2603:10b6:510:415::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 05:57:43 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 05:57:43 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v4 07/10] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Topic: [PATCH v4 07/10] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Index: AQHdRmKCnQDR8+ko90GSGgHt9wFq27bSO1UAgAAKhRA=
Date: Thu, 17 Sep 2026 05:57:43 +0000
Message-ID: <DS4PPFE901A304FD3B38A9BC74446C9FBEFE3B82@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-8-suraj.kandpal@intel.com>
 <20260917051903.2F6171F000FF@smtp.kernel.org>
In-Reply-To: <20260917051903.2F6171F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH9PR11MB724247:EE_
x-ms-office365-filtering-correlation-id: dede50b0-9d50-4618-218e-08df14809747
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|22082099003|18002099003|3023799007|38070700021|11063799006|5023799004|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info: 2txLEV8h/1V2wpO9mEmN/aqTMsrw/pqPbwehDjV9Jpz6+5EuHUeVLGOK8YypqR9dLa2tgW36zogaAZo8vJuDJo3ruukkaor2jxackHGjbL7U/G0RfUNqDUujqO9bt/7JtdNSQQRKV2Fs+LbmABSAjfM91jVAaC2obgrvMtp5pD892j312O9mTg+SfEdHOgW5zBbKhveBHr8LqKhKoMmmil9DV97iVNQZDo3xvKuS3Wwl+kPo/TOcS9g8HAPvPT7jV2k+wXeDmq/PHniwE/z1Inz7eHkLrrufoXEIj/0j7Hz6dSk8HilRgHtBs0/DH7zwNEviU5/PxeWHiawca5cz8gcyTm+wKxF+u24RJJH7xOUz2+0ONvJYBAcji6Urgb4tI3pfNYs0XPKHtI5w53gyzuqtIVMQl2Ndzh7Jxz1UfWlqMeePRa6I+UnWpsoGoD0kk98onomzfiy3nCuVg2DTi/n70AVSl7e+inlB4PuS7z2Jd1gNkyfB1n7GtU46zzzncFRUFxgheR97CJDnPdrrO1Nfl9kNjl1q2CgQxsLIJJ0326sFxnpKOXbMk7baY41inEq4i47CtpbsZVU7tD2fe/NDlbZJbSL0r35g47jq4RDKLHaJIl3DagWtvPmbK1sPvb85xrhhEnmFUjWbSmf5ZqtBicqc3WTQgNb6Rt6TtTY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFE901A304F.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(38070700021)(11063799006)(5023799004)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ai9DZ3l0OEdlMjBLU21aMDEwK1B3a1AySEFUdkg2Qit6R0txa0ZEL1M0U2xI?=
 =?utf-8?B?OHE3V0hDRGJ2U3dEaGtHZURjSS9SN1A1T1ZaUzN5Tk92OUt2SXZLaG5SZXBq?=
 =?utf-8?B?eXZyWDNYN2c3c2ZscFhkUnMxVHRjR2RERWJnVWs2Q2ZhVmViTVpXQS9nVzMr?=
 =?utf-8?B?SHFMNFgrMkhCRTd2SDRLYURCdFpGcWcvb3dneERYaTBmS3hxR0FMU2E2bGFr?=
 =?utf-8?B?Rzdkb29rSkhpSmJaUXF1eDFOTWIwVG9oRXFwK2hPakcrMDZzb1dHUzI2YVNN?=
 =?utf-8?B?dCsyTVpjWnJZb0hPQW5JNnFhaDZadytIejNOemdWWDNDRnJPTmp4dTh6UFZN?=
 =?utf-8?B?akxhc1dTTXJjZk1YODBHN21DS1hISWNJbU9xMlptTm5KK2ZYanpSOTA5aXJN?=
 =?utf-8?B?NkZac3FsZHo1ZUcrdmlmSnBrN2pWOHd4eEgyc2RzcmdEN0dYWEZwSnhIWXVC?=
 =?utf-8?B?YUE2SW5JUWFMRk1MdEpOR0J2VTVqT0RqbWxTUERVYzh4N01TVG9QNEZLTUtM?=
 =?utf-8?B?NU1vREJNUnJBNERLeTE5NUY5Mkd3Q21icGU0WHhhSXRHaFgxNUJsWHd2VFVS?=
 =?utf-8?B?RlEwNDBnV1c3ZFA1MnVuSXRXU0dNdDFrcjlmZjF0UW14MWNJNk4wQUsrSFdh?=
 =?utf-8?B?U1pxaStPbVJpTVhyTXN0OWNkOWJ5cmNIMHk1SEpNUFlsQm43SVFRblh4TzFO?=
 =?utf-8?B?c1pvb09UczhoMWVMWUJlVFZQcTVPUnJFNENtR3JsWDdGVmdGR1dVY0w5dkl3?=
 =?utf-8?B?WFR1U1VCU0hnaWpCTnliRFp3a0FueXJJdEFTTWRGaEw3YkdrOUlDMDJ1SE5P?=
 =?utf-8?B?N2M5dDBpRG1ob3dOeEZmVFl4NnpFQ2xmWGt3Sm5GRXBZZG5xZ0RwNnE4bmZ5?=
 =?utf-8?B?WTNMVVNGaXpKc2M2cFROdndFblFmQldWbFd4c1BBQ3lzL1YrY25EeTJ1SjYw?=
 =?utf-8?B?TFBET2E0MERSU3NGaTR1bFgzWFV4L0xONnlQa0U4d0VCWmxCUUdQZnhvWFhs?=
 =?utf-8?B?VE81VTlnL0xINmVNK0RrTGxkMlJ1SE40YTl5cjBjZmVkV2M3eStlR1hTVjlq?=
 =?utf-8?B?UEpiRWNpTDlpTUJSTkhpMVB1RWlSNzI0bWpkYWZ2ZHZ5QzI2TngyTXVrR1VK?=
 =?utf-8?B?bXFXKzN2aS9OeThqRTh5RFZZUWhYTlkvY3k1VDJXcUlkN0xoSmFWaUZHUitt?=
 =?utf-8?B?NGZ0YmFPVmdldGlRT3Uwb1JKaVlXTm0vTXZxL3VLSFFPY1B3eEhRekVlVUlt?=
 =?utf-8?B?b2ZiUkl6ZkVGSnhsaC83QklsdW1OcnVBeTBJTTROc3BjVDRvNTRUUTNrejhQ?=
 =?utf-8?B?OE55b1hraUtudHlJakxRQU9yOCtJQmIyU0FkSkNRNXo0dXZaZ1JnZXBOdENz?=
 =?utf-8?B?ZzB3WTdpR1AwckV2eTduaHEwOFFxa2E2SjU1Ni9nYTlXYnVGd0VCMkV1Znh1?=
 =?utf-8?B?WllPY1VHV1VhUis1dE10ZlZ2eldvTW1BdUtIRzFtNFRvMTNNYXJaTDFHTk16?=
 =?utf-8?B?dXdFL3NhNXVmVXlvd1AvckpFeUpmVmVveGdhcE1EZlhKNUJ2WmFYNG9JWDla?=
 =?utf-8?B?bDE2a3A3UHlaZHNrbkNIWWFlUFh5ODBYMXdKYmNjWGtIbk1GY2pjZHV1SGtO?=
 =?utf-8?B?cW9BWk1EU3ZjUEFhZlJ6K0Iwb05HaTlxa1ZZd3ovZktkb1ZqL2xBODBrc2VB?=
 =?utf-8?B?VVpqNEFTa3lWTkYrekpkOS8vNEUvcFBKeHBPZ05Lcm51WVdGMWdJSUpyUzIz?=
 =?utf-8?B?QldxVTg1bFUxQjYrbFJ3SGswKzVrZVFPSFZGcEFHdFI4NTY5MnJoSWVENmFu?=
 =?utf-8?B?aGM1VjdMeHd0aDkrOVpjRDJnUTFZUWl3SXlFY3NicXFmRXFnK1M5QmdGZGlR?=
 =?utf-8?B?YU41TXdGK003dnFzZU9jRDNYVFV6ejZ4OUJqTWwrakYrR3ZFMnZxV293Z3hY?=
 =?utf-8?B?d0Ixa0RrRkJWaktIVjBsSzhjUVhFemR4WFl5V3VuaDJwUWN0Um9DaTNTZHVL?=
 =?utf-8?B?SEdmMGw2RHBVdktsK3RPQ2wvekxZM1g5dlpiRWVXL0tuKzF5bGJpV0N3b0ZT?=
 =?utf-8?B?NDNuMmhibXhDQkJMU3IwenZkcGszaGZ6VWRsckNHU1RsMVFrcnZwZ3BWOXlU?=
 =?utf-8?B?TkNZTWNSa3VwR3ZSQ0Jjd2hkbXc2VTU2a3BqdjF1Sm5vbGxlQkFmaWdBb2Z1?=
 =?utf-8?B?ZXRmN21iczBidW5naGJHeDJqT1RxWDNKZjd2NE9naERYdWxlaStkcXhRc2Ji?=
 =?utf-8?B?WXFxRVVKYTNyWFJnYjRSQ1Zpc2RzTXJySEJTbXdGQmFXTEFJQ2s3RjZ3RkpV?=
 =?utf-8?B?b3BkWHdudDhveVVSR2h6L2h5d05UYVZYcUlJeURlRDlwYitxNkx2dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PEy1yYBn9IroqBCkuLSQN5ERrJg+H43qPY6kWcM2WqCtAXaXdCAcsBbX3uptbmLeUpgPevbtXkZWHRYtuw4cfEvH+p1Zsqk7r1AgXWnL7nyoIO8EHRM85oaP/CWTrCWEVl5IJDK2uhmNR28EQmRyOTfPJsyY0E4j4glcJtygUcmvhCuS1SbFZJTMPX6Y83eOW5tX39XDBBdCary3HLBmDD+49+XqOzq5zAVI3uvrjfJMwVvzPbFNHGXh5BkSn9I68RY5MA/vrjyKW9NYfQvcJ23jEm9ICBzwYqWtMOj/1s+tNySmOEfiW/dBV8nOoOA+lO0/crIQc+sTWvthY+GdNg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dede50b0-9d50-4618-218e-08df14809747
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 05:57:43.6036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HzMnRN+pW87lLTLVqk8y0kYZj6dzZ37aOPhQ/LLdoAUX4108tzHwL7uguO3uOy/GpZsCAS2M8e13Xf/ZwZFdmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB724247
X-OriginatorOrg: intel.com

PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXkuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMN
Cj4gPiBpbmRleCA2ZDIwMjVlMTA5OTU2Li4xZTlkODk0MzYyNmE3IDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gWyAuLi4gXQ0K
PiA+IEBAIC0yNzM4LDYgKzI3NDksMjYgQEAgYm9vbCBpbnRlbF9jcHVfdHJhbnNjb2Rlcl9oYXNf
bTJfbjIoc3RydWN0DQo+IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksDQo+ID4gIAlyZXR1cm4gSVNf
RElTUExBWV9WRVIoZGlzcGxheSwgNSwgNykgfHwNCj4gPiBkaXNwbGF5LT5wbGF0Zm9ybS5jaGVy
cnl2aWV3OyAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIGJtZ19lbmhhbmNlZF90Z2RkYV93cml0
ZShzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YywNCj4gPiArCQkJCSAgICAgZW51bSB0cmFuc2NvZGVy
IHRyYW5zY29kZXIsDQo+ID4gKwkJCQkgICAgIGNvbnN0IHN0cnVjdCBpbnRlbF9saW5rX21fbiAq
bV9uKSB7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rp
c3BsYXkoY3J0Yyk7DQo+ID4gKwlib29sIGVuYWJsZSA9IG1fbi0+YnlwYXNzX21fbl9yYXRpb19s
aW1pdCAmJiBtX24tPmxpbmtfbjsNCj4gPiArCXUzMiBsaW5rX21fZnJhYyA9IGVuYWJsZSA/IG1f
bi0+bGlua19tICUgbV9uLT5saW5rX24gOiAwOw0KPiA+ICsNCj4gPiArCWlmICghaW50ZWxfZGlz
cGxheV93YShkaXNwbGF5LCBJTlRFTF9ESVNQTEFZX1dBXzE0MDIxNzY4NzkyKSkNCj4gPiArCQly
ZXR1cm47DQo+ID4gKw0KPiA+ICsJaW50ZWxfZGVfcm13KGRpc3BsYXksIEhETUlfRU1QX0RBVEEo
ZGlzcGxheSwgdHJhbnNjb2RlciksDQo+ID4gKwkJICAgICBIRE1JX0VNUF9EQVRBX0xJTktfTV9G
UkFDX01BU0ssDQo+ID4gKwkJICAgICBSRUdfRklFTERfUFJFUChIRE1JX0VNUF9EQVRBX0xJTktf
TV9GUkFDX01BU0ssDQo+IGxpbmtfbV9mcmFjKSk7DQo+ID4gKw0KPiA+ICsJaW50ZWxfZGVfcm13
KGRpc3BsYXksIENISUNLRU5fVFJBTlMoZGlzcGxheSwgdHJhbnNjb2RlciksDQo+ID4gKwkJICAg
ICBEUF9FTkhBTkNFRF9UR0REQV9FTkFCTEUsDQo+ID4gKwkJICAgICBlbmFibGUgPyBEUF9FTkhB
TkNFRF9UR0REQV9FTkFCTEUgOiAwKTsgfQ0KPiA+ICsNCj4gPiAgdm9pZCBpbnRlbF9jcHVfdHJh
bnNjb2Rlcl9zZXRfbTFfbjEoc3RydWN0IGludGVsX2NydGMgKmNydGMsDQo+ID4gIAkJCQkgICAg
ZW51bSB0cmFuc2NvZGVyIHRyYW5zY29kZXIsDQo+ID4gIAkJCQkgICAgY29uc3Qgc3RydWN0IGlu
dGVsX2xpbmtfbV9uICptX24pIEBAIC0NCj4gMjc0NSw2ICsyNzc2LDggQEAgdm9pZA0KPiA+IGlu
dGVsX2NwdV90cmFuc2NvZGVyX3NldF9tMV9uMShzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YywNCj4g
PiAgCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShjcnRj
KTsNCj4gPiAgCWVudW0gcGlwZSBwaXBlID0gY3J0Yy0+cGlwZTsNCj4gPg0KPiA+ICsJYm1nX2Vu
aGFuY2VkX3RnZGRhX3dyaXRlKGNydGMsIHRyYW5zY29kZXIsIG1fbik7DQo+ID4gKw0KPiA+ICAJ
aWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDUpDQo+IA0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0N
Cj4gVGhlIGNvbW1pdCBtZXNzYWdlIHN0YXRlcyB0aGF0IENISUNLRU5fVFJBTlMgYW5kIEhETUlf
RU1QX0RBVEEgImFyZQ0KPiBleHBsaWNpdGx5IGNsZWFyZWQgd2hlbiB0aGUgbWVjaGFuaXNtIGlz
IG5vdCBpbiB1c2UsIHNvIHRoYXQgc3RhdGUgY2Fubm90IGxlYWsNCj4gZnJvbSBhIHByZXZpb3Vz
IG1vZGVzZXQuIiBEb2VzIHRoaXMgY2xlYXJpbmcgbG9naWMgd29yayBpZiB0aGUgdHJhbnNjb2Rl
ciBpcw0KPiByZXB1cnBvc2VkIGZvciBIRE1JPw0KPiANCj4gVGhlIGNsZWFyaW5nIGxvZ2ljIGlz
IHBsYWNlZCBpbiBibWdfZW5oYW5jZWRfdGdkZGFfd3JpdGUoKSwgd2hpY2ggaXMgY2FsbGVkDQo+
IGV4Y2x1c2l2ZWx5IGZyb20gaW50ZWxfY3B1X3RyYW5zY29kZXJfc2V0X20xX24xKCkuDQo+IA0K
PiBMb29raW5nIGF0IGhzd19jb25maWd1cmVfY3B1X3RyYW5zY29kZXIoKSwNCj4gaW50ZWxfY3B1
X3RyYW5zY29kZXJfc2V0X20xX24xKCkgaXMgb25seSBjYWxsZWQgZm9yIERQIGFuZCBGREkgZW5j
b2RlcnM6DQo+IA0KPiAgICAgfSBlbHNlIGlmIChpbnRlbF9jcnRjX2hhc19kcF9lbmNvZGVyKGNy
dGNfc3RhdGUpKSB7DQo+ICAgICAgICAgaW50ZWxfY3B1X3RyYW5zY29kZXJfc2V0X20xX24xKGNy
dGMsIGNwdV90cmFuc2NvZGVyLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmY3J0Y19zdGF0ZS0+ZHBfbV9uKTsNCj4gICAgICAgICBpbnRlbF9jcHVfdHJhbnNjb2Rl
cl9zZXRfbTJfbjIoY3J0YywgY3B1X3RyYW5zY29kZXIsDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICZjcnRjX3N0YXRlLT5kcF9tMl9uMik7DQo+ICAgICB9DQo+IA0K
PiBJZiBhIHRyYW5zY29kZXIgaXMgZmlyc3QgdXNlZCBmb3IgRGlzcGxheVBvcnQgKHRyaWdnZXJp
bmcgdGhlIHdvcmthcm91bmQgYW5kDQo+IHNldHRpbmcgRFBfRU5IQU5DRURfVEdEREFfRU5BQkxF
KSBhbmQgc3Vic2VxdWVudGx5IHJlcHVycG9zZWQgZm9yDQo+IEhETUksDQo+IGludGVsX2NwdV90
cmFuc2NvZGVyX3NldF9tMV9uMSgpIGlzIGNvbXBsZXRlbHkgc2tpcHBlZC4NCj4gDQo+IFdpbGwg
dGhlIFRyYW5zY29kZXIncyBUaW1pbmcgR2VuZXJhdG9yIEREQSByZW1haW4gaW4gdGhlIGVuaGFu
Y2VkIERQDQo+IHdvcmthcm91bmQgbW9kZSBhbmQgcG90ZW50aWFsbHkgY29ycnVwdCBIRE1JIHRp
bWluZ3M/DQo+IA0KDQpOb3RoaW5nIHRvIGNvcnJ1cHQgdGhvdWdoLiBCaXQgMTEgaXMgb25seSBh
cHBsaWNhYmxlIHRvIHRoZSBEUCB0cmFuc2NvZGVyLCBhbmQNCkhETUlfRU1QX0RBVEEgb25seSBt
YXR0ZXJzIHdoZW4gRU1QIHRyYW5zbWlzc2lvbiBpcyBlbmFibGVkIHZpYSBIRE1JX0VNUF9DVEws
DQp3aGljaCB3ZSBuZXZlciBkbyAtIHRoZXJlJ3Mgbm8gRlJML0VNUCBzdXBwb3J0IGluIHRoZSBk
cml2ZXIuDQpJdCBpc24ndCBvYnNlcnZhYmxlIGluIHNvZnR3YXJlIGVpdGhlciwgaW50ZWxfY3B1
X3RyYW5zY29kZXJfZ2V0X20xX24xKCkgaXMgb25seQ0KY2FsbGVkIGZyb20gdGhlIERQIGFuZCBE
UCBNU1QgcmVhZG91dCBwYXRocywgc28gYSBzdGFsZSBiaXQgbmV2ZXIgcmVhY2hlcyB0aGUNCmNy
dGMgc3RhdGUuIEFuZCB0aGUgbmV4dCBEUCBtb2Rlc2V0IG9uIHRoYXQgdHJhbnNjb2RlciBjbGVh
cnMgaXQgYW55d2F5Lg0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+IC0tDQo+IFNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNzA1
MDY0OS44NzE5NjAtMS0NCj4gc3VyYWoua2FuZHBhbEBpbnRlbC5jb20/cGFydD03DQo=
