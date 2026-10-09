Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC53C397338
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 23:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791587341; cv=fail; b=avn0+RsmNpyMzSoJHPeAERYdrH/hdOhw/K+jLR1vuA1hfgfIFTDj7XA7yGCJrJvMU2O786YtoR0Mzt646DCUww/2RU7Tz3jNkj37UeyCReGcLGLWIqHWWhGfATos7VktQCuAJzLqhB5TyQhg2RvjA+KS9dgWOi6XWb3tb4DtNQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791587341; c=relaxed/simple;
	bh=1GMvjEB4toa7LR0EK4gmYLnvXqKLNjOcI7KLUXmpNC4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XsqQL+XMiUdpEuYLD38PzrNwHGdNRLHoZlAEHRJTvZo5uPSucMpNFFxYelUCJ7tU3wuMvLf8CNrYYPwmR0uZQJnWEI3e5LVMINAJUHOrhhJW/e/vlxyJZFUrejpXSsY73uC3lj17jXrk6fNCKDffidnVSdCVhMBLQxEU1fV5Ryk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkwegHFR; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkwegHFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791587340; x=1823123340;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1GMvjEB4toa7LR0EK4gmYLnvXqKLNjOcI7KLUXmpNC4=;
  b=nkwegHFRcQGfklEODfoRH/IgFn4j6NpA9a8sfrw9MLULTRXRcjDT3s2T
   9x2P8846yp+Q+GPJp5p8iTYU2HpZ0iQa13HaB253UYWfLvvfJ+uS8l8zE
   AhPqTx8H4xzl2b3B7rXlfJ+khfgz9YLISR66Sbl4BUb6Fivszj+2Kf/i5
   mVAefLBg0FHKy4E4mrqZs/s2D4X2sp59un+SkniumYo+UeOAPCxLKmjkn
   xrla2Q+jtHmAxkvLGe8XtfXJ4GsUD7HdWJj0apraBOtc1tnh55uOfLZGj
   LrMWzLpJv/ce1homibOtOV7w8KNlrrvbwNd9zkJTBTtmywSBpg2yzUbeg
   w==;
X-CSE-ConnectionGUID: 3XvJ/QXnQd2Vxvc3nCPdiA==
X-CSE-MsgGUID: f2GzxC0wTSmXm7MHXkwYOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="488812"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="488812"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 16:08:59 -0700
X-CSE-ConnectionGUID: 2hqkuGTTSVep2e4SXP801w==
X-CSE-MsgGUID: 8OBExUXMRDWwYX2V1AkKpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="355645"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 16:08:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 16:08:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 16:08:58 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 16:08:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrYmwaD3md64YN6ZzDy2MDkxc8b1FIBDq3wCjZeq/cym5GrxTSyTY7RtcNf+Gm07z3tj9oReLgTHS7PQozgrJ+heTNhv/PVPSAdLJp8HQ4DPzmSAPOeq5kbEwLnAPf8Ux4Z4NZnsAwfDEeo7miA5Ar+EpdTZXvpoTL8QMqqR5Mt2zL91IQoZJ0DHEdETvrU8b60wASxrUoZNS6cKFWoL/H/PsosTue4Mp3TJCsPb+uEuaGhgRQjQm9TNoCxmlzq73lqhTuYh9MmeW0wc9svIg2lxxp+1iIQjjFlzY+Nr/Aa91fEt5lAL5gCAgQ+dqIB9R6cPkh2tjssZn/y/2I/X5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJTCkf1iWBmgj8gtqz618MywL6cpeL6RI9VGSTYjgWM=;
 b=HDHVaCwO4MtIi1QwHQ0fr7bN9sKZMI8HRt3go97613sMvuYR/RB+LcKmY/Rxg/cIgp5BQ99L/ozchXTD8hhOY/fhAlXchc5hPkwyLFSjfMIlqN7yXn3Sx7TdKhVDZF6kxTYDLPJrBVw+YM40qX9gELZ415j3XvhOmtqyo/D0I7jFEhqXcdXlO1KUCby3E9WpAMQ4qWvuHMvfDACJEU77/P1dvkH4LykJeIplzYkBcfNAqkaSMvbAwGVg7FocrIXH7q1wx7T1nKdKl0ZReYxuwi4bSI1EmDLqMiWTOwhm0kU9F8JaPTMcKJ5q3TY5nrtFm9ajsa4J0JhK/Agel3A3pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Fri, 9 Oct
 2026 23:08:57 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::7b0c:7df:21b8:dbbf]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::7b0c:7df:21b8:dbbf%5]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 23:08:57 +0000
Message-ID: <5544f018-38e5-4240-a1f5-4e1fa509d89a@intel.com>
Date: Fri, 9 Oct 2026 16:08:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v2 5/6] ice: remove ice_agg_node wrapper
 structure
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-wired-lan@lists.osuosl.org>
References: <20261009-jk-cleanup-vsi-aggregator-nodes-v2-0-313964c25c7b@intel.com>
 <20261009-jk-cleanup-vsi-aggregator-nodes-v2-5-313964c25c7b@intel.com>
 <sashiko-outbox-166032@kernel.org>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-166032@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:303:8c::22) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|MN0PR11MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: 83979866-f991-432c-29f8-08df265a4bb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|10067099003|6133799003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rul+aomL2FzbrAvHvxrk85kt2IDKjt3EU3IUJEfdGOIng6SEVFPRUfDAOrOLYvWj3plwgpBNNaDSlX7Bkvarcc6j6BOenSJiOvqQGVgQphO+jhp3HgxyiGcJccembRxQtkSqhhqZcITDpZWSDg5K3dOmsBY6C3Rmz1k91PF9K+YFf1xlfUrjEL66MhounaeS3/0APLl3z2Ug2pij6bQ06Jw5J27yA4M297QsjJ7t0wixA7H/ZgI2eDGe/4ruKzFH6nElO3xa02S3YWzVMwf42LWvzy3Ogz/DWtd4lUTwQ/fe5Ek1tl2Oc536V9uNrOncUOOQAGW25kbu5yujK4RVvXCkgG3457j8U115yeSX4NyO4NjXtF+6ApXH5gKf0T5hWgqic9qVgqEN4AGpiZRz60+TlmCdD/qnpGmmGC3XxgJJ7KnZIEmzi5Y81GT7WSjktdhShSArFQQq8yl1la5psFKj59Eb7VobsAsfZOegmYhZbKN4BANGTcZ3bYjLGqRlbXrnhdZnWfXVoRd7mdLY/pL4xWyhOD4kD8CX0Zwg5dXQLk4g7UEK35gR2DNFoWr7vpL1Z/zQ4NOv3fZ2qwPGsGtzpctJggf5xiPnp0bPp6sjsH0TVLiFuGn0+0gIVDY5WXEYTsqRwwcQaWuSVXJ6juJhUhBRg2fgA/krytHzCtE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(10067099003)(6133799003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UURndll4K1JMdFFERUhzRVlGV21HbkMvRm1qOTdCK2VuSFhUUkljekc0dUU2?=
 =?utf-8?B?WnBHUG9TN1owZStXeVJYempla2Ftc2F5T1UrVVJKaFc4ZmRSU2lpWVc1TXpO?=
 =?utf-8?B?SHViZ3FNaVpuTDU5ajU1bVBtQmFXQnBzNTZLc000V0g0QWZCaXU3dUdqNEFq?=
 =?utf-8?B?OStTNEw0NGJ0blVuTG55QmdXaXV3U0VZOG1FVWxMMTBqU3pjTWg2bHRDS3R4?=
 =?utf-8?B?THovZXZ6NTE1N1d4N3haaVp4SmVzdytXWkFEaC9FZHpaTUhsb0ttZ2JDdFly?=
 =?utf-8?B?aHo1MFBTNk5YOEN3NDZGcUsvQzNUTGlrSTZIaERPa2g3TmVEcC93Z1JqdnJI?=
 =?utf-8?B?bCtHdUd5RE9xY2kxbkExbG10UmdoUGNlUlR5RmkrUWwvT1RjcG1XakxJQWFa?=
 =?utf-8?B?bFJYU1NYbnl5NW1qeFY5b0ZzQ3ZFTXlMTVYvMjYydTc2WHpSRTB5SmFSdzJC?=
 =?utf-8?B?R2c3bVVkOHhmUm4xeWtiMENnRWlRMWFYc0x4Z1hQMDNTN0RCdDh1ZWNrMnR4?=
 =?utf-8?B?MkNPUXBjUWxNeFlzNkJSdnQrb1QrbmxEenBFUGtjN3NTZGdoQ2NrRkM5cTU5?=
 =?utf-8?B?ZFVqdmEydi9xRmk4SFlsMUtRNi9nZ0cwdUdIMnp0Z2ZwNEkrRWoyZWNMTkM3?=
 =?utf-8?B?aGMrRlA0cFk2OS9PV3VnTFZJL2k1czVoQ1RFUExTNndnWTRMeEpSblIxMmJh?=
 =?utf-8?B?RzhtTUUrS0x6MUx2L0t4SDlLMWgrVXREOTNlZmFRYmtqQjFEVG5ic2wrR2pF?=
 =?utf-8?B?SU92VzB3SW5pTThkUkNuQkJDb3dnOGRYdk9LQ1RIRVhFZEE5L09NMUJZa1NG?=
 =?utf-8?B?cEFaZ3JOUEtxZFhKWHdVZDNDQ2t5R00zQ29uaUdwUGV4SDBKdGhIcUlQaEl6?=
 =?utf-8?B?KzJpUHJtakJRMlRIaTNYdE5qS3M2aTBtVXdFYmtvamJ2ajFCU3B3NlU5TVpv?=
 =?utf-8?B?YUtwZkQ3eWxxTXJOSW02QnkvSXJWQXJURmZ5cFcvUGxGWHRjOUpkUVo3WGlv?=
 =?utf-8?B?R3RkKzliT2tpWCt5YVpHZmo0a1VTY1BaSWgyT2E5Mm1MYW5DUHIwYUE4NnBn?=
 =?utf-8?B?bUVSdHl4UUNzL3NMMjc5Sjc4cmM0VDZMa2tNbjlOY3pjVHBUL1ViZW9sSmZk?=
 =?utf-8?B?cWVNMmdlaGo5alYwVXk3NUpFaDJKYmdDRXU4c0pFbkpLWVJKeW03TjFBNnR3?=
 =?utf-8?B?bzBOdkw1QjZwU3U0SnpCMTdBSzZPV3VBSFc3cW41TGhkVzgxSUdQZTMwbWpz?=
 =?utf-8?B?Ly9sRkFWeHh5Y3JVTUpHYjZKVkNhOHJDZ2pZL25oc29kMnNzWFExWWkrRjcv?=
 =?utf-8?B?NzNpeGN1d1ROR0UzQkZIemR3b0YwVDh3eE50bmNOTlVBWnR6RktDQVlqUjU4?=
 =?utf-8?B?Q3BlbHRSUEVSVlJlUFBqMGNIbE16QldtVkFwa3oreTRFMDJUOTZVNFJsR2VX?=
 =?utf-8?B?cVNWekhOWTBTY3NoSVVYY3ZaQjU3eXlXSk9xQldjWlJEcFYycHRWSXRJUGlq?=
 =?utf-8?B?dFlXN0tKMURIdE8wMWtNd1A4cWlYZU5nM3pacVhqNnhDYWVxUXM2bFFSZG9U?=
 =?utf-8?B?c3dZMHdTMHc5eTlZdHVHWUg3MnBsSWlvQUxoTE1xTmxxZm1CakpKR3ozNnlU?=
 =?utf-8?B?Z2hsTDdjWmpPWUYyK1FjajVzNDF4MFdFRUFVb0ZJQnF4SkZOMkQzWWpESHYv?=
 =?utf-8?B?U2w4N0xLcmdjdlZWQzBRMFpxWTJPdDE1UWJCcU1DUU5wSHd5U1E1M2lwZFRR?=
 =?utf-8?B?UEJjUzRKZjhFSmVxdEdhQnNVNi9CQ3dKRkl0a3dnV3pnYi84QUZsaCtYU3B2?=
 =?utf-8?B?bFJYY0pyY3NDL2ZDa0NrSjIxdTRPYlNTKzVPY2ErT3FUUUVQWmswb0o0NTkv?=
 =?utf-8?B?VTRreWxFbFFESDFmOFFvd1ZaTlJHaHN1Qk83WWsxeUdFMzFIRHBjRkNzZytZ?=
 =?utf-8?B?MlpQZFNWNExKaldEQmJqcDVJNjJTWU82VWNrMTB1ZkU5RzdqSE1LSkYwVWdB?=
 =?utf-8?B?cWpzbHozbS9zd1ZKakN3bm91K0NoVXBPalZtMnpOb1VwRGxORkxnT1pNdkNm?=
 =?utf-8?B?TzQwKy9wTjYwOUJiSEhSVWtuUFdkbmZLT1NuVjlhOFQwRVJzV1VPL1FuYVlF?=
 =?utf-8?B?MTNiNU9ZZTZ6eHVKQ0N0UUVLa3N0Y3BlSXhCL2pwbVA0cHJEVXdleVQ4TE5m?=
 =?utf-8?B?QmRIK29wY2JBSHJLekdTbWlqRzdtZmRNRm9rZEE2Q3l5TUxieDYzYWVRRGMz?=
 =?utf-8?B?VzlRZnVaeUlOUk1OUVZudjdrR0FsdHR4ckQwNnRhaHNPVGFWWXNYUXQ4UUlq?=
 =?utf-8?B?KzhBRklKVzFaYVFuRk1aQzNzMFFUVUJpQVUxQnBKL3BoK3dPaThzZz09?=
X-Exchange-RoutingPolicyChecked: xftYcZUTUto6eTpgf7NZfKwIYOdYI7Uii/Qr1Ea0ObAnwZA5wKl15hCa6KYdGazFVMEE7q9MyiADKM6SYWODaWSuU/suFs2HnUZAWjsnjSeOvM3hr07EMTaxDHo7kBxlYI6RXqapdk2z/2118wYrRH99IotxXmGMnm6YDxz6dadi4NA9rexBB8pLYnzk4pM0V2GxcqHbWkkXyBa0JAm58VxXAAn9Lvjo9Xq6zOV2TB9PNsHF1EFHcPm0XESjZpum8a929PXyXkRgbyxzx4MJJorv/fgmbQPuc3Fom6iNBYDrLDklpnY7FCPflHcAIhEaOCHX8Gvc612qe9rK7uBzcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83979866-f991-432c-29f8-08df265a4bb5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 23:08:57.1223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtcYDgCCmkZTBC/b8D6Q9iTHp1rTEDtu0Hx/Zy4BRMWzBQHKk0qsqmYMJ41SVIpbZdtikmy3sOYEXjZGA2lYDI/6IsT2WVo+xF2kDlBf0Es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6207
X-OriginatorOrg: intel.com

On 10/9/2026 1:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ice: VF rebuild fails to re-associate VSI with fully populated aggregator node
> --
> 
> commit aed63df873bf36bec0897ed1209a7e411aadbd13
> Author: Jacob Keller <jacob.e.keller@intel.com>
> 
>     ice: remove ice_agg_node wrapper structure
> 
> The commit removes the ice_agg_node wrapper structure and replaces it with
> existing scheduler aggregator info. It introduces ice_cfg_vsi_agg() and
> uses it to look up and configure VSIs during initialization and rebuilds.
> 
>> diff --git a/drivers/net/ethernet/intel/ice/ice_sched.c b/drivers/net/ethernet/intel/ice/ice_sched.c
>> index b1c2901b23f12..f0b1924b0411f 100644
>> --- a/drivers/net/ethernet/intel/ice/ice_sched.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_sched.c
> [ ... ]
>> @@ -3082,6 +3082,114 @@ ice_move_vsi_to_agg(struct ice_port_info *pi, u32 agg_id, u16 vsi_handle,
>>  	return status;
>>  }
>>  
>> +/**
>> + * ice_find_available_agg - Find or create aggregator node
>> + * @pi: port information structure
>> + * @min_id: minimum aggregator node ID to use
>> + * @max_id: maximum aggregator node ID to use
>> + * @agg_type: The aggregator node type
>> + * @tc_bitmap: TC bitmap for a newly created node
>> + *
>> + * Check the existing xarray of aggregator nodes. Find the first one between
>> + * min_id and max_id which has fewer than ICE_MAX_VSIS_IN_AGG_NODE (64) VSIs
>> + * in use. If there is no aggregator node that fits this criteria, create
>> + * a new one between that range.
>> + *
>> + * Context: Must be called while holding the scheduler lock.
>> + *
>> + * Return: A pointer to the aggregator info structure, or an ERR_PTR on
>> + * failure.
>> + */
>> +static struct ice_sched_agg_info *
>> +ice_find_available_agg(struct ice_port_info *pi, u32 min_id, u32 max_id,
>> +		       enum ice_agg_type agg_type, unsigned long *tc_bitmap)
>> +{
>> +	struct ice_sched_agg_info *agg_info;
>> +	struct ice_hw *hw = pi->hw;
>> +	unsigned long agg_id;
>> +	int status;
>> +
>> +	xa_for_each_range(&hw->agg_nodes, agg_id, agg_info, min_id, max_id) {
>> +		if (agg_info->agg_type != agg_type)
>> +			continue;
>> +
>> +		if (agg_info->num_vsis < ICE_MAX_VSIS_IN_AGG_NODE)
>> +			return agg_info;
> 
> [Severity: High]
> Does this check inadvertently reject fully populated aggregators when the caller
> is explicitly requesting an existing node during a rebuild?
> 
> If ice_vf_rebuild_aggregator_node_cfg() attempts to re-associate the VF 
> with an existing perfectly full aggregator (64 VSIs), it seems this check 
> evaluates to false because the SW tree structures were preserved across the 
> reset and the VF is still accounted for in num_vsis.
> 

Two reasons this is not valid:

a) we only call this path on creating a new VSI

b) we already remove aggregator nodes through ice_vsi_decfg()

I believe we will need to investigate the first path and likely need to
recreate aggregator node config after rebuild, but I haven't actually
tracked down what the consequence of the existing logic is yet.

The existing "replay" logic replays any remaining aggregator node config
without going through this "init" path so either way this path is not
supposed to be called in that way.

>> +	}
>> +
>> +	/* No aggregator node exists with space, so create a new one */
>> +	agg_info = ice_alloc_agg_info(hw, min_id, max_id, agg_type);
> 
> Since ice_find_available_agg() returns here if no space was found, won't 
> this allocation attempt to create a new node with the exact same ID (because
> min_id and max_id are both vsi->agg_id), causing xa_alloc() to fail?
> 

it would, but only if its given a single ID, (as in the VF rebuild
case). But in that case, the VF was removed before and is re-added now.

>> +	if (IS_ERR(agg_info))
>> +		return agg_info;
> [ ... ]
>> diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.c b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
>> index c56a35b8dd48f..a67586f7db8be 100644
>> --- a/drivers/net/ethernet/intel/ice/ice_vf_lib.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
>> @@ -471,24 +471,20 @@ static void ice_vf_rebuild_aggregator_node_cfg(struct ice_vsi *vsi)
>>  	struct device *dev;
>>  	int status;
>>  
>> -	if (!vsi->agg_node)
>> -		return;
>> -
>>  	dev = ice_pf_to_dev(pf);
>> -	if (vsi->agg_node->num_vsis == ICE_MAX_VSIS_IN_AGG_NODE) {
>> -		dev_dbg(dev,
>> -			"agg_id %u already has reached max_num_vsis %u\n",
>> -			vsi->agg_node->agg_id, vsi->agg_node->num_vsis);
>> +
>> +	if (vsi->agg_id < 0 || vsi->agg_id > U32_MAX) {
>> +		dev_dbg(dev, "VSI idx %u does not have a valid aggregator node ID stored\n",
>> +			vsi->idx);
>>  		return;
>>  	}
>>  
>> -	status = ice_move_vsi_to_agg(pf->hw.port_info, vsi->agg_node->agg_id,
>> -				     vsi->idx, vsi->tc_cfg.ena_tc);
>> +	status = ice_cfg_vsi_agg(pf->hw.port_info, vsi->idx,
>> +				 (u32)vsi->agg_id, (u32)vsi->agg_id,
>> +				 (u8)vsi->tc_cfg.ena_tc, NULL);
> 
> If ice_cfg_vsi_agg() fails when the original node is fully populated, does 
> this break QoS and bandwidth isolation for any VF assigned to that full
> aggregator? The previous logic specifically checked for and gracefully handled
> reaching ICE_MAX_VSIS_IN_AGG_NODE.
> 

This shouldn't be reachable. I'll try to investigate how that was
handled before. I don't think it actually *did* gracefully handle this
scenario.

>>  	if (status)
>> -		dev_dbg(dev, "unable to move VSI idx %u into aggregator %u node",
>> -			vsi->idx, vsi->agg_node->agg_id);
>> -	else
>> -		vsi->agg_node->num_vsis++;
>> +		dev_dbg(dev, "unable to move VSI idx %u into aggregator node %lld\n",
>> +			vsi->idx, vsi->agg_id);
>>  }
> 

