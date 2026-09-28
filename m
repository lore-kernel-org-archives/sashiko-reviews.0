Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E131929ACC6
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598966; cv=fail; b=FAQQVyS16QeTAXUZpgvdxQb/KRBI/rLfaYRlf8JyJ9Dnu2LzmgUV2CvR6Scv8cyOp6Qe1NqvppCSXF1CR0yuoIrz53ATIXQgYpJsQlvoOaePRl9gJm671rjvLcuCENu3mX1bHP3xmWA2ydSeZAMvlky7qFBzbJShKUARRd0oJuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598966; c=relaxed/simple;
	bh=DGd6o88wCeymVQlVh2mTvfmdTNdkiGba2mn2ywBWVMI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KhGa/1ZVJp2Bb8IziQV6u1timhc7E5v8jS7Qk+LytM3Vu1IuzTMHfalNLpbrNv8UQZJlKyHgbWB6bVLStxZJ/wVEB2iw8cF0Oi8YTDuXlQxSgBakUpa4KVasWofBLjFFhjcC/w11IV3Iz04sJxDXo4mpMcBQqHx/jOj1RCg/k6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVGdd9Cg; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVGdd9Cg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790598965; x=1822134965;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DGd6o88wCeymVQlVh2mTvfmdTNdkiGba2mn2ywBWVMI=;
  b=WVGdd9CgGlxywkR2l9i6boLDe3sbak7Y3p07KUDDX+XWBv3fJxayIBoR
   FJWxgSZnKRor676BMtCGqrc3v6wuLJlkKWRYfiSZ5lXC6JHjAeKExq2Sj
   bkLksGEyEUG6ruj7Nvd56QqN97wi40jwdOsfMhA7LZXuEkK6mJmR6wuHV
   0gx+2yuQwdLOq+IvhZkS17/r33SED6Y91PaLIij352/Sk1H+R0CD/zmY7
   5MqdbpuJE+oAQpmU4AxRgth2xJTmqHd1tquVOOD/+BCBP5o9NcDi4zMA4
   yfWILc5w1g154ONm0sZ2bEbXQdGV5H71CWD/MyvhbQgYh6jmNLxFltem3
   Q==;
X-CSE-ConnectionGUID: 7HzifRGBTBG2NO08MuV+xA==
X-CSE-MsgGUID: z5Gdq0b8QZS4NPZa1te9AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="108785772"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="108785772"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:36:04 -0700
X-CSE-ConnectionGUID: ETW9qYnuTTuI7af2AEIz7A==
X-CSE-MsgGUID: 5Xe2TCOJRDSUBXJ+q99HxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274265386"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:36:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 05:36:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 05:36:03 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 05:36:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1RLGu3VLWV0Fa0phuvIOtJMKXSwab4PY9qkvuttkI0jocKySBq0kKHRJHMmiYqFMa+Elp4ZANkkXfgKmw9AjCtgfsyps6Y8EP8B6ufI2I2Hbf9ityN+ppi5SS+x5w4++TYO++dqkrdsq23TK27AmqWGsWkMxLYLK1q3v5Mn0XUvuT58J+3GtmH/T2Qk2xOUzu8jkCbFhYtHeJ+dx7cvYPOj3hqoC6OeIjgUYZfzGpmLmuyoX3dFdhrJ5XFIKLWJXERRd8zvEM8X279ONCvj6qLI0ivbAMW6fARrHIrPJvEvFuuGF2padU/DYFYtHBNPfE1ldd5MZhe5vkS4QgeB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGd6o88wCeymVQlVh2mTvfmdTNdkiGba2mn2ywBWVMI=;
 b=CUGuIAGC+hcj0Kezgt8Sr8MlpUd0Rt647QqpJPw2RJf/JwAdV3eF6XKfvTuzg2nSpUI3NSHOMWdaO/8aZaC7IXQWzlCuIVsePyehS9oBm9l3S4ONaJDRNZgAJWr2Yfsjuh7xOMhps6we4WfO6PN9ANurEMYzBjZeRLi5+fGq0koc754Tz3atmKo8WfeVm7xRCoqAoLY8bu8EtE4yHofb2CtEhg9LrrbnlWYI2nfdAqm7axjzF75bGJU20MdjrVVXAk+aM/kvgAdYRoE60X2R+9BMTnqeN00DYAJD4/gjuQ82GsALg0ermBpCQnElOXg2ql8kfK/XIuu1QUVwZvoIEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by DS4PPFA424F92C2.namprd11.prod.outlook.com (2603:10b6:f:fc02::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 12:35:56 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:35:56 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v4 06/12] drm/xe/reg_sr: Report save-restore errors using
 structured xe_log API
Thread-Topic: [PATCH v4 06/12] drm/xe/reg_sr: Report save-restore errors using
 structured xe_log API
Thread-Index: AQHdTyrGjKS8NPh7NUG0Ezw7Ipq3JLbjuggAgAAyhQA=
Date: Mon, 28 Sep 2026 12:35:56 +0000
Message-ID: <BL1PR11MB5413D6F40C7E2F23D70F394CE28D2@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-7-dnyaneshwar.bhadane@intel.com>
 <20260928093148.E564C1F000FF@smtp.kernel.org>
In-Reply-To: <20260928093148.E564C1F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|DS4PPFA424F92C2:EE_
x-ms-office365-filtering-correlation-id: 73b9e77d-606c-408c-535d-08df1d5d0aed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 8die8U0QDo32F6DQEuY+BqdxhZF1fhAwb+xFWg4Jhq/5xPBLUrbNUK2ozB1ANIWzQlC38ZE5RJSgA6+O9P4YIXwbjWzFf0XfUlJ7L6QKfBHS7iGqY8kjVoj9n7zCF8X+SSohf/5lOQGNehYD6IRq0CjeShD8DqmQWgPmK/81gb8e7FwWAq/NMuTgX30vCmSjnS8PpMSok8DI8KGp6gMkknEoPyYpMhW8/svWcHbcH6CU1EBsujJLkHxRG1aY8CEtrKoldXf0uxfADALVzsTjXoCJZsVYRfHR22rq8HQzfgHKqZaS9vOFx++Z+/MD/nf/QSJKSXyLJuCyksUORPOBvIs3rbEBIH9PAbmZUOI6+p+wSpBw6R1w/uL6E7s+TuY9//mr1SFWEQaVviaUVTm05jyNy2sUDLC8ZJMIwyGZpeldap/HUDm6SokiO2orSFZIM+bQLFwDsKSv8eS9jvi+4W7ecGtk1siqbmPr7J1drV1TV39nz2OXBfGpk6+FRUSxpjLyh5tVtPwIEaxAfZSnt1IVd8J52pFnJUBmOoi/EY71u0nX3fKJ9I5AyS6+wjI02Fi4RQrIA+5rYWT/I9yIv7XENkKFI+jOQLoq/EdVRCm0OwQS2xPzycE3MzFXwXBwUjMj9yqsztm1UZIm/iPj9xqxcbkpiRj8INjChvoIMl4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5413.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVNGWTVlU1h3S1AreTZ0TTNKVnFPTkw2eUFOL1I0K1VKdEtxQmFLT2tYOUgr?=
 =?utf-8?B?UjZZWmQrMGdzZWU0d3BUS3A2elNhcUlJbEg0OTZjWXFwMDFDZ0RtNFBLYUEx?=
 =?utf-8?B?UnVLNzJzS2RZOTRvcHdLam5DMHpPTUEwRnVOT1ZYY3Q2L0xKdnp5UzgwVVZM?=
 =?utf-8?B?Vy82Sk9ReUNoczR5YjJtM1FUZ0NUMVN0UFZHa1dUQUYwSGVwdStwWUFBREFD?=
 =?utf-8?B?SWwrZFZJM29WTjQrSjYwTFVaa0tpSDIvRW9iWXp2U2tGZDlYV0R6cG9YbHRl?=
 =?utf-8?B?a3hWcE1Wb1o0L0YxNFhMUDJZelpEWldsSkdlUU5BMWJGNWNiRFdpZW44QmJY?=
 =?utf-8?B?MEczelhIZHFqUVMySFptQm5kTnlvMU9DM202bUpEdkhOT2pBeElrWEI0U01Z?=
 =?utf-8?B?aUJRb0VVL2Y5UlZ2c21OS3dyTGRHeWM4MlZEeEtsdnlqRVYzUmpHMnE3ODlZ?=
 =?utf-8?B?U3pTUXZjV1pvMTRaSVlrcDRlZ3B1T1U5NDZmb0EreFZTS05JK0pUWmR3Y3dN?=
 =?utf-8?B?c0RFVWo3ektmNm1WeWhtbkt5VGtEaG5HcEp5YTV3THlmUlE1a3RGclJGanRD?=
 =?utf-8?B?M2t3V0pqT3pYb210VjNJTDJCUWlCcmlqMkh3S044Wlc0UGo5aTBYQVNrUDBs?=
 =?utf-8?B?V0hwTVBYOEZJUFgvSkhTWW9WNWF3MGVNendnOFYzam5SODV1NGVmQ2dvK09w?=
 =?utf-8?B?eklrVlAxZFhsRCs5VjFFUUM4ZkM5NFVlQVRUUkRMb2tzUzFjYUFOQ2N0QnNp?=
 =?utf-8?B?TFFVeFVMNnp5bng5MTBlRXdVNllsMys0bGRTRmpqSDFYMVV0dlZqQmVNb3R0?=
 =?utf-8?B?YnhwZCszN3FPQURxRmdOb1VMdkcySXMraVUySUc0dnJzYzZrZVlvdjVzSGsr?=
 =?utf-8?B?MWZCeHhOZmt2NlJMS1VrYWJCMnZhTjAveUtiak1pZ0p4SVZvUWk3dGxPUHU4?=
 =?utf-8?B?SjZaNm9YRUgrK2l1L2RLNEVXak1BSXBvdVNOU2JjL25IMjQ1ckF3QWtkRGVj?=
 =?utf-8?B?NS9mZHF3cTBXRy9pQnBoN3VBV3c1VzRIR3B1dDB0emsxMW1OWTlSSk9qdWJj?=
 =?utf-8?B?Z0J4RjU4ZlUybmlsVHRNQlc5UEpSU0Y5aDdtOUNuTDFvWUdEMkg3QUFIT1lM?=
 =?utf-8?B?YTNld3FMMzdIdVpwckIwUCtUdUhXMmhtb1RZTFB4Z3UwMEdvbmRxUUp4Q3h2?=
 =?utf-8?B?ZGgrK3ZQc01mdmE2ZmJBL01GRVpDR0lLcGYwb211Qlk1RWZOMVIzcjA3VGtS?=
 =?utf-8?B?NGZRRFMxblNtUWFUbEtsTE9tRU9UQlpJNTJUOVl2MVBBT1RhajJycWFxZ0NX?=
 =?utf-8?B?WlR0QURoTkFFOU1LUWFEZm92TmVOTlMxWVp3Sm1XQzFDSVVMREtUbjFLaU44?=
 =?utf-8?B?dUxNdVhHeUVRc3dmbHJiajBiRU1mTm9BWS9UY3g1MytYcEttVEl2aFRvOXdr?=
 =?utf-8?B?ZTV1bGdiKzQrT0FLMUNYSStMYzh5MVNrT2hOMlk4QWVja20wKzhNZlVMZEFt?=
 =?utf-8?B?YmIwVERXQlg3UHpveGdrT1lYQ0RHaGFzb0I5U3YyYnlaZzkvQ1RidlduM0pC?=
 =?utf-8?B?SU55c0JnRkNkcFVaVFQxWjZBaDhLVTA5QU9scnpTV29yS0dHa1VrN2JpQjN4?=
 =?utf-8?B?aW9LNENjdEsyZ3paYXVWb3BpT2dOQnBjVHJONlJwUFhZNWFKQnhFYWttencr?=
 =?utf-8?B?SGVhc2dOMGJVYjBhU1krOVVHN3RoQUZQTnRaTEJvV253N0UwbUlZZ1VyeTFM?=
 =?utf-8?B?WGhieXhwSndWeUhMYXJVUU9qVmRnelFiYmtuWUNyeUpjcGhwdGt0WnZydEw0?=
 =?utf-8?B?QnhYUW5SQ3dVU2E5UlV0SFN1TnNNV0l0QnpwZXFyOHY4ZGl2aldDaUZzSWNk?=
 =?utf-8?B?S3RWWHJ5WHRaZG9jY1U3cSt0TUd3cEtmby9zN3BBRVlnRFppZjB5YjI5TEYr?=
 =?utf-8?B?ZmVOK2NjRXRCUXA2a0tRNk9ldlJqUGpwMExsbFhaWTVHWE4vb1FIbmFGcGpO?=
 =?utf-8?B?RDlrZlRjbitDVXpaREVESVZPWEYxNXp4cXVCTWJOVCt1bkFZZ0VWN2hIbGJ5?=
 =?utf-8?B?MlRPUDJnNGZ0M0Vlejl6Q3dHaU5STHhlUGxUcGsveDhRZHloY013cVJjc3Ji?=
 =?utf-8?B?MysycG51RTYzUHRpT3diVWl4ZlNVOWNFNm5yeHFRbklZM1JsM3IrUFhVWmZr?=
 =?utf-8?B?a0tFd3dHSnZZQkFxTnZycDFiYmN5emlJc2VXSjdYQVVzdkJ4THZseXRsc1FZ?=
 =?utf-8?B?Z3p5enFEZ1liRGxVUjRRQXBYVk4yNTVRWkFDcTJ6WXEvMHp5WmFRaGJFaDhS?=
 =?utf-8?B?d0xXOS9uS0pnOFNTYjdsUmZYNSttdmo1c3drcVp1bjlhQVQwU1JOZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TqIt+V42pp8z+rmIeqOXgwru5fWO8YKChNZjOqUF7rDjOG0hxlzqAZQKCb3KTZKLQibOadg5wiye0NUvtS/p6P4gN+V+HTaSF2fBCvo6ETej6Pf5HmMhUvkv6cnb/wP5C/9bPdBSdrIwnvGnVMZg6mgoqr8olJnsjNAEbXQ0wWhwtnG+ycnCJq1xd3N89YXLbeubmtlH0YHgpsZv44mbzj36bhIEmmpYCUo0q9IubH1AT3BCD73V3vGIWRCOPlbwHp4h6RUnZQbhUHBiKjS9qRx5VsCkzc2Lq0wrsrzora1C45YPX3oXJ42dxas87BD2JrxyYdU2zvyqPjhqJE5Nvg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b9e77d-606c-408c-535d-08df1d5d0aed
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 12:35:56.1964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lLQH7p3K/Mz6/f/G3fIzOq4/54qIA3yaz4iryS6UNvnwyYtJ7xSsL5aiMJAVnqdJWKENVbj+fXqKNhWBxGmBTwVmHJ/05qZ9hYD9SlutWkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA424F92C2
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBTZXB0ZW1i
ZXIgMjgsIDIwMjYgMzowMiBQTQ0KPiBUbzogQmhhZGFuZSwgRG55YW5lc2h3YXIgPGRueWFuZXNo
d2FyLmJoYWRhbmVAaW50ZWwuY29tPg0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDYvMTJdIGRybS94ZS9yZWdfc3I6IFJlcG9y
dCBzYXZlLXJlc3RvcmUgZXJyb3JzIHVzaW5nDQo+IHN0cnVjdHVyZWQgeGVfbG9nIEFQSQ0KPiAN
Cj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91
bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj4gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0geGVf
cmVnX3NyOiBpbmNvbXBsZXRlIGxvZyBBUEkgdHJhbnNpdGlvbiB2cyBjb21taXQgbWVzc2FnZQ0K
PiAtLQ0KPiANCj4gY29tbWl0IDRjODkyMmE2YWRhMmIwOGJjYjk2Y2ZiMjdlZjM0MzBmNzFjOTdk
N2MNCj4gQXV0aG9yOiBEbnlhbmVzaHdhciBCaGFkYW5lIDxkbnlhbmVzaHdhci5iaGFkYW5lQGlu
dGVsLmNvbT4NCj4gDQo+IGRybS94ZS9yZWdfc3I6IFJlcG9ydCBzYXZlLXJlc3RvcmUgZXJyb3Jz
IHVzaW5nIHN0cnVjdHVyZWQgeGVfbG9nIEFQSQ0KPiANCj4gVGhpcyBjb21taXQgcmVwbGFjZXMg
b2xkZXIgeGVfZ3Rfbm90aWNlKCkgYW5kIHhlX2d0X2VycigpIGxvZ2dpbmcgY2FsbHMgd2l0aCB0
aGUNCj4gbmV3ZXIgc3RydWN0dXJlZCB4ZV9sb2dfaW5mbygpIGFuZCB4ZV9sb2dfZXJyKCkgQVBJ
IGZvciByZWdpc3RlciBzYXZlIGFuZCByZXN0b3JlDQo+IG9wZXJhdGlvbnMuDQo+IA0KPiA+IFJl
cGxhY2UgeGVfZ3Rfbm90aWNlKCkgYW5kIHhlX2d0X2VycigpIGNhbGxzIHdpdGggeGVfbG9nX2lu
Zm8oKSBhbmQNCj4gPiB4ZV9sb2dfZXJyKCkgdXNpbmcgdGhlIFJFR1MgYW5kIFJUUCBjb21wb25l
bnQgdGFnIGZvciByZWdpc3Rlcg0KPiA+IHNhdmUtcmVzdG9yZQ0KPiA+IG9wZXJhdGlvbnM6DQo+
ID4NCj4gPiAgIC0gRmFpbGVkIHRvIGFkZCByZWdpc3RlciB0byBzYXZlLXJlc3RvcmUgbGlzdA0K
PiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IFRoZSBjb21taXQgbWVzc2FnZSBzdGF0ZXMgdGhh
dCB0aGUgZXJyb3IgbG9nIGZvciBmYWlsaW5nIHRvIGFkZCBhIHJlZ2lzdGVyIHRvIHRoZQ0KVGhp
cyBjb21taXQgbWVzc2FnZSBzaG91bGQgYmUgdXBkYXRlcyBhY2NvcmRpbmcgdG8gY2hhbmdlcy4g
IA0KPiBzYXZlLXJlc3RvcmUgbGlzdCBpcyByZXBsYWNlZC4gSG93ZXZlciwgdGhpcyB1cGRhdGUg
YXBwZWFycyB0byBiZSBtaXNzaW5nIGZyb20gdGhlDQo+IHBhdGNoLiBXYXMgdGhpcyBjaGFuZ2Ug
dW5pbnRlbnRpb25hbGx5IGRyb3BwZWQgZHVyaW5nIGEgcmViYXNlPw0KPiANCj4gRm9yIHJlZmVy
ZW5jZSwgeGVfcmVnX3NyX2FkZCgpIHN0aWxsIGNvbnRhaW5zIHRoZSBvbGQgY2FsbDoNCj4gDQo+
IGZhaWw6DQo+IAl4ZV9ndF9lcnIoZ3QsDQo+IAkJICAiZGlzY2FyZGluZyBzYXZlLXJlc3RvcmUg
cmVnICUwNGx4IChjbGVhcjogJTA4eCwgc2V0OiAlMDh4LA0KPiBtYXNrZWQ6ICVzLCBtY3I6ICVz
KTogcmV0PSVkXG4iLA0KPiAJCSAgaWR4LCBlLT5jbHJfYml0cywgZS0+c2V0X2JpdHMsDQo+IAkJ
ICBzdHJfeWVzX25vKGUtPnJlZy5tYXNrZWQpLA0KPiAJCSAgc3RyX3llc19ubyhlLT5yZWcubWNy
KSwNCj4gCQkgIHJldCk7DQo+IA0KDQo+IFsgLi4uIF0NCj4gDQo+ID4gdjM6DQo+ID4gIC0gRHJv
cCBjb25maWcgbWlzbWF0Y2ggbG9nIChNaWNoYWwpDQoNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yZWdfc3IuYw0KPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3JlZ19zci5jIGluZGV4IGUzMjhmNTA3MjU1NzIuLmVhYjg0YTUyOGQx
MjINCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmVnX3NyLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmVnX3NyLmMNCj4gDQo+IFsgLi4uIF0N
Cj4gDQo+ID4gQEAgLTg3LDE1ICs4OCwxNSBAQCBzdGF0aWMgc3RydWN0IHhlX3JlZyBzYW5pdGl6
ZV9tY3Ioc3RydWN0IHhlX3JlZ19zcg0KPiA+ICpzciwNCj4gPg0KPiA+ICAJaWYgKGlzX21jciAm
JiAhcmVnLm1jcikgew0KPiA+ICAJCXJlZy5tY3IgPSAxOw0KPiA+IC0JCXhlX2d0X25vdGljZShn
dCwgInhlX3JlZ19zcl9lbnRyeSB1c2luZyBub24tTUNSIHJlZ2lzdGVyIGZvcg0KPiBhZGRyZXNz
IDB4JXgsIGZvcmNpbmcgTUNSXG4iLA0KPiA+IC0JCQkgICAgIHJlZy5hZGRyKTsNCj4gPiArCQl4
ZV9sb2dfaW5mbyhndCwgUlRQLCAieGVfcmVnX3NyX2VudHJ5IHVzaW5nIG5vbi1NQ1IgcmVnaXN0
ZXIgZm9yDQo+IGFkZHJlc3MgMHgleCwgZm9yY2luZyBNQ1JcbiIsDQo+ID4gKwkJCSAgICByZWcu
YWRkcik7DQo+ID4gIAkJcmVnX3NyX2luY19lcnJvcihzcik7DQo+ID4gIAl9DQo+ID4NCj4gPiAg
CWlmICghaXNfbWNyICYmIHJlZy5tY3IpIHsNCj4gPiAgCQlyZWcubWNyID0gMDsNCj4gPiAtCQl4
ZV9ndF9ub3RpY2UoZ3QsICJ4ZV9yZWdfc3JfZW50cnkgdXNpbmcgTUNSIHJlZ2lzdGVyIGZvciBh
ZGRyZXNzDQo+IDB4JXgsIGZvcmNpbmcgbm9uLU1DUlxuIiwNCj4gPiAtCQkJICAgICByZWcuYWRk
cik7DQo+ID4gKwkJeGVfbG9nX2luZm8oZ3QsIFJUUCwgInhlX3JlZ19zcl9lbnRyeSB1c2luZyBN
Q1IgcmVnaXN0ZXIgZm9yDQo+IGFkZHJlc3MgMHgleCwgZm9yY2luZyBub24tTUNSXG4iLA0KPiA+
ICsJCQkgICAgcmVnLmFkZHIpOw0KPiA+ICAJCXJlZ19zcl9pbmNfZXJyb3Ioc3IpOw0KPiA+ICAJ
fQ0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IFRoZSB2MyBjaGFuZ2Vsb2cgZXhwbGljaXRs
eSBtZW50aW9ucyBkcm9wcGluZyB0aGUgY29uZmlnIG1pc21hdGNoIGxvZywgYnV0IHRoaXMNCj4g
cGF0Y2ggdXBkYXRlcyB0aGUgbWlzbWF0Y2ggbG9ncyBpbiBzYW5pdGl6ZV9tY3IoKSBpbnN0ZWFk
LiBTaG91bGQgdGhlc2UgaHVua3MNCj4gaGF2ZSBiZWVuIG9taXR0ZWQgdG8gYWxpZ24gd2l0aCB0
aGUgdjMgY2hhbmdlbG9nPw0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTI4MDkyMTE0LjE2MTAyMDMtMS0NCj4gZG55
YW5lc2h3YXIuYmhhZGFuZUBpbnRlbC5jb20/cGFydD02DQo=
