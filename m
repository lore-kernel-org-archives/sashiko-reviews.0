Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92AA3C9EE4
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 05:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791609277; cv=fail; b=EiZl098/PxUg+b6IdEef+TMvzx+kh/CNUTxrM2J3WNRmkrj3nwep/OsVLzx5V7IhKx8RtOSpgcpNG+FiZMPTbLRD14OLekRFUayB2RxZUe2aKxfBf6nJzw4vvOgyfQ2SZoAegaYl6Qxq4DBsOB+Q0E5+d8A/PWhalAjqkPX9h/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791609277; c=relaxed/simple;
	bh=elKJHarFqyRhbMnGnoWTp53YpEA7Wvz1qMorkkCI1Zk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IfbCF9IqUDqBqhnWu6PwOhEVu9NZl+ePfr0hXL8Od5nobTHr5gcoe0St5YmaJCpXe+wL9MQhrIexL13lNL6EpetmSw3rbHZ8HU3wNBDt9ot/0GgxWyQROHNQrn06Yyh5yUm6hr88xMm+VUX1RH25xkMv4DCRAvIs0bfrXO9qSpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7wwkXza; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7wwkXza"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791609265; x=1823145265;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=elKJHarFqyRhbMnGnoWTp53YpEA7Wvz1qMorkkCI1Zk=;
  b=l7wwkXzah7yflKy6IzGzyoyxgvM7BdMqNnvc7Ym3Wv8ZEGkZ2Eqkpyn/
   Me8Cj/B+p/hI+cDGCMySN0LP9bhDZ65MDo2z2dc1s+Terf6ib1t4H4fHm
   xfeaIjqiioYXEfLjMpdYLY8UhQMHk2kDIcZ3zS/bZJFc6YypY3o3jaAuB
   hMAKYxq5mxtK/NgqDx1HaxOjkQwk6CeD7vWoUBEv6P6wTFVIFkJvvydHb
   0dX+EO0Tuet9VNQFefny5sH4Y1WKCIKgGVd5qjij0yu1ZmVXkksFdwUYc
   1787do03SoPhyRGrCoharMb8FsCWqOfWM/jQsvKdz56mzDCMfuzv6fup+
   w==;
X-CSE-ConnectionGUID: CsJxVLoUS5q5fAuBxxzYdA==
X-CSE-MsgGUID: xv4MsvO1Tn26djV/7UXrhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="413974"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="413974"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 22:14:23 -0700
X-CSE-ConnectionGUID: /N3WvX65TEqhsN8IlT9pow==
X-CSE-MsgGUID: o7H8eF5gSlK8XqxXley8CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="434155"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 22:14:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 22:14:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 22:14:21 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 22:14:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNXTuCtgZFIaFDJ0lKqhvOOuPy78TegdZ3jOopqNtl2R9CZc/4BEncK0MX+idTFx/2hrac//MGEma/0C64if2XZ5PJ2QQg93BqHauc8wYIoUfQi8AXM/+N4TD2pmP/NXaBn7CgSOu3halTlIei8pXSQUBig2PK66AC0qiGDApifrj9MCSI+uHYLg2OxhS5hmvCLPR3Vr+TluC8zTIpqGxHrogaFYAnPO2ge/+B6bDidvvuT5ZD0MemwMNn/tkFlgd+wNdooevSLm3yqAw5JLyqUVeEKEravm9BWgcHVNFDWDsblDx6eiJUglWbJRR9V/sQ8Yga0aAnaE3rW6W3z71g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gng0M/s+H19s/RbwLiBJtZyXgCYxdFUy9Pw8hPbQ2iE=;
 b=FVCs7CcGSPpXxnhy3PuCznzB0KyxaFg7vXW6zG/7K+Ku38Dt7lXEpKcrDQPYklBKfJSmdUg4NjyLOdbLHLuXJkBes9V3xcEmOGYJN1dJm72RruGC2KylKco2S9Z7nSeuS8E68H2fkwi1S1K9+yAtorspTzxQIZ8IUZbGrx1nInptGhFPIw/nkEGbEAlPXOZ5g0cxeuQJ+eTHz6T9Mg3xECEMIXwL3FxNkGkKL5o+7FcvfnZxjaQ4UKmzMzadIOLZ8dsueElIl6HFbBe9phwhgmwR31TM0jRNAXLMQamjx+QJceyXl0RUkPf0/LdppUkC7N5PptpZxniXZnPsaeh8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by DS7PR11MB9449.namprd11.prod.outlook.com
 (2603:10b6:8:266::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Sat, 10 Oct
 2026 05:14:12 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 05:14:12 +0000
Message-ID: <e597a6a2-bcd3-4945-9f50-0b38f8e6dde1@intel.com>
Date: Sat, 10 Oct 2026 10:44:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/14] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261009120335.52973-1-karthik.poosa@intel.com>
 <20261009120335.52973-2-karthik.poosa@intel.com>
 <sashiko-outbox-165502@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-165502@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0306.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::18) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|DS7PR11MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e35418c-5237-4f69-5a82-08df268d523a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|261009223027099003|5023799004|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: hd5KzP6L5tSweE1yQ/Hk0nRGg6x1+3A5rHMocIB7cPz+lA6GgsYe1iLtliOPtIIgHvqPPvpecOV5l6qtVBqWbLU4Y7z1BLBIchfy4a/cttctxrVYPBy/nYFYT+NQMK+axuhGpvQSdR2cgmSBHS7Wf6e56V+5FsBuHtoLHZO9mCijknULiqLndt+uT+BipRp3BMbI1p1Cre5yr2shgZ12Wq0bFc9IXHBwz0HSLIOyDEjHNldKirVk2lv0Li2YRXeQUZWRfeTY/KVsZPwn0EA95W95OZ1gOUiMN52WnRuSF6SU9kiwVjAM3M0vj9DwPup/v47lhgb+P5USB7JlU40aM92ECtcEpAZmHjSXHEPt0iCv9fsnKzaKJ1b9MvVSa/7WcLBLoj4Mmjft5kCMbALGO7+sAIkwtV4OChZWFzhHtokuWZjyc2itwOLIyLGrq9aE8mbqpNrMyPIQNtU7glq8Ahj9LQR2WIIOvEyKiuOz9rQJtQd2IcCJ6sIs/YEGvTw8tQU92SUkiW7eSMzOMa4ZuUn3UAAmxjXYSrMRV6RgPVNeJ8A/b5M8ZqXWWt3ivp9X48znFsk5r6fG3qyDv6FVusQspXMWv3LXU4rI7gUZppXMtYiqrZJZ/2+jF0ENQ5h7jR7xF6MuY03WqQtfMtjIBdGi41SAKrnbqUMauJOgt7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261009223027099003)(5023799004)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGxvQitHZ2p0ajRISVlENmp5YXhubW1WT3hrVURFQlVtUC9kd3JUaGU4UC9k?=
 =?utf-8?B?OUtrWlJZd2hFMG9QbmJpNm9MaDBySUtaSUlLTnBnQVd1T0FRNnN1VlV3Nkhx?=
 =?utf-8?B?VlQzL3BSWDFHTjU3UExDUDhIRjhUbUIyNWhvU2NGSnpQM2F2clE3eWkzTWdt?=
 =?utf-8?B?MVRVZm4rZnJWNFNkZnJQd0RCL1crRzBHZWxZQ0FYa1kvTjAzaCt5QjRRRGhs?=
 =?utf-8?B?S0RuUHNMUHJqOHdTQUxGOGVqSEtCUUZZeTZvVUFGMVo2d1Z4aGtuUGM4djJS?=
 =?utf-8?B?eHBGNUllRkxOZFdvdlVDdU9TR3Y5cEwzRXg0S1RDcWFaRWxPSkpmWjFCWWdi?=
 =?utf-8?B?eFJVMUJqNnpabUh2bStoSG1GYTllRDBhYTd1TlRWRWdXencyekRHUENtdmpp?=
 =?utf-8?B?RjZCMStHTGJodVZldTVTVHhaWUVsZ09BNTFmOFIvL0oyZzJ6NnJ5Skhoc1Ar?=
 =?utf-8?B?ZkNNWkdTZjBDL2I2QktEU3BhTnQyaEx3QUY1RmdCeS9ldmgzYnlLWCtsM3Bz?=
 =?utf-8?B?bE9ORy9icEliV3BvSjRFNi82TEJVRS9TZFdIRGgwNXJsdmFPa09qWmhDZ2Rk?=
 =?utf-8?B?TnNMM1ZncVc4eUMwZ2VXYWhST2R0RU1UMFVwRE81UEZwdVJHRUtucm1ERlpL?=
 =?utf-8?B?QXdXYU1ZV2dmdWhOTlZFRWIrNG9mUlc4blorMEYxQ1AwSVNqUUd0S1hrT05r?=
 =?utf-8?B?SVlQTlY3WmVFVEYycXUvQ01ZOUNJREdScVE3TTFHMk9Ma0hjdkg0Smg0T2xr?=
 =?utf-8?B?OWErK2Y5Y2hJRzVSTzFmZ2FiN3JMcGtOUEYwdWxxalB3cEFwN0NZcmNDSndi?=
 =?utf-8?B?akJLZXNESGhCQjA5N1BVTGt4Q2hDTFNaWWYvVExGY1JobTFBank4dzM1bFZ1?=
 =?utf-8?B?cTFGUFYwb0tJQmRJWGg1dHlYQUhoWEpzM3YwR21VcmcrV1hHNlh6THdNR2RD?=
 =?utf-8?B?djhYc1QrQUU1eE5DRnlzRExYajg0Um90Tk1PMFZYam84eGJ1UkZ6VmlNQVc5?=
 =?utf-8?B?YUZUMHpJMGwzWDg1d2lnT2hIb0lHdzE0MDlGNU95OTNEc2lpTm4xeGFSd0lj?=
 =?utf-8?B?cjFGd3o0anNKSGF1LzNPc3JNeDR3ZG0wM0hjemFnTlJBazBQcTdMTVdQTWVT?=
 =?utf-8?B?ZklHenhhdTVFVEpCTTVYcTFZYVIybmdGbWpOR0JLR0RheTVGdDRkWjFZb2Qy?=
 =?utf-8?B?REk2Yy9NdlhHYVhRTzV1N3pkc0dqRDN4WjNIUjdXemV1OGhXekRMOU9pMVNQ?=
 =?utf-8?B?L0RjekVhb3Nwd2tXT3JhQlFLMlZ0a1JtNXNvWFhvdzVBTHlreDJLWXNiZEpu?=
 =?utf-8?B?TjZzcTVJbklwZ3ZOL0pkbHVseFVqY200YTFmN1lEK21LS1l1cGNxMzE4L2h3?=
 =?utf-8?B?bFRrQ0VDSnZxd0pzdHNEWXdiSlhmM2Eybk1TYTZXTlhqMHF6ZDZNYW1vRXB4?=
 =?utf-8?B?SzVPNE00QzNXSW1MTHdCUGlsQ1FzVVpqSUtwR3BmYVU5c1pmeXN1eEljN3Rq?=
 =?utf-8?B?MTNGU21LbnBKcWFSUGJENlZVYThydkdhSE9wVTN0Mi8rTnRpU2VOWFptbFVF?=
 =?utf-8?B?NS9kdDJtQWxhV0VUeldzQ3hhZFdCbFg4dnZaUVZXTmluSFdBanpsK0h6YTV5?=
 =?utf-8?B?bDRLL1lWSHZKQXMvcm1VMGlOd0IrclpvTnozdE1CWHRzbmhrUDVGemM3Y2ND?=
 =?utf-8?B?NlpCQmJVMlRKTm1GSzJIb2hXN2JUb0hFc2VVS0RVYmljUWw5TzUzZndWQTcr?=
 =?utf-8?B?eGJSRDZHMEdqeVhwTHVrR2swaS9yUUlaRWN1aEFzRCtEWU1mTW5sa2VPL3VS?=
 =?utf-8?B?bmJyc2JhNktZenRocFVac24wOTlXTDdYbDIyVFhaVnJha2gvQWdMeElmN3Zw?=
 =?utf-8?B?TFp1ZmswQTJON0NnckcveW1BQ3h2Ly9YZTlKbU5uVTVVd3lQMWJDSXpMV3NL?=
 =?utf-8?B?QlBwRm5MVldTdmV4Z2tVQzJoYXFTUG5HMkpySS80aklqbmVuWVZObC9INEE5?=
 =?utf-8?B?Q3dDeXhkcHg5dGpjQ1RMeGJHV2RaTXFDY1BNYTFZUkxSb3BLS29iYk5CM3g2?=
 =?utf-8?B?M2UyaGd0L1g1UWpYbnNVS3hONWhybHdJYkp6eWVKWWt1MzhGZGxQVWdnUXV0?=
 =?utf-8?B?VjNQbFdqMStwdUJCbHpMcDdwQ1BIZ0Nvb1kyeGZrK3FZcjMwYUV0NmFlN0t0?=
 =?utf-8?B?dUVEaGdNYnMyc0Y1L3B6YVJxQW8xZno1TnUrelhKc1B5VDE4a0dDMDJPbkY5?=
 =?utf-8?B?TjNYYU5zSlRkQ2VoYkQzeUIxZ3pEeVRCdEZEK2lyUTM0UWFJRU5ZQVBUQyt0?=
 =?utf-8?B?VkZkeU5qa3NDdU9QdzdnYnZuOUNyVmIyUzhHd3o0ajNhSXA4N1VoUT09?=
X-Exchange-RoutingPolicyChecked: yHqQs8yIGXsw4GXKV2Y+YAwTNwOVZbhac5p8tYzrrbTcv8glm6/lKnf/r3Q9o7ks4sTG5bgax7EcXviMvZaDACgSHoI7oB0X5mjkdJMtptRpr36DVV5WHRlSEZ5Gax3LbCbVNAJJbxvEx28r3uh3x7M+E5Cp5omDYqfwofVk50OhAjgZeNP0G6758SsuDUBC0DMXErxweXi0I77Idgo6CaX+wmb/IuLiEVuLVf4hZGJRUITvA85rxz9oAamyrV/yg9UXU7GlKkobSDVKvTLc9+cHQ0L8+3NtessQOS9d1fh7yeQz0tpP8Uc75FzKK6iCj4GvQq23KNEQdPpM4yGjDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e35418c-5237-4f69-5a82-08df268d523a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 05:14:12.2704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4nsiyQWdldwlANKSEqud66OFPaHWKfrDldaiLVmuYhU/S+9OQPDP81OLwQjJg7Fjmgki3+fhX+vAtSVlyQhZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9449
X-OriginatorOrg: intel.com


On 09-10-2026 17:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] drm/xe/hwmon: unchecked return value from xe_hwmon_pcode_rmw_power_limit()
> - [Medium] hwmon: ignored pcode read errors fabricate valid sysfs responses
> --
>
> commit 6cc9575a02c32b9a8a28e257650ff7b17698865f
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Handle pcode read failures of xe_hwmon_pcode_rmw_power_limit
>
> This commit adds a return on read failures inside
> xe_hwmon_pcode_rmw_power_limit and updates callers to avoid updating
> power limit settings with invalid data.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 5edeac961ec33..9884e06f83e59 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -232,9 +232,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>>   						  READ_PSYSGPU_POWER_LIMIT :
>>   						  READ_PACKAGE_POWER_LIMIT,
>>   						  prepare_power_limit_param2(hwmon)), &val0, &val1);
>> -	if (ret)
>> -		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>> +	if (ret) {
>> +		drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>>   			channel, val0, val1, ret);
>> +		return ret;
>> +	}
> [Severity: Medium]
> Since this function now returns early on error, skipping the subsequent PCODE
> writes, could this cause regressions in xe_hwmon_get_preregistration_info?
>
> In xe_hwmon_get_preregistration_info, there are four calls to this function
> that ignore the return value. If these initialization writes fail, the
> function still sets hwmon->boot_power_limit_read = true.
>
> Setting this flag alters the subcommand used for later reads, changing it from
> READ_PL_FROM_FW to READ_PL_FROM_PCODE. Could this cause userspace to receive
> incorrect power limit values if the initial writes were aborted?
>
> [ ... ]

No, This won't cause a regression.

boot_power_limit_read is set only after all four READ_PL_FROM_FW reads 
succeed. Later PCODE failures don't change the cached pl1_on_boot and 
pl2_on_boot values.

If the RMW read fails, nothing is written. If the write fails, PCODE 
doesn't apply it. Either way, PCODE keeps the firmware defaults.
>> @@ -394,7 +396,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>>   		if (hwmon->xe->info.has_mbx_power_limits) {
>>   			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>>   				PWR_ATTR_TO_STR(attr), channel);
>> -			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
>> +			ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
>> +			if (ret)
>> +				goto unlock;
>>   			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
> .
> [Severity: Medium]
> Is it intentional that the return value of xe_hwmon_pcode_read_power_limit is
> discarded right after checking the write failure?
>
> If this read fails due to a hardware timeout, it could leave reg_val
> uninitialized or zeroed, bypassing the disable verification check that follows.
>
> Additionally, could the ignored read errors in xe_hwmon_power_max_read
> fabricate valid sysfs responses? If xe_hwmon_pcode_read_power_limit fails in
> that function, it returns fake 0 readings instead of propagating the hardware
> error, which might mislead userspace tools into believing the power limit is
> disabled.
Valid points, but they're unrelated to this patch. this shall be handled 
in separate patch series.
