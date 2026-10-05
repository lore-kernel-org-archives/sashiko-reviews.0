Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD23360EF7
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 07:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183680; cv=fail; b=LkSOvDqrbYkmUC7GgDegTFYHMEbjJEFCqCs6QvT82CzToj+P1dBKoIMC8frAq98Yoxz43E6wbFbz1tUSCB23hvxC4LZj2SBICyjsTihOH5SUs8pPtLWP+0g/oTcvtk4YhicC8K7YXGR/3RuYE24hhfRIkwH0q8onZ1Gn3P2RQtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183680; c=relaxed/simple;
	bh=P0zwfOgOVJ7iB7rpo4AoUyh3aNI23UOSTGHScuEjFrQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PT4JOO/hNZ8STtqpUAuSwIUkgZ3pihYZ5mliJy4p1NNZWQzxJlxT+yl+kVKTsYfpxSJCNzlmuswew22mM3azKkTlLFCIQmoo56tf5WQiUNbbIO0bzf9SlK/XC+WIzCD2U53SNa9jFUvgBdmTfDTZoA9WOmdeUCuTux14p/Pw4Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwSIs7XO; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwSIs7XO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791183677; x=1822719677;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P0zwfOgOVJ7iB7rpo4AoUyh3aNI23UOSTGHScuEjFrQ=;
  b=YwSIs7XO9CkWxQqVGEQEOtxYATItN2fufKLmukn5ri3kdEbebdOVSBwg
   G+N/x/0lZxAPgkj1RUOxkVcgiHHhbJBFRKZbIF7NURDxJmIBTtpWA+vuf
   BJZGbfcKidh0D65ePKt5w34mhHJ8MyTP+wF2pge/26FZZcabU4TKxfqkN
   XlSnPeZ21LWPqPn5bBOCPanAKsuxKwoAkhRv0bVcXD58NQL8JxppmBpGy
   3ZhxC236258AXOl3FZ9o/Fi56FDOfqDyISRKhrOCd63yU1PDfxyaNEgzR
   c1qsz+K+nQrGXEkrBr7zNiFJdzwO3qI53G3cPhWP7/r22V5dGd2gO/YJ9
   g==;
X-CSE-ConnectionGUID: HHkPpPIQTs+JFnnU6MeG7g==
X-CSE-MsgGUID: XQl5xzMlQhmx+Ttbx4Zwrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="95658569"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="95658569"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 00:01:15 -0700
X-CSE-ConnectionGUID: SjE7ZUPUQbes5gAbIfQkcQ==
X-CSE-MsgGUID: VJaM2oVtQVWlUzP/mKKzIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="276297089"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 00:01:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 00:01:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 00:01:14 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 00:01:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApOA9YKeL8QYKv2MS7Cfgvveu0zLNKTgVLTeS5gVIN5HGs01WE7ud/xjXYhh03Xin8NGTxORBZb/iM1SCw7Sv3Es9ke5T57bKsPevS6tczlVkWJaWZ2fwiDRuSn2ZS7+x+YRDB4BhFCLbrTuCgDC4u2LpQt4HwlEjxQgQ9aWogcxg61UKW7y+c7nAvp0KX3SCkPX8hjYxrCDUu9f+gaYR5X8QCjlOzMfvl3Lir+uXoU4qOlrTH968XbQeZgf7sQtVntRix7SSDbo5p1T5BNaqy3k7dXo9zGr4mx3iB3ef1m7VAp1mOXvs3qJrUYMhF9/wNwm3dkl6Al5JXlizKArmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+7NClRW2mS/zLovj+SWH4c+ij8W+II81YCsCGppzyk=;
 b=f/VtWG868m8+bCpxhqbA1rEzUfAqv/PmeXRLx5y7Z0ofAcbaqEMjrV7mbH+D+zlb6B1csB4DWb4sydQmZH9MyHmLNqsZFxFo9Agy8b11BrJ4CQfu9NxoJpU6v47z852onqTWXxNDjk528NED7FencEKLE0eThIE4zbLe8SPssLKKGGoW9BVX4m5WAkK3Rvc1/CyEVT/5GI0tDlmM9gWzc0e8uV0G1iIQMWPSB/gBqZksEmX2Hn3d056Q3p+GZy5ul/VozSXzxt05suxCzQ78EfyhpAaEIW/2bou6ephybTHaQhyjbhvJpvWhA0Dg9q4tC4p4ZPmOmQb+qVmujpWhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS4PPF30373102B.namprd11.prod.outlook.com (2603:10b6:f:fc02::1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 07:01:11 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0472.015; Mon, 5 Oct 2026
 07:01:11 +0000
Message-ID: <6876af39-bb6b-4324-bcfa-cef117c89717@intel.com>
Date: Mon, 5 Oct 2026 12:31:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/15] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261001195033.3466205-1-karthik.poosa@intel.com>
 <20261001195033.3466205-2-karthik.poosa@intel.com>
 <20261002091338.430DA1F00893@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20261002091338.430DA1F00893@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0233.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::12) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS4PPF30373102B:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dfe7080-a24c-4cf5-b212-08df22ae707b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 4HWJTe1SbyDBZoNvxp+CG/QNnqjicFXmoxDN/l+RLx2kA1r7y/CzRAFJ1HKqtbq3lNDjKU1w/yo61gWK5GvorJEiMvZ/LP6HfJciqjbT/PC9tltQCpUqJP/k883LdVysnrtCUDl59xrOp54HH60XE1becWqts+oPPkNaOE2pt5qIHYKwWYbIPqYvWnh+/l1sDoGu+exwRzoNw9hXqRkSCsWXv1bseWM+7mdduqyNNwUj6EzHEgvSNN4qBtHchkR1xdRLsFZC84iW7VgtTO4b0ePEm3v+YxQPBPSwPB5J02rucEaMsgr82MoPQ0NqgYOc0InRZ6dPmUqO0LNLOfwd9Mas1KDX60yX2jAyB7I1sMAazs5DAqv6kX5C8RzaVudmNYCaV29k5i9hpr58sJbhCdQe+2Kw08TatkgOvdWVZCy+WEkAifb40AQtzPLKjG0hGK7W5NgMniJCXtUS7xZ19v2tPYMfefiC6UAbBPA4NTqhPYsA0SOh73i8qbGUXcw818Uio1EWmfGXhRAco5AROfnk6y5pkeUFmIM9pzqspOZiBYVE4S9VBZkQnkZgky/XFdAxGEwaJ+MRVKRZtjejHeJkkzIF5x97m2p7g52k7ajyl0ZNHxj6IDRN6Ii24ZkJadIeHvx95sYkuxs0YiS5Be55ozKrMhoQdIzvjnInI5o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFlSMW9ydlJtbTNkZCtFaTJxYUx5SlBlNVVRS2FxUUV3Q296S0s0R20vQnNj?=
 =?utf-8?B?UGZsTnp0c2J3SjJBSGZwYkxxbW9tclJISUsrd3lZMnc4ZXd6WUR0WFgxR2Zn?=
 =?utf-8?B?UXJJR3pYclIzT3E2UWJHZzUvanlXWituSTY2SjVMMTR5ZmZlcXE5Q3pPK3FC?=
 =?utf-8?B?NnZRajIyQkp3ajNlOUhZNytFVnZwNUNFSE1FSzRhR0V4QVorSTMraSs4MkJ5?=
 =?utf-8?B?TDRjL3p0YTZrK3VoSU4vaFV5dG13bU9aOTAvNmd5c05WaU5hR1Y1TE81amNP?=
 =?utf-8?B?ejhvY2JUZ3ZISzU0SlZWKzNmZmtDQzN5aFVLeDh4cEhxUCt6MVlRaGNSR0Ny?=
 =?utf-8?B?aUpydk1WT1Vqa2htRXpOODVMMEt0OVdrUDFndlNSQ2IwOFlSTXdsYk8rZjJG?=
 =?utf-8?B?WUtxbmhPaVZiU1BoNEM0UTZNZ0ZhYzRyNVdZUThxN3dOT0RNVlBsYlVTbkx5?=
 =?utf-8?B?L3RFdytoZXhBR3Nzc2Z6Z0ZuajVpOVV0WmdMZjhTSGp2cDhoeGlQVlczbEp5?=
 =?utf-8?B?RnBRQVZUVlV2UWw1TkhXNmplenRvU3E0N3Nwem15QUpJeHpSanRWUm5pU1BL?=
 =?utf-8?B?aWRYSUpOWHZHNTY1N2NHK0N6WjdtNmhFSWtjd2xuU1AxOS9tdnlhMEZkNm1x?=
 =?utf-8?B?akc0Z1hWWGQxTkRlRGZVVEhSUm9IOFoyQnNXbXViYm5ZVHAxai9LcWhPVkU2?=
 =?utf-8?B?T1lmbFUybURXWktzTEx4aHNSYUZDQW9ocDZIZkxrbUVMMmdHZ2MvNXc1cnNV?=
 =?utf-8?B?M3FIRC9hZksxc1R4UzdFVW9Vb2pGQ3ZGNGpJdU1ma1pBQXlRMktiMVE4MkRx?=
 =?utf-8?B?czFRMnhkeW81MEhlNWlVUGpNVXI5WHcrVXZFT1pwUi9SeHB4QWRKQVF5WW9F?=
 =?utf-8?B?T1c4a0xTZDlEdVJ4SnRES09vd1FyYkZkZElscTlOMXhVeEozWlB6V0diQTFO?=
 =?utf-8?B?dVhaMnZkaG01d09NY1JheWhlQlY1Yk5jYzhFOHJaMTVQM1lic0Z6STlMd2lo?=
 =?utf-8?B?NE4wcERzY210ak94N3BsT0tTN0JIVmFPK2ZpendWY3VtSWU1aGVndjd1VHlG?=
 =?utf-8?B?cnh0WDNqcHlGT3dBK1ZzQ3ZYNWRSdk9MWExJWkpubldrMlNEREwybGtKVzR0?=
 =?utf-8?B?SnBLNjdYRmtYampFRzdIRklDL1FnT2Y1OGNxb3VReDZzaG5MQWdLMFZqSStj?=
 =?utf-8?B?cjg4dnlWdytFSEV6d21mdHlZMGVnSXBwMVFPN3RTRURQU2FWSUthb251USsv?=
 =?utf-8?B?MTk0NnFLaE1WVHhKUG1MSzVZc21KV3dPUlFlaUs4NzFwOFV1VEVCVmNLbDFW?=
 =?utf-8?B?ZGV4QjRQUFBLZnFwMEFUbDVzUFBkUTEvOGRCYnd5NGFaYzdPY042dHNFbElM?=
 =?utf-8?B?Ym5pMHo3WGtFQXIzaGp1TG1kMjVMTkZUaWJXVmMrOFcvSExCME41dEdKTEJr?=
 =?utf-8?B?czNtTWRrV3RjM1ZWbUhSZnIwMUNjWmlyRlBCSDZCdW1USFozRVp6Nm1yTk45?=
 =?utf-8?B?TVlQaVlDeVI4R3ZKbXFZWXg1U1l1NWlxalZOV2RmWkVvelJmTjZZbzFUekQ3?=
 =?utf-8?B?QnNsSWpTbHdVVG03MkI5dExldlgrcjZSdXovTEpORXgxa0YxaUw1aTlTdlNo?=
 =?utf-8?B?YzU0RTlzZFl3RTZLNXYzeTNENERiR1RWMUd6dTJpSnJGMzVmV0ZMdFJ3d1NR?=
 =?utf-8?B?S1lyYkpvMHUwZFhUZVdzMUFPQlhoUGFBVzhQVGdMMDRCR3g5NnovVmhJenA4?=
 =?utf-8?B?SG41ZWdGVUc1VEk0T0ZQNjFSWG1raml2SGN6NWNKU1NRUmVkREhtZlNtazNs?=
 =?utf-8?B?aDdOOXpQRTg2ZFptSEp0d1hRR2hNVTB1SGcvVm1jQnhrelpTUDRUVm1ISXBV?=
 =?utf-8?B?aFVCSFhIdjZKc0d1QVllWVoyazVSeEttM0RBWmpTQm1yVWdxTFJ1MVZaOHpm?=
 =?utf-8?B?UUsvMWV5QzhmV0RWK0NzT3hTMzdhamgySGdXeWtnUVpHUVFjWWZmQlVoMFVy?=
 =?utf-8?B?b3NzRnV3OW5BQlI0K29MbXdEcmVObjlsamI3NlhMUnZaUmZXWEFxdEpUaVpE?=
 =?utf-8?B?QXFsNW05ZktJZ0FCNXE4Q2JSVFQxaEJld0JNMDIxd0k0QU9XQnUzK2JVWDly?=
 =?utf-8?B?VHVWRjdzNlkxV0dtNVh5emgzQk5YUVl4UkxiTGI1aVJWUjhwWUdWL3ErV0xi?=
 =?utf-8?B?UVR2am5sTGk4QTZWa0dmUW5yeVJmT2VmYmVYWVQ4Zk5HY29Uckh2UU5VWHEz?=
 =?utf-8?B?V0JRQS9HcUlNZlc4UmNuRnNLY0luMkZ3Z2tZbEQydExPamM1VGRKQkQyb3BK?=
 =?utf-8?B?OHRPM3BiN2txZGtNb1JWTGI0czBST05NRXgyZGwrbWFoR25TaXluZz09?=
X-Exchange-RoutingPolicyChecked: BTLX+Ntaa4YMXyanGgB+DCDGHGdq5f/cziE6j/SfKQxK+kuv7PZVGODLC4uWnkwyXUz/CcTY8DF62lde4sagUiM990k2v8u3s4GvTcz1HjRJlYEUVYBSBZ+8T/J/FAU9YUDzIz71gT2J+BMPo3jeSXfUMgUiLhSZeBzextLpHHXV1n4PRwPasZd9qv69E0/dwkwSGKHjrjsmPprTvlZOy/y/WvYEhHiMsa1iBi9qn1NtiE1ChR4aZGvcbkCnZS1zK1PJ4DA7qYYZgBMlsnZkA9BxP8ETTqZEijO3n95XInOnFAJ/9LqdIg/p6XceKCv8cihUJI5GMaEXLq+j+7htdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dfe7080-a24c-4cf5-b212-08df22ae707b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 07:01:11.7832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJG+6D5JRkWpPCUUQZd6T+Z8Gh3m+CBJCLcjn4rC3mpEP1/iC+m0kSaBgaSIpcxLh2VoYL8cvQ7b+Snsol6W0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF30373102B
X-OriginatorOrg: intel.com


On 02-10-2026 14:43, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] drm/xe/hwmon: error code from pcode write is dropped and replaced with -EIO
> --
>
> commit a3216689f81fc9f531bd48c8af3db490de1c046b
> Author: Karthik Poosa <karthik.poosa@intel.com>
> drm/xe/hwmon: Handle pcode read failures of xe_hwmon_pcode_rmw_power_limit
>
> This commit adds error checking to pcode read operations in
> xe_hwmon_pcode_rmw_power_limit() and propagates the error up to the callers.
> Callers are updated to handle the new return values instead of continuing
> with invalid data.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 5edeac961ec33..92be71f7bc92f 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>
>> @@ -679,15 +683,18 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>>   
>>   	mutex_lock(&hwmon->hwmon_lock);
>>   
>> -	if (hwmon->xe->info.has_mbx_power_limits)
>> -		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
>> -	else
>> +	ret = count;
>> +	if (hwmon->xe->info.has_mbx_power_limits) {
>> +		if (xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy))
>> +			ret = -EIO;
> [Severity: Low]
> Does this code intentionally discard the specific error code returned by
> xe_hwmon_pcode_rmw_power_limit()?
>
> Replacing the actual error (such as -ETIMEDOUT or -ENXIO) with a generic -EIO
> might obscure the true cause of the hardware failure and affect userspace
> retry logic. Can the returned error code be propagated directly instead?
The underlying pcode functions already emit detailed error messages, so 
debugability is not affected by returning -EIO.
That said, propagating the original errno is also reasonable and 
provides more accurate error reporting to userspace.
I can fix this and return the helper's error code directly.

>
>> +	} else {
>>   		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
>>   				  PWR_LIM_TIME, rxy);
>> +	}
>>   
>>   	mutex_unlock(&hwmon->hwmon_lock);
>>   
>> -	return count;
>> +	return ret;
>>   }
