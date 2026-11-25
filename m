Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795613208;
	b=MudDNioTfkQjIMMGw2zc6RJEIfolhJqTnjDVQsCYXbv3pt1DCl2q0TsISI/G+84gSocy
	 P0L0bdaVt7EL+P5Img9v5zlheYb1HcdKyjGxqdKiLlMuJHZIumXjiAWLkWsDRuLvDWrPk
	 sBXvDrErev3DGB1fCVO1e1VNw0vYIexyf1hZfpyIw5svDLsmQT0KEYpCzzuYn4hmZzGlA
	 AHx3sj0Ws20N0oo5AwXi2hf+N5Y8SLyTH6SJY0CWhm1KVXhE2aX7PyVTbioPYy/b6T/Bm
	 l/XPrypFT8soWJt3xGLoMKCFhGaotrmltGlzgDtjNhltrLMQ++CuMf7cbu5UgBMBkpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613208;
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
	bh=z6nt/JWOxVyxEfgZItlYeIJTEliv6vRTPcw1fkXkzok=;
	b=HQY/4BsCtSC3BN6p/1xSJLcLMnw1Or1GTmnX5JhqJSyjbDPDCvWGgzKS0YvJQtDSXYQw
	 sVIowKeA6GW7Tc2LpyWDmXxY6P66+qxlXXkFiEPR72erafAJAgpFrNYl/Y7iqEpUQfYwA
	 QJ3UnHHl96BJsutMAZf3Mm4njiqksRAEyWLs25x46DPvhSOSKCCKmQ7GWLiWl8NbUwbX/
	 6igzLGVqNag1ZP8CAhiPOTHGHJ8v3r/9muMKBOqZTtYDd+0Vl35z6lf3r7EPUN0ZfNWQt
	 BVDgn5t0FcPCihAZ7IGR1KmsT+lkDVgKbxwlG+u7xhQet/TdypvnvNyU1QO8gAwPZfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ClcaVz9N;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=iDHxUoPS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9AE606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 13:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D9AE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ClcaVz9N;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=iDHxUoPS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795613208; x=1827149208;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cp4pzf+9t1Z6dHqa2fy8SB9koQkxZmqLEvEaBj8pF7U=;
  b=ClcaVz9Na/PKJa8LWIPfjuTjCLrEZt2rqEzwvK17gp+JP2nYhCXqUGfZ
   vCujSpqtscUbwel5NlIKlRvLpVz95jn/c/lIS42OVg1G2YlLJql3zMHzw
   6VmH0Z6Jm0ImNe8szpnQaznA1/8OUDqSZp8HRGNZaTHAbnTe71u64KAuA
   /Arw5FreExhWF4e9k4ItMwlFFURlGjS9fn68pA+nMxbPD9h3+ooqjlfNm
   juq9ao3wIj0/a0zhSG8luzWlhRSlZ+nbYJvTGe10GP8blt+JaqaqWMxnt
   5z76R3+UJ4b2MDqn5iFKVU36Dk/EBCssOGWNCsiaurefFRhv2YDBxaQQO
   Q==;
X-CSE-ConnectionGUID: R/koc08FQlyE8F0R0W0zzA==
X-CSE-MsgGUID: n639TXJ8Rk2M2WQlwp2RMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4496376"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4496376"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:26:47 -0800
X-CSE-ConnectionGUID: Kz+t8XGdRE6ZxKnpRwHASw==
X-CSE-MsgGUID: piiJzrb5SJmWkWnwjuwmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12092512"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:26:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 05:26:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 05:26:46 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 05:26:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhHKWz4VLWaojo2HBNu6KAwW19V541GIJsQ6wli00VWlxkTszrErFJY7D+kdSCyHgizGHogOsH0wOl5bIWATWReZFLHkoiCdRRrWJKf0eHyvBXpV0Y9K06MZtTkuCxQYYUzMKvhzKlv4vt4HWUAYTiJkPIjSxDt5BfI8W/z6ro1sZG+m3uLSFE+r70GdRf9tcYYKzPZP09Zb2UnkDWtZe3P3pXOUSRMPLn5jisnzBgPcfyeR8ezbq0YnX9ODim2zACH/9QGTI991VBWh4xbUIa7XrJq+Z4wu7U8+3WtmunBe5GpKNWgjR2InpuedUSIxuYaijtbcH6mWCUseZSF3FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6nt/JWOxVyxEfgZItlYeIJTEliv6vRTPcw1fkXkzok=;
 b=JboDv2eoX3mF9Ayfbi0xhX6snWzzciZTI3G4cF2bjrqKq1/pB3VIoKv3Ylzp9AaRrjSkqlg42KaYGa28M92GuwAFPZXG1fsQIy191z9+QL6WMQoRbiPV/x9aF4BCSs8n4w9r8fnWIgwEkIHyPYXag/ng9U9cXZS+47RixZ6QsG9c6SuMs0Ms9cKAdJabEEsLnWSMYYfyXd46sifVzC0DEdkh4AL2RWO8kMU5yn+d/6KAqOnS/ZstZdOLusi0pZQbkT5y3l9ftT3lYfGnf1Xu7UIWEzCVC5cBvrtixtttBlZ01cm/inqjTGPJgnis4DHn73L/2VDssvryR5/5OhggGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6nt/JWOxVyxEfgZItlYeIJTEliv6vRTPcw1fkXkzok=;
 b=iDHxUoPS/p4nr5XqYvYF1vN2rJZZPeEmPSKkOvXcdzxVfGuRFJqtMlGC1Q4opCel2Ghf3A+vvi8r7JVcLBbejeGCCl2e0VDss7yyp1iNWfSCpfn2c/iayq9nk9z/H95kdHM5a9Do9TMG+Ke5ZaQEwOlnoilhWcWHqh1FKPdgZdE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by SA1PR11MB8491.namprd11.prod.outlook.com
 (2603:10b6:806:3ac::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 13:26:43 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 13:26:42 +0000
Message-ID: <21a91083-5d45-4ee2-8f22-71590c1ec6c2@intel.com>
Date: Wed, 25 Nov 2026 18:56:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] drm/xe/hwmon: Expose pwm[1-3]_enable
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-6-karthik.poosa@intel.com>
 <sashiko-outbox-230572@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-230572@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0285.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::8) To FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23)
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
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: bd890faa-28b3-44f8-effc-08df4af7be9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|4143699003|56012099006|11063799006|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|18092099006|6133799003;
X-Microsoft-Antispam-Message-Info: bDRFLZp3rG3oBJImZVvVNxkyGKwvw1ZQ4FWnX3WOD58v9ipr2qe7WDw0BE856ZKSiD3oN6IHaJjc1fNq2m9VCRYi3dGBZ3pyYdVSK9pA9SHh1RnGOBh60kpGT5py75lk4fE3CSlKhBYpMXQIwz5seAMfzJed/ONhy1fV8zDAf82JOzqZ7I9yTJ1PQuuf5RYu83OSaJZhuavjvVUo89nq9RdkUZkkzlzEwu2fnj+OIamrhu1m8d3tPRgbw7Q4VcA+YT488upTlI6Q0+XqwGHMVP4+Fq2DWJIHdsqRUY1e6Pqxl6wUbFX/dD6P+a3gAqFjZZ1JWx3ojhAKH49vVmukJ4tKLwd5tPyKDUgaECIfBf/oS+dyF53og/hMfKr7ieyVb89tOMyaVkSdigPmzF7thtHGfUWMUyE3CbME2L8QEL+pgsnT0G9D1b6u91QyGjKrmThUlRlPkKjrTCaMdPOu20INLb8hpqF92FCWs6vcdZSxpNcunJdZK6wgMKTVuVJqqk8w/22fUFs8I04W5Ph4z2ny1ULjAVKVNz9ks38hcdMfJwHgDY/Bzg4lXqtPU/gdeQtA15/WtfjO/tkpgyxLUpbM91c+slVvoRUueF70YsFqfAu12/Sg6P+xSlZhNaD9majZcgQOmb641z9A8n2K9jdHe9U+IqySs6rDxIuSq8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FT1PR11MB960200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(18092099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V28zcVhNSHJGMlRmL1RyRXk5VzJCK0hJTGpYVWlrMFJjSm1WZGxCd2xXbnBN?=
 =?utf-8?B?cHR3dGV5bldXcStvRmdndzdLeFlrQVdSMDdwbDV5a1hSVGc2Qi9hM3lsNmxh?=
 =?utf-8?B?bUQ3WmNNVWpybmhBYmwwWURHM1huSDRjTGp3RmlCUk9kTTEyNEhnN2NJRjNE?=
 =?utf-8?B?RTdHeGRhMDdXZFpMUW9VMGNkWk9aUXRYTUJZa3d6YVRLZUFKREJmdVA5Nkc3?=
 =?utf-8?B?d1N2WjkvVWlLdEtobDNrKzFNNVhkZ2JEcGJsd0lQNzVKcUZwUVJReW4xYm5W?=
 =?utf-8?B?YWJVbHNRbHgzc25YMGVGcUJEUGJTd29rV0x3MnJqeUxrMC8vOHgrMnU1bW9m?=
 =?utf-8?B?SnZWS3BXSnNqWDY0QzlPUXVQWXo3TndWdTVXMXVtSFltOFZrQTBGcGFCdndQ?=
 =?utf-8?B?UTRRa2syQWpuYW9YTk1zaXpGaWNRTGZPVGdaaVNNbi9MK254YndpZGFJVTVR?=
 =?utf-8?B?RExFMWhhdW8vUksxRTVXcGEyS3RJdnZjYzRiek95V2VzRU5zSmFhenBpNVRX?=
 =?utf-8?B?VFl5OUtmT3RuS3ozMWkrQmVKNlBpZmIzaFBBQkdDaDRuYUwvaENlSVBjWUE0?=
 =?utf-8?B?bkw5cFEvR1RTRHN4dCtQR3BZZzNrUFVEYXljNWdaNzFteERvWXlxZEc4djBF?=
 =?utf-8?B?TGxGWVNOc1hmWC8wb0Iyb1Q0ZWRGRVNSZjJsL3FiOTlJUER3RWRjQ0V4eHFO?=
 =?utf-8?B?S0hWZ3Iyc0UxMGVGQmtOb21XeWRZSUxLK3VudjBMZTJ1a1dFNlNQREhrL3Mz?=
 =?utf-8?B?UUJqNHdmazZWbUI2U0pTMk9UZE5LbkFDMHAxZXR6cmdjMWpuYTRoQXpjeUsz?=
 =?utf-8?B?THV4ampFSXhxQ2V4NmYvOHpCMzVvcWhsLzQ0YnJud2wrMUV4NW5TU3lZQVNE?=
 =?utf-8?B?dUNyNkp2S2NBR2t5TUVSYWsyUFhVZkpxNWNLZ0JzUE03alN0WnV6RGxYNENp?=
 =?utf-8?B?b00zOWMyVGxZM1RoT2lzV2pzNWdjaVR4c0RycE9ZMnFLU0gxYkRRL21NVEZh?=
 =?utf-8?B?Ymw0dXlQOHlKSmZZZlpMK1J6RS9zbUM0RVRvRTdKbSs0RG1IaDdQODJ0OUk4?=
 =?utf-8?B?OGdVbXRoNFBkNkIzREVmU1prcHFvN0U5SEVFVy9nMGN6LzdqMUw1MVlxT29u?=
 =?utf-8?B?R3hQUXlORFkwRWw1Tmx0aFhCY3dacFovSTZxbFBQYXdRT0QybllKNXE3Rm1U?=
 =?utf-8?B?VjU3NkdTNEFlcTJkL3B0Zlo1UnE3bUJwSnlCMXJEck9hYnlxdUNPcm5Lcmg5?=
 =?utf-8?B?cTY5RXFncmZRSXNHd2hNRGJZcHM1a1lVZWQxUy8ybmxmMkJhQTA4MEh5Z0NO?=
 =?utf-8?B?V25DeTM3WmVhaFJwb2JBalRGRUpFMGNQd2JGNElZTmtCVlc2b2l1SUp1MDI4?=
 =?utf-8?B?dGtiK1RCbVJXMUFkclRkaEZWRHJPVkF3RmhlSi9mNXVFYnFOTUlIRVhRdnI4?=
 =?utf-8?B?aUZraWRvcFUzRFlwVkFoOEdXNFZWcFo3dzUzSEFNN1ZjVU5Lc3BTU0dNUHJR?=
 =?utf-8?B?eDU0S3BzTHc1Q20ybjRVL2hway9FaWUzL3psWjloTlcwSWgyWUEzYVpHZmdN?=
 =?utf-8?B?YVpaVjhnZGo4Vmlsa2lzYWlQdEZMcERrdmZRMGpkVWJJbldqSW9WSFZ2TGw1?=
 =?utf-8?B?OW9TNktLd1JYcWR1Vzkxcy9WQlRxa2RiaThnRVREdEh4Q3lUdTVEdEpXcW52?=
 =?utf-8?B?Snd0OEc5dklrbzlvQ1gzcmdmcURLTTdPb2NBZmZvYU03VXNtOHFsRGVIOWxl?=
 =?utf-8?B?YlVQdzBZTk9sYkJZakNqOHIxek9panI4bUlFMlF6b1FkdFFkTkI4K1RzanlO?=
 =?utf-8?B?MjVDNFVhdStQaDRsWk1Mc1BPWkFrSEQ3K1ZJUDU1VmxNSWNQNHRQWEQ4MG5r?=
 =?utf-8?B?ZVNhS29vaEVXNWlBTlZvckh1bGRCZ1VabDJFMHBRaGY0YTA2SzBaRlhFeWZK?=
 =?utf-8?B?V3dsaHF1T2FKL2VuK3g3LzNiYk9zdnlWNlg1dVQycnQ2eloyNEZEZ21qeGY4?=
 =?utf-8?B?eGd0QWFmYkFHakNKc3dpVDhtdGRUZkVLcWlrSmJEZHhWZXAxYU85VldKYTlK?=
 =?utf-8?B?M2tBRStGSHc0eFlyZ3ltU3FONWt0a3k2MVRMdGNCTjdFNnNIWlp0QTVMOWwz?=
 =?utf-8?B?cW9jOFF2S2dOWFU1dy83NVBYbHdBOTlZaUFWR0J3NXR5Q0lucWd5UGt2TnJy?=
 =?utf-8?B?R04ydWQzTVpkZloyUlY0akhjSmsvKytMaXArNFZqeUhLMkgzMGJvSG9YSGNJ?=
 =?utf-8?B?bGx0TlErOUt1RXZWemRscEFHUjNMN1VGN2lDbnZFVktJNUFyODh3T3N2dm56?=
 =?utf-8?B?eGhPbnUzYzd1UVdGRjVoRDE0YVY0WWVOUk5vRC9sM1ZFOGNOWkVBQT09?=
X-Exchange-RoutingPolicyChecked: GbT5LC2rITTIQtUqyqhwOUHfTa3Rw4LJ0l7vqDDq/eM7WjJYZ3/R0Q/m6Wh5CTZ8pV8uS8QySaeVIBmLq7UeD/Z+x9GnmReBa4fOocsdgibaBQtMuDdABxzhWw4/8NqYYrYh/4e7ySUL6/ZaW4aIb76gHqYfcvy42ZWITOOsv6292AR24L7ZuteMaozA3jNoyoMGlZNDD+RKOtf1SyoPqTR9Z+I3HHK+vm6Z/quZcQLf3S5PQWXuspXtbVg6gTQjLoXWfw0owLxbY+F49yB7VslG0ax4nrK7ybgeCFV3NUdeBOzJAE05u0MYURV5lOUSn0Ui/8i8c2f/8bVJdK6uqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd890faa-28b3-44f8-effc-08df4af7be9c
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:26:42.6182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZD4/JnmxvC0bcix1F7bSM/rx50/dqRgFRFh29FCnhJ4C1jPr50Y2FcTw0vA3CCOJPzLG8pkXM6V5z9PyfqEY+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
X-OriginatorOrg: intel.com


On 24-11-2026 11:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] drm/xe/hwmon: mode 0 sets manual mode in
>    xe_hwmon_set_user_fan_pwm()
> - [Medium] drm/xe/hwmon: xe_hwmon_set_user_fan_pwm() clobbers user table
>    in mode 0
> - [Medium] drm/xe/hwmon: uninitialized pwm_enable_mode on stock table
>    read failure
> --
>
> commit 2c87d5a2e63abba6144fe6efb9070eacc54a6cbc
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Expose pwm[1-3]_enable
>
> This commit exposes the pwm[1-3]_enable sysfs attributes to select between
> full-speed mode (0), manual user-table control (1), and firmware stock-table
> control (2).
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index c053d597f26c5..59a8521316c2c 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>
>> @@ -1190,10 +1208,80 @@ static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
>>   /* Temperature to set when setting the fan PWM with pwmN. */
>>   #define FIXED_PWM_TEMP	1
>>   
>> -static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>> +static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm, bool full_speed)
>>   {
>>   	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>>   	struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
>> @@ -1201,6 +1289,11 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>>   	u8 speed;
>>   	int ret, i;
>>   
>> +	if (!full_speed && fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
>> +		xe_dbg(hwmon->xe, "fan %d manual mode is not active, cannot set pwm\n", fan);
>> +		return -EINVAL;
>> +	}
> [ ... ]
>
>> @@ -1245,6 +1338,8 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>>   	}
>>   	fi->fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
>>   
>> +	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
>> +	fi->is_full_speed = full_speed;
>>   	return 0;
>>   }
> [Severity: Medium]
> When full_speed is true (writing 0 to pwm[1-3]_enable), should
> xe_hwmon_set_user_fan_pwm() set fi->pwm_enable_mode to
> XE_FAN_PWM_FULL_SPEED instead of XE_FAN_PWM_MANUAL_USER_TABLE?
yes it should be XE_FAN_PWM_FULL_SPEED
>
> Because fi->pwm_enable_mode is set to XE_FAN_PWM_MANUAL_USER_TABLE (1),
> reading pwm[1-3]_enable in this commit returns 1 right after writing 0
> (until later commit "drm/xe/hwmon: Enable fan curve control support" checks
> fi->is_full_speed in xe_hwmon_pwm_read()).  In addition, subsequent writes
> to pwm[1-3] while in mode 0 pass the fi->pwm_enable_mode !=
> XE_FAN_PWM_MANUAL_USER_TABLE check above and drop the fan out of full-speed
> mode instead of failing with -EINVAL as documented in the ABI.
This shall be fixed in next revision
>> @@ -1320,6 +1415,9 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>>   		if (!fi->fan_table[STOCK_FAN_TABLE].point_count)
>>   			continue;
>>   
>> +		/* Set PWM enable mode to automatic i.e stock table in use. */
>> +		fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
>> +
> [Severity: Medium]
> If reading the stock fan table fails or returns 0 points in
> xe_hwmon_read_fan_control_info(), does the early continue leave
> fi->pwm_enable_mode zero-initialized to XE_FAN_PWM_FULL_SPEED (0)?
pwmX_enable will not be exposed with stock table passes
>
> Because xe_hwmon_pwm_is_visible() only checks has_fan_control and
> IS_FAN_ENABLED(), pwm[1-3]_enable is still exposed and reports mode 0
> (full speed) even though the fan is under default firmware control, while
> later commit "drm/xe/hwmon: Update fan info after late binding" only
> initializes fi->pwm_enable_mode for newly enabled fan bits.
>
> [ ... ]

pwm1_enable can be expose when stock point count is valid

.

>> @@ -1984,7 +2090,53 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>>   			ret = -EINVAL;
>>   			break;
>>   		}
>> -		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
>> +		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val, false);
>> +		break;
>> +	case hwmon_pwm_enable:
>> +		if (val == XE_FAN_PWM_FULL_SPEED) {
>> +			ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, U8_MAX, true);
>> +			if (ret) {
>> +				xe_warn(hwmon->xe,
>> +					"full speed enable for fan %d failed, ret=%d\n",
>> +					channel, ret);
>> +				break;
>> +			}
>> +		} else if (val == XE_FAN_PWM_MANUAL_USER_TABLE) {
>> +			enum fan_table_type source = fi->fan_table[USER_FAN_TABLE].point_count ?
>> +				USER_FAN_TABLE : STOCK_FAN_TABLE;
>> +
>> +			/*
>> +			 * Manual fan speed control using user fan table.
>> +			 * If user fan table is not programmed, it would be initialized with
>> +			 * clamped stock points which allows manual control with some
>> +			 * default points.
>> +			 */
>> +			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, false, source);
> [Severity: Medium]
> Does enabling XE_FAN_PWM_FULL_SPEED via xe_hwmon_set_user_fan_pwm() clobber
> fi->fan_table[USER_FAN_TABLE] with a 2-point 100% table?
Yes
>
> When the user later writes 1 (XE_FAN_PWM_MANUAL_USER_TABLE) to
> pwm[1-3]_enable, fi->fan_table[USER_FAN_TABLE].point_count is non-zero
> (MIN_FAN_CONTROL_POINTS from mode 0), so xe_hwmon_pwm_write() selects
> USER_FAN_TABLE and keeps the 2-point 100% full-speed table active instead
> of initializing from STOCK_FAN_TABLE or restoring a prior user table.

user is expected set the fan curve points, after setting to user mode 
from full speed.

>
