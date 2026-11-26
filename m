Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795683209;
	b=FPob0tgow6NDYwm9gEZI1AER2YkROkZ3phk8iE8MwPgwpMWhyGd/hw6E10xkId32ashS
	 sHUJcAkz4zAcnQI1nGmYgV3AmhTWzq/V9lq/b+u+owKc848Ipk2T7vNAcu1oHdbTZb8d8
	 uWn6myLPTDzk+P0f2AECAoV07A4DAIkZsMyY5HQwQHOPqzWxssO9+IAJCGoW6+e+Oj5wR
	 YwPctwkx1ezkJQmpfT2zmCjiMV1ER718O8lrXynH8eGaLj78cJKKZxgtGDG9k8ggg9FPh
	 mim++WmZs+h/7JKXiBtD2qQ3Y0VzB1qouUJXE7j1Qjrsw+9k8hb7wnjexTcfGX/jBCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683209;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=xghdiA9hCuD9EbG+hlsCIaPnDbp+TkloR8SDg9rkwBQ=;
	b=BMp5nZM0eLiPGN1BJVxXgZbgy22wd3DboHte2ENeTVT6bKG8KacVniO+/bWqruVZEy83
	 89b7NqC6opGNVIZYWENDRyhUZLAE35EPOXqWm5+Mg1f1NBgh339eBPvnXd1GuWhGZZs6W
	 uYnw9ahWS6rvIwVl0y66gt7EyQer4O3WxUWHXpEHTDSxz/n0G1n+zFysVgJP4iVesFS1u
	 bLy7x+h2APqRu1rZHrPetxgLOS+WfSx13QxDYO8xks9f+TA25TgqQcQfiQbeuPtmWblMn
	 1Z7TBmfHCUNSQCscg78SPmg/4irY8vDIlu+L0tj/rJDj9eEQni3tu9Fzh1ZiZBw5byA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WF5Yuu9w;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=H1cs1sSS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4B7606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 08:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E4B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WF5Yuu9w;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=H1cs1sSS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795683208; x=1827219208;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=uO1o3Bb80+jY0zSMI8UoaDdTDaH9WW58c78uL80avqw=;
  b=WF5Yuu9wF9S9KJ6NNEhhepKhAM+9Xjr3XrGvQyP/H+q55H2qcAazVEtg
   zUzAmDhVkNdyjCiIaZKnPedjKL6wjTAIKZHMQdiwp1RsENCrq+PivYeQH
   FwL+7/lqeJQOvzTaY3ZvHT/r5yKR/MV3zS/iZ2WTFJu09lXZ2flRHwPdz
   CMU9Ayg0a3BsYMxxIEaevBG3eboqzDITbJU5WAVJq8gjVe94BvmqB/O4C
   VU7LDk0H64ITJJfD7nnYDnp7PS9LvfybRfbPpcF/DrSNZTXg7i9utWQ6l
   Uq49zZve37byV6bJ6J+l/HQjfUPLdieHwV7fRQP4qG++bz57WxtZvBlbn
   Q==;
X-CSE-ConnectionGUID: 3R0oENi8TW2kzgjJb8yGDQ==
X-CSE-MsgGUID: n5sMVfFSQ1a4T+iVnb/xyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4494373"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4494373"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 00:50:23 -0800
X-CSE-ConnectionGUID: UMpRgrAYRNCagEhY1xYRqQ==
X-CSE-MsgGUID: vmR69gSJQcyh+N2darj/VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="11990949"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 00:49:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 00:49:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 00:49:57 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 00:49:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkvpVCcS17imYLzeDpEejpmw40keafPJ1OJbnZtNMj74JuPlELFNu7P5DjIj/lci4SnfzvNoI/AbXJsXaXjwAwx6tIgWj1hEaG0T6rCNTUS1LvL+8FdABTxPJ56vWtSPCq5dNhLprjf8aPPZAICVhxRcxsCLd0PH1qwleODwAP8/tcj0WAWjBpeGtPGyI2MqECMsgJb/Vqq6lHj10Nnc9tJAhpYhtc0U/MvWYEj9f0Isst8WO+C3FmaSv6+RpohlwxVbAF9jkk+9AEzzo+r4ldIzvRwwLwya7PyFixIf/CAMzAXN5dwbIS6ZYVdIBPL+bjBNhMNw1zpo2tmKCPLAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xghdiA9hCuD9EbG+hlsCIaPnDbp+TkloR8SDg9rkwBQ=;
 b=BA/uVzRMV92Xi4DlpIQiyjqCk/+zP7B3YXWB75v0s6AYjfx7uHav4zwjtGKrVr8p0Sge4jXvT6FC+sGnZE4tvlYW583XC6ZTneeg8dR6FJ+6WL+wO5g9BQeAqMMQF1yLBeb9LFNyUn0X6kft4PPFL30qZiBM0vLTY6obq0y3nQheZjLacZnAnEfO5x2hPaqP9IT61+jvY25uJwpO6XDZO9fJ3DJp2bMzVlrRAbYK4DXsx/Y0ehQ33QJKtjDbJYip/e8SM0DxexHClD5jW+LhJJEV6dPpMAOm1J9Fa4BZZ9H59Emjr7w9wzEPbUUXBnXL1uBYIuBF9me+UDToRAzKeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xghdiA9hCuD9EbG+hlsCIaPnDbp+TkloR8SDg9rkwBQ=;
 b=H1cs1sSSTTMbu/7MEQvTbc6zGNI3KkY6+BN6/DuV+2ze7USeFSigD1c/Qkt25/jXLDxI+IceFovijTXFSNzdzCyPxxru15MoTjp15J/cYxSW+ozicy7D4+25lGFxBdNcOwX/6XC7GIebmmyvaptOeSB1ScF4gxwz8OfKcMMtN1s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB396485.namprd11.prod.outlook.com (2603:10b6:806:52e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 08:49:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 08:49:50 +0000
Message-ID: <a901fe19-7ad1-4c61-acc3-11a59e4af653@intel.com>
Date: Thu, 26 Nov 2026 14:19:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe/ras: Skip offline queue processing after
 device unplug
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261126083516.1932195-5-riana.tauro@intel.com>
 <20261126083516.1932195-8-riana.tauro@intel.com>
 <sashiko-outbox-235054@kernel.org>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <sashiko-outbox-235054@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0282.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB396485:EE_
X-MS-Office365-Filtering-Correlation-Id: 676f802c-5393-4284-9a7f-08df4b9a3b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|4143699003|261009223027099003|22082099003|18002099003|10067099003|11063799006|5023799004|56012099006|261102123227099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: jfg5jfcPEkcgp4QhcwGh2Ng+w9OQsjWahzA9iRhxIEDDApo/aes0UnQ6Md5jOf3/CkgcCaDL4eDoonKr8locauYJqETW7WF71ycoZjNOtkSRPM71YY2m7hLnPjcANJGoupp8Prhm9/hTPZKKRS4P5PLyA9sXDrv0aJrYt/sFfGOdf8oOPYXY6MiUgbD+0SAicAw7kaIAzZ5A4tC7F8/v8eQY3XAEcUXt7Gz/K5J6luZKVduF1euZ6U5PdAisfft+O5KXSLDMOW0i2x20LNhIY9ZfHo06w+uOTSd21zz0fOv0VOTKhl08ipMcKxR7n634bt2R2PQmDb61HpQYTyt/mOl0wtKoPSiBDmngUbbDm0v7r/eCeVqKRuldiS0WxK8DsF3eMZVsnzJ48iEZ6/rJMBWcMp0lNyD2R13CqUk/XqVIgBWi4nw85K+JzA+Q1/JuuozamGzBAE8PAq86Qy+4CC6pSEXXwq7P2s3KtSCIs7+SIrxyjI90rPi6hWyfdWVpe+EhxqOe6YVTYaeAgvqEQEhPhJIHTvQ2d2zYO5OPIHMfaq81QV51SNASEm7fUoXaksZreeKsnIxm0NH6CnBqUufqvFIco326cd3ixM0m7XP/n7o2I0JW0ix2HLsZ0C7s4jZb3kw1wRqjBz3k+QEuiIDTIOdbF82ookTPxiOWVkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7958.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(4143699003)(261009223027099003)(22082099003)(18002099003)(10067099003)(11063799006)(5023799004)(56012099006)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUc1QW9FNCs0UFZxazM0KytUNFkrd2ZtNWZYdkNwQ29SWkF0a3NFS1F1TEZV?=
 =?utf-8?B?Wm5NTG40N3lpTys5Z3hMWGJFT2ZsQ2RDQ1BBK0duTysrdW1USEF1T2hGM0xD?=
 =?utf-8?B?Yk5lUDFKTzdXZkJ1WGpGMHU3a1FFeHVneXNJZ3IzaFk3c1ZkWWpDOEVaenJV?=
 =?utf-8?B?Z1RIYXY1T2FkdThYSGFsMU96OE1lOXE4ekx3NW9FSkdZcEw5bit0cit6UTdM?=
 =?utf-8?B?Z3ZHNkNaS3UzMWVVSHAxeHZrRHZRMlRqajlnV2VDNy92L1BCNzFaZWhHaEhX?=
 =?utf-8?B?dVNRczNoTnRWckY5NDRJVHQ1MHlwOW8rOWw0YzFLKzhvTjNLcStOZWFEOXJL?=
 =?utf-8?B?MHVFNHVEdWZyeGp4VUlCa3h2cGNxSnhmbEh1VXhvRnVSTi9KSnNDRGhtUDJ6?=
 =?utf-8?B?MWlRQ1NGZFBzQndOSHZnblNtcER5MzUvc3p4QkxOTHo1UExRTzduN1lvSmNI?=
 =?utf-8?B?OEN2WGlURXVMajkzUk5ONlNBVnJGUWpscm5jdzNBZlVhK09CQkZ0L252VXlL?=
 =?utf-8?B?cTdpc20vZHlGSGZjYWxUcGlvVDF1VXdZVUVQaW8ycndvM3YvT05oVHd3aUJU?=
 =?utf-8?B?V0JrQkFsK08wOUFYZHdvTkF0S3lXdERZSHd5VFdqV25HNm1HSmJacGdmeHhO?=
 =?utf-8?B?RjVmbkV0eU5RZkQ3K2FxYmV6allkbHlzZTFhU1JkaEkyVHVhNnF6Q3NpT3J5?=
 =?utf-8?B?QW5LR2NLa3I5Z2JKRS9KMUVIQWszZ0cvRC8yNmRBVmltb2xXK3lnY2tlWTV3?=
 =?utf-8?B?MGN1N3JKODUzbFMvaHluMWsvRENqZHVaL2lzT0lZOWNrMWptSHNTbkNMNFdL?=
 =?utf-8?B?cnhkK1VwZEYrSTcxNUtlanh6OHg3ajVCVmZSZW9IY2tqNHdBYWRUaTg0MGl3?=
 =?utf-8?B?bklrZjA2MmhFd2xsaGhreVJ0cFl2WS8zNk83aGNNTHFvYnZkbUR4Wk5NcXZ2?=
 =?utf-8?B?ZExaK2o2SGRxYXRRWU1FZjBJR3BONkE0OVZoekNicWNzb3crczd1Vzkxck5u?=
 =?utf-8?B?ZHhNUW1TZVY1b3orS1FPZEQyV2lBYnlzckV1RnhiREtXNUtnaUFUZ3d3Tzdo?=
 =?utf-8?B?SFBKSmZNaTZ3a2g4aTRyclFOU0YvdEZqNWZEUUVTbmMrU2U1cWVmN2NtbkJO?=
 =?utf-8?B?VDVkRmlGNk14U25Cc1p0ZGs0K3ZZMmVkNTVUVzQybHdPV3pKR0dJNzVLQ1Qv?=
 =?utf-8?B?cGFtS2NyY2t0aWVjVzlIM2VFdERRSUlQc2VnanRpenBNb1dUUzdFR09Uc3dl?=
 =?utf-8?B?V3ZwUWg4TjJXSXhFM2hvTkhSYk9zNDlkTVRSdk5KUzJDelNtdzR3RTVjZXBs?=
 =?utf-8?B?SVBkdVJMbXdraHJRTVNNc0ZIVEVFak5NeTFnZFNVT09JMWYxRVYzd29JWjJ2?=
 =?utf-8?B?ODdmNDFSNEVDZG1Gbkdxd0pSWlJyN0FBd0JHWkpYcktRYnV2SkNzYWd0M29C?=
 =?utf-8?B?K21oL0pxU0F2RFBPV2tvVEl4NG9tUkRzcjdEemtiNFlmSUluclRwT2VDSjEy?=
 =?utf-8?B?NjRObEpVQ0FtUlJ3NXdmVWJVcThGSU9Vc0d6MEZQU3o0SHk0VEppcWJVZEdi?=
 =?utf-8?B?bStRQ0tES0hOMm9oRlJPWlBhdU1iandsL09CVkszYUVmSlQwSmNsZXZ1bTBj?=
 =?utf-8?B?RFAwbjErcDVJWllvUGdYNHBBWlFRaFpaOUdSM0g1SW9BVmVDbFRpcWp1YmRw?=
 =?utf-8?B?SlZaaXoyMm15TkxDaG1vaVkrZ3dnTlRWUVZtWjBMZmZ2dGRBdmdXWE5RcVlj?=
 =?utf-8?B?REZCYVZPUTBZMzZwVmNvRVVDQUV5N25iMFNMbGswZFVGSEo1NlNvL2k4VDFM?=
 =?utf-8?B?Y29XdFl6ZzBrWmgzSXBzWTRzRVhmZE5TOE44N2dCaWkwL1VMbk5BbmNlaEVx?=
 =?utf-8?B?b2VmRVIwRzRMUGNHZTZHUTVLdDc2VmVCQXVqVkFFQlc4TXhDdUdKY05XT1pX?=
 =?utf-8?B?ODAzZnR1NEVHT2FxL3FKbEU3cnVDOXh0NkpreHpXb2I0Qi96R2ZJQ0p3ekl3?=
 =?utf-8?B?em9DWWJ3WVZOc1BXYTRjWGR2NDdVTUpxcng4cURnVXh3U0FLM3E5QWdOZ1NC?=
 =?utf-8?B?Q0ZORlE1OWlrM2RmOUhuVXFFNmx0T0R3M0Q0eTZ2MmExdit2L0JZUGxFVGhq?=
 =?utf-8?B?WXpISHhpc0krUGcxai9ZWHRJekk5ZWJUU3QvTVJDNmNyTHNDNHZkR29kMzhn?=
 =?utf-8?B?dU80S3lXcXU1V3hJRkc4LzVsT2JtaVlkNFlxVEpqYklBY1NDeFVNQWd6NFhH?=
 =?utf-8?B?UFVicXNMR1lvQ1hnelNjeWJEQnpTM2hsanlaUW5FVmpHY04yM1hhdGduWjhh?=
 =?utf-8?B?aVFRZHI5RVd4QzcyMGw3bGIyUTV2SXdQeGlRTU15ejY4Z3FMN21xUT09?=
X-Exchange-RoutingPolicyChecked: bYiGiGvoyhAd76Mq3d8zn3kCvfq/pIQl+aFBddyvbr8sjQnrGZPChReUiAF2I5RsRd3xwZduOT83FTqJL2ZHPkZnlBnuw8+9goR5wUbHjLqVhXSOj87Tekh7E8FQ5q3OSyF7hEQohkxI+PxH3mZh0dhX5Acsp95nBj2GB577oJdp6YmGdAKyjuOgbh0IeBLfqQ7mkdstSfZaU8IhP3tmrtPTZJHqaRKvCOTlu/IfKBU290y6knboI/v+kt0HvIemt/HgOTXO9iTtremYRLQbjP23Fh790e9HxgALPV4YKEdnF33I3nB1my9vgAmy2Zq5lHVuSn7vxEvzt3Auz7GMDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 676f802c-5393-4284-9a7f-08df4b9a3b81
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 08:49:50.8614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mU05tx/ydFwuxfrEXA43maq147b3NkYx/5tQCRjIfmtDxDnNR0VZg43PGjZuGBlA8mOCyMDiVQNdVFbr8Kf2kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB396485
X-OriginatorOrg: intel.com


On 26-11-2026 14:16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/xe/ras: race with ras_fini() in
>    xe_ras_get_offline_queue() on probe error
> --
>
> commit 34b9c8950fa648b356e8d2444006f4d6fdb7ac18
> Author: Riana Tauro <riana.tauro@intel.com>
>
> drm/xe/ras: Skip offline queue processing after device unplug
>
> This commit wraps xe_ras_get_offline_queue() in drm_dev_enter() and
> drm_dev_exit() to prevent the system controller worker from accessing the
> offlined pages XArray after ras_fini() runs on device unplug.
>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index e080cbebbdbeb..89c2385eabf7c 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
> [ ... ]
>> @@ -486,9 +488,16 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
>>   void xe_ras_get_offline_queue(struct xe_device *xe)
>>   {
>>   	struct xe_ras_offline_common response = {0};
>> +	int idx;
>> +
>> +	/* Unplug waits for this section, so nothing runs after ras_fini() */
>> +	if (!drm_dev_enter(&xe->drm, &idx))
>> +		return;
>>   
>>   	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0, &response,
>>   			      sizeof(response), &response, true);
>> +
>> +	drm_dev_exit(idx);
>>   }
> [Severity: Medium]
> Can xe_ras_get_offline_queue() still race with ras_fini() and use
> xe->ras.state.lock and xe->ras.state.offlined_pages after they are
> destroyed when xe_device_probe() fails?
>
> In xe_device_probe(), xe_sysctrl_init() and xe_ras_init() register their
> devm teardown actions in that order, and then xe_irq_install() enables
> interrupts (including SYSCTRL_IRQ, which schedules xe->sc.work) before the
> remaining fallible probe steps such as xe_gt_init().  If any of those
> later steps fails, xe_device_probe() unwinds without calling
> drm_dev_unplug() (even the err_unregister_display path only calls
> drm_dev_unregister()), so xe->drm.unplugged remains false when devres
> releases resources in reverse order:
>
> CPU0 (probe error unwind)         CPU1 (kworker)
> devres_release_all()
>    ras_fini()
>      xa_destroy(&state->offlined_pages)
>    devm_mutex_release(&state->lock)
>                                    xe_sysctrl_work()
>                                      ...
>                                        xe_ras_get_offline_queue()
>                                          drm_dev_enter() -> true
>                                          process_offline_pages()
>                                            handle_page_offline()
>                                              mutex_lock(&state->lock)
>                                              xa_store(&state->offlined_pages)
>                                                <-- use-after-destroy

This can be fixed with a different patch by unplugging drm_dev during
such probe failure. This is applicable for all scenarios and a very 
corner case
and can be taken as a separate  patch

Riana

>    sysctrl_fini()
>      disable_work_sync(&sc->work)
>
