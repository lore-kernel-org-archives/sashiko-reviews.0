Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795696427;
	b=hf5szhwz5sMzPTkHDGBpJERWmCHfLBcVR9DHV/4HjUHi1GH0H+9HToFFu+Nmcg5c/cVp
	 4l0Lkx+tGqEVInHk/wlbKn7W6ESoopHWHx1ujrs/x8qyjsptBTC+qMuhQdDgthnNpP0eS
	 Ir2Uhmk4MWwlOmguFBM//Vs7NwHUf3AOy9xasTyLNY5JdP8K+PJLqT+8ODU8l9/OCejZL
	 f0UWEd5ebF6okjng1X+hz9O0HCnImh0I2k9H4/dX0SdAQy4X2+bSvc3K0rz4qw0T2GqOu
	 LoQFCkacEa5o7JxGei1r5GmY4JvHgbSBRdJooh5cNk+eTHhqKVGnqr/B/WrXujJ8IXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696427;
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
	bh=6Tcv6Bqfwh+BpActVGnldm0HSQAS2/qCJeQWXJXM+r4=;
	b=xTcRF8nvsT4Bow/5yglWDqtnr6p4eKlcM3H2zVV/bUDeXP8lSU6ZdHNP+bOTM7YRAvFW
	 3tp9T4ser/eG7sK4WcBmh1fhB5OwxbUwMJBB2J4GFsYTv2FmbwFailbYpDawE8tqkZr/O
	 n7wbq5ownb6ggZpRJi7SiK7iyYhARy+CpZQ374quDUpfp2sPc+FM2XKHAUSlLINPc6hZj
	 h2fbBgqkE4oixjQSp4UDIxTQDQoWwnOdsrh4Heaq1TlCK2GIYif1jpdaDKqrLlewEBtQ1
	 lski/hTWRlfb9BIteDqIxKRv34SSBP5SBbp5yAquoHuAKY4AURexqTytOdBSDxL/vYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JnQi0oS7;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ap7ZyKDH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82335606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 12:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82335606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JnQi0oS7;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ap7ZyKDH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795696427; x=1827232427;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0HGKV99rGzNO80NENNfEoFiuf07WjMDtAG+XCh8Kr9k=;
  b=JnQi0oS73Og2x6qj3+ZhhCwv9Msm1KOHY17V4mFzbLYtlpT+YhtBBcfz
   7hSS7u7zc0rJguUB0EqB8+Sl1KLDliUT/MoCgwIk5LLV6H92zf/zW5+xP
   slifWswQQU+YmmRZVsPvIIxqvfI721ViiQZh8EfpN3Q8pM7aAtjbz3DzU
   ShU8Hx3LR9sEXaRrv8sPoMvXKBexBvypTFtU5xT8wzsiXwtt0urqv4GP+
   hiV+fC00moLtKolcmgIzifUQBn+lVec9WQfy3JOj+TNirMBvxphxewL8X
   xadxtrbV20+ThO23MvGFhwgKDtioZ/kjxdzt5YOP9zrNV9slcjMO08ih7
   A==;
X-CSE-ConnectionGUID: LQHo1/TVSN+QrRMUBeSd8A==
X-CSE-MsgGUID: WJRPqwr0TYi6yFLJj7cgiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4531362"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4531362"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 04:33:46 -0800
X-CSE-ConnectionGUID: b3l1SQWESRuW9i/fBERBFg==
X-CSE-MsgGUID: XRjqkoJdRHmE3lLYXsZ5tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12389813"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 04:33:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 04:33:45 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 04:33:45 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 04:33:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIa3ATONhREIJtaTb2YtT7/EEERiiGediVW2iwYepGyV9eghpOMqDC+efzhduMvOao3i70GaaCBhaczPtwm9ggMg9clhKK63jW4f6KDYTTa34Mx9AYBWdZsQCBXio8aFwXD1MT6Geyz7fJ/qHY+wjb+Xawbxg4IpIlx7Q0AWKX0FVqdGagR83yLuODGYvmP0BDlHRpaP6cHxMkvYkmjSFY+KhEGcRYFERc4nwQzRaTf3Ml0qavzEhtGc9mCMMy7PZ4JYaRDLeSMaiKa9hwfzBW5gEpngUsndWNh2kbwptGiF8xmpZaBnid1GMpy4XYgrzLKVjmX5xp8zFYWcbGbonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Tcv6Bqfwh+BpActVGnldm0HSQAS2/qCJeQWXJXM+r4=;
 b=ZPh5S/siqnOa+5iixa7GDP296hkAFHT3y+R20o6pcCD30oBbyl9HyIf7kaxsw7+BfZVZdQ53SIydFV8iCaQoULzV4UfVzGTQofgIMqatJTmk3T+44RpUr3E3rabBYpitbd4sJc2uuufbNIxbkLtVF6yl3BL04ShsJHFNLfGnulYWOYI7mpLnYjl/RxinL7IuU5VvPsCMhXb4JeskCfYbmKAG31lAncRx0Jievmzv9Nbd6C0xQZMBP3er1wzLenr6+rugmLSiO7bB+RCwS58z5tJQlPdn5TRaQH2cEy25LOwjbUe2LG3KW7Tg/aGSJU2A7aoeacUO/+JmrrBGuwOxOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Tcv6Bqfwh+BpActVGnldm0HSQAS2/qCJeQWXJXM+r4=;
 b=Ap7ZyKDHpL0KfjsQmwWH4vk7vXQzuvbTqX+eQqENu+8WNlPSgtIwIo7/XYMDlQzZEeEVQBAysc1cK3qwVkLAiXjyoHPWzqUMaQTKsTSNO8KQcM/KmFQLBVCGXB54PTtK4fVK9hldVksts8ibKNMqdyJhgBkiasozvQ41Xm75NZo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by DS0PR11MB6517.namprd11.prod.outlook.com
 (2603:10b6:8:d3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 12:33:38 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 12:33:37 +0000
Message-ID: <d646756e-eeb0-49d0-b42f-9b0991f052e3@intel.com>
Date: Thu, 26 Nov 2026 18:03:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] drm/xe/hwmon: Add kernel-doc for fan control
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-8-karthik.poosa@intel.com>
 <sashiko-outbox-230564@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-230564@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::10) To FT1PR11MB960200.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|DS0PR11MB6517:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a854363-5743-4e56-3f31-08df4bb97e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|56012099006|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: W6Hfo21wileUAtN45c1W2v3Jn2uvpBPAzzThcG8Q/ZDOtI89EIWfEF9kDxiB1KqvcV5t8jdIwhoRvCz7AKtfgCyOOEN8rp4kr2j8rZSs+PUxDaHjtg4XVk5SS+o12FVSh8NM+lRCDwVbKXJyldG5oAwWwUZTJCAGVo9yQUrfDbWUT+nxQutckieb1yPIbejXZt1maXpGLFuPP3EZzlYnj7aspq6ThnY9mQeGBpmsz4ipmXSNEqtMaJA4JPG5p1l6M5jeBL8nGaJvnE+TmflJ5jMpJsi1FnNypP/356ojubB4zbqIYhfA6D8Xh4oTnGVs7qM7nj5x+NYVOwuvSvynnVzcBq6nww+TCdAmo0ipUo+vFNopB2JTXUgsU62ooRTFJ7X9JeV0C0qVguAX8+5+K/6q5rFo8xn98oHbCPw5IJlPEqQXPL9vQnAXmeK8OJVs+icQvsGZTJkRNut5W9fGQQttQ5LPZPz7LQU3mE75I421KWEGB3q+BvM8QK5XqL01jUaEvuk3ggFIV/IRP8nVXqCoCu57yYJBNhae7m8GKxtRTdAEK2u7+ZZyyFv3hJDvXoq/XCAdQ7ZA4D5yvuDEUuIIow+cd0PiSUBxPZsW0VfnbgeT/+r0E3/fADMGuz8RM5XyKp1Hm+A0NemWfGMRef9yf3GV2yu41TYDhSl5/Jg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FT1PR11MB960200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVM5UEYwWXFtQzV4cUhMZk9TampFY3BmRmhaaWRBTjdZQkVDOTV6QlNYY2Q5?=
 =?utf-8?B?N1R2azV4TTVhbEh3bTFuclB0R0x3azkxUzdJZFU4ajV3emxRRUIvZmpJUVh0?=
 =?utf-8?B?OFZmbW4vYk03MUpmeVNNckp5NVd6Q2tkNHI0TUxLMjRaVE1rMERhcEh5NThS?=
 =?utf-8?B?dlNqaktPNDdvSURtVlNFbHNxU3ZUcnN4QnNOU0ZueXlnZHpGTHBLM2RONGU2?=
 =?utf-8?B?L3RlUFh4UDRwcXdEWEJ2SytrOHFXREQvaEthMzhYTkphUUJEMXdKbzBKQlE3?=
 =?utf-8?B?b1NMdVFiKzI5ejhjeTZjWjgzUHpwTmp1YTAvOFRJaXdqWGZOK0pWMDBRRWJN?=
 =?utf-8?B?U0VlRjExMjYvZDJpb3doZTVCWmlidTdNTmVJK3k2RGU5NnhCcC92T0tUUGN4?=
 =?utf-8?B?ZlVkbDdULzgra01ITkovYU9FRFhWcmxFMkJYREdVbFZoQjdseURqWTRjZzEz?=
 =?utf-8?B?RnRIOG5IdlErNDNWekhjL0NlL2NYNUN4bTJIakMza1hVUjZxcDNHcFlPaW5p?=
 =?utf-8?B?c3FRWUgzYjBNZjB2akEwcTlQSXloUjdHUytTUUE4Nkl2d1Y4ajhkRGdTd25k?=
 =?utf-8?B?TkxGUWdRaW1heTB6ZjhaQkJFeWhpK3RGaUtxWmgvRTMzUUg1RExCSThNREZR?=
 =?utf-8?B?dzlIT054MmtjUGMydTBFNGpCUFkrQWlzR3VIS3cyZTgxTVB1UmRjeXhDeWlL?=
 =?utf-8?B?dkxMOEZRU0hDYW01MHJmbXlURkZEVTZsWVdvS2hJOHdOYWV2L0xKWWNhWmxQ?=
 =?utf-8?B?OTdUd1ZvdENzcjdsYUlMWHFLZ0szODBrcnZETVJGWlVZSVhQYlNyMkFmeVZy?=
 =?utf-8?B?dlJOWTcwdkFDS2pyRkhNUXV1MFFhbEQvbzQveDBRQlpMbXgwU2E2OHpjZGZj?=
 =?utf-8?B?TVh6Z21scnMwaUR6OWlpcHUzVjcxQUZaYjN0R0w0KytXb3lVamxhZTFhbGpx?=
 =?utf-8?B?M2NJNFErV1B3eWdFN2tyRy9OUlZyTEdqSVRsZmxSZ2FRODVmY1F5QitiNlBp?=
 =?utf-8?B?OFQ5MXV3NlhkTjJKUFArdStqamY0aDV0bmlzLzZTOGFNdHdycm1OalRwSDN0?=
 =?utf-8?B?UlZyenk5VVNxdTdZL2w0TElPNWVHRVpVcUtQQkZxVnRyRGpNQVV5M1VyS3F3?=
 =?utf-8?B?SWRCOUw4THJoMWtPaWphSUM2WktLUXVqVFJUVUUwNzJqV2NzSWxkdWYrSEY5?=
 =?utf-8?B?VVcrM1FUNVRWTlgxQXdHUHRWUGJtUURhVHFuZFA3amdreENXbTBkSDVSUWZj?=
 =?utf-8?B?SitwaklsMGVXaTd0UmIvdWhpeG1EakFVd0prSTc1eXJxM1I0UkVZOENvdndy?=
 =?utf-8?B?VFFqVmcwZjRlUFVldHJRMWcvRFEyNE56UU1mbmZBem9tdm9LMnVHU3BCZEtv?=
 =?utf-8?B?TW45OGYrTGx3TVpBRWNLZ01mZXNvaWNmb3hZU1lMZmxhZ1BJdytyZTdjMlIw?=
 =?utf-8?B?Skk1TGtqVUFsaCtPcnBDZFRyeVkwWkx2c01SaHN2R1JuRzYwZEN4N09sL2tR?=
 =?utf-8?B?U201bjNJT0xOb3J0anVkWjR3dHJyMmprZmtQcHdvck8rZXVXUUM5NjJ1UFJR?=
 =?utf-8?B?RXZkcHBrQTBwV2ZtdHlodjEzR0pIVG9VOER2bjlMeDJuQUZramxSSGhSK0lq?=
 =?utf-8?B?VjdhVU55Z3JFdmdIZUFsTEMyVWJqS25EL0llLzd3YXVxNVREOGZ5L21mL0o4?=
 =?utf-8?B?VEdFcjdTNThvbGd4NXc1S0tuc25ucFVVdkREYVYrY0lPY04waTVsSE1GYjd2?=
 =?utf-8?B?K3lpUDJ2clgwWU9XWTRrcmxJYW01czNhS2ttTGErWS8vYnNiVGk2YnVrQ1oy?=
 =?utf-8?B?Vy9xQ2kvNDE1dTJPeitHK3NvM1RwczErTTFXemxFWThjS1ViTCtlUkhWdXdI?=
 =?utf-8?B?SVpUWjJ5ZWYrTEFNSVd4V3JYMTcyY004bWJUc0plYXhPUThVdHM0Tk1VUEc5?=
 =?utf-8?B?Q0Fkc3cvTHFjTmZxelFNbGRKMHlOMUk3NDZRSWIwcVljSXB1UlYrMVJJdUgz?=
 =?utf-8?B?ZHlzdmJ4RUpKL0xmeGY3dnFJMGFIZDF1ZmVXOHNZaENiWkVyYTZkZWFEbStB?=
 =?utf-8?B?L0FKWTdZVWE0LzRFdHNmdzVKQU1pM0J3SzdpbmtFTWlQU3NxZGhRMFhRZ0Vm?=
 =?utf-8?B?QjBuZUc3Qzc5TVVOSXVPaHBwdWxsbGdGUXd3Z1hpQkVLKzNuRGpVeWc3WEw0?=
 =?utf-8?B?aEl6d20rR0syL3diYURwdGRwUEo5a0Z1Nk50SFlCbkNBUEVZdDFGUjNoUW5m?=
 =?utf-8?B?d2cxNENPNE1UVFdJLzhQTUdVbVFwQWU1U1ppL1QrYmh3YlJMeVZ4RkoweFRN?=
 =?utf-8?B?UHR2VjVla0FEaVErOWJXUmRoZmQ3OWJlWm5ZZXlwbWV2eXpwbERtZz09?=
X-Exchange-RoutingPolicyChecked: SqTCamGucnC0CI93FlkfxqVEd3PYBVEHRQ+eoU+MslP3mk3PT6dM97AIlGFPd208d4Ltdqr2Y++DjjDMKVG4bToZuWoj/rXrXw1yezH/g8QLRu8+gi2rGbRGKno45d42GPP1nKv+tBfKYU+eFWhbnCK6it1FFqnqgs0JKshZelKPfiQzuixXjQbUlL+OdbaseLDS+7bncR2s2y2Cof52P2ssXWLRE0Q7oqqLA2xK2KV6XegbUhmWywmcGAF2ZJcrCjZw4F70of7qiKlkiMirNwJIWxthJJK6y3HJD0phSXEPHDci7XqbQzPPjXupom8+2Q8aEAtf/d7n6mDmJOPfMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a854363-5743-4e56-3f31-08df4bb97e8d
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 12:33:37.7447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxUJPQ977Gt5S8uQ3eiO1V0tedgP6YJA14wgNwdG7bLZAodkET8OF6op5H+T2rcfOzkxxBtTHr2vVOnxI8DpkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6517
X-OriginatorOrg: intel.com


On 24-11-2026 11:23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] drm/xe/hwmon: kernel-doc claims pwm writes fail when pwmN_enable
>    is 0
> --
>
> commit e3f1b146650ba8a68f8904ed7422e9ec4d05d22c
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Add kernel-doc for fan control
>
> This commit adds a kernel-doc comment describing Xe hwmon fan control,
> its firmware stock and driver user tables, and the exposed sysfs files.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 77c4d1b0ecaef..b9e2e76d73c33 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -139,6 +139,58 @@ struct xe_hwmon_energy_info {
>>   	long accum_energy;
>>   };
>>   
>> +/**
>> + * DOC: Xe fan control
> [ ... ]
>> + * Writes to ``pwmN``, ``pwmN_auto_pointM_temp`` and ``pwmN_auto_pointM_pwm``
>> + * are accepted only while ``pwmN_enable`` is 1; otherwise they fail with
>> + * -EINVAL. Firmware stores duty cycle in percent, so PWM values read back
>> + * rounded to the nearest percent step. PWM values below the minimum duty cycle
>> + * reported by firmware for that fan are raised to it, except a curve point PWM
>> + * of 0, which is kept for the end marker.
> [Severity: Low]
> Does the driver actually reject writes to pwmN, pwmN_auto_pointM_temp
> and pwmN_auto_pointM_pwm when pwmN_enable is 0?
yes, those write shall be rejected
>
> Writing 0 (XE_FAN_PWM_FULL_SPEED) to pwmN_enable calls
> xe_hwmon_set_user_fan_pwm(..., U8_MAX, true), which sets
> fi->is_full_speed = true while keeping fi->pwm_enable_mode set to
> XE_FAN_PWM_MANUAL_USER_TABLE.  Because the write guards in
> xe_hwmon_set_user_fan_pwm(), xe_hwmon_pwm_auto_point_temp_store() and
> xe_hwmon_pwm_auto_point_pwm_store() only check fi->pwm_enable_mode !=
> XE_FAN_PWM_MANUAL_USER_TABLE and do not check fi->is_full_speed, writes
> to these attributes succeed when pwmN_enable is 0 instead of failing
> with -EINVAL.
this shall be addressed
>
