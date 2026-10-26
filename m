Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793018202;
	b=1ttB4SmhEh9szRQa0yjSJ2vItIGEUS3uZSs39+2O3s2vk3AWh02jdYVx3968Vrm7Tc1A
	 XGTGg6kuFgV6IArA1Jky3albGHOQm5fUkA/6JN9FQeQfQ4a5IrMd7sur1ffN/MhpAzMgA
	 jLvBh2yYWo7BBYw9MNSeVqi6iuzF6dJ+XDNu3VuQGtW20KynrSoCBH7+y6mLbV0bn41ED
	 U9PO9oU3FrijybgZSfl983s6bpp/2XvwulQh01Eex7GzZgrWkxAEWz7oojPB+vZ+5UhSV
	 8+MDUgizQcNl7azejly55TbeJ8Qb1drRzF1IwEucOMbhqkPn1oADqb/hasjAFHPGyCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018202;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 References:Content-Language:CC:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Uzlue7GBiqCWE4t5FLAnWgwYVrl6Vvw4Qv7qf3CLpzo=;
	b=v3pi439rSXMGTXqi+Kbyvd7APzuSffCN6xqVn15akXtBc0U1aLNXQn5KHmhxWzVh8d7m
	 BOPHqqcie75Th+uTGBxscifLYD8XEagk5bXAjpttJqRUjz42uO85hnCjbYqPp/8OZwQJa
	 HePnocMnFZCjghS7OsrnxdBwW8p6xidlNp1cJFdlowBS57r8FrwVTgvfnqNs3wnTk7ibc
	 pT0vqymdZ2JM3Jr+4KrNhSiD5fR+SDQ5O3MOEPNpgc0cOy7/CfuQY4OckP2a0rQBwgK+p
	 xu5cTH3i02Ip+xrdDlr4SGy1vRmkhZ7Ovs76PQ0szGvIdhUt10Ck9OBwibmFYUJIAWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nR+ILrtR;
	arc=fail smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E232606A31B
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 12:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E232606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nR+ILrtR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793018200; x=1824554200;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=piCU9Z0YJZKpEUrvk6jzRxkAEbg/kRkp8sX2jz2YS98=;
  b=nR+ILrtRE6VE5+Mf+pYTYHxw17AR2w1Glopx7TD+JSvQfY9/F7erQkpZ
   BJJhoyl0kBZ4LIq9M3A+NM4u78Uic1Dw8Gb/MYrmuKvwfF/z/GxfPPXzO
   hTUE4pXN16lI/XRJ19Psakg7LZ27C7qPcq/dvlJT2yM37B8G91h02VrBf
   MY23veyIiPvFgYGiqBs6ihlgOLWN2u3upNldIz2NigMqPFSloDMBV5wkA
   09cYkgrDfZz8O4yit+8Jr1oCGfVSnQ2yPVFSBerMDwZuaFQ5tS2PjwFnA
   6SfkLSNm46sOA+A1lxdxeZpGBuRvt/dZe8fudooKti9YLKDJiE/zQz+NO
   w==;
X-CSE-ConnectionGUID: fhMuTvcrSkGOuzrt86n5fg==
X-CSE-MsgGUID: 6oOe6IcpQNuve2qpqdKMZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1672848"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1672848"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 05:36:39 -0700
X-CSE-ConnectionGUID: i1LgNq3KRXa3Tehhn8VDYg==
X-CSE-MsgGUID: r8NbtDisSqmtuiPJbruobQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4195997"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 05:36:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 05:36:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 05:36:38 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 05:36:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeBxUiueqQzhtF3n1dgG/h5xPcOgh/8xDx/au+fcjpPh9pjn/FeFgoiI46a1Z+1cKxkE55VGMHnLquFDyWnvREmWrSyZyCAGDoo+7g6jlqmRNoqEWrAPQzugaBUDhdgx/NIZcEMppaocaB9I5ymfEzRlMIEp9Yj89NMX1iBtCy+Bg37sAtrvYywJpijGoI9zh6BZAc1TC7shbRKLfzUBwTJwWIzcI4WtbYZtRDbgQ2RYLC7KP8IgeAbSjYdjPEhseUxs344CO3O+KSjY5d/arAnWC7bF9tcnv+h/le6ogYdSu95S7pknTSCtvVPr0jQNRRTrrFTW9Yg9eirCl7ja6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uzlue7GBiqCWE4t5FLAnWgwYVrl6Vvw4Qv7qf3CLpzo=;
 b=yMR9g8HuXdefQsej6RoZaRWL0EGo8u43XSBnvd56fEg/ym6ZSY2WABylKZ4cWz7sdL0AlVUbVVYh2JER4PPWGqmOXTbTVsevgsBx+2mDZjP0Lj3cp+yE1LZDBhAnMKYKNLeEnUV4kfj+a1i0eh7d22j4/6cKdN99o+FBEqdf/l5Ay8pPOrxuBt/tRYd1sMi4YYu29TuavWkNSQMPcD20gPT0wZvp7+pVwdkbNcEcBWTHLZuiyhEniQjQ+BuLnFzky4lV/xh6pdJKTloWhnCmjmKw54f9jPtMCryVq+gjZTQChT8mJTdtJFPdbNg5i+GQYp0G/fpKflQf7/m6qS6TVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9)
 by DSVPR11MB9916.namprd11.prod.outlook.com (2603:10b6:8:45b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:36:33 +0000
Received: from CY5PR11MB6440.namprd11.prod.outlook.com
 ([fe80::90ea:c216:8cc7:3757]) by CY5PR11MB6440.namprd11.prod.outlook.com
 ([fe80::90ea:c216:8cc7:3757%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 12:36:33 +0000
Message-ID: <3f1ae250-aaca-4a2a-846d-25dff3bd57c7@intel.com>
Date: Mon, 26 Oct 2026 18:06:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/dmc_wl: Avoid blocking on delayed wakelock
 release
To: <sashiko-reviews@lists.linux.dev>, <intel-gfx@lists.freedesktop.org>,
	<intel-xe@lists.freedesktop.org>
References: <20261013161131.2572279-4-dibin.moolakadan.subrahmanian@intel.com>
 <20261013161131.2572279-6-dibin.moolakadan.subrahmanian@intel.com>
 <sashiko-outbox-170108@kernel.org>
Content-Language: en-US
CC: <luciano.coelho@intel.com>
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <sashiko-outbox-170108@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::13) To CY5PR11MB6440.namprd11.prod.outlook.com
 (2603:10b6:930:33::9)
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
X-MS-TrafficTypeDiagnostic: CY5PR11MB6440:EE_|DSVPR11MB9916:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a2a740-eaa4-432a-df0e-08df335dc4bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006|261022075727099003|261021123027099003|10067099003|261009220027099003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: Q3DRcMdsgXPTbe80lHFyCkWsc69JoDjUDD5BI/KZOnKfnVY5vUhU1u0L9Hjfr7aJZQZ4fE6JTwd9MjG1g1wlYvuVGA+RMH74O01hf6PLgL+YNuhBuKpkbe9LQae3Y3IfWndNLfqMW5xHVsLvR7JGlRT/u3woGKl+vDU0un3MkG9Ial5+VPp/WVFFrbI7iaxSKDvDBb7m39DUBFLPIuO2tUIRhCdFvDlJ56GrgNx5WgGN2HIBzYFPbFjVTrBa1J0y4dN0MhNgCTW6YQMt56tflp7mhtZUJyEl+i56eiEsWrFEPeEWPVt/5Xk69BH0A3a0WHmF4qoUTeFUS+8vVKJEb5XpsxGnrijV2jiLHEHuh3FMcOTXkyyxjBjPNtZhy/zKyMBUi/GAPhDw967FMDrtztCRhPidTR8/B4VzY+/0VHQwG62hIMT5IGXOOFBC1hWeIAtEP2iEXLadMDph27ogcE6X07UpJxSHAljeJAwlIHXCJRHM5B+yctlQREvHXCy1FXsQ+msSBQ7v3nRc+lC6p5oSdqSeEDRl3obI9cQ/Je2CQFmhpWe/dVw8urI1KJED980P/sgwkV0N5L9BLn7x1A4/kXjN9N8/WML6NU9sZ+ITzdIqvOJf1VHKsaeOBLTNOww7BOrlHeZmaE/4Gs3ne/J8GOf6BUqmB+m00rlbOME=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6440.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261022075727099003)(261021123027099003)(10067099003)(261009220027099003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXlEYnZ2aHFpVlpMblI0QnJaSWlvVFdMZlRudHFQeUFGd1lpaE5raDV2WTJG?=
 =?utf-8?B?engyVHh6cFlzcWp4Q0padU5OdTVlTFEwNFc5MFRMU25JMjMvVEYvZ1Y4enJZ?=
 =?utf-8?B?eGJUSzFCVy9ENlFZMURieFBFRzlxa3Z5dXY1MnBaSHFVRnJIOXJkbTlSYVlt?=
 =?utf-8?B?TTBncFdoSXNVT1FjcmJnNHl5a1FjZ1BSTXhnQjBBM2RGUnFDTDhKaXBHZlBG?=
 =?utf-8?B?aFBqSWV1ZEt4VkxmRmNqVFh4dE0zaU1JelBoZkZKVTZ0RXR2SldhaDNKMGV3?=
 =?utf-8?B?REMzS0RHcVJxb1FyOWh5SUlDSUdvWU91cjU1WHYwckQwNC9hSEFDSm1PUkRJ?=
 =?utf-8?B?dmExWDkyQmZnTi9iZDFEb3Jtclo2V05nOTI1dFhVdm5EZGJ4dXFQUzRGL0Y5?=
 =?utf-8?B?SGhVVDlaNjVncGpobUNCaTgyQ2JUTXNQWFU2NkZNZHVPTHIxVGNxL0w0STFk?=
 =?utf-8?B?a05lZGVVa2dnWVJDa0d4T1dUVjY5eXRaWHA3MnY5b2FoRXhmRG1SekVsbGpM?=
 =?utf-8?B?azIrQ1ZyTlNITXpmRUtTMllocmo4djFZUStabDNHSTlnSFd2QlBVcTgweFlZ?=
 =?utf-8?B?ZGZWQjY2NUkwZHRUeWl5Y2xwZnplQmpMa2lVTDJCdXFTcW5DTFJTT2I0anJm?=
 =?utf-8?B?VXpQcmFJcDVrN0ltSWhTQjRyNUtWeU95YWlpa09hTzFZUDRtQTNrYXFvR2Ri?=
 =?utf-8?B?QW1zV0szekg5dVJoRFk3bS93WkJaS0g4bmdjbWIyVHFqSE9rYkJEWURUWjFj?=
 =?utf-8?B?ajYyR3VrVGUyY0hFTjF6ZGRaYUV1akk4MG9sOFlVRG5mOFpQd0Z0NlJCMlYy?=
 =?utf-8?B?MkNCTUFMelVOanhreVdhMnI0ZWttbmZrSXlZQ3lEQXl1YnRyRWJzN2d5Zm45?=
 =?utf-8?B?aGtDdDNXQklvT1lTMFZDS0NsZ2FGclJGS0FqcnFUQXNjZ1k5dG1zaXk5czlo?=
 =?utf-8?B?bHRvUW8xeEJ2V21IYjlVcUQycFo5WkQrcWtuWXRGenJkSjkyVExDOUY2U3VW?=
 =?utf-8?B?dlVOOTZLajcrc21uRktIYmNaWS9yZFJ5L1A1TzhPZTg1dW5aaFF4d3EzZzF2?=
 =?utf-8?B?dEtUVnh4akpNWnRiYnFsQkRGd01MM2NQUC80VGRQL3N3di9aQ2JZbm5nVEE5?=
 =?utf-8?B?anZtK091azJNSEM3YjdrR1IvbE5KQnZ3NmtkUkt1Z1h4dEVrdHl5UHF3MEcw?=
 =?utf-8?B?YWVJaGRiMWp1Ukcxd01sZjN5bFM5aW9PS216NVN1UnpyR0ozVjNMTTNKd0xw?=
 =?utf-8?B?VVhpc29tU3ozUURWaFlFaGNXOFUvRWRBcFVOc3dLWDJTVytPSGw3Y21ILy9N?=
 =?utf-8?B?aEhoK0k5Ti9Ncmp4S0lqVGtxbTlBYzR3WEhndm91UURZYTFyMjEySVYvaHJF?=
 =?utf-8?B?NHFVV2V5cWJLMXN1TS9JRC93SkZzd3hwMzNNUTY3ZHFYUXFYYmZhQldQZnJp?=
 =?utf-8?B?UjZMaEVkQStnK3pNNGZ2RkYwZWpPaXFock5OeVE4ZmpBZUdvRVNDMUZVeGpC?=
 =?utf-8?B?TmgvNS9BMGM0RVFhMk9WR1diNDIzRXI5SGErY1J2bTNuMFcxRXdVdWFjdS9z?=
 =?utf-8?B?YmpJcit3QUpGNURubGo5akVWd3dSQ0E1anZnVkZmNlNqSEF2RTUyK2VhNDFV?=
 =?utf-8?B?QldXMFd3aUFqeXpFY3ZsNVBoWE5TMEpTOWM5c2xCVlVUYmcxdkVkU3R5YURm?=
 =?utf-8?B?ODhIT0NRR3c5S0ZVMWxWbXovRHp4eVVpMkpHTHRhTEJCcWhwR0RpYjNrcmpJ?=
 =?utf-8?B?WnFyMFJhaVBUbmJORmxTWHBtTUt3WVArMjdJa1hBdGNpN3BlYUMvSmJnZGNY?=
 =?utf-8?B?WlJpOUlMUXdoVEZlVVQyc01YbGV2YzEzWHZsbWc5SkhHZHcwaUc4K1JlKy9u?=
 =?utf-8?B?ZHJScWNpVVR4UURyU2x0QitSNmxzdVFIVi9jaWhTNUtDUWtTVjZkOVRTMUZt?=
 =?utf-8?B?Vjd3WWJFREtqMTJEblhBOGFmZDlQR0ZHZks1bDFsY0VWNGs0UEswRyt1SE9o?=
 =?utf-8?B?b1JLVVA0cHVVNHltcDNKMFhPK2hXWDA5eGZ3SmwxNzZCTnRRaTQ5WGVId1d3?=
 =?utf-8?B?ZVl5bzNXaW5HNXlNWkhTTlRoeElVbkFKTExtcnB2UUN0NUsxdVZsQkVLSHJZ?=
 =?utf-8?B?eS84YS9xcG5ZMnF2NlNBdTBSTzlDbkc4SFVFdDcvWjd1QUQxK2Z6Y0ZKZ1pw?=
 =?utf-8?B?ZVJKNFhJYTFkOVEvOTVHTDMzcWtPTXlnTzExaHBUeHNpUmloSkM1Y0NpTC9I?=
 =?utf-8?B?RktqSlNKNjJ5b005TUIvWEJPck43MkdPY3B5M2JlTHhTQUcycjFDRnQ4cFc1?=
 =?utf-8?B?bGNvZk9ab29WZmtteWd2VDc1c1dXY1RQUUlubUQvSkVQMzdRdHY2bHRSYlN1?=
 =?utf-8?Q?TR440izGAQfbo7SgpXRuqdX4PZAIkQOX51BZ7fnnyj4/z?=
X-MS-Exchange-AntiSpam-MessageData-1: BunrHyeG30ZZlA==
X-Exchange-RoutingPolicyChecked: wOwy9RnkMZOTgo3WlL9LxUTynR5VipTKyfQeJSwSPFqJK36Z+Qw1mgDhUgsM7pZohWBlZiB9lnjtZYIiWWOFv3/7mL1ihTwYtLRcQPpb5lrsp6FEi3BwBDwnRfnOWqlnBTti/bzpKVgw7SmcgxHkwvLgEaISekeCpM0WoziAhCCM7/3g1i99XBH1S52i/eJworJ3Fe3T8WEeMB9nJxpJ9NFtrPQ7PkOThlkf2mCu39eOCROMMbkm9QMHAzzOXeJOvXxtGc+G3G6ksn3Na84leou4yCBEqXI6Vqc/pbU3kOgBudmlPzvovGaKvGJpAi+p7F0Od/Ugelrdq0MU9mGz9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a2a740-eaa4-432a-df0e-08df335dc4bd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6440.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 12:36:33.6756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z65Ylot1XspIKfT1lnAnt1KlOA/gR820sAETXaLcVp3/J7KVQzHNInCEatv0ozeRUbq6/QLtqEq2TfcrmAq0yjji3Q1aZVEXfTwYphN10y87jvnVmo1tK8f5lxeTuvyg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9916
X-OriginatorOrg: intel.com

On 10/13/2026 9:54 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/i915/dmc_wl: race allows delayed work execution after disable
> --
>
> commit c0608498f162e6c645a132e26ca4016580c97dce
> Author: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
>
> drm/i915/dmc_wl: Avoid blocking on delayed wakelock release
>
> This commit modifies intel_dmc_wl_disable() to cancel the pending wakelock
> release work rather than flushing it. This prevents the DC-exit path from
> being unnecessarily delayed by workqueue scheduling and ACK polling. It drops
> the work when disabling the wakelock instead of forcing it to run.
>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
>> index ab4e0e9573dfb..3eae119009782 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
>> @@ -400,7 +400,7 @@ void intel_dmc_wl_disable(struct intel_display *display)
>>   	if (!__intel_dmc_wl_supported(display))
>>   		return;
>>   
>> -	intel_dmc_wl_flush_release_work(display);
>> +	cancel_delayed_work_sync(&wl->work);
> [Severity: Medium]
> Could this leave a stray delayed work queued after the wakelock is disabled?
>
> Since cancel_delayed_work_sync() is called outside of wl->lock and before
> wl->enabled is cleared, could a concurrent intel_dmc_wl_put() race here?
>
> If CPU1 is in intel_dmc_wl_disable() just after cancel_delayed_work_sync(),
> and CPU2 calls intel_dmc_wl_put():
>
> CPU2 takes the lock in intel_dmc_wl_put(), sees wl->enabled is still true,
> and queues the work again:
>
>      if (refcount_dec_and_test(&wl->refcount)) {
>          if (!wl->enabled)
>              goto out_unlock;
>          
>          __intel_dmc_wl_release(display);
>          ...
>
> Then CPU1 would acquire the lock, disable the wakelock, and set
> wl->enabled = false, but the work has already been re-queued.
>
> When the queued intel_dmc_wl_work() executes later, it checks if refcount is
> non-zero but doesn't check wl->enabled. It would then poll for
> DMC_WAKELOCK_CTL_ACK and trigger the "DMC wakelock release timed out"
> WARN_RATELIMIT since the wakelock was already disabled.
>
>>   
>>   	spin_lock_irqsave(&wl->lock, flags);
>>
Thank you for the review,
This is a valid race, but it is not introduced by this patch.
The existing intel_dmc_wl_flush_release_work() was also called outside
wl->lock and before wl->enabled` was cleared, so the same race was possible
with the previous code.

As pointed out, the queued work does not check wl->enabled before polling the ACK.
This race condition should be addressed in a separate patch, rather than including
it in this change.

Regards,
Dibin


