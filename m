Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5C63D9DBC
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 18:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584645; cv=fail; b=floH3UoeTBjZI1eSmnh8EHD8P3ND8/95AaFTry8guhNn7przgBTBpkt89jUG4cvYUSTfhSYkZhw3lIMV4ySz2bua5s2lRY0KfhnoPvljjm9euM9xbXgY9bg9YyT1d2BIgxEXaT+q/8ZV2IrvMowGO0IUgkujKtvBmEWGetxdP14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584645; c=relaxed/simple;
	bh=uZ/eQC0vhdsHM0F2xGANdeVmLICnF0HBW26HjDrv4OA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lWZuMrKHrg7eTukiE46H+U7rHnsjntiJ/v4iOeMCMifLX4E/t1HVQ5Nc7Zx8eXyQ9zEDE5Nss99ShSI8NtSdaSNCe5K5CoPwDYvUQMli4yfxUWWtQYMnp/IpvfzUBM3fad+SX8Ys05nYaohasoGDzuMJbgb4FnI7x31XgoNjBnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmIK+g6X; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmIK+g6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789584628; x=1821120628;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uZ/eQC0vhdsHM0F2xGANdeVmLICnF0HBW26HjDrv4OA=;
  b=hmIK+g6Xdn1ijjwPWXQL/g/Za529njrIpZTOoMAHIlOeoBzQb0pJe/s0
   Ztxl+Df03Sa9AmUCzKVDAtJMuwli7wzpUc5EZCGuNbS2spG4iCM4kqKFJ
   G6mgiv9u104zV7hk+/xPzYUlOyRqvlSWB1F9tmVpxCiOqkuwCH2a1Y67y
   CBpmfzJ3QgweRVRLb0JFDFdrAkZV44EatZQ0+LyOjuTNQjTVGte1rMTxF
   /z4MFmN/+co4gCEhs9b1uvEn+Pe0gNEz+dXfi0DW6eB8wFdpyDhZnPop7
   z+DxBvt8jl+DGwZJJemmlOlQzqHNw1msKW5qKlujRIbeSeEFpBsPKDuMh
   Q==;
X-CSE-ConnectionGUID: FYCjtKgPR6KgvplaHzpvvA==
X-CSE-MsgGUID: h1CO4GZZQrWn3seM+1QZjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90104187"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90104187"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 11:50:24 -0700
X-CSE-ConnectionGUID: eUcVS5tvQ6OMPD4LQO8GqA==
X-CSE-MsgGUID: OdtGgrjNSRGFKcdqfUvrfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275374219"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 11:50:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 11:50:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 11:50:23 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 11:50:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQAOmO1UqhKYAR1MVpqwGL3ClIiYRpwxc+kRlzUH5wY8hyu9CkwapTZkjt+i9wmm1cJ5YPHTUj2VSn+xDjuln9rY1WJ05vxx2uIw+Gv23a9PX+twxQrEEbjiRvnAXYaDFUKFBuLCRFQovWO2NLNirwuUVUgvHkBzUOldMi059vYAZi+kmisLNQH27enstPLfEUBif/KevTCcGuAmnUCPlmv/RjgjnLfqPtrfXVHtvNhFo3XUyVaMyGljdjnTbIYdq6OMKrh1GLnY+jp0L8Id0Pnhi4IeZlCl4wH6Q+duLZgKhUe9KlUN+Z+ASrmFog2aJ+IkiYJYArvslHt/WQ//VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxc5cw+wED7rUHB/t8XR8Y32mCG1lgMXlRju94017pw=;
 b=qkzOteV02Y05BvYyST5BTvZD12ebRWaiPo4GlNoDusOryu5fQqeWPZ+Uo0vDM5ED/FVSQV3HIY4zuNyj37rnoWb1dR3aJGTQaLuM8KNi/eR5wl+P1aVkZTNSEnqQon64lgal4ErN9Skg+SW6/fvkdvI50HLWzjNHggs9eeYoVFSVW6PbMZ1hxp7ACQvF/tw/6kOzvWuPjRS12lcHHLP4QnHGCtbl0jo2brjXGtMH6O5gZQyZSB8fttoG4Rtda8MSl8SkOuuJlXcn2w71LMod2cuXQYVQmohbESCfe0E4SprqiCAWOY4H6DDIgnrlq7I5ASpEqwEw9VrmNhMQAAdnqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by BL3PR11MB6434.namprd11.prod.outlook.com (2603:10b6:208:3ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 18:50:19 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 18:50:19 +0000
Message-ID: <817670c3-6117-4d55-859f-e513329bf17e@intel.com>
Date: Wed, 16 Sep 2026 11:50:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe: Poll GT for C6 before D3
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260915210113.2915363-1-vinay.belgaumkar@intel.com>
 <20260915212050.8E5CB1F000FF@smtp.kernel.org> <aqqJ2fNQ5lxSGRr7@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <aqqJ2fNQ5lxSGRr7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::28) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|BL3PR11MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8812e4-1d66-49f2-d63c-08df14235ad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: uif78Axg6EcyvlBC64XLaiKXXM0EoiRut7MCRJZkIr284oLCGprzUhf5UQi9ZuoM/GoMimlTuOh2gmVOuTJfWep1ZGHvoyfV+S/8awuJ9oNMdwptEKtHcZSrabBx0JRslmoxzVxRW3F8q2w918d4eRUm03hn6fOS61lK9lNTVyBLUH9IHyVaxt8LWyLeL3cf+WeC9YakX30smc3Y4ncxYLUbL1WyllFLXEtwxtnCU+IQsaVEB+arg64vRhkTpnFtszgLRjBH3a9cQ9Saz3bYLiIkBlU9MfBd2oxO8839J83DbtMyuobs4dVBc1AwxKWTSYf76BbjoFLKxz4ofaUCLBoPXss6UYCSbe0fn1DantvUd5zb6FnlgT76Ky3fzvhXaMiLGKVCIRe7L1leJyfIpvd0ETeMMYuqdHLhHVEoPwnYunJWKC7rynTZaUqrGPq3zKac8JsD264yJYnbbFTsUUGAWTft672+3QlUeBl8VOtjgS5bna+uQ6AL/dJZ77Q04PPtdzKKkI+EuYUg7ibfGEEB/4YkElaxvAvqfU2NtSEQY6x1KHRtYtH7VeiGgAR/2+XAk+9usWsX8gcTmdTTEanIXESN8RwZG3TOv48Z/Gg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7757.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXlYLzBCb2JrZ3huZisyMFIrdExGYS9BT0hrVlRkYlNtbEd1Z1BobXlwalhp?=
 =?utf-8?B?ZXlqNDl2L09vbVJKZkxZQzVBdWljZzh5S3pWb25KL0tCSWFJNFIra0xXL1FW?=
 =?utf-8?B?QVZVK29wSkdVNDBaUGNVTkxHbVhxN1F2R2hISEtsTllRdGE3eC9TRXRGaWRj?=
 =?utf-8?B?OUlHK3NLelF4SUluL1czYWQyOXBIOXhWT3RVaEtxTjR1cXo0S0xldDk0SC9z?=
 =?utf-8?B?TzBBTE1rU2xGTGErbnNteWFjWUZoaHVxMm1UUWEwSllEZWRqdCtpNGhyY09J?=
 =?utf-8?B?TnhnRmxCNlJRelRsay9lUEs1bWJ6TVdZTHE5eHF6bEhKd0RqMjJ1YlJyeHhW?=
 =?utf-8?B?dHRsMzlvdHp5cUpUaUVRcTRSM3NlaWhkYnhscUNnZ2QwL0tYNlc3K01LYWhz?=
 =?utf-8?B?MHdDSFpFZWVxejc5bW5KaEc2QzFWRnp6T002TjJ1WU5idi9rWUtDeUpaL1la?=
 =?utf-8?B?WGJ2NU5zbGxBQW9UUFpjNHU3Q1pjWEhmbGM0WnNUdWJXNE5YVVNOeWtzODE0?=
 =?utf-8?B?dmQ3Q29rdlZCUUgrUGU0UDFKWXJCMVUxK0RQVkZ3OG1neUh5MHFaQWxNUHR5?=
 =?utf-8?B?UGpPTkxibHpyQ0V6Wno5TnRPOG5HcHhCTEJFRVRRUis2UXZWc1FyWGlCMHVL?=
 =?utf-8?B?cllUYXk0djcwOXJwNXVIbmUrNzZrSTNhbXpXNVJyNXNEWGdNVHR0MW5DNTRm?=
 =?utf-8?B?dFdPVWlvaXlkQmx4TFdISkZMNU1rejlpKzZJdkpNSlN4WmhoTGIwaC9Va1pV?=
 =?utf-8?B?aTdXcXYvRW1LUno3cmlRaVZTb1dFWUNsbmJSbXZGZU1lVXFJWmRHaHMvNlhl?=
 =?utf-8?B?N3gycWhsdGZKRVRLWDF6b3dYR0FudHUrTmdvc24yMmRPeVByb2hyTzBkK3Bh?=
 =?utf-8?B?Rm9IcVpsWmVsRlB1eGswRlY1dnhNbDRlcStUY2NqVGwxRXpLSkdPMkNUaGhy?=
 =?utf-8?B?eFE1N3ZsaW1jcGJYelJRbVR6UnhNM3NJeWtvN0FuUWhyTmprOHBlWi9BS1BC?=
 =?utf-8?B?dEpOMGlhcWtndk13UmdTZ3c3dVp3UGRhREh6N2dUV3JyL1F4TUlxSFVvcldm?=
 =?utf-8?B?cEdRRWJlY2phUDdicDVGSlM1M2lpZUdubklIei9tOVRYV0xlS3cyRWtLckZR?=
 =?utf-8?B?ZUNPSTFMdHdsNk9XdzcyRXNEMXBzYnM0TUR6YitIQ2d4dTNiQzJPdUhGUmV6?=
 =?utf-8?B?OVpBUWdOaDRQQVIyWUN3YUlBbkkzNVVGcG1ad2pISlk5Q2NjSkZxMTY0REUz?=
 =?utf-8?B?QWwzWnE0bXE5dHdFRmE4aTdNckVmRmgzbnBSL3QrVGVoVUs1UkNacGRLTDYy?=
 =?utf-8?B?STlxRjhRYkNraHhuVDRUOHJheEJTZmsxaVlsSWlWQTh4YnVpMjRLUTBraXds?=
 =?utf-8?B?YUcwdXhjd2VEcVk5YWhXSkJyYlVWUWpHK1lqS0wvV05PaVRkSCtkWUZLb05X?=
 =?utf-8?B?QzJHSE5uVlNiYmxtN0RCczFaM3JDWjdFVUlzaGloZG9GUFlEM2hOYnRzQlB0?=
 =?utf-8?B?VGNlZ2FsdmRHOS9YcXd4VCtPUVpGaXBTdGplZWFxbDcydThKQ1JnYnpJTUdE?=
 =?utf-8?B?UkdFU01MbDNKNFl2Qm16U215enlYbmVsVko1V05hOHdRYmgzek53clRXaGJ2?=
 =?utf-8?B?UUY3TTA2cXBCR2IrMEp5bUJYSnJidDhEL0pCZnN4OXY2SW1vYi9aZ3FUQWdD?=
 =?utf-8?B?V0hOc2ZqZzV1eDA0RFZzcWxCODR6c2xFTm9XcUt5ajJUdVdicWJnN2x3MXlx?=
 =?utf-8?B?RWFPTUs5YmZrMTlTaVdiREZCZGtLdU1KNXk5ZEVjdTQwUEUxaDBQNU1lSklu?=
 =?utf-8?B?WGoxUGtUSnVLWnA4V0ZpSHVqcm9IMnkrNkhVMWdxSUQ2dWxKRkxZM08rSHVD?=
 =?utf-8?B?KzYyQi81RWx2SmNtYytOWXo0OG1NSE9LMW9aSFZNazhUQWJnTEorTmgrTEtO?=
 =?utf-8?B?emw0aHd6SjQydTBmS1l4R201NFgzRnlzejNaUHlGNGpBMUc3RXZQd3lhMnVI?=
 =?utf-8?B?WVFZNGJFVlFBQ2pZS1BJTVF0dnBkV051VGVnRHlZQVlQam9pbUlhRlRXdTZI?=
 =?utf-8?B?RnVJS3VKbU8zZzVWVXMyN0dvQW1HQXlwWTYxelIwNnhZR2hRSmw2bU5xOFI1?=
 =?utf-8?B?S1dOQmxvaWloQVQ1UTJwVmVPVXNsQ3RBNCtHaWpzM0hRUFRjcGRaSkNWL2E4?=
 =?utf-8?B?M3VjaVErY215aFJtaDBBWTdQSDh5Y0lKZXM4UGZWVThoY1MrQVdxbmdYUmpS?=
 =?utf-8?B?aXUwRUpZbFgySk4zUEk1a2NZaCtiZ3M4SnB1VW5tMEZocnRFeFRuWG4vWDcy?=
 =?utf-8?B?ZjUwM1I1cElBdDFBWVBXdUxEZzhaaTdLS2prS0ZxOTJqWG5SSndzVUFlcmwr?=
 =?utf-8?Q?im26z2U2LR0F2tRU=3D?=
X-Exchange-RoutingPolicyChecked: ehhY41nptmaxrehTriFTYODLNWDioU98zEL7naV87wwv5LM5SuxmutPiYZbvNYcp/JpkoUeznUKEr302RuU3GvqA9n4OPziMu39Zigt0GbY0Agx/hhvkFwpx8WeF89piq/2IN2drePKoRbSOXck2MPczZ8vr9Nu1w/7ECH01D3yWa/IWMxZXFD3KwbJR5kSnld0Obu/7KvitcdJkaUvgrObgKRAkcwgvMU64O6XVpNQbVRoIyAsBezI8nCIdbpl59V9ioLryhNobNm1Ox8FM6R7nT5IFN0wgvAur8qqzSz6WSQESJgrIbXdKoowjpEmSrUAQAI3cx81wX67hUH99PQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8812e4-1d66-49f2-d63c-08df14235ad5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 18:50:19.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +v3niC+YkBmGhJt2Va4sXk/e4TOWQqF9A8ErJzGRLtfiprJQuEjyh3DNI28FBYGBkwahd4fKDE8wGXFl3vfT9FRbMiaK+gzUuM9SRHBokxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6434
X-OriginatorOrg: intel.com


On 9/16/2026 5:21 AM, Rodrigo Vivi wrote:
> On Tue, Sep 15, 2026 at 09:20:50PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] drm/xe: D3cold runtime suspend always fails due to C6 check after GT PG disable
>> --
>>
>> commit 691645f0da262033183939383983163842757c50
>> Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>
>> drm/xe: Poll GT for C6 before D3
>>
>> This commit adds a check for GT C6 state before the D3 transition in the
>> runtime suspend flow, aborting and resuming if the check fails.
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 00b2b5dfb8f6c..488745ce0473f 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> [ ... ]
>>> @@ -1394,6 +1394,17 @@ static int xe_pci_runtime_suspend(struct device *dev)
>>>   	if (err)
>>>   		return err;
>>>   
>>> +	err = xe_pm_check_device_idle(xe);
>>> +	if (err) {
>>> +		drm_dbg(&xe->drm, "Resuming - Device idle check failed!");
>>> +		ret = xe_pm_runtime_resume(xe);
>> [Severity: Medium]
>> Will this idle check always fail when D3cold is allowed?
>>
>> Looking at the sequence, xe_pci_runtime_suspend() calls
>> xe_pm_runtime_suspend() right before this check. When D3cold is allowed,
>> xe_pm_runtime_suspend() executes xe_gt_suspend():
>>
>> drivers/gpu/drm/xe/xe_pm.c:xe_pm_runtime_suspend() {
>> ...
>> 	for_each_gt(gt, xe, id) {
>> 		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
>> ...
>> }
>>
>> xe_gt_suspend() then prepares the GT for power removal by explicitly disabling
>> power gating:
>>
>> drivers/gpu/drm/xe/xe_gt.c:xe_gt_suspend() {
>> ...
>> 	xe_gt_idle_disable_pg(gt);
>> ...
>> }
>>
>> Because xe_gt_idle_disable_pg() writes 0 to the POWERGATE_ENABLE register,
>> the hardware is prevented from entering the C6 power gating state. Won't
>> the subsequent poll for GT_IDLE_C6 in xe_pm_check_device_idle() always
>> timeout and return -EAGAIN, causing the device to constantly abort suspend
>> and immediately resume?
> I believe this can be dismissed. But it would be good to run some experiments
> to confirm this.
> If this is right, then the CRI bug is a different FW bug...

Disabling render/media power gating does not block C6 in any way. This 
is a non-issue as you mentioned.

Thanks,

Vinay.

>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260915210113.2915363-1-vinay.belgaumkar@intel.com?part=1
