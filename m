Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D903BBFD6
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789909838; cv=fail; b=IKLqA+WiafrGBb14kZFBPAqdUEspaDd+peYjutmr1IFu9q9lQouz/Uf53qp9kytX6j5BkQ52anYTvBsDRAZke4sHui4XHnpZKRsCERo9k9ojH6O2bIfdqqaS5i624V/MIJ/lLx6uIKf2YBwEz64AfSrwlywzLIELTEfb4nRT7wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789909838; c=relaxed/simple;
	bh=9haxWzXFQ97V2oWPJrwN6hzulthkUf9Go54h2YWeeBg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k4CJynBpw28kCCbRdjlEb4oEFoHvrS0ilIz7cYC2Qm8y7Uy9BR1loSgqqdiTFoCC8NDDAFklTJMH9nZ6p2dy4rTU7xf45R2SpasSw3LS15pWusm7V47UKeNYinwQyUIqwdhU4jWRd/Hc18KJFUPxJ/X4HpfL1gRRG5CbS2sAjb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQH8DD5A; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQH8DD5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789909834; x=1821445834;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9haxWzXFQ97V2oWPJrwN6hzulthkUf9Go54h2YWeeBg=;
  b=jQH8DD5A7Z73ml88dwDBPdDC3pQ7y/s+liGyBj7eI0yhfqGGvEG6Kw7a
   NuaZRtvRXaW3cxm0WPm2vaBGRwT+dGMSCpjUlKSfbj+9Ya0c76JRJ8xsD
   PXy60zch6R0k9skLYo/VSlf4378bKMv1tJUvtwMuLfhEvJ2xb5UvwW/u2
   yR86hrEAnHVkasqJi1zlm7GfgK6f9kbJoH2oGY+GIhu9QxPbKB4lBhzrI
   PYliht5JkS9cKbVU1x15MLgC7W96CdJcNHn+i4MwrWj3PoV5efYq7fvlH
   eDVtLDHO6f8ZEdRw6eK5IlqOlW1JpDXVfh/IFTZ+JJXnWYFo2ZXOy784f
   g==;
X-CSE-ConnectionGUID: zm8ymo65QQ+2KrIaT7ChOg==
X-CSE-MsgGUID: 0y5dPC42RUidiMs9WJ6LUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="94235737"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="94235737"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 06:10:29 -0700
X-CSE-ConnectionGUID: nMfFdIlPSIicXHdec0WIAg==
X-CSE-MsgGUID: KSerhDIZQyWwqPWxSdOPow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="268825107"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 06:10:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 06:10:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 20 Sep 2026 06:10:29 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 06:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPPfBL0tkPeAcd6Dv/czPwyxcEfc8JvAWAm/icWHniTQ/GpbwyAptwnx536V+5FR7XDZC+K9fvPHkY0KkWV2/3Teuep+JJE862TbeRuaTPXpeOMu2KcyobZyHuW+mkasvY/6VnzSMLmG8Y1lN/KvymfpHAy/QZAsELgthTypSIteiFooWBlggnEDQW99UwvVYUcT+vcIMm+SGM3PTIIhz0tOTeweugqKgWmvIPLCF5yvXVnsk2GoZuKZtnS55RcsL2PpRLO9viuNyQdHTprPyjkVWQ5LjlJlf+5Ib2omHUdRf2JDcXlW3NSD4Xy9OG1YMaXTIsid7esubPKS8bmcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l22tuQ1lqyUE7gcIhVLIeSmudMNkjJUb2GEj4NHU20w=;
 b=lV9hcgKGHLGkNLHvjQyEtpk2CEb82eLY7oxgAYnjiLueWjGtcnhYoA4QXYwiL/L2HlneZtDwZy57K4j/cBOOcG1yswIx1dPJyQbk/MLuNOOdwa1Y/qj2vUtRzezRnN9DoRPpvTN7lrAefOIRDrkCYtVLIs4XskBvpopMCoSx2IG1yDhfPYYHqA6zzZtwWp4CVjzif8S6bTXEszMEds8hWQQXaSKUeb3ieQqV9nGxclGajcRijKHgKCaF1oLRtJBMiBh8lFCj4wrJn96clA0bCCsPNr82OLQPd9OOu23oKnUegCQoIg5jQDXl2eZTmraMVnHduPTU8ZH2XT5OaSDDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH0PR11MB9701.namprd11.prod.outlook.com (2603:10b6:510:396::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 13:10:27 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0428.014; Sun, 20 Sep 2026
 13:10:26 +0000
Message-ID: <1314f399-161a-4315-9628-8004ad260345@intel.com>
Date: Sun, 20 Sep 2026 16:10:22 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 05/17] i3c: master: Remove stale GETSTATUS length check
To: <sashiko-reviews@lists.linux.dev>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<linux-i3c@lists.infradead.org>, <Frank.Li@kernel.org>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
 <20260917191356.133242-6-adrian.hunter@intel.com>
 <20260917192630.41F6F1F00893@smtp.kernel.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260917192630.41F6F1F00893@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB9PR05CA0010.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::15) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH0PR11MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad9123b-7e6d-4056-3577-08df1718895e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: aj/KcXBuFi9NnZHchxLTU9BXeD/KvdYowniP7Vg5yXYaD6UwhzL4S5nvOgq7f8YfISsLXJ8BUaEuWUQFLYpeg1Pk9c3Lv0vTSmjS4xmg2hkID8OfOwNWGTJkHBMOjbzgkwY898UqeoDNbqknKo8+K9rj6U1vRTFPNQzm7bJhVWOT7EvJpLVmUoBI+DBzj3YTK5DHkillodA80RxTK6X+4crMwOx7OEAUcpN9OJnCUunOV+xbIc8Ecb45ghLjnf9+wWKOZAr1e8JCA0MasRKNUipMi4XaZjaAgV77MzQb/jc8dgRCH+t7eRWJ8CfMSlWVZFksbJzgXocMsTMSxuQHmRELmEHcRojCGd/ocRiUdw3lZQWOP2x3lQfSYzycdvzncvx/ZZM9Xeq9Tz5IrBM2NfDC0CW3fP+PhTsz95VmRPtJrD2NuKsiFwzYXFTKW7VMEC+IxzDAKrBC/1bg3jCs2aqaldB3XMTiob3K9SbJETnorGDfY+xSuWmJoRJTJLHUOjatPU8lRNt3jkW7iEEQ/3cHb0T+FYErGoZS4/CodDCG0SiE8IiBXMpuKDjmIof7zDp08DfTc1fugsVM0jt/8S1MK+j0+0y5zntOvVCeC34xmG7H2nB/AasEgErSx+f626lbGGKgsNDkWtHYUQVf0pqLuW0cBFZ9RWlQMkqsZmE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG1uWmtSR3JHWVBrVzg0VW0rUG1kVDd4UHFzOGc3TXVoT2VYaHlsVTZpK3d2?=
 =?utf-8?B?em41NzhJckkrZWhiZ1c5NGtieExjby9HYUExSEMxTE5oT2FxbVI0dW8wcVQ0?=
 =?utf-8?B?b2VqZHNNZnZ2c1VvUlhMK1gvVWtPYlBNNDJmS3dIaWlwSXhFbjYxa2Nxdktv?=
 =?utf-8?B?dDdBbmp4aDI3TVU5MUVodG5CWGlkVUlrLzRVWFVOK2ZrcHF3OFYzb0c3QW9X?=
 =?utf-8?B?d1NNOXA0QnVLYWNxbzNJOXlFNXNmRVpBV09IYTQ3RzBudGRqOTgzR2xCTHFt?=
 =?utf-8?B?WDNCcFdaa3d0OW9hODRHWkVncFZ0RDhHYjVLN205WktncGs4dktIV2xBRUNS?=
 =?utf-8?B?T3BMUmppTzhudlM3am5OUmdnMU5qVnhHbWhXTEtqdVdXM2NyaUFxTmNhUUg0?=
 =?utf-8?B?a3JERnFjbHN0TGhTa2dXN2J2TW44ZVk0NUIzQm1vQXQ2b2czN3BUbWozOTRs?=
 =?utf-8?B?amxqZ1g5em1FRzFGNi9sZ1l4RUdWajdGWFpVckdIOU9pRDU5cWcrRlZsQWlD?=
 =?utf-8?B?RjByWFJpN0pvbDFjeUJtS2V3cTlpMUw5YUlWWUdITGo3NGFSbXROeXIyeEs3?=
 =?utf-8?B?YUFWc2ExVElSMWNIMmNnQnh3ek8rNFhOdzJ4aDFScGhlbEhaRWh5RFpXNjJG?=
 =?utf-8?B?c3dPRWYzNHlZS0ZscmJxOWpKSU9LU21IMzJKQ3I4S3NoTkJGMnZGNHdnMFgv?=
 =?utf-8?B?MEluT1JWL25sZzJXZk9wRzgxTVVsL1ZnWnVpVTlYY2RUSTM0aStOWU1mY204?=
 =?utf-8?B?NE4veXpsOWNaWWoxVHJENmdjVWJuZVh3R1Q1ZlhjZDRRdUQ1ZG5YWmlyQ3Ja?=
 =?utf-8?B?MjJJWGMxMVF5S1JsMjhUZ3lseHkweHUydmFxVm9LOGcvcHhVQkptdzhHZDhH?=
 =?utf-8?B?SlBXRWF3dWhrNXpISmgwelBKUEpiamtIOEl1N25JSzFQUW9PVGpubWhRTlVx?=
 =?utf-8?B?MWQ5YjlJOWR5SGt1dDM2TmVKRUxmeUV5NWJyc1J4VS9hTVRFVUZNMTljUzdU?=
 =?utf-8?B?TjlGSGlmaFptMURtZEZ6TG11VURpY0RlV0djOGJtb2tJRWdNZWJBYVdlR09Y?=
 =?utf-8?B?ZzV6VS9ZVWR4UkUxWm1ZeVJFNDNWTWtrMVh4SUgwRWRFS29wQWxHdjNtclNU?=
 =?utf-8?B?K1hSa2lDbUJ6d05Vb2V5Z2pQaHo1cS9xZS9lSkdmdmdvbkZMcDV0M215YUdx?=
 =?utf-8?B?aXRnb0VtRVVQK2FDTjk2MzFEb0g5MjZkUnBEdTlJR0xuQWhRcHNSQUFvdUM3?=
 =?utf-8?B?SFE0UHo0MmtyZUpkZHpUd2hOMWJvWFg0NWQ2MnpGK0QxNnY5VVJTRE9YTjBI?=
 =?utf-8?B?SlR2eUZWeitRa0lkem05eHRJSHlkR3IwYllrZjZ3ZWxOUzBBbnNmSjA4WVdp?=
 =?utf-8?B?VWpFMG0ydDZsSFVIT3pBMW1ZUW9XOHBjZWw2T1Nmd2U5Qm16K2grSzVaYmhW?=
 =?utf-8?B?YXJGSXdhOXYwQ2l0MDR4b0xITWU1a2VZcE4zVk5BM0x2MXluOE02aUZKeXJE?=
 =?utf-8?B?VUpsSzl5ZWVVa24xZGRmWlVGRUlhaUZFTVh2RmNSM2pkaTY0em16bGsrcnRK?=
 =?utf-8?B?V2VVUGh4Z3VrcXJhbHRLN3dyaW15R1p1SnR6QWlWRDBpbU5rLzd2TFkyL2x0?=
 =?utf-8?B?NFpUbG5oSWJLRlZGc0dtYW1UcDhjcGMrcHJ0Q0JxRTBIZmExQ1BrYjA4TkJH?=
 =?utf-8?B?MVN1SStiSTFhNXBRRWRObEdBRUpzWnNvbFVpSytYamZCbmJhNXdWWHJ5LzRs?=
 =?utf-8?B?ekRiaWQvZjFMNy94bGZySWpvSTQzbXdzVmVBdEp0dnZhNHoxbDc5OHBIOElH?=
 =?utf-8?B?Y09teUpJbjYwdUtDV1hTZVlRS1NUbm9DcWdvRVFJMzR1ejJzWHlsZHAyMnRa?=
 =?utf-8?B?dFNCc25zR1UzdFdBZkdFRXdTTitnZ2YrUHpZSnVuQmJNZFMzaW94dmVnL0pF?=
 =?utf-8?B?RjJrUHduTDRaYWpuZWVoRkt2RG42SVh3Wlc5eXY1MkFNcHVKWDQyTmM4dFg5?=
 =?utf-8?B?SG1ZNWNhOUEvK3VJSnhJWC82WEgvRDZGNUNkN21Sb21rTmZDaW82RnVrSlVs?=
 =?utf-8?B?SnJxMmRjd25PT0RHeHYveHo1bjdPT0ZETkU2ajJPY0hPdWNUWFlhNWFkdC9q?=
 =?utf-8?B?dHN4eHk0WVFRQS9wSUpLaVlhNFJ0RlI3ejdnM2lhV0FWTGJ6Sk0yczgxTklL?=
 =?utf-8?B?ZkFjdUIxK1dKaTl1Q2NOMEErckZraGEyVHg1RDYzSVJDaFNTSjM2eTAwNjk4?=
 =?utf-8?B?WEw1VEg2ZGo2ZFphSWYxQjM1R1ZOSVphQjc3b1ZBL2psaGlsbllZZDJ0SVVM?=
 =?utf-8?B?K1RUdzNOQU92TldLRlpUWGlwUFBWVHRMczlhckVLTU9meDRhd3A4YnA0cDhZ?=
 =?utf-8?Q?Wig2LOY3adO7tiqM=3D?=
X-Exchange-RoutingPolicyChecked: XmvbD5+mp2QnsfD0BZKD3RJB+tRcykC231pVEsn26qzn+CameNfuBLwU1nwd+G4hzoklaGTVjasfMd1xpeS1X0OMcNVjd6qz86RjUqAK4qXYVt/pgULWw2VEn+4uoOckfIVcZmvmnqacZyIrSWPHypanFHB2+8fdkdo5k64I35NDlDABaQgeX4j6Cg/IWV9P1IIs5pFnE3DJuL5TrKeDpmJwbecr4GVMfuUvH5Ghj8GWYzpBAqC3/S+gHugklHy4lHJQxKNZ9mtRxz2eJ9ABfX0/sXIM9QYuLqsZvgfR3vf0rJ1vveXsgclzymqqgHSnYO7X6XrERoeULCEvBO+sFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad9123b-7e6d-4056-3577-08df1718895e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 13:10:26.4602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Mp/GAUHsqvHp4kGlUwBaURQgCZxw74az1xZDEJKkMr5J4EsIhnyYXQ21rdE0WaM+vcKEifZ5SuPXNU/eY8m/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9701
X-OriginatorOrg: intel.com

On 17/09/2026 22:26, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] i3c: GETSTATUS silent success on 0-byte read with amd-i3c-master
> --
> 
> commit f719c6d08e31060f2440ad1b34f948657af68459
> Author: Adrian Hunter <adrian.hunter@intel.com>
> 
>     i3c: master: Remove stale GETSTATUS length check
> 
> This commit removes an explicit length check in i3c_master_getstatus_locked(),
> relying instead on the generic CCC response length validation.
> 
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index 425b98e6efaaa..c50887b0b37d0 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -1777,11 +1777,6 @@ static int i3c_master_getstatus_locked(struct i3c_master_controller *master,
>>  	if (ret)
>>  		goto out;
>>  
>> -	if (dest.payload.len != sizeof(*getstatus)) {
>> -		ret = -EIO;
>> -		goto out;
>> -	}
>> -
>>  	if (status)
>>  		*status = be16_to_cpu(getstatus->status);
> 
> [Severity: Medium]
> Does removing this explicit length check introduce a silent failure on systems
> using the amd-i3c-master controller?
> 
> When an I3C device terminates a GETSTATUS read with 0 bytes on the
> amd-i3c-master controller, the driver incorrectly mutates payload.len to 0
> instead of setting actual_len.

FWIW, already fixed:

	https://lore.kernel.org/all/20260908111207.3274407-1-shubhamsanjay.patil@amd.com/

> 
> The generic validation in i3c_ccc_validate_payload_len() explicitly skips
> validation if !p->len, incorrectly returning success. Before this patch, the
> explicit length check here safely caught the driver's mutated 0-length and
> correctly returned -EIO.
> 
> Without this check, the function silently succeeds and reads the zeroed
> getstatus->status structure. Can this lead to incorrect behavior on these
> systems?
> 

