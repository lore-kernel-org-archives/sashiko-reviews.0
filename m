Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794609392;
	b=Re1tzEhTtS3nkVF5b5XjoHktIp65TPgCyMU0647UuUR+SiPG5kcsHDMGGO53xD9ZWO2O
	 TMNRjYgIZj+cqcPVbrsRPWgs3Pv3AbSTHmiKhh3Lpq0aaPhFjqMlL00Mp2Fa3KOezK3tf
	 EiCTRKw5p5oZRln9xpVDnAiukQgkOBlsJ81GxOLGh17N+dehJpOyjxJe+gwnZT0PEktn7
	 +lOjk79krwjJ84Fkb7VzKf+q7nP38vqH2x8LUT4w87SNqll2JVcAbsV/yTYlESXLHTdBN
	 7wF7JM5RVbZGJS4DAS+38ohbsy+sNIjC+EGQg95sdjs0VqxNY1YDZ9xrYjhuqYmQLnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609392;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=qzvnEc2Qf6zZPNQMwOAcK6y60uq2kiuiOSkFdwc7aXQ=;
	b=0zSluf2cZUxXIlszS9/0abYFGhGSez/WCO9WHUP7Q3INqs6t19HhdHrOHdZ4T8KFiJEU
	 JrH6i7/bIW0Ar0HC8SgNrdTTEms5M4pdvY4n+eC8kftY7T16+akSK29J+LLpSlLCGcDz4
	 FPHNDOig/dm4N4htj1NEIDbR06si3ny1+n3DWDpYdJ6CoV3VQiyy20a/DQkY8WPrNrVci
	 9dUn+s+J19vY7zfdKsyfJSQSjiVY/2ZC0biHQ3h4zKO0XRBbFKNJO1Ri3BL94uiHFEFoC
	 33Sk52ZhdvouXN5vZk0OFhTbYS8lxngHJTsoXyEnDr6whBVd4gFnSPoJcUQj8bCTJYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bw2P7ZAH;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=EPPTysg4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10C8606A551
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 22:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10C8606A551
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bw2P7ZAH;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=EPPTysg4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794609393; x=1826145393;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=g9ssmsyeBWFGM96wQ0sh12VmgZrA7rf/Cg/SPjTcxnU=;
  b=Bw2P7ZAH+WvufC5ko+/6SUdmgkYzFMPUgzT/Y+tWVXTVmiqG5L0EdaQM
   ekL6fjOpbm2p2T1feSTXrtTdERz+To4O8ItC8wHvYkXILdIFrQjCjnEnH
   kX8zfXtxNsdYqtr1o0QzPOZXg5seXSL3374+kUXSMkozVlOHxUvv7Q8o3
   BkaCPOB5mHmVRMiO51VyXHo7YHdSHy2Drkho5svEeFhHGT20jeASmdh7m
   saKe/8FfNuvBBItLy5WyU3V79ICyWFMrWFz+yfZYGtA8PI2XbuMiK7lcq
   V15gB6JgLvyNlD5fdPi49xJtoS7xW0W1B7AR9Aem8udnjShnv6Vjji2uu
   w==;
X-CSE-ConnectionGUID: wQu/6wICTCqaWCFuGwFHiA==
X-CSE-MsgGUID: bhIS8g/ST7mEwl/BmteY2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3283094"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3283094"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 14:36:32 -0800
X-CSE-ConnectionGUID: CLfPNkRlSRWwryc430YFeg==
X-CSE-MsgGUID: IDYMshkMQrmMh0vGoGd3Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8877303"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 14:36:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 14:36:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 14:36:31 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 14:36:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2x6wi2D3Z16Gt8eHqT4ohL02V2uHhQ8Tkp/dNzw4tFm3YL1fDAcBflBUSBRXgSl4Wi6MT/CcufOd8FOk5Q/6xH0v+tnxm+S8Y3vVOs9FJMDyW928Zkk/9f24YeAZ4Q2mVFWGKGeOhtrYo57D6b/ZHM8x0Xq/3C5hm+tSY+pOUclwo5lAXPztxIrQzCQL549isSlcE5oqGoSIQPhvy1R4p9qdiIjlyJXgGq6SkGpgB/YYJEQW2edCRKvJzH9vo9SWyieBP6WFIaC0c2Nzz0enyPqTCieL8hiMPrSKV6AdI0TUXZJXnGZpiqFQSgVI4BclHI6Ykiz2GPgg9wpXjfLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzvnEc2Qf6zZPNQMwOAcK6y60uq2kiuiOSkFdwc7aXQ=;
 b=LukUnyJTtbW6q8C4k1wH6tm3kEY3FFCG3WS/yUHwWmttln4yixMojpO/e8eV2ig2kR09qbRpz243UaLCyUAMxfCPqKpACDKgtv+WwREtKRa0+qBBnknC+lx8+RT3tBAqVhgEwkHFao3XjlhrW1XH8pnyLg10QLIXyciBUXNmCp72u3wFmcnSgXf32UgKXOJoQgvaFH4uJ7vVhdon4BPn9mZM8LG4zlxkG6EZLZNpJiMsqNZkcE0chihJ1hKO7UGHPhjjBWQD6EkHrTK5W6MyaqJOq7fZ3KxPoZf69ymf23GDjiIgHETGFOrTozZ8LnFbnKtbYDOnO5Vsw84n1B3i6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzvnEc2Qf6zZPNQMwOAcK6y60uq2kiuiOSkFdwc7aXQ=;
 b=EPPTysg4Jmjm2eNO0e0y9pVWIfyKZeFLBoTKjabFt4aRa11ynIAj85yjBOFuHseIIcPRCdJ+3hBjGXBRQpIZ0Afgsh8vGckJi2aNjnjVG5yQelhYTVZoKkBzJVpdcNknO1K4Spj5ZD3FPehnxY5wT6mC9HpVV79bTqfmJTDgW+s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 22:36:26 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0592.012; Fri, 13 Nov 2026
 22:36:26 +0000
Date: Fri, 13 Nov 2026 14:36:24 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 5/7] drm/xe/oa: Wait for in-flight OA batches before
 stream HW teardown
Message-ID: <aveQ6DhwITmByrmL@soc-5CG1426VCC.clients.intel.com>
References: <20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com>
 <20261110190052.3514226-14-umesh.nerlige.ramappa@intel.com>
 <sashiko-outbox-207653@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-207653@kernel.org>
X-ClientProxiedBy: MW3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:303:2b::34) To DS0PR11MB7408.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb69f09-d6b0-41a6-85b6-08df41d68d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|11063799006|56012099006|22082099003|18002099003|6133799003|3023799007|261102123227099003|261022105027099003|10067099003|261028144727099003|261026140227099003|261022075727099003|261026121527099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: YXr9pjOczetFU/if24vcdUHKknxzv/yc2nMcknVx+beDCopIKSnugu142hQgHUbaGahppDq/BeMd6oT2eP5/q55h6Nrv75AWReK8Wf7mTkuSuuTXSRAOoHX6MB32kC/lDudHPV8NRoqgl2mPWU2USXlc42IG/M6gPYuDeYw3ZxSBnwwcA7UjHnTnYXBLzSKf+dh+LbQus8kxPNWsJKRPM806NNktvIYMQWxY6NXcCDPO0TLGtS3MFBBtgaXu3MXoGDY5DETpLCy/bVnZL2olPno1M09JHQcBY0rnLez7bPZR7B++36gY98dd5ojFcSY8qCi4haovzsgXN/zg5N6+iddCSBA66GB8I2zaJp+76qALSsg5oG88SXFzrOADOI8l/TeGgxG3DySZYS9He+MzYtP3mTfHnwBmZ+f7tJqWsWJbZKd4ZGVcyQ1ofqa+Zcl+YRTJ7TLTxx/OmAmWFPl6omun4OqjmJRd94VJB2G4i2WHk0YwO8rMUPc6nHz80hJuEUXd99RSuKzFqWPp5ikJo0XGiQ+zdWUg1lm8C/8p3FJeY7x5m62zf98M/t//vYAhpq/44XQF+2vgdTO5kjzdr7JQH3mydMpihQ2pKBhvDB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7408.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(3023799007)(261102123227099003)(261022105027099003)(10067099003)(261028144727099003)(261026140227099003)(261022075727099003)(261026121527099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjdiVmVURjVuem1mMnR1dXFsdFlEZk12dUJPTEQ4WGVTNkpRcUdqckFabkVY?=
 =?utf-8?B?Sm5obDIvUC9mTzRpa3JxdGJsL1FlQk95Q1JWZjNTeFZtM0FTQjVsZWJhNW9V?=
 =?utf-8?B?RmM1aDNrdjI3a3RkbDVSc05ITUl4RjhYZXd3blJubUJMK1J3T1hwN2c1ODhN?=
 =?utf-8?B?aWpueEt0OUVFTE8zWVdPN240Q2hzaXppaE5LdFBwUnl2MSt4TlFHQmhFWU1s?=
 =?utf-8?B?bjVXcTNZY0JWRk4wdFZYRWdleTZXa0FpL3FHQU9MOUNVMk1nQlk3QSt3Wmtk?=
 =?utf-8?B?VkVyT2hFZFA3ZHFOVWtBUm5jSDJoWWFSZm5tbC9vNWIvZGJ0ckZFOEpLV012?=
 =?utf-8?B?cG1Ed0I5OCtIMDZqYzA3MVpqQWttcHhJNG1Fd0ZIMUlPWERRTlhPTnZCMDhq?=
 =?utf-8?B?dFV3YXpLbGJIWkQ1YU1hbGx1WFJoVTE1cXoxdVM0bUVlUFQwQUdhQ0poOUJP?=
 =?utf-8?B?ZnBPRGtoK2NlVmlwR0s1OEpLNkhLcVoxQ1ZBWVdNQzhveldyYldReHJqV3RE?=
 =?utf-8?B?SHp6SVk2aFQ3NXg2eWdHMldWSWpBQUNsNTUwNk5DNDJPMklDVjM0NGRpUmpn?=
 =?utf-8?B?YU9ENXMvcUNGLzZaM1l2NHdIU1QwSG1mZ3NMWGZPUGl5b1B6Y3VYemZOUXE0?=
 =?utf-8?B?bnlwTFVYUEFwZU9YRTBXZGR2VkRLOXpnQkRjZHh1bFl3dkhhTzQ5ZFdsU2l5?=
 =?utf-8?B?UHBydXNha0U0cGpnSFpJbEYrWkpkU2NxYnhPb0hTSWNsRlBGNm9oOXJ2ck81?=
 =?utf-8?B?L1VSU0tQUGU1YkxNYUw3RzFodlMvajdXYUp0KzFKZ3kyMWdWV1dqZVVJZmho?=
 =?utf-8?B?L0d0SFp1U3k4bWo5Zyt3clJvYlBWZ2szMGRzMFdETWN3YWh4SHk5QkU2bU5m?=
 =?utf-8?B?WGVaK2F3RGJIdFVOWUVYdUpBVjBBampwcmlDZEFqNDBJRWxETklqRThRVmVh?=
 =?utf-8?B?d2t4dUVBYkR6VEdzVjZzYTQyQUt5amZKR1pRNDh6NzVhUm9QemJxTVg1MitB?=
 =?utf-8?B?KzErRWx0ODlobDgvZkY2czN2Mm5Va2J0UVVWZTIwZzNVN3BpU0ZjMWgzN05Z?=
 =?utf-8?B?WUxhNlRPajFoM3kwenhoMjlYZGNRK3NTaWVsK0tKdzRkUU1lL1BSdFE0dGpF?=
 =?utf-8?B?VDNGM3hOTUd3OTNZRDF5OSt6eG9FcmgzTVU0T1RnWjBMc2Rtd04wQis1Ziti?=
 =?utf-8?B?ZGQ2bE05eDRrMGVCV0lrdzFiY014amxUUndmcjJudXErU2xOTXYzc3FUbytH?=
 =?utf-8?B?Y2dxTmpZcmN3N3BKNmI2bEFDa2xpQ2g0RW1tV2N1QUhreXI4NVBqWkw0ci81?=
 =?utf-8?B?MXNuR29GcUwxajZ1elNkSlhveW9zdW1YcUhOWFpuSFB4VnZjNnRyeG50VzJP?=
 =?utf-8?B?MEZFZitaWUhyaGFOV3JMN29GMTk2clBGQjQvMEQvTzV3MUlrbzlMeFJHanY1?=
 =?utf-8?B?V0xRcCs2MXRZc25qM0hNUkxwNVI5TUpLY3JwbEVlQ0dILzBGMmUxdUtLNlZx?=
 =?utf-8?B?YUgrYzN3Q24xODZsTjFEVWhCN1JjWUhTdnNKNlgxTjd3U2JBQmx0cU9MTFho?=
 =?utf-8?B?eFRVVXErZ2NLQVR5U1VyaHczcWJmbkwxVWVJQWlmeXczN2NSR3pBZEVFNExT?=
 =?utf-8?B?UjlFRHFDSTZNUVZwYTN5ZHM3TzFaMTZ0dlYyY1lxTzZIT2dhd2V0ZHUyZEVm?=
 =?utf-8?B?Q1dReTFqbzR0WW4rQjY0NFp2RDgwMDZyUmcwaHM3N0hudUNNb3U4SzR2WkM0?=
 =?utf-8?B?T0ZFYkZTQXNyTll0TXhhdytUZlpFT2JJbExJd2VoaXMzTCsxbllRdWVnSEY2?=
 =?utf-8?B?Y2VJcUJtSGY0cHBtYk5udTRiRTNjZGtIOTJmUWtHRCtUQVpnQjVBQ0QrVS8w?=
 =?utf-8?B?QTA4YzZJQmx3OEFwTU92cCsvNDVIYXZRTWJLYzZQOHdqa2VpbW1uZTE2M1Fx?=
 =?utf-8?B?c3VJbUhMaEpaMnFBUFd4UmJvbHh6VWhSaVppUzZGYkhrWVVPNTJ2MkNRZUxp?=
 =?utf-8?B?cm1uTVFsWHZBbnYveW5sc3JHWVd0clVJSDNDWlRMckJlb3lPTXFOQkNISVI2?=
 =?utf-8?B?eU4vSExBbDBxeE1PbWxSaHhkUTBzVUFYWXoyUWtVbkVJalZ4cDRvaDlrZXVF?=
 =?utf-8?B?azFVc1dLZ3UzM1JzemVwZzlYYVhTemxhWlhlUDVHSTcwYWtOU1N5UzI3enBj?=
 =?utf-8?B?YjNlUmNyRENTL2YrWEx3NW9hNkFRVGtGc1JlcEdRNzJ6b29FQXBveXU2M2tu?=
 =?utf-8?B?Vk4yU3doZHhBeVlsV0hheU1ibHpFNVFCRjRTWmRmTUtQclFGUHZSV2lWNlZC?=
 =?utf-8?B?MmkyazB4eHlwVlBidjJpeEh0ZFRtaHg2dGIrcG81TTBGSEFWbWdxdDd6SFBm?=
 =?utf-8?Q?bVbLjFU6LBHO3sPU=3D?=
X-Exchange-RoutingPolicyChecked: CZ/Qkk35n9O/GZHBJ3HNR4uiKO6g8na+kxOAq+NeFW7FTCaGmlQpmCN8+uSJCS1reiwDkluSyc7yXv5BEs15m+lyTH+3Ml3+qKvkfwV5vNgu7oBK+Nh39d8kIZpWcivndeNsimGqnTnMaA84GUqUXv5FoyC/BO7oKyV3vgvaEt//aESTgRJukdbSo1RwQ+uN6C+LQfbMCMSdb+cYrDjdfCCrzk3G3p9RR1DJrCWCqnSPepkQJX9Ky6XHyNIoymx1+KAvRcUa08PtnoSliQvt2l8HlIYI3i1JOvB8JOBKgsPfL1XVepfXdl35rlBLzfrVtEU0p1m8w2g2nUhiL7+Edg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb69f09-d6b0-41a6-85b6-08df41d68d87
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 22:36:26.6013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDnv4sVYx3Xmp1ZMeF1ds/ZGcrjaVwiK14nq5Xh3gxqxjSs1bId0OYb4P6TA+2fdTzJ+Seo05LoKRATgWvf/sH3Gvxu3IWUl0VUouu1UAFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
X-OriginatorOrg: intel.com

On Tue, Nov 10, 2026 at 07:25:02PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential
>issues to consider:
>- [High] drm/xe/oa: context LRI batch fence in xe_oa_load_with_lri() is
>  never drained
>- [High] drm/xe/oa: post-teardown HW programming when
>  xe_oa_stream_drain() times out
>--
>
>commit a42a6ce61696e1b256881421425e340fba9f094d
>Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>drm/xe/oa: Wait for in-flight OA batches before stream HW teardown
>
>This commit records the LRI batch fence in stream->last_fence and adds
>xe_oa_stream_drain() to wait for stream->last_fence before tearing down
>OA hardware state on stream destruction.
>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index 6383a2e036ab0..d2bd9622109af 100644
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
>Can an OA config batch still program the hardware after teardown when
>dma_fence_wait_timeout() times out here?
>
>When xe_oa_emit_oa_config() submits a batch with both an unsignaled input
>sync and an output sync, xe_oa_submit_bb() attaches the input sync as a
>scheduler dependency via xe_sync_entry_add_deps() and returns without
>waiting.  While that input sync remains unsignaled, the job sits in
>q->entity before the scheduler's job_timeout_ms timer starts (or waits
>behind earlier jobs on stream->exec_q).
>
>If the stream is closed before the dependency signals,
>xe_oa_stream_drain() times out after job_timeout_ms + HZ and returns
>without killing the exec queue or canceling the job.  Because the pending
>xe_sched_job holds a reference on job->q and free_oa_config_bo() keeps
>oa_bo->bb->bo alive until stream->last_fence signals, signaling the input
>sync after xe_oa_stream_destroy() completes will still run the batch on
>the hardware after xe_oa_stream_hw_teardown() has restored the OA
>registers, dropped forcewake, and cleared u->exclusive_stream.
>
>>  /*
>>   * Also drops forcewake, which accesses the HW too. On a wedged device this is skipped and
>>   * the forcewake reference leaks, which is fine: the device needs a reset or rebind to
>> @@ -914,6 +938,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>  	/* The poll timer may still be armed if the OA disable was skipped */
>>  	hrtimer_cancel(&stream->poll_check_timer);
>>
>> +	xe_oa_stream_drain(stream);
>>  	if (!xe_wedged(stream->oa->xe))
>>  		xe_oa_stream_hw_teardown(stream);
>
>[Severity: High]
>Does calling xe_oa_stream_drain() before xe_oa_stream_hw_teardown() leave
>the context-restore LRI batch submitted during teardown undrained?
>
>xe_oa_load_with_lri() is only reached via xe_oa_configure_oa_context().
>During xe_oa_enable_metric_set(), the fence it stores in
>stream->last_fence is immediately overwritten by the subsequent
>xe_oa_emit_oa_config() call (or left undrained if xe_oa_emit_oa_config()
>fails and jumps to err_put_k_exec_q).  During teardown,
>xe_oa_stream_hw_teardown() -> xe_oa_disable_metric_set() ->
>xe_oa_configure_oa_context(stream, false) calls xe_oa_load_with_lri() and
>updates stream->last_fence after xe_oa_stream_drain() has already run.
>
>As a result, the LRI batch that clears OACTXCONTROL, OAR_OACONTROL or
>OAC_OACONTROL, and RING_CONTEXT_CONTROL remains in flight on
>stream->exec_q after forcewake is released, the OA buffer is unpinned and
>freed, and the OA unit is released for reuse by a new stream.

The enable time LRI fence being replaced is fine. The LRI batch and the
config batch go to the same exec queue and complete in order, so once
the config batch fence signals, the LRI batch has completed too. Waiting
on the last fence should suffice.

We don't wait for the teardown LRI intentionally. The drain makes sure no OA
batch programs the HW after it was restored. The teardown LRI is part of that
restore and it only clears the OA state of the stream's own context
(OACTXCONTROL, OAR/OAC_OACONTROL and RING_CONTEXT_CONTROL), from within that
context.

A new stream on a different exec queue has its own context state and isn't
affected. On quiesce the LRI isn't submitted at all, since the context goes
away with the device.

The same holds for the xe_oa_stream_init() error path.

Thanks,
Umesh

>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com?part=5
