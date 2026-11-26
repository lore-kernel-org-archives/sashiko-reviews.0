Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700179;
	b=2GIRzWU+Ix/hYP1ZRIl3Un5VrxwfVPfs8C+FcF6PdOOL50zFMUyF69p5Mm9V6xdUUL2Y
	 tkdM27zhD3lXlbPNIBbxuEZcWjit7kqays4sUzFs4s6GW0s7/1+Q4VvBDe9zNmnFpG7uC
	 fpqGN3vcOYtj0Yydu+ubGTFftql3zolK0WSmfAfZKR3pYVjAuiyPbG5sLLwPRpj9V2Xhx
	 IodCT0SVAoY35Yd5UcgvVRtLLrVGor9YmmNDUuTJXGANwwwH+JWm0yNufuK3288BVSgpP
	 Rss7W9E/istSpDv7hLFlpedYzoprbHyF+Pwyl8m/mEoLI/EztUYaVmHKguJ0eYRFGMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700179;
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
	bh=nEYHyxWhk7pQsI44AZiL6+/XUokCS2GGbxk9cqdbHiQ=;
	b=Bbrll0VY+BSmEed6tOKnRsKGWU/u0JNzdEQPnlfBV3g+Vh67GvyL84hCFGD09TZkWTlW
	 9iFXSmzXrk3UgsNVSFOP9fracUKPIElsoQYFwlCzGU7MIBSPytqDQiycsyzKK6ABmTON6
	 6SjjhF+DPDyeVl//KpAExLEdYGA0eiYBDgbWbIzEc4mSRx5h7yyhlBpkFgSomDP37lEU7
	 lk6oxLoBqZIZKUAOb2wrH+nqsAsmmDX/E37J7icVcfGb1E0akvSmPBs3/Zfo23xz6WdIq
	 owcOlbyo7zBjUw0lq6+x2iExVaNAkezTHKUJrvPj45SVckOhn8FR1k7m+9V+1T25iUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z4OsS+8D;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Wz781GXj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600A606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 13:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3600A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z4OsS+8D;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Wz781GXj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795700178; x=1827236178;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=oRrNxvB8lsOrey9j0Iy7Ii5jnCP3o9J3U+uX5fkL59U=;
  b=Z4OsS+8D3oJVrIaT/3QmSMbKFdz5JP1IP37xnFlMmx63REIE00zCCmCf
   zm6ZXx3sk8qBMXa5W1sRNwKra4IAepPkZR0ls3D+FEEXHS7dPsFN4v7cT
   qd4o3woRpofJe7FtZyTJ4yLWSY8bbGBo1aOEALjrfpOwMu/yWlBpKCEiA
   Dc+zKplWZmQE4S6GAvcZ3lhbDIziYK2uqFDleulrNJjjeJlFArAvcey/O
   rK6LEMASQ2MkUyYiV+jZ4xJSRjThl5uSprrm7ImD7LqLTzK66i1MQzJJ1
   Dwq+YqUYz5CJgiATY9b2vrrEH3E4Kzj+fsh8FvYLEQ1/oJjBJHJaDdutN
   Q==;
X-CSE-ConnectionGUID: fTMN7mkcRISP2PCX34XB+Q==
X-CSE-MsgGUID: i5IsthmeQd+/0rhLmcivJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4517683"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4517683"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 05:36:17 -0800
X-CSE-ConnectionGUID: exHkYW3dRDS+5pICLvAD0A==
X-CSE-MsgGUID: Ax/kGgHlQtaI2L0+fFVl8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="14215354"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 05:36:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:36:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 05:36:16 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:36:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uj5mNp5trOlYskucEkYHC4++AoNYrShBwUx3KKXJzKrqqhG25L0R4MhmtSLYJRm0eetamxyHWPyc7BfulTQjtE7aT8ciakUxA0UgnaPBylZj1qo5y04MjjqrbWPrnfcH87EOR04jqR/OG4ZBL9pVBRUBZb8rC/w/n+TEk5YqzetWjkvnCHE9OMHSlZPlC5xWwPVCAHF8bUQnRPeZE6DdZRxsLtTjLKM2iSPv9XVvSuUNL60arQ18sUdszKwfjmH72cdl1xx5ta3EzAEZxrpSoede68DeYtRdkGYlW9FVssDjxJuQLvQnzTje1X7jRTbtQIYwbuzb+YeaY5DfGEkXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEYHyxWhk7pQsI44AZiL6+/XUokCS2GGbxk9cqdbHiQ=;
 b=XSQjnNufUDkr1ieLdpVX3fUsM4g+Hm+jAUWjTq9rK3GX7kXJocsI4Kwaj7tMwngss2S6VbMyt2XQzzwhuyaFRJ5mwWtCr0u54aI0bjTZClrD3XVvi16U1vvrRKXulVds6WQ/EHSZVp2ubKHdaJRCdgjWSowzCBFlwGoxb15Lv9qSUfQbczoF+PxR1R6OtCWZdW/lJBm4RMgVq8WWiy/IJWlJS49LxWAh/sv8N4E8QggZ55FXfBIPRdgsRFCH0qMUaJhkg2m5Z/k4cjwtZGJutNkgJ9Ov3rUlhtg7XfikVP0K36Zd9/2biOBt0aqJT7Oi8nAcD3UXN0IVbFjI9hiEPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEYHyxWhk7pQsI44AZiL6+/XUokCS2GGbxk9cqdbHiQ=;
 b=Wz781GXjh26T3ybhQP4fp4xeV1DWT1wkOeuN54CnpLouq9jgP+DRYeHxnV2MeMujIS2gJwd9SKmx5RTfmA1H4Kh5922DVhRsl7h6pMwzzgIq33N5fEPLdYUtgVmFWIGTc7TuzUi2ZBK39My8DPbR1ZINb+sE73JZxWSxAF/HJk8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by MW4PR11MB6912.namprd11.prod.outlook.com
 (2603:10b6:303:22a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:35:48 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:35:48 +0000
Message-ID: <038f9148-00dc-4ebd-a59c-6d149e5cb1d5@intel.com>
Date: Thu, 26 Nov 2026 19:05:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] drm/xe/hwmon: Preserve fan user table across
 suspend resume
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-9-karthik.poosa@intel.com>
 <sashiko-outbox-230575@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-230575@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::12) To FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23)
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
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|MW4PR11MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a34aef7-2372-4253-4cbb-08df4bc22e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|10067099003|11063799006|4143699003|56012099006|261021121427099003|261022075727099003|261021123027099003|261022113327099003|261026121527099003|261021135927099003|261021130227099003|261021133027099003|261022105027099003|261022115727099003|261102123227099003|261026135527099003|261026140227099003|261026130827099003|261028144727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: qUVRIL4edYveVjnljgyg6MeteVR9BgYdx1BvmWNaFZwqJxC1yKoNVtwisqHQsVYWJw6rE3QLfedhAYsxFRaYDxRUtTN9k6uvzvmkg86qOzr3cXagzXsoOtzD/j1iYFqCwCHv/HCfkRXSlEgemNUV9uSxtcQp0GJ6GGLVRDYGKrrN1+8Gi8tc4fuEo0vUfwCmvKymp/vZ7XNywnj52TPL98h/7Gx9iCP60TdDnIEWVHWFBNkm/96/7c9CR8mB+VkyWrjECSyeeB821Km6ENi6sp4uSnsNuNpOamhlKFuxUWTrgJf4RGLgFa4do1sM8l5qNrvPUzlIzy4anRLUQ3oaTwi6hhy3++K9NGBhCJrKR7X6YC3m5mX6r3T+lWkiXQHTSATURMHi5+lp9ac12akGXmqCr/4Ad8vfGvjH/TJZeg1zQOppfjJYjPyBgiOQpgTfHX/1Y7NNkn1ex3uzMObsTaiTB4X4Wq0LCPhydx0lH48EZkKH+tovyh0JdMNXeJUQAKTx4MyRRb1emMXMnY0lmeAiqg8PpfS5Ibx/9AddqQvp9EwYGXBygm89U6s8JYmMETpzZ8hVD5MMQCf3x8qRkXMI0+k+eBNmhizbX30SpbRJca+cQwxkSPJS/wS5NK47yIllIZS91R01NPVdCUIZcFgR5ygZA48KW+pLzfmLrew=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FT1PR11MB960200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022075727099003)(261021123027099003)(261022113327099003)(261026121527099003)(261021135927099003)(261021130227099003)(261021133027099003)(261022105027099003)(261022115727099003)(261102123227099003)(261026135527099003)(261026140227099003)(261026130827099003)(261028144727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGl5UkpJTEFWZitlUEZDL1N5M2JtQ0pZUTkzU28zWi8xdkJyNDUvSVdBbjNY?=
 =?utf-8?B?ZW0yRW5oRkUvUUd3dUtsQlI1MmJPVmY2V3JTR0IzQzNncXRzRVhOd0JRcjc3?=
 =?utf-8?B?RTZSWmZjMzI2dnRxMDVWekZDcFVnVDJRU2N4NU4vUDFud1Mwc0w1ZVBrcjdC?=
 =?utf-8?B?ZllNbGIrSlRaeXJpNnkzTzNYdi9mSnJkS1BzQUpmNnpjdEN3VW1vT01ycGQ4?=
 =?utf-8?B?ZUJrVnRmKzRnYXJPV0hEK25uN09yRFdOaEF5K0FIOVZuYi9Ja3RvN0JUTTRQ?=
 =?utf-8?B?emt4bmVpRGdwb3dPNjFKTWIvcjJ4RXI0TFJOY0dmOGdFQnhqa1piVWZrU2VH?=
 =?utf-8?B?RVpKZGVrWk1YMlNXYzQ5MSt4SDM2cnc2SGJsU2FyUHozSjlMNDZGMENHU2dt?=
 =?utf-8?B?NXg4dks5VnJrVzNzL3BGRUtiSUZkMU5hWTkyTlg0dVlqcG0yTzB2NHVwUEpX?=
 =?utf-8?B?R2dwZDlSUXg0WkF4UFBRUUk1UURzT29jMFZTUVU3MXZ0aWxrT1FGaUM4NE9I?=
 =?utf-8?B?a1drcUxIb05CYnF3Nk5pd3R4bTNOclJDOXVwL2s3MTQ4VDR2d2srYUFxVVpt?=
 =?utf-8?B?aGcvQVE0OWxyV284R0s4T3dzcmRSdmdUQWM5TlZqbm5oeHVKVjg2ZG5aOHk1?=
 =?utf-8?B?cHYyZ2U4N1N0ZENGYVkvS1ZTY2tkYnlqbmR5VE0ySU1Qa3NrRWltd3JkWGNM?=
 =?utf-8?B?aEpwRDlPYmorR0xTM3hhQm0zSUYvQ0ZweU51RWNoaWxueWkxbldITDljUWh4?=
 =?utf-8?B?Y1QvWGFOaUpOdWd4ZldYM3pGc0lwV2NSZnRqZmVHWnlzVWxzREV5amhJbmlY?=
 =?utf-8?B?akU2NFdhL1FldjltQWFsNHdNQU9HbndVY3ZRY1Q3czFUbnJPMGtRVXdGZHpK?=
 =?utf-8?B?aW9zeVdLaDNSWEY0SDZuQXdPYllpcHZQTVFZTDZTUXNNSHYvZm9qM3AvUk9M?=
 =?utf-8?B?Vm5uV2VzdmFsVlQ5c2ZUdmIwVlhwektBV0QwN1pHeG1Wd25sOFVCUUpIMzhD?=
 =?utf-8?B?a0ZWZTBFNldxbGRWM0dBK3RUMFBwQ0lYb1hQWnFhTFltMi91a3dOWFJIcmM4?=
 =?utf-8?B?aCtiN3dYWnhOQ3NUTDBoZ0dMZlVMVzIzeHg1VmZiM2NyYjBvSE0zWEd2bEVF?=
 =?utf-8?B?Q28ycU04RFAyUWRDbVFUTXVCcVRaK0poNi8rcWdkaHRLTEpJZENIc3lDQ3R0?=
 =?utf-8?B?Y3RsMG9tVnhyb0Q5cHMxbndMQnNBOTFTd2s0YXdpQmd2M3JxWTRtMHFvMVhy?=
 =?utf-8?B?MWpteEhYN1ZTbmY4YmxzYkdSVG5aR0U1ZWlDMUJmOFArVGFmWmUzdU5Bdm05?=
 =?utf-8?B?bHk1eURxaVdDd0JNVTFWNXg3Nm5selJOVFRtMFlaYWEyM2tLZnFyS25OUnlL?=
 =?utf-8?B?VDZyYTVESFoxbU1nOGh2NytCK25pWDBSK0NvSE84bDNFYmtZT25Ubnl0MmFC?=
 =?utf-8?B?QUU5UXN3S2lNWlNqTE0xSnVwZUR6TkJkVk52SDlmZ0p2eHZ6WUdVV2JIV2g3?=
 =?utf-8?B?V1I1eW9YV25aVmliMkxHaER3L3FhOWtxZ0dPQ0pndzlmbHlMQnQxSU42bmpO?=
 =?utf-8?B?aDd4dmFDNy9sZVZyais2bnFNckdoNTltSEk5bTIyL0JtUkpiazFJN1pMQVNr?=
 =?utf-8?B?bU51VFRsVTBkZ1pwdDJzTUJtQXBKVHVHQU1ibk1BRzVKek03ZytTN3lSVDlZ?=
 =?utf-8?B?c1lxYWNxR0Z1aUxNeEZleE5wcExuT1hPV25OdHdaZUtIZjFnUnc5VkxKNU53?=
 =?utf-8?B?N2lwNDJaY1M5czR1aXdzaElmakY0U1gvaW5JTk9sTUdoV0Q2b2ZGS0RmZEpm?=
 =?utf-8?B?SVZ1VjdGU0ZQN2N2VHFDNVR2T2Jld0xld2VHQkZLUEorZEQ3TlhqcG9lQTZD?=
 =?utf-8?B?aUJHa1N3S0FsakpVRlFKY1BKU0NBQS9BOVlRT1hkclVwNWNjc0w1SXNHNmY1?=
 =?utf-8?B?NzlNNFMvc2I4MTg3VzhWWWRMZzlXQzBmNmtick9ERmxiYTlodXZVOWdlSlRW?=
 =?utf-8?B?SHBveENUNWJnekdCTGJFK2ZrczgvWmRSWUxvZUNVNlU3NkE5Ylg1NFdLeXV5?=
 =?utf-8?B?dmxHYU9kQUlGbHRyWDhtbDlYL01WZmpiOGF5T3BWeTFGWXNhL25wekEzMFpq?=
 =?utf-8?B?NEJTRHZieTFZSHBwdVppSTdHZ0NVeEVZZUpsbVJQQ2ZiSWE4aDBpVWRLWlh1?=
 =?utf-8?B?bFgxOFJERUtEd3NQTFp1ZzRBa3VhelFiT1FJUzVKVHJBaG05ck1vOVZ4MzRv?=
 =?utf-8?B?RDdQMmxRdmFZMGNadUMyVHZvZ1RCckV6ZFRkc0V0MjRRTEJ2NDFLNWZKeGwz?=
 =?utf-8?B?cHZ4V25ucGZGT0thdWg0azJEWXNyc0tHaE41OS8vcGg3UjNrbzRHdz09?=
X-Exchange-RoutingPolicyChecked: Sr8pQu1Is7N3YOcYhyj9SWY0D2MBCxne4pRXNHb4THUxVr963r5iTBbdz9nlFDpkeNzt5sWFP8VPzJ/M+n+0a8yRkhJbetsEIWQr7ik3XoInMb4QR3lO2Xcj96aV4rpPf+U1dIqOPhR0VyzvygvUGKo2nX7xx5u8L7YR9dqe4GALl7faBRQgoyNtoP3lI2Bws0EeZnH2Nb2vwVSiNdRkqRG6TMmqkKqMjl2Ug3Wa3d4XxrEe4IX9WgXF2aLkECngElKCSNs1EOWHCQDAfTh2TWij9z31o/xM7BlyJSI/SSTo5HHTKqtV04nrvNEQO7xUo4fovAuxCvxww0lfrXh3ww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a34aef7-2372-4253-4cbb-08df4bc22e6d
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:35:48.7446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGoEzUgdMFUyQQ/9E+mu/NvHGBeReQdVgRmb89ee9mMGNSo/lw9MNBC2Nf7hcznOtSWahgSeRk7YWlznddgsnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6912
X-OriginatorOrg: intel.com


On 24-11-2026 11:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [Medium] drm/xe/hwmon: xe_hwmon_resume() clears staged fan curve
>    points
> - [Medium] drm/xe/hwmon: fan mode desync on PCODE error in
>    suspend/resume
> - [Medium] drm/xe/hwmon: xe_hwmon_suspend() treats unprobed fan mode as
>    user table
> - [Medium] drm/xe/hwmon: uninitialized point_count in
>    xe_hwmon_get_fan_point_count()
> --
>
> commit 5afbb369b25a32407c56f7ca0be622b0b78f35d5
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Preserve fan user table across suspend resume
>
> This commit adds xe_hwmon_suspend() and xe_hwmon_resume() hooks to save
> active fan user tables before suspend or FLR and restore them on resume.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index b9e2e76d73c33..8efb5d2ce9ac2 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> @@ -2898,4 +2900,137 @@ void xe_hwmon_unregister(struct xe_device *xe)
>>   	hwmon_device_unregister(xe->hwmon->hwmon_dev);
>>   	xe->hwmon = NULL;
>>   }
>> +
>> +/**
>> + * xe_hwmon_suspend - Save hwmon state before suspend
>> + * @xe: xe device instance
>> + * @runtime: true for runtime suspend, false for system suspend or FLR prepare
>> + *
>> + * Save any hwmon runtime state that must survive PM suspend transitions.
>> + */
>> +void xe_hwmon_suspend(struct xe_device *xe, bool runtime)
>> +{
>> +	struct xe_hwmon *hwmon = xe->hwmon;
>> +	struct xe_tile *root_tile;
>> +	int fan;
>> +
>> +	if (!hwmon || !xe->info.has_fan_control)
>> +		return;
>> +
>> +	/* Runtime suspend keeps the fan tables unless the device enters d3cold. */
>> +	if (runtime && !xe->d3cold.allowed) {
>> +		xe_dbg(xe, "d3cold not allowed, skipping fan user-table snapshot\n");
>> +		return;
>> +	}
>> +
>> +	root_tile = xe_device_get_root_tile(hwmon->xe);
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	for (fan = 0; fan < FAN_MAX; fan++) {
>> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +		struct fan_control_point points[MAX_FAN_CONTROL_POINTS];
>> +		u32 point_count = 0;
>> +		u32 point;
>> +		int ret;
>> +
>> +		if (!IS_FAN_ENABLED(hwmon, fan))
>> +			continue;
>> +
>> +		fi->restore_user_table = false;
>> +		if (fi->pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
>> +			continue;
> [Severity: Medium]
> Can this treat an uninitialized fi->pwm_enable_mode as an active user fan
> table?
>
> Because struct xe_hwmon is zero-allocated, fi->pwm_enable_mode starts at 0
> (XE_FAN_PWM_FULL_SPEED) and is only set to XE_FAN_PWM_AUTO_STOCK_TABLE in
> xe_hwmon_read_fan_control_info() after reading the stock fan table from
> PCODE succeeds.  On platforms like DG2 (which sets fan_enable_mask =
> GENMASK(1, 0) for tachometer reads without PCODE fan tables) or when stock
> table initialization fails at probe, fi->pwm_enable_mode stays 0 while
> IS_FAN_ENABLED(hwmon, fan) is true.  Since every path that activates a user
> table sets fi->pwm_enable_mode to XE_FAN_PWM_MANUAL_USER_TABLE, checking
> only for equality with XE_FAN_PWM_AUTO_STOCK_TABLE causes
> xe_hwmon_suspend() to issue failing PCODE reads and log warnings on every
> suspend.
>
> Checking fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE would skip
> fans that have no active user table.
we could make the uninitiated state to 0xFF.
>> +
>> +		ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
>> +		if (ret || point_count < MIN_FAN_CONTROL_POINTS) {
>> +			xe_warn(hwmon->xe,
>> +				"fan %d user table point count before suspend invalid, ret=%d, count=%u\n",
>> +				fan, ret, point_count);
>> +			continue;
>> +		}
>> +
>> +		for (point = 0; point < point_count; point++) {
>> +			u32 fcp = FCP_INDEX(USER_FAN_TABLE, point);
>> +
>> +			ret = xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
>> +								  FSC_READ_FAN_TABLE, fan),
>> +					    &fcp, NULL);
>> +			if (ret) {
>> +				xe_warn(hwmon->xe,
>> +					"failed to read fan %d user table point %u before suspend, ret=%d\n",
>> +					fan, point, ret);
>> +				break;
>> +			}
>> +
>> +			points[point].temp =
>> +				REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
>> +			points[point].speed =
>> +				REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
>> +		}
>> +		if (ret)
>> +			continue;
>> +
>> +		memcpy(fi->fan_table[USER_FAN_TABLE].fcp, points,
>> +		       point_count * sizeof(points[0]));
>> +		fi->fan_table[USER_FAN_TABLE].point_count = point_count;
>> +		fi->restore_user_table = true;
> [Severity: Medium]
> Does xe_hwmon_suspend() need to re-read the user table from PCODE when
> fi->fan_table[USER_FAN_TABLE] is already cached by every path that commits
> or activates a user table?

not needed.

We can check the cached user-table count and mode, then sets 
restore_user_table = true for a valid manual or full-speed table. A 
failing mailbox during FLR prepare therefore cannot prevent restoration.

> xe_device_suspend() also runs during PCIe FLR prepare via
> xe_pci_reset_prepare(), when hardware state may be corrupted and PCODE
> mailbox reads can fail.  Because fi->restore_user_table is cleared to false
> before the PCODE reads, a mailbox error during suspend or FLR prepare skips
> restoring the already-cached user table on resume.  When either this
> pre-suspend read or xe_hwmon_activate_user_fan_table() in xe_hwmon_resume()
> fails, hardware falls back to the stock fan table after reset while
> fi->pwm_enable_mode remains XE_FAN_PWM_MANUAL_USER_TABLE and
> fi->is_full_speed remains set, leaving sysfs out of sync with the hardware.
>
> [ ... ]

Resume handles restoration failure explicitly.

If xe_hwmon_activate_user_fan_table() fails, it invalidates the 
unverified user-table cache and attempts to select firmware stock control:


Fallback succeeds: sets pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE 
and clears is_full_speed.
Fallback fails: sets pwm_enable_mode = XE_FAN_PWM_UNINITIALIZED (0xFF) 
and clears is_full_speed. Reading pwmN_enable returns -ENODATA, rather 
than falsely reporting manual/full-speed operation.
>> +void xe_hwmon_resume(struct xe_device *xe, bool runtime)
>> +{
>> +	struct xe_hwmon *hwmon = xe->hwmon;
>> +	int fan;
>> +
>> +	if (!hwmon || !xe->info.has_fan_control)
>> +		return;
>> +
>> +	if (runtime && !xe->d3cold.allowed) {
>> +		xe_dbg(xe, "d3cold not allowed, skipping fan user-table restore\n");
>> +		return;
>> +	}
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	for (fan = 0; fan < FAN_MAX; fan++) {
>> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +		int ret;
>> +
>> +		if (!IS_FAN_ENABLED(hwmon, fan))
>> +			continue;
>> +
>> +		if (!fi->restore_user_table) {
>> +			xe_dbg(xe, "fan %d user table restore not required\n", fan);
>> +			continue;
>> +		}
>> +
>> +		/* Re-program cached user-table settings for fans active before suspend. */
>> +		ret = xe_hwmon_activate_user_fan_table(hwmon, fan,
>> +						       fi->is_full_speed,
>> +						       USER_FAN_TABLE);
> [Severity: Medium]
> Does calling xe_hwmon_activate_user_fan_table() on resume discard fan curve
> points that userspace is in the middle of staging?
>
> drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_activate_user_fan_table() {
>      ...
> 	fi->fan_table[USER_FAN_TABLE].point_count = point_count;
> 	fi->fan_table[USER_FAN_TABLE].temp_staged = 0;
> 	fi->fan_table[USER_FAN_TABLE].speed_staged = 0;
>      ...
> }
>
> Each sysfs write in xe_hwmon_pwm_auto_point_temp_store() and
> xe_hwmon_pwm_auto_point_pwm_store() only holds a runtime PM reference for
> that single attribute write while staging a multi-point curve in
> Manual/User mode.  If the device enters D3cold runtime suspend or system
> suspend between point writes, xe_hwmon_resume() zeroes temp_staged and
> speed_staged, so subsequent writes to finish the curve see missing prefix
> bits in xe_hwmon_update_user_fan_point() and return 0 without committing
> the curve.

Yes, this is a valid issue.

I shall removed the staging-mask resets from 
xe_hwmon_activate_user_fan_table() and move them to the explicit 
manual-mode selection path.

Resume shall restore the committed table without discarding partially 
staged curve points, so userspace can continue the update after resume.

>> +		if (ret) {
>> +			xe_warn(xe, "failed to restore fan %d user table after resume, ret=%d\n",
>> +				fan, ret);
>> +			continue;
>> +		}
> [Severity: Medium]
> Does xe_hwmon_get_fan_point_count() pass uninitialized or non-zero values
> in *point_count into PCODE_DATA0?
>
> __pcode_mailbox_rw() writes *data0 to PCODE_DATA0 before issuing the
> mailbox read command, but xe_hwmon_get_fan_point_count() passes point_count
> straight to xe_hwmon_pcode_read_fan_control() without initializing
> *point_count = 0.  In xe_hwmon_activate_user_fan_table() (called here on
> resume), point_count holds source_table->point_count rather than 0, and in
> xe_hwmon_pwm_auto_point_temp_show() and xe_hwmon_pwm_auto_point_pwm_show(),
> point_count is an uninitialized stack variable whose contents are written to
> PCODE_DATA0.
>
> Initializing *point_count = 0 at the start of
> xe_hwmon_get_fan_point_count() would avoid passing stale or uninitialized
> data to PCODE.
pcode shall be ignoring it for reads, but we can explictily initalize it 
to 0 on reads.
>
