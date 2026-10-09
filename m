Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E364CA796
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548261; cv=fail; b=mBSBLMSbBAPFRGXme/Czc13Y91xL146zxkX4jkxW4EO+6V209kLNzb9sMIkO/BihkdbN+3sbJKBWa0hsXei/PZGOgfcOC9ZLTpBHOPQSEAqH3pYqMxWoPtUbVxBO1ZWMZqkM/N4Nw5qCUrlRcq+Lyn1Ik56E95Bc7L2jjz3csYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548261; c=relaxed/simple;
	bh=wsX+htzVzMhYNj3v7jJpoAyDmk349RC5RXnYgc7V2ng=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GyOQHGefFqqSzZiVcqmnNzFiK9MLijfywc+5jByXnOSFtJqR1MwKIZ02l4rgxaBDneHgJ0lWZG1esYeh4Pig8Ix96nKXUdhz1tZhnd7VIJiwUP9RusQGFn6ys4aGcjirmLSPCIR27WnRjLMB7+LYox95SHtEMkbVe7AFgZ6rFOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XylNDBuj; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XylNDBuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791548258; x=1823084258;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wsX+htzVzMhYNj3v7jJpoAyDmk349RC5RXnYgc7V2ng=;
  b=XylNDBuj9ooiySTePiMGLxjBaXtUo1fBZxrLzwr1GYBv4dAvlxM+9xbK
   SUAWHejEFT+v7ga6WR1hqR1FWEHKRZp2MvvhroqKLunaCbMjp4bdWmGuD
   //dAVKACn35hUv0k6Zh9k9S71WlpLjK0YNzDE30ww2liO/RQn3OuBa6kv
   DZDkz516LZKsEJszMTtBGlKQfY1tmpbmuAPtL92Ld+2pVLc68cjH8rpvJ
   bHu2JZbUy/zi9shHLZP6Y4+ZqNIll9rsv0C2sT8k6ouG38tZ3DQHlf6ws
   hgCf9cdoENzZVL4WyWjkyEQr52Jr+Pja0WEzvkvRSonCKOgGO4HEdHzU/
   g==;
X-CSE-ConnectionGUID: CSrHHW5+Tk+pwZMfjCBCCg==
X-CSE-MsgGUID: u5jPkE66TfezPXMWrlNAjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="232563"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="232563"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:17:37 -0700
X-CSE-ConnectionGUID: NG/NsjUVQwqz1ZmPhyrDog==
X-CSE-MsgGUID: pl3+cEKQTL2tE8bD6sAzTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="658755"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:17:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 05:17:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 05:17:35 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 05:17:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QL3AOHw/J1NkHqeppLm5YCu7PS/f7QqCMCpi8bCgrtfW3zMYZMp4Uofm8U/ArR8p5L2lvSawBhrxlsNXGZ5sqEeTYIG4KlLqTc3V1G7l4g4ZQ0aIAlQLSAbNVS8IGdbZNkeNZqB0PbWF5zD2KhI/e6Vuukq6k6IF7gGXGJy+uXJRSm2KO4FR1SK+Mhxd0+R+D3s49YkUYsiL8j3TihfJ9QvpipMW/6XLxCjeRi6JdHQeUyd3Jk9v9aHUpUd7bFRCE+9HW+Rw0o6VTSuRo8jBodcaisY9XN6kg5ZrQIl3i4rlcEf37m42B2WQeWh1kTRQpxPNQ8SwLTZ2PgjYyQiqNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBJ1P8teONDpnhJOjIT0eX+naTEW89wAU75PRMYrx6o=;
 b=PIn3lEZL1WzJOQgnDXSmBIsZ6mkFePkXTOZWOGsJuJRJuueYPeKfMjpflZ1S4qjXSbc7zj7eECPQ6qm9JC2fr9S//Of6KSRWwnIBVP1TSWKDy/m+hKBo6r8uOG959gUUB/09l1fzWPm7ukeL6pDtWafvuZNhGFDl6TYa/BhSh3Qv4DGA1tqfHLYwBDcSAj3J4EpYLuaH9P81IFH4Yxl0y3fn01dEpfB1Lw0tHczEQJkQGRaT9kmpWJUN7U8kk2hpVw0KxQCrUTaG0KxjNbrLqiDsMR4TUOKUi5oQAYo8zvzr8Sq1WVa8dwLVNRBCm1kbiZlZwrEVcSUaxkgLMt1JNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by IA3PR11MB138852.namprd11.prod.outlook.com (2603:10b6:208:549::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 12:17:33 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 12:17:33 +0000
Message-ID: <5d3e5c5c-00a2-4628-a93f-d538da5c064d@intel.com>
Date: Fri, 9 Oct 2026 17:47:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] drm/xe/cper: Add CPER reporting entry point for
 xe_log
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-15-badal.nilawar@intel.com>
 <sashiko-outbox-165258@kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <sashiko-outbox-165258@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::14) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|IA3PR11MB138852:EE_
X-MS-Office365-Filtering-Correlation-Id: dab0c99d-50fb-4b71-460d-08df25ff4be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: W71GJhCri2X6XPbsV37QXpzTdHOO5HoFI0Jgv/6ygEDM779ABWgsGdG4/QkABQG6bdrmEaEQUgMYL2E4BD2LlLkkvscakmnPOfd+UqMpCFKA7i012bZZyxql3G0ogpcDlZYP2nxb2Q3WzHRksLYsdF1g9xJ7hK1h8dpJWIWmCzniZUYgMkvpFZbGk/PIwQLvVplGYyFiP0fUzeAxbPTuOKxPoejfgr7JGOzM48i5gRTT/s5R7A1pdnrYbXyMI92HxH6HCfwR0qxjUr5tBhSqVoE5tZeXFYtHgdwWEjY85Cx2ye0ZS7ISDT6HDk5nJNMIcDPTwJqeT58CfOAPpoQoYP2pWzG5+x6sCkvk5IrucxR0X65Y/CfURKVUK0r4SVPRpaoBQEW4KJgU3kjQl04tMPKb0JAWpjGID6ViWhrr4TcmiI97cjNwF55NRl7QMFgYx84mCz4d0FBE8vreeJmDfUmNlK4G6POXLH6yKDkOI/ARUlF5zwO5bISxJSSnhlk7eNeaJ04htHDP2SV8kW9etrsDlUV2Jvvby+G8qaG1+7daIk+KwrVVTLTIBEkyRI3zJ6UXzEqzjaTjsJjZnWJvsnWk+JaH4Q5jBzoScpQDROrnLfYlrPyO2LWecPelqO0HShcoqtDkmtKhYqjTCMj9HKAGezR6K+mdP1qi419qZqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR11MB9792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzdKbjNDbUQ4bzlrM1R2OTRKK210UUJrUWVCQjVGSEd1QjRpc1owSUVJVHh4?=
 =?utf-8?B?RFN1eFdKdUdKM2pKSXdKSHUrbUZKZXBJMVgremFpOTNmOHc3ZGs4cVZNMmdZ?=
 =?utf-8?B?eElENXRPY3NoV3lhbnFoU1AwY2JQRGNwQTJRSlltTjFnL3BPL04yOE52RFp0?=
 =?utf-8?B?cWtPanROdWNuc09lb0NpL0w5T0hsU3dXZmd2RVo2SnpTTXV4UWRPeTNyMW53?=
 =?utf-8?B?b3F2YjBTWmlKbWtRNUcxYjh2LzA2c1hiUDh5cDlsMm5jd1hDSDNlblZTYXpB?=
 =?utf-8?B?QzZ4dWZkY2xLS21CY2FTc2xXc0tkTFFEVThjY2FzeTlMMGlSTmhWUE55NU1F?=
 =?utf-8?B?TzdaTndRRXB2TlVYZFUvQ011WGVzdzBMRWxRR3pQb1VJMlFCRmNPak9qK0pi?=
 =?utf-8?B?QnlSQzBtaXJFMXRDS1NTTUI1YzE5bW9DYTBzT2tFRXpyb01aV1QycUlVOEV2?=
 =?utf-8?B?NTlYc1lOR2lnb3g4dlBTcnFhUkcweUNObHlxRFZ5bzl3cHB2VFBLUGV2dmQz?=
 =?utf-8?B?MWxnbDZTL0VJV1lZK3BNZHI2VTdOOStkOC9JV0VQOHJHcTZrTktRYmU2UzZh?=
 =?utf-8?B?dkZEd0czOG1pOUtmQVZVS0V1bkUzR1BCTEdFMHRuRWMvMzNKV1FoTUE1dUha?=
 =?utf-8?B?RGI1WEV3N3JuQndqY3NxZWRGSTkxQnVBNmF0L2UrZ0xFNUYxQjY5Z2N3LzBH?=
 =?utf-8?B?TmVmODlBN1RZZGRxUVlVc3BSanpOWC9URms4THdQNng5OGhQWjlmaU9wKy9o?=
 =?utf-8?B?TFJTL3F3U1grOFJkVXJWRzlYbFEyVkxtUU10eWY3Y2VuWGltUTBjc29pZ2lh?=
 =?utf-8?B?bGVOTWZuSCsyVm9RQ3J0WnQ5Y2hTT0l2cGdSdjJjNlBZK3VhS1lxVkk4L1Va?=
 =?utf-8?B?T0xJRXBKTFdNWnhzL3pCNXdkNHRQaWZpZnc4QkZuOGpEd0tXRlYzZTFyUGFu?=
 =?utf-8?B?YjJkNE1zQStZay8wOG1HRXZsK05RSmxpbzkwMjRQaDhKckg0N1ByanpMaG5y?=
 =?utf-8?B?djZ6eGVZU201QzQveXVaaGpyVGM1ckVUUTZaQlNXSklNcmdmSHd6WkZrOEZr?=
 =?utf-8?B?NnVHcGtIVG1XcEpUemRheEdPSjlQTHVITysxeEwzSm5LVURWdU9lcmpxNmRB?=
 =?utf-8?B?bUYrNCtCM2lBTlh5cDZ3ZjJuaktDNU8yZHl4VDI4N2FNblVWRU9DN2lsSjVq?=
 =?utf-8?B?NmJPUzJNQS9sSE8zMEg3bkpHOXpUUGpEaEFOelRsdnBoTCtlS1Z0RnBGTENz?=
 =?utf-8?B?Y1FzRFBLZkgvWThpbjhBYXhDMmlsN1ZCTURnZDNSN25QOTBBOG9sNFc2c1BC?=
 =?utf-8?B?cEhaQVRVVTIxY1I1SkE2UE04dVhXcDRmSDg0Q003akRTdnE2b1hodElEeUIx?=
 =?utf-8?B?Z2s0ZXpMOUxyVVlsc2liZ3NhT3NzZU44d3pBMWFsVDJPdFU0WThhT09MQ2th?=
 =?utf-8?B?V1k1MkJ5dVJEM0MwZFFXazFUOThOdzVZY1lJcnY0UlpUcG05TjRKYlJ4ZWFD?=
 =?utf-8?B?TGJaL1ZMeXRlaFNscEM3V1hYeW1nMmZaQXAvaVkraDhwOFdzTkhHVGc2ZE8z?=
 =?utf-8?B?Wld3Skxwc2dqK3Bod1o0bHlZS2hOYkZMYml5L1NSTzdlV28vbEhwa3BLbXRr?=
 =?utf-8?B?YVF3VXBqY1QzUmsyeXdFaUZ0OFJ5WjlXbEJWaGl6bzg2S1hYRnplSzZhZGhu?=
 =?utf-8?B?bTdYd3hPK2QrRTdnMTVrV3Rtb0JzanhVaVQzM2M5ZU9scGRkR2QyQ3NzbzVz?=
 =?utf-8?B?YlphSHJycC9EMDNGYkc5MEdGb3NJM21Wd2pMZUFtK3REMGxsL2oySjkwM2lk?=
 =?utf-8?B?SjRCRzB0akltOWcxZUJOTUczNmw2ZzQ2ZnZWSkw0M3AxaUVkMDh6ZlBJQXRz?=
 =?utf-8?B?R3Z4Y05Fb2dyc1FSRFVZSmErQWVnd1VhU1RBZW1GMjIwQ0phR2pMb2JGSmVr?=
 =?utf-8?B?eE9UZlNBci9JUHNyN3RqNTNjSkh0czFsYTNHZVdoTWlKeGJiS242SWZVODlo?=
 =?utf-8?B?Yk96aDBQdmVHSXZkeGo5NmJCNW55UkVnOXBKNkVGT1lyRjZUUHN4OGFNSVFx?=
 =?utf-8?B?WXlsTmhFamU0S2pYSWRYNGJRVStZbFo3NU91MmxXRW9nWFpEcTU3V0EvbUdS?=
 =?utf-8?B?UTkyaElxOTlsK21lanVOb0dFRlRVczF1UEUvckhZcjRvQTFvVW9xNUhVY2JJ?=
 =?utf-8?B?cmFRT2lZdlR4c1hBb3hIM2g4OHRrU1ZHQW9aLzlmSStxczlRaVhua0hyenI4?=
 =?utf-8?B?TVMwQWU0NldJU1FGOWZGYUpjWWdISHBFazhuRC9YeTEvbVZ5VzRLQUd4dXB1?=
 =?utf-8?B?SFB1UHN3TitxZDhrYytzUHh0YUxJcTRBcUlzSWUralcwNjYydG10QT09?=
X-Exchange-RoutingPolicyChecked: ouUFsTZpmu0wciMlN2Zk5x50WwJiBr1yR+B4QFqSrde/lFRA0j+UFGXZoqSIP0Bz1GdpUXGjZeav3Zj445qKFjRQozYnYesb23Iuk+W/vRDRNyStjMKXfUiJLjheqnBAeulDF1hS28bGP4gpVqlf9tLS/aZFSeT0tga6eWosQ3VIJ2Va9mjvlZvUr5yyIW4Oi9stwqFQGIqRnrEA+fuvqQdr9UkSOkh2ni268bjfwWBk28XS4vI+eT/twgooex2CW/LknFVi6O+UMYjR+SpjyF1uodAcig+r3G+b1zrOQz7+7pD0NQk6GORyr+NkyaUqt9gT4hz68iYIh5HBnF4gIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dab0c99d-50fb-4b71-460d-08df25ff4be4
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 12:17:33.0646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NP5ZtY0kRvC+T3e0/PpavQNvRL7DIiZsf095E65F/gnwNe2LuNypmVZ4aDeI9XnrAjA0zU4BjiGuISjUhWMJiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB138852
X-OriginatorOrg: intel.com


On 09-10-2026 16:13, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe: Silent telemetry loss when hardware SIGIDs lack exact RAS data payload
> --
>
> commit a8ad6417f3a91a193b5e9bf972e9a0e60ff46e5a
> Author: Badal Nilawar <badal.nilawar@intel.com>
>
> drm/xe/cper: Add CPER reporting entry point for xe_log
>
> Introduce xe_cper_emit() as the single entry point for emitting
> CPER records from xe_log. Hardware SIGIDs are routed to a hardware
> error helper, and software SIGIDs are left as TODO.
>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> new file mode 100644
>> index 0000000000000..c5caa0e8f496a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
> [ ... ]
>> +void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>> +		  u32 component, u32 location, const void *data, size_t len,
>> +		  struct va_format *vaf)
>> +{
>> +	if (!xe)
>> +		return;
>> +
>> +	if (is_hw_sigid(sigid)) {
>> +		if (!IS_ERR_OR_NULL(data) && len == sizeof(struct xe_ras_error_class))
>> +			xe_cper_emit_hw_err(xe, cper_sev, sigid, data);
>> +		return;
> [Severity: Medium]
> If a hardware SIGID log entry is missing the expected RAS data payload (e.g.,
> the data pointer is ERR_PTR, NULL, or the length is unexpected), does this
> unconditionally return and drop the telemetry?
>
> Since there is no fallback to emit a software CPER log or print a warning,
> it looks like this could result in a silent loss of hardware error data.

The log entry is not lost: __xe_log_emit() emits the dmesg entry before 
the CPER path, so the hardware error is always reported in dmesg.

A hardware CPER record is built from the firmware error counter, which 
requires the RAS error class; without it there is no meaningful record 
to emit.

All hardware SIGID users (xe_ras.c) pass the error class, so this path 
is only a guard against misuse.

Thanks,
Badal

>
>> +	}
>> +
>> +	/* TODO software CPER */
>> +}
