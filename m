Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517675616C2
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 22:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931483; cv=fail; b=ESIxKax6xnZA9F+EkPWDlqRl0dvDnngOtANG/C1FFaEaTImSheZz+OcsuJtrVEbBMyMdaiTo0QAkh1H68E0V1hd973MqO4jqqkWDpmZVyDkd/TTheLFxJatN5I8G7DE1aKqi3QU/JxTvcFQLhalFyA9OZBIgfembMQE9fBmeWbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931483; c=relaxed/simple;
	bh=yBK1/D83NOb/lmfsc1xKTadVjZXZETYlBE2cCcd6F1Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S84oXvAaF3hBx+L+lK0Qdxr+PDMmOP/cXVQiHOUo3RHTXZVxP13T1qEDjolGFjewZpIG79dlyBTL+7vP8sqSuAbJ1/UKALUxkfazWGt13UojDa3HNQrOJgdzX/dWkf/bmFddUtPi4E5oV71oqO+DvTbD/EKk9tPQSjDVJIlfLNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRWQRK3d; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRWQRK3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791931482; x=1823467482;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yBK1/D83NOb/lmfsc1xKTadVjZXZETYlBE2cCcd6F1Q=;
  b=DRWQRK3dHKXf8m1t6KbW2UP8CMB2wdQGakjNSbnKBelF+2bIwXd21ZHL
   rTmY2TWsJ0tHXTxHRUZCQ04qo8OCbmJFFxavhcmyJmtrub1FmQVgrFfsU
   izIOWvtqRad9LA+A6V3UCEHC92kWszi350hvLRnIF52PVuDXFOziCJJVN
   /7eD0COlapizHZXUjJL5R8wlr8ddVqX8i9zooRO85HgAN9G/Beon54zJS
   NESDd3GBRw1rl3hdQIrLWhecKbwiX0NnsaeY8IWF3jMGIQrgih/kXBMBa
   lJ1NVkRDTLJT44hjFDihvaRMK5mJimzSthopLMBKn4Fn4Yg9y1sqxYcIz
   g==;
X-CSE-ConnectionGUID: 7URfDbYfToqBLh2K3e8ZAg==
X-CSE-MsgGUID: 8l2DdtZ6Qqu7Haa1bX9wBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="663914"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="663914"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 15:44:41 -0700
X-CSE-ConnectionGUID: NIKNG5VtQmmYGUkiug2kKw==
X-CSE-MsgGUID: MqHHANxeSH6yFC6BaOdAWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1241355"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 15:44:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 15:44:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 15:44:40 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 15:44:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0r69YBm3HrobZkmtG1fwxHBBirN9HvgMOCgJWn9pWD2CdOg6Vk5uGMK9a6f/2icJyuH7nIxDZyLfJFGG33RHeZAhSxPQ89KVmCJAJWtN353mkPYpX8dUp1viOh2IXSP8U0MO1BH/2m+HY+zaVV33eLKS19vz3TCVxu2pANb5lyq3umFgNp+xhJ4uiPDcp/Jg2SmnAVDJS7UBEGE6pppz1MjMR6xtiDOC3MHrVp6MbsjmEfCVx/LVIoSrraplHsZv9+DuBmTGG7oGcwctyaONMaqoL89sVAKG0F3/MuvAVRQovWd7Z1WcKHjFs9Glepzpgu4mpnVTLdDaqovpadM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXmewEhOM1m84mY2iXvK+7PKgDR5DefviiU2DzxlhqY=;
 b=fHxUnefuaF9nWlY2naVAdKBrSpoNWCCLmhG4ntIW4NyNQKWWCM0pU3ee4gs8uT0ZFIEgJo9mQlTMjx9qoDHAMfEGCswOtyAivkpydblqaidw/5gvj3893mHz/38Sk6mUhARyMzJSbkaebF/OpmV5kAIvVcK5uVlCvZNDc8xdFB+b5nvZEmAsAbBYK7VVfGd4rzeOzSY9JptPzfkhuOtgnqeTHtO+RLPpp4g0+e8lU/3yZ68RHbqWIKq3COEv47a1VCymyaj3j1guoqzLMAJmpzvmCk9krHvIui2BD29XOvD8TO+Jtu4Ax6LOgxfSoO03/GXBYn/nUnNLQ2s3yFXy3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21)
 by SJ0PR11MB6815.namprd11.prod.outlook.com (2603:10b6:a03:484::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 22:44:28 +0000
Received: from DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::2592:f5a9:a751:be40]) by DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::2592:f5a9:a751:be40%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 22:44:28 +0000
Message-ID: <1359eb62-9f0a-4ac5-82e8-3e4bd6603d7a@intel.com>
Date: Tue, 13 Oct 2026 15:44:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] ice: correct PTP register access debug messages
To: <sashiko-reviews@lists.linux.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>
CC: <intel-wired-lan@lists.osuosl.org>
References: <20261011113545.16718-1-alok.a.tiwari@oracle.com>
 <sashiko-outbox-168021@kernel.org>
Content-Language: en-US
From: Tony Nguyen <anthony.l.nguyen@intel.com>
In-Reply-To: <sashiko-outbox-168021@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:303:b8::27) To DS0PR11MB8230.namprd11.prod.outlook.com
 (2603:10b6:8:158::21)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8230:EE_|SJ0PR11MB6815:EE_
X-MS-Office365-Filtering-Correlation-Id: 797f9556-fd50-4d64-b905-08df297b89c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|56012099006|4143699003|261009223027099003|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: h6uAArAcbjDPtmifaaRhJrnU+iOLaBUYyUORg1tSCFrpf15cogl4I0Pgs4Gz+vK2x3vg0Y2x/S/WudjMmMG9Pkd3gZLNuE7iHgwloq2i0z55g//OS0TZnv923fYjgkupht3UPiX5Fs9w+d71yKOVbTuqptmzYeA8BW6EtW54VhayoAX7WKQf6hX6wck/6BegkgdLBfx6zfaIH3cYQ6Oh1FZl6CuGVBmAibiN/2LnK6EAA2sTfQ7E2I6C/Te842jJIfSmonkYu/HQeoZFzPKRWAq8XEZv2xHdzRUYwH88B/CPoHZ+QFe4sPjko7dtuNm4kdo4+9W9fS63vEAy9htaDaLhARJfDhn2QcUe2qg4/ukEBQNzM8EsX0H2AXEaXxRE+LjPz/DN4Y0wSsyMcpTYC5mSxtA4cycz+vYVOCosMjOYlPyYkG/p5eMB2spTHnKfe9NkXSNo/Ilx/yXtSl9lT7ICrODo7mcPF0gq9rDMgF9HcGdv6VIqAzl0Ds2arMjfyUM+nQ3DZX928BqOm7KkRPZ0b7d8g96ku5Ft6RUxWzzepXjXSoSsPd3BcuBZSNWeBxRYdesY0Zhy2HT3GOiDJA3SXmIYHSFmNTu+Rio+CM2rXT2VDSv5Oex3CT3fy2NBSGlr6CuU97JaZ2sNn0aHCakVtPnr5a0uyDcET1b47p8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(56012099006)(4143699003)(261009223027099003)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ukp0VldEdEZGZ1Z5RjNkem8rdDJmSHBZbVRzSzloc1NUN3MvSURNQ09QNGs0?=
 =?utf-8?B?OEdldk16aUN5NlFVcE05WkpNbUVuTWE2QkEvZE9nN0lMOGx3TjVtcVRzQnA2?=
 =?utf-8?B?d1JkekYxYjNZTnc5VCtKc055NzQwUUZjQXloZzBsaVBnZDR5TjZ6RFRnWml5?=
 =?utf-8?B?NS9DeEp2NjVkcU5FRkVpWnVFeklST0tWOWdDQlcrNi9ycURMSWdvWi94MktS?=
 =?utf-8?B?YWE1SkhMbmRPTHUwcGNYeDVySTdvTkhxVXNGenE4Y3I0WWZlckRYYjJFSjhR?=
 =?utf-8?B?MVJVblpDT0NmRE5pMkpQeTZCYlF5azJGZ1ZtQ2hUKzd6dlZSSXdCc2NxSENq?=
 =?utf-8?B?NUNPTjJXc1BBQThyOVFORFE0MTY5blpUOFFFVmdUdlJpM2huZFdTNkRFNnVs?=
 =?utf-8?B?aklCZks5VC9uNXBPMGd4alorMkcvL2ZCWnNIVTFPT1IwZ29oV1c5MERqMDJu?=
 =?utf-8?B?K3pTbmZLWW9Pc2xlQ0NNaFByd1lpNmY3RVl3Q1k4VHBZRUJiaE83UVNmOVpZ?=
 =?utf-8?B?dXFsVkZrek5ZbTIwK3lsOHFTTWZmUHFNUnJnZkhkazdVMXVZYkppdklsQmJi?=
 =?utf-8?B?UFh5aXNSRUFMbStUZDJaTFpiN2pIOTE0SitRNDUyZ3VGL1c4WnY2RFBYMzBZ?=
 =?utf-8?B?RGp6ejZ1aE4yOHdVT1E1eEpXZEV3a1I2V3NhTFROZy9YNEpTeVUwR1JqbTE5?=
 =?utf-8?B?VXRCeDhvaGdCRFdxS3oxMFJ1TVU3VEtER0YydCtOekNJclAvMWhyODZEeDRx?=
 =?utf-8?B?SWxCUGtVbVI2MTBGTUx1dTF2c0xoQU8wNGFwbjFPZDdJZk1aaUI2RFZyeUF3?=
 =?utf-8?B?dkhmY2NmcDI2cHNTeTFZUnA2a29vaFcyQ3hJNmd4Mk56U3VtM0NQODVFVnBp?=
 =?utf-8?B?MHB4YU1BUXA2Q3lUbXhjL0VoamtPQjhDSDd0TXhJV1N6dTVEK3orVVpFN2tW?=
 =?utf-8?B?WTZxOGZkTWxrVTU1UFo5YkFRNjFuZk5WR0ZYelBpOVFxbklaRGd0NmxOUDZs?=
 =?utf-8?B?Rm9BOTF1ejB2SUhhUHNWSXVpOGtQdUNIM2dsL25qMnMxM2RuNEFINDBjRGJp?=
 =?utf-8?B?SWZEQzAzTzVQbEE3emQrQitCOHBvSHdFbHRFWmFSSzFFSjh1TU9ydkNyVFNk?=
 =?utf-8?B?S3NiOTd3d2J0cW5SZ2N2SlF1dlQ4U0F3MC94U1U4ZmdLTnRlMTZEY0x2Vjdr?=
 =?utf-8?B?TFd5WEFTMzFMMGl2Z2RGY2JJMDJiN1licjRpNGpNeXJ3VXhxbnJZQnNmdWhw?=
 =?utf-8?B?RWdZYUZBZmJ2dGI3dVNyYURDMU11VkFaSGtxTHExN3pENHg4R2U3RVE0bkM0?=
 =?utf-8?B?a1dTQnNEVFJPK1BQL2RYTFRrUHpHOXNMVTFGbXV0c3lXcXdoVGFJSjlMc0ZR?=
 =?utf-8?B?Z3VkcXROdzdxQzN0NGpVZjJwTmFGWTlML1VOTFJJb2VtcEQ0KzIyb3o1eFRT?=
 =?utf-8?B?cmtXc25pU2E3Ukdmc1QzaXh0b2xQSllaMEtOL1dyQ2J0NE8xbmhmWGJvckdX?=
 =?utf-8?B?enZLeVJsVjBwYlMyUjFpNW9kVVhuWUpYRDZFYWUvZkdmOWFJbDh2UUR6dFFj?=
 =?utf-8?B?YTEwUGZvZHBZOFBVNVZ6YWFoWmw2UmRzV0lCZTJxWWQzYzljd2lpclFLYW9Y?=
 =?utf-8?B?b2QyamFrK3hJNlg2OTlvaHJzVW54ZHV1SnpDekdqS2pMYytieENWU2E5TjVj?=
 =?utf-8?B?ZlplUjZlZWRicU9BdC83S1FMcUhta005SklTK25SN1ZMV0JmMTZJUkxnamlQ?=
 =?utf-8?B?ZmJZdjdFYzZqanNNQTdJd0kzMEJSSjBsbXk5bVVXOVpMNWFYemh4R3dXY0Nm?=
 =?utf-8?B?VDl2QjUrZGE0eTJiK3NYRy9PSmMzTURZZzB0U245SXNMNnMxSFAzNHltcnpU?=
 =?utf-8?B?SFpFMzNLQVFibWl1Mk1FR205UWk5RlJlakdBdUdaK3VTZFQ0WnBJK0dubEdY?=
 =?utf-8?B?aUlNVzJSdVdMUUNXYWp3WmNwMEVDR3pzbXh6ekYxZE45aDdieW9LSGZjSUMv?=
 =?utf-8?B?aGp4ZHBJbUxCSkw3R3AyaUtueE0rVCtYblZoeERaSXhhMjJ4VkxRc0VwV255?=
 =?utf-8?B?MjJkNWNGS2s4RENhYnZ4eHFHVzQ1ZWVJMVhITkFBaysyUkVDci8vUitFYWhP?=
 =?utf-8?B?RHpORXJwbWltUFdzL0N5VTlEbnhrUzlMdEI4ZExTMzFQRUsrczc4ZzNPZFQy?=
 =?utf-8?B?WnVJaDErSlhQSjF1dHRjbnhCU2RtMU9OMDIrK3hBTnpBWHI2VHNONFlLT1pQ?=
 =?utf-8?B?OGNkSGlWZ3JPbWk0UGtjbzUwNWNQdzgvaEN5bzEwNG0rNXA1RDJ3eW1rKzBt?=
 =?utf-8?B?Nm93NXkrZWhMVHJCZW5CQXVkYkYzK1BqcWUvSTNyTTdqZGVBTjNGWjZqZXFj?=
 =?utf-8?Q?oQ5UIUsbOFA493iM=3D?=
X-Exchange-RoutingPolicyChecked: x8jyubTqszYzPvksxetU61pYwNU5NttGwObAedFOhJzqHA0/VbFnjOxWHfCMhsVc5xGCDt+JV56QdwEQA2+yzlFHYz2/0emhMCAJuXRzb8AzZpj2Nen1oHvx6kux9yjb6mKB1ozJq5VorJgjwrbZe4ds/7utn0AjKD+aa31R2ZsHJmfj+nsE2XtVuOZe8gxoJyWhtjp23uVVjr+KreO4TgBj3A0HyU1dhV+qdnViORUugl8oW7i601kYtrIq2/uTGzcRbfm9qaI5nRSsjGUYCWdYWycjvCnptmZwJUDHtzxh4Jx/f8Z6ZNYSNJhhwuI6k0dIzFw+FX39ltKOJnqWxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 797f9556-fd50-4d64-b905-08df297b89c5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 22:44:28.0363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cr3YfEPC92unpyPYYy+3OmhQUH0RVZhAtN2o84H8eXbN6TzdU1A6o05WvNin+Pe5XWmYVxFrO8FOYwywkWNQ78xJ97h/XovAviO5WBr0iTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6815
X-OriginatorOrg: intel.com



On 10/12/2026 4:37 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] ice: missing trailing newline in debug message for threshold write failure
> --
> 
> commit 3dfc5e0655da8eeda86700792eb12011c421ed4e
> Author: Alok Tiwari <alok.a.tiwari@oracle.com>
> 
> ice: correct PTP register access debug messages
> 
> This commit updates the debug message for PHY_VENDOR_TXLANE_THRESH to
> report a write failure rather than a read failure. It also intends to fix
> newline placement in PHY register read and threshold write failure
> messages.
> 
>> diff --git a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
>> index 3a41c711e751b..289e0b3ef6ae9 100644
>> --- a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
>> @@ -1529,7 +1529,7 @@ static int ice_phy_cfg_parpcs_eth56g(struct ice_hw *hw, u8 port)
>>   	err = ice_write_xpcs_reg_eth56g(hw, port, PHY_VENDOR_TXLANE_THRESH,
>>   					ICE_ETH56G_NOMINAL_THRESH4);
>>   	if (err) {
>> -		ice_debug(hw, ICE_DBG_PTP, "Failed to read VENDOR_TXLANE_THRESH, status: %d",
>> +		ice_debug(hw, ICE_DBG_PTP, "Failed to write VENDOR_TXLANE_THRESH, status: %d",
>>   			  err);
> 
> [Severity: Low]
> In ice_phy_cfg_parpcs_eth56g(), is this missing a newline at the end of the
> format string? The commit message indicates that it fixes newline placement
> for the threshold write failure message, but the modified format string
> still lacks a trailing newline when ice_write_xpcs_reg_eth56g() fails while
> updating PHY_VENDOR_TXLANE_THRESH. Should a \n be appended to the string
> here?

Hi Alok,

I know this is pre-existing, and low severity, but since this touches 
that line and the commit is fixing newline placement, would you mind 
adding in the missing newline?

Thanks,
Tony

>>   		return err;
>>   	}
> 

