Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE273B71A5
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 23:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786662854; cv=fail; b=rWxuEiQyr5J47gqu7h+nciErMfQ5SRwpUzGQDxVQK73XmwLhrhLs2ueZEfCz+sOOhzjCfha0lbneXbA6W+iqFlE5p+jJ33mHrt8u9OAzO63k0kGjC9ABqsm7DUinTyNGwRfpsZzscN5z29dl/g4IyxJJ08Vb88yGq/mQ1MsURXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786662854; c=relaxed/simple;
	bh=nKDL+Mz7ixGtnhdTlTVpjykjXjNEHeLtiZ2VDJrqxpA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z0zkd0P2RkhqG/5j7OjuxDo+FhEOp5VUzd4ihN73yLo0fU6U2b5FkbXfal8eABboRUBpUeS2fvVZm8HifdovBGC+yXLkXtbxbQuZ+XT+Np11PrKMeTAUN3/Am+KlXz2ydmLwNtxc44jmxnhLaMcbc2h6QBq0DU31pgS5mZCNr0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RuDDjTBT; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuDDjTBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786662852; x=1818198852;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nKDL+Mz7ixGtnhdTlTVpjykjXjNEHeLtiZ2VDJrqxpA=;
  b=RuDDjTBTnNaGQ2m9GUVQRqka/io7o4cHdTHAwf5qDHVRWULBZVJlHq/K
   9aJVZ9qgLj1akQ4kIs0CGvfp5MELrVMWfy7Sge1sbaduJCDKORxGWrkVD
   6Il8EDdHOtpIIN+Y7kJv4dhae4lCTlpc/z2YUxdCZDFxzVvdbfy2XVqLd
   CaKlxRClRAtwopKDqIuZGcQB/6P6Wlqh/Eifv6wodiaX5PnYOM7jTcrGg
   yqfn69BOp1xIifDBykamWaUKBsMRIg8htZx6xjuu9s7FOANlsfNC0lyb6
   yQ8KpYgwKATpVt6LZuY2on2OiqKMGAH5qBMiIwbv8c45KGuatzj8urq3W
   w==;
X-CSE-ConnectionGUID: M1yGkC2tTbSvElqRiVdHqg==
X-CSE-MsgGUID: 7B2Zoq64QoOz7t8DDU2CzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="104632334"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="104632334"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 16:14:11 -0700
X-CSE-ConnectionGUID: l/xEUsobT9qnRDnbWMAQvA==
X-CSE-MsgGUID: iD9Uc8bPS+uMHkvX6Fku8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="263626956"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 16:14:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 16:14:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 16:14:11 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 16:14:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJakjxcVBYGb1LLQIBq2RBnzo6YLgZDgieWT48Lr1GJWiwfTnb/krgPztcmGOLYb6Zk/N5ZN4W6ncaW/DE+LRbvvqzpeHpEwKcozlwa0PzyRErhJWpMhL0TdEWnSBKvmJ+vwvdsXCTVRHPamNLKGpGcu3ij9s+1qWDvxaTH5XF6EQqi7nZ6956MXDk/fGKOkdHRVxywy+YynAG9Aktsi5tZRivcPZwdygQQoFH/PMGXW8PX+G+QvPhKcMF8Eg1693Gtk78DHkOcT8/R7K/36gFbRJvqbdjYS/GF5VmwJ/5xOYCZ0PQZqmn9kvX+L0f2wm9PfHM3eJyZZLx7J4kc6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irqMaYL6XbsooQ2cbyL/fcD59MpsgUBVyAgRu9TGlNU=;
 b=pd4dBNJ0bmfvzeWIfJEc0IYFqOZIUwRHNvrb4p1Zce+KQRB4Z4qhaxTlbLtn+E10H59ol3XFv7yecOw3QzsOcpGAWAyTUpAho1S1cAQisnV18p8RhFEOPKVRzWfqJAgSo04Pw3UGNz502y+mtdeFCxk6Wcelp22WLXyZKB/0l8Iiqpr4tRCWZGU70hoNN9RjvS7qQulA8YiEO+4Fp8/hV2M0UL/8zp3jKI2EATWWutFFZjMyzn8Axx3g6LqAzL2/NH7eZ4mfrIKpFKrWRRTZ+0nuTFCgtwnFRGb/nPZweJ98pCyXBqplQp5hzj8/aTiFw4opviVLg4e2WUnBtZEVTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by DM6PR11MB4705.namprd11.prod.outlook.com
 (2603:10b6:5:2a9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 23:14:09 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f%8]) with mapi id 15.21.0270.017; Thu, 13 Aug 2026
 23:14:09 +0000
Message-ID: <f6d8a075-1561-43b8-8386-8f4bd4fcee13@intel.com>
Date: Thu, 13 Aug 2026 16:14:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/xe/forcewake: enable configurable delayed
 forcewake release
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-5-zongyao.bai@intel.com>
 <20260813001804.CF26C1F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <20260813001804.CF26C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::29) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|DM6PR11MB4705:EE_
X-MS-Office365-Filtering-Correlation-Id: e84eec55-1745-4225-b299-08def9909454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|5023799004|10067099003|4143699003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: FseKYNzqWMSWHiXcV2hTUuc9/+EPhNlsO6S3FvQ0vGL2mTq0Hscnu1Rupr51U4XnzS5TYLmD84HndFBaBnBwF6uZGNYCDDtL4iUxdUejT2cvfZmqx0msJhewHlW3tfcjDMv21BNy9UJaacYQq+APKOv2nLsapKEOX2tJHZzZd6aq3Iz5sw5ozoR1Zh3/wS43iC5TU3tueWU62rT7gEbMEmlwQSM9Ea4gv3vOf7FP6hTMdPWC8jGf0ktlpk4c+1P6rpqAkaQt9VSbZubIFjeNXdDFQUZ5jNS4Lc6hSTsKbhkLszTYrMGW0DiRBejGOhSU0ZZgS2hQ0kO8h5gEGj7gexV+UMUqHGsqnpUG22VY1E8JeM9ntPn3/sJIRc/cAE1qvQOEK3/NlTu9f0HzfOSEHI1mxkvDosjnFRWUqt9MdQzTGxTbY626nmJzPWk0coYol78HxNi8O6fGS0d1dYQFrF85CtQwMGghsco9sNobEYM+diLoq3xXeJz4qaiW+odyvOEkHv3TPhNDgMfg4DaykM9hdBMgAVm/R8fBLiZEQOdLdMU+mmEm97b7B9JOkkCY6cCFxs7s8fIEBS0CPpnKk2ywmNC3S4cXMaiJXJ8xKNpwwRDg5JZJDEeFiRk0eJOKXA/sc0doeCxKqpo0rmNTM9tc/xCafvlYTPvz1iSfV2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF46B98A11D.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(5023799004)(10067099003)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WldoV2Q0TnBEZVFwUkRETjc3THp5S3paNzNVbVhzc1djc2tuWEluMmxxaldK?=
 =?utf-8?B?T3lQSElJSDFaUjNadFIzakdZL3lkQXdOVWliR3M1SXJnZ0hxNkJ4enVWU3o3?=
 =?utf-8?B?enVwMnUrZGVjU0taekhkRHJGNHhMcjNFOFE2ZU5XU0RNZWp6cVRORS82RkU3?=
 =?utf-8?B?WExEakxncXIrOU54Q1FKZktrL2dUL3c5cGlTMzlML0hkOHhkR1VmV1JjTVQ2?=
 =?utf-8?B?bTBFZjNINFlHNTVURHJmNjkxbjF5VlhwVzlGaTN6Q25yZkFiYk5rVDJuemdS?=
 =?utf-8?B?UGt5SkpvSk9aK3dBRFNBcEkxa2paUFV0Mng5T1NENEF1eWJVMkY5dWVyOHEz?=
 =?utf-8?B?MDBjREVIMmdMQzdYamp0d1lJaHVsOVNkT0djczI5Z2VpMDFOMm5hNjBqdjFR?=
 =?utf-8?B?bjhvRHhUN3JrcjVvRjV0bXZHNVJ5LzhiU0ROc1Q1a0d3QW1YVlcxNjQrUlFv?=
 =?utf-8?B?YzM3WC8xaVgyczY4ajR6cjB0ekZBN1VnV1N4bTMwN3ltWHZ2dERPeksxOUxN?=
 =?utf-8?B?c21ldXphWUh5WnE5MVNhT01Ea2sxVUVMMEJMY3h4UWJ1UWY2NlNMUVI1VUNC?=
 =?utf-8?B?Q0JrNTVxMFVVSkFUemI0WnFaMk5lb3hyeU9jU1dRTFRZd0twNDQ1d0x3MzNM?=
 =?utf-8?B?eVpDbzRGUWJUeDY3YmJkZzBwd1hKMGZNMjZzU2E0NUlydXUvaTRWTHJKQ0hR?=
 =?utf-8?B?YXdkeXQwdldqRTU5d2VtMitTb1R3YUZhdEFTT1BnQkl6eDdETmNmaTIvdW4z?=
 =?utf-8?B?WFpNWjRCOXJ2dThtcHp0bzNWS3V2WkF6b0VQYXRLSVBkc0QwTkIzR25wUGhD?=
 =?utf-8?B?eE9IaWRFT21VUEYwSE1YbTVGcEZaSng3aUIwWi9kK3MvRGxLdXdQT1V0NzR3?=
 =?utf-8?B?aU9hNFJ2WHU2NjVFWmx0dFErYTA2Rjh2NlhHNGtEZFFyb2ZidzdybWRLRU5P?=
 =?utf-8?B?S2xEeWs3RDdyOUJWTzBaaW5QWDgzWVRpd1BpQ04wTXpJMmUwNXUyMnAwT3Js?=
 =?utf-8?B?K0NtR1ZTZUQwQnEySGZNelZHeTlITTVrejBLU1J0bzA4RW5GaWJ2NHA3U3NC?=
 =?utf-8?B?SStBNzNrWDhmZU8ya1hPTnZlQWZaeHNQYXpMOWZlL0RDVGZjMnAxY1Z1M2Ni?=
 =?utf-8?B?VjNHek4wN1FETW1LaUh4bUE2eGhTYjhCZUFVTmh4ZXJ6Zjk3S1VJVGlubDZZ?=
 =?utf-8?B?QTUyNEJMNkN4WU1COTN3aUVXNDV6aEh6R243NDl2SGVyMXNnN01EWXBpUXR1?=
 =?utf-8?B?UG5SOS9yWW4zdVlzek5ISXI2SEZja0tFMmFPVUR5RFQrR0s0ZkRFT043Sk5k?=
 =?utf-8?B?SzV6cFVXaE82enpNZk5NakJPK3JTUHlXUHNxNWxDT1Zub2F4bUo5L2lyTENE?=
 =?utf-8?B?UWVqSk5ZS1ljblI5eHZSMW5mNjV5WDhnRSs0WnpTallNZnJGakVKd0dlUjVh?=
 =?utf-8?B?MERwOHo3UThjT1ZOTmwvZ1R2Sm4wNTJFakZaNW1zaEJVd1pzOWYxSHJ3b3BR?=
 =?utf-8?B?T2lQbXFZdXpYQlNCUDJjUEhNcVFUbTVRUWd0OXlmd2RZeG5xK2EzRVRDWVRC?=
 =?utf-8?B?SGp6V0tlcWV2NURuTjY1c281UXowRlRlUXhtQnlmNEtkTDZnMmYzeE9BcUdT?=
 =?utf-8?B?NmtuOFNvVytnQUREeHhpRm90TTlsNGh2UzNHdmxTRXBzY015QVlqSzlhQ01N?=
 =?utf-8?B?czRSeVlwR3hSUVdtVmxHQmFYdTlhazVlNHE0ZVVYWFNUZGZNQzFoR3Y0QXkw?=
 =?utf-8?B?SG5WcHFzRHRFU3VmeExmOGJKcWdncHZ5b0FERnJSaHM4MkxzSW50Rnh6QU8z?=
 =?utf-8?B?MC9sVEx0WWFNaTh6RHg1WjMwdnBvR1lLTWNqM2ZDZzg0YklzTVRySjBiNHRH?=
 =?utf-8?B?YTQ5UTlxWGs3WVlSeHBrK2pkenNDMjVnTkVibjA2c0ltMXp2aFZSQStxT1Qr?=
 =?utf-8?B?b1lucnpDbUdaQ2g5RDU1NUZmRVBFZUJlOHhmMTNKNFBsY09NT2NkT2FnVjV0?=
 =?utf-8?B?NEZ3ZkgyWDN5VzZEelNzNVFDMVB2QVB6Wk9oV2RHQjNhTGhIOUdKYmdXNTV2?=
 =?utf-8?B?Q1dJUzdCZGcrRFhCcVFPQ3h3MXRRWmNWYmIyT2twSG9NSWFJLzdsQ3k3aStk?=
 =?utf-8?B?bnp4SnZQL08xNStzc0RTb3ZmL1FuYjdrTEVQajhTNk1PbHpTazNRQkFDcjNS?=
 =?utf-8?B?ejVOVUZLbWozampLOXJZaWJXWkorbFJFSVdRZDNhR3FlQlIrUnVFVFJoT0RN?=
 =?utf-8?B?R2lXZm14YjlBeUVERFdTL1B6Qm04TGJVMGxpQUFyaktpZDl5TExlMjZBRlRQ?=
 =?utf-8?B?eVdqQTIwSTBPKzVSaEJrSndNcGlZSE9hM2JYVTQwaGc4YlBvS0U3UT09?=
X-Exchange-RoutingPolicyChecked: VET8s+xWtjLHoiBAc8WdFYfeC+vcCGEqB6WtIROXRIpgfXcJdcgttnCIpfFiHT4DxSxfIErlER6F8YnqE+nVGMxMceNqHDvURcaasKdyZUJdFd8F1/uuKf6Agi0qVFs34r7PFbo00AFccV2b4Uv5gv/aiE4yUyyIO73E433O0c8ns4G5+ifg+fSsQSB8BCaZbwgecMlBNRFQ4D4xxR1WT50IW+I5ljPKm0JARAF20GeZB0WnmWAsG3WpUnFdALUsjhno5UiRaBhvaefCWGnl4Tb/3jKvdf2uK/wFYGYFcKkxaMrJrpH8KvsV870Wj4Bm1y+zfn20xspiLtkup82QGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e84eec55-1745-4225-b299-08def9909454
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 23:14:09.4094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERFFy06DF2SgjGe9moYqUpyJHIKLwh0dzLQNqtjA1Ww2c0lYxU4lQbc+SziZaHuCY0ngmhhmd0bBZud657L46A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
X-OriginatorOrg: intel.com


On 8/12/2026 5:18 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The function `query_engine_cycles` mixes goto-based error handling with scope-based cleanup macros.
> --
>
> --- Patch [4]: [PATCH v5 4/4] drm/xe/forcewake: enable configurable delayed forcewake release ---
> commit 7d3e5746e331fb4da88407a96b40b25e06abf763
> Author: Zongyao Bai <zongyao.bai@intel.com>
>
> drm/xe/forcewake: enable configurable delayed forcewake release
>
> This commit introduces a configurable delayed forcewake release for
> engine-cycle queries to avoid repeated wake and ACK cycles during bursts.
> It adds a configfs attribute to control the hold interval before releasing
> an idle forcewake domain.
>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -168,7 +168,7 @@ query_engine_cycles(struct xe_device *xe,
>>   
>>   	fw_domain = xe_hw_engine_to_fw_domain(hwe);
>>   
>> -	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
>> +	xe_with_force_wake_delay(fw_ref, gt_to_fw(gt), fw_domain) {
>>   		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain)) {
>>   			err = -EIO;
>>   			goto out;
> [Severity: Low]
> Does this code mix goto-based error handling with scope-based cleanup macros?
>
> According to the cleanup subsystem guidelines, the expectation is that usage of
> goto and cleanup helpers is never mixed in the same function.
>
> The function query_engine_cycles() uses goto out; for manual drm_dev_exit()
> cleanup while simultaneously using the xe_with_force_wake_delay() macro, which
> internally uses the scope-based CLASS() cleanup macro. While jumping out of the
> loop block correctly invokes the scope destructor here without causing a
> double-free or resource leak, it violates the subsystem structural guidelines
> against mixing these cleanup styles.

Yes, I agree this is code style issue,
this function contains both a goto out and the 
xe_with_force_wake_delay() scope macro.
And this issue is introduced by path [PATCH v5 1/4], but not in this patch.

It may need split query_engine_cycles to two to avoid goto.
Since this appears to be more of a coding style preference,
I'd like to wait for consensus from other reviewers before updating it.

