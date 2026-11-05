Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793922373;
	b=kFNLCwWLNhwdTtsQNDE55HodLooQqkXaBP0tSQjvzsFHKbQuR2Jl6ZT5o5b6J/tjtkMg
	 PsTMkBr/tvPLoFw0gs/DdQMCVUHijxCk2tT/Mf5YVG6ZBwvgZvlLlEOKONOkX6zkeBjjL
	 NU3YXRAiBbLH0jDfNZNbm8VFNfv9dlAVbGm+ktGf/+PnYQj+l5bVK/6w5w0Tmxubr8iX0
	 2oc3zdDGGpRfFqy8jz2AfOdBglpHRpudss8ODlaG4byqe0r+GBa07iiGG4jTQQSJCZ6jI
	 qUjpiGElsALWI2/EtpyX1kAVJm4NtjLMH3EJu5FSmzHAsFCoDSU6NbscztW1fgt9SZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922373;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=WNBOl9Q5nv75nZpJgBimcA5ZBfEZTBzFBjlaRGa9Dbo=;
	b=hJDVhMedTa8uE7RdaicFn5WELboN7i2MobloZP9pqVM94nSoCWIgnD6Atkmv+XjVBMNM
	 L8gtkzdYi86aUYG5IrdwsEpa2zgjfKlUiRKTLtT2YvgeupSUryTK7Trc2rNozV4DRvY79
	 ix8F+12pPC/eFAsqP6BlGk81w/o239hBjTK4UvwkspyJ8YI9D7o5CKISBV1tD2sSeG/LE
	 LxSb/1Bh+Xu8wnGETEzPHaHIh/BXw1LL9CCtsgrFmA2OVCTZE9Z1AF9gYG41e0anKnexl
	 YK8YibZvw6M/cCAujPbQq9FK2GADw6QMJVS+s96o2ErlZ1AhdKLTRdJ57hxyQCZMFkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="lr/99R3q";
	arc=fail smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB58F606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 23:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB58F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lr/99R3q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793922370; x=1825458370;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CYZH2/G1tikJiciMlpGcXE0L0Em4oDd3lgOa/erjlcI=;
  b=lr/99R3qgB5RAhXKw60Bgk3QbrBxNCWycsuMUAoQYQWBwSPTbtEhsm3+
   c+fct2RPlyrlo18G78FTD0PQOqw8xKtB85/NM0wd4S87YSQvUF194oGgB
   XzML5aop9vYxpZ4tnSFVZuNKWjssueFt7XTN9njDb0Pt/d7DtseXW4tnE
   byoEGNLqxgKCRZE8PDin4zqQ7Mhe4Ddgmt3YcjgIBRdJovxQMx6PZca4v
   a9uUjOWJdmjc1e1lVGhoebOvmykeKK12/uMZlNS3zAzmnVQO/RWOQMyC1
   GICGJVfDmjRunRPVYVwDTprJs917ZUoWuNClf4QYBL8KdeQKLnCX1/OjA
   g==;
X-CSE-ConnectionGUID: GCIEPjLIQhe8VAQdJqeSLg==
X-CSE-MsgGUID: eGYNS2nEQPG2/U+oUcKXGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2737814"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2737814"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 15:46:09 -0800
X-CSE-ConnectionGUID: bk8LnBmxR9uCZ1kkEmoLpQ==
X-CSE-MsgGUID: q9V6ysLURQS1eiHsJo88BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7126557"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 15:46:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 15:46:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 15:46:08 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.32)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 15:46:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfMziquvl4gAQDQUHTSwxCbH68C6lZj3CyZJKHUCMWfsbBpTk+piDjU6J9mgjTGIIn5PKMUDEDd8RcRmgKCA9Uv3izEEUxgXmRxUebuMqMcExWo4C/Xgf4w3h/y5pkJ7p6wKsc4L30TsVi80GfNQ8wPyNLKOKD6WHxj0dLA89R16Kq2zKdi/VirqyeqRkKe0u/3OuENovydsxWOqCx5zNp7EIxcJVW90s6jquaau+JY/g5Qt4/0NFSFBWMJE+t6uYlbrmycnfOTDM78pDaTBgfZ8wm3oa0heWaPGsHAqkY30R86vSBzj9BsFTO1QFGxbBPHknPX66X8xIowI0rZimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNBOl9Q5nv75nZpJgBimcA5ZBfEZTBzFBjlaRGa9Dbo=;
 b=xNvEPN55XwDI4kYS5g23h0iONcvLepnVtYj9qZp+nRNxg8Q9o+SWKvXN7AyMnlvLFOftyG5/RM5pBsJQE5y/SZn2DEaaLIhIS65YeQuJFDLiu2BO0RBXH7DhkoXEjU6Y9upL2088UMOD/4qinsFApRtFUvUUuLzzUL38eOJodOh9a26YFISQWUW8S/7outpUse4GU5ayRFRv+EZ0338omI6PAXdOyxqwOWBt7Gjb3xdbnVb+OkRl2coGnHosfSxo3F12j5HVPSYIIF1zzDhecJBxrAE/AlInPGRy20jPFDUT/sGCRKZyMuzr1NSEjERPngT1LpBDe9JhWZeVMhqRpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8544.namprd11.prod.outlook.com (2603:10b6:806:3a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 23:46:05 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 23:46:05 +0000
Date: Thu, 5 Nov 2026 15:46:03 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 5/7] drm/xe/oa: Wait for in-flight OA batches before
 stream HW teardown
Message-ID: <au0VOzo05P6pCecE@soc-5CG1426VCC.clients.intel.com>
References: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
 <20261105001559.3288915-14-umesh.nerlige.ramappa@intel.com>
 <sashiko-outbox-198380@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-198380@kernel.org>
X-ClientProxiedBy: MW4PR04CA0043.namprd04.prod.outlook.com
 (2603:10b6:303:6a::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 3049fcb6-e399-4c0a-f0f1-08df3b96f556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|6133799003|7136999003|3023799007|10067099003|11063799006|4143699003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|56012099006|261021121427099003|261022105027099003|261009223027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: pEtBOb5Sz3FIrI2EZ7c9Kofk2GjcFItVmjUmKo0xgsGpc9wqC6obvtlmHjO50HGkPHz4H9laOEfmFgY2mRPbhypL8WMYjehXwf4Wn1fR02JVZ8SM1pakdf34vHVt4XQiBdJWvKrKnRM8uDADcL5/2QqJJUfWqeFydbHx6o8IuUCMOf1kY06ef4xvcq+72PSdWD5u/rqiGMYC0U96HkLvov4CqziFbj0dD4RJapjSsDEE8LefO8IXE6eY0uNiax0imQGc6OhtT7dA0EswiNYMUX/ugsl53MXAyLYajbiNC2ZknnCjmoF/7ngVKGsxCB+d8cc+Ptk7yIizNfqgGyuGA26CTI6AAjcQ9xhmevacq8JnijIxO+hBuo1QcydQI5KSjd2aKkMvXvbISk26nKal0mXddc8awafw3GWS9yEKN8mdXbzKh3spwKshKK63apOpqH2d5YP2CWRb0Cge3bt54Ay/R4vsM0k6BzXj2YE4s6x3FfmwjckNgUO0tXrbKP0vv5KFEqf3amsag0L9lDec6nj4hzSm4I0qF8CTGlTcoh6100maBatt7GTOMUEM+v51bLTPpCg/L+REsx+zzxdD4STv8Ulnf/wf+vyNPuiYr0o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7408.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(7136999003)(3023799007)(10067099003)(11063799006)(4143699003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDBTZ2U2Y1pxZGdvNEJCOHhTb3hFTTJJVDdZb3NZRE4rV01ocXRQcXhqVDha?=
 =?utf-8?B?dHJjaURTbEtVWi9ZMTdzbXV3MzY0algxWGpoTkJueWU4Yi9jM3pZSjRDR0Zw?=
 =?utf-8?B?QU9GR3VhanhlSlhEN0I5ZmJKc1UxQjlDMFVWVDhxUDRMU0xSN1pTUWtqKzRO?=
 =?utf-8?B?M3JOUzRXZHdwWEhVdDY3cHQrMVU5YmV3dzRMdWRNRVk2eXVoWU5kbHRaaVR0?=
 =?utf-8?B?b3Fsb2s4MlBPNkZnamg2bkc5SHBKYWJwTWtiSzRjd3hxQ3dBcExaMGllNlJB?=
 =?utf-8?B?Rms4bDV2L1F2UGZDdC90UDQyT3dBVDRlT05LWUhuRDBrR0FDakgxQ1g4aGFj?=
 =?utf-8?B?Tk10QjIyODdVK0xBT016bHg0MXpiVnBaU3pwMUhMZkxZblZadHQ3dEhWTHBl?=
 =?utf-8?B?NkhVWkxVa051VkRqWGdDalVWbVJMZ1RzdUk2djg3cUlaRTFHSmFKRks1KzFD?=
 =?utf-8?B?blpzUXpyYjZpOVZDRTI0a2xZdm42UUdoTDVsQ1hYa3kzYlE5THJhK2laR2hy?=
 =?utf-8?B?dVNuOTZRazlQQXBVQnJwR2ZGdWpqMGZWZEVJSEFhb2pWYlE4L3ZyYzVCbk1h?=
 =?utf-8?B?b0luVUY5ell2OXZ2cGQwZnBhMGFwbUxCZ05Oa01sZ1IwbzdkWXVjLzRLTGVu?=
 =?utf-8?B?d2ovQWk2NEhlNW1HZ1dSaTExcW9jSGhOS2NxcFpzRG1PWG91aDNzazhuUjR0?=
 =?utf-8?B?TTlyTTRGYlpYQUVuczdTTVpmY1F2WjZqVXNQNU9lY2NqaXpwTGRta3g5a1g2?=
 =?utf-8?B?bk9EdHFmZnBJZDNwOEtiZDltdUVWWDhiblo2T1RFUTJ4Sm9obm45UkhnV3VJ?=
 =?utf-8?B?dU5JbFVHbkdYUVB5YWJtQ0hscHZ3cVR3Z0pGQzFzakVBYmxHVzJjUEM5MVFj?=
 =?utf-8?B?Wk04UDY1YWRnYzhSL0FTZXJlVDNtZ0xJL1lna29hQ3hzVUV1K2cyYXRGOVY2?=
 =?utf-8?B?eTBReWU0Q0I0NDdMRXJLZjluSzVBRWVjejdhbjZqd2JrckZvT2tldURBbUV5?=
 =?utf-8?B?OHNaT2pTR2k2RjVLK3Qwdnl6dUU3N2hoQ3NZUVRZcTVjMnBGdGN2R2JINzRP?=
 =?utf-8?B?eFhsV3dEWFd2a0NMSDRTdVZhbHo2OFJ6U1R1Y0pRQTBFQ2NQSU1WVEhyYm9m?=
 =?utf-8?B?cUJYNUFaaDlkLzUzMjkxRGs2UEZlMERPQU9ncnhwTHRWbnFmQm13b054M3Az?=
 =?utf-8?B?WUhha1RUeE1vT205Si8xVmoyZXRWN0p5aVQ3cGlMZlpDbSswRzBwNWVxcW9j?=
 =?utf-8?B?UEhGaTdKMUh1NllUQjBYN2JzZnRxaGNyb1l6RVJ2LzdKME1lWUUzVTE1NC8x?=
 =?utf-8?B?R3ZHMWI0TUVZMGdFNXF2eHBpT3pPWnduVUN0V0hhQWw2YlhId1VnWktreGhu?=
 =?utf-8?B?V0xHY1owLzhXTFc4b0hYQW8rS1Jmb05OTVJZSEliblhod1Z3aUROMjkrQzky?=
 =?utf-8?B?a2VmOGU1dzY5REVXNlE4cy9XZUlhVnJXSHNwMGhEVWhteU14b3kreWNDdGhV?=
 =?utf-8?B?Slk3dWVONmZuYm0xSVBsY1l5R2RZblpaM25VcFRhSnMwZ0VrU3NFa3lWZnlz?=
 =?utf-8?B?VGtSTWRWb0htVTBmblNnTHBKM2RickN1RUltSG1EQUhCb2taT2ErRmJlR1JK?=
 =?utf-8?B?WkZPamxuaG02T1hUM0VUSm5WaFY0WXhsUXZqZkgrSUFLVVNKNTNzZDZqY1FW?=
 =?utf-8?B?TGYyOWhJU00xc2JkMU11NFlXTWdRRFZCVis5bDZUWHV4bFl2bENqN3lWYkNz?=
 =?utf-8?B?RzA3UUNvZDRxcWIrSkRYK256bHBZWWpSRm05Y29vMHR6VzlKRWRDQyt0RktW?=
 =?utf-8?B?QklFYkJuNks1Q0I2bmJCNi82U3NiQ0o4UU4rS0J6L09PUFh3aHlMLzV0TnBL?=
 =?utf-8?B?RzdkVXpERDRUQUEvc21ESFg4WGl1WkZaYnFZQkRMWFNab0IvUFJ6dDVCWC9W?=
 =?utf-8?B?SFNLNXQvMG8zcUgrT0F6ZUtjTG9aMDYxYWNyTmkrT05mOCt4UmR6K1VQdGYx?=
 =?utf-8?B?VUVrNTQ2QkFRMmwvNGtxMmNsNkVTVWpEUzFCMWdYeWQ0RVNvUVE2VXdwR04x?=
 =?utf-8?B?SzFseEQ1cjRjYXdYdlRUOGNDbTl5bVpKSUFUR0dXWGlhQzlMdHU3UDhyTUha?=
 =?utf-8?B?ZmhnTG5JVFBnMGJ0UUFrbWpBYzRQMFFDdWh1aUFkMnliNHRORktzajBwR2dZ?=
 =?utf-8?B?dzBYNTlIQnFMd3RzSXNWbWkvdzdubEhNQzRvU2lJMU1ESTl2aThGVXQrRFVy?=
 =?utf-8?B?VjVYV3FTL2lSV1BYaFZWd2ovUHN0N1FGdG9BdGU3UUVUaUVyMXFZTm5vTXdP?=
 =?utf-8?B?N0xkcGZpWXF6eFcwUGs1Skpwc2h5Z1RzUGNiTVNsVXk2ZFU5dGVRT0h0eXRn?=
 =?utf-8?Q?sWeayY+BXcb7Huf4=3D?=
X-Exchange-RoutingPolicyChecked: GOrYR+FzfZi0pNbUPdlzISX4WMwGMEbMrDHEmWnej5n2gJasU2pSkR7NKXc6U4BHuI26yOqwKGgnJ9f/sH1h11ZC3PExr61Io/ywRWVVP50AeYUGgixmv2xgn+gkMGZa3ucfJV6r0okURGz5nRQVi8pe6jZt7H+XvXv7fyfQPz23iAGu+uLNmGyvN3uIzaUIN/pg//boDSkWEREGDzFHBDljx/pIfrxPJDxxfi0ZsDhyal48L/Rz3t0l2Ki0FRCDuNc9ee9LUBFdx/bbYHaUNSd1+WipxFzn6De+kjcuz6IOW1h8nRKlFHgUssdduliWjvDSoOUKMMe6o5qxgF6Y7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3049fcb6-e399-4c0a-f0f1-08df3b96f556
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 23:46:05.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtwPVf+ATRdinIjYPSqyHLaJr7XL/04yjQw5N1GwNFoQAcT0tW17c+OZqLKjQdEDKuBQ15Q2LeWP4DJ1Xhpekly9iL3n48WCPWaNxro0jrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
X-OriginatorOrg: intel.com

On Thu, Nov 05, 2026 at 01:03:27AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>- [High] drm/xe/oa: context LRI batch in xe_oa_disable_metric_set() is not drained
>- [High] drm/xe/oa: post-teardown HW programming when xe_oa_stream_drain() times out
>- [Medium] drm/xe/oa: missing xe_oa_stream_drain() on xe_oa_stream_init() error path
>--
>
>commit 82829afb190084d0c0c592c6968d740225601cf9
>Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>drm/xe/oa: Wait for in-flight OA batches before stream HW teardown
>
>This commit records the fence from context LRI batches in
>stream->last_fence and adds xe_oa_stream_drain() to wait for
>stream->last_fence with a timeout before running hardware teardown when an
>OA stream is destroyed.
>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index 7552ace821caf..31fc1e7675de0 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -733,6 +733,12 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
>>  	dma_fence_put(stream->last_fence);
>>  }
>>
>> +static void xe_oa_update_last_fence(struct xe_oa_stream *stream, struct dma_fence *fence)
>> +{
>> +	dma_fence_put(stream->last_fence);
>> +	stream->last_fence = dma_fence_get(fence);
>> +}
>> +
>>  static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri, u32 count)
>>  {
>>  	struct dma_fence *fence;
>> @@ -753,6 +759,7 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
>>  		goto free_bb;
>>  	}
>>  	xe_bb_free(bb, fence);
>> +	xe_oa_update_last_fence(stream, fence);
>
>[Severity: Medium]
>What happens if xe_oa_enable_metric_set() fails in xe_oa_emit_oa_config()
>after xe_oa_configure_oa_context(stream, true) has already submitted the
>enable LRI batch via xe_oa_load_with_lri()?
>
>In drivers/gpu/drm/xe/xe_oa.c, xe_oa_enable_metric_set() submits the
>context LRI batch before emitting the OA config:
>
>drivers/gpu/drm/xe/xe_oa.c:xe_oa_enable_metric_set() {
>	...
>	if (stream->exec_q) {
>		ret = xe_oa_configure_oa_context(stream, true);
>		if (ret)
>			return ret;
>	}
>
>	return xe_oa_emit_oa_config(stream, stream->oa_config);
>}
>
>If xe_oa_emit_oa_config() fails (for example, due to an allocation failure
>or xe_sync_entry_add_deps() error in xe_oa_submit_bb()),
>xe_oa_stream_init() jumps to err_put_k_exec_q:
>
>drivers/gpu/drm/xe/xe_oa.c:xe_oa_stream_init() {
>	...
>err_put_k_exec_q:
>	xe_oa_disable_metric_set(stream);
>	xe_exec_queue_put(stream->k_exec_q);
>err_free_oa_buf:
>	xe_oa_free_oa_buffer(stream);
>err_fw_put:
>	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>	xe_pm_runtime_put(stream->oa->xe);
>	xe_oa_free_configs(stream);
>}
>
>Should this error path also call xe_oa_stream_drain(stream) so that the
>in-flight LRI batches from enabling and disabling the OA context are
>waited on before forcewake, runtime PM, and stream->last_fence are
>released?

Not an issue. The job has it's own runtime pm reference, so it runs on 
its own without depending on OA forcewake/runtime_pm. The current error 
path undoes whatever the stream init configures in the LRI batch, so the 
flow is maintained same as the how the previous code behaved in normal 
scenarios.

>
>>  	dma_fence_put(fence);
>>
>>  	return 0;
>> @@ -876,6 +883,23 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>>  		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, OAM_LAT_MEASURE_ENABLE, 0);
>>  }
>>
>> +/*
>> + * Wait for the last OA batch of the stream, so that it can't program the HW after the HW
>> + * teardown.
>> + */
>> +static void xe_oa_stream_drain(struct xe_oa_stream *stream)
>> +{
>> +	struct xe_exec_queue *q = stream->exec_q ?: stream->k_exec_q;
>> +	long timeout;
>> +
>> +	if (!stream->last_fence || dma_fence_is_signaled(stream->last_fence))
>> +		return;
>> +
>> +	timeout = msecs_to_jiffies(q->sched_props.job_timeout_ms) + HZ;
>> +	if (!dma_fence_wait_timeout(stream->last_fence, false, timeout))
>> +		drm_err(&stream->oa->xe->drm, "Timed out waiting for OA batch\n");
>> +}
>
>[Severity: High]
>Can an OA config batch still execute and program OA registers after
>xe_oa_stream_hw_teardown() if dma_fence_wait_timeout() times out here?
>
>When userspace opens a stream or calls DRM_XE_OBSERVATION_IOCTL_CONFIG
>with both an unsignaled input sync (without DRM_XE_SYNC_FLAG_SIGNAL) and
>an output sync (with DRM_XE_SYNC_FLAG_SIGNAL), xe_oa_emit_oa_config()
>calls xe_oa_submit_bb(stream, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb), which
>attaches the input sync to the job via xe_sync_entry_add_deps() and
>returns without waiting because num_signal is non-zero.
>
>While that input sync remains unsignaled, the job stays queued in
>q->entity waiting on the dependency callback and the scheduler TDR timer
>has not started. If the stream is closed before the input sync is
>signaled, dma_fence_wait_timeout() in xe_oa_stream_drain() will time out
>after q->sched_props.job_timeout_ms + HZ and return without killing the
>queue or canceling the pending job.
>
>Because the pending xe_sched_job holds a reference on job->q until
>xe_sched_job_destroy(), xe_exec_queue_put(stream->k_exec_q) in
>xe_oa_stream_free_resources() does not destroy k_exec_q or tear down its
>scheduler entity. If userspace signals the input sync after
>xe_oa_stream_destroy() has finished, wouldn't the scheduler wake up and
>run the OA config batch on the hardware after OA registers have been
>restored and forcewake has been released?
>
>[ ... ]
>
>> @@ -913,6 +937,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>
>>  	mutex_destroy(&stream->stream_lock);
>>
>> +	xe_oa_stream_drain(stream);
>>  	if (!xe_wedged(stream->oa->xe))
>>  		xe_oa_stream_hw_teardown(stream);
>
>[Severity: High]
>Does calling xe_oa_stream_drain(stream) before xe_oa_stream_hw_teardown()
>leave the context-restore LRI batch submitted during teardown undrained?
>
>During stream enable in xe_oa_enable_metric_set(),
>xe_oa_configure_oa_context(stream, true) is immediately followed by
>xe_oa_emit_oa_config(), which overwrites stream->last_fence with the
>config batch fence.
>
>Then, during teardown in xe_oa_stream_destroy(), xe_oa_stream_drain() runs
>before xe_oa_stream_hw_teardown():
>
>xe_oa_stream_destroy()
>  xe_oa_stream_drain()
>  xe_oa_stream_hw_teardown()
>    xe_oa_disable_metric_set()
>      if (stream->exec_q)
>        xe_oa_configure_oa_context(stream, false)
>          xe_oa_configure_oar_context() / xe_oa_configure_oac_context()
>            xe_oa_load_with_lri()
>              xe_oa_update_last_fence(stream, fence)
>    xe_force_wake_put()
>  xe_oa_stream_free_resources()
>    xe_oa_free_configs()
>      dma_fence_put(stream->last_fence)
>
>When stream->exec_q is set, xe_oa_disable_metric_set() submits a new LRI
>batch to restore OACTXCONTROL, OAR_OACONTROL or OAC_OACONTROL, and
>RING_CONTEXT_CONTROL, updating stream->last_fence after
>xe_oa_stream_drain() has already completed. xe_oa_stream_hw_teardown() and
>xe_oa_stream_free_resources() then immediately release forcewake, runtime
>PM, and stream->last_fence without waiting for that LRI batch to complete.

Not an issue, since behavior is retained as the code prior to this 
series. On xe_oa_disable_metric_set(), the LRI batch execution is not 
waited upon since it runs independently and holds a reference to the 
exec queue.

Regards,
Umesh
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com?part=5
