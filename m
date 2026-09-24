Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58F939A067
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259982; cv=fail; b=Dhnoigb2uy3w/tx8XeoLH0N7+7KA3j8NfOcmhOIE+GFbwYl/+ELnMehxtPUxC6KWeitHtOhm0MKJN/N73JZYIPNmOwxJmGaCQGoBwORK7F4G714iY00sseuJz5Mde8nNXk1Q0WUATRd7bHkrClG7clLTacsOX0TIFpwZzlt7bsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259982; c=relaxed/simple;
	bh=wJ2SVf1upl/bvdBCrXT9aJ73r7h45KC3gaWfSjUp5vc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JLNF7DgbMknSIS00cTyW4FwPiv0JKUMv3KyayiNwpp/yvbooJkC46u5iXQpEhpgYKjyZR7OsMSU9XMA78+j00fM6q1raE6vhyNWR9W6q4jzUy2bRVfrZOG1ClsGxQETzyvjP4xj5G+URxBR+4XL376IlL89H26o1evgwu2SuRCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVLjjhpw; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVLjjhpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790259979; x=1821795979;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wJ2SVf1upl/bvdBCrXT9aJ73r7h45KC3gaWfSjUp5vc=;
  b=XVLjjhpwMmz2Fy4NlsPtr7OVbwQOXkraWF2is+ghjXAx+DaQPH1JxMfz
   HdWUBlg+WHmHaeEIC0FxMpAkO5z1fb61wP1FWiYLvcOfeVnqJIxiBObEK
   oQW6dogas0seZnqoy8wJK4+hLBW3krIZCeR+ZTG7cDLuVSE1BlugfKwDQ
   3YXegz67pPOZ5CH1hXAuOjDMVDKrVDfv8t+0Ay447kjAObjw9eoOd7UIh
   kwZWQUBV661CPhst4RiNifOw3k5wA2BmUWw5dAuUeGisWKeLqYuITLSHo
   jb7anAx+0aS3ft04qyWF6lgYFl4LDtBqn3RxbXSWq3fG/eFCMMuIVe5Yl
   w==;
X-CSE-ConnectionGUID: 2hVjgWSrRXiCBxlgm/5EFw==
X-CSE-MsgGUID: XRb3BO9ZQPascTH2AcxG8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89989334"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="89989334"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 07:26:17 -0700
X-CSE-ConnectionGUID: 0fpDUKU2RBixPmo/aOFf5g==
X-CSE-MsgGUID: q532xN2kSpSmHvW+dPzexA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="277798994"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 07:26:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 07:26:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 07:26:15 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 07:26:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpJzD1+VmhJeXcfHSQdwOVW4e48m0IQ6RZBJQDfXwBfoT5783e8gI9uLbZnn7b61H72w9QeMGBQCWBre1FBRYXS4llLrgsh+GLNVGLRrrYV863oNeDwEzgQ+v+qCr44pStAfSUx91hCtJYlB4LNd/RedqhrZhPXLqybkdTAzp9UIIiBLsvap0N8T2AwkqUU0qawja/NTrAPtIC7Iva1gJt6/Ac6jEEynOKz6v/UbRRM86lxrKxiZctXEmxZIV2WNFlgB873jMZf2DfwT3aTV9xbYQhiCVmCL2nHB0KRp4Yznd/HNrqIe3uE/Ndkly05Msx1nQWCQdgJo2jzxQK6wNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFSTs/mICINFNdmhYfNl+ML5kjNsLuSUJlzT+9FKLrU=;
 b=ar5rw0TWODpqSAsvoJfoNSroZ1bN6mP9JxcHUOoTGwCEQ3ZfW+00Np+KofrHepvEq8wMB0ngEzMey3F4gw7NPWk3YaKq43cUX9jSS6Hk3Rzt9KxU18enA5MJdGep9TbYHdSAH9hIE3ctnATSNpf3UJKxT5limAmCQjpvrr2okZdKAM5MeYr8kTTGUpbmEIQ427mZU6rX+AwCrhrUPv4Akn4gBsAZWT0QfiNBAcp+itpUUbPcG47rrAiXwez6pawutgejUvN1dUpcPpd97GY6iFCtSsV5hJevll/xuTgkEoczsuj2AJxA++YCFTPMfaHifjq3Ilm8ehcgjyd63XTMLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by LV2PR11MB573934.namprd11.prod.outlook.com (2603:10b6:408:412::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:26:11 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:26:11 +0000
Message-ID: <e17cf560-9107-49f2-9d3d-2fee9db7edb2@intel.com>
Date: Thu, 24 Sep 2026 19:56:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260924111156.2628915-1-karthik.poosa@intel.com>
 <20260924111156.2628915-2-karthik.poosa@intel.com>
 <20260924112332.E27421F000FF@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260924112332.E27421F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0293.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|LV2PR11MB573934:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c1a87a-b359-4246-847e-08df1a47c815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 9kz7BknJltezKkbkDci6ts8TMrS8m96M5m7nH5jdsZsftwrQcR06T6Ts0R1cUBA5YgIRsFrNEV/Mtlc8rzzpDZcMXCAo/vFSRHGGojhD94qVjqcULRnrnTPAtOQNJzATlVdfBcZF7MML6IQAFajSBukLzdDBO6XXUOCVchXuV5/PzZIEwRqkXA+swmy+eaWsymA3RvNA2DPJFc0/DJT18IQCNHH67CALDQ6gaRtrH7rrtxU/5ZNPOI4dRymjG64x3an2nre79XTaRpqTNcBEGSF21zsG52xuGnbarjKDVHk+MxdmOCUwjMtCQvyBqOssSY16xCybDbgJbRPULwSwN0AGz++/csLB+8hV3n2mnnHthip/j78aJoOa8kUWkZOCgUD74nftnT2X2MdpvcObTUG+79c+JMQAFux2hZhBxVAFfxxYh2NLo3P5WbUwQ0nrEzcLW8a3VPdLyKDuw68lgZUgOEDvE3VKs8qt+fANRnbv+niZ6QqgdT3xiBCBGEQTx0jmjHBCTPcsXydj6Zw+ERAXfUkUOpnVDbKHbbT9asem0RGX3lKkZfbdS1HXDhmud+It8jz8ZlpDwpHepVOOJ9I52PsKJ3zlDlvznc8QEBTIGNw3fIEQsqWJziJWqan08LVI1fHKbgvJp++D2at9+BZs+wTi9cihFT2n65krc98=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3RjUWpWb1BCYU1JOVZOdzBuVGptRGFLKzFPL1JneCtWWTVkRWc5T1kxaGI3?=
 =?utf-8?B?SkplV05ITDd5ZUt6UUxrUGVPOWxaZ2NtNHFtK3Y2TXZUYUtjQW9VaW1mZDIy?=
 =?utf-8?B?WVlsTlkvWVpOcGpiYjZML0todUYwc0ljODJXek4wS3lncUppb1NJVURxYmU5?=
 =?utf-8?B?SzUvZ0g0V1hpa1RnZXhOdGh2emRwNmhrQVNVYi83SkxQMWI3T255Y0I2ZVFC?=
 =?utf-8?B?alFUc05wQ1VTdjRQMHo2RG1ONHU2T2tpMlArdURNbzNTTGNsaGxJbGNtZ1JF?=
 =?utf-8?B?Mmw3RjMvc2dFUGtCc0dWMlliZWMwVHFRNFVsVXRGWGJkMkI3cGMrVHMwV3Iy?=
 =?utf-8?B?cm5pY01nNHhMdlROWDNGdGVhcytZc3RpOUd3T1ZSMnZDYlk1Uy8zYVVHeU5Q?=
 =?utf-8?B?ZW52VUl5SDZXc00veENnQzVZbVBSODlvNnJYcXB1RDN5WHloMGh4UkhRb3hM?=
 =?utf-8?B?OE0yQXFhTVBBSE5VMDlEY2ZhWkdsU1dSa3dIa3BJbk1HcTJQY3kwUVl5V2th?=
 =?utf-8?B?MDUxL3YvWlRMMVBDeFY0ejF1cnhCbWxNNnd6QTlrbU5DcVZVeVFSZzZBTkVJ?=
 =?utf-8?B?cGN3ais1YktSREp3MVdIcU9IZXpZR1JNeWxkdWtHREVIK2M5U3pZanllQlFr?=
 =?utf-8?B?eUZsQ1dUL2kxVk5mMDVKeUs2SmRJZS9SeVJkeW1DOXNRS3cvM2FIdWdoTENk?=
 =?utf-8?B?aW9NNk5wVkNISnhBWmRGa0cyalNhVjNyd1lNZmFEakNUeUhnc2gwa1BtS1pL?=
 =?utf-8?B?dTVsbVpFNHBGTWh4NGJ3elhUK2w5dVEzWkthWGFoQTV3T0xxOFZySWJrbVdB?=
 =?utf-8?B?ZkxYaUwrNnJpVUh6R0pCNHJvYk1veTR0Q0lveGpGY3J4OW5hNUlBaUMwRlAx?=
 =?utf-8?B?OHZSbVlXMGJlV3pOV0xmTy9XMW1SNVFva0VyMVZ1aWxpbFhWKzVieHNwY2lh?=
 =?utf-8?B?OTNEY3NTbXNHZUhMeXZpT1pEWXdKT2JmaG5tV0R4a2MzcmxheHdiNTh0VHdi?=
 =?utf-8?B?MkhiTDFPdjM3SXlwRWZqSGQyUVNlTTNYcGlwOHp0NnBKTXF4S0hIRmt6QlBq?=
 =?utf-8?B?dVl0bVdnVXFQR1BIYWhrYlRXdkdFVVJEVlFWMWRvWnlBbVplcGpYVC9XeG5R?=
 =?utf-8?B?S1E4NGRlSmgyNnN3TGdrbks4Y0R2L2R6VFFDVFlsRU5XSmtLZ3hBTWxHdVNS?=
 =?utf-8?B?UnhxVVBtT3B2UnVLOXB4Z0ZTcjh3ZG9KbkxnVzlvS2ZHR2VTQlVhYUQ0TkIx?=
 =?utf-8?B?c1UzUmpyMnNwQzVlK0pCYkl1ampaUW1jWm5GY0t4VlZrL1o3TDlNOTR3ZHk5?=
 =?utf-8?B?ZEpYTHpZelltSXcxK1RGMXhqUGRHMjJGbExMQWxyL0tKVGIwWnE0NC8zSE9N?=
 =?utf-8?B?akY3K0hQeFBuakJGSUkwN1NWRDNLVnZnd1hHU1hIajR3TkdjbjlveXh0OWVP?=
 =?utf-8?B?Q1BVSGluRUs0NGVBeDV1ZEM1STRIN2I1Z1JENXF0UTlybmtFWk1wVW1qRTBq?=
 =?utf-8?B?ZUltdXRRL2k4UjI2NngzaGdNQ2JiRlhKYVgyRWJRa2J2RldKYi8rcUxjeEtK?=
 =?utf-8?B?K0tTVGZSajNGSVBodzhnWk53UWU2a0JuVytzZGZVcWMzYk9QWVlOaXJzQkNv?=
 =?utf-8?B?VlBhSHE5TGlMQTQ1REcxeXlQZlFlWGtUREZmb0tROHc5YmYvVllmWXF4SWxn?=
 =?utf-8?B?V3lVV1JOZDFsMXFlb0ZGRFdPcVNzd0h1Z2F6ZTZSSzVmdE9aOVkwK2NOUkU3?=
 =?utf-8?B?WDRWZnZsZHhiUEU4QmF4Rk9TVGd4NklLNTd3WmQzWC96MmFUSnBMazFtZXBu?=
 =?utf-8?B?VzYzeEd5S01SYXpTbllSRGhhSFdiZ2djTDBwT1NXZ3Fwb2pwaGtlTGFFMnVQ?=
 =?utf-8?B?UUtnN09Kc2k3M09YVlhlWGllcGMyS1ExbWYwNjNjbHRZWGVPTU80TDd1MFJJ?=
 =?utf-8?B?ZEFHQ0hxellwK2hwa2tqQWlnUUhxdm1UVmlZZUpiOTh5NHZPc1FZM2U3K0hU?=
 =?utf-8?B?SjJWQjJBWlVkL25ZUHRMMVBUQmg4VGIxTmJ4NlBrTFBhaFJhYy9QWW9uYTFm?=
 =?utf-8?B?VWJRWE9sK2dMV3VuSFQ4Z3JYWnZvN2VrNzVhZ0tiSzlQL2pVVGhQVWxCbWk1?=
 =?utf-8?B?S0VWYWNyQlZOc0l5ZzZEY1BVWWQ3OUtPWkVlQmdza2paQTJ4RmsyU3ZPSUMv?=
 =?utf-8?B?TENjVkMyKzRCR0VOd3lTVUtkcHJrWnYxWmcvNkt4TmZoOHU1WFdzangzZWJP?=
 =?utf-8?B?QjF4dmtobXhHU1UxS05vMFdZVDNsNzg1T0VZYWcxbGJ5WjhqV1BQclVVY2pX?=
 =?utf-8?B?cGwxeE1kNzU1aHA1WW5hQWRKMVNwMTdjVzZEK3QyMlR2TnlRcDM3QT09?=
X-Exchange-RoutingPolicyChecked: OllScExqTCG4mVXQMOHT56Hjo6gv9M2D3WlpDo2uMyQ9hoUt9PJ5x19x1K57mHL4+Mn3KzoFy92U9nhIKL4NegGtvl1yr50xAc6kyH73Q+aepwlEfgf62WPUb33yUikTjQJdQJ4u51+KJ5ZvD6zi3Zp2w8VB87uWmOglvgrfAHNUj39pj35ZJXyoK+DZksLcGOLdEuLlSbMQyXvZcl8AJz5Df5hkEXJVskb2t0BJMLNcDKT+dS2f/LvpTcmtDISzvIXCirg3HpffXaGpvBV/tn4nM0IhDHAT4wi2ZlUMCfa9pWocoYU/ADSz+MZZpkzocaoVjLJSBGE+JNojbE0kAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c1a87a-b359-4246-847e-08df1a47c815
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:26:11.5455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4h3I/BbGsDBLEz14ahS43Vx7unqvZk3yCJ2TyZLo+tjnh5xO4r2PpmoTH8rlAjK8lsri9LCwVaWm9OGLkYUHsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB573934
X-OriginatorOrg: intel.com


On 24-09-2026 16:53, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] sysfs: returning 0 on error in store callback causes userspace infinite loop
> --
>
> commit fdbe8069cbe324980fc35768d7993da6a046117b
> Author: Karthik Poosa <karthik.poosa@intel.com>
> drm/xe/hwmon: Handle pcode read failures of xe_hwmon_pcode_rmw_power_limit
>
> This commit adds error handling for pcode read failures in
> xe_hwmon_pcode_rmw_power_limit() and checks the returned error in callers
> to prevent updating power limit settings with invalid data.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> @@ -679,11 +683,13 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>>   
>>   	mutex_lock(&hwmon->hwmon_lock);
>>   
>> -	if (hwmon->xe->info.has_mbx_power_limits)
>> -		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
>> -	else
>> +	if (hwmon->xe->info.has_mbx_power_limits) {
>> +		if (xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy))
>> +			count = 0;
> [Severity: Medium]
> In xe_hwmon_power_max_interval_store() within drivers/gpu/drm/xe/xe_hwmon.c,
> will setting count to 0 here cause userspace tools to enter an infinite loop?
>
> When a sysfs store callback returns 0 instead of a negative error code, it
> indicates to the virtual file system that 0 bytes were written and swallows
> the error. Standard userspace utilities (like echo or dd) often treat a
> 0-byte write as a short write and retry infinitely.
>
> If an administrative user or script writes to the sysfs attribute and the
> underlying pcode mailbox operation fails, could this cause an infinite loop
> that consumes maximum processor time while simultaneously flooding the kernel
> log with error messages?
>
> Should this return the negative error code from
> xe_hwmon_pcode_rmw_power_limit() instead of setting count to 0?
I shall return -EIO instead of 0 here in next revision.
>
>> +	} else {
>>   		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
>>   				  PWR_LIM_TIME, rxy);
>> +	}
>>   
>>   	mutex_unlock(&hwmon->hwmon_lock);
