Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794866831;
	b=34uBp2gcmLMAP2cmG01wp1MzRm1HiVliTFQoTjl1jmibqp9bPpqrPlAvz4vSDWnOww2T
	 QxHwtL9VgMeLcvYUlscuBySeXwoJ4qE84NR/bl1I+IPq9GBbAwTy60QwFQ1G70LZezpEn
	 zS+qdSGMg973CmpYP36phBrqadlRyqeld9imNULFbMdi0OgttLmJ28z4XmW9qZjfhdytm
	 aQCQL1TutPeTFClY4qEsYu1u3i9v0GesUyTlIVJJ+7XmVc/38qYZ8lBS0H79m7H4pX/wB
	 PN2kHpphBl+B+UTed2TKyjFNmQQ/rmMKkOEzJwYJL8wp9QIGSieyZPGtPggG80+eUow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866831;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=MnVaGscE2veSynZUZH5AGu7fBTWxp+2jWRVh4tbxZjw=;
	b=bFRfQJN13FAlDsa7l5qhNVMbwZEZZr30kLmwXfDJI/Ncmc6wZf62HSYXWFPa8ji75l5K
	 qmyt3Fav90qFLXxkV8ECwLDU1DPLwm4UH+XuEIytUT2NBpNGN+7VI+WqEP0bt1zbSQW8z
	 o46IPJiXUNw7KfNyMnV6JZtpwrAIMQ+Z6mWGjjEZmEw+7VzhGMBHkkWQfkJZ2CMRT18k7
	 x4zuvg6S1RY4WOcVRwaQRGNMQO2qY7e8Sc5rsM39fFMf0UEhIZ7rpIs5kg7v1tqsKM6Gh
	 IN0HU5AtegxnRZ8ufEn9H15zMl65m2D37Y0NZaDBP/Hk/ZDb7mXUssPb2EOoypIqMog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UXxareTH;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=QuB9v6Qh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CF8606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 22:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4CF8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UXxareTH;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=QuB9v6Qh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794866831; x=1826402831;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=We0v64w0LgA1CS/fcuBn15BQCjz58kYTm3IYcK9280o=;
  b=UXxareTHqKsceDCBM9/CqyEsN54WRPOfO2aj7ZzbG9btIQ2CvGUfS5am
   V+a69SbzGmXioLJZmQBPY2ru8BJ8DAv3PJ+OIeVG3qSspLJqnMoSEftvg
   lOBk0+8JEPllRCxhRGbSb6oag+Gl9tz6rWF1oxcPxzVVENjPpGRxEHQ43
   dMi1jHC7dyk9k4L2CmrURY2F2GRMYExvKtqzDKxSjq7X+ehu3nuWERODb
   sOs0PLiOClN7BYGRz1MGSK9btW11CqEE/dMuhgHKNHiMliYGdYkQtpJp1
   5ErEE0sN1HoWphlsbM3pA+5nhc6W7VUSuZmR1lwIIPPjhH2oiQTbYy9XO
   g==;
X-CSE-ConnectionGUID: 7Y+F68xtQIaRLR1PGLYNKg==
X-CSE-MsgGUID: HzEB8vRQSIywzUnZUXUPwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3657653"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3657653"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:07:11 -0800
X-CSE-ConnectionGUID: p8wogZQpTOCmr4arE3ZxNg==
X-CSE-MsgGUID: 8ijd7pgdRIqJ8thMx9x4bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9582923"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:07:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 14:07:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 14:07:09 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 14:07:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUJQVnY4mP5bwuv8SO6InlJtDANbGJ4KxiTKll3c03vQ6I6gREHSDq2ZymfLRCm+5CJSBDIcevfpeFGGqKHj+IGq2L0XHqqEel/UzeXnrV8RLdl+7CwOjJOBmdZTLa8k1f+p//s0CDe77icE4pG0YsI55vah201K25VMgU/6p4dDjT3fDeQznMrhbY1TMaeyAKIXf7DEwrcP2KuyyE+w3sQChvjXUIqYdk1hj/ujBRwEwthptnYJAPe0ccUAHEG/jkk59H85pIhi5oxYFkSowLs98xdtt+fkv949XygYjhUJDXnhenQYA0MKSdJtjBNMMuNf9qJbvNkPQFLksFfwiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnVaGscE2veSynZUZH5AGu7fBTWxp+2jWRVh4tbxZjw=;
 b=vvOowSM7eYfO2RSdM9aqZOQyH2TH/4Z2qvXUKb8geI5maPFWxlIPNS5UzjGkHy6H3wofOHvQllq55BwdynNdW3xV7k7ePVV/hnGkH0kYl3y4N+ztUxeO2PWE1lco2ed/R0tDiUx8ZmHvKQTsmaWbN5NQq04spfzcxNVjG1BGbmOrrnFrj0tNl1OT3xTLOgFfxAK6r6ux927G33N3mZNmtThZ+P+2FHplsib4UPKKPkj8GeXkkuuXSZgt/0aoO3WPQ75IQTBtM6tyggFERfXClxkyQtAdG0dJNx0gT/wqGPpC5e5XhsbQ3hQRZ2eXEL1gWUcgMIimQckAKRwAZ4yAgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnVaGscE2veSynZUZH5AGu7fBTWxp+2jWRVh4tbxZjw=;
 b=QuB9v6QhCf/RQA6GZof2dkE53AFLduhG96ErHL/MigRdceUxYHj+rF+BNrCo1rtE6voGHgYF0Ngn4oEk7boD8VwgJ0elPYqu5XSC27j4alKnDvryaipdQq4INQkCtCg1YoQIBLgVARhQL6XTCWDY4uO44r+VSHzbdZJ2hppiOjk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by SJ2PR11MB8537.namprd11.prod.outlook.com (2603:10b6:a03:56f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 22:05:06 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 22:05:06 +0000
Message-ID: <73700e85-eabd-422a-820b-cb8346abd1c6@intel.com>
Date: Mon, 16 Nov 2026 14:05:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 2/2] drm/xe/wopcm: Simplify GuC WOPCM programming
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261113191739.1447747-3-daniele.ceraolospurio@intel.com>
 <20261113191739.1447747-4-daniele.ceraolospurio@intel.com>
 <sashiko-outbox-213554@kernel.org>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <sashiko-outbox-213554@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|SJ2PR11MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab3f422-2331-4f8c-5843-08df442dabe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|261009223027099003|18002099003|22082099003|3023799007|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261022113327099003|261102123227099003|261028144727099003|261022105027099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 5msG8V6P0HQqncOfhqYmCi/jMHOcrYSf7KJBV25KR0qtUPhUbRl3HPJKtFQOiHdwd7d4XjveomYuSDBgGOXSiBi7Js7E1UBPHgEt7gSMW+Bl+3Uq7Bv4YNRvDRNbdOcqWhFM3Jc4QQvzLsWGnW6fgWm8LtyQMaPDOw2u3XZVjDHELnLwAnsUueqQcHeqIWIihOp0Qn9pUyLMQFN7zkon8DW/rjXlwhPaZiL6jmmxOtUMOU2P+dDWXjQPdkdsFUUzcrRdOtc43JLwrZ1l5x/0TOC8PzUZJqt+PXMUA6yzk5ipEauqnBAFp+ol/R34MYnwnDeJAmAFL9Cb2jkC2KdR1Nyc6kJseoMvCSkn/AU9b9AljpZS+L1SFq960CJ7yp0Ay/C8X8tFGt/4B3agzNvlNN6dVMSXcelzR2wraINjXky/MjD6+KlhUtp6N1UsWrzRl8BRJgIybL/1fvCd6t1Qv5DDAs66WrVVfpWA4P11KAUpv4rN7fHA8d78Mk7aSvPXxfyJcKxqgawMElDAmzBRiNq1m8I11DKpcacc/sGaPIbcjk4aEjxX1m+jyUa+zzKTjd42xQi9Ha+fltKsgz890F6TUtHcUmFj44CB6NyiJgbON7i9ccC1EJUZD8qHVKBEheXbNHWP2H2m6r10VadznWM95lPrt9MFmoePDSvtcK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4979.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(261009223027099003)(18002099003)(22082099003)(3023799007)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022113327099003)(261102123227099003)(261028144727099003)(261022105027099003)(56012099006)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZThoLy8wYjJSYWsxY2VkTVR3OEF5R3lSaktEMVJ3SkxmdHhxUXdpbnVFME1X?=
 =?utf-8?B?RjdvRmdTSlhsbjRvdzlqbENvdGRyYW5CbGU3NWJ1QllTTjNxSXRSMlBRQnpC?=
 =?utf-8?B?WHVoUlFlWjVaZDVobHByOEtpZEo4ZEpmSVRFcHV0dHFybklWTUZBNU1yUEVE?=
 =?utf-8?B?d3FDK2hDQnlXQk5XVzFOVks1YXI0bk9vdnZ0cFo3ZDkxU05Md1k1dWNlbHlM?=
 =?utf-8?B?QVgwZ2cwWmFBNURnOXM3TFNMcW9CSnBKUjIxM1V2b3Z0SEhPaDV1NENUWHdV?=
 =?utf-8?B?dG8rakVpQXp5ODZpREZJeXA3d2xEQkdzRHhEZVVlUy9ZcUpZMlZ3OUMxak5h?=
 =?utf-8?B?L2w3YzhpNXRxOVBzSzl0ZnMrUFZBSUw3YXVOWCt0NUNVTnZuMEhQbmNnU285?=
 =?utf-8?B?WVl4bURPVUxHeWN4V3ZHODZiZ3lpelI4T0dBaDBvNkUzZk8yeWpJN0cvNlFH?=
 =?utf-8?B?R2R3TnVWMXAwVUdJWnlISDJnVWY0MDBQY28wT2Z0RXhXSXpUamY1c2xycFhp?=
 =?utf-8?B?OXlTSDZXcGNMSm1VajFmVWZ2MkhSZjIvM2F0NlV2NlRWQVR1aHd3bDlMVzlR?=
 =?utf-8?B?OGhSTnRKM2dUUDY4d1lycUloUlZBZUlLbHNNK2o4VFNmampGRFMyL1BYUVM0?=
 =?utf-8?B?LzUrM3B3YnNYc0tLZCtrWFF3ZjBVZ2VLay9uQU90d0lDQ1UzWFBaUkM0dUQ4?=
 =?utf-8?B?VTZaN28xYnlhRE4zaXFRSW1pOGhtcVBDSWYyR09kY1FDQUtOOHZiMFJSSDBX?=
 =?utf-8?B?S2tTZS9CTXNWSUV5UENWblo3eno2QTVOeWFscWVZZ0YzTmJUb25DZlowNnZH?=
 =?utf-8?B?ekdTV1owZkF2ZDkwTThpWkNHVHBwY1lZNDVpRkNwZitCOHF5cjVMZW1QTCsz?=
 =?utf-8?B?SEloenYxR1RJYnFOYllvZVc3RWxQU29wK2pBWHFBamVUaDA1RWE1YTVWQ1Zk?=
 =?utf-8?B?dHZDZStOSzlvWldVazZxV0dRd3VoRkRGZE41RVJaYzdMY3BvTitLaEJoQ3FG?=
 =?utf-8?B?bnYwc2dybW54N2s5M0hwKzZKNnE2WDRaUjhsV2FLTTVHU3kzRzVIVlBxWnZx?=
 =?utf-8?B?R1JBVk9sazFJK0dwdnZBdjVsUTVIS3dqZGNPT0o0dDE2ci90bU1FWjJ6L1pj?=
 =?utf-8?B?aldqSmh6aHNqajNobnVNSjZNTkVZWVVDZXdNamozT2tlbU9qN3prVVBSS3lV?=
 =?utf-8?B?TGFEQjhEWERnTkxic3kwb01iTU5EZjZkNXhJR0RwblJ3NGM1eGZmZVdwZy9G?=
 =?utf-8?B?RXdXcHZIcCt0YUMxU204QUJpZm9Wd3VoSm9mSzBGemtuRlZleXJxVi95UFo4?=
 =?utf-8?B?QWZPQlpqdnJiSGN4ek1aWkFsT0ZRUkhIMG1mY21WeHYvQXk4dWhIUkhSZVlH?=
 =?utf-8?B?Z25HSkpYRjFNVXVQaC83ZVh3N05WNHRidFFMcFNDMjhjS2RxRCtCdVN6NXJJ?=
 =?utf-8?B?THVHU2RPdXh6N2lMaENhQjFoWFRDVzRaV3JhNzJvZHEzUDUzMHgraWFydUow?=
 =?utf-8?B?V3ZHUUJBdWdLUlFoUVF3NDZzaGVwT0gydXlJVUxyTnNIK0F2WW13NEdOZWNk?=
 =?utf-8?B?SGV4V2d6R283bEVCL1o4U25weWVxTHJiNzVXcGtNdzJUcFAvaGRjd1A5dExS?=
 =?utf-8?B?ckRTVmh4c3hqejdrV3JsVWFkcmVQTWY3UFJ2bVBPT25jU0ViVWF3ZmZIVkNS?=
 =?utf-8?B?UnhZdGc1dUszaEt3STgrY2w2ZG1yaEhWOXhlaHM5dzJRb0l1RlRhbThWVDM1?=
 =?utf-8?B?dW9mVUpuTGhTeWxQVEo3Z0JKSlR3SXdQZm5UN2M4QnBxbk51aDJpSENTdFc1?=
 =?utf-8?B?VE1rM2NOU0J2S0RNUDFCREZVK3Y4QlhMcVJETzBTcDBTM0RzMVlXRUFmY05s?=
 =?utf-8?B?MktBTU54UzlEcnNjWWJieWNTUmJ4N0E1bHc2ZmM5TE1CTWoyaTlRSkdFRmtn?=
 =?utf-8?B?SDRNOEtKOGk5ZEs4d3RVa21wTVk0U2k1L0E0ZlJUNERoUTRMdFc4R2dCVmRL?=
 =?utf-8?B?Ty9MMzcvVDlpc2pMTk5uNUNZaHRJc0dpaHIwYytEaE5ycWJhVVpyOVlCUWtJ?=
 =?utf-8?B?b2pObGhBMW04Z2dNR2VJRlg0WmhuaGpiRUJNaDZWbkZDaTRPc2g2dkw3OEJz?=
 =?utf-8?B?Y2JQblhmUThXaEtsNTVIR3I2T1A1MlRHWHl5Rk9TU1MrN1pNd24wZk9iZTdk?=
 =?utf-8?B?eUUzKzRCU0ZyMng4U01KNXowLzRZeTFIZE5LUWtseUx4eEkvL2Z3RWFSUGhi?=
 =?utf-8?B?ODMxU1o2Y0d5UktJQW9zbm1ZZWNUUmxydWtxaGpIRXZGVGVtN0taLzZac2pU?=
 =?utf-8?B?b3ZYTE14Y2xYNSs1Vm5IWFdLY2l2eTIxRDRpV1dYZGc1SlI4TVZ4QXNIZDZD?=
 =?utf-8?Q?GGoQWSBCyrcWvmhc=3D?=
X-Exchange-RoutingPolicyChecked: y+G4YmVDRColePVMBupjfMsks2J2Gwq4HnWKWC0QE1Nq+WoEOl7xLy5zXnpfCOTZcqKJ4QvnxbRMlxREP1DTpq/QxQxhREzVbzVHc0uNj3Yq73Qc6Qd+oD+G58rTAKPR4DFiO7F4Vc9D9dtZ+6jNhVkk42fLwblSMHilsOUK50CeeFNEQd/pLEiSSuRBeDuygb8+SGLvOtZeqbFIVfD75xmp37Qw9dntPwnq/Va4m1lx19ewzx1rxdBz/cKSD89Sbl1N55gHztJRB/pfo96E2x+CmGMSGivBp00TNurNCyrBeJ8eP3ikH/HYVmfSWm/aJR8dtAG6n5d373kb8mry6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab3f422-2331-4f8c-5843-08df442dabe4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 22:05:06.0116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4zmkZ1gqsRSliYSkIZV7YKG7yWcr2VcQtkwl2Dw74b/YgZTFwaRssaJ6fdNSa3RznIzcCxv3T/Rtr0BzoXYneTEv553JFr5qkHFXWS+UUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8537
X-OriginatorOrg: intel.com



On 11/13/2026 11:33 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] drm/xe: call to undefined xe_tile_wopcm_size() breaks
>    compilation
> - [High] drm/xe: deleting xe_wopcm.h and xe_wopcm_size() breaks
>    xe_ggtt.c build
> - [Medium] drm/xe: u32 underflow in uc_program_wopcm() locks invalid
>    WOPCM regs
> --
>
> commit 9298b958426645b9eb36c22dda929d9b3a5d552b
> Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> drm/xe/wopcm: Simplify GuC WOPCM programming
>
> This commit simplifies GuC WOPCM register programming by returning early
> when WOPCM registers are already locked, dropping layout validation checks,
> and moving the remaining WOPCM setup into xe_uc.c while removing the
> separate xe_wopcm files.
>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index c4fb34e64cd6d..e7e818897bf50 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -47,15 +47,16 @@
>>   #include "xe_sleep.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_pf_migration.h"
>> +#include "xe_tile.h"
>>   #include "xe_uc.h"
>>   #include "xe_uc_fw.h"
>>   #include "xe_wa.h"
>> -#include "xe_wopcm.h"
>>   
>>   static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>>   			    struct xe_bo *bo)
>>   {
>> -	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
>> +	struct xe_device *xe = tile_to_xe(tile);
>>   	u32 addr;
>>   
>>   	/*
>> @@ -64,10 +65,12 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>>   	 * might be different for each tile. So, just always ask for the address
>>   	 * on the target GuC.
>>   	 */
>> -	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
>> +	addr = __xe_bo_ggtt_addr(bo, tile->id);
>> +
>> +	if (!IS_SRIOV_VF(xe))
>> +		xe_assert(xe, addr >= xe_tile_wopcm_size(tile));
> [Severity: High]
> Does calling xe_tile_wopcm_size() here and in uc_program_wopcm() break the
> build?  xe_tile_wopcm_size() is neither declared in xe_tile.h nor defined
> anywhere in the tree.

This is defined in patch 1 on the series. Not sure why the second patch 
has been reviewed without considering the first one.

>
> [ ... ]
>
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index b32ba504041c5..501961c2cc8f9 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -52,6 +55,126 @@ int xe_uc_init_noalloc(struct xe_uc *uc)
> [ ... ]
>
>> +static int uc_program_wopcm(struct xe_uc *uc)
>> +{
>> +	struct xe_gt *gt = uc_to_gt(uc);
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	u32 huc_fw_size = xe_uc_fw_get_upload_size(&gt->uc.huc.fw);
>> +	u32 wopcm_size = xe_tile_wopcm_size(tile);
>> +	u32 guc_wopcm_base;
>> +	u32 guc_wopcm_size;
>> +	bool locked;
> [ ... ]
>
>> +	/*
>> +	 * On legacy HW (pre-PVC) where the driver is responsible for
>> +	 * programming the WOPCM registers, the WOPCM is divided into three
>> +	 * regions, in order from bottom to top:
>> +	 * 1 - The HuC region, which contains the HuC firmware + a 16KB reserved
>> +	 *     section.
>> +	 * 2 - The GuC region, which contains the GuC firmware + a reserved
>> +	 *     section for GuC's usage.
>> +	 * 3 - A reserved region for HW contexts, which is 36KB in size.
>> +	 *
>> +	 * To keep the math simple, we remove the HW context region from the
>> +	 * WOPCM size, calculate the size of region 1 and then leave the
>> +	 * remaining area for region 2. The official binaries are guaranteed to
>> +	 * fit in the WOPCM, so the math below can only go wrong if a user is
>> +	 * manipulating the blobs. In such a scenario, we'll catch the error at
>> +	 * FW load time, so no need to double verify it here.
>> +	 */
>> +	wopcm_size -= (SZ_32K + SZ_4K);
>> +
>> +	guc_wopcm_base = huc_fw_size + SZ_16K;
>> +	guc_wopcm_base = ALIGN(guc_wopcm_base, 1UL << GUC_WOPCM_OFFSET_SHIFT);
>> +
>> +	guc_wopcm_size = wopcm_size - guc_wopcm_base; /* already 4KB aligned */
>> +
>> +	return __wopcm_init_regs(gt, guc_wopcm_base, guc_wopcm_size);
>> +}
> [Severity: Medium]
> Can wopcm_size and guc_wopcm_size underflow here and lock bogus values into
> the write-once WOPCM registers before firmware load?
>
> The firmware header parser in parse_css_header() and parse_cpd_header() only
> verifies that the buffer is large enough for the headers, uCode, and RSA
> data, without checking ucode_size against WOPCM size, and xe_uc_init() calls
> uc_program_wopcm() before any firmware upload happens.  On pre-PVC hardware,
> if an overridden HuC blob causes guc_wopcm_base >= wopcm_size (or if
> wopcm_size is smaller than 36KB), the u32 subtractions underflow or yield 0.
> Because the low 12 bits remain clear, __wopcm_init_regs() passes its mask
> assertions and locks the corrupted values into GUC_WOPCM_SIZE and
> DMA_GUC_WOPCM_OFFSET, which then cannot be cleared by a GT reset.

This can only happen on non-POR HW and only if the user is manipulating 
the binaries, so not a real issue. There is already a comment mentioning 
this is acceptable.

Daniele

>
> [ ... ]
>
>> diff --git a/drivers/gpu/drm/xe/xe_wopcm.h b/drivers/gpu/drm/xe/xe_wopcm.h
>> deleted file mode 100644
>> index 0197a282460be..0000000000000
>> --- a/drivers/gpu/drm/xe/xe_wopcm.h
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -/* SPDX-License-Identifier: MIT */
>> -/*
>> - * Copyright © 2022 Intel Corporation
>> - */
>> -
>> -#ifndef _XE_WOPCM_H_
>> -#define _XE_WOPCM_H_
>> -
>> -#include "xe_wopcm_types.h"
>> -
>> -struct xe_device;
>> -
>> -int xe_wopcm_init(struct xe_wopcm *wopcm);
>> -u32 xe_wopcm_size(struct xe_device *xe);
>> -
>> -#endif
> [Severity: High]
> Does deleting xe_wopcm.h and xe_wopcm_size() break compiling xe_ggtt.c?
> drivers/gpu/drm/xe/xe_ggtt.c still includes xe_wopcm.h and calls
> xe_wopcm_size() in xe_ggtt_init_early() and xe_ggtt_shift_nodes().
>

