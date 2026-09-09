Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46583939BC
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 20:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987222; cv=fail; b=obAnRTefO+w3i3cbuasI8rGYr6a1w+vapikxM1uxCMtKMv4Jjun+GjRhRUffh2ciCkGMOeksx8Olm10M+0+d+15PkUQxrPqRJlT9cii0+rxlhacGx9wCGOpZUogENbSNvylgsJ8fhfTu4++Q2bTMk53VlvhRKwzw1VnBmfUqZkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987222; c=relaxed/simple;
	bh=FWi9zAQ4xHGl3guU5TeLjBiWlaH4SwxVMmA/xS18xPA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gNaN0YQPfEXAJ+Cq6pXP7klRlUNl213Hq04L5uwqt1sIhgoF6jZmHqR3lhLZnbf85PJexyCjk8OCTpMtBOYld89RrvNYn7lJm2/t8IoeNiHMjUyM91tmrTrIPpFZ+o6ZOunzdl7SP677Pv28V5QInbhcw0zbBIVzbinS+07hdgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TgND0psN; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgND0psN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788987216; x=1820523216;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FWi9zAQ4xHGl3guU5TeLjBiWlaH4SwxVMmA/xS18xPA=;
  b=TgND0psNLEiHzd1J6maSsmkqV8OnhgtjPyxqYTbb6kdCdD5YKwtRr8zP
   ZDGuFgcAgbUmmjaqgAMwe5h3Oz75zeobOU8ZbzgdrnpGK8RcaaH1ia3wN
   Twl+yndCfhSAz9PtEFyuloFHmUUPjNJ41H3rmSMC2/B5f0/oY2hTZvCQ8
   FMGbfQfr/mThY4NIxuRX4iOUvsBej6gF7CJJeMhDUzKvkLvmyX8LKceET
   LUCJusmLTCGQazpdx9BH8VYQIrkJ6Q2BlE+Z2fdA3B0k4c048/q20KX+b
   V45uKbgAiFUoBtW5gaYQlRj/Z5k5pomIAp11/Ab6bCXxTwPOsvpPdiopL
   A==;
X-CSE-ConnectionGUID: NgX4oOepTIySgkA+m5v/Gg==
X-CSE-MsgGUID: ECKPk2pNSTaeY6tRltRqwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93251526"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="93251526"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 13:53:32 -0700
X-CSE-ConnectionGUID: 6pBuH5zCS8SVfDYt+JDVew==
X-CSE-MsgGUID: 35hRR/2zSqm8bkC8hWoqow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="265223930"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 13:53:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 13:53:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 13:53:31 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 13:53:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5Y7uJbC7GwtVIs3X9H4xJFeoRLK0sREG4dypg9gACqJQyPRl6uDz5+oKLogyCwP80H9wZ/2TpgcEG7clMqXjlxxHlMcgOizzCrRdEzY7eBE/5jPnt4+WYyD+u9k5A3BWoYN5+9w1N8E7xeAuHFZu8D/qzZHmUKOCJjQEpTuFvQDokbUrsdJqDRjqykg/lcYRUM19x7IMu/c4Jd5BTQs5HlmQvucUn6D6XLmKB2kSYm5rosVIf9DFNir+NRNlUDAVuW4vitNBS2B/8eRK9Nb+CfLNVwO0tHyb50RWOkU5uv5M3syOFgOxXAMpLfhYLh6S1aHR7aoh8yjkjDh+qX44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWi9zAQ4xHGl3guU5TeLjBiWlaH4SwxVMmA/xS18xPA=;
 b=Yf8a/8HmeqghaHYtdf6RheklA0NyxS5NyBY8qG5Cphfj7j/CMDCc52k435ZDZ3uGw83QxrBx8PT2tqYwA+04EYH6sbcerYplG37XAgKLJlp+5yf69VTBrnnOB8qAYb8DWS9H9NHCtjbziwPX9ozypvdkfKau0Bg9eAyoZFaIkaSuo2K19JvfnQ6TWHkCF7ssm8IGytgYZJBocBzryh1JBpDc0c+bxAz4ZjPPZjyRPSlxIh676ndSYBhqqboi/f6tiRwoe6Vb+1AaYgQsgblt6j4GKkw3MT3rzvclKvYGsjQU8QTPixkYu7CibHjrQoR1l4OpnFT5H15YhaYHRe4YKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 20:53:27 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%3]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 20:53:25 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v7 1/2] drm/xe/shrinker: Return the freed page count
 through a parameter
Thread-Topic: [PATCH v7 1/2] drm/xe/shrinker: Return the freed page count
 through a parameter
Thread-Index: AQHdQHdN5U/694H4LUOvzpWIli1oh7bGb8oAgABHcTA=
Date: Wed, 9 Sep 2026 20:53:25 +0000
Message-ID: <DM4PR11MB545696EDEFD1407E0D48F781EAB02@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260909162102.1097006-1-shuicheng.lin@intel.com>
 <20260909162102.1097006-2-shuicheng.lin@intel.com>
 <20260909162919.5B2A01F000FF@smtp.kernel.org>
In-Reply-To: <20260909162919.5B2A01F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ2PR11MB7598:EE_
x-ms-office365-filtering-correlation-id: 7cf9e75a-48a2-49d4-9592-08df0eb4647a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: tgIaGurLK3TnDxmFXyAtypOc7aDvIlZiiMlQttKfK7O6747RNW+qdeqQv78Ayzw6kZbz7VhWWS+jdRDmWv/qKQZ5xGw94rIO0aGQzA9BQaI/7tw/wWWfy/S23X6ox8HwfbFL7K9h1Qe1V2458oRt8u5IvgLjwbNJs0d8oqU7gevLHdAdR3MptN2xxxBU4wAnIaoXEhKzb9VXKhf28Y1VRb1rb0Tgy4RNEeNP6/7Wv7NdRNyN9aMbMzDPqgk9Epsp2B7l9OglzO5lCS4795DrVhgmBPaOB2B4ECZ76CnB6sdrb0PwCEoahej7YbuOu96NZ4hSNtQT6epsmCqubyhK2rqq8eRLXUq623aTcIZLgG2SXoe8sqlCx1ADdp4W4gimeiMYUDk/xlm9OFrDQkxyymA/Ww8rYg2gzySOfsfsBumntZsAVqnsSgRW1pMuWvpopqYFpmb0CkudFmblxhkFcKlwXGpwF3CGIBST8O7Fup8UqTWaciCR92VhqXOvznwjlWE6+jdI8k7xv8jDn8pAeTNohaGE4BLJJcL6HlLgAnZt0jTRIENtloHlf4HQ9FU/XjOGJLjWC0Ba+GDxji6UMApmBb/b/fSqbmjubXGeQU7c8jcoJNnBHJqaZJyKnDHs/uz8DlEbTfc8vcB/YnxW0YaHE1yo7BmA6/jGAe+oaLo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5456.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVNQYVJrQWk5bkF5cTVrc290ekhJbmozWktzSm5qVkEyWmY3b0hMVk1la3o4?=
 =?utf-8?B?OHR2R0JVT2huUUU1Vzhyb3lEV3haUXQxM2Z2dTJ2MDI3ZDl4SllVaDFwTFl2?=
 =?utf-8?B?WFBqRXo1ZlFBbFFVWmF3TFZpNFVSWmFSdkIyd2tQb2tOTHh3STNIa3hhdnRI?=
 =?utf-8?B?dXI4anZhRDhsaVEzdnhaSjBMZ2ZTV2ZrQUZTMkxrcEZQVFUrTTZkOFBRTmx3?=
 =?utf-8?B?VzVZN2VSQ0ZYZ3B5REhCcEI3SWtvT0lUV2NwNlVQVnV4Y0JyM2ZDbnNQSUJ5?=
 =?utf-8?B?Rmk0QVNmMCtWN3NSSnN6bmc5NE9PTk9za1BEaFBVeC9NYVBiSE9vQjZTV2JT?=
 =?utf-8?B?Ykk2S1Jkbmtrczh1WDd6Z1k1cEd2RGNMcTExS1FUYUhPWjRqOUJwK1Y3MzRN?=
 =?utf-8?B?MmMzZUtySm5taWZlVUtSYWluN2NqdW9YOU1jdElLenY3ZkJscTNiSUhVVTc5?=
 =?utf-8?B?ckY5emd3Rm40eFVSSjUxM2hsTG1RUDVaY3VDaGFHdGErcEFWNFJ1N3JNdnlQ?=
 =?utf-8?B?bzRPT3JOT2V4c0VHckxOaTVtVmd1dGdyR2lIcmdQZUJVZEpwRFErc2NrYURZ?=
 =?utf-8?B?R1JLQWlJd1czLzVjQ3B5VmVzR3hGKzF1dDdGL2VrVVRZVmpPNjRwTTdhaG80?=
 =?utf-8?B?czhFNVZySUdnaFExT1VlV2FWQW5PdGo3U2FBeUNDNFhCeHhUMkdtUi90ZkJ0?=
 =?utf-8?B?ZnMxY2NjVGlYQXRGbVI1cUpUY1AwU2F2V0FVQlFHb2c5OFRLalpjcUZHdTkv?=
 =?utf-8?B?TENicHBmWUNrVmoxMTlYWk9UaFdZak9XbzNrNzFybHdEMEIxdnEwZ3JLcEVB?=
 =?utf-8?B?bnIyWGhOc2w1YTl1S2R4bHNabmcxUzdWbEJOOGZrbk05Y0JiM2ZiYzZORUZT?=
 =?utf-8?B?ejVRUGJHWTY2NVpsUWVWSk1MTHF4QUI2anlocGx1UytzWlNQejh2T1BxcDk0?=
 =?utf-8?B?QVNVdDA4L3U3VjI4UzBpbll0WEUvTzJPOEV3NzhlR0NUa2lwTXR1TWVYTmh1?=
 =?utf-8?B?cGxva0MvQUx1QWZ5R3lGbmxwOFZuM2VnUlZMTlZIR3ZMOUtNZXhXUnBzMXQ4?=
 =?utf-8?B?WUpaVEJ0YTRnUjlkalpUdHhNYVgwZ2VjQk5HYUwxUEk2OVBoNFVmcVRtSkF6?=
 =?utf-8?B?U3N4YXpZMTRod25aOWdNaFdRam1WNVhwU2N2MzNyN3hTZWo0c1pVQm5vS3NM?=
 =?utf-8?B?NldBK01qbEl0MmU2ZW4zUEo4cGlPMWttejdrMW9aN3ppYVJRb1hZQmo4MXNH?=
 =?utf-8?B?Nm9OTXhQN0o1OTVmMStjSnJ3TGU5Y2ZBa0NWemVmTWtjbFVUMjVBdUNOb2pW?=
 =?utf-8?B?Z0tFT29yaFlodmc0S1kvN1ArWVkzbHdlYndXZkFkWklmWUd1a3lzYjJsMkk0?=
 =?utf-8?B?WDdRU0dXMmF3ZjZqZXVPS3FpTlVPOUVDUXV3VHoxSVgva2ZxZ2ljR0YzTGhr?=
 =?utf-8?B?OHRjWTE2MUFJMVZ1Q1FySktVTHlWdHJmNHBCc3o5Qll5L1VUWFBwWWptV1NG?=
 =?utf-8?B?ZFN1cjhodzQvanlFOHVmTzh6VWhKWTY4cnFIVy9IbCs5QnlweHRVNTRIWHRz?=
 =?utf-8?B?Vy9QV1ZwRnFCWVR3TUdYSjRnb0JtUGE1allGbG54UmdzZmx2a083alllaGJB?=
 =?utf-8?B?UmVlQ1VxQjdsdnJJUHVyeGxPY1hrejcxRWNyclE0V25HdCtrMUp2MWhPRUFo?=
 =?utf-8?B?TU5ONy9UQXNpUmZzYzB6SHFWdUZBSVJtS1ZCRDdCUVJvSW1EdGdCVkFQSE9K?=
 =?utf-8?B?NWJYRk9SK01oWXpIK3hLR040cldtVW1ZZDRDWEV5a0pzZnJYYWRsWVR2Y08v?=
 =?utf-8?B?VTV5ek1kLytocit2Q1l4YkpZUy8rTmxjTWMvd0djK1NrTER4YTlWMExtdDZC?=
 =?utf-8?B?SG03Q2ZRRE1kWjhYS0MxblJhMmU3NXpFNTVrSW9TZjZyc0tkam1RT3RZdTVZ?=
 =?utf-8?B?WUxCQjQwWWh1T2NUUG0zSVFVR2NOMVhCNlVISzcvMjRUbWZiUFZmeE91WXlq?=
 =?utf-8?B?a244cXl3OXBsenllYW5tVDI3aWlGalFDNlNOMWYvOVFscVNLM3IxbzY1QVMv?=
 =?utf-8?B?aGR4Um9tZEJBSnVTVTJBYjUrSWk0L1c3QTAzbGMwSXM1cGJzSk9YY2ZhWW5m?=
 =?utf-8?B?OUJTM1VqTWdoL1ZId3BGRlpmOUZwbnM2Qk9yVy9lTTZtWUQ3dkxPYUtDNjRY?=
 =?utf-8?B?NWxybGVIOXh0cXFDVkU1aXRuSW9jdmo0RDZLZldrUFdzRVg0V3dHTVVqVlFq?=
 =?utf-8?B?a0NGamFQVmtCTWdUSEdIYWEwMzZQeFhWT0ZOeURTSnRkb2xuT3ltSVBhSXlk?=
 =?utf-8?B?c29XK0VsbW1BWi9Nb2Q4M085MXlJbnRSd0hHZGQxSkM4ZExNN0o5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SCw5rh3kahD4iyPz5iLN4yY/TjhTlLzBR6OVJJwNKDHknd1fTZa4SOWl1Nra3QcbdOt3uiU8NuNqjZGBklDJ6WvbI2FMDrMfss33Ojb6eTjuU8KT0SJt1pJr1rOuLpEwKp4h1dpFjmwGIJ73sJIOP82BpzeYSgu6XueIEjkv4xvoCwApwQHPz1+4MhvROwKt+AA6QXwlkzRYenSgGwMavmi+QaWBKdwyah0ht7cx6SBw93mq7zkjB9+NbPVREbB4fm1yHaRn+lkwGZvI5r5idUyysSLFFUezEyuZfM0sq+DQtSa2Cj/jiQhZhpfwmx/vNGH36guYwaAXj1kwWVl2cw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf9e75a-48a2-49d4-9592-08df0eb4647a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 20:53:25.2087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NPzu/grP+jctPy+YDQr/mssm7u/rAr9xVqXAKYT48iSnmjklHfyh+asdWUWxTqav+Rf2jA45JKqB1OK0oTWW8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-OriginatorOrg: intel.com

T24gV2VkLCBTZXAgOSwgMjAyNiA5OjI5IEFNIHNhc2hpa28tYm90IHdyb3RlOg0KPiBUaGFuayB5
b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVu
dGlhbCBpc3N1ZShzKQ0KPiB0byBjb25zaWRlcjoNCj4gDQo+IFByZS1leGlzdGluZyBpc3N1ZXM6
DQo+IC0gW0hpZ2hdIFRoZSBMUlUgc2hyaW5rZXIgd2FsayBhYm9ydHMgZW50aXJlbHkgdXBvbiBl
bmNvdW50ZXJpbmcgYSBidWZmZXINCj4gb2JqZWN0IChCTykgdGhhdCBpcyB1bnN1aXRhYmxlIGZv
ciBzaHJpbmtpbmcsIHBvdGVudGlhbGx5IGNhdXNpbmcgYSBsaXZlbG9jayB3aGVyZQ0KPiB0aGUg
c2hyaW5rZXIgZmFpbHMgdG8gbWFrZSBwcm9ncmVzcy4NCj4gLS0NCj4gDQo+IGNvbW1pdCBmZGJl
NzE1OGRmMzM5ODI2OTFlZTY3ODk0ODE5MWM0NmJmMGY1MTQ4DQo+IEF1dGhvcjogU2h1aWNoZW5n
IExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+IGRybS94ZS9zaHJpbmtlcjogUmV0dXJu
IHRoZSBmcmVlZCBwYWdlIGNvdW50IHRocm91Z2ggYSBwYXJhbWV0ZXINCj4gDQo+IFRoaXMgY29t
bWl0IHJlZmFjdG9ycyBfX3hlX3Nocmlua2VyX3dhbGsoKSBhbmQgeGVfc2hyaW5rZXJfd2Fsaygp
IHRvIHJldHVybg0KPiBzdGF0dXMgZXJyb3JzIGFuZCBhY2N1bXVsYXRlIGZyZWVkIHBhZ2VzIHZp
YSBhIHBhcmFtZXRlci4gVGhpcyBwcmV2ZW50cw0KPiBkcm9wcGluZyB0aGUgY291bnQgb2YgYWxy
ZWFkeSBmcmVlZCBwYWdlcyB3aGVuIGFuIGVycm9yIG9jY3VycyBkdXJpbmcgdGhlDQo+IHNjYW4u
DQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc2hyaW5rZXIuYw0K
PiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Nocmlua2VyLmMNCj4gPiBpbmRleCA4MzM3NGNk
NTc2NjA4Li44OTQ0NWNkMjAyMzgwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9zaHJpbmtlci5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Nocmlua2Vy
LmMNCj4gWyAuLi4gXQ0KPiA+IEBAIC04Miw3ICs4Myw3IEBAIHN0YXRpYyBzNjQgX194ZV9zaHJp
bmtlcl93YWxrKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiA+ICAJCQlpZiAobHJldCA8IDApDQo+
ID4gIAkJCQlyZXR1cm4gbHJldDsNCj4gPg0KPiA+IC0JCQlmcmVlZCArPSBscmV0Ow0KPiA+ICsJ
CQkqZnJlZWQgKz0gbHJldDsNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gVGhpcyBpcyBhIHBy
ZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhpcyBlYXJseSByZXR1cm4gYWJvcnQgdGhlIGVu
dGlyZSBzaHJpbmtlcg0KPiB3YWxrIGlmIGEgc2luZ2xlIGJ1ZmZlciBvYmplY3QgaXMgdW5zdWl0
YWJsZSBmb3Igc2hyaW5raW5nPw0KPiANCj4gSW4geGVfYm9fc2hyaW5rKCkgbG9jYXRlZCBpbiBk
cml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYywgLUVCVVNZIGlzDQo+IGxlZ2l0aW1hdGVseSByZXR1
cm5lZCBpZiB0aGUgQk8gY2Fubm90IGJlIHNocnVuay4gRm9yIGluc3RhbmNlLCB3aGVuIGEgbm9u
LQ0KPiBwdXJnZWFibGUgQk8gaXMgZW5jb3VudGVyZWQgZHVyaW5nIGEgcHVyZ2UgcGFzczoNCj4g
DQo+ICAgICAgICAgaWYgKCEodHQtPnBhZ2VfZmxhZ3MgJiBUVE1fVFRfRkxBR19FWFRFUk5BTF9N
QVBQQUJMRSkgfHwNCj4gICAgICAgICAgICAgKGZsYWdzLnB1cmdlICYmICF4ZV90dC0+cHVyZ2Vh
YmxlKSkNCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7DQo+IA0KPiAgICAgICAgIGlm
ICgheGVfYm9fZXZpY3Rpb25fdmFsdWFibGUoYm8sICZwbGFjZSkpDQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVCVVNZOw0KPiANCj4gSWYgX194ZV9zaHJpbmtlcl93YWxrKCkgcmVjZWl2ZXMg
dGhpcyAtRUJVU1ksIHRoZSBlbnRpcmUgaXRlcmF0aW9uIGlzIGFib3J0ZWQuDQo+IEJlY2F1c2Ug
dGhlIGl0ZXJhdGlvbiBzdGFydHMgZnJvbSB0aGUgaGVhZCBvZiB0aGUgTFJVLCBhbiB1bnNocmlu
a2FibGUgQk8gYXQNCj4gdGhlIGhlYWQgY291bGQgcGVycGV0dWFsbHkgYWJvcnQgdGhlIHNocmlu
a2VyIG9uIGl0cyBmaXJzdCBzdGVwLCBmYWlsaW5nIHRvIG1ha2UNCj4gcHJvZ3Jlc3MgdW5kZXIg
bWVtb3J5IHByZXNzdXJlLg0KPiANCj4gU2hvdWxkIHRoZSBsb29wIGlnbm9yZSAtRUJVU1kgYW5k
IGNvbnRpbnVlIHNjYW5uaW5nPw0KDQpJdCBtaWdodCBiZSBhbiBpc3N1ZS4gQnV0IEkgd291bGQg
cmF0aGVyIGl0IGlzIGJ5IGRlc2lnbi4NCkluIHhlX3Nocmlua2VyX3NjYW4oKSwgaXQgd2lsbCBj
YWxsIHhlX3Nocmlua2VyX3dhbGsoKSB0d2ljZSwgZmlyc3QgdGltZSB3aXRoIHB1cmdlIGZsYWcg
c2V0LCBhbmQgMm5kIHRpbWUgd2l0aCBwdXJnZSBmbGFnIGRpc2FibGVkLg0KU28sIGlmIHRoZXJl
IGlzIFNLSVAgaW4gdGhlIDFzdCB3aXRoIC1FQlVTWSwgaXQgd2lsbCBiZSBjaGVja2VkIGFnYWlu
IGluIHRoZSAybmQgY2FsbCB3aXRob3V0IHRoaXMgU0tJUC4NCkkgd2lsbCBrZWVwIGN1cnJlbnQg
aW1wbGVtZW50YXRpb24uDQpUaGFua3MuDQoNClNodWljaGVuZw0KDQo+IA0KPiA+ICAJCQlpZiAo
KnNjYW5uZWQgPj0gdG9fc2NhbikNCj4gPiAgCQkJCWJyZWFrOw0KPiA+ICAJCX0NCj4gDQo+IC0t
DQo+IFNhc2hpa28gQUkNCj4gcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDkwOTE2MjEwMi4xMDk3MDA2LTEtDQo+IHNodWljaGVuZy5saW5AaW50ZWwuY29tP3Bh
cnQ9MQ0K
