Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D6A19644B
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 23:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792108370; cv=fail; b=D+gvikqU3b5AQZNhadYyNZWCgmUFQ4xienAR7ErPCj/YPQTsH50BXm75XD+RHLKBFH2/bQuOMluD4zpOWuUifjI6AaMYrTbZg6P/hKUhZUM9uDlr2d9SQQ19ojsKwQdKulECFsKZWpSve47zm5rKY8pBS6XjA9SNc1BxRau4bCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792108370; c=relaxed/simple;
	bh=1fKEV+2d5ONZtU1qSoK2CRQfzXGWewWxuKJaYgy84q4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GIXPByALbA7hMBpmyRHGNqdX1NrKzAw1akFE04QHxC7nD2kH7acFI5ixG3cWdHnyrWyyigsHDFBjoQcfOY3TNwdrx1i13G2KY40xR92Dze+H4WWylqPu0OCgmi61B6K+co/X3gF0rkH/J42LmcavSzsP3R92PoHOjUkVaktjoB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HV95XePP; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HV95XePP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792108369; x=1823644369;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=1fKEV+2d5ONZtU1qSoK2CRQfzXGWewWxuKJaYgy84q4=;
  b=HV95XePPZJHTibB78cJwytCFbCAq1xL4GdLzQPi5CF1EGWpctNFABAZl
   a8fmRJCE8aAqh/YdP/BZj9nIoHZ7waYga4BY/EJdyRKpfv0xpGzKjKEqP
   V/g3n2B6Ivd8CPyAdtfs3n122LnLpn19z4jfO64hElWulQKNSrc6BBLDw
   Pmgbs4GTBhudTKsiAuwSBlUAS+NlNx214oKpO0yCafr8vw2WNczH0FF5m
   LBG5mI8NshascINEmlUejHaYWO5vyKKfqclZR7hVV/M3NRb55rMB4u3X7
   U5RETVhGZbrGmaN33sX21VyJ0wduubvLdHbgUYZVKGDNdzek/beJpI/39
   Q==;
X-CSE-ConnectionGUID: S/8XdOd8Qf6J5tP0IdJqmg==
X-CSE-MsgGUID: FmJmZiG5QD6bA5IIvHsS0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="994756"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="994756"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 16:52:48 -0700
X-CSE-ConnectionGUID: Im3yfDrXStm4FPmCIkpYVw==
X-CSE-MsgGUID: 0c7em/3ZRhmoPqYLTmS0GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1748304"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 16:52:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 16:52:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 16:52:47 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 16:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtJ6OCmedzoAxJynDvkGrmriJ+y0Nt2zMoGwDMLQ9t11JCiI+MyLfhKPg9Ep+gFDOxDL/O7JHUI4BgyDPujZgBJdnk4abxFR1hRDOtXGwJrDUV5d3xRNzqud9YGHKlOGKG3qFLs6+4kjQrhGkBycgk71UkLCeacmEFeRe0hbgya6jgOT9PIqeVj5JsS77oT8dALFag1qtAoYEtYEhdICJsvxxWPW7YgITJ0blMWs99SqK5RJFB+ot7briAK33tgwo9NxOrQgd0udyOnjh5Ozw2/Hu66XgNkcOUZBfAN7kVh+2qfkGtyqakb2hec8LsgTgAXPr3q64dfKN+ACp0aKNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5w6mpWnCOVec63pMGDmEGLf84RyU4v1rNCumHV5cz+o=;
 b=cHWdepbrNJJVE1SoWisShFJt0vM/nIJBPV5gMXpnbsJ5IqYFaIILGOsdzGRCXSoUMxaF5KJFaAVGbPKoeybi45201BVkCEGQnmbEFm4VJE84e7k+TnMS1Q7g/bSAESx0b9FWMmOXJWxSuF1+Yu+/oEtb5wiAtyaywysrw50yRVFM3PSEME7GVExlXiTww2uI9jhefWgYqMQviNchCbHDkQGMfMIsXDJR1fHe4P0rc3gPUES49QeksOk6g/U05Hrndr96SD83guFyFEesn5GTLpK4w3DdvXr8W2y9pG1CoIj9qBY6xTSAjN9vinKE8ozFC1bC3mvqpbha/LFEinokHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22)
 by DM3PPF195D11F0C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 23:52:40 +0000
Received: from CY8PR11MB7746.namprd11.prod.outlook.com
 ([fe80::6545:a2cb:36ec:1510]) by CY8PR11MB7746.namprd11.prod.outlook.com
 ([fe80::6545:a2cb:36ec:1510%3]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 23:52:40 +0000
Message-ID: <7d145ffb-4614-417b-97d8-b6bdde6197b3@intel.com>
Date: Thu, 15 Oct 2026 16:52:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Access MMIO after pcode init
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
 <20261015165451.154495-7-vinay.belgaumkar@intel.com>
 <sashiko-outbox-173473@kernel.org>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <sashiko-outbox-173473@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::35) To CY8PR11MB7746.namprd11.prod.outlook.com
 (2603:10b6:930:86::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7746:EE_|DM3PPF195D11F0C:EE_
X-MS-Office365-Filtering-Correlation-Id: f22296f5-8bd3-447c-5ac6-08df2b1765e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|22082099003|10067099003|18002099003|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: XtW1QM6FOcUZ15Tn8WCo5sD7a9c8PsjjVMKLqypq34AeUhelFMZAg1MVwA2BXrW6IOLTzRCGwlbBOJCxqk1eYNSv9Jbb0zh7RnbP++KIrc2Y+fneyp6r75Qdy/V1PNOz1Ha6uX7IbbU7kNi3vAKh5unWMjWfkmV2bcVAZ1+BtUkHJyU4EwWjsRVOJZY3kuzsJEu1kgJ5fyAI/lZcykkUMkMtmA9oY9kM6fZ3+hDz3Jhlialk/LNbpyeeXwSanxvjeYVLzssQtPvwo5IybwCNn0ueyrRMjbxG2W0z8icr9x3DQAAJe0aFz3CuEn6JDfQL0ol/DrayDwBQNE1nndjdYduXc2KOGKPmIWApxuETc/qI1SozPmqF2rZAKQ9/EEx/qA8a7q1XHirOx+Dv2QMVs9RLXZepxZT3sRDmo/D7U+yjQphmct7wZDriwxu8XHM3LQMK7/eoVdK4qGdDdeX6GET4YcbL4TadsIJtTNH96WN0h4xWKsTZOSzo2gzNMcYHKpwwtd1xjpCmGGN2VBA+LDBxUzH32op24FHti2Rgy1cnyqpzVZ5oG0ASkpuGTScC/bTuu3skHVAUeEJc3p8ueTzwP+OqBxEFwxwDDKWom8h7PTf6vEQ2uBYJ1FpB2rr0hjdV+w6sdJLOnk4opihm7rV9RtQgpqFw1n5HUEWl+Sg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7746.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(22082099003)(10067099003)(18002099003)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXdFVmduZThZL1J1eVNIQmEvSUNYWjg4NHkrM2NDVmRXNnNOL3pmQjdzTEhF?=
 =?utf-8?B?Q0tGUnU2VnNZeHdUV1dYUU4rTWpFYVdsMkJNR1FvdEk3SUVKMW11bnRXVENi?=
 =?utf-8?B?cWtkS1MweThoN2dDZDdMUitHK252NEEzRTJwYWRvb3Q2ZUJ0ellDRUVnSVJp?=
 =?utf-8?B?Y1VoM2xBOHRpRE1Cb0dyNDgrdjVDQ3Y4RXBjQkwxZENmdEdFbXc2Yjd1Wm9k?=
 =?utf-8?B?UVQySWUrOFBzSW5wY05SS1YrY1picnoza1VPZzBPWHFRZ1MwT2xsbVFsY0tI?=
 =?utf-8?B?ZUdiREhXbnZmOGd0SlBJMEVxNFZiU1R5SUtMVEJxQUlwUGV5RmhIeE1MWFhF?=
 =?utf-8?B?MWozWktOVmpsaGRzalFjSkYvNmZKdHJZMkN5ZEhJSzRQMHBIY1krNURrNVMv?=
 =?utf-8?B?T05QV2tQUVJLK2RRMnZzcmpWSFFrb2s4RXZnVmg4WU9BWWN4alF6NjBlMnFD?=
 =?utf-8?B?N0hxeUIyUVg0dVAxSE9hUXhqNDBoL0VwUkpmSGJUdzJqeDh1eG8zU01RTm4w?=
 =?utf-8?B?TWZBY0t3M3RVdXgyRnlZM2lBT0pmYUdQWllCR3hRVlR5R256ZHFJUGdjUjVC?=
 =?utf-8?B?ZXpXRkE1MXhZUDB0SVdFWlZJZC9TRnc3UEdsUmFJcEE1NlFuTFE3dkdhcWcz?=
 =?utf-8?B?Rng1SmlDQlE1UFllZ21nZ1ZnYk5ObStJZEpXK1kyeld4U3I4d0RBTFh4SEs4?=
 =?utf-8?B?U2Y5Y2hUdVg3TTZxalJaSUQ4a0dHYmJLTld5NFc4a1ZpMWYzNkZwOUF0ek15?=
 =?utf-8?B?SmxUNWdIMGxNUmtFU05LWFZQcE5Tb3lVYkM3akhNRmtLMWRtUkJlWkU5MTQ4?=
 =?utf-8?B?dTFnZ3ByY2szK1l6a3owYk82eWM5dlQvVnZISHdXUkVQYUQrNXd3UWVzZjJD?=
 =?utf-8?B?TVRtTlQ5cXBjWGxodmRrUWNYOVRZS1kxTkVnU0ZNWnZLUVVPSFFaV1lUbWNz?=
 =?utf-8?B?eG1MSmgwTWJ5cyt1RXJzTkdzNjdHK1dlbnh2MzhWdVlVOExJM2lPUWdQeCtI?=
 =?utf-8?B?MzFzclEwZHZoQzNiMWNFSWdMRzkyUS9IdVZ6cjFkRW52VXhNbmdUM0JBbkdQ?=
 =?utf-8?B?TlpHNm5xaklNanB4a1dTZ1dSMkdPS3VSYUpEMWtRQk0zRUVjUUU4UjZETmE0?=
 =?utf-8?B?VS84SHBMZk4wZ0NDYUJyNktLUlluM0VFNjFsWFB5UWN3ZnJZcm1wOTdOZnZR?=
 =?utf-8?B?bVBNM2JWcUp3ZThFcCszMEFRS2VxTFBwbXNHOW9MUHNJcjN4cExaUGxuZ0tx?=
 =?utf-8?B?MDlSRmhUV0NCUWduak03S05Ubm1kZldWN3EwSHc1M2ZKZjBFd1F1YzJLRE5h?=
 =?utf-8?B?UGN5S0VxV1F4Ui9IRnNlZkdDVXNBTzYybjJYRmhzMlJsbnd2cGxRdnZIbys4?=
 =?utf-8?B?a3hNMGdVV1RjT09GODhIempBMGhDcWxVVHNZVk0xK1RHV05JNEdnaUpTWEl4?=
 =?utf-8?B?Kyt4eEdLWTZnR3A2eDRoTVBUZDFZUjBsWWRLNk5MN1Y2ZG9Qc1Bva3hsamF5?=
 =?utf-8?B?NUE1UldrL0IxWkZmUDlqWUdIZDcyZ2picCtDWUdra1VybzJMY291QWI1VGRw?=
 =?utf-8?B?WUlxRVY3UUpRWFRteXJCTG1qWEJjZ1hwSUwwZVlwTUlJMHhYZCtPM3RlRGNB?=
 =?utf-8?B?b0lDeGt0TUZmb1A0cS9tMTVQL04yYkdKakU1bXBCejlWbzcxZTBwUGs3cXBV?=
 =?utf-8?B?VU56RDhSNitPQUh0VlpNWVFGR0t2SkpYZFFOM0IrcFFOWDdZSXFpL08zdlNl?=
 =?utf-8?B?NTNQdzVmK2IzVElIL2ZCZVpOa1RLcGdhcnhyM2xxUEpBbFp2SmZlaHMxRDBJ?=
 =?utf-8?B?by85MU1OanFtaHdCWGpuTkhBQ2JYVXRLZmN3eGF6YkVSWWR2ekdxaXBhTEdr?=
 =?utf-8?B?K3ozQlJndEdCM0YvY0lEOHFlVnAxVUxRcy9LQmtwbmc3NHV6ZHpOSU5pSVNM?=
 =?utf-8?B?ZFY3b3RJUFNKRVcxN2cvRWxjS1VJdC9NcmVkdVl5SSs0TmF4N3BXOXU5WUdz?=
 =?utf-8?B?SVlHc2xDcGtMbUNTSTF2TW9pYUwzYU5hM2luK1BKQ2dOSENZN2t5cHBuRDh4?=
 =?utf-8?B?V0k0NVpDSzhmeDJaVDVEa0cwQUV1TkxQLzVzOEovK3lKcTd2MklvY3pPVzBP?=
 =?utf-8?B?VjJxa3doUVcxWFVlWEhsSUxtaWE4QUs5bVhMK29uVVhYK1NoeXkyRHA1dFlP?=
 =?utf-8?B?MVJRenRCTmY4NThvaFk0NWtEUDZWR1hhaS9Kd2N5WFVUQ3JnNTdqTkpIWnpC?=
 =?utf-8?B?eXAvSXEvQ3lZejdBK1pjZ2tSTEgrSFFrSUVqeTRla2tkVFk0WFpIRnp1d20z?=
 =?utf-8?B?UlpNWmRZR0pVVmx3SHNFTVRINjF6TzN1bkQvUGIzL1IzMWJ6TmFSMyt5MW5l?=
 =?utf-8?Q?GuQe6R9SkHM9swok=3D?=
X-Exchange-RoutingPolicyChecked: r4Wi876Z4c3q8Ar/9ArVNSVkcypfdo/QNFxMBsA1q8VavyGItkcUOs4Wq3Om/M/sdZ6fZTFjciqdHrE/aLkcTdM/8pYar/vtHjrmNwfJA4qS5JJ8DkGweg57Ddsz94JiFG9Xa70sMbNVwFCFvXtYvNOax03rVzSWwJIM+pBzLof9tVkgCE2ULKXWufLncPn+RiRJHXHgtzx4j5JRLIkfw/vbSpgHE9X31vEnSKSdpM8RdI7O8u2G9OFLQhaBmWtSE3UPm15DTsCNrdrJkIr7SIe5E1vUru5ski/p7Wgaw+1yoXXyFDGWD2KGgmbJPeThISpGbCmc6l53NMocNJzrdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f22296f5-8bd3-447c-5ac6-08df2b1765e4
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7746.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 23:52:40.4931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEmcnZzK5oz6bjqgnFXsT2O+9He/BMhYfck7s9Cys8kAvFetHZa4eF16OpOgCbF4D4NJKdY2LKRxgVbZtCcKdGT0uYmXhgKYHKjlbGZy/4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF195D11F0C
X-OriginatorOrg: intel.com


On 10/15/2026 4:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/xe: incomplete mmio deferral fix misses xe_wa_apply_tile_workarounds
> --
>
> commit a929401ac9f4b4d8f49c85fe7a5336571b384903
> Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> drm/xe: Access MMIO after pcode init
>
> This commit delays MMIO space accesses during resume until after pcode
> initialization is complete. It achieves this by moving xe_gt_idle_disable_c6()
> after the call to xe_pcode_ready().
>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index daa7ba2df317a..1f5097875bcdf 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -241,9 +241,6 @@ int xe_pm_resume(struct xe_device *xe)
>>   	drm_dbg(&xe->drm, "Resuming device\n");
>>   	trace_xe_pm_resume(xe, __builtin_return_address(0));
>>   
>> -	for_each_gt(gt, xe, id)
>> -		xe_gt_idle_disable_c6(gt);
>> -
>>   	for_each_tile(tile, xe, id)
>>   		xe_wa_apply_tile_workarounds(tile);
> [Severity: High]
> Does this code still access MMIO before pcode initialization completes?
>
> The commit message indicates we shouldn't poke around the MMIO space during
> resume before pcode init completes, but xe_wa_apply_tile_workarounds()
> performs MMIO accesses via xe_mmio_rmw32() when applying workarounds:
>
> drivers/gpu/drm/xe/xe_wa.c:xe_wa_apply_tile_workarounds() {
> 	...
> 	if (XE_DEVICE_WA(tile->xe, 22010954014))
> 		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
> }
>
> Should the xe_wa_apply_tile_workarounds() call also be moved after
> xe_pcode_ready() to fully prevent MMIO access before the synchronization
> barrier?

XEHP_CLOCK_GATE_DIS is an soc register outside the GT domain as 
documented in the function. It should be fine to access those regs. The 
issue this patch is fixing is related to accessing GT registers before 
pcode is ready. I will clarify this in the commit message.

Thanks,

Vinay.

>
>>   
>> @@ -251,6 +248,9 @@ int xe_pm_resume(struct xe_device *xe)
>>   	if (err)
>>   		return err;
>>   
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_idle_disable_c6(gt);
>> +
>>   	xe_display_pm_resume_early(xe);
