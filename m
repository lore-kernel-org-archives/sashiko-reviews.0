Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A678D25A645
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221892; cv=fail; b=laCvuyLAzJg2+NHXrTgj4yidGw6NcgwgIUWIfYbzs5fn2CUwsCLB6SL8bsOA4PWlToErwu/JJ+yJlQTtyiTvuKrxjj+VKDcDxq5+V89OGCia/UM4OLWOkr5EBY0nGqNIl4/yFDvFK3tf+XFDvpiiwiZYdnn+i87tC97o0k5MHsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221892; c=relaxed/simple;
	bh=8TU/VsiZUFSTTtiWhPXjWcWtt+eJHCBuxU3/pK1x/fk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HyKIHT+MS6mZLKIfzP5D0HC43HyiIrkDL/ccKoqeKkoqX6Rj24xcDPsJfHhO7IOg4oEVNiczL8Wk6kapb02sIFlOxkHH0Q5Rki+G3ERD37wNEcQgZdZWFuRg3WZBi4qT8xlaujtjF849mmrgwBp3rei2fuR8amCtnFKf92ZGlXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/P26or+; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/P26or+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791221889; x=1822757889;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8TU/VsiZUFSTTtiWhPXjWcWtt+eJHCBuxU3/pK1x/fk=;
  b=c/P26or+rrQ3zJHSUVA8CPhxxgbLWD76kj9d82vriPvl6w0bm2qMqw10
   yiI090M1rZ4RQw/9dqtJKSWPqI8dyRXtav8l9DmgnYumcZJ6NQYLT74Tk
   +VqqRCXAAJgujVm0U9bICyFln2ytj1flLHX7w2Y3fQbxEfS2RwivDU6NE
   8KV5mWhDJZXwIYFvkNZ5LjqzmOoTD7q65z7qhQEazzMM+3+bchUhfEMjh
   VQQL1Ir8sJ6WzbG5VJAiCiOPYkrrw/3dBE1TBrHceu+Gc+TvoVuZJlby+
   XrnK2z5fw84HwgatkoaeV7oAZA+cvxmL5Pl7AyNbhP3Uq9Dk1X+cB0vF2
   A==;
X-CSE-ConnectionGUID: 5hmbdbi4T5mYS62VNaU5LA==
X-CSE-MsgGUID: 4bYeLVbmQ1+ZsREjssV0nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="108279694"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="108279694"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:38:08 -0700
X-CSE-ConnectionGUID: E2X+Yn/nRcSrjioTb9nK+w==
X-CSE-MsgGUID: 9nWgYI/nTaWPQN+ZI4NbyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="281662909"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:38:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 10:38:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 10:38:07 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 10:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBVFuTvKHggpATTjtx/yP9IJkz53qNtUEjTP14+gZEK7+6wwvAVQT2NhcldQKAphe/063ubcERTQy/dpnZapSs9PhT9QI6jeUjgAJXbemLvyUJCS5qkGY+qr+luLlk9VXuYkNTeX8ns3mJy2rSmMp/gMlGYIWl5k+sYEfJ0aVXrzi/YsGeQjsVLrh2riYbWSO1PObTVkRU4+5td/U9k+r0GEiPy+f5FL/XfHLXFMencZLdmnUWnkcr4Pg5zWBu8YcrX4O9e5iRCemJqQipA6jEPY8/Q9jILIOyviMhsxeXanzthc4JWOYKDnZenhx7wyZ0vq5p+moID9CS/s78Gauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYz/SxxUSjYc31YwrLvbCFzxIHf711LCQ+JekK+iAxo=;
 b=v+d22klG9ydjDkw+9YfAaysGWE5emg7O7+wwU+iGG7zUocN8OMCF34Ok58yu/2b3pmszWkp+yBQfSCasGUrfRloJTrhra+XIHKfc1Hrg/ULdR/CP/c4yGqeHxxGwrA+9pcDgVJMRM1//puZTTRH/uSNz6nmZOfaPO0iNHOApip5QSYTM2HaA68AACPEfR/S5mq3kOipIsjDie0qVvpDTq673kJCf080LfDh/CLq4JD/3ub1zKEbKkdYHRm8XlKHRtDepyjxaGcXoG9SxtAsjXkDlOJ5vSdQB0MlNzt7CQxtCuNHD+F6ywzZ3mieEidc6qr7M0+hDNuCnmf/QRXg1Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by LV1PR11MB8790.namprd11.prod.outlook.com (2603:10b6:408:2b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 17:38:04 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 17:38:04 +0000
Message-ID: <7c73a849-5994-4664-952a-682823a14b55@intel.com>
Date: Mon, 5 Oct 2026 23:07:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] drm/xe/cper: Retrieve the error counter record
 for CPER reporting
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-16-badal.nilawar@intel.com>
 <20260906172343.2A77A1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260906172343.2A77A1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0254.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::19) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|LV1PR11MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: cb699af0-733f-48cf-024b-08df23076911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|18002099003|22082099003|10067099003|3023799007|4143699003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: FIIzzmgwh9kLGIaII3t/1FJDslRx5s6DUL4THK1b+N+rb6XqTp98ZAZTe27dqU5vYpPsuXEebDWKY5kSXpii1zVhUdTIlk+iVpGnwbqO1mcho47CxeURoIHOMVOHfYQstdE3zVjtBtNhOJjr8rtcESIoZ5FTejjFdp5DhyYanQ12xETaGcCmYw6/oCru17q2oGWdPOAoiWO7TF4FsaK8S9mAGxl7TTSKM2feMaOfCIG13CYL6rNa6L/OeCZ2ODcruT+n/fN6a54m3e8ekj2iDkBpSgvkl3bk1k/1FMxJbRDkD57ulGEJ0TenCNEIMssxsxLPTt0HoYb6wjc53iYJ4wkbJVtX2xVKzzSDiIoH6WJhTzU6L/l+C8zY4EQDrnBuJu+dkLd/MoqjirJNnbseDmZY0ZYVoq7lOv4FTb+8LXuOOl8UwSUbLMdttXC3XtsgJXCclla92hkGv4PBnI90rpl+oBC4e6vZK/LES/Hwnahh6CKJP7bhFr3uE4ESW4qzOke+/luA15q34iPIjyyss6YARVJcI21Wm9u92qr+FFyaegbu7/Rv5sGpVsnwqQN17uU8Rt6GUEkXKI3X8DMFpI6hfnK2gC0IGQbbXJh+tW8GPJlk+o3T4BUxe7hHrr4RK8eSvRWy2b0Cng6yiujyIvA5E5781lqgqyB9gRGGmZ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR11MB9792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(4143699003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clA3bHNZeHRzQkYzdGRuMTV2YVhnbEl2eTRpaXRQOURIUUJoNjI0cmlIdTZJ?=
 =?utf-8?B?RkgrWGh6eDJONzhGU2w0dVkrNUVicEdkM1VlQlMzay82VXVYV05ieDBtSUF4?=
 =?utf-8?B?RGJuNWVpT1lCek4wRE9aOWgrM3RJc0JmbGlScDh3R0xyZlVxUWJPUVpPQ1Ry?=
 =?utf-8?B?OWxwSEhHOEVSZUNML2IxQ2czZFJOanZKcVhKNFZrcXlKa01WSUppYzlwZVpU?=
 =?utf-8?B?dCtOSmw3MUNOV3NET2tDckRTVTlqWldvOEJ5OUtkeHlvVHdqS2lXeW1qSTVF?=
 =?utf-8?B?WTJrS0J3bCtaK0JxM1BqMlB2RGN5U25tZ0trWHIrSWdtenlFejlhaXNScXBU?=
 =?utf-8?B?VFBRaDNBd2F0WW1ycVFaMkI1WFNRc3Y0dG1lNG0xcXJhdFRMYTBRNXA5Unll?=
 =?utf-8?B?NFRWS09ZQ2JzSWRvbDhJeTFyM0VETEZBdVd3MGNLMXkzUUhnK0J3WUhCaldE?=
 =?utf-8?B?RmVlNFZVVGtzdEYxMk01ZGlTb3d2dEl5dzBmbWtHT00yeGcwTWZSUFBsRmZr?=
 =?utf-8?B?ajJTMTFvcmxmZE93K2YxY0hTaXFZK2lzWlozc083aXpEUWZVdklZMlUzckNn?=
 =?utf-8?B?aUF4TEJDRzZaaW5hN20vQlhKMzBzQUxXT3I5MVk3Mm1MTGJJMWRXWGFLck5h?=
 =?utf-8?B?QkdjdEhZMC91TXJ6OG9FdHhJdkhiQU0xR3RsYWhFLzhJUWRwaG1OWjhhdFYw?=
 =?utf-8?B?K2UzUXBtNmsxUHBmWE1mS3NJRXhDTmtwWUxsNjdjK3B5ekREak5tWFJqcVdK?=
 =?utf-8?B?R0lXb082QTFTM1pEN1VvcUt2OFJTQzhLZ0xjckhOUElKYUpON2NmT2l2RzVv?=
 =?utf-8?B?L3ltZzdkZUhybHNvMUxvR0Q5SnFIMTVXTm8xWjdHbHFzODl1QWVxYWhNZFY4?=
 =?utf-8?B?RTdvcmhJNjhObGsvV0thR3FhV0V1WGNtL3N2WXRKa3pTaWhpOURmU3R4b29H?=
 =?utf-8?B?M09vazBQdFU4QUV0b2Nydzg1WVVGdEUxZExKNXJBbERZbGZ2OVpjOHlUeGt0?=
 =?utf-8?B?WGR6bG5kTEpRbi96TmJNMjZ5MkxTa21Fc2lnUkJ1TzhSekhDbFZIb3pLeW1l?=
 =?utf-8?B?aEtOUk1DV2E2eUIweE95SmszRXRZekNNa0pFTndaZnYxekR4SkdpNEpRbUJp?=
 =?utf-8?B?cDlGdmQwTlJ6Y0dGbGdoVmxxRnVCTmxYajREK0xOZGZGK0xleTNPUk5YRHdO?=
 =?utf-8?B?WHlDanZWeHY2MnI4VlhCcDE5YlJJSkd6cWUzbHVnamtrZjU3alU4cjRQL3BL?=
 =?utf-8?B?UUcrZFYydFlydDluQ1J0U3VxRGdhZEp5RWlnSDFpTmtJNVRkSHlaVURJck5v?=
 =?utf-8?B?K3p2cHZXck8xaWZtWHk4NDhQcDgzQzFJazBTT2pJcUorNi8vQTU4a29WeDZP?=
 =?utf-8?B?OGh0cW5aQnFyZ3h5L1RUN2J5RmhCb29Dc1ozVHVRcFZzVld4RVdYMVRPOHVS?=
 =?utf-8?B?dlJXb0dTcG9ZbU1jK2Q4WWhXYXpnRU13a3MvcDR0Y0VENkhvSlA1QUZnY0Y4?=
 =?utf-8?B?UHoyUTBORzQrTzJhdEJJdERnS0YwZHJRMHh5Zm9YUXp2NnNsUUVETlBZVjJM?=
 =?utf-8?B?V3Y3YjhDNmEzMGsyZ0Jtd0JVbHg0dGt0Wm1kM0ZHV0JRRXRrZkRKbEszbkZ6?=
 =?utf-8?B?djdUU0s4M2V6SnhqOHhoa3pRbDdocHNtSXhPL2NoRUtodjNVRGNiMVpjNXk3?=
 =?utf-8?B?eWptOWZWdDB4Y0paMHU1bXRQU053Q3pxRWE5VlZ3elI3cUhFdkhWRS81Uldu?=
 =?utf-8?B?Y0RiMkprQzBtOTdzZGNQTlBSWnZORE01V1lKYTJxR1d5bjlHeVVDZ2VVS2VD?=
 =?utf-8?B?QmtETWQ4ZDJZVFh3eDVRNXVVMnN2Z0ZHenVPc0c5ZmFXRVVHNWNrN0w2MkN3?=
 =?utf-8?B?Y3l5OFVQMmtzRGJZbGhwVW1VSzZrcldOSWMxbWdFenJaUnZSK3Y1cDJtOTMr?=
 =?utf-8?B?S0xMTjcybktWcGFhNEhrN21SU25MN3RxbnFkd2lpTDJFQ2VGTk5nUGpLS29S?=
 =?utf-8?B?TVVvOHVnbFNQanpmRlMxVkJSQVFBWFZUSjNoTUJqc0pNUVlGNk42MHV0eUFz?=
 =?utf-8?B?a21tc3VPQVdjbzd3TUVUcW9tZ2VPU3oyWkpjVUVqcm1FVXNtU2VzMU9zNVUw?=
 =?utf-8?B?aEtzeTB1Z2FiYWJyTGV4NXBRQUdOQmgrbzN0S3cyRFc0Y0xpa2UyV0VSK0pl?=
 =?utf-8?B?ZmdpWldENVRmaTNnYUFHSy94UVF5VUxaOVdidXVOT29YS0d2WkpqRmxHNWtm?=
 =?utf-8?B?eDZlOStuZVBiV2Z1NDV6ek51R1dxclZUQkNHTDNtQ096dE1JaDFBZHlUUCtZ?=
 =?utf-8?B?Q3dUb25kemVtUzVicktQVXUvdjM4amhjV2VHTGtqcE1zUSt6VlcrZz09?=
X-Exchange-RoutingPolicyChecked: IkUUbyGfUvLK1AoZ+kDyVEEpaEEZzdKsbbh7YWEAse2Ax93+PYlTZkU9LAc1K5xRIFZT1FAABvEXk2EmTgEsSAqfSetOIBhd/h9jzgoIaSFcHY2Pf1AKn6ru6DL2aBQ5aY9+GEiDqkz8WAGQpYVslyBGUdngvyKzzR6iCEXtj3IEq51jx6zCrAdiR+x6IgZq//0e5dn+TlfwecUjTa6HAKsCMTLeMrZ7NokC3yZcb/iLbdz1hTntyNOk3DRe6uMuq9CzayOU93bxce8iEcLmGL9yfL8K7puw/WuRt9mPbg7Iomysxekc8KwzPhLorSmtS3rj9SZDr8b30erge0gpcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb699af0-733f-48cf-024b-08df23076911
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 17:38:04.7547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuUBUYfTZUAI939E1/7lhxo0Dvg/q+HoUMFAbHuu0PdJcD4nxgrv4F6grNpO88xdcsBTAidgv9XI83/9McxVVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8790
X-OriginatorOrg: intel.com


On 06-09-2026 22:53, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>
> New issues:
> - [High] Fetching error counters from the generic logging emission path introduces a might_sleep() restriction into generic logging macros.
> - [High] xe_emit_hardware_error_cper reads MMIO registers via sysctrl command without ensuring the device is awake, leading to potential system crashes or PCIe AER errors if called when the device is in D3cold.
> - [Medium] The patch introduces redundant, synchronous sysctrl mailbox commands to fetch counter values that the driver either already possesses or fetches again immediately.
>
> Pre-existing issues:
> - [High] Preexisting logic bug causes xe_emit_hardware_error_cper to immediately abort for hardware SIGIDs, making the newly added code unreachable.
> --
>
> commit ea598ea85d76d6f40d20fe1e15edf6a22c8e705c
> Author: Badal Nilawar <badal.nilawar@intel.com>
>
> drm/xe/cper: Retrieve the error counter record for CPER reporting
>
> Retrieve the error counter record required to build a CPER record when
> one is not provided by the caller.
>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index e8017e3ee3a09..f04a91223a43c 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
> [ ... ]
>> @@ -26,6 +28,8 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
>>   				 struct xe_ras_get_counter_response *response)
>>   {
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	struct xe_ras_get_counter_response local_resp = {};
>> +	struct xe_ras_get_counter_response *counter_response = response;
>>   
>>   	if (!xe)
>>   		return;
>> @@ -33,5 +37,16 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
>>   	if ((int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START)
>>   		return;
> [Severity: High]
> This isn't a bug introduced by this patch, but does this condition in
> xe_emit_hardware_error_cper() prevent the newly added code from executing?
>
> Since hardware SIGIDs are strictly greater than or equal to
> INTEL_SIGID_GPU_XE_HARDWARE_START, checking if sigid is greater than or
> equal to this constant seems to cause an immediate return for all hardware
> errors, silently disabling the CPER record emission.
Will fix this.
>
>> +	if (!counter || !xe_ras_counter_is_valid(xe, counter))
>> +		return;
>> +
>> +	if (!counter_response) {
>> +		counter_response = &local_resp;
>> +		if (xe_ras_get_counter_response(xe, counter, counter_response)) {
> [Severity: High]
> Does fetching error counters from the generic logging emission path
> introduce a sleep restriction into logging macros?
>
> If a generic macro like xe_log_comp_fatal() is called from an atomic context,
> this synchronous fetch via xe_ras_get_counter_response() will invoke
> xe_sysctrl_send_command(). The underlying sysctrl command asserts might_sleep()
> and waits on a mutex, which could cause a bug or deadlock if triggered from an
> interrupt handler or spinlock.

xe_log_comp_fatal() and related logging macros can reach 
xe_ras_get_counter_response(), which sends a sysctrl command and may sleep.

Only hardware SIGIDs associated with a valid xe_ras_error_class take 
this path. The callers are xe_ras_process_errors() handlers and 
xe_ras_counter_threshold_crossed().

These paths already issue sysctrl commands and therefore execute in a 
context where sleeping is allowed.

Will add might_sleep() to enforce the sleep-able-context requirement.

>
> [Severity: High]
> Also, does this hardware access ensure the device is runtime-resumed?
>
> The sysctrl command path uses guard(xe_pm_runtime_noresume)(xe), which
> increments the usage counter but avoids waking a suspended device. If this
> logging path executes while the device is in D3cold, will the subsequent
> MMIO reads hit powered-off hardware and trigger unhandled PCIe AER errors?
Callers are expected to hold outer runtime pm reference. Will add 
xe_device_assert_mem_access().
>
> [Severity: Medium]
> Finally, does this force a new mailbox command to fetch data that the caller
> might already possess?
>
> For example, in xe_ras_process_errors(), the driver already executes a
> mailbox command that returns the counter values. However, it passes only a
> pointer to the generic logging function, forcing
> xe_emit_hardware_error_cper() to issue an entirely new, redundant synchronous
> mailbox command to fetch the same value. Can this be optimized to reuse the
> existing data and avoid extra latency during error handling?

There is no redundant mailbox command. Call inside xe_ras_process_errors 
fetch the aggregate counter for netlink event whereas 
xe_emit_hardware_error_cper() fetches detail error counter required for 
CPER, which also contains info queue data.

Thanks,
Badal

>
>> +			xe_err(xe, "[RAS]: CPER: failed to get counter, skipping record\n");
>> +			return;
>> +		}
>> +	}
>> +
>>   	/* TODO */
>>   }
