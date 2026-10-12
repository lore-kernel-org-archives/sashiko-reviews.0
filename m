Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D42623D2B1
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 11:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803374; cv=fail; b=EqETYyNCSlkh4tSFc3qgc+SMhcFChBKQue2cwfKXyGDIxURkLC5UX03OVbKoJyiodRG3Ouka2o7v4et9TwUijoJAZI1EUi88IfVi+cE/RpzuUTV8nS6Nwc2grAI+iN9fzvPdntDA2axWFLvoW1jlOL5Kio201M2AKnISdqfpQ2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803374; c=relaxed/simple;
	bh=rmZYoF60YSJvoAij8oGrX9g6/x6NwiqfCp0Qa00e9ZE=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WmVC1W0+XKXX4JIzbzeSeSQFCqLkzUZ085NnHSyQo0J3KaFVQs6s1blvJJQ0snw5s9vk4J602aBz3DVo/X8ocDxnx7oDRMq+qqgfXj1/xbeNKpUicvR4OfvocbAg6f+GR13Lq6x9+ua+mYyRM3JEi/wy3VupxcAIAqT96C3jR0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kb7IfUL7; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kb7IfUL7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791803372; x=1823339372;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rmZYoF60YSJvoAij8oGrX9g6/x6NwiqfCp0Qa00e9ZE=;
  b=Kb7IfUL7GMCDqZuF5dBzbBdlDepwJiteNN0VEq8ENQ3UCT2Irb2xRS//
   GIX+MRwI4Br4brYjI3v9JozK7BqJWNvs/n43lSmlYxK5hTvkqBtwJsbm1
   kCz9oM2Lrz4+1RDQsV1pStrLgV7ujjKqXGjf2NQ1FUZuX+B1bG4ioCUu/
   7cyUt0/e5Xc8z4pQhAoa+WyraAlntJQOzocL9p/wNk62nygMOiw1mJFcC
   7mHapInpcvd7ElRaH7eRZAtxuLG1e5SVGk0qsIqa1RVCJjrCBpTBOFk9m
   gTtTvNVVPtq9Ig+yr0Vq5xCL45DWbanA3OxqpIdodE2YIHI2l7Fd5DV3N
   g==;
X-CSE-ConnectionGUID: xBDQRJcOQnGHB6HUGaWkdA==
X-CSE-MsgGUID: CoMoLtx/Tfq85TBPC1fZ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="617097"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="617097"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:09:31 -0700
X-CSE-ConnectionGUID: 8Gj/XYtfSyOLW3uvkR6WxA==
X-CSE-MsgGUID: Fk9SwkgkRQW82xVwH2cV9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="806871"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:09:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:09:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 04:09:29 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ngw9zZPNzhysVRnkndw2J+vS4aCOOFeEW3MroZl2qpyyDJKwjYK0LKi5laDid2d7gASGaisRz8iIvWAgnT7C0ghSio6vJ59D9l1gYugeMfvI30KjNHPxMEfuQAbie85PfCEKwv/SXZ6QjukhIMwuINLIGCf9/Rp55oFsznLTDqe6q+CcLCymoTpSs7kxg0meDCIyvZHdKWiIjLbmElQDRbte3mMRmZjC4gf2+rqSTOP/F2felN531CTtszfR+JkuUw9FNgAXVHfkEXi9sutJF7ZyHi6fGp0KZVggb4O33h5UDqSSSCEbFliAlqJYGj7qv3oNunQkItS7hZTzjsnE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSJqlvV2gs4z/uMqxAI8OeYtP2LDSeuP0epn+2M1z4I=;
 b=RQT+9nRIErMmrxwZX3sgoLVsYrIX/v2VJUNxKSNA9A6I3SOP/DkIgv3jQyWCMCEBR3yqMypFC4D7LyLVdczDI9VVV/Y1SNihVzNT5c2JVhdqVbSnWThMpbQhu+Ox0jGaAis8L0QIhYO6pn3XL8eCHVYRHLrb1UFEoAK9EkuXy9T+blvmbJYxBZ1v7gfpGbXe/ZSD2irqZ+nASYEkXM/MbLc3WQFtMTVC2eP7yPOglYOH1kvwNC8dJCIrxA8ruL4E+9NqPANLM4n9ez6KKn7kXTli2HwNczFW6Paa3IZlIskSyr0glRtRLr3dL/B8gbOyhUusrZZmZUtZnmneX96Gww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by MW6PR11MB8368.namprd11.prod.outlook.com
 (2603:10b6:303:246::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 11:09:27 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 11:09:27 +0000
Message-ID: <d3672dc6-ff87-4f16-8262-ee4a87b83d11@intel.com>
Date: Mon, 12 Oct 2026 16:39:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/14] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261009120335.52973-1-karthik.poosa@intel.com>
 <20261009120335.52973-2-karthik.poosa@intel.com>
 <sashiko-outbox-165502@kernel.org>
 <e597a6a2-bcd3-4945-9f50-0b38f8e6dde1@intel.com>
Content-Language: en-US
In-Reply-To: <e597a6a2-bcd3-4945-9f50-0b38f8e6dde1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::6) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|MW6PR11MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f5dfb5-0732-42bc-ed4c-08df285147c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|261009223027099003|4143699003|5023799004|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: s6iSWG0drZXfYwHele+0QsSf1p74oUPzJ8uwMyEADdt9gx9uWsR8tlTtWxf6Q20IhpqVWB0I3e+m3i/kNqwz+uKDSfjOvUg5eDOWzn1TMMoegkepTMclaGrIVJpZ7ydAvPR7SG2raOkzKOfU6/FtaAoMDYJjnybUL5comCq7yVZCvhpbAZijk/dK5/w3mDPrxxBn1zaPnTdspN3/BqUVQGzNp6SkA1WZWs46+UW09hnxOr8Vl6WXTOUIBdbPrVHKncAfNYw6ItCcwZhqn8O8WDq/4xlKw9Q9fEk+H4JY1T+5G3EX8oClWt398ROAhwG7wl+dv1YdHozm6RAR5LHkinVhYMRrZ+9lvK+HMG1vmQHWvb0LCSQu/sSoqpQIz11jWyFxeTS5nPQJnfz1nsv2VSOMcuVL0FWHij3YMXo8tJsRMMyK3ct3QA8spcPr8W996YzYLFfP+/cXD4giEJlFLrACHb2s8PYXvEcQoO6M8lxuUq0BBu17xj3wBSUZ6EVqXw84iFn4ZbYNChLFmMDx2+pJ/+obN/sbuuo49FXjU0XaaefCjJhxoJeoDWiiOQV0P+uGNcv2k2IaG6wX3f3lW8gXEgzqZa0X3AmxyF3RI60=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(261009223027099003)(4143699003)(5023799004)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0dTOE03ZXZ3cGxmcHNRNnpvTzBLRXhPdmxIME9LMGJZWi9SWTMwUEQveWFW?=
 =?utf-8?B?NG1ZZEZoN21RNFo0K3hkaWZoZEZDQVVmWThVWGswVmg2WWlyQkxwRDlvSmFY?=
 =?utf-8?B?N0xYUWljUjlnQjFpbmM0V1hUdmk0RERJRG92Vndtb1dDa1oxdFZNMzBnUUp3?=
 =?utf-8?B?bXhlYzBoUDY0blNzU1hvd1pmU1JsRnhrU2FYUHlBT0owTG9aRGUvODBHMk1C?=
 =?utf-8?B?RThEOWRhNzZ3SWQyTDJLRDJxdXR2elovS0xscWhiajUvVTdFRE5oSWRGWm9S?=
 =?utf-8?B?WG9RRmQ0ZzhpWGtXMXBTUVUvUkQ2aWdiWHZZS016MTdEUEhmY0JYdTRBdDJr?=
 =?utf-8?B?T1I0Wjd2OVZ5NVcyNFRwaDlDcmpxbmF4TlA3S0Q2R1JqVXZ4T3c3azFvTytR?=
 =?utf-8?B?b0NLY3lhcEVUMmJ6UmtkaDU3dnJicjVQei9vQldPV2hsb0tENlB1MWJ6ODBn?=
 =?utf-8?B?SDdGSnF0b0NQZjd0eExPbG5yMEhrODRpdUhZSXlod2JFQ1lRdTZ6UzYxUGxw?=
 =?utf-8?B?Y1UrV2tvbDI0UEFpUTdIYXE3bmJuUlZhU3pCYWhFeldYNXo5aTdpMTZDSTF0?=
 =?utf-8?B?M0diaDRUN1lIUXlqNDVTZG5NZHNFLzJyaG9YQVJwM2pUSUx3VW9SKzJkVGJQ?=
 =?utf-8?B?akRSYW5NNjBreVdockh3a1FQaEZ3MldRclMrZmZqS1R5eVNQMVd2YWExZEpK?=
 =?utf-8?B?L2VKOG9ieTU1MDZ1K0VkanlWWUJHWXhjS1N1R05SMTRHM3M0aGpJdGNIbHpH?=
 =?utf-8?B?eWlZZzMvdU4ydUtyQXRmZXFROStPa3VSSVFUenBLd3ZTbTdUL2xaVWF4TzBG?=
 =?utf-8?B?SGNkN0JTYlZOcE93YVpWcUpXdUUwc1Z0dkZDSFE1UFlhcGxxU1FwN1hFaVkx?=
 =?utf-8?B?eHVMOHF2TVNwQ0NIYXZpc3BRRFlNV1J4cUtaZHNwc0NoM3lZN3dINjB2aDR6?=
 =?utf-8?B?ZVhLNXlCSkNRUWYxVzBJaWh6VGdYV1M0ekdUeUphWU5hdUJGVzNCa1hFaVFa?=
 =?utf-8?B?cU8zcnRTRlVJUjRiRkxzbk04RUxCcXZiS3dXZjgyZVI0ZDBhdDB6UFJHdGlO?=
 =?utf-8?B?TGV4UDZKaEhiOHhXa2V0dGdNZGpvbzFCMlhCUTljUFh4eTlvM2E0ajZPMTJp?=
 =?utf-8?B?aWV6TnZxdmZIMlhVZGZTYTdnYk5yTXdrR1JNTmF1WGxOTk0rbVNpNG9YWThM?=
 =?utf-8?B?TjFEdzN4ekdKZy84MWFzdXZXNlE2b29kcm1acjRNR1BsWFZ2dnlMNHdwQU16?=
 =?utf-8?B?ZmJaVzdpTUpBR3Vtb3BpeEVEQkR3dTBnY1dMVGl3UGtkZGxHL1RNWG5XV29y?=
 =?utf-8?B?T2hzK2M0ZG5SZVNOQ0Y0ZjRkYzlBV2oyaVdPa0R4dUdYcUc0QU9mcE13TlRQ?=
 =?utf-8?B?aXlBdFNrenk4WXdUY1F5bS9KRlhDaWsxcnVJRk90bmh2VmV5bFJ2QkMzYnZt?=
 =?utf-8?B?dmhRbThLaVVicGJudVhuS3NhM3R1S05aMHFVTFJMUkVZZlFzOXhmNnVNRnVU?=
 =?utf-8?B?UDdKOTFVaUdJT1hiV0RRNTNyckxReXd3eHZGa0lJZ1czRlE1ZExJMHloNXla?=
 =?utf-8?B?WlI3OGpBdFVNdjBUWkFhMXBuK3ZYbTQ2SDlVeUwrWGFlV2ZXdmJnbVkzbkRQ?=
 =?utf-8?B?SVA4a3E1L0kwT25RNmJlOWI4Nyt6L014Q3MvbndTYU5VbDZQVHNja1JrRTJm?=
 =?utf-8?B?VEs5MnkzOU8xYzU5TUtZc0g4RFJXTUVUcXNaL3hZTXZES1RjdGkzRXBHZWpr?=
 =?utf-8?B?QU5QUVpwQmJqQkdmSmQ5ZnBSc2dBT2xyUmU3WWgxZXJDTGg3V1l1VjZ2Q3M3?=
 =?utf-8?B?V2MrV2p2blpCUUFIaGdWbHBGSFFoYW9lTWhPS3NuQkFGaXdESUVxKzBVVlg2?=
 =?utf-8?B?bEhkb3daa0pTY1Y2TDRpV0ROK1JTYnBUMkd6NnhVZVptQWlSdDJQelRqZjgy?=
 =?utf-8?B?RCs0VkUxOFhpWGorQ3JBZEZtcnFwUGJiU3FtSlJJWVBJN0g1REk2SDBsT3FQ?=
 =?utf-8?B?YTBoaGNLemtzUVJmTzlBUFU1VFU5TGp1NGtsNTRtYXI0Q0MrQWhvam1hYkJy?=
 =?utf-8?B?V3dONWcvOFVoTy9iTDFVb0lkU2FWQXQrelA3bG5hd2RrcmpVOGxQUjJZY1o5?=
 =?utf-8?B?bGJXbktERWhzbFRJL0RHNm05Q0R3V0ZNMnl5SGdMYndSaTZubjI2R21Vb2Zv?=
 =?utf-8?B?NW5LQWRPMWhuVmhhM2pFR2ZkY0dzTW9QWkZzcmFuWUFRejRFSWQ2UWZmS1J3?=
 =?utf-8?B?N2dFdUZrQlMxdk9uSmowMzRvc2FMcFRJOGJJcThnYkdqZUM4MStHd1ZWb1F5?=
 =?utf-8?B?S0pPZmk1M3N4SGhtZEk3TUVVT1lsQ013TSt1a1h5ZkRFZzlobmhudz09?=
X-Exchange-RoutingPolicyChecked: XKHk5gHCR7mI6kq3a2DjaZH9Jzuwtr2FWVYT4AWRTD2kZULt6hW0vBG/sRbqZqDvotVZFVdVZF0PSu0gR1enFJ2tSyDHFwpSXgTsft5EXqk5wnM+XqglTDJrefVW3E+r6P1d44vSTfoS01Ax7MnHOtRJQPKchFrepqSpTT76q/3CmL/oW0jOh1p6tWRvM81MMsoAXtKNr2DW6aP1KS+XVcwk2L7yvj0elklLtCxJKGAjUxrzHMmTlu8ye4Jr3LoCr34wZI6/36ZXKSIsrV7j2F6RhuF8VaogiB4ilW3MJWAIb+a4BMWP5NIyGAXKZcObdnOxOalYwLgFaApoj+2nWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f5dfb5-0732-42bc-ed4c-08df285147c2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:09:27.2159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NmAV7YrOG9HljUBWQ89LXj8ZE2qAEVhdqVwXKux6RM8WQRYYKZ9BgDJhEKWWtOoo8Kz66iL5GVb1oXCOUg14g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8368
X-OriginatorOrg: intel.com


On 10-10-2026 10:44, Poosa, Karthik wrote:
>
> On 09-10-2026 17:44, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential 
>> issue(s) to consider:
>> - [Medium] drm/xe/hwmon: unchecked return value from 
>> xe_hwmon_pcode_rmw_power_limit()
>> - [Medium] hwmon: ignored pcode read errors fabricate valid sysfs 
>> responses
>> -- 
>>
>> commit 6cc9575a02c32b9a8a28e257650ff7b17698865f
>> Author: Karthik Poosa <karthik.poosa@intel.com>
>>
>> drm/xe/hwmon: Handle pcode read failures of 
>> xe_hwmon_pcode_rmw_power_limit
>>
>> This commit adds a return on read failures inside
>> xe_hwmon_pcode_rmw_power_limit and updates callers to avoid updating
>> power limit settings with invalid data.
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 5edeac961ec33..9884e06f83e59 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -232,9 +232,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const 
>>> struct xe_hwmon *hwmon, u32 attr
>>>                             READ_PSYSGPU_POWER_LIMIT :
>>>                             READ_PACKAGE_POWER_LIMIT,
>>> prepare_power_limit_param2(hwmon)), &val0, &val1);
>>> -    if (ret)
>>> -        drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, 
>>> val1 0x%08x, ret %d\n",
>>> +    if (ret) {
>>> +        drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, 
>>> val1 0x%08x, ret %d\n",
>>>               channel, val0, val1, ret);
>>> +        return ret;
>>> +    }
>> [Severity: Medium]
>> Since this function now returns early on error, skipping the 
>> subsequent PCODE
>> writes, could this cause regressions in 
>> xe_hwmon_get_preregistration_info?
>>
>> In xe_hwmon_get_preregistration_info, there are four calls to this 
>> function
>> that ignore the return value. If these initialization writes fail, the
>> function still sets hwmon->boot_power_limit_read = true.
>>
>> Setting this flag alters the subcommand used for later reads, 
>> changing it from
>> READ_PL_FROM_FW to READ_PL_FROM_PCODE. Could this cause userspace to 
>> receive
>> incorrect power limit values if the initial writes were aborted?
>>
>> [ ... ]
>
> No, This won't cause a regression.
>
> boot_power_limit_read is set only after all four READ_PL_FROM_FW reads 
> succeed. Later PCODE failures don't change the cached pl1_on_boot and 
> pl2_on_boot values.
>
> If the RMW read fails, nothing is written. If the write fails, PCODE 
> doesn't apply it. Either way, PCODE keeps the firmware defaults.
>>> @@ -394,7 +396,9 @@ static int xe_hwmon_power_max_write(struct 
>>> xe_hwmon *hwmon, u32 attr, int channe
>>>           if (hwmon->xe->info.has_mbx_power_limits) {
>>>               drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>>>                   PWR_ATTR_TO_STR(attr), channel);
>>> -            xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, 
>>> PWR_LIM_EN, 0);
>>> +            ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, 
>>> channel, PWR_LIM_EN, 0);
>>> +            if (ret)
>>> +                goto unlock;
>>>               xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, 
>>> &reg_val);
>> .
>> [Severity: Medium]
>> Is it intentional that the return value of 
>> xe_hwmon_pcode_read_power_limit is
>> discarded right after checking the write failure?
>>
>> If this read fails due to a hardware timeout, it could leave reg_val
>> uninitialized or zeroed, bypassing the disable verification check 
>> that follows.
>>
>> Additionally, could the ignored read errors in xe_hwmon_power_max_read
>> fabricate valid sysfs responses? If xe_hwmon_pcode_read_power_limit 
>> fails in
>> that function, it returns fake 0 readings instead of propagating the 
>> hardware
>> error, which might mislead userspace tools into believing the power 
>> limit is
>> disabled.
> Valid points, but they're unrelated to this patch. this shall be 
> handled in separate patch series.
Raised this patch for this 
https://patchwork.freedesktop.org/patch/759383/?series=175943&rev=1
