Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794971871;
	b=uZjZuGCqxonnfKwNC2zT8ug8tH1YLaQWvJ3/jZhnzagjZIqUHK6zFhnHgDKLOWc/aZP2
	 +v/JWFn3Ed1qNpWT+s1Mvk4lakuHhTwqhfUY3olUg9QIHW1YIL/qgI2guVODT6Wo6xabn
	 zu5XkWp3gegPTdUtYcjc5tAW/Pe3q7INjFQf3KAPggX62YRuxFUjP978oXev0dwSfHToV
	 r9bGV69Xi2TSIb3stA7RzcK+u+jRthoZQYK1h1kqOZ0z2/twlb2SvSecOQLE2W+JCMS5+
	 MK0Y0l9Pvmk24QZ8q17MwQPil2yDhqANiQXLwKzqdZp4N54PrJm2dsmkRAqadPQcjbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971871;
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
	bh=RAv6QDa1BHrLMOd2FI9ZBfI2wiRZR4nOIYfizZ9Lvvc=;
	b=EStCBVJQ3niNXc0uyFD/pE0Bly3bYb94otqDSBWMuMWa3P/qYKLAaEzZrOOUiNs+fJYN
	 l6UgpLs+pr0LMi4SlA6n5WzYHCGWhjUwiTkn1yPljqZNNDRyt+PG+PHfvUS+LSUsgiwpJ
	 bmE/7yEs6np8ShYsJvm55rFZ1NHJ4JlFxkJdJwfcQfutK0O7hJ7FYEdvxgn7LMJdgIBr4
	 f1RwIa+ujUBxbHMBdeIyaGvonu0rXiBqXj0eZ08F0o8kKWctxbLN2Ioot27dt2qYQ+Gel
	 kQM/rOkm5jHiJOQtIppFUljnQiksiNbCoMBYw3EDowt9dTgCrLUYn4OPwT/h2ZrrCvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aNOzt8Y8;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OoBGsLr6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F0A606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 03:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F0A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aNOzt8Y8;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OoBGsLr6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794971871; x=1826507871;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=c0K7M0tKWQ19LgfoU3IT8e1OxOPHxmOv+17f0AyB3hI=;
  b=aNOzt8Y8By0aHrvhD5YS1bcN7QA4MFMjqp3lzLi6fav58/1aSFExP/Ir
   KOQqmfK7UfackP2Nb8xKGvZ8niTlNKeKKJ5+tMsQ/3Kr74fBlyVzhXuek
   cjV9bjLSqxqp5Fi/PQK88xUD0DQtNWB7TIm8EfUry8zrKDVg+ro33YyaR
   Sz6WdOW/yYOSVe+BRryhq6CpVLJBtsw64Ap00ShywMbWFNBK5ofWg2QhU
   DDb7x3I8Q354pDXy3PNacTkeTqoJJ225NGcBQbHLi6Ik5uVXeu6fFPN4m
   p3zmILN7I//qnN5puaA4v0FwfSap3pKekkzcliFO/aJlVx+BE/1NL8jWi
   g==;
X-CSE-ConnectionGUID: oNHtUb/JSy+yS1Bi69jrow==
X-CSE-MsgGUID: ZyB1TMKPQGiWtISx0b3rBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3797832"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3797832"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 19:17:51 -0800
X-CSE-ConnectionGUID: yrN3COjzTp2DA4C7wW3HFQ==
X-CSE-MsgGUID: T01vTdBERNuHtcWh+P7i0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="11725665"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 19:17:50 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 19:17:49 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 19:17:49 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 19:17:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hf4TrPyMK7JHdaH/dFW0Y9o5Uv54MIBlHMEPkrMDAoGWv0DlBDwcCLoJHdKFYt12FqrrmIO8mqcx9iRAhYo9oVuEEsSvJ5JgMM6zQPkWvCU0S/ucK9LHDQF05Y8FoHirD3RRRQVa5FC6nctT3dT2hfK/OwZryJvPbzOI6jYhKY8RqyyEXL6JEGOPp4YWkpP+2gCzyUFfc2vqjoMEh0uKms1Us4j8d18dsQFcXnfQh484ECRH69n4dZvTWGdY9mmdONF9l/TT5dKHSZ8wJdEF1dv3R+1ThCAgqLcogZCOtAXYzPGFG4DycUleeD5VwDStZmlSu47FJ8EdtSSady8D7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAv6QDa1BHrLMOd2FI9ZBfI2wiRZR4nOIYfizZ9Lvvc=;
 b=fZCgfzFUelPJs8G8bOxHqQSPvoVlblP18YJe6vljQ8iqZDGqtW9LDIQ9edGl2ET5JtJN9aAmP2RqqfrgyX1BM0yBhtssz5hzIrXE4ef/dVlYI5zTQBjveRqI7O3z5TSgcOAqHfTU4zO/j+KJsglrT2F3bghQeTdPLM05xxddWlU0Gt6g9oiYe2jTWW6h4iiZdmrMnsR73CmFJehsBumUkca1kSlDH3/YdUHsLlbxGsFtAZtemZdOm9hllKMFUH4bhSBhkrez5cIoK+OFRxNWf1pLtLLYrKKwXribk2mu8YOAGO9iiVuoKzvTqilA3VKwaddE+uMCwD2ae+SljB99cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAv6QDa1BHrLMOd2FI9ZBfI2wiRZR4nOIYfizZ9Lvvc=;
 b=OoBGsLr6Ldq6R9AthL39JJ/TYQYQoqGR/14x0oNvLDLmhM7OZdM7u2wIJCxnHalN2gkDwwn0g3rFTNe0bKdYRf/Ad9sxZVlmKZiKDZ59pSKHT31xywAiqV6Qovs+st2JdX+QkUjUovE6XdWoBwGipUMUdkad4LpIJ7QN3csiNHw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8) by MN2PR11MB4677.namprd11.prod.outlook.com
 (2603:10b6:208:24e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 03:17:46 +0000
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f]) by LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 03:17:46 +0000
Message-ID: <6423501e-1711-4de9-9a40-c48fe2280492@intel.com>
Date: Tue, 17 Nov 2026 19:17:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20261016195904.1377149-1-daniel.charles@intel.com>
 <20261016195904.1377149-3-daniel.charles@intel.com>
 <sashiko-outbox-174913@kernel.org>
 <CH0PR11MB5395BFB1E16608BB023635D4E57B2@CH0PR11MB5395.namprd11.prod.outlook.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <CH0PR11MB5395BFB1E16608BB023635D4E57B2@CH0PR11MB5395.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:303:b8::19) To LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8)
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
X-MS-TrafficTypeDiagnostic: LV2PR11MB183078:EE_|MN2PR11MB4677:EE_
X-MS-Office365-Filtering-Correlation-Id: c265979b-188c-4996-68e1-08df45228491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|6133799003|261009223027099003|11063799006|4143699003|261028144727099003|56012099006|261102123227099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info: wrYsr9DLTK0Po97ce3KR0Digrc9i1EQeHk8XcQALilHEEF2HmfJdSPnso/487g9vcBjYCinz2pYmy4DY7Ep481AXhLe+xADGDnWpyqkDb+eMF3Vvv+i02DUzzXMJzM06Yl7se733TJlCSRl69Gr+Hu3nfsS+uuqTBUgwoiz9V3lEJ9boD4wK5RXIhHBP7yDe9u6KbGzpZk/Hg9Lex3L9up6JwZIjQcWaBrTJ8hEsoJKWQVLHpQ501olQLU29yjV6PnuUgyLHvA/is4tUadF2aSJhg0FTpLsqtCgj4DGAMRnJCs5rFAC9SrtjZrvg6dhPIj6+YaRqK8wMsfRnVoSq+AsDcC8W2yaIB5DH8vhs296EYt2haFON1Mb43Koa0xsl0erNCBM7x07RTfreWqbZyZF1Rpf+RO8D72R1Pp9anxJMoGle0Mhj5/eWXOww/LBN9jX2BIVj0QXH+Ohiw6+2jXSiQGgigUP5e7Yo6H4M7NkSJ+nmH8USPwmaQQ+hF7Mmb1ttKWid13Zur7f3TfngStc50wwGEnMp3g2RLnocgNFEEQLgLmuYxK6TxjG6DdfgRKcufIhqMOIPA4oidNp9BDrJgyWXdDdiAvLEuv4yXNc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB183078.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(4143699003)(261028144727099003)(56012099006)(261102123227099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkxiblBZV3JkMjRISm1LcjVMTWxPRlJPS1A3bnJucUx6OTBQVlJjOGV5ZTdX?=
 =?utf-8?B?UnpFNVdqazJ2T3BkR2VGYm5aUTJxclFCYzZidnVmOGcwTkN0b2NQdTdCeTlt?=
 =?utf-8?B?NmhJMEtuTFFEWlBUSnZrcTBhUnIwWUIwbUVxZlMzcmFjRzFhODc0a2FIRHIv?=
 =?utf-8?B?ejVoaDFGSS9lbmlQZm9HcHYvOW1IeElwL0pMc3F2NktpR21jV1EvWGwrTjho?=
 =?utf-8?B?UXRaOTJtRG9ia3M3dE5JaGJTUFJxVUt1U1VUZWFBVUVySlhhVWp1SkdFZm5O?=
 =?utf-8?B?NjFWVmtwMThyOUx0UHR3dDhkT3Jnc3lvQW5ScDlhNEV0RUp6WHUvaEllbUU2?=
 =?utf-8?B?UkxHYlpsYVNSV0hNUW8zNG1kMW8wVmNjc0puUmtqTGEvVUxWeXRudm5MaDVC?=
 =?utf-8?B?QWpuRnlHaEE3OFp2elowOFk5czdFSGhoSVFhUld1OU95WlhEenlUQTl1MXFi?=
 =?utf-8?B?dHpIZEpCVjl0RkhPTkVHL0RBNEhwSFFTZEMyaURPK3JvUTdMYnZzVWMwOSt5?=
 =?utf-8?B?NWdaZUlMMGFZdU83NGR0eUEzNHFRZHBmVnpzcStuYnJCcy9KdXdIOGpmbFlK?=
 =?utf-8?B?QWlsdWpFdGFvcVNrQkFXVHNnTGpzZG1OL2ZzUFV5NTFJZXNDR3RVaEE5bW5x?=
 =?utf-8?B?Q3hkQ3ZWOFdRbUJIaTZPalhvRkxYU1NBM3RUbjdUNTBNUnNwekhtQUNTd25S?=
 =?utf-8?B?VFc3ZnBwaU5mZGphVHNINDJ1dFY0MkFGVjV2QkkxeGs3Mm9teUcxQ3pTQnZU?=
 =?utf-8?B?YXdDckltbHdtOE9zWHpRTVFOUVcwYXVsUkpwdWJSQzcrK1IyZk9oWUlrejE5?=
 =?utf-8?B?ZEZ1ZU5lcUp3T1JSM0M4dzNYeEovR1hCVGdnR0hUSTNqclRnM09sNkRRY2dR?=
 =?utf-8?B?TTgxdVNVSmF1akJseUhGZTliTERFM2luSUFCSmJSUDlMblRpamNGVHlrMS8z?=
 =?utf-8?B?TnAwOUFkaWdWc0Zzc081Q1pXVWJFYkF2SjFTL1M2dCt4UERSTkRXbDl1Mzhm?=
 =?utf-8?B?bEhXMWl0VkczTjdxcVl6YmhmZG9aVnZzbWQ4UmFPTUZDeEdDaE5jREdkL3B4?=
 =?utf-8?B?emJKdEIwMEwvaml6R1htWHdlQitLK0JPVXJIWGVoOGsveVZjcVl4M0M1cHJ0?=
 =?utf-8?B?VllvQTNqako3bXMyL2g0QWNtREM1aFcyYWNvcklHSzE3Ti93eCtqYk1GcVZv?=
 =?utf-8?B?YlFBS0ZJTC9QQWF1dTRLUjVWVzAyN1ZmR2RjVVBvdHA1UjZ3TDZHb1dSQ2Q2?=
 =?utf-8?B?ZXBqRE8vRFl2L1Z1ejAvQVhRM2RlYVY5UWRvQjJwQWRSSXpydVUwQ1lrUFNV?=
 =?utf-8?B?N0xRYzJxVVptcXJES2NNN0hldXpaRG8zdTNvQk04UGg4ZVdYVkFidUpWbDN3?=
 =?utf-8?B?WXVrOWlPbGdCSFpMdm55YXRKMXNtVm1NQWRLSVdGdStuOEtWK2JHK0xPMDBS?=
 =?utf-8?B?MHZoNU0vbWR5TFA1c0RHU3JUVG1HRzRZTXhEOC9SVktLbkJHd2hwMDlVNlJu?=
 =?utf-8?B?cmg1Q3pmdFA4TSsyYUpadWdHOWRJaFVpSWMvV2Q2c1pGdVk5YjQzR21GVW9Y?=
 =?utf-8?B?RFpHRzFxdENWNzFKOVNGaDdGeUovZjg3TnRodDVTYVg0S2lyb09QZXhiN1hJ?=
 =?utf-8?B?bnQzMXlXMHVIR3pCVFIycTc5LzVzc1ZiUm9UVVV3QmZ4VHE3a1pkQ1FidEpR?=
 =?utf-8?B?OUlaMmFUaHZ3Yk84L0QvdGYwTCtSWXpWTXNCcEpVYU9nTHIwaHhXTXNhRjkx?=
 =?utf-8?B?NWI2UTU4UldQOGI5UDBkbE5BL2VXSDdYUDFMRGp5RExpR3ZWZS9iUXZ2RnVN?=
 =?utf-8?B?bU1kN0s0TTA0Sy9MOHl5Qzd1NGZWWmdTZ2szOWpZeUVsV0o2ak1wWUlmNmo1?=
 =?utf-8?B?UXFSamVlVkxJeHhUN0ZKdi82djErWmNma2hhOXB4eVA2bFdlbndqakxmK2F5?=
 =?utf-8?B?RTk0ZTZMQWdkb3RxSTBuazRjdnZxQlB0NE0vWmIvUDYzOGh6QWVCY2ZuQzZB?=
 =?utf-8?B?ZEJPMlJqRmxMTnpkUDdwdHZpZjUvV1doQno2c3IwY3drYmN3cCtGQXEzT3Qw?=
 =?utf-8?B?MW0rTjhlQzhZVmF1SmlKRkhmVjZwcjFXRi9wRGZtcFN6M2JlNDdBYk5jVnRa?=
 =?utf-8?B?Q05MUFl1aGtBcFQ4UUpSSzJrV2xtNnp1dWxCakpZQUhudDdFZ1VVSXFjWDJL?=
 =?utf-8?B?UkQ3ek1vYkJndXFQOHdCNHNSVDI4T1F3dHM3Y3JFNDlFaWRFNUR3ckpiek9Y?=
 =?utf-8?B?WlJTY2RKSXI0UTYwRkN5byt5WVZRc0doOENoWmFZb0hMUGhmdituaGNPSnpk?=
 =?utf-8?B?djc2bm5lV1lUR0dSWjErK2swSzV2aE1hMW5STDZiMGtrZUdHUDgzQT09?=
X-Exchange-RoutingPolicyChecked: I5CpWu0V1wXScM75/tLknJoFNXBNXhT48CGa9J3DNR1yhEUY1iLYUFjX04pKSeYw4eZlg59wwhdE8dOkyqHa2Jfc0MUiaFVSyPJ1v+T1Qge9A8K6pHyBLjFfGgOmd3eVhhSQlTimmsc+u89UB31M9l4Xf4pwXOZuEYqkGRhTmh61t5/Jd/fDx5sJRvAm3HwKrQKdh+PqmxXx3Q6i/AraFb3QMdodlDkQctVsUgwpR7DXMR8axdrUkJeA3imEnqFojMer3grxDcS4ftHmUuBFcRT2tASqqartxfFC4+Pp95VFn6euF+mZYp7LKbmOrnFR8UVoNfBUpudh87AdhgeZiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c265979b-188c-4996-68e1-08df45228491
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB183078.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 03:17:46.6582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /l2tQb2CwNW23/itfS4wNTvWLZl0mQjTcaa1VnY/JQR1D01N3PsxNcrWbr7MpxrhImDuLYqSiadhHjI+/5761xPKBRQg17mUdj9xW5nVWRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4677
X-OriginatorOrg: intel.com


On 11/17/2026 1:14 PM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of sashiko-bot@kernel.org
> Sent: Friday, October 16, 2026 1:28 PM
> To: Charles, Daniel <daniel.charles@intel.com>; intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH v4 2/3] drm/xe: Disable scheduling early on FD close to avoid CAT error cascade
>> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>> - [High] drm/xe: missing killed check in guc_exec_queue_run_job() after early disable
>> - [High] drm/xe: __guc_exec_queue_process_msg_kill() disables live multi-queue primary
>> - [High] drm/xe: missing ct.wq wakeup in handle_sched_done() for killed queues
>> - [High] drm/xe: guc_exec_queue_kill() called on zero-refcount queue in pause_abort
>> --
>>
>> commit f3abc41f0625f68bc7ba67b2b80c949770c16076
>> Author: Matthew Brost <matthew.brost@intel.com>
>>
>> drm/xe: Disable scheduling early on FD close to avoid CAT error cascade
>>
>> This commit adds a STATIC_MSG_KILL scheduler message sent from
>> guc_exec_queue_kill() to disable GuC context scheduling ahead of the
>> serialized TDR cleanup path when an exec queue is killed.
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 924024f6d0b24..1fbc8cd767675 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -2058,12 +2058,45 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
>>>   		guc_exec_queue_send_cgp_sync(q, 0);
>>>   }
>>>   
>>> +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
>>> +					      bool bound)
>>> +{
>>> +	struct xe_exec_queue *q = msg->private_data;
>>> +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> [Severity: High]
>> What happens in __guc_exec_queue_process_msg_kill() when a single secondary
>> queue in an active multi-queue group is killed via
>> xe_exec_queue_destroy_ioctl() or the error path of
>> xe_exec_queue_create_ioctl() while the primary queue remains active?
>>
>> In xe_exec_queue_destroy_ioctl():
>>
>> drivers/gpu/drm/xe/xe_exec_queue.c:xe_exec_queue_destroy_ioctl() {
>> 	...
>> 	xe_exec_queue_kill(q);
>>
>> 	trace_xe_exec_queue_close(q);
>> 	xe_exec_queue_put(q);
>> 	...
>> }
>>
>> guc_exec_queue_kill() queues the KILL message before xe_exec_queue_put(q) is
>> called (and in preempt-fence mode, q->lr.pfence also holds a reference on q
>> until preempt_fence_work_func() runs). When __guc_exec_queue_process_msg_kill()
>> processes that secondary queue's message while kref_read(&q->refcount) is
>> non-zero, it resolves primary = xe_exec_queue_multi_queue_primary(q) and calls
>> disable_scheduling(primary, true) on the live, non-killed primary queue:
>>
>> drivers/gpu/drm/xe/xe_guc_submit.c:disable_scheduling() {
>> 	...
>> 	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
>> 		set_min_preemption_timeout(guc, q);
>> 	clear_exec_queue_enabled(q);
>> 	set_exec_queue_pending_disable(q);
>> 	...
>> }
>>
>> Doesn't this overwrite the live primary context's preemption timeout to 1us,
>> disable GuC scheduling for the entire active multi-queue group, and leave
>> EXEC_QUEUE_STATE_PENDING_DISABLE set on the non-killed primary queue? If
>> subsequent jobs run or the primary queue is resumed while that disable is in
>> flight, guc_exec_queue_run_job() and enable_scheduling() will hit
>> xe_gt_assert() on exec_queue_pending_disable(primary), or submit_exec_queue()
>> will see !exec_queue_enabled(primary) and send a concurrent
>> GUC_CONTEXT_ENABLE while GUC_CONTEXT_DISABLE is still pending.
> GuC state changes are serialized by the scheduled work queue, so this concurrency
> issue cannot happen.

The primary queue should not be disabled until group submission has stopped.
The minimal fix is to skip the secondary's early primary-DISABLE and let the
multi-queue TDR path stop the group before disabling it, after verifying 
that
the path always runs for this kill. This delays the disable. KILL must still
publish its processed acknowledgement while `kill_sync` waits for the
primary's state to clear. To preserve early protection, a separate 
group-stop
operation must hold member references, stop submissions, coordinate queued
messages and TDR, then disable the primary. Do not call the existing
group-stop helper from the member's message worker: submission-stop
synchronously cancels that same worker. I need to look into how this 
would look like in implementation.

>>> +	struct xe_guc *guc = exec_queue_to_guc(primary);
>>> +	int ret;
>>> +
>>> +	/* At zero references, the queued CLEANUP message handles disabling. */
>>> +	if (!kref_read(&q->refcount) || !bound || exec_queue_wedged(q))
>>> +		return;
>>> +
>>> +	ret = wait_event_timeout(guc->ct.wq,
>>> +				 (!exec_queue_pending_enable(primary) &&
>>> +				  !exec_queue_pending_disable(primary)) ||
>>> +				 xe_guc_read_stopped(guc) ||
>>> +				 vf_recovery(guc), HZ * 5);
>>> +	if (!ret && !vf_recovery(guc)) {
>>> +		xe_gt_warn(primary->gt, "Pending enable/disable failed to respond on kill, guc_id=%d\n",
>>> +			   primary->guc->id);
>>> +		xe_gt_reset_async(primary->gt);
>>> +		xe_sched_tdr_queue_imm(&q->guc->sched);
>>> +		return;
>>> +	}
>>> +
>>> +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
>>> +		return;
>>> +
>>> +	if (exec_queue_enabled(primary))
>>> +		disable_scheduling(primary, true);
>>> +}
>> [Severity: High]
>> Can calling disable_scheduling(primary, true) here before TDR stops the
>> scheduler trip the state assertion in guc_exec_queue_run_job()?
> Can stopping the scheduler before stopping the scheduler cause
> guc_exec_queue_run_job() to trip the state assertion?
>
> No.  No it cannot.
>
>> Prior to this change, EXEC_QUEUE_STATE_PENDING_DISABLE was only set when a
>> queue was either suspended, banned (with scheduler submission stopped), or
>> destroyed at zero refcount, and guc_exec_queue_run_job() asserts this
>> invariant:
>>
>> drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_run_job() {
>> 	...
>> 	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>> 		     exec_queue_banned(q) || exec_queue_suspended(q));
>> 	...
>> }
>>
>> Because guc_exec_queue_kill() only sets EXEC_QUEUE_STATE_KILLED (not BANNED or
>> SUSPENDED) and does not stop drm_sched_run_job_work (which is only stopped
>> later when guc_exec_queue_timedout_job() runs on gt->ordered_wq), if another
>> job is queued on q->entity and guc_exec_queue_run_job() executes on submit_wq
>> after __guc_exec_queue_process_msg_kill() sets
>> EXEC_QUEUE_STATE_PENDING_DISABLE and before the GuC SCHED_DONE G2H clears it
>> or TDR bans the queue, won't guc_exec_queue_run_job() trigger this
>> xe_gt_assert()?
> This patch causes guc_exec_queue_kill to stop the scheduler, and by extension
> drm_sched_run_job_work, so this cannot happen.
The KILL path queues an early DISABLE but does not synchronously stop the
submission worker. A job can reach guc_exec_queue_run_job() while the 
disable
is pending. The killed check prevents normal submission, but the assertion
runs first and did not allow that state. This is an easier fix, IMO.
>> [Severity: High]
>> Also, when disable_scheduling(primary, true) is called from
>> __guc_exec_queue_process_msg_kill(), what wakes guc->ct.wq when the GuC
>> replies with XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE?
>>
>> In handle_sched_done(), when runnable_state == 0 and !was_pending, the wakeup
>> of guc->ct.wq is gated on exec_queue_banned(q) (and placed before
>> clear_exec_queue_pending_disable(q)):
>>
>> drivers/gpu/drm/xe/xe_guc_submit.c:handle_sched_done() {
>> 	...
>> 		if (!was_pending) {
>> 			if (exec_queue_banned(q)) {
>> 				smp_wmb();
>> 				wake_up_all(&guc->ct.wq);
>> 			}
>> 			if (exec_queue_destroyed(q)) {
>> 				clear_exec_queue_pending_disable(q);
>> 				deregister_exec_queue(guc, q);
>> 			} else {
>> 				clear_exec_queue_pending_disable(q);
>> 			}
>> 		}
>> 	...
>> }
>>
>> Because a killed queue only has EXEC_QUEUE_STATE_KILLED set and
>> exec_queue_banned(primary) is false, handle_sched_done() clears
>> EXEC_QUEUE_STATE_PENDING_DISABLE without waking guc->ct.wq (and the follow-up
>> commit "drm/xe: Synchronously wait for queue kill on FD close" only wakes
>> kill_wq via guc_wake_kill_waiters(), not guc->ct.wq).
> +		 * @submission_state.kill_wq: wait queue for exec queue kill_sync
> +		 * waiters, kept separate from &xe_guc_ct.wq so that waking them
> +		 * from the G2H handler does not wake every CT waiter.
>
> Also, in guc_exec_queue_kill():
>
>           * Do not signal the suspend fence here, the queue may still be running
>           * on the hardware. Only wake any suspend waiter so it observes the
>           * killed state instead of waiting out the full timeout, suspend_pending
>           * stays set until the queue is torn down.
>
> It looks like this is intentional to prevent every CT waiter from waking up.
>
Yes, in that case waking every CT caused a bottleneck and exceptions 
after the test finished. See my comment below.
>> Won't any waiter sleeping on guc->ct.wq for !exec_queue_pending_disable()
>> stall for the 5-second timeout and trigger a spurious xe_gt_reset_async()? In
>> particular:
> AFAICT, no.  Only the ones that were killed would be waiting there.
>
> ... But they were killed, so they shouldn't be waiting any more anyways?
>
>> 1. __guc_exec_queue_process_msg_kill() or guc_exec_queue_timedout_job() on a
>>     secondary queue in the same multi-queue group waiting on guc->ct.wq for
>>     !exec_queue_pending_disable(primary).
>> 2. disable_scheduling_deregister() during CLEANUP when a queue is killed and
>>     put (e.g. via xe_exec_queue_destroy_ioctl(), xe_vm_close_and_put(), or
>>     xe_file_close() in this commit) while KILL's disable_scheduling() is in
>>     flight. If disable_scheduling_deregister() times out waiting on guc->ct.wq,
>>     it calls xe_gt_reset_async() and returns early before calling
>>     set_exec_queue_destroyed(q), which causes guc_exec_queue_stop() during reset
>>     to skip guc_exec_queue_destroy_async(q) and leak the exec queue and guc_id.
>> 3. Similarly, if primary had an in-flight suspend on non-VF when KILL ran,
>>     __guc_exec_queue_process_msg_kill() waits on guc->ct.wq while
>>     suspend_fence_signal() -> suspend_wait_wake() only wakes
>>     q->guc->suspend_wait.
>>
>> In addition, in guc_exec_queue_timedout_job():
>>
>> drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_timedout_job() {
>> 	...
>> 	if (!xe_device_is_in_reset(xe) && !wedged &&
>> 	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
>> 		...
>> 		if (xe_uc_fw_is_running(&guc->fw)) {
>> 			ret = wait_event_timeout(guc->ct.wq,
>> 						 (!exec_queue_pending_enable(primary) &&
>> 						  !exec_queue_pending_disable(primary)) ||
>> 						 xe_guc_read_stopped(guc) ||
>> 						 vf_recovery(guc), HZ * 5);
>> 			...
>> 			disable_scheduling(primary, skip_timeout_check);
>> 		}
>> 	...
>> }
>>
>> If TDR enters this block because KILL set exec_queue_pending_disable(primary)
>> (while exec_queue_enabled(primary) is already cleared), won't TDR wait for
>> pending_disable(primary) to clear and then unconditionally call
>> disable_scheduling(primary, skip_timeout_check) a second time on the
>> already-disabled context?
> Patch 3 rev4 in this series, introduced kill_wq to avoid waking every waiter on ct.wq. I'll
> propose replacing it with a scheduling-state wait queue on each exec queue.
> Waiters would use the queue whose state they inspect, so a secondary waiting
> on its primary would use the primary's wait queue.
> This is also based on the feedback received on patch 3; more details will be
> answered there as necessary.         	
>
>> [ ... ]
>>
>>> @@ -2224,8 +2260,21 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>>   	return err;
>>>   }
>>>   
>>> +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>>> +				       struct xe_sched_msg *msg,
>>> +				       u32 opcode);
>>> +
>>> +#define STATIC_MSG_CLEANUP	0
>>> +#define STATIC_MSG_SUSPEND	1
>>> +#define STATIC_MSG_RESUME	2
>>> +#define STATIC_MSG_CGP_SYNC	3
>>> +#define STATIC_MSG_KILL		4
>>>   static void guc_exec_queue_kill(struct xe_exec_queue *q)
>>>   {
>>> +	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL;
>>> +
>>> +	xe_gt_assert(q->gt, kref_read(&q->refcount));
>> [Severity: High]
>> Can this xe_gt_assert(q->gt, kref_read(&q->refcount)) fire when
>> guc_exec_queue_kill() is called from xe_guc_submit_pause_abort()?
>>
>> When the final reference to an exec queue is dropped via xe_exec_queue_put(),
>> q->refcount becomes 0 and guc_exec_queue_destroy() queues STATIC_MSG_CLEANUP,
>> but q remains in guc->submission_state.exec_queue_lookup until the async
>> destroy_async worker runs guc_exec_queue_fini() -> release_guc_id(guc, q).
>>
>> In xe_guc_submit_pause_abort() (called from xe_guc_submit_wedge(),
>> vf_post_migration_abort(), and guc_submit_fini()):
>>
>> drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_pause_abort() {
>> 	...
>> 	mutex_lock(&guc->submission_state.lock);
>> 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>> 		struct xe_gpu_scheduler *sched = &q->guc->sched;
>>
>> 		/* Prevent redundant attempts to stop parallel queues */
>> 		if (q->guc->id != index)
>> 			continue;
>>
>> 		xe_sched_submission_start(sched);
>> 		guc_exec_queue_kill(q);
>> 	}
>> 	mutex_unlock(&guc->submission_state.lock);
>> }
>>
>> And in guc_submit_fini(), the final reference on wedged queues in
>> exec_queue_lookup is explicitly dropped right before calling
>> xe_guc_submit_pause_abort():
>>
>> drivers/gpu/drm/xe/xe_guc_submit.c:guc_submit_fini() {
>> 	...
>> 	mutex_lock(&guc->submission_state.lock);
>> 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>> 		if (exec_queue_wedged(q)) {
>> 			mutex_unlock(&guc->submission_state.lock);
>> 			xe_exec_queue_put(q);
>> 			mutex_lock(&guc->submission_state.lock);
>> 		}
>> 	}
>> 	mutex_unlock(&guc->submission_state.lock);
>> 	...
>> 	xe_guc_submit_pause_abort(guc);
>> }
>>
>> If xe_guc_submit_pause_abort() encounters a queue in exec_queue_lookup whose
>> refcount has already reached 0, won't it trigger the new xe_gt_assert() in
>> guc_exec_queue_kill()? Furthermore, if EXEC_QUEUE_STATE_WEDGED is not set on q
>> (such as in the reset/abort branch of xe_guc_submit_wedge() or
>> vf_post_migration_abort()) and guc_exec_queue_destroy_async() is already
>> scheduled, queuing STATIC_MSG_KILL acquires a runtime PM reference via
>> MSG_PM_REF that can be leaked when guc_exec_queue_fini() -> xe_sched_fini()
>> cancels work_process_msg without draining sched->msgs.
> I think this was already technically possible in the original arrangement of the code.
> The fact that it hasn't caused problems yet indicates to me this is likely a false positive,
> but I recognize that's not a sufficient reason to ignore a potential issue, so let me dig deeper:
>
> In guc_submit_fini(), xe_exec_queue_put() is only called if the queue is wedged.  And the
> queue wedged state is only ever set by xe_guc_submit_wedge, which itself only sets this
> state if the refcount is at least one, additionally incrementing the refcount.  This means that
> in guc_submit_fini(), xe_exec_queue_put() can only be called if the refcount is at least 2, so
> decrementing it cannot set it to zero here.
>
> As for the other issue about guc_exec_queue_destroy_async already being scheduled: this
> cannot happen because the guc exec queue is only destroyed when the refcount becomes zero.
> This currently only ever happens after xe_exec_queue_kill() has been called, meaning the
> destroy before kill issue is impossible due to scheduled work queue serialization.
In guc_submit_fini(), wedge's get_unless_zero() reference means fini's
put cannot take the count to zero. That is not proof to every
pause-abort path or the runtime-PM lifetime. I'd take a temporary reference
before KILL, skip a zero-ref queue so CLEANUP handles it, and keep the
scheduler alive until KILL is drained or its ordering is proven. Let me 
see if that can be done easily.
>>> +
>>>   	trace_xe_exec_queue_kill(q);
>>>   	set_exec_queue_killed(q);
>> [ ... ]
>>
>>>   	if (!exec_queue_wedged(q)) {
>>>   		struct xe_gpu_scheduler *sched = &q->guc->sched;
>>>   
>>>   		xe_sched_msg_lock(sched);
>>>   		guc_exec_queue_try_add_msg(q, msg, KILL);
>>>   		xe_sched_msg_unlock(sched);
>>>   	}
>>>   
>>>   	xe_guc_exec_queue_trigger_cleanup(q);
>>>   }
>> [ ... ]
>>
>> -- 
>> Sashiko AI review * https://sashiko.dev/#/patchset/20261016195904.1377149-1-daniel.charles@intel.com?part=2
>>
> This is my best attempt at addressing these revision notes.
> Charles, are these notes accurate?

I added my comments, the trickiest part is to reconcile the changes with 
the feedback on patch 3 and redo the kill_wq approach.  The others, I 
will put fixes for them and see if rev5 has better feedback from the 
bot. Also more human eyes on this may help.

-- 

Daniel.

> -Jonathan Cavitt
