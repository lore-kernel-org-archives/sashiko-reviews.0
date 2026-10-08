Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075404A207F
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466823; cv=fail; b=FIClV8PUvKHHek5d3H6oQWWWnKthHr04EallVYr9//73pigWOTwOJmvqN81x/Z8CkDwUEeOwYhO9zs+IY4eNR3roPq0K+OG2kabvp+EcGFortA6mbRMcL8tcCmqGy4sRDJPUc0hDkFInkdWUBcs1UGf3U8MQUdgukINGWSLja1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466823; c=relaxed/simple;
	bh=imLQOPlB2EjNFJlTgSN32kuTdLfG3pFwXLMaaqWABLs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HWefEHGGAJB2UcwkIA+b21kYtaf36RtNVtGXjgBVvT7yPkys/qKwFKsBAbZiGLvBkeFrCRy8o3+GJAqbJVASXpz5iu3VmhJnBE3pkevEg3oUEqfoOuMUQEs+fmXeCzFzKBXu62QVR2kOeHgFjkhge1VSlQZkx5IAyaLuphhrbJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3kf4DTG; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3kf4DTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791466819; x=1823002819;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=imLQOPlB2EjNFJlTgSN32kuTdLfG3pFwXLMaaqWABLs=;
  b=k3kf4DTGuPpqAk2deuXM8dI238ZR0chcjszvzlZ0/I5tKvVLu+zEqak2
   l0r6/Tlcis2UM7oEnEg5vd72zidoBP/5NRm58NZrzNn3k3Bm1EsQYouXr
   N/neJ0xQYQIlkxDJ4zv1Ot/J3Qai4MFozU539EW3skZKJC2ysOGGmpld2
   5aDAaejASa4iinM3w39yuqEg/Sv2M50NSYVfcv6xsgGRfL5gyYx1YZyrz
   iOicwHh9JpeJ/iFeXy0L1HqIvspS0j4C6SkgyiR8ydjD9hgkUhgfBXXB2
   1Si7GpOxxl8YMmnNDAcVRvGmZ47URnBhluOWg5FJlnZgQFkMk5pCN1Yj+
   A==;
X-CSE-ConnectionGUID: uRtq6BUCT6yV8gR1L6gn7Q==
X-CSE-MsgGUID: xx5IMQqAQJeGIGljnhcILA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="149144"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="149144"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 06:40:19 -0700
X-CSE-ConnectionGUID: V2ToLe3nTwSAbR8Na7rZPg==
X-CSE-MsgGUID: KzT6WIU8T+W4aK0PJ27Fug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="68294"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 06:40:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:40:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 06:40:17 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:40:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfYs5whvKgvDn905Qtol/xdBq9M92qRLXZOey+N4al5e/sjFyJSlceENt1VUtfJS29clY8mlTE/56dM6j5NFQi/TeF+y6U+DwS0dkbHTqnQYU26GrOlgpJlFXyHLT9sH3BgxKSNIWQtGalNywfpm4RSg0f92PPA7NFjemZV+7AnuyMJU5XUed/U5cWBHSRiKGR4e//y72W8CcYbmDDTXvGkF4l1c0E0N99JecKPuyC0YkHBWBemg7fhR07iZ7i/tLHK/G6d9AKyKD/38yPjPxFoUe+tq8Gnipzo0WqBfNl8iZz7tQSDRAGKUvxamV5VyVbUXP2zbK4i7HnrVtChbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9I1FE10KVByKmPhoCaugCnT8w6dPpy/v1NEEgE1jF1s=;
 b=nHwqQVkVy/g3ze0A1mYCihCQTV335rRsxU/q+ynGqlUo8xWh//+prcUbqJIHTKm4N/lr5KrgQ4HuczipSt843pC+cxMAautRmQNNEe/O9v+2QiK0V0CZH871NNM7UEv6x+SMfGp47hifLEhtN9oWJNJYdIJL4vnab/iYVHy7O336MWRiiPMUfaTFI1JJaNZQ6gRVE4VuduiBDdk3mc62TO9Z3s+g+z9T7Ro+boXAs6BBASnNN6l1BxxlPcJztudZvinyGFALtKC98HTcpJg3AdGvcyY+XF97/HFj4QowVnbk+dN3hlsLozwLKWLnOKJeXjfHrpfJhtsnowxcMOtxVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH8PR11MB7070.namprd11.prod.outlook.com (2603:10b6:510:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 13:40:10 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 13:40:10 +0000
Message-ID: <1a6a4984-d5e6-419e-8e53-2b5b36a30e7f@intel.com>
Date: Thu, 8 Oct 2026 19:10:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] drm/xe/xe_ras: Report device memory errors using
 SIGID
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-22-badal.nilawar@intel.com>
 <20260906172742.488C11F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260906172742.488C11F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH8PR11MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e5e25a-6f36-42d2-e79a-08df2541ac0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: STP0DM34s3h2EUEi1qrh2hxJfT+Jonl90e/wOSZcR55mHHZTBHbqKQiifKCOKue/CvtExlaYYEimVb4vQIbd2gUopsZ/roORb/bzLlAV1yGCQej6r9mjnxKlrd21Y9/upi6mcF+iq3BBjE+so1Xoq9c5Sh8XmKKYwBhhntz2EZ+jvOMbKFLPlRbX2OCT9DCAKe3Zo9z8TmUv0S5T9u7VefadnDSsxYujMr1lbYIF6PmVtabZ2Dslxc38mB996rJ4c0jTKRYkb1V9Fd+dG9/ITEYnVSmeqALJcGzF0J5dNJ7Kx8RHHatzT9TZH00Ut5OrwNvdGLOlT5+tw9qKC4AM16rUQgmDu4RM2/uRjsS8d3vj+UEwigogn4cGnASY6Oo3F6DW1GDM/K2jNGNfnTNVF57wmA++vARoAnA28k6QAfkHYgmz051DKZ2epJqQdr92WoQgFAbfRP54v70BmlxxvtfSsXuDzrN8VK1mpq1rsYIkWw9gURbm8fFZ1DCWJ0kwEzXmgF/XxHIlxjiqlUpiL+r6CQ9owX7ol8jP7luumfiqHb4LMu6lVv96pwdNSmMvbUT8ULoGUT6nLilCtS28lMDGprjS2lD4TVpnDQo+F1Q7w3T02xfux67vp6H718sQmNHLikBtsZRRg9GJmoSl3dGPsjUB/HwXuDyIHr0fuvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR11MB9792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NThvVnF0bXdIS3pTWVpjR1VKQU41Tldsa1lnVlRuM3k0ZC9PVWl1Rys4WWlm?=
 =?utf-8?B?cUtXcVRqTnMyNyszbDhqaUp2RFNwVzk3U2s1SmxTWjY4dTNLRjVnRWEwU3Ju?=
 =?utf-8?B?UmkrY0xoUzY2d3hJUDlyS1F5bmxDU2FOL3RhQVFVVGZRNGc1RTlHbVM5OU8v?=
 =?utf-8?B?U05vcHJPRjhJWFVCK2RkYXdvR2xyQjN1bW9kSTZoRFY2UE95WDdRUnhCOTJZ?=
 =?utf-8?B?ZTdrTUVTYjhUOENNQm5tVkpMRkczWW5JTG8rekRTTlk5WHlpVkJmeURiVHND?=
 =?utf-8?B?Zm9SejYxeGIyM3NnZndDYXBDdXJUS3hwOUFySFFwNTRRWmx4NkpQKzFtR2Uw?=
 =?utf-8?B?VEN0NkNVMGZjWUNTaXZVMVJjdjdLejlBbFZCS3YrbHBpUS8rRm80WThZTGF5?=
 =?utf-8?B?U0NOaUdMZFhsWjJReXJIOEp6SmdGNXl5SzV2dHI5ZWFkU0x0Nm5GbEVuU3dh?=
 =?utf-8?B?NExudGk3UC9VaFNTNGY4YXordmlVT1NYUVdSWktITWRaVm45YlVTay9NbkN2?=
 =?utf-8?B?Z0ZqZ1FJcU5DeURBakxYSVFGRVQ5Y1MxMXBGL0h0dzFqUEIwcE84bURtcmRQ?=
 =?utf-8?B?QW1jNWpEUklVSmRKbExiRWZveWJYdjAwL0REenVWdVdkVVRqRTJaMmhoK3R1?=
 =?utf-8?B?Y3hYeFJ4VzA1NmFUSk5WK1BybTk0TU5HbEpIdHBJNWtOb1VHd1pjMENDWHpT?=
 =?utf-8?B?RGxrbTBwTW5XTEpGWFJUUTJGVnkybnM0aWJsL25NVGMzTXN1MUwyT1FaTEdZ?=
 =?utf-8?B?WFJtck1CZWNPZndIbGdHQzM5eFZycEIyR1Z6U2o5bVh5RnB0UHJNZEpJcXVW?=
 =?utf-8?B?aG1NNUxSZ0F0WVlkM3h2VkJsb0c5UDcvcC9VQTQ4WWFxSndLY2ZTa0lEUjBl?=
 =?utf-8?B?Q0JqakFPT3RxT2tpT3R4Rk5udVVXZmVsbDRhVXdZN2tia3BnZEtwZlpMWi92?=
 =?utf-8?B?ZTg5NGREZlU2eGJPN201NWpaRlJlbVNpSDFTQ2RvOHNUMGltU2RCcFpxTC9R?=
 =?utf-8?B?T2lSaTY1Si9hdCs3UG9HU2xaSi9iZ25EdDdIdnRJd2F3bGRGUzRlNytoTXo5?=
 =?utf-8?B?dzZveUwyMXYxazNYczR5bUJUeHJJUXQyQ0VUS2dnRmJBQzQzMk56OElJa0ha?=
 =?utf-8?B?RjBrNjkxT2JnclVHOHV6KzBRbGlmNWVwWUdiais1YzVRZ1RNZVUwRS9tSkhn?=
 =?utf-8?B?RWZaN0s0MUw3bWNEREZPVTlkdkVnMkg1RGxIWWJERkJZSTJkb2dyNEtDdHhT?=
 =?utf-8?B?VzRGWnJvd2x4Mzd1R0p5SkxNS3ZKZlZVYTdERTBmNlVWeHhzenRocEROdW10?=
 =?utf-8?B?cUtkMVhtTDV5TDAyd1h6R2oxZkdQaVplU0dIVzd2anhHUEhFZW5NWlBHeFFC?=
 =?utf-8?B?OTlIS3pLN3A5NUpYbUxQWGdTZWJhcjJEc296OXJlRTlRTGdpUm1TYUlSRVdK?=
 =?utf-8?B?bHpmMC96OXBiaGxQekZqNEdUUnRHT1hKaEVYL0ppeDBjUG11Z0FVN2JxVERi?=
 =?utf-8?B?WkZNMGdEZktRejV2NXhiSnk1cDZaL3lKR2dhSnlVUGdaRWtuL2l5bzBUcVMw?=
 =?utf-8?B?eFNiTm91QlZwVXgzek9QMzVvUXZRMUZ2UmxaVVlQUGg1RmtsQ1dIcDlaSnJI?=
 =?utf-8?B?WWkrMFF2NExNY3psY1JoWDhjNC9zaEpPTWRleWNoZEJRRnQyUlQ2TjNCZ1J2?=
 =?utf-8?B?QWdxaVAwa0Z5a0NkV3MzUlROU2ZBNGd3LzBwR3UvZW1jUmZGVGJnS0ZUQXdJ?=
 =?utf-8?B?SkRhMjc2OHV1OUZpbDNIaVRQZUlWenpVYnJpSU1SblR5Wk1rUEx3VzZUaWFU?=
 =?utf-8?B?c3gyaktVY3hldmpsZmlWd3EwQTVNV0JnbG4xdzA2SGZOU3NlT21qZzVmQkdV?=
 =?utf-8?B?VEZ1QXBOWWU1SmlkcEE3MXBDM2VVbXpyVUlyUEsvUG9WZFZpKzczMVRjOGxr?=
 =?utf-8?B?ajlZSEd1SnJqTmtiekpvRmJSVFBlajlzUXBPTkpGU2laMDVObzNZc09vUFov?=
 =?utf-8?B?YStVNEtiNGk0V2VEMmxTOTdnMGlvc2tWeXlLdlFFWEMxMWxUQWQ2azB5bkZv?=
 =?utf-8?B?WHBYck1TUE4vV3Y3SG5lM3doMzVRajg1V2orbjZWaU5tTjNXa2Z3dFFzOHhG?=
 =?utf-8?B?UW1hdllyZVlZRDZvZEVJU0FTSXY0TzNEOXBqWTU1NndHMXQ0Z2ZzdGNDb0pZ?=
 =?utf-8?B?RmVtVUMxbkhBdjVaOVhSODlFb0NuN3pEUVdCS3kwUE8rN0pWcnlUdFJ3MXVK?=
 =?utf-8?B?Zk5LRlZkSjBwbU1oNDdDdDRsTzhUaXpGKzh1dVFMNGlPY2pOTUlCZjV0MFpE?=
 =?utf-8?B?elZIV3paLzEyTkZnaVRpQ1FreDJDcUZlMENSWWE3b2YxNFVWTDE5QT09?=
X-Exchange-RoutingPolicyChecked: dEaKqqsELLAwOIxaxtie3C9NpjBBSwpJXja9sNBFEfig2eETWLODR/5YUu6ofQudlUGA/7T9TOkLAdeSC5FFuFdoTBkgG9c4E0NGVTT2envCEWgudmD6jqcUCHj2QoutTTPX/pV9oDbE9NPgVW+hehcXMUr+nmIFWzChGr3rUeBfZQQepJZEVbqsdwbAm2L+Y5eZjNT/cQpUC6b+Bxn2oK703H9k0Zbo0oaDavI+DPItlBezWNdDbQ+SRx8+16y3ttXVrN5oQUCUL43WlhDaAV2n+AvuS6wUOUqKa5YifJ3JjohVCmrR0IBxaKAuQCsQBAdnOEObgBQby/M5Dc9A3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e5e25a-6f36-42d2-e79a-08df2541ac0e
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 13:40:10.0367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUWTy5pQob5Mzy55wGwckpyiLJVdr1X3/xTh7yoIDsrGlIvo/NAZfI2tn3/CnrImfnFvXwV5CSTqIp0ogGj9eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7070
X-OriginatorOrg: intel.com


On 06-09-2026 22:57, sashiko-bot@kernel.org wrote:
>> @@ -387,14 +387,17 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>   	 */
>>   	switch (info->category) {
>>   	case XE_RAS_MEMORY_POISON:
>> -		xe_info(xe, "[RAS]: Poison error detected\n");
>> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>> +				 "Poison error detected\n");
>>   		break;
>>   	case XE_RAS_MEMORY_DATA_PARITY:
>> -		xe_info(xe, "[RAS]: Data parity error detected\n");
>> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>> +				 "Data parity error detected\n");
>>   		break;
>>   	case XE_RAS_MEMORY_DB_ECC:
>> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
>> -			info->sw_address);
>> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>> +				 "Double-bit ECC error detected at sw address 0x%llx\n",
>> +				 info->sw_address);
> [Severity: Medium]
> Will this incorrectly report double-bit ECC memory errors with
> CPER_SEV_INFORMATIONAL severity despite being severe enough to trigger a
> device reset?
>
> The xe_log_comp_info macro hardcodes the CPER severity to
> CPER_SEV_INFORMATIONAL. After logging, the switch statement falls through
> to the default case and returns XE_RAS_RECOVERY_ACTION_RESET.
>
> Could this break automated fleet management that acts on CPER severities
> because a severe uncorrectable double-bit ECC error is logged as
> informational while the driver actually resets the GPU?

These were already logged at info level; this patch only converts them 
to xe_log_* without changing the level. Aligning the CPER severity with 
the counter severity for memory errors can be done as a follow-up.

Thanks,
Badal

