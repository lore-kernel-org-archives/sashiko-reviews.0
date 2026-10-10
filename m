Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B7C353A9C
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 05:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610797; cv=fail; b=MSY/M54LS3/Sh2vCm74NplwpM3MHIQ0M9syYLnV3XkDL0lEJoLk0lr6oQFcMZCBE1ii89MtjjPn/D3GwcFjAgHR0hGmgVKHCONlhxc5lma6LLRTAA/5Nz/XRaD2yh++htRyBDV8Qmdo3NukyBEMbegETtPqGiCpT4RNSwuQrnG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610797; c=relaxed/simple;
	bh=rwQxOYgQm5qwPmF2orNf7TQXJEdvG0VuWc9isG87Mt0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C5ApfOJLeDgPmM11fes2MGCLHbfBRqXfkWau8usPaE82kXBSFN1ixaEv7Ih6t62+C/eKvp/4KYTI6xvs24DN66IVurvHTwd4b4/pWiwEZUo2f3ij6VtrdnEUXIqXtrmLJg13KI+vV8392HWEv9+OggO3Qu6lKV09z2wvmq054RM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hR6tK/dL; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hR6tK/dL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791610796; x=1823146796;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rwQxOYgQm5qwPmF2orNf7TQXJEdvG0VuWc9isG87Mt0=;
  b=hR6tK/dLvrBHEWDOf0zZcfpxTMzS+wQQk6qpxqFYW/JWX9r7U58VFvY5
   UAygpm5QWbSrlQ3yruv91z3YgJjH1EYWJDZeBsOBM8d+ZNYLzBYDYI6YO
   jltaFfr3M4nd80RYkBl4X5p7LtpI92b9h/120C3Gp4t9ZICeg+kb051dD
   tM9W9PBHmP5ewqzCz2ikG89uWYr18/3uwINSCRmEE2A4+fNtLiXiLYW4p
   3FBA0zMXjd4tbgjK2WD0o8qbnEMYfAX8RvNbiAZA9mLM1FRtkqwWFQxyh
   e/FbbPyEu69K8SqNibPesXfqf4CPtXL112hqmQgXBeCPQZTB0d2FeQ+Rv
   A==;
X-CSE-ConnectionGUID: 7DGu+gPBQBGf/W17dUb5cw==
X-CSE-MsgGUID: p6HZpvC1RDWp5Ha7236T1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="411916"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="411916"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 22:39:55 -0700
X-CSE-ConnectionGUID: JHRldAbnSrqtBaaUBdwD7w==
X-CSE-MsgGUID: bpCXJq6ITaimwMHulKU7zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="2278790"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 22:39:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 22:39:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 22:39:54 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 22:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0rvB1y9K8E8eGNoU0itGYIoKVYd68iwaig3gcvWrIuyP5/QGGN1/dBrsQ6PORazXr8e2z7BPT1nf8+iwO59fjikYi/Zk5kitjbFDnrs/C6xwlhyqele2aL11XMrpoRG/fuT+BwfqJ3osEc//BKVM+aCKXHXwQOnJTBY9/LmZADSG9WUenP1LYsEnL8t8vxC47j9pECNONwyw+fe8QyPGUzEFyM9hfgixxydsuEIFdF8kJ4RqxPo6FxoyF9RWHO7WmHmuRwSlmme2jUCPLfQn4E7i8u/8jWXYyLqPrXf+TMe/7ACT+RtWRYZv4LJHrdWLBCCVR831FHyLd5EyIxMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKhyefFO7JgI7jX96n8NbvFX7draan9a6ZLr2sqzQMs=;
 b=I7E3KoR8MVhq4iuUAbb5hbBAXx997bQz1FAlFAjz/zOzdf4XSGCaiJaz2BH28+kLb3IEMWOlT7cn2wjANCqHCKFjzOUh0JiCVAPi6ugf7Vpu5SbAQhZgg/BZIVu7oz0Xoowt5jnpAtyj1oV8f8E8XcImMFLTnoUiWVRBwnCoMcqFeLP2of8iNQyVBOtq9oByxi0Opufd9B0De+5+IPRARualk8X0HzCTClSE7yn+qtdYQA0dUwhDTEdKHyiaMo5R8GrBzcAQIdOu+djxpegWKEsi4IW5T+EaeaxSfJ+xJ+DJBZxdYyT/FtmO30mo/Bpiwz3UeTHH6scyPIyTfpwowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by DS4PPFBA72E12AE.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Sat, 10 Oct
 2026 05:39:47 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 05:39:47 +0000
Message-ID: <f8b0ca11-e52c-4f31-9faa-5237b04a1b65@intel.com>
Date: Sat, 10 Oct 2026 11:09:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/14] drm/xe/hwmon: Add platform-aware VRAM thermal
 channel support
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261009120335.52973-1-karthik.poosa@intel.com>
 <20261009120335.52973-11-karthik.poosa@intel.com>
 <sashiko-outbox-165514@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-165514@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::6) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|DS4PPFBA72E12AE:EE_
X-MS-Office365-Filtering-Correlation-Id: 29fe8350-f3a7-4365-69af-08df2690e4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|10067099003|18002099003|22082099003|261009223027099003|11063799006|4143699003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: dMWPHd1Hw8pPkNEODjfyyUs87HiLBoUx7qR9B/vmfjdR9TipqNZdcfmH7Uio4EWJdpeP90gIIsCmHOq5U9WBacFoktFDi51hJTOjluK1ic9S2f0w/0vW/d09yIQ8Gdg7WE770TAFw7bQoe5pW25vJaEEAnC/xnzBAzRT8zWp76xuXqx+r/d7D9ElWmMplcQV+Ep9wdbVICz4oNXGluno/Q2lnYH5y6DX7eaByhhh50zrzAhJJWB743x7T7ywPOGNgwWxj7uTyG3qqCVXCx2UT/iEPBrmz9NjKkPmiPNmp/2rp0vD2eR3g9feTrmfXDiAj4QQVyLXyuX/fL01WIPgVSbM/QXsixhIn7TXed3KGel8tg9ZgI7iTQtxzxC9okFMDYV6eNq2wmrc84+rOQRkWVs0URCHAnUvKdvOK90Ob62y9fB9pnmvsTnQevu7YBdmZrNBUeCjIPMX/Ed+9jJccxY5zZFZQ0Hq2gDdfmgN2EsD32UxfZWwg7czolTUz1P8ltgflqsMkqrtti4JOto0nW04Gnd6/1msD+DaALDvG6uSPYgDHE070H34UZIUkfEu5IDCk6IALh44W6DxtVes90QjkZxLwE9FuRd7jVtI9HEsd5eBjRj/ai+YWG9khyZC7zg0KBS77Vi6RXI9PtoWRi8zKt890LVU9Dm6EC5oOmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(261009223027099003)(11063799006)(4143699003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTM4dkE3Mnh4bXN0TlJ0ZE9STkgrTlpNSm9IMDdkMFdqUkd3YzI5bldpS1hH?=
 =?utf-8?B?SVIzL3Rocm01b3pWYlVkRHJ6SzlvRXUvUWxpMmRqMDFPZDJkVGJWWTBEd0ZH?=
 =?utf-8?B?SlIzNVh4L3ZMeWdZSlpLRjZ6YkhZSENGM0tmRjJaT0NQQlJqVkNwc2lseW96?=
 =?utf-8?B?WWhnSW1uQUxjSDN1N1NXdXBRUlQwMXJWVnF1QnA0NUZqT0xpRnhQdTNEMnB6?=
 =?utf-8?B?ZEIrWkFuT00rcUo2d0p2c01qV1VkUFZMek5obitxTE95WDJqNE1TYUw1UTdF?=
 =?utf-8?B?cEo2NSsvRGdXNGVEU2Y0dEZGL1A4cC83ZElHakM5cVlpdmhRSVFGSVNnVkZ1?=
 =?utf-8?B?MmZsVmpyUGFweWs1WWY3MWpZVUdJVWo3OC9CdUR6RVhvWjR3QzQ5VGZOb3ZU?=
 =?utf-8?B?VHRlQU1VT3dSdUpKT3JJQ2ZTaEYvREV2QzR6RkUydFIyVjIvUXh3d2ZyeE5D?=
 =?utf-8?B?TjNxTGExQ2NJT1Z0dlQ3OUVyN0Z0b0hYdWVESXluRVFrb2ZzM2RKeDhmK1Ar?=
 =?utf-8?B?U1IxNGFsbVBlNnRxTjhsaVkvM0ppUmhxeGcvWGN4NjBiZnZIS1kxbTlNRU5k?=
 =?utf-8?B?d0xHSXlYNmRzSGpYbkU5cWlIM1g3aUMzRVdEL00xQ2RPVktyM3dPeUJFalU1?=
 =?utf-8?B?VnFGby9KVHJlaldDWFZweWY5b2J1N3pSdFlHd1NyTmRaR0pwVUdZcGh6U2FD?=
 =?utf-8?B?QUhiS1dDNjJHenhKalcwYjAzK2tiTlppS2ovdmJiUElPRTIyZmhCbWJBdm1N?=
 =?utf-8?B?YzcySytrRGRpVVhlSWRZcDRYMmFOWWhnSm52TnY4K29nZnZBRGN5Q3hsQ3Bo?=
 =?utf-8?B?NWR1c2V0UnE3VHBZbjFsankyS3pCaWp3TEhKRmhZaFVZQmpwQTNXNmQyRlpG?=
 =?utf-8?B?N0w0MFZ4ZXljN2sxSkFuMUZZTlJ4ZHpRSlZwVXhDelc3akVCV3ljTTNWTGht?=
 =?utf-8?B?elBKTFdwRGIyTEdXMnl2aG9zUnNJOFBPNUZrZzV5Z1F5ZytHbTBvaW9sSnJs?=
 =?utf-8?B?K3l1SWQ5dU84TG5vOHF5R0I3bk1XeUhKNnp6QU1jUWpMS2JmTy90Vlk5ZDA1?=
 =?utf-8?B?b3JJU1hqV2RqdlVtY21JVnpmbDBxeHFtekFzQWo0VzJWbWxCTVJ2bm9DQXBZ?=
 =?utf-8?B?RUxvc3g2ZHdUVy80MGo5bEtUTWxJWW95THh6OUI5U2ZFaFVxejBqaVN2OEpD?=
 =?utf-8?B?TUplcElaTnRTazYzNmd6L0laZ3JLcElVNmIxc2Jmc1k1eS92ZW1iSm1SRk1Z?=
 =?utf-8?B?RTJsWUNPUWNLSlQ5OGRsb3VpaXBnV3EzZ3VqR0x5c0hOTmRWU3JreTJRaklE?=
 =?utf-8?B?TTE1SlFmdSt0d1ZkSjIycHc5dnVuRjdPbU5sbVpPbzFPTFhaNkdtUncxNXJH?=
 =?utf-8?B?ZWFlaXB5Z0o2ZjhJVUVXN1g2S29INURXbDJhRERhL1B3dW5zVUZLL010Nkh5?=
 =?utf-8?B?ekR6Z1Z6bmtHK094aXpzN2ZPSlJOOFpVbHcvK1hOa2VQNndacy9xNW4yWWFr?=
 =?utf-8?B?VXp4TEFiQmZsbTErdjk0bkpULzhvVXpjTXZpcCtNbksrTk53NEdWWURodnZ4?=
 =?utf-8?B?eURHMUROdnlvVFZDb1lRQXdUOWsvNnpUY0cvYkRjU2tySTV4YlJZYThYUE9B?=
 =?utf-8?B?M0FlQTBRblVIeFRIRmd3cE41ZkJJMWptYXNJLzh6WUxuTkR6dTNXTDU2RTlL?=
 =?utf-8?B?ZnVxNXU5WTd5Nkc5eUtrNGhObjJ3cFdDT2NHa1Rsc052T2Q4N2xLVmZNTDEv?=
 =?utf-8?B?bEtCbC8ycjN3TWYyY013Z1FmaVNJVGVkWmxVK3BmVXBxaDhXdzBoUEVYYWFq?=
 =?utf-8?B?RGxKL3BuV3dxczZ4bGtFbFhxemk0ZDk5Sk5JM2I1V2haK0htZG9pcXA2aVBU?=
 =?utf-8?B?R2lOOWRjMmtOSlM4Zy9FZ0UwUlF6c3A0SG9Fa3pId2hBNHg3YmFlSWpoeDhX?=
 =?utf-8?B?M3RlSlVpMHl4bDRpZWlBOWs3ODRwTVRsckhlaWFpUXA1OXA1VjExRFJqK3Vo?=
 =?utf-8?B?V2hRL3ovOXgyaEkvaTNYb2J6OUxwNi9zUmhUa3pBSE5hUVBqTVUvVFFVVHph?=
 =?utf-8?B?ZnZ3VmhBckE5YU85MnNOZlpRVEJJdzhRZklBUTh3QUN6YjV5KzhwMkN0b0FR?=
 =?utf-8?B?RVdBczBONFY1OC9Dck1VNWxFalJYdHBqMGVKUjlGMU5tdml0TlZFa2RVWlJw?=
 =?utf-8?B?N1h3ZDhTSDNuZ2tlblpsbGFlUkJQcEJqMUkzUUQ5NGlNQ3ZxV3ludExLTkpk?=
 =?utf-8?B?NXJWNW1teWV5bXAxTC9PVWFndythK0tIOGFrdnhvM29pMWc3UXRsYnI0Y2RB?=
 =?utf-8?B?UWphdlhlSGdES0RyaFdPWHhMWG9CQndXTDhNMVlaWk01cDk1T3B5UT09?=
X-Exchange-RoutingPolicyChecked: ro/8q7PmSm640po+Uq7WuEW51Xo0pom5GgZnriBmbf4mnrsTEejwBnNw7kqzWp3UNEMd6holmGzJFxW99HDXQyvL46NqF+RYUzaLIShhGjJeLJW4V4fs+uPS8zU+kYsjpSENG4xH7pneGnI2fZkneFPjHkqoDsBpcIDOOvbB5CcEt6oRHQgqYaTyIEiVblPoDmkE5uJCuyhJ192dpEywFhq0EtGrhRn6T5TodBDOozxeIv2JtN64hMbSFdURPOkc6e1G39tE3pX062vfN9KJXJxAlZXmcEthWgEZjIoCMo4vlxrJd5VYkl3cK4U6d2q9u+LI3WSj0sMsah52Ipajhg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fe8350-f3a7-4365-69af-08df2690e4e9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 05:39:47.0408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qivn8v6W5pweu5PtX6FRsX4zeHM+ir1FsGjhPyFQJiKfm2ODWQuCykiwsIvOzg2cbpm7SAN3tmKWuviEXZwQTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBA72E12AE
X-OriginatorOrg: intel.com


On 09-10-2026 17:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] hwmon: DRM driver implements hwmon directly instead of as auxiliary device
> --
>
> commit 55ff84e7912b9e195885552d6a750a68cc2c19d9
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Add platform-aware VRAM thermal channel support
>
> On CRI, this derives the number of available VRAM temperature channels from
> the CRI_MSU_VRAM_ENABLE register. It increases the maximum supported VRAM
> channel count to 80 and uses the derived count to control VRAM sensor
> enumeration, channel access, and VRAM label allocation.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index bafa175f84578..9d83d9d2286ed 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> @@ -1683,7 +1809,9 @@ int xe_hwmon_register(struct xe_device *xe)
>>   	hwmon->xe = xe;
>>   	xe->hwmon = hwmon;
>>   
>> -	xe_hwmon_get_preregistration_info(hwmon);
>> +	ret = xe_hwmon_get_preregistration_info(hwmon);
>> +	if (ret)
>> +		goto err_null_hwmon;
>>   
>>   	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>>   
>> @@ -1693,10 +1821,14 @@ int xe_hwmon_register(struct xe_device *xe)
>>   								hwmon_groups);
> [Severity: Low]
> The hwmon subsystem guidelines state that if a chip's main functionality
> is not hardware monitoring (such as a DRM controller), its hardware
> monitoring functionality should be implemented as an auxiliary device
> driver residing in drivers/hwmon/.
>
> Does registering the hardware monitoring device directly from within the
> drivers/gpu/drm/ subsystem bypass these structural layering rules?
The hwmon documentation expresses a preference for separating monitoring 
functionality from devices whose primary purpose is not hardware 
monitoring. However, direct hwmon registration from DRM drivers is 
already common practice in the kernel (e.g. amdgpu, nouveau, xe), so the 
proposed approach would be consistent with existing GPU driver 
implementations."

>
>>   	if (IS_ERR(hwmon->hwmon_dev)) {
>>   		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
>> -		xe->hwmon = NULL;
>> -		return PTR_ERR(hwmon->hwmon_dev);
>> +		ret = PTR_ERR(hwmon->hwmon_dev);
>> +		goto err_null_hwmon;
>>   	}
>>   
>>   	return 0;
>> +
>> +err_null_hwmon:
>> +	xe->hwmon = NULL;
>> +	return ret;
>>   }
>>   MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
