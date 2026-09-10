Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898A1235358
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059641; cv=fail; b=A8CEndNEIj9vqFr2aCi1kGpSSZV4AitS5ZKdLDlcizLFspaM4qMJoPe/2QK5lHQHpMjMBG8flA0FLHWilnaYe9ef/dUn5Q5haJQil/nk78s6vAluJtl2CnCbAJ+SBszE0HYi5YWKBdso70bOHIVEQLGA2b+pA8EZDGu9mUxUWj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059641; c=relaxed/simple;
	bh=NpfYCnAShZvkkH05UqIXO4YoypPZ0TaCsSgaHmOzyGQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sx9HiBJiO2uzakbQZWWE/71wKoCs7DYCRA1iJ4fE44ADNO4ab4bJXHyePudBjN37lVcwyYFK/SdkbqmwbftzZZFxcnHkNOd05joVgHEYFdgV7BoSdqrkvVG8c4iknce1xWg3E4qUUo8P+tbMbhNXbIMu4Rj49Tfi2hF7aUzKbVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8MbS1WW; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8MbS1WW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789059636; x=1820595636;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NpfYCnAShZvkkH05UqIXO4YoypPZ0TaCsSgaHmOzyGQ=;
  b=n8MbS1WWJ3g7ElwF55eMx4d9hQMWYphk4B/V7EwAgWfdXQa25+lEdzGw
   yKqy/fofAs3vt9Xafy7GPocN4WX0N1hcLir/h8W+RYfW61AS+uSGkRm8R
   JC605MBaW1wyb+uehNLwxQDDQbNoQ5Xv+42RYlPxXOr8gmodIk9Qu5cWa
   fGLg1cKRX/Wq27W3TRtveo+4rb71cDqSorWTl922TiIMWXvKW2BbfV4hS
   I2+wWvPGH2oHzyMWcWc2doWPHFsv0zUtoXV2lvkglyoAzaa91zTz7jSA7
   031AxqxyOMKY3gjPvXiAqFSLOTVZINYBpWoBZWYoLni2e/K01u/QYjIZ7
   w==;
X-CSE-ConnectionGUID: iM7L1yDtSLGCNj7xjwa5Ow==
X-CSE-MsgGUID: 6K7AsNl4SfiZloIp9HG73Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="106884547"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="106884547"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 10:00:33 -0700
X-CSE-ConnectionGUID: vCuWS0mySayEGAgvDdzExA==
X-CSE-MsgGUID: CMwPEERbTiyLsN6gvSnG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="275463209"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 10:00:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 10:00:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 10:00:32 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 10:00:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pY4oF5iJvzHH34faHmZs4Eq+vd/LZHOzyW5OvbGPI2T/XZG1YJVeHPR35iKPXoU2jx4ZAXQMXim92nbVIdz5TStzvkhPEly/iMgXsyLk6SaapHyeN9c8DjDsAwPl1pecpOt7DClX5iyy6qunE5xTUlKOkhuCk0x8th5IewXg9+BM1FcnQjIodTodIjkrm0/sbpBjVO0li7Fa8022Nq62Yxf9GncIl0sEhD88EptvMzMDaJT7cw4RIEu9NtjBJoLSCS6f0jNchMl5iWIxDw592b7d4DilEuHXeQZQgmA2wmIWVw0fdb6pg4jSul3Wdt3zRjGkRURF/GEaIPEHOGQg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zr8YI2Cy2+sSqT3TAh+W93m35Pa4drWTSN8ARE3Dlts=;
 b=rPj5DYHYj4N0xe/xyNzLz4nqpZs+ZthLHcImE5RQDRiZokNBRcWK9o3/Y/v95c3HPoBQAgVI9Olg6p/3WqQehMPpqTPLV4mUgO0oP0bTukpiQzkHODWxmyB4FxW5z9NWbSISZJDz15tLY/ZNB5k0hyQvfIOaTqlsoKLLo0QpEkl7wwkszX7GucnzWXcXGf0tugBKcBG/BEaBxvWMNGj2HTLnmmBvNjl/70rv6UGLNdtzA3CLmTtvp256/zaPgFFEK/pXMyohM5uJIZvq+kGrJwdEaXhOVd8NZBWHmxi/LznxBp+4fikrl3Hbb/gG2wwqQIncCG74zvuJgW+JaBPn5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DM6PR11MB4609.namprd11.prod.outlook.com (2603:10b6:5:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 17:00:28 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 17:00:28 +0000
Message-ID: <835e584f-11a1-4411-8768-e6d530af89b5@intel.com>
Date: Thu, 10 Sep 2026 22:30:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/xe/hwmon: Correct group selection for memory
 controller temperature
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
 <20260902175507.3910573-4-karthik.poosa@intel.com>
 <20260902181800.169391F00A3E@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260902181800.169391F00A3E@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0283.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::16) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DM6PR11MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 98cbff5a-37ce-4671-7a23-08df0f5d03cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RWc8eL8FECwPqs9EuCVGAK0Z5jwRfmVvd7W/PgQulYPJas9RGzWdl698XW6OFc61H99r/Q6ZAtVJEYwQk0L/rYreArbp4ywms1bTcER5Xbd3UXJwBIPIrQBP762gLzkqoLyBSn84pg/mIclBuogQPKuvK+ExxLp20okcDgwLI2/wCR7sSPwcsd/YmuE7d4A4nweiACRLiJX8JrBn+ViXHwc0rNdwHipvTUeT1h/ALTrgdrZzfUnJOl/TGy90cEfaG2SuJ4C2kcQtFd5eaE1K8SyINmP/GzaK9LDG5UnjDou88wje+SaLKJ1GjrRdPLbbmgFZmqK3wfgTQ9DF9x0BAv9XiSdMH8mOO4XpoCE+Q8fQm04rTj2u26ILnjWEPck85PMNmkls8U3QYizgNdwKoYi5rIp/Bs6XtJc6dpRyUXC9E+HxHeaPgXn5jIgO2o1cNDwAG5DjS23Mz2mAaM+jJQp6v+8fLXoT+2t9Y6J4SJWVL1lH0ptECgaSv15xG1Kl0IeYMeDoCkSr0AipQDj9ow+xKW+R/KbUMWzXsFRXyFnzgg1VBKcMro9YNqnpYxWmYeG0AvjGHYGM1QDbh3TnSnFE0/jazCmyYDBaX1I8l/HFvnVFOSVbc0tQhLYxLUwe+9Vsymv8CUwCbokAtj4jpLhxKkg0ff4z4L1hAzClo9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWdFOEY4bDNaOE1yd3hIbnpoVkNvbGV3dmxjMWdmVzRWZnFwS0p3V1EyY2p6?=
 =?utf-8?B?bW5CQ1hmTTRBYkxpZ0dKb3h0Rk95N2s2MDhvTHNWMDI5ZDBtK2Z3eDBQblpi?=
 =?utf-8?B?TFp1L3NEKy8vMG84R1AveG9kUEQwTnh3d3BjMytqSDhGdnZ1QUpnb0g4LzFY?=
 =?utf-8?B?MDZJQ1pleHFoSS9oL1I3ZkRDbVN1enliZjAyRVZlSks5OUhYcGxSZkthU3Rp?=
 =?utf-8?B?SEpaL2w4ckVEbHcxRmZRUlRDbllibEtYelBieHhKYzdSamxreVNGS0MzaXpN?=
 =?utf-8?B?bXFKS3RGVUh0aXpxNlRWYkhMOWhZOU1TVlRjdW9ieHJFbVBQVTIwZXZmRFQ5?=
 =?utf-8?B?MGdsMWpiSzZQZTRhNnJHaGZSTi9yaHk0K2FXeElPaFdYS3ZZSzRXaDEwTHNI?=
 =?utf-8?B?Tm0wZjBqbHZPTC81VnpjenFGcVZyRUxiRXBBb1lRYm84ajBWMHdGbE9vUTV6?=
 =?utf-8?B?UWlFeTVDVnpTQ3dZUHMydU0vK1RXMURDMVU2RDcrZHhMaGhPS3hid1dxT2RP?=
 =?utf-8?B?Smh2N09PamR5SWp6b1ZrekNWVlpraFR3TGo0Y0FxK09QV0UwNXdCNjB5cUJm?=
 =?utf-8?B?QTBuMVkwL0pJRlRyaHo0UDdZNlVkWHpoUU1RSDZ1OHNNMTdXRXFGb3hhVUNa?=
 =?utf-8?B?WXViMjFqZWtPQmVsaHBVRkNEVkVLL0s2WHh3d1k4dHVTVUFBb3JCUGNVWnQw?=
 =?utf-8?B?RnlrYTZXbTBDTjNBNC9WVW1LYU9JMS8rUVhyU3ZDNUxzYUdxbzZFajhtY1JO?=
 =?utf-8?B?Z0hoVlBPMjlGQm9JdUloQm90WTFpSVZUREptZXVucCtHMmd0M0Z5b0RTWWdx?=
 =?utf-8?B?dExSN0wyQmptdE9CZC8xZmx2TlBoZTFOQjhOZGt3eEl4cEVjaGlqWGIyUUd1?=
 =?utf-8?B?L2pwcWtEd243TWtXc3I5N3R1K05IdlVJWU9XNldvWVh0QXVnNjJBdEs5blJj?=
 =?utf-8?B?bmNaZ2F4YkFsYUpLWnl6aW91ZytyaklmaFpBQUZ1ZzhmNU1TbjJGenJoUUUr?=
 =?utf-8?B?cHBNUlQ3a1BBeG41NSsxcEp5cnp6TDFaV0pUNHlocHNvbEpIS0IvN2wzNm1s?=
 =?utf-8?B?ZUVPVWJIZThZM2haL3ZLREpweHQxS0o2NWErdUpIR1ZKaUxNN3o0TjBPbTVx?=
 =?utf-8?B?SmYzRjd5eHBkcWREVWJQT09HS3VneTAreFQ0QkV3eFpUbVdwak1xc2pyZ3lD?=
 =?utf-8?B?VkI2QllDN1FwSWF6bjhGbkNIdU1XNHNyZXdKMVUvN1c4c3hGakVRYkZ0bThv?=
 =?utf-8?B?eDZ3ZTJwNXJFaVpScm9BdnJZMGc1QmxsNnRWZE1WbTR2UFBZdXdhR21vN05I?=
 =?utf-8?B?Y2JsWEFLTGNFK0ppSml5OTVMOGlzSXZHR0dOOEk0TkNRNHBNTEIxL2FwMnBH?=
 =?utf-8?B?YUh6R0pXM3Z4SysxS1RhaXpsR084QkxDdG8weU0yTjZBQ0RWVkhXc3RES1Fy?=
 =?utf-8?B?dkhVdVJkU1pIRjNZU2Vac2VrOWI5aWxtZnRLLzZtNGQxdG1BUVZRbkhjOWc3?=
 =?utf-8?B?V0VDR2FBODhvNDJ4SVNiQTRyVHdtTUltRkFPbGdPUTJKZVNvRjd5S1FpMmVE?=
 =?utf-8?B?Q3k4eGtFTnRJOEQ1N2xDTjMzSlA0NU9ic1RDOVpLaW5NOGF3S0RoQnhzclBZ?=
 =?utf-8?B?ZkRxK0pPdDNhNC9KS2xCTXNzVy85MkhraUMrZzRzL2UvcDlmdVgvQVp6cTB3?=
 =?utf-8?B?WjlpNElLa040YmNlZCtWSHZ4VTZIb1ZmOXFhNW1YQ1RzUTh3UzNSZmZTUEV5?=
 =?utf-8?B?YkFBWExxb01Cc2cvb2RwVWxicEVkVFlxa2FVMmFVNWxDMUNWN2NzeGlPNGNm?=
 =?utf-8?B?aG85a2tGVFZIVzFTQy8rdFN4R3VwT1ROdkVtN2N2cnZLQlhFVzA4bXJid1Ja?=
 =?utf-8?B?NkhqWmlzMEd4YU01WHAwdFd3dVVPb0lJcW9ubnhVVk9EbDEvcnREanB2andB?=
 =?utf-8?B?L0ZhVUtIS1kzQ1hPQUZBK3BaY2RZSUpXbVdIWUZ2aE05YzFvUDBMYWRiaFhk?=
 =?utf-8?B?dU9iV2ZnaDlXSzdiWjJQelMyV3BUR0FJOVFSSE41V2dWNlNNREZ0UEtmeDFK?=
 =?utf-8?B?MlpXT3BOcXJhS0QrOE12ak9KUEJHdGkxckEzeVE3SVNXY2c0cEdtbVRtY2Ru?=
 =?utf-8?B?RHlDanpyanY2aDdzV0Nmbk9rbEZhYVorc25WYzZkTjIyY1kyTWhtcmh0czlw?=
 =?utf-8?B?eUNLQnZ3SUttbmhQOFFtQTYvMi91QTF5em95U0V4cFZWN08vR2xncldKSlRl?=
 =?utf-8?B?anI3QUVFc0htS2RDOElGUWRSL1gxcGtiUlVlL2pmZTVkZDFBUkJQVzA0eGl1?=
 =?utf-8?B?MVQ5U2xDRDd4K1Yxc1h4YXdldVZVUWV6VEVXVlR4R3p0b2NXbkthUT09?=
X-Exchange-RoutingPolicyChecked: rlpMd9420v6t/n7uVHWuaNcM5C0qcHs+NsI3QNH4VCl4FmdCgLNXeNjybKX+IV24JelSRcjPcpJ8g2dXNaN994wvH4LYZiCoZnIUNnyoru1yPX9RTmaSASqcP9olz3LWqSz7TKuKAxDT/+vh0FnV2NV45cBpPaKEkmBZjRKN4DMONw7qfZCjkZzQt3JS+lCX/9kQq2rbgzH1TXxoLjuaPJ3964bPA5ZCpY966cvtGAFAhmzBXFajs++qQ8bCWuc8p/yUqP36KC5lYe+CVnjlmmID08kBl+PWTd9EYWcrcDDuMWD9L1LObO27LBJmraB/cqH/0BxHipNJG9gqA5n/Vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98cbff5a-37ce-4671-7a23-08df0f5d03cc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 17:00:28.4266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dmthYHVN//v8hbn5SdrG5lVfVh8LcIXrpfqWT5gTGEASh5uw3JL41B7cC0EIo4hLbF/GVpgVeFWtP2DR1D3Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4609
X-OriginatorOrg: intel.com


On 02-09-2026 23:47, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Unaligned memory access due to misaligned pointer cast.
> --
>
> commit bce6aebc01fe7736c7ce377f855345b461ab89e3
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Correct group selection for memory controller temperature
>      
> Read all the necessary groups when reading memory controller
> temperature in get_mc_temp().
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 51a6664eec485..3a675d7b6758b 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> @@ -883,7 +883,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   	int ret, i, count = 0;
>>   	s32 average = 0;
>>   
>> -	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
>> +	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
>>   		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>>   				    (dword + i), NULL);
> [Severity: High]
> This is a pre-existing issue, but does this code create an unaligned memory
> access?
>
> In get_mc_temp(), the variable dword is initialized as:
>
>      u32 *dword = (u32 *)hwmon->temp.value;
>
> Since the value array is located at offset 10 in struct
> xe_hwmon_thermal_info, this cast creates a misaligned 32-bit pointer.
>
> When (dword + i) is passed to xe_pcode_read(), an unaligned 32-bit store
> occurs. On strict-alignment architectures, this could cause an alignment
> fault and kernel panic.
>
> Because the temp1_input sysfs attribute is world-readable, could this allow
> an unprivileged local user to trigger a denial of service?
This shall be addressed in next revision
>>   		if (ret)
