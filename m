Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960CB5218B5
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985342; cv=fail; b=c9b4dYBHOCbzZ7xWxfY4I6iHkANcutjvQNgbKy0LEqPM2d85YrFYdVAlpriT2fJxYBUoaGqeNehFgv6IRniec70nT8vLcAGqgJohZWET34sUAxSfmZqqoDA3lw8jKiW7Mc5J4M8u8MIUGlMG0q2q5gunU+cF84hUPdl81TIjNS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985342; c=relaxed/simple;
	bh=vq4fB+SnqYbacyoL1g85+00CuOg5q8WytkIySdhzDEE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dS/VlxulyGS2SrbMGOSpIdW9FVE7hLKa9Qo5AP6C0FMNAXetsoTGoVimznGgAbtb4eXjycg93X10F7DCqQgyhGtaCE5cx04nvN1z2I2R8OiwqCa9cIQVJUwKZaDsEn+K7RKhPbgfU3pIA6TTQECmq+ttmgItWGsQ1wpWhBXh5iI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwpU+NH2; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwpU+NH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791985340; x=1823521340;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=vq4fB+SnqYbacyoL1g85+00CuOg5q8WytkIySdhzDEE=;
  b=UwpU+NH2Y5KXYOt85j8vKxJ77xZQa1gxMvHF19J5FBgvv/3CgRW1hZaY
   E/uurzJ5cQHTaARVexpWXB02/UnJvkgAz9cXx/AJBQsVuG3GDT/pEi/G/
   eZMDOFlIF1oezRnmPi+gwdftXNabe7h00HedebHmVhspo+yrNUOqJt8HF
   K5DFSgxpV6s2735doWUU4ACjEqSHdg/pTiuz+fJQ6M6u1FfDBNDJj6vCN
   z32QSM/xUB07FE6jp/TI7lZfl1fT9i6O/bOPNaUHePT+CMK8Zc1mxkzqg
   7wYlPYZsWodn1mT4fx44vZjlLvzqXbt0N4kVB6pUOqLf8ej/x7X5QpLEy
   Q==;
X-CSE-ConnectionGUID: i1y3MUdnQamjCK9eL3IGOQ==
X-CSE-MsgGUID: issER/bSTlaH6j10qa+cIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="616706"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="616706"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 06:42:20 -0700
X-CSE-ConnectionGUID: o/NZMzUlSLSb2wiZDLmfgQ==
X-CSE-MsgGUID: x2c3uvpTRjqj8uc5TIZl3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1538418"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 06:42:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 06:42:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 06:42:19 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 06:42:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0XqWTQ96SHfrLE1oiQat+Ub+5D21jokjdF0xoD3pIvhmWkXiWhAKmmiB4+sq4lRcRQK3OzdkT54fMJ5RrKYD69PUR+SRu2j5wlTFRluDCgB8NCaITmgMhsBqOScENdbkIIBfvQB3mvzvJLM5xQn3nX42utBs5SEGGU7zAdZkn24x1TeagX/2tg5I/0oD8se+NRmoQ5AL0i8z7PBTaaAH+5xc/mp/eIIrcnk6YEIdAupzmLgH8i9tY8xyaOrmNeOmefUtIGXYClsb4Obx9IZRU5dLFgRrfb/RKCb682T/0HmASLcT1EIABFMYdmWnBYia5Igl2e1Lo/df5dy1tHUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgataE58GBtcuOXyT27iuGIvR3HFyG/KaE6ciw/MSuY=;
 b=y6iaqWcZritPJobjjEcPwADM2qCMKjJoOPPmzD6PHHTnwCQoGWx2LzC6trRExyz80ONrZh7Th1VLCHFpvoliSfkOzc39Xep32R2wT7Z9cc2SJxXwRRkf9BvnVKZOiMXUxAH5PBQgNQRAnI05eTxsCIQmMGK5+E4RFXJnNjCDgbmpzWFoYYoKJoeMOrNDS2lKURiGnQQ2K55MYbE22eqbl6qXcrmbzzFGzGqMA+3TSSMAz+FA87wU1DVJprqCnkqWTLOUdoAHPif8RVAPuwQf3q8oeapL7M176p43s2gAU+3sy5SR2KWH1CLnROCZkbicsbM+Deowz65KhnBRegIWIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by SJ5PPF8F93806F5.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::845) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 13:42:16 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 13:42:16 +0000
Message-ID: <bcaceb82-a306-482b-875d-237e43e24644@intel.com>
Date: Wed, 14 Oct 2026 19:12:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 03/16] drm/xe/hwmon: Fix thermal sensor data handling
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
 <20261014115806.831459-4-karthik.poosa@intel.com>
 <sashiko-outbox-171260@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-171260@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0183.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::13) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|SJ5PPF8F93806F5:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dcf9fc9-9846-484b-d278-08df29f8f5a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|18002099003|22082099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: oakokoaO4s36jv6SZQ/FFaRuEybvHtW2ZH43OfUaZrLo5OL/RjsCJ/HE46quI+R8eyFBO+uKSlCEXY7I+6a4+9RdLXhKgpaV1u+Z7eSq6pNNw0ih6XsnmnY99vNZBSeuAazASg/TW5qpb0mnujowLbOLIeOfrNVd4GroMtBUIcjSkThr09H3oEEeHa/nQC67a4x38SixyMGUvrBD7x737FlF00PtOfqwKasbfDPBKqBuCGJdW0yOi6oyiWR13GqCA82DOIz9XBPtSFo/oeynW15MewqP8VGVMXFqzKrv9cBUuSYBAD+dngxo3PJmR40Llf2M1NtVjRA6t3FbZXeXD/V3Sgvrg4aEam4ZYIehGEmGub1t/zUlUO6oP8opZ8xfmqYktcBlgmody4H/at+OXbmDtoowGJfJPsU/HawJZdIVIhHQSnt1WXyCUVt2gRm7jU9Q2u+rimo/7U9zkABbrCYUoxbUG+5qJeR7yZfYxPLMDv3TF/exeK32gPnF+1RyYQAvgx1/+rhH9rJdXfefPiuKxIW2ukjdFep3D1fIhZ/KJXd/QazEzU6ZzZTVe4IVvpCaaDjyZlIAXkGJxYf8/7uHgpF1wHMwh+Gtwo+lCJxUfT+f+rbelyPqDTC7n3CraW6C9frTmJACe1wCwNhZGLMxfrmYp8w4GuBOdODptAk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXNRbG13MC9GYm1KRStrUmwyTVZiSjdvK2xPc0dxeEVpYndDSElkU1VFUE5N?=
 =?utf-8?B?TXBaQ045Z2ZTQUxYTlJ6bHZFRTMyNjVIVXpScG15UkM2YnZJMUtsWHVTNGZs?=
 =?utf-8?B?bnJmMzF2bmEzME53enhhd1E2b29Uck9Gbmw1STkrOFNheEd2SGlXa1dhR2tF?=
 =?utf-8?B?bitCS2phcmgxeWQ3akFsUE1lYkpldG5Xeit5eFNtTVZuK0RGN2ZoNmhTNUhn?=
 =?utf-8?B?VTUxNEhpMVJkZDU3MHFMZmhKZjA2ckFONitrQmdVeE1IVW95ekNlN21JU0xQ?=
 =?utf-8?B?eWhMUzNKRUUwbm1hdGZlTVdqemIwVTZyUDNtSWp5STRtVHF3OURCbTBKZW1X?=
 =?utf-8?B?b0J1Yjg5aStPZUloMGtKek8xOERsV0s1Ylhjck1JeFJtd3FPZm5KbWJ2d1Vr?=
 =?utf-8?B?RnpEWHpmRkZYWk9CSnZwYks5bkdxQ0lITlVYN2o3Y3k2OVhXTGdCMDhqUlZ6?=
 =?utf-8?B?RHZZOURtTDV6ckdRcEdrK21IT2hIUXNsdFQxam55WlBHbGJpZ000eUF1SVVJ?=
 =?utf-8?B?WnNPOTR4Z29oc0FxOVN0M2toTFdvSUcrM1J1bFIyM0I3VkFxN2NLQzJneXkw?=
 =?utf-8?B?c1dtRS9Jd0xRWjhrMmZ3MnY1Yk1EZG0xZG9KS0ZkdUVVV1NGbHp3Q3NyR3dM?=
 =?utf-8?B?OUtuUTNCR1pZeHV5QTdaYUFyWG9OQ2ZTbU5WbkgzRUZIVHUvODRXWDNQWmFu?=
 =?utf-8?B?WXpQd2RyRENNcjIwUUM1ek9iSkRqSEVpb0MxaXVHaEVmZVg0cUdTaWVJQlpz?=
 =?utf-8?B?NU9MRXlWYml0QytLNk1lcnpzUUJVaFFOeTE5bGhyN2xYMXVPWmtUVWRtdldE?=
 =?utf-8?B?SE9BNDBtUWZINkxoWjBRczNKS2RZLy9wZ3NKaUhvV3BKc2ljRWgzOTNjKzI0?=
 =?utf-8?B?NnBIZFJYVHh2YlIzcHhYSFU3UzNJNTdnZVJueTFzRWExZHQ4Y3FVb2pDZlh4?=
 =?utf-8?B?Wm5rQ3hxaE5udFMzYTV2aC9DeEhVYy9FbVJQaUNNTGdjZ0FJWDVQWHFBL2JX?=
 =?utf-8?B?ZUFFR29IQkJEY1JmZ0J1Z1VRZHlJN3NnMHRId1IwZVFnNVZlSk9oaDBwd0Rr?=
 =?utf-8?B?eURCWmhGcGd6azhqbTNPdStEL1ViQUxVQm9QY3BtWHhvM3d1VW1xQXdmQUtB?=
 =?utf-8?B?YWlsUlZhcWtKN25qM2FhTkxrdWhhRzROZC9zVE5mVVlqMWR1N0ltRExuUnlj?=
 =?utf-8?B?TjRPai8rQjgzTldHaWhkMmxBbDJub1pSYkRoZDlhK3pDVGd4dWdXWGZsNzhu?=
 =?utf-8?B?cEt0eDFoYjBWRlZsMUxySWxzOC8xSi9SUll6VVJZbzA3djZtWDR1ZE9yZWJj?=
 =?utf-8?B?UUlGdVVibmd3ckRyNUV1eDRnN3dIVW16TXpyQ0svOGdubFUxckd0MTZJZjdL?=
 =?utf-8?B?ZEFvSmVsVTdKSUx3ZHgyUlRBM2Y5MS9pbkdXWnc1eTAzZzVaUHljc3JDMlpi?=
 =?utf-8?B?L1BRbXd0WVBGVEc5UHJKQTA1SmNwOTVJVEFtUmcxMjBnTEkzNGUwTHoySVB2?=
 =?utf-8?B?cHZqS1BOSkxSUFY4VEphbXBaOTZucVRuYk9hMGxSMzVTLzZjSjI0MVgxS0Yv?=
 =?utf-8?B?VE9XMlZBaGVINmdBS2VFVEUzQzJQWWd3K0xXeWpZbTFRR3k5RXhEMTJhN2hN?=
 =?utf-8?B?a2tqd1BIaVhkYkRLdENsUTB5Yko0M1BrdXl1MEhxYkdtVTZKYjFhQzlkV2lD?=
 =?utf-8?B?LzB5WjZ6TGdZbHhUT1JDd2phTnFGQ1VvUGp4anAzVnI1anAwM2FpbTZKRFRC?=
 =?utf-8?B?c2s4YTNwVWN1LzcrTENSeFVyNGVsRERTWURDVHpuR01QVjIxcTEvSWFJcUdi?=
 =?utf-8?B?WkE5allCS01kZGk1SmxzWUJqc1B5bEs0VTZVQ0tsVGFncCtDeDBCMUpWU05v?=
 =?utf-8?B?T3Noem5GYy96QjRzV216amgxdEExQktFazRnRTVmd09aQkw0RnFScG5HUlZ6?=
 =?utf-8?B?ZW9UQzVGcHRmYUJjV1A2cm5YdkN5aTBTWitXQTJSSWFuSzJoNkVPakY3NHVX?=
 =?utf-8?B?TWkzQTBRZHVQV2JXNUV3bit2YmRwbzJxNDB1VGJGMzNWZC8yc0loZUdPZU5T?=
 =?utf-8?B?dVg3bnRCMEV0L21VbmVTY1BBSjd2RzRjYVFLUGMwTzlONm9yWWRhWW1qVUwx?=
 =?utf-8?B?YzlIaEFCZXJnZjJxTWV4MUl3MWRaT0x1QzBLSyttUFc0ZjYwT2Y3NlpTN011?=
 =?utf-8?B?SHBSbFlSakdCay8vYWdBWC9GcGwrTktXcVZ1OU9wdDV2RXl5b0IyVTE4Vmc1?=
 =?utf-8?B?NTc5ZFBSMDBsZjE3MHczamNxdzd4aXBuZWZJbUt0UnlWczlJVnZyWGhTdmxa?=
 =?utf-8?B?S0xkUW9DbU1iaHZuZ1JGcmZMQnN6bTFwcXB1bjE0SmljNnprQWFwQT09?=
X-Exchange-RoutingPolicyChecked: AORozLhkuOcFDgvBuVE67/KPPN//58TiYStsudxyjX4FwvkbhRpLFavbq9r/g7bc7/qGxYKIGxQRT7e/PVgqYZ7pcG/WyhwhTdHPDafSm7qwlXS5VY7oJYBt5ODkQ35NGtG5vxdopjQN94W7OO9zNamJ7dZZH5Wmi3OtfUqXNI+5QVeneGoiBnRJVks2q378Mkn4wXTARZ3WEOBOCKEIAoRgvTdMyImhlQMOy+Vi9Vo8lyWGKe144/V4BrVxL9zYSfokYWgLhzLSESN1whZSyP23GR1okMtIfAjob1nVz86YJ4lB7TbR757yvAY7isZEQL9NCCUHBXMxfWhvX6E9WQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcf9fc9-9846-484b-d278-08df29f8f5a0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 13:42:16.2633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IL7L1GXlDqTY4nC9QdoHkKjIUF1+h/wSqhTBYYV5ogHBhjuiz+2a0ZrO6l/uJRlcjO4ew8oYFlS7s1oMfq1t0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8F93806F5
X-OriginatorOrg: intel.com


On 14-10-2026 17:46, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] hwmon: Subsystem API Violation - Driver uses private custom mutex instead of hwmon_lock()
> --
>
> commit 5b607ffd1e7d970e08aa24f25b6f029c27e76b6d
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Fix thermal sensor data handling
>
> This commit reads required thermal groups in get_mc_temp() and stores them
> in a dword-aligned buffer, avoiding unaligned pcode accesses. It also stores
> the pcode thermal data and thermal limit words as little-endian.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 382bf9625a8bd..1b4efbf4ac999 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> @@ -840,16 +845,20 @@ static int mbx_temp_decode(u8 value)
>>   static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> -	u32 *dword = (u32 *)hwmon->temp.value;
>>   	s32 average = 0;
>>   	int ret, i;
>>   
>> -	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
>> +	guard(mutex)(&hwmon->hwmon_lock);
> [Severity: Low]
> Does this violate the hardware monitoring subsystem locking requirements?
>
> The hwmon subsystem documentation states that drivers implementing locking
> required for interrupt handling or for attributes registered by any other
> means must use the hwmon_lock() and hwmon_unlock() APIs.
>
> Can we use the hwmon subsystem's locking API here instead of the
> driver-specific hwmon_lock mutex?

The mutex here protects driver-internal concurrent accesses and does not 
provide synchronization required by the hwmon core callbacks.

Therefore, I don't believe this falls under the case requiring 
hwmon_lock() / hwmon_unlock().

@rodrigo, can you share your comment on this.

>> +
>> +	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
