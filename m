Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448156;
	b=d89Lh7201CQ9mwWriBwuA/5XnhRWz6hAB36QZS+ifnWEjcEmlASo/kOA67y/446RY8MA
	 BWBVzMPz4xrmh4DU6Pod/WEzH4J5ryBUOBKqqwZBhEL6FEtZ3aRL3uxdhemJobcQP7nsv
	 t2zv/9AvmjSCzVX7oYikLNEoxhiN1ls4PXjNQk5x6B3140tTeUTcb8jNJV2hpwGpzKJXE
	 rrZBUcO2BuT382TNPff3IAPF4FQXDywXsjz+SiDst2gsxycdTfv0bYT6Td9akgJ2OaH4D
	 7i4nFhMnA0nAwfDqSaxYMDgF8E3aQge8wKUloYR96U871CBbOjTyv0iYUs1D583M/cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448156;
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
	bh=PVo9QxXwpXGQgwoJG5sqEu608GTykwosOY654wWMU84=;
	b=XTNaWdLwfQ4pxVhf9HtXbbQn8fg2BINc1kuVyy6W+hS3am9KIWGIU2XEMPhLxsrErb7Q
	 FMm+6rWoypdQ/5hnzVk+nCCI7Vn9Es/qN23FnKozkGDQQTc/0DyzwuGype+9ZOiiID7Gy
	 LtNYpHCwuUPxaBsmK73b0T0m9m6hqMtWwCU+3XTKw6cxIE3vEzeP2vUB+87pX6V+znvn/
	 CI0wg9YrWUIYBO9ZPTNhbMVEr0LhzzHItTyiTgN5+sVb0P27dvI9P09cji6XwJkYTm2/l
	 t9xwmo1HLStvY9gotp8+0T7NuKGDW9Dc1X/p6MTsAdDFP9pld/pwtnmdzZwnorN8vtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aSC9xKmB;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Hko4ZoAq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFFC606A327
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 15:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAFFC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aSC9xKmB;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Hko4ZoAq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795448156; x=1826984156;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=q2uQ5TVNElNdKD2x8rOeRCrN0fYfsNr4M5CzvJu0KTs=;
  b=aSC9xKmBPkft2ov5r2BY5hp8RYUQ2LGCgTmRhB+PWCP+qPz+3wU0zq3s
   For0HNQk6HtHH9zie/m9JDn+3ysqRD144ksAs/r7GGu36w9CMj0iW6EWT
   cQdJlLmaIJOrR/SD5h5f6961c1WeulqVCfEsJ0BfJwJJ7noFStoV3jCQy
   ewEoddeVVF8wK2m+ObAWoyFbKowUDlbs+haUnk1qcgeSIdnEwwDve8hFc
   4GRnREE1MTfKh7xsV5QvJmYG7dCRwFbYlc9pXLVnLTNztp8JgOlo45lYC
   iMB6vxxPOLVmSYRCAAFcmcsf8K/Q2AFQzZn/BHnz3iOkhqSycMF3zphM3
   w==;
X-CSE-ConnectionGUID: OhD+zFP1TqGEIudm/KU0Jg==
X-CSE-MsgGUID: MxXQFViVQn2/fmj5bHsmdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4302057"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4302057"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 07:35:55 -0800
X-CSE-ConnectionGUID: fX3jB8GSTPS1TLnfX8inTA==
X-CSE-MsgGUID: 59CEnixhQAuAoS3EdcgLaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11642802"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 07:35:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 07:35:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 07:35:54 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 07:35:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lX4Sc97IASa1qeQtTc3KsxJ/17Ll5CTbxxmr8vozE7Yt7fNXHbINFys0WOKF7tvmlmBNNcgCqfyM0mpw4pyRRQH6bPoSfXLUzyh8g8q4plU27pyc/m/irqzYcre10/N4FYD7BX02tvvsFVmRXdxRplp/ixZXeprIWVdsjQ/xABMk0smZlPQMYwy9YjDF8WO0YqAQo9MoKJH353TTCSESBInRM9sH5MJxp6Vk/ubv7PnpPDNIxwfY2vUVoUGvp924+DT4Qwl9tE8fLW+CuSysu9AxYHVKAB+U4DyF+hh/V/AHd8o0fd0aZej/kzW1k0NkSXfmK+OOCslv2E2hSzwawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVo9QxXwpXGQgwoJG5sqEu608GTykwosOY654wWMU84=;
 b=X6PmpOuO3ygGdKiRNP5KX2AI+ARsnjmaF0pyxqq28pf6Wql6EHDtuUPH6K38KhL0YGpFXlU5zGBuuVZpTydjq0O7VxVfcW+IldxLDXgo67Xxb4KkCHjfMBneJyXrGCwHEsp6yNdtXTDxFmFiXrmjKa9lToIgrhjKpGCIb9alawNbQM9FkoZ1+z4TAPYPl46gtODWDqFePPbKFcdc2XbY8P/ZDnZ/KTTrztp79JjobJkQo1ShPvkRC22NYmNj1615jLAZmNjIwUeH57jrC5xp5pe/J/b5AzD+xU5ZzF/6e0TL7z0ZZ9FjtCOG2ur+MICTmtkOz0B8OYYf6B7eKh/PYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVo9QxXwpXGQgwoJG5sqEu608GTykwosOY654wWMU84=;
 b=Hko4ZoAqdmygyqbfMhjJ6LgZfrA1x/c65pv7JMAX0Jdm0k+fupkgaKho3uQmqlacZJHbdSqyftm1ZjxeTO3uY0PTxzN+88/aeSQH9QrVcOoaENKWVQoVKGh0YkhRqYDBhA7UlNu2x6syWB98Q7Mgot7UmQYGKqYwiae3mlyTk3c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by DS7PR11MB7951.namprd11.prod.outlook.com
 (2603:10b6:8:eb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 15:35:48 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 15:35:48 +0000
Message-ID: <9d56f935-1413-4cbc-a46d-b30b69ce390c@intel.com>
Date: Mon, 23 Nov 2026 21:05:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/hwmon: Improve mailbox power limit init and
 visibility
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261123140847.338842-1-karthik.poosa@intel.com>
 <20261123140847.338842-3-karthik.poosa@intel.com>
 <sashiko-outbox-229384@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-229384@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::15) To FT1PR11MB960200.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|DS7PR11MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: b40cc57d-835f-4694-8576-08df497772c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|5023799004|11063799006|4143699003|56012099006|260925021311599003|260925022911599003|260925021911599003|10067099003|18002099003|22082099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info: oXAhrVam/eOwV3vBXjPYJstk4mnAk3bvzm9wfiW6DZu7TntSIhMCYcE7jgayFTziRKAxp9etTeOlHJicAJsyxvdCcW1ZAAPG1tRlh/Gd+HFkQw/Fo24z/DojBzbZ8Aqr+jEQ7fZgXB6MIfPyt6dMWt2HjYrPT6S8QTXky1Gbg5QUKc1CIesVA+7xGtMi3j9jTmU1EZNIpH3cAyCEZspQ4qwqfQSdhP58MP/4J2FMcRuqJhbIRIl0a10xAZYq6i0gKsOKpuxRz2goiRsU/dOmx5dFxiaQ+m3KnkeOHv7o/K9fodSW7vzDw4XO0PapT3XV4ebU9kFpkdylTzzhTRL1CAtf2QcJmMwEoOGPWooVwn+Z3jwXrlwiLr3cn3UifeBq9Npr/TB9pxN+MMK1AaufnM+H43rWWDXLUT874+UXgGX/nmYPQn6JyU7IT+eI2EQcwS821B258BxX+uFxDQykKezbIY0fvsWeJilkHHgBO4vv4Jjh1m2heNNl5QKxuP4rQVn7h+KssILoz3V+mhIrTdIkUwXQVcqFOjlJ/Rg2OsB19FfGAoMs6mLOkWUzePtTrPIoDUC1RjgLfuDueuHqerxB9Tqo2uv5X7RiLmVgpSX7GHZ3XMPsX1hi8nq+SOcZlIVWiqyuS/p2K1WwO7cVDYIiwFIBXu8iReruG5Y+eUE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FT1PR11MB960200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(5023799004)(11063799006)(4143699003)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(18002099003)(22082099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHhOazQrdEhmUmRkM0JnMmVFTGRVbDBQM1lqQWJ3dThmUjlNSkhCT0JIQUdV?=
 =?utf-8?B?bTVWSkdGei80QXlUY2lCUTBwWDhtMmswcjFPVC9pRk4wWTZRdjQ3UGtXeEpp?=
 =?utf-8?B?aWh3dWxFYVVYclhyS2hseExwb2M2b3lRVXFLU1U4RlN0dVE4VnVIZmlzSEpZ?=
 =?utf-8?B?clFJYVZSQUdoNlg2OFp6Y3YycHVpSUZGeS9WM3lReFZ1cmhvSmgvMlc5QXdE?=
 =?utf-8?B?cFVjWTRkZm16TDZvVStmZG41K3pkc05hQ2FkTHhzWFVrU1pKYzJuMWo5Qloy?=
 =?utf-8?B?Ym1hUzJtbEFQSDhYYXZSby9EL3F2RzI0S0lzZDljN0tzUTVMTFhxZk8yU1Yw?=
 =?utf-8?B?dWF1NUR0ODgrL3hROG5FVVJLcjZGMHRYYUNzNmNhaDRUYStUdHhwT1dGTisv?=
 =?utf-8?B?NkFXcm5vV3RHOGYxajl2SFprdjdrd0ZlSEthMDlRZEZnOSt4QkJmcm5nWXRy?=
 =?utf-8?B?Z3RsRUJFNVZ0b1pobDFnTnpBUFUzUGU5TDdzNXRNTjNaanhrTUNHbExZblQw?=
 =?utf-8?B?K2YxVG5BclVQWG1GemdqdHYrTDE3UUNpMG4rdUVZWldCdDlDT3hjWGxGMk1C?=
 =?utf-8?B?TzNzc3ZZYWdiZmdlMDJmQUNWNnk3N29Qd2U1b0EwTjVHTkV0ZERwdkNxcWtB?=
 =?utf-8?B?MEJkcHhsZkFzUEY2SjNiUkVMamZGMkZJN2k4QTMxdlZ3RHduekYramVDZ1pK?=
 =?utf-8?B?QVppM2NWVmR0UHlMekk3KzNONk5mK05aeTZzU3RMczNuY1kzQmlwWmVlVEhW?=
 =?utf-8?B?dnZlSG9pOHRWWkpNZHZ2aW1ZTGJlaHNGekNva1VudTUvNUF0ZHpqbUtsTW1R?=
 =?utf-8?B?VWRCRGk0cll0N0FDbXJxNEhjRk5MT21zdFJaZHNUY1orWDV3WVQ4NzA3K3FU?=
 =?utf-8?B?NGRoMUFpM25xOFhJeG0vK2taYzVNeG9KVExFbVZnY2RNWWRSSkxhUk9aMURu?=
 =?utf-8?B?Q0lhRFZoTkJqQWphSkVHazZqYTR3WlRrcDcwREphVmlhRTZhdEk2UXppa3o5?=
 =?utf-8?B?b29Rdmg1TmtHRmhZbUoveUZZVkVQUlJadjV2Skl4dTdJeHdMVVNvS05UK3h1?=
 =?utf-8?B?b2w4L1dkNGpNc0VDUjIrNVRGcnRPb1BpbGtJR1BoVFVRTFg4eTB3WHZBOHV4?=
 =?utf-8?B?Wnhtd21ZZnJrSW9WMjFlMVczZ3k3aXJiSU9NUG1sNmFySFlRbVFOM0FsTk5D?=
 =?utf-8?B?OVpROGdjMDRVSGhjWjBPc0VRbWFHV1NRWlRvdENKR0xFclpNRW92bGNQSmNx?=
 =?utf-8?B?RldlbGhtZVgrWXFTU1FJRldma0dvdTlRb28zWEdRenFZckhyUGZscGpGU1dN?=
 =?utf-8?B?SU1xbmhkZzJBZGRyTXp0NEdRL2UxaUwwc2xpbzZmaElHSE5HYS9KT1MrZVA1?=
 =?utf-8?B?dW9GdHg5RnRYK2VzL243YnNpdUZaek10bW1PTVM3WU5aajJVeUJ3a0IvOTda?=
 =?utf-8?B?ZThGK3F6MitzSFdIM01kV0RZWnZWV3NsZ1NGaHF3dlhZUlcrcGU5K0JPN08z?=
 =?utf-8?B?bittN1RTN2cwbzR0QXI2ZEQ4ZGIvREJzOTJYMjhhQnhjNWFRSjA5U0YwZGVi?=
 =?utf-8?B?VlMvZlJyaW15RE5BMWt1SWo5SUNpSlM2TmFLYUxpQ3dmbFlCenpIc0lQQzAx?=
 =?utf-8?B?ZDYrWXM5d0ZQQ1JXSXVBYlhZTEhrY2FqcEFORUhBVHYweERQWXY0eVFMRW1m?=
 =?utf-8?B?TmlmMnc4MmRnZFhIRk85ZDFjVXlSUkdyZDdITDl2SzZKb3dLK2diZDA3aWsy?=
 =?utf-8?B?NjVVbkloRDZnQmxadFowelhTZHA5Mk5zS3hscW1vaXl5ZE1uZXZnOFNBYnN5?=
 =?utf-8?B?cWs1bXdaVUsxWExLbkU2empxY25NZm9waCtOUjBPcmx6Z1B4bU1tbFB6YnZl?=
 =?utf-8?B?TUg1YkdJY3R4eHFQeUxnK2J6ODRlaklYTlg0bk9tREZsbDlEb2RjZWZ0L3dP?=
 =?utf-8?B?MHZhUVRQdTlvMUxkWlJoSVRrL2dENlkxbTM4TXdnVkQ0aWhYczRhelVqaDRj?=
 =?utf-8?B?Ykx0dW52alRseG9COXRISVVvOEF3MmRWRzhWTjFwSi9sRUJ2L3pkSGlkU0Q1?=
 =?utf-8?B?ODRRaHdIdmpVbXJRZFk1eGFBT0NNL3g2Q2xNSFMvU1l5U2dsclN5bEJIbE9Y?=
 =?utf-8?B?N2dVSklPK0VkSGcxd1ZvRUxXT0ZIWmVuT1BOOERvZDJKMGE4NWVTUVJrQlpK?=
 =?utf-8?B?Y0MrcldKVWxBRmhIQzBMK05aaElOSU5rWllpS0JhemRHUXJUc3ZJR1lpWWxr?=
 =?utf-8?B?NmlaUG1yUEZLR0ljSnpPLzE3ZkYwTVNhRUhvcXF5dlhKSGFQRHNibHhERDZ0?=
 =?utf-8?B?aEpGaURReW5CQzBncW9veEhzVi9nbmdOWURST2VHREV3N21NYlZYdz09?=
X-Exchange-RoutingPolicyChecked: VpQ8vYvSFP9LDPLWhdysYeP0iNX14xbOS69pX+8b8pJmvD8rNdo5w2MbcAeFRyOfmDW4Ef4ZnZ7O6diH1ylf6ztyIWDxT19ypToZcA4UhLkIgmB8bLDGfcZxOtoIzm21IATb3wQnWRmnj0Y1LAlfQJsEU3WUkdN5iUsBYVIqdJ2EFF5qcPROtsHT4oeIGtPxLUQYhI3eBBktrwHpSxu9+AISFCQJ3wbW0dALzgF54/RjYlqkSlGu7q359IhLH2rMSKwb9w3bCXv9QwwAQ8pamn4ffI3z5daxcOUDZcWmmphm2q8gErG7uSaPfI7WQJLFbiURGI4SSJlUNt5iWl1V3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: b40cc57d-835f-4694-8576-08df497772c0
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 15:35:48.8206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gP0AjcikqHReZFiLghFLkFSZWSH2TG2YsXmm2636Mo7ep5Z1JVW/iuMQajABIILCmt2NlkSJW7oO2b2SrTR4FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
X-OriginatorOrg: intel.com


On 23-11-2026 19:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/xe/hwmon: inconsistent boot-limit visibility for power
>    interval and label
> --
>
> commit f47de5c9c860a6b4f7079857684d0af6687419b7
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Improve mailbox power limit init and visibility
>
> This commit initializes fixed mailbox power, energy, and time shifts
> before reading boot power limits, and bases hwmon_power_max and
> hwmon_power_cap visibility on the cached boot limits instead of a
> separate pcode read.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 8e0d295aabc88..a616b9eb62ca1 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -1429,7 +1429,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   	case hwmon_power_max:
>>   	case hwmon_power_cap:
>>   		if (hwmon->xe->info.has_mbx_power_limits) {
>> -			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
>> +			uval = attr == hwmon_power_max ? hwmon->pl1_on_boot[channel] :
>> +						   hwmon->pl2_on_boot[channel];
>>   		} else if (attr != PL2_HWMON_ATTR) {
>>   			reg = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>>   			if (xe_reg_is_valid(reg))
> [Severity: Medium]
> Should the hwmon_power_label case below in xe_hwmon_power_is_visible()
> and the interval visibility check in xe_hwmon_attributes_visible() also
> use pl1_on_boot[channel] and pl2_on_boot[channel] instead of calling
> xe_hwmon_pcode_read_power_limit()?
>
> Both still perform separate pcode reads:
>
> drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_attributes_visible() {
> 	...
> 	if (hwmon->xe->info.has_mbx_power_limits) {
> 		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
> 	} else if (power_attr != PL2_HWMON_ATTR) {
> 	...
> }
>
> drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_power_is_visible() {
> 	...
> 	case hwmon_power_label:
> 		if (hwmon->xe->info.has_mbx_power_limits) {
> 			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
> 		} else {
> 	...
> }
>
> When a boot-time pcode read fails transiently in
> xe_hwmon_get_preregistration_info(), powerN_max or powerN_cap is hidden
> and xe_hwmon_pcode_set_default_power_limits() is skipped, but if the
> separate pcode read in xe_hwmon_attributes_visible() or
> xe_hwmon_power_is_visible() succeeds, the corresponding
> powerN_max_interval, powerN_cap_interval, or powerN_label attribute is
> still exposed. Conversely, if the boot read succeeds and the later pcode
> read fails, the visible power limit loses its companion interval or label
> attribute.
ok, we can do this changes also.
>
