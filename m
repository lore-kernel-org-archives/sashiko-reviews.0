Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54883A6F17
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551253; cv=fail; b=Nb/YcsxGYGGkwQDJLXRjRZ10uJodB9YEqi/0CJF3yGIhumZxlB/qmlRXID6RuzpTUZEWP+MDPpEpQa8zt4WcCO2GipeRskWBmyZpjgF1/HvaPUQ67eoxHWPwjcxJJXjyhJ2ib8Z2t2lvej1uWX1jR3ENUtjQVJGPTe1KRXFM2qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551253; c=relaxed/simple;
	bh=OLitQQmzPDvWeEKVYL9HnwSuKcGFP31WtpqvGuseqlc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jFbhFVvFQrxWw+RShx+woPjZMll5/EHCFicQ6i7KHmI5KBFKq4Hum9PJJR+8sd6SzZzyw2eVirVbnT9t0glI7sZDXDEUbVGIqABnnwgXCbZybXMZgcMpzgo3LubAkjq8UpUiY4nYFgfb7Lh48mBOLJPm+obVuVHApZ3kTwaGnWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwqAh1P4; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwqAh1P4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791551252; x=1823087252;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OLitQQmzPDvWeEKVYL9HnwSuKcGFP31WtpqvGuseqlc=;
  b=OwqAh1P4+ZgFY7VvYU3LLTteSPglW3tHXEelTRPY/7iR5ifSKwj1xNZD
   HHdhMU3dIQXJsgkiwSIuqonIHtHcUo7A4PtyrPXykwFI4/e6s+/YIVxmY
   qzrFBwbiKMVS/oIL1v8um5DkCNCr75ODE0R133+48c5lIComjd/617xQI
   WOVLPEHLqeL0fIp6CtrprcchAyfBd/xjj5HIAZt1Qw7Hid59y7o6Jfxk9
   N0/WiGQmC7hhbUfV5oRCNjx07taaHbRWyUAxQ1UspRnmQ9xqkUwoi5rBw
   cnZW/EzHKoIyhVgtmaljJsdZgtPVKOWQUlCSZTOMigX7PRCt1r2hAtdEa
   g==;
X-CSE-ConnectionGUID: zht6W6f9R6OE4twWYuUVNA==
X-CSE-MsgGUID: mC9c15u9RIKisdcQ1dcA5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="242536"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="242536"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 06:07:30 -0700
X-CSE-ConnectionGUID: 8Ih5vpsJR7CSg1nyxJPzxw==
X-CSE-MsgGUID: I50aDHuLQm6R2IVMJEoHIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2054362"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 06:07:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 06:07:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 06:07:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 06:07:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzLuvqAttUTWnKV1CW4ZHhlRrtLtLQREkozIxsif30zdX+tUxPeJhPvrAgu9CUl9Ml7UJZIZ7p4O5+Dlx3zXU/w5qFcr3MxHRM77TUzfGmb1XNkIGguyQshedtn82w2/cSSriAbgm2mARqlk/3NLw/PbjLShjS2TqOmPzBs0oc4dt7Ck2eVniuQjSxckzOE9VyLNCsfLK7HoksB2rR47fAkBSUbLzSDQFp6MsUx2yltBmtaL7RMhBsxWHmyx0tKtUpSoxnPPw/atMVcqMoSkDm/F6o6sENgsSYtbpyBV0YNUMItQfN10gNGU04weeBf6t+9kDjcY8hGyCRUs6tytZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWDtkDBQ69mrriix1dVih/5Xdxgp2rM3/9pL0dRk/Co=;
 b=m/IDL5F8FPA8TXW91KCKSp/Y5VknFp3cxxYQOIQxiITq3ogB9b71hiMo2eQ7k3EZkpG9Y7GroOKsIP/VEEk5sAdu1l+vRQx+TTyjvmNGDlDoWMi2mkiOMyhhQVv+8JbOPz7+Ec7rOr1A2VQDu874YOIMTnuj1jGi+mWzKBK6rIzoNxe4rspHgJ+oYeJFXvbva1KyaloBg8YcDipiXkMIiQXaQpHT6LLHFcIYL5d1dSgnpqDs28WZE1TXeZGIFY9c7F22wjpdoC7AfclKuyPz0CCUVi25szT68JEb6zeIp3zHIKI7VPTv2R1QMSo+fL9O7efP8nGXIvMLg9s+FfTizQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ0PR11MB5215.namprd11.prod.outlook.com (2603:10b6:a03:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 13:07:26 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 13:07:25 +0000
Message-ID: <5bbcc6d8-6464-42ac-9e87-5f3d04c76d10@intel.com>
Date: Fri, 9 Oct 2026 18:37:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] drm/xe/cper: Prepare Intel CPER error info
 records
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-20-badal.nilawar@intel.com>
 <sashiko-outbox-165253@kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <sashiko-outbox-165253@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0186.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::16) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ0PR11MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2236e0-7461-4f5e-b553-08df26064391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: wSmw4GeoOi6on9jqHsZi0vFoP1kEOjE79EatarE50IKcUv4xTt7fwjns+jawbYj9Acj5WziC0GJZmKe0lAIBsogt8tUHvRgri/PuPnGRd4PrqxyXycC7vBBd3qCc7B2H577aynb8bDaR0ri0WtHIa053RB31m8lOiUvUTJq4IsVViOvX4tFSww1BmawJKrMcfCkpX/MP53qlmZF4jdKKEime0gUxYal1N+NKtpOCWbKdtbbWpTU1kI3wivyVOUn8sIPMOqSsjRfqaDP2zShkB1OvqHAp1OsXP49jUOZgNbgw2JWCIjKFCeMoGHqo25aPKwF4zobvk0T3DIf+yjpVML2RO1G2YJfsx/c8OiSt6PBf7/lToD9kZfhQpAyU2PiVy+pChr/fSjhMY0M2bLPsjoIVMIAM0PUFRmgSw1R4cQd33NRFy8Mi0W2ljxtmgDTVgEMylsQvDEk+BfcieUUJ7/+Vl4kBfru7SjZ0IPAdT926yvc04OatDSzTgsPoc6F0JwF3X7wMM0q93CO5CNkYfft6AxosRb2m44Bnhb0ocZBSkWolmmPxvKq/7DQG8hZhjn7wwmVTtraAMissBJxGWaQioaAWquHgeLvF2wBDeg8d4QpOJwVkVJcB05k6nym5UplHG3j/j+khjukr+VrTbd2irRjTpnCrAXWtYQKovmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR11MB9792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjBVSG93aDdRdjN4MFJSRlNLWHN2NWJCK29zUmFLSU5ObzBvUVF2dzRKMnFP?=
 =?utf-8?B?aWhGQ1dOdCtLVXpxNkt3S1dEMXBvQ2pYSmZHd1FJc1QyT1dBanl0Ykk3WDRt?=
 =?utf-8?B?SjcxdG1uNjhkNEdnbE9Tc2MvOHIvaG0yZEUxRXc3b3IzaFAzV2ZqY0FpWGhQ?=
 =?utf-8?B?cmZ6elFWZ1orZUZPcy9JbC9TQStsVXRqbys2Y3BWZklxMGhCck9DWi8yVHRz?=
 =?utf-8?B?aGZralRHV1FHZ0JDNlpkbFA1SlNRcURqUzlCeU9TVzNBcVI0RnozZnF4Q3Ja?=
 =?utf-8?B?VlY5bmZMcG43YzJsVFNCa0JpSHRRNGVUOWtqcUpGOVJ0eG5KNWRQNkRJcHll?=
 =?utf-8?B?RGdzRW50M0J5Qkh3cC9ySkNpZTFPN3NveDNSTmFNMDVkUmRaZEhtcGFjZU5X?=
 =?utf-8?B?RGRrZ055aiszVnFraU1wb3VoRkYrWTFPZGJNbkd1NDRuRUt0eVMyZjRhU2N1?=
 =?utf-8?B?MVdIczNETi84WnpnWFNROXBiWUFhYVlBcWVOQVdRdlUyYjZ5WVZISjdOV2tm?=
 =?utf-8?B?ajJnRVI1b3FCQXZpRHVKa2NnMGlYbExNMWlqaHc4R3lMb0FvajNMeUI0ZGp5?=
 =?utf-8?B?TnBBcm1YOUppeFRZVEhkQ05sNldqckZmV1ZHNDBUMDBZdEZ2dkhHQ3ovWm9H?=
 =?utf-8?B?em5qT0o1d2N6djgvQW84ZHdWbzQwQ3p6ZzdRZUxWVkExWVhncFhYY1pndUda?=
 =?utf-8?B?UlJXcXhzN3drRHVlcjRrRk1IQXFWelRrbllRVkEvbDRvUDhtTTJUZHpyQ0Jw?=
 =?utf-8?B?MXpvcGc5ZHk4bDBFOXltQnMxeEdQNDVjVkx0STIrNEtDeVJiNVhEUGxMd1B5?=
 =?utf-8?B?S1AwdGRaY2hiejRxOFk5NnRkWWsvN29idHhKRDc0VVZiZzR2QnZBaWhERjBR?=
 =?utf-8?B?MGRoNlFDMmRzSk1DZzA1T1lrVFdDeVBuUU9tUkNzT1hPOEpLNC8vaFFXWnRY?=
 =?utf-8?B?SmVTRi9EYlliU0lUN2U4RFA1R3pGZ2N2S1hMakNXNU1rN09ZS1F1ZzFtUmRQ?=
 =?utf-8?B?eXBYQWVPREVPN05hVXliYlhQaVJQTGR4TlFETVVzYWhrYThmeFl6aHVudVFv?=
 =?utf-8?B?SHRxb3NUUGU2Q2dCdkNPbFc3VWdLcnJoUExBeDNtS21UWGVidnE1dGY5TEt3?=
 =?utf-8?B?UmpiZnQ2aXlVa0tQcTlyNFRFZDg5OEJta1ZmZlF4NmRaK0Z0OFFpUTRnUC9Y?=
 =?utf-8?B?ZVM2cFFGa3NVcW1KSVk3M2NQSithVmtZRFh3Zk84Y3hoSVNFTkNwTmkrMVVt?=
 =?utf-8?B?Y3JXbDFGQ3pIZG1XM0FHMWFZR3hicUdoVkpQUXMvQ2xoRkY1NWZtcktDMUM1?=
 =?utf-8?B?OU9IQTBOS0FoZittSlJHRHd0cUNRTjgzTnRndU5PTTB6MzN6aGlwWUlPdGlM?=
 =?utf-8?B?ZE9LU3QyS0RraHM4U0VBMVdZWVlRb3FvRHlSOHpQVDh2cS9nMTRpYlpvc3B6?=
 =?utf-8?B?WkFzZ0cvOVZObjg1dktkVDd6STg1R0V3WUdNK1NWWHh2WThBZmVpY2NsUnla?=
 =?utf-8?B?eEZZbllKc3RISVhYd3lhYnhmME9JQStRdy8yUHA2eTJKcnNsTzYxdUJobjJW?=
 =?utf-8?B?Q3h3aitQbzVxMXBnT0hEVCtjVEVNWjRLQ2FOQ1RDZ1hnRTZRRUhNSHhnN3pM?=
 =?utf-8?B?dkxIWENMeFJpMlRpbmIwSGViYkUrU2ljNGg1enYvaG9IZnFEV012bEgrTXlD?=
 =?utf-8?B?T3cyK24wSS9WN0NsUnFxL3FEUzB6dTlHcm1yMjVzYXIvcWpzcHVVQUdRQXlM?=
 =?utf-8?B?emZKTEFmejhUTnhQWndnbm5BencyUndFc242OVhOY2xLOS8vSGlHMGZBQS9p?=
 =?utf-8?B?UXhBay9wZ1R6M1RncW9qYXVzeGRpNFI5TXdubkptbUJDOVR1N3QxWGd5SGls?=
 =?utf-8?B?eFFxT0FJMDJnZWxZcFA3cStVbFZLazdPM05MOWhRd25nNlRjRUhVVmtUM2E2?=
 =?utf-8?B?QUs5NWdHTlpTajNLN2J4L2RoVHFCK2Jyb3VSUDZpemx6cU1BL3VCang0WERU?=
 =?utf-8?B?RkJpVzArd1RqK2dVOEV5TTV4MWJ4WlZaVXlnQkR6WGpSUTJ4eWdJcnBSU0Vt?=
 =?utf-8?B?MXh0NU44cUI5QjU0ZE91eTkwL0QwT0YwTFlQN1B5cVpYOVdka0FMYnR1Mlly?=
 =?utf-8?B?SEtzVFo1TitTN2dmOEJFZDJ3ak5XZFpZN21rZExkeC9LT2JBRGljSWlNRWwv?=
 =?utf-8?B?VjRRWHBwS1ZBcFZHNklYdisvcEl3UnVlV29UcUczcS9zTDY1Q3lSQ3p3TTRK?=
 =?utf-8?B?dTMxWnVHa21ESnRtdlZmdHhCdHMzM0pENkQ4K3AwUnlQREd0aGFCKzRzbmR2?=
 =?utf-8?B?d3FZa3g5OUtVSUpuU1hwQnFycGNweTVFTmRkUDhyNnRZOThsTWo1dz09?=
X-Exchange-RoutingPolicyChecked: PkFlp0nBJTYAp/rjz7TiQAoEGS+tw3Ps7NTeouuk/9bwNIuBAmDMYx76DkqAduuptk8vzALgz0wbyQH7hO/ad88hnu4Wmc9/mV1sico2N4cEu/18hXT8UvzDaF7TX9jJrzU6trEp4SYqDL47nXiWs7v/iOAu/mgABJksEUtVrzOdzlgBJKLAKqYraDTBkB3LfkUIyGXgCEABmWrqf6Uc9fr0tX409qUuSXTvlY4eHBRxxP/GMpkL4sBCNOGV4x36uMfRaPoO1m8/4YCRgQJQMCOEG3bpPKgtlfsfFyEpwmBqhQ4736wdUCuD0K1/QAEepi0Z7t/VivV39PStyfB5oQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2236e0-7461-4f5e-b553-08df26064391
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 13:07:25.8018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aU9j2/MsdHKim6Ijz1icbeAbirEbZ/4R9RZ1zvL1zTdD98r3xFRWt4pQ16CzeU7n67GrKU3zjd68YPCKKjzqcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5215
X-OriginatorOrg: intel.com


On 09-10-2026 16:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] xe/cper: missing __packed attributes on CPER structs causes ABI breakage and unaligned access
> --
>
> commit 48cc4e07bb3144fabbe0d059b7aa4e8d590267c1
> Author: Badal Nilawar <badal.nilawar@intel.com>
>
> drm/xe/cper: Prepare Intel CPER error info records
>
> This commit prepares xe_cper_sec_intel_error_info records from RAS info
> queue data. Depending on the error class type, one or more error info
> records may be generated and embedded in the CPER record.
>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index 1000c78b41e97..7acb503efd118 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
> [ ... ]
>> +static struct xe_cper_sec_intel_error_info *
>> +build_einfo(const struct xe_ras_error_log *logs, u32 num_logs,
>> +	    const struct xe_ras_error_class *ec, u32 error_count)
>> +{
>> +	u32 queue_len = num_logs * XE_CPER_RAS_LOG_ENTRY_SIZE;
>> +	struct xe_cper_sec_intel_error_info *einfo;
>> +	struct xe_intel_priv_event_entry *entry;
>> +	u32 i;
>> +
>> +	einfo = kzalloc_flex(*einfo, event_queue, queue_len);
>> +	if (!einfo)
>> +		return NULL;
>> +
>> +	einfo->error_count        = error_count;
>> +	einfo->event_queue_length = queue_len;
>> +	einfo->event_queue_count  = num_logs;
>> +	fill_cper_error_class(&einfo->error_class, ec);
>> +
>> +	entry = (struct xe_intel_priv_event_entry *)einfo->event_queue;
>> +	for (i = 0; i < num_logs; i++) {
>> +		entry->entry_length = sizeof_field(struct xe_ras_error_log, error_details);
>> +		entry->timestamp    = logs[i].timestamp;
> [Severity: High]
> Can this assignment cause an alignment fault?
>
> Because xe_cper_sec_intel_error_info is evaluated as 28 bytes in size,
> event_queue starts at offset 28. In xe_intel_priv_event_entry, the
> timestamp is at offset 8. The resulting address for the timestamp field is
> therefore 36 bytes from the kzalloc base, which is not 8-byte aligned.
>
> Writing a 64-bit value to a 4-byte-aligned address can cause a kernel panic
> on architectures that strictly enforce 64-bit alignment.

No, these structures are inside the #pragma pack(push, 1) / #pragma 
pack(pop) block in xe_cper_types.h, so they are packed.

struct xe_cper_sec_intel_error_info is 24 bytes and @timestamp sits at 
offset 4 in struct xe_intel_priv_event_entry.

Because the members are accessed through packed types, the compiler 
emits unaligned-safe accesses, so this can't cause an alignment fault

>
>> +		memcpy(entry->metadata, logs[i].error_details, sizeof(logs[i].error_details));
>> +		entry = (void *)entry + XE_CPER_RAS_LOG_ENTRY_SIZE;
>> +	}
>> +
>> +	return einfo;
>> +}
> [ ... ]
>> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
>> index 7612518c9d47b..627c7117f23eb 100644
>> --- a/drivers/gpu/drm/xe/xe_cper_types.h
>> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> [ ... ]
>> +struct xe_cper_sec_intel_error_info {
>> +	/** @error_class: Error classification */
>> +	struct xe_cper_error_class error_class;
>> +	/** @error_count: Total number of errors recorded */
>> +	u32 error_count;
>> +	/** @event_queue_length: Total byte size of the @event_queue array */
>> +	u32 event_queue_length;
>> +	/** @event_queue_count: Number of entries in @event_queue */
>> +	u32 event_queue_count;
>> +	/** @event_queue: Packed array of &xe_intel_priv_event_entry records */
>> +	u8 event_queue[];
>> +};
>> +
>> +/**
>> + * struct xe_intel_priv_event_entry - Single error event in the event queue
>> + *
>> + * Each entry is variable-length; @entry_length gives the byte size of
>> + * @metadata only (not including @entry_length or @timestamp).
>> + */
>> +struct xe_intel_priv_event_entry {
>> +	/** @entry_length: Byte length of the @metadata payload */
>> +	u32 entry_length;
>> +	/** @timestamp: Timestamp of this event, in firmware ticks */
>> +	u64 timestamp;
>> +	/** @metadata: Event-specific payload bytes */
>> +	u8  metadata[];
>> +};
> [Severity: High]
> Are these structures missing the __packed attribute?
>
> Without it, the compiler injects a 4-byte hole before the timestamp field,
> which also enforces 8-byte alignment for the struct. This implicit padding
> corrupts the intended binary CPER layout, potentially leading to ABI
> breakage when the records are parsed by external tools. It also causes the
> memory alignment issues mentioned above.

No, they are packed by the same #pragma pack block, so there is no hole 
before @timestamp.

Thanks,
Badal

