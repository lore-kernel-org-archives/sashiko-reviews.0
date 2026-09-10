Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F654BFE93
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 00:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789001231; cv=fail; b=iarHlU41o5iSmGwY+HPaL9g4wcYHhe65PksFFcAi7HW975FzpOeXLt6468jgibwmvPOdvNSLA0Fu6llTS+M6upqtr0oYOnAY1P5F4AD4b+H5MVBbPpPMRk7riDe3qfep/dywPzPkApC5QKPs12Xln+3PY59s2Anlu/fKuOuuzg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789001231; c=relaxed/simple;
	bh=z0bo2+xPL/GltO38eLmmagoSQi/UJSU9NPF7PNoAz44=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F/XEju1YAYA3jdhGdCpTJjJKXki94jqylvOMo1XTrbM8gFJfHvb1SBAM2DXHhnUmZI5G3i2PXVsKk93kmHKQ46J6uoEo/PjeNoGb1kSybIGXqCyzbAMpi/5tUyhLdmzP72sLdlTDse5Dv8BmWLGvsb2BdusdZTZvBhjtro81zkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBPps2HP; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBPps2HP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789001230; x=1820537230;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z0bo2+xPL/GltO38eLmmagoSQi/UJSU9NPF7PNoAz44=;
  b=NBPps2HPMlCWLCw4NW9iuhDykSg1Py3eebOkgQ7vhnqFT/Kv162LjsmS
   R87bzhIb4MagFKNCbTxOpZFdkcZ8ghKA3MDFQI6RBSZfm0jyeCDicVkHW
   cSjOlWD8pLmYRySlf1BvKqUj9snHafTnu3yBxXSjskVLf80nDQPmI1mOb
   0x628TwX7iDqWHddP0fKR42dVYAIKiFFNweoCHgDTTFVKlHKtKV+7tBew
   evN8nroqhRtjdcPjeyv4AFYPMtAQ4YBEfSiXC/xVsESyPXlqR3Dtv3lR9
   75B1LnXlry1hgrj/9FAmi/b76T3mn5MsGDiC16ohSTiHWx+qzRMowv/J9
   Q==;
X-CSE-ConnectionGUID: 6r9CEipcQqCWgkC+8Ji47g==
X-CSE-MsgGUID: mwsm9ir+T9StCjnq9phfLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="77000991"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="77000991"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 17:47:09 -0700
X-CSE-ConnectionGUID: 4smuji0NS5aT5Sb+nqBhXw==
X-CSE-MsgGUID: Ksihv6f/Qn66UeNrGHEh5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="274991750"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 17:47:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 17:47:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 17:47:08 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 17:47:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sC6BWyK1jjjeK0zJ4PYc4/bq0+vtvJ97wOlPgJzzz3Bl4KGDLl4N6d8raRmDgEQGKVh53pB9faHSgG8sNpDbDp1u68YD6oN1l+NBf6B7MRT2fU/Shf50xqqku3Y0wNqtm5VBaJ0nwwGHBQnp5mCJBDbsip3PcBjfIkBx+fOlMNFlypbxWs7D3G7vqzOYpleDfv0t0YhOrlap9fzhvTdjKAVlfMZTYyIUUGncK3P6mkDBrljDmQvPWHJ+H6s9/NxF6zbmXGp7nxB3srLua9yK3qZDJ8vIMqFxSc/bNb7L9JBFazavNbiVyCjOMi4d6SMp9JApMZMYmGk1bQq9x22hdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTIBEniaU1juxCsShxTwPZBOm+BgPBD/sNwAIpTiF7A=;
 b=HqAfFMUDiYjCvsCkti2BN38jxVytAZza/4ftXomMYcziJ3YHu3ze7ZCWOMeCemMlx5yhFZz5GczX+OTkuIcsam8+ljYD5s4kzH0NIS3j3CamSSXEQG7BeSdG2t1Z7vDp58xXn2uWCJJGwRCn4Tpo5URqF0O6ACc2kw781mImD3DIBY629xLghG67gZEzFP05cwQuZfRXzE85xjQ2UAC4AplypB5Iuv+7jOuClVHdRcU3fuGDWPrOhvQfZhTbDH8pcePj9ojxep9RmkrwmE2SGbSHoC/S4gyJTuuKPGw4Go/H7xN8NjOgjsfEws2xne/s598UbutUCPaPUKnCY5bEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by MW4PR11MB5892.namprd11.prod.outlook.com (2603:10b6:303:16a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 00:47:03 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 00:47:03 +0000
Message-ID: <f157947e-ffda-4d4b-9048-6b8584b85e63@intel.com>
Date: Wed, 9 Sep 2026 17:47:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Inspect all forcewake bits for runtime
 idleness
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909013712.1962521-1-vinay.belgaumkar@intel.com>
 <20260909015604.CF1D91F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260909015604.CF1D91F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0201.namprd05.prod.outlook.com
 (2603:10b6:a03:330::26) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|MW4PR11MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9815eb-c7a5-402a-c59b-08df0ed507f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: PHIjNYiuJDjMvSRthE+/kGHcld4B2cDEWxn09wRN8lRGW8m08IvHuvXBa6Q3iuPzAtjLJ+1wnhi6yEvIByyVZENdHic6PgsUsfdQ2KsZccAkgaj0EGRBN1GjgbW77V08nNQ4Ti5q++JhOB+FFEHEZ/ImUItgmM2nsxctsNysWQ/vlZcBjKV+atCijnXhoPASG675ygkQ6SVkBZvUuJlXnIPuIwJUo4n/wCLemcmEjU4u9T3af2oGJILMRn9fwgHRgqiGQlB8ByMmzoSo1gcvUpvkoap7TwSC71BgIwVXHv5NYt/zStwN6NoXpr0mYPYYJuFM6H0nbrD4dKIj+wqFHgwbjGO/LDpYaa8ISunZen2gARsZDszpCAjTr2/YJNDCPLMbdSSbdoMX1tDCHsB3yNJzsY8Yi9ii68cULoCvguIGrKQIMy5h02z9ucbQgzpnVJgOLhz/W9ANY6ioRiJF0XEzJj+AoGvaVf998pB+wkphQQsOTZicSs0VYh0jLvrNljw+pj0czMubJsLPRa8N5InOHvfnqBt2yaQjebKfXlJfH6pQymrnsE5PGP6o+QgAMjjX/n960Z9vaBdkSYpkw2AgW73zjdBYuO+A8wMII46mtkolexjghKjHqufheWW2kZZKPF/A3F6zsKcbbKs8ZDJLz5hv40iUosIqjJqS34Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7757.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1Vla0FySUJpZGhRN2FlR2V6UVRGdWV3cE1pajRacUd4T2F0Nlh6MGFZOERU?=
 =?utf-8?B?QzI1R1I4bHBtSHdQcVQ5UjVWL05Va2FhMDdRblVQWEZHOE9DcWo0WExsRjh4?=
 =?utf-8?B?dTJiY1ZNNGFaYzRmWXZZRGIzWVlDcjlTbHkxMFdVbEkzRm1MQmVjUHl1TFJz?=
 =?utf-8?B?bDlPd3BhQnNCK25OU0ZZblVNdjlocDVBRUgxMGI1RVdtUmlNc3lEaGt4UDI2?=
 =?utf-8?B?Sy9QdmRaSEFMajFONE1hYkV0ZlB3b3Q5VHZxYzVjbEI2WU1wUzdNY0F1OTFM?=
 =?utf-8?B?TWJEbVlsRUxqbk9IcTlBdWpqNWlURTNvVUF6RktsdlZMZUN6Vlp5b1p6ZmJB?=
 =?utf-8?B?a3RSYWlwNFpjZmxWclJVaEpaazhIT2xVWlVCYVFCMDhPY2x5TGdFY0RXU3JI?=
 =?utf-8?B?MVI5MkR6ZFlCLzNjQUxFMVFNci9PaWdxZUlmRk9Nd01VS1RLb0txMm5Kd3VY?=
 =?utf-8?B?UThaQnZRRVRiQk5Td3N5VG45YTlUT2JNU2pXTWdCd05DSFJURldKUFBmWjAy?=
 =?utf-8?B?a1hEaVNQQTRDRkoxc3FPcHZsakZSTTZ4K216NmpVenIvUmQ4REZHc0RiTGVV?=
 =?utf-8?B?TUI4b2FpVDZxY29wVmY1ZG40WWRLeGtHZVV5YkZsTFRCWnRQK0EzcURyM1JP?=
 =?utf-8?B?SUFzbGhrOXNaQWFzTDM3V0RWVlV4aGk5NFdUOGFhOGNnSVUzRFVPNy9DaGRR?=
 =?utf-8?B?MkgzYXRCKzVoK2FvMTZQRWdsZ1JHbUwrNEF6ZlpwMWlBcUlLN0J0WUphWlZx?=
 =?utf-8?B?bk9zaUdYcmlOU0hUOE02NDJpVTVVdk9SVGdibCsvNnpsZEd5ZWJ6NHdBUTR4?=
 =?utf-8?B?aXVIWVZjYXh2RDB5WDVPNjc5R1IwSzk4M3lFRHM3SkJGd0E0MmR0Z3R2VDN6?=
 =?utf-8?B?amo4T2U4eHdwamhZbFM2N09HTFFtcHpvMWQ5c1J3RllsWFJ3YUZjQ0QvUGdz?=
 =?utf-8?B?bUxNM0liWStFVDRKT2tBOHgzU0xObytHY085Vk8vcUo5cE1JemZpT2pucUYy?=
 =?utf-8?B?TTJHTFF3Yi9RMmdEbWtpMis1NmYyb092K21NU2l3N3VqRnBKckd0Vlhtd080?=
 =?utf-8?B?ZmpUemUvWStvWFFjV2FWeW0wM2FTZ0JlbXRuZmJGazd3Z3hVNUt6a0ZHRHY2?=
 =?utf-8?B?VmFOanpjWUpGKy9DaFRIVTBEckQ5L2hnamZnSXk2S0NWRUs4U0UzL29Wc2hY?=
 =?utf-8?B?d2tKK29sNDVZdDlLUEhJTzMydk4xUWdsSEpmaUhBMmozVUxHWk9hYithbFlW?=
 =?utf-8?B?N3NZb2FXL21UN2tnQVFCWnhka1NDVnVxRmNaeE14Wi8zRWh2dVliWTVRZkZr?=
 =?utf-8?B?MmVBN1RERFFON25RWUx3MGpxSHpNcWg1ZEdySFU5VmtRUmRYTkJ5cllDN21G?=
 =?utf-8?B?cWNlUjVDdzhLZEo0ajFndGY2MmZPNmtWdDNLNzNEY1gycEtyVDA3c0s5K2JQ?=
 =?utf-8?B?bENFNFFOckhlcERqVm5rcENuSWdqOFlTaDFFbU9mcTdEcGN2dnJxbzJ0VkM3?=
 =?utf-8?B?VHFwOUdUd0sra3JySUpJL1R6MEtzcHk1UGhMYmRPeFgzd0RpY3lOVS9VUTNa?=
 =?utf-8?B?UWNsTWRyeEZuQklrdFBWYnhFQTBmQXVuUXFDR3VQaHNRb3RQV2x2di90RGZo?=
 =?utf-8?B?YkxwMzlvb2N3Q2dVNWpkdXpFS3pYT2xpUWl0aDd0SDVzWnN6UzRqVmVBUVZa?=
 =?utf-8?B?cXZBcUVZUlFNb2ZkdWp1SEQySis1ZGcyWVY2K1lDK0ZyaEtkbzEyMStvNlhx?=
 =?utf-8?B?b3BBakZ0TWZocmVGOEhUZU50emRtejV5Ni9WK2JkWldUdXZoeHV0a3VSL3A4?=
 =?utf-8?B?c0xja3ByZmZKRHBVQ1YzNHNiT1VuVk5hSXFxdmFLa2hsRmRRM2VKT203VW44?=
 =?utf-8?B?UTNuUGVTN3RlNnBuZEFKR0Z2OThNdU54NmNESHd0NU9STmI0NG5naGtpZWE0?=
 =?utf-8?B?aS90QktJQjVxQ2kwWGVERVlLSjJYclJpTm5QUk5XdDkxQm92dktKYmJ2UUlm?=
 =?utf-8?B?NVhnSGluZ3ZZQ0RiMy8xSjF4bkZFMU91UmxJSld5bXJEaWRLaWtnbzRvRmx5?=
 =?utf-8?B?MmIxMWN5VDRzaXI4ek1HcXhNTytwdVlnZnhhN2VTSUp3d3hrYUk1cEdsMktx?=
 =?utf-8?B?cFo1T1NqM0JoU09WWnF3M2VzRG93TytPOXVjTEIxRXkvMm1TU0h3WnZkajh3?=
 =?utf-8?B?dmFmTzgyVzRYYUh6S3VHOWI2K3FsQVZSRGRwWjBrTk5ScE45WjhVTnZqQmI4?=
 =?utf-8?B?SDNXYWlyWURWdStLTjR2UmxvUTAzMHRkUnF1YUFScE1naVhDZ2FiVXk1b1dK?=
 =?utf-8?B?TitlTExJS1d3aithL0NwN1lIU0NJVEhYZFBCV0tOejJqRjZIMWVpbC9Jb1Jk?=
 =?utf-8?Q?DhadwHxAitwxXDXg=3D?=
X-Exchange-RoutingPolicyChecked: A50087aDfzyN5igghBKXqxHO3vgcOj9N+3fDrypLHpqeeevkV5ARYDntUoAc8VbrHQK6ceGcWnI9HMURDAspiorRjhnyOJwrn+rrWvEG9tqRIj7aN7LGevkEHZVl4mAbbOZ2rtrC22Owm8SuIYqxD91raXeoU58385vgmqW4OyINgAK+dQGC/5zeU7+OSpX9fHZ5vIoe/FNH8x8Zqito4A3Zm35297Jbv3bKkaM2BYBanTpQh1wMhMXWIhcGhhI88LNAufJ81aeXBjVp7CRi1NHaj7TZvHAb7BdWJKYBKzkGKEYEmlmrlcW4ziTviJfBCDtY4+sqe+/d+aDV3s4C/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9815eb-c7a5-402a-c59b-08df0ed507f7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 00:47:03.7258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElrGxbTD86qwdWSxwXUA/9D9XMcuC5WV2Tr4EMbnA/vAA3qje1ARsQK7Y+VU1GIT15T9maj/neHgkUpvwaLK4+f1k4XqpPbE62Ct54bq98Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5892
X-OriginatorOrg: intel.com


On 9/8/2026 6:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Returning -EAGAIN from `xe_pci_runtime_idle` aborts the runtime PM idle transition but fails to schedule a retry, permanently preventing runtime suspend.
> - [Medium] Using `xe_gt_info` in a runtime PM path will cause severe log spam when forcewake is held.
> --
>
> commit 987ddc78bc72644b422f8d130f4407129128a641
> Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> drm/xe: Inspect all forcewake bits for runtime idleness
>
> This commit updates the runtime idleness check to inspect all forcewake
> bits across all domains. If any bit is set, it returns -EAGAIN to skip
> the suspend operation.
>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> [ ... ]
>> +bool xe_force_wake_any_bit_set(struct xe_force_wake *fw)
>> +{
>> +	struct xe_gt *gt = fw->gt;
>> +	struct xe_force_wake_domain *domain;
>> +	unsigned int tmp;
>> +	u32 val;
>> +
>> +	for_each_fw_domain(domain, fw, tmp) {
>> +		val = xe_mmio_read32(&gt->mmio, domain->reg_ctl);
>> +		if (val & 0xFFFF) {
>> +			xe_gt_info(gt, "FW bit set in domain: %d, val: 0x%x",
>> +				   domain->id, val);
> [Severity: Medium]
> Will this cause severe log spam in high-frequency runtime PM paths?
>
> Forcewake can be legitimately held for long periods (for example, by
> userspace profiling tools, IGT tests, or debugfs readers). Every time the
> driver drops its PM reference and triggers a runtime idle check, this
> unconditional info message will print if the external agent is still holding
> forcewake.
>
> Should this be a debug-level log (xe_gt_dbg) or rate-limited instead?
yes, will change to xe_gt_dbg instead.
>
>> +			return true;
>> +		}
>> +	}
>> +
>> +	return false;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> [ ... ]
>> @@ -1437,9 +1438,14 @@ static int xe_pci_runtime_idle(struct device *dev)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	struct xe_gt *gt;
>> +	u8 id;
>>   
>>   	xe_pm_d3cold_allowed_toggle(xe);
>>   
>> +	for_each_gt(gt, xe, id)
>> +		if (xe_force_wake_any_bit_set(gt_to_fw(gt)))
>> +			return -EAGAIN;
> [Severity: High]
> Will returning -EAGAIN here permanently prevent runtime suspend?
>
> When the PM core's rpm_idle() function receives a non-zero return value, it
> aborts the idle transition and bypasses the subsequent call to rpm_suspend().
> Returning an error code does not automatically instruct the PM core to poll
> or reschedule an autosuspend.
>
> If a forcewake bit happens to be set at the moment the PM usage count drops
> to 0, it seems the device will remain stranded in the active (D0) state
> indefinitely.
>
> Should this explicitly schedule a retry, perhaps by calling
> pm_runtime_mark_last_busy() and pm_runtime_autosuspend() before returning?

Might be possibly required, will evaluate.

Thanks,

Vinay.

>
>>   	return 0;
>>   }
>>
