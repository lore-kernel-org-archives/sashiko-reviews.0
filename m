Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BAB3BE172
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 13:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465619; cv=fail; b=LB8uk9D5ADtm48pDHeXBvksMnK5JZlz0huM3PqllK2IDf38q4spM2/8m4HyUj+Hf4P/Zzr6Qs4yTTPXCdLCvwquHYrCSzdR6745MU9OitV0LlJlMo1gz1GpnAh0/g3KBVUfsxTwP6hVKwk8xcFImjmJjvqqYl+TNKeMQqGGdkZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465619; c=relaxed/simple;
	bh=flNBA+k57nTfjOuFs9rRVtjQe4YO6Ytlr7SrSiWKkd8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hNjPHu1VkpCezdyvC8pJm0lPy7xLlKJapz2X6c2fLuxW1b/CE0MItBtSKzdJ5k5X5be+MWMEwsu35vzHvCVe6ian24v9qascHbxtekBHgpDmncqCF5wnh48QiJTIc2sB8Ci4aQol8Y/EiWbG/2zMuzCNhTlN4CJSLzaw8eFV7NI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e666/Tdh; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e666/Tdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791465617; x=1823001617;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=flNBA+k57nTfjOuFs9rRVtjQe4YO6Ytlr7SrSiWKkd8=;
  b=e666/TdhNDYZZ6z7DYisQzmGzRthUAgED9GncSc5UNU0W6vfJSIzamED
   LFwAbmIG1CKxEoFx0RWUMzM6yKB6zfx1UW4ssGdJvgvfNedEbPP6d952L
   jrM4DTsJrvG05/YsTFOmD19PaZKTxjXKLYo5cDkr6ZwDrKdBuClG4dSVW
   E0H9VKsgh/VpecgX2TPsvZ52u1VkfGHUn/ExbOwhvqXrs5zV8LpcXcHfh
   bSXUk4KxRH/52SohBO4zcWbDwcpEd0JfXYOuVzOuCnPV8AiEUmbJx38YO
   4YWfayx/y34gS4k1ekpsWbFy3SsUDn+pNWPEUq7c/JOxuLB+S8D/O03Ma
   A==;
X-CSE-ConnectionGUID: WOb0UiFDR/2qPH0479BFjQ==
X-CSE-MsgGUID: tL+0mlG5SOSQz3D4Om0yIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="131919"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="131919"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 06:20:11 -0700
X-CSE-ConnectionGUID: RWdXg53zSGCtbhtgr3ViFA==
X-CSE-MsgGUID: 1s7d3XIcRWO3TnzmtvMogg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="52793"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 06:20:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:20:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 06:20:09 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ii8Dm8khj4pHVUXI23rOQ8tFyCEp+ZdtsaWyvWTsxDDmq1QEjvaCG9vG/8NVpTD5ikiLKVzc/nTrx38iCDEVj5mI9toRu05ghVkKTcy4Q9dcwGh3/wzzH80fijh/DpPERe65vR0a8rvOPZQX/c4OGJbylPVYeS7UXwVYe2BzoyKkBOOAialtN4LOsfYmrX+Ua7VXXAmGL0Dy3QaryWDkHJ0yESlz3AH6qQmMVoohu8bpayFrE7RF+av7cd24MTbo8Vw4H1P78rYcwqAzy+EPKkFC5gXWtOwo6TlhFk3z2sRV7kHvcm9IJP7ReDcCm1KqnVNDNmGDbSsZuZj5p6cBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOxhkXWdJ1fBHKTZmUarxoKal43T4IFqafZhyTxf6Y0=;
 b=acbZOhF5NqoAKFQuUtn4aNrI+SwkVrEKdSprtQdToCRM9ggyW7MmygW33Adzj2Wvhfr1zJCBvW5fHyuzhpFDouSwVSxOuW3P4Zj58mEYUS/zqD0VtER3oVOvnciwLsDW7DbnNLhoGx+YXR23qc0UzZeX4uikJ4rL14ets9e+sdIfJjXCBGGvukKGDWXaVqP9WgJQ+lZXl6KUG8ieVFNVaZ7BOsu59SVV3NhGCZlcQmFQlrWaciU5xmFOOK/cxrsnT7cgW/VCJqggVpc4sZs76V4fIlvky++gdw6cnA8DA+0rf4TSD6Wq0WoiznUa+07482Oo0TwYHy2HRotz4Ofhdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by MN2PR11MB4517.namprd11.prod.outlook.com (2603:10b6:208:24e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 13:20:06 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 13:20:06 +0000
Message-ID: <33c6c6d6-dcd0-4c89-964d-abc72e2fd1a3@intel.com>
Date: Thu, 8 Oct 2026 18:49:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] drm/xe/cper: Log CPER records for aggregate
 counter retrival
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-21-badal.nilawar@intel.com>
 <20260906172359.061C41F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260906172359.061C41F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0333.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::18) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|MN2PR11MB4517:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c990ad5-0f4d-4078-f0ed-08df253edebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|4143699003|11063799006|10067099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 1rwEN/W2H865rg7inqIHNbt+nyYvTGGJi+avsCZrmmC1zLADpmBVVcPGQIAAPLixe8Vt+iXp/RSHITVxFrnr5swbUCiL9tnRYDjssGaQcU48h2tl/FIJvL5DSgguASbBb+0xSkqofuL8zXJDaLpTPrjP+Diu9uR6Ma31UA3f48esGm6A0xeEGWyu+u3o4gZu7oqQAbYIkFGEAq7qQ/WuRqcO2RrB8H5+E2q7BL38RxZWfPcWQ8dCg6HRhOBDaHucl3N9vAUHXCtO1d25Yvr0Fg52wu9tR9TzjWBlv2a4KK4zHpy37VEbyxpUu7x+HEifzp00Aa6FhJ8Exv3mX/hjng04TxArgtFdxSMGTn7ZJC3Lh+hFzSS+OdAYmjsqkxzx8iCuXsSfXQ9XwWSg3WJFpuOVcjxhs0Yq+bQcuQPwuCl59PGQmi/7wBpvE5czYg387TSCrk2jI6Z+Tw22drw+/7xahBnGj03UVCcS78g9Epvdskf7qUakfV+BdTZI8wIZs9XXgWQh32atWkg2AS3HbgHDHJWeOrx85OLtBAdaghwRUkjv8auYFVhiDgeP219HzPRMFQxdRhcAug/m5uPcgoZZGGj8z8U+WSsHZp+77v3BTrdSQprTv5pIqQKjo/us/LU3EHLsMwNJnAu0kLd6gU2K2odKQ6v4ESEUIPfMBfk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR11MB9792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzhiN1Z2Zmd5bDBGTUx2UFBPcWtkUjlFamtWSTkyeVNjUU9VM1UzcE81dGZy?=
 =?utf-8?B?VXBhZVpDTnRCd2c5UzJ5YmV5YTdlTE5NS25QTFZzVVhmeFA2R3FCbEVkdkNR?=
 =?utf-8?B?L29uUGtPZzRMS1lxM2JMSG1HQXJIN0RaSDhDaW93U2hhVUJUNWpzdk5jd2Fr?=
 =?utf-8?B?VkMwUFBudGVQem5Fdi9GbXYrV3ZiZGZ0ZFA1SjJPK1laQURPVzdnK3ZyK25D?=
 =?utf-8?B?KzVwbmdDMEltZERGbmJaQkpLekorRStMdEhlVUsvZndGOW45QUpRTXZYMjZ6?=
 =?utf-8?B?NWtyUHlUaElrR3JrTmpSdHZNTW40QUI2QTQ3QTZSSm9nSDhtd0JPSEpLdWx2?=
 =?utf-8?B?cEJsZTZyZW9zOXNETHo5cHFkUVBnSDdyMEdzdFJFam1YTysvS1lIa0tDNk81?=
 =?utf-8?B?dnpuUlZKbit4TGYrZ2NnTmV0cm9ZeGd5czdQRDNxY043ZUc5WXQ0V1NhbXI3?=
 =?utf-8?B?bEJvYjZsVCtjclNSalBMY2tsdytEV2g2VWRSZEk2QW9VdzdTUHluY2tkM0Rz?=
 =?utf-8?B?WHpXbXhVSHBkUFVoYmFReWZVcHZBNEFRYVFkS0JTZTZ4YnFBVWtlZm9GZ2Zw?=
 =?utf-8?B?clNEVFk4dW1qM0x0Qis5dE92ZEJmQm9BUGhYT1RqdFd6bkNSNzk0RFNFWDBB?=
 =?utf-8?B?RDk3UmR3bUhIMDM0ZHJDV2VqYVVEMnFtdk9CVm9mazN3dkZpVjFvQTBJK1Zn?=
 =?utf-8?B?aS9rNnpIQnE0cUJFeFYrUTZlL2owL1p0Y25MdjFFdzRTQlk3TUZGMXhvTXoy?=
 =?utf-8?B?NldGTGVlRE1GVER5c09WWGtZeVgrcDhDbVJGdjk0UUtqMURqdHB5ZTRQenJw?=
 =?utf-8?B?Q2cxNTRyUDZVZDRiZlNzRWUzWUZPN094NXhSL0MwdVl0emJONzg3WkRuWm00?=
 =?utf-8?B?bkdyUk9OOEt3aSs1OHgwb09TbEFWOXZNNGY1bWtKMU80U3dsdk1ENDlHd1lH?=
 =?utf-8?B?SWJoWnE4c3BiZm1GamZhajNxWDd6aHNzUHhvY1RCblZTaDE0VEVHczh6R0p5?=
 =?utf-8?B?L1E3aXZxV05EbERNU2JjYytnVy9GcEt1dGdoaDJhRVJSVm1Sc2tVbDFaU3Ux?=
 =?utf-8?B?OGZUc3JnNWFyNnh2dzNkaVNmbk83NWoxSGdhK1FhVFpNZ2hsbkt4NHp1aXJV?=
 =?utf-8?B?QUpmYXUzVXpDRDFSOGhaMXd3Q09sdnUwdVFGbk01ZFlDWVNJVWFBTXVBZk1p?=
 =?utf-8?B?cCtHaU96THRuelUzWFJVN1hHV2JXUnlhbWJyUmtZdVlCUjhORjRRV1IrT1JX?=
 =?utf-8?B?NTF3NHdERW1hNDV3SlZrZGZoTDB4ZW1oaytXdnBYNzNFMXNTN0hsREhrbEJS?=
 =?utf-8?B?am9CT2J0ZWV1bk9tWW93dnhDSFpyL3NyakdxYm1kQlZvZ0p1SDdCeFlCYllW?=
 =?utf-8?B?OEYrb29wd2Vpd3NDNko4cytkNHlyV3ZZcFN3S0tyN2tydXNOa0xYdEtGVkJv?=
 =?utf-8?B?OTdGalViUXhKRzRnZ1l2a2FUMk4zeG9rNGdsY1FRcHhITWxWRFVGR214eHFY?=
 =?utf-8?B?VWtVakp3UEkwU3pXVUNzaHNNanNBK0tYYmFNSExvTzZ4Q2ZCRWJESkZqbE5Y?=
 =?utf-8?B?OXJuQVZ0SkhTMVBTbWI5aGNQVFpvUTlYSlh4cmFjTXZib2t2Ymx6aDl3Vi96?=
 =?utf-8?B?elVaVUJJWWNlSDM4TjZON3M5amZkQnl5aVNPdkd1YjlXeTdWQmY5MHlaMTdl?=
 =?utf-8?B?MmNSQjdOSG5md1BCa3RhWFQwODY3R2JxTUJuVy96NlM2cFUwZTROb3FFUFo5?=
 =?utf-8?B?RThzR1g3cEp2ZUtESFI3a3JEVGlTblFYWDN1N0ZZcm9rbVBIR2dHNmExTGNo?=
 =?utf-8?B?K1d4Z3c3UFg5MnJNUEtsNDdMejk1UklTNURCeUovZHgwbkI5bjBMb2NGYjRq?=
 =?utf-8?B?UW9GQ1YwZHBKTVRhWHhTUC9PcHZMdFQzbGxSdlcwVUpQZGxMZm5sN2xWSmta?=
 =?utf-8?B?VzlBZTBmRlRxVjVaVEFRQ2RHNnA2S0EvVDNjUjhzK200Q0FPWE5RVmdtYzNC?=
 =?utf-8?B?NUJmTm0xd2E5U3IrcmRzajZCWC9Makh5dGFLNXFvNkhIWUFXYURHYnJ4N0dn?=
 =?utf-8?B?aE03QzlaaUpnYUFYb1FDeG1Tak1FajVBaFk0ZkVuaG1FeElHOUFuV2d6VkZX?=
 =?utf-8?B?Y205dTVHRVlPb1FWeU9LcVZpang2R21uK3ArZHlFZEVGMHVoOUU1RXI5di9k?=
 =?utf-8?B?dGp6R3p5ZTRaekFrMXNEeldOY2s1NWxyNUh5cHZGQVphb2JLYjhrNWtyM01z?=
 =?utf-8?B?cDh6MEowN0wvR2Y2OXhEM3VrZlVlbDA2RWFnclNDWDhxRWZuVEZKRUxyR0ZT?=
 =?utf-8?B?RDdsRDZlbWtwZTA4dVJrNXJ4K2dCWWVlNFdyVkl3bGlLR1U3Q3c2dz09?=
X-Exchange-RoutingPolicyChecked: jh87W4RlD99I5mCoguDTCVUKuVdaU0VuVkL8rb+S7zu+ODyYiE8bRaUylYP+xb0pj32DXVQRhJAOtFvl9HgEypRofLWq2RDlS04+uh0eusUnU5nQRrJGO+38Uyf6c9GyLyA6ld7Ii/Ss019LPhEflX5EJOMsGAEtiIg14D4bXMtZtnxQ+SZjbmZaSA6PBUaHN8Yo5n2h21Wrsfk8LtYhdx0tCmV4lV2lM7W/5ROO7abOuJ7rx3XeV3uAUVFElwcUftobFXTs1aPeeuymtK5BixZ9GzpAsizbOLjERclt4xwAFYxdkFXfHEvgRe3YcWmXe2ydvMLxxgBpC0pYHVOFfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c990ad5-0f4d-4078-f0ed-08df253edebb
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 13:20:06.8204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AvWahUJk+1fPKYFjRCBFIg+TEVbkgs1tWBPLPgS38V/lyE0CpByQHsZLbguaq9bV3FhraoguuTMBYfMPRkYqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4517
X-OriginatorOrg: intel.com


On 06-09-2026 22:53, sashiko-bot@kernel.org wrote:
>> +
>> +	if (xe->ras.cper_on_query)
>> +		xe_emit_hardware_error_cper(pdev, ras_sev_to_cper_sev(counter.common.severity),
>> +					    ras_comp_to_hw_sigid(counter.common.component),
>> +					    (struct xe_ras_error_class *)&counter,
> [Severity: Medium]
> Does this code pass the incompletely initialized query counter instead of the
> fully populated &response.counter returned by hardware?
>
> The CPER record emitted will be missing the product-specific hardware
> classification fields (like tile, instance, cause), leading to information loss
> in RAS logging.

The queried counter is an aggregate error class (severity and component 
only), so zero product fields are intended.

Per-class detail (tile, instance, cause) comes from the info queue's 
dynamic counter headers, and each CPER record is built from those 
headers' error classes.

So there is no information loss.

Thanks,
Badal

