Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793915507;
	b=13zFQ/8hYQBj8pv0BbL+ceRgNfXjhjaEb7o80d6M27FVGB+xHfSHjjL33x+Ojg67Sid+
	 Sfr81cK4IVaZCsBd4FClgyt38RnD1yz0AIcFcoiY00JPP4xUrKTAx/MP1t4ak40nGIAPL
	 4i70kNZUOZ0Rxa/eIa0Is6UdIr9QYOYZFRtm+KAzHruJHtOkCVfBTFfD43772+OR01TKD
	 DlDfn751r+RREm5A9Tsuh+TFdvz9fypSM3Fm/m+bgq5y3VNgSWU+kS9tM00HEWNL+hMrH
	 WCOYLOsZ1L480gCqj0eswQShd8alW581+J9YINKaISHErcPVlCM7wxeN65T5OZkO1Vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=xnJCISrt1hBX/m8Uw2LcxZUYVuvHnjcFOfG7+4blN5s=;
	b=N6Y2wygNsdHC935XfW6KRBHTG0PxxOcicBAr2T2ow1Hm+nUHy8/AeCiA2ZWj0+MZpLUo
	 ase2pwRQ7gATttNcqpyfx5Ccr8p4IW54Ku8iSwTNavMahPXSHQIMRcIBEdKqq6WG1Ctda
	 qmwoBTdBfGey+2KCMlegaOHf2uwHO2roXmnlYVajWjitRJXn5kHhm/SIjnG21ZefJaoI2
	 hTb/wFArzBsKAxeh3HjyOAIySB4qph/ZW9lYA5HOpernB94eTBmsqt766zmHSnMBCcFBD
	 7MvpCcAQMGj7I1m9+vuryc3KkHohEoAqhKGp8+3F5NmglUEmT1dS0O4wGJeEjiHiJwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tgus+a+a;
	arc=fail smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D18606A326
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 21:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D18606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tgus+a+a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793915504; x=1825451504;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=5nhIX+bOQnhtxO6dtT6WTSQXn9RMBNgkuZ1Qamgk26w=;
  b=Tgus+a+aIK2drYni5eHrcjhy1RNUjjJ0oceP9fvKXcYHDntqAqhVfMgr
   D9oT5ighkesnAe3tJToB3VzGt8bQ4JvzFCoSxN5Lvbb+NHj3PitVRwmLJ
   SG03tfPuUcm1N0fN9P+WJUWHk1wV1Ms5DfHqZXPc5EJJmNuJiOGVTVSxm
   vIkzc1BcKvwcTxlB6/mzC/6u2SPVq6cfjMEculSinxorQZTRp6DVQH6o1
   F09kEVbURsbWR+kGX4nyg6BfQq9gPk9JBUZ3MlmJZ1/7KuXnBC20bduFo
   DFsxp8ddy0kItTIeRUxTtJCO51hD/2edSKWD6jZ4/2dpabjYHumapkGH9
   A==;
X-CSE-ConnectionGUID: /AH1Ya4oT5CVUDzTEOMPZw==
X-CSE-MsgGUID: WEJlyGNjSJK4ps3u1087Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2608933"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2608933"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:51:44 -0800
X-CSE-ConnectionGUID: ntOhOyeDRUmT847s5C271g==
X-CSE-MsgGUID: 4uJ7TMWrQAeypwhq13dweg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7025476"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:51:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 13:51:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 13:51:43 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 13:51:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uudv0lMcJfaBAA05MJX136vHc4KxwFr/ciCkK3T55lb4lGSzgcgvTRu4sDE+mKCE30L/C4J42ABji5ZemqEUQOWjvVHfM1oSF/8G0nwru6ffEVHHE1velwjAxipairufwmqxheY3f4jK9B33RMjlYxqBmu3pnc5wmdf0gkBrjBu9lIQHKtKbC3GzfSscw44e6mgc4/lUaZFNhDNAS7Nut+J8O4JHT05rZVUQz+MwVf1UdImjG2ARSCieIjCfsEARlHJnJwgloX2c8l7bPoul87liBXHKKT4Rl7Qbj2p4cZhQvAApPQaTD71zrW534hsUrgat1FJTymhcAZXqt++weg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnJCISrt1hBX/m8Uw2LcxZUYVuvHnjcFOfG7+4blN5s=;
 b=QMQ94Uk1uYVCOEwuPBcB7KpHz3UNeX2PGE+MOo/yo4+nlKkHh3VPDlGEYuIWas/YJn/KhS+BI+V+WY3dy0TVmOqJyTfk1vhxkxyOKRORtog8FXEcasfqbSNEu6L/ANpt26wtrUzUA90BImxeCKp45MDsUHjvk92Akefz1o+ESc2y842IAbYpw9tK7HxY9Ve8IM3ya35lTjt/A55ziWa5XaD9xAHK2NPzdcVK1YvLlyCzRDXjsSwMzc4CgFUZZQgH1aFBDbpP3MfqbCid0WPoAh0itKEsQWRrM42tn6vKJSHtZpCkGFn4htm1NWFIIN+7QdaIQRLe1dWI3fz7j495qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8) by DS0PR11MB7261.namprd11.prod.outlook.com
 (2603:10b6:8:13d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 21:51:40 +0000
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f]) by LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 21:51:40 +0000
Message-ID: <976a0acb-1a3d-48cb-b51e-1795bb16e0fa@intel.com>
Date: Thu, 5 Nov 2026 13:51:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/wedge: add fault inspection with debugfs
 release
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261102210242.635207-1-daniel.charles@intel.com>
 <20261102210242.635207-2-daniel.charles@intel.com>
 <sashiko-outbox-194199@kernel.org>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <sashiko-outbox-194199@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0233.namprd04.prod.outlook.com
 (2603:10b6:303:87::28) To LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8)
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
X-MS-TrafficTypeDiagnostic: LV2PR11MB183078:EE_|DS0PR11MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: fe01bb68-2f73-4580-8103-08df3b86f8fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261009223027099003|261022075727099003|4143699003|11063799006|56012099006|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261028144727099003|261026140227099003|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: CbREnvbSePsmsaWynpzrovhpNaAaLsHqDKjDu2HdGGocXZOXGz/oLN+pYzYWfLxdTiic0zgwlgbSSlIW9D1AwAWpsrEu4vkj89gn8y2sipNjOrJVHptRJvCPgfhnvD4UI81c7zFEBg7dYA4YxRf51uhjSeJRXyAFZ8d5xhmn6RWv2zl/rqddBEewuRmkB1V2gM2mGTNgKRKirxGloM31cHB8Brr6OKwI5Ea2gtmjJxSJ1vdV14a9nW8SA5O8AyYO7RXEFhNy7dpsZR86l68p5Bhe8WIdiXvaW4u/UGoNg5A5P3iDRZrgQ4Pxgx5GZImIhNB1HogS9JZ204i3vumtfI2POG4vf+QUGFjGTRPaXA9O5QZmebxiF4F2duQJ3VLZmvWoYRvBqy5Sa943NbSY9a0tiAgEwGj6HuSxl0YkLP7b43Rs9DWiZwQQ9h92eRu8wgxzAtBMsbciNzgaZWlq1CD7vub9PbDQnvdygKDoSee4QzYCukyTCmpD/R/L2ghmS16nQkqvtfKSbhCuJXhTNZG4ot3JACrS8sksaLB7xuqZsudJ5lEiMZ5Aj2hOZU5eg9xW1UVpYRszH/571gO8TNsnO5L0PO6TMISS2I1rif7Aoi2ONygexFw3K7SABbUwgrZn5ReR2Lhphw36fJz2rYJlk+e/Q9bTkQ4aV8NqX2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB183078.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261009223027099003)(261022075727099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(6133799003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW1uVHYwOVRmSkI3Z1RwTWZnR091ZWVmaUV3bFQxZzNoTXlZK2gzNXFxZUU3?=
 =?utf-8?B?akVuMUZPd090d3FpZkRES1puTWl2dEFvQ3Z3eGpnRVp1bStjWmlVcXNLRkVm?=
 =?utf-8?B?ZWIweFZRMEMzQ2cyNlVnTzVDWWJjRVQvWnV0VzhaUVhnNTFCWEk5YUM4TkdC?=
 =?utf-8?B?N2ZZRnV6T2J4QWpMSE5ZdHkvWER1YzJGbHY3U2t4cnZaRnh3d3cxL3h1ZnJa?=
 =?utf-8?B?VmRpNVpzNERoSkVKbk1hVlE1WE5tQURnRmZwaUlzZm1WbG9QK0JXR2xoZmdm?=
 =?utf-8?B?cmFEZ3NlTERMK09BSCtrUnZYVGhoT1ZqZG9GVEFnejRyV2dsUytuaWJvd0cz?=
 =?utf-8?B?YXR4dmFDU0F0RzdVd3ZwQzBlcVBxQzhQS1VTWVBTQWNkQ1pNR2JGSkh5WHpi?=
 =?utf-8?B?cGhVZGhiSWJKSEd4aS95QzVqSHJUTWJubllibGRhYWxCQ3ZMeWhuUmxVbGJI?=
 =?utf-8?B?b1VhMWthRlErSTRaQ2UxUGZVMkFNY09LdVJTUytuWk5aRERaNWcya2Q2WlRn?=
 =?utf-8?B?ZU5haUliUEt2bXFjdXZyeTZhQ0FJaVR6NU5OQ05QRkZWaGJIeDZGQzdDdmRr?=
 =?utf-8?B?NFVSU053Tms0VmwvTXB5NHloOHlZeUtaWmlVYjJJZTNqQkR2bS95NU4xaGs4?=
 =?utf-8?B?eHV1YmxINWZKNEJYOTRVWDhoN251dnFEWWpRSnlYRHl5bmVhMU8xTjRuTGlN?=
 =?utf-8?B?eVV6Nm50Vyt4OEJxVHZIaG1TUUZtVkIwMzBwb3c5SFNxcVM1V0hHR1FXcHF3?=
 =?utf-8?B?QmlWa3ByRDVLbDFlbk1tVzhaZGI4UEl5ZEhTR0FRTy9vcThld1poN0NDQ3pI?=
 =?utf-8?B?M1RuMGNoYTlrVFh4dHFXeFp3SXJPTm9rVU1vWGJsMGNJc2tyNTRXeXEvbGJC?=
 =?utf-8?B?b1FucnE5bjRUMDBHdzk3UUtWZ2l4NTFCeC9USG9PREZzRmYxVG1PN0l3VVpC?=
 =?utf-8?B?NEJ0TkVKNlpHQk1iUkF4NGsweG5ZNW8wellLOUZpWFF6d0pwQUJXOUU1Ynd6?=
 =?utf-8?B?czNsVmRJQlVjeWVBY1FHWVJWQjg1N2UzTHo1MmdoUm5IV3F5TWZUSUF3a2xm?=
 =?utf-8?B?SkxTV1YyYUJZU21sUk1HZm9yeVlmZE04WkFqNnJtdzJHbGtWdWFFbG52a2VW?=
 =?utf-8?B?Mmg5L2YwUG84NzZmTFdrbmg0YVFmczFTc0s5RkR5M2FVMk8yVUF3U3YwdjFo?=
 =?utf-8?B?cDJVZTJ6bjE0M29Xa29ZU1BRb2lvWjRXVjlXUWZSMk41UGpJUkdRVmNReUJV?=
 =?utf-8?B?OVdMM1pTNFVBem8zMDF3ZTlYYktqSncwWHZhQzgzaW5ocmZZd2F0U0liRGF5?=
 =?utf-8?B?WU0vNzVGQk5STS9iUHNpSlJSWEUwRVFBNFhKMFIvakxoNmNYYmZEUU9IbE9J?=
 =?utf-8?B?Vmw4cmlYblFWcEpYbEdUWWVTVVJ0LzZnVkVma2Y2bVUvbnF5M0ZCWnEyblFu?=
 =?utf-8?B?Nm5XaUlVd216aVJEL2VCa0l5d0Zza3BzemUxbHpFeUhmd3NlL29VK2g4MURz?=
 =?utf-8?B?aklkbi9RRFJzSS9wdjhmZVlyR1N4T0ZGWWNveXU1dGhLSEpmOHJrYitVSy9a?=
 =?utf-8?B?WEFJNERkdWJXc2tPMnViVmZZY0JxS3VPbkJDZ1NXV1NjaUZ1S2x2aUFVVU5o?=
 =?utf-8?B?TXhyNW44VCtxRFFzRjBZTXZmZ0JKWVBhMXJ5d0w4RVIwVFRONk5Cb2ZlZVBj?=
 =?utf-8?B?SVREZTcybTJnaE56amhiN2xJeXVNWU5mRS9VaWpBa2JRQXU2NUgrdlQ1N3Nx?=
 =?utf-8?B?dFRPV3QwcEkrTlBQMGxrdGtSY2hWNlQzQXZqZzlDNS9OR01XN21yTlZJTlhp?=
 =?utf-8?B?b3NJZ1BNUkNLRklRZ3pwNUYwZFVHQ2RuYm9wTzhGZDBaWjQ4ekprcTU2bTNH?=
 =?utf-8?B?YzBGbzJheDgrakN6aW1qbTlVbktvUkxjenNJbUtGRkNnZ24zbGd1R1Q0TTdj?=
 =?utf-8?B?eFpWZVhjaGMrT0YrWHh6RGJ5VTFWejdMT2JtUXh1RlV5RHd1NEZReWJ0Z3RZ?=
 =?utf-8?B?VHZhT3RVd1oxbHpFMUR5cFZKWFdFWC9icUpGRlZWZExLbFRvT0Q2QVhOZlNH?=
 =?utf-8?B?SGtVSmpnY2d1TXd6b2hlRlFHNSsvdysvNnZweTMvYTBqSXA5U1ZWaXZic2pJ?=
 =?utf-8?B?QmV3bU1GeHkveUdBY1hTRTV0bWRTRERnZmNKU2IrOVZTcUpaRXB2aVJOdXBu?=
 =?utf-8?B?NEt2bnExZjNpa2NFVm55WktHb3hlWVhHTThGQ0pOOXdLaVhvQk9tTzVMQVNu?=
 =?utf-8?B?WTkxRDRtV3l2NzdGV2JuRlUxMGxUeXJ3eXU3NHRVbTJFU3VzZXpmeGErTDdx?=
 =?utf-8?B?ell6YnZISGxYSlBsQlVVeHQxNDArQ1M4NURSU2NmN2cvTmRXcGdsMG5yQnA4?=
 =?utf-8?Q?3jk2Gd+Xytp/9OOY=3D?=
X-Exchange-RoutingPolicyChecked: dbTBlyDtN1ifCDoMHn3JC2WgIgLMlz1Sg6qd10GpirQc6MJoDpP6eiQzax9/TRDgXh1IGZjx90Kw05lFObrvVz0yy5qGMphutMejV4qm5XzUnYbup8CDNVgeY0IsiT1RiJ/mtJuzfLDdccZzUbJLCVWNspGsaMh+FUe1dyH3J6eZQzqskDg4mOXWg74DTglr0QYHm/FaZ8n1wm1Lx3sNCtMJZHRCXPmS7LkhQzZ/x4El2pYG82yCkhE1kayfTB+IqUspvCCLfXBOxXSNhF4ggXSHXvEgCKvlHEGnklR+ixKkKNKwTnPiPB85B5+/YfsarKJ63HpVSdNZVC6uKIA9oA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe01bb68-2f73-4580-8103-08df3b86f8fa
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB183078.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 21:51:40.0177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: augkX9C/XCs5MXtuXBU13HRUqp7o9MCdRSihvjCNedg1EhNEHDhKSluqBiaURO81DgXcjILW0JDfpA8S91fg8jNJu8hJcCUH7d9colKXP84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7261
X-OriginatorOrg: intel.com


On 11/2/2026 1:27 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] drm/xe/wedge: exec_queue ref leak on repeated xe_guc_submit_wedge()
> - [High] drm/xe/wedge: suspend deadlock and RPM corruption after mode-3 skip
> - [Medium] drm/xe/wedge: GT reset race in xe_gt_wedge_pause() and gt_reset_worker()
> - [Medium] drm/xe/wedge: teardown race on shutting_down in xe_wedge_prepare_fini()
> --
>
> commit efc71b82b1b8d7ea492bbcdc755faa39da7e7570
> Author: Alan Previn <alan.previn.teres.alexis@intel.com>
>
> drm/xe/wedge: add fault inspection with debugfs release
>
> This commit introduces wedged_mode=3 to pause GT submission and block new
> Xe ioctls after a hang so hardware state can be inspected before releasing
> via debugfs. It extends the GuC no-reset policy to cover mode 3 and adds a
> worker that waits for a skip or continue command from wedged_pause_resume.
>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index be79a0da2f2ff..1633b203255a3 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -1207,10 +1207,25 @@ void xe_gt_wedge_declare(struct xe_gt *gt)
> [ ... ]
>> +void xe_gt_wedge_pause(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, READ_ONCE(gt_to_xe(gt)->wedged.mode) ==
>> +		     XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE);
>> +	xe_uc_reset_prepare(&gt->uc);
>> +	xe_uc_wedge_declare(&gt->uc);
>> +	xe_tlb_inval_reset(&gt->tlb_inval);
>> +}
> [ ... ]
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 9e7c2778029ca..57e258283935a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1424,7 +1424,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
> [ ... ]
>> @@ -1433,7 +1433,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>>   	if (!guc->submission_state.initialized)
>>   		return;
>>   
>> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
>> +	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode))) {
>>   		mutex_lock(&guc->submission_state.lock);
>>   		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>>   			if (xe_exec_queue_get_unless_zero(q))
> [ ... ]
>> @@ -1672,7 +1672,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>   	if (!exec_queue_killed(q))
>>   		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>>   	else
>> -		wedged = xe_wedged(xe);
>> +		wedged = xe_wedged(xe) ||
>> +			 (READ_ONCE(xe->wedged.mode) ==
>> +			  XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE &&
>> +			  exec_queue_wedged(q));
>>   
>>   	/*
>>   	 * Only tag as GPU hang if this is the original timeout, not a
>> @@ -1726,6 +1729,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>   			goto handle_vf_resume;
>>   		if (!ret || xe_guc_read_stopped(guc)) {
>>   trigger_reset:
>> +			if (READ_ONCE(xe->wedged.mode) ==
>> +			    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE &&
>> +			    (exec_queue_wedged(q) || exec_queue_wedged(primary))) {
>> +				wedged = true;
>> +				goto complete_jobs;
>> +			}
>>   			if (!ret)
>>   				xe_gt_warn(guc_to_gt(guc),
>>   					   "Schedule disable failed to respond, guc_id=%d",
> [Severity: Medium]
> Can a concurrent job timeout on a killed queue still trigger a full hardware
> GT reset during mode-3 inspection?
>
> In xe_gt_wedge_pause(), xe_uc_reset_prepare() runs first, setting
> guc->submission_state.stopped = 1 and waking guc->ct.wq. Then
> xe_uc_wedge_declare() -> xe_guc_wedge_declare() calls xe_guc_ct_stop(),
> which takes ct->lock and sleeps in cancel_work_sync() before
> xe_guc_submit_wedge() sets EXEC_QUEUE_STATE_WEDGED on the queues:
>
> xe_gt_wedge_pause()
>    xe_uc_reset_prepare()
>      xe_guc_reset_prepare()
>        xe_guc_submit_reset_prepare() /* sets stopped = 1, wakes guc->ct.wq */
>    xe_uc_wedge_declare()
>      xe_guc_wedge_declare()
>        xe_guc_ct_stop()              /* sleeps in cancel_work_sync() */
>        xe_guc_submit_wedge()         /* sets EXEC_QUEUE_STATE_WEDGED */
>
> If a killed queue is concurrently waiting in guc_exec_queue_timedout_job()
> on guc->ct.wq, it wakes up as soon as xe_guc_read_stopped(guc) becomes true
> and jumps to trigger_reset before xe_guc_submit_wedge() has marked the
> queues wedged (and similarly if a killed queue enters
> guc_exec_queue_timedout_job() after declare_pending is set but before
> xe_guc_submit_wedge() runs). At trigger_reset, both exec_queue_wedged(q)
> and exec_queue_wedged(primary) are still false, so it falls through to
> xe_gt_reset_async(primary->gt).
>
> In addition, gt_reset_worker() in drivers/gpu/drm/xe/xe_gt.c only checks
> xe_wedged(gt_to_xe(gt)):
>
> drivers/gpu/drm/xe/xe_gt.c:gt_reset_worker() {
> 	...
> 	if (xe_wedged(gt_to_xe(gt)))
> 		goto err_pm_put;
> 	...
> }
>
> Since xe_wedged(xe) remains false during mode-3 inspection and after a
> skip reply, wouldn't gt_reset_worker() proceed to run do_gt_reset() and
> do_gt_restart(), wiping out the fault state under inspection?

The original thought was focused on queues already marked wedged and 
overlooked the interval between publishing the stopped-submission and 
marking queues wedged.

While the inspection is starting up a timeout in the interval can miss 
the inspection guard and then enter reset request. A stopped submission 
state prevents a new reset but there's no need to get that far.

A fix for this will check for the new declare_pending atomic along with 
the queue wedged state. This applies for inspection startup and after 
SKIP is issued to debugfs.

>> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
>> index 2f35937c5e661..c22c3544adcaa 100644
>> --- a/drivers/gpu/drm/xe/xe_wedge.c
>> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> [ ... ]
>> +static void wedge_pause_work(struct work_struct *work)
>> +{
> [ ... ]
>> +	for_each_initialized_gt(gt, xe, id)
>> +		xe_gt_wedge_pause(gt);
>> +
>> +	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
>> +	WRITE_ONCE(xe->wedged.reply, 0);
>> +	xe->wedged.wait_active = true;
>> +	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
>> +
>> +	xe_err(xe, "GT submission stopped for mode-3 hardware debugging.\n"
>> +	       "New DRM ioctls are blocked while waiting for 'wedged_pause_resume'.\n"
>> +	       "Skip: 0x%08x; continue into permanent wedge: 0x%08x.\n"
>> +	       "Skip does not restart GTs or recover the fault.\n",
>> +	       XE_WEDGE_REPLY_SKIP, XE_WEDGE_REPLY_CONTINUE);
>> +
>> +	wait_event_idle(xe->wedged.pause_waitq,
>> +			wedge_reply_ready(xe) || READ_ONCE(xe->wedged.shutting_down));
>> +
>> +	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
>> +	xe->wedged.wait_active = false;
>> +	reply = READ_ONCE(xe->wedged.reply);
>> +	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
>> +
>> +	if (!READ_ONCE(xe->wedged.shutting_down) && reply == XE_WEDGE_REPLY_CONTINUE)
>> +		wedge_declare_now(xe, DRM_WEDGE_RECOVERY_NONE, true);
>> +	else
>> +		xe_info(xe, "Inspection released without permanent wedge; GTs remain stopped\n");
>> +put_runtime_ref:
>> +	xe_pm_runtime_put(xe);
>> +clear_pending:
>> +	atomic_set(&xe->wedged.declare_pending, 0);
>> +}
> [Severity: High]
> What happens if system suspend or runtime suspend runs during mode-3
> inspection or after XE_WEDGE_REPLY_SKIP?
>
> In wedge_pause_work(), xe_gt_wedge_pause() calls xe_uc_reset_prepare(),
> which sets guc->submission_state.stopped = 1, and xe_uc_wedge_declare(),
> which stops GuC CT and marks queues wedged. However, while waiting in
> wait_event_idle(), or after the user writes XE_WEDGE_REPLY_SKIP,
> wedge_declare_now() is not called, so xe_wedged(xe) remains false and
> xe->needs_flr_on_fini is not set. On XE_WEDGE_REPLY_SKIP, wedge_pause_work()
> also drops its runtime PM reference at put_runtime_ref.
>
> If system suspend runs while paused or after XE_WEDGE_REPLY_SKIP (or D3cold
> runtime suspend runs after the runtime PM reference is dropped),
> xe_gt_suspend() -> xe_uc_suspend() -> uc_reset_wait() -> xe_guc_reset_wait()
> calls xe_guc_submit_reset_wait():
>
> drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_reset_wait() {
> 	wait_event(guc->ct.wq, xe_wedged(guc_to_xe(guc)) ||
> 		   !xe_guc_read_stopped(guc));
> }
>
> Because xe_wedged(xe) is false and xe_guc_read_stopped(guc) stays 1
> permanently, won't xe_guc_submit_reset_wait() (and the loop in
> uc_reset_wait()) sleep uninterruptibly forever?
>
> Also, on platforms where D3cold is disallowed, dropping the runtime PM
> reference on XE_WEDGE_REPLY_SKIP allows xe_pm_runtime_suspend() ->
> xe_gt_runtime_suspend() -> xe_guc_ct_runtime_suspend() to hit the
> g2h->info.space == credits assert if any G2H credits were outstanding, and
> a subsequent xe_pm_runtime_resume() -> xe_guc_runtime_resume() will re-enable
> GuC CT and submission even though GTs are supposed to remain stopped.

In this case mode-3 requires disabling suspend before and during 
inspection is happening, and then this should not be changed.

This will be modified once the last patch in this series introduces a 
variable to handle it better.

>> +
>> +static void wedge_request(struct xe_device *xe, unsigned long method, bool mode3_only)
>> +{
>> +	unsigned long flags;
>> +	enum xe_wedged_mode mode;
>> +	bool pm_ref;
>> +
>> +	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
>> +	mode = READ_ONCE(xe->wedged.mode);
>> +	if (READ_ONCE(xe->wedged.shutting_down) ||
>> +	    (mode3_only && mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE)) {
>> +		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
>> +		return;
>> +	}
>> +
>> +	if (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE) {
>> +		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
>> +		wedge_declare_now(xe, method, false);
>> +		return;
>> +	}
>> +
>> +	if (atomic_read(&xe->wedged.declare_pending)) {
>> +		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
>> +		return;
>> +	}
>> +
>> +	atomic_set(&xe->wedged.declare_pending, 1);
>> +	pm_ref = xe_pm_runtime_get_if_active(xe);
>> +	if (WARN_ON_ONCE(!queue_work(xe->wedged.pause_workqueue, &xe->wedged.pause_work))) {
>> +		xe_err(xe, "Mode-3 inspection work already queued\n");
>> +		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
>> +		if (pm_ref)
>> +			xe_pm_runtime_put(xe);
>> +		return;
>> +	}
>> +	xe->wedged.pause_pm_ref = pm_ref;
>> +	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
>> +}
> [Severity: High]
> Does this leak xe_exec_queue references if xe_guc_submit_wedge() runs more
> than once?
>
> When wedge_pause_work() finishes, it resets xe->wedged.declare_pending to 0:
>
> 1. If the user writes XE_WEDGE_REPLY_SKIP, xe->wedged.flag remains 0 and
>     declare_pending becomes 0, which also re-opens the ioctl gate in
>     xe_drm_ioctl() while GTs remain stopped. Any subsequent timeout on
>     another non-killed queue in guc_exec_queue_timedout_job() sees
>     !exec_queue_killed(q) (since xe_guc_submit_wedge() only sets
>     EXEC_QUEUE_STATE_WEDGED) and calls guc_submit_hint_wedged() ->
>     xe_wedge_declare() -> wedge_request(), queueing wedge_pause_work() a
>     second time.
> 2. Even if the user writes XE_WEDGE_REPLY_CONTINUE (setting
>     xe->wedged.flag = 1), wedge_request() does not check xe_wedged(xe)
>     before handling mode 3, so any later xe_wedge_declare() or
>     xe_wedge_declare_mode3() call after declare_pending is cleared will
>     queue wedge_pause_work() again.
>
> Each run of wedge_pause_work() calls xe_gt_wedge_pause() ->
> xe_uc_wedge_declare() -> xe_guc_wedge_declare() -> xe_guc_submit_wedge():
>
> drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_wedge() {
> 	...
> 	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode))) {
> 		mutex_lock(&guc->submission_state.lock);
> 		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> 			if (xe_exec_queue_get_unless_zero(q))
> 				set_exec_queue_wedged(q);
> 		mutex_unlock(&guc->submission_state.lock);
> 	}
> 	...
> }
>
> Because xe_guc_submit_wedge() takes a new reference with
> xe_exec_queue_get_unless_zero(q) without checking if exec_queue_wedged(q)
> is already set, while guc_submit_fini() only calls xe_exec_queue_put(q) once
> per wedged entry during teardown:
>
> drivers/gpu/drm/xe/xe_guc_submit.c:guc_submit_fini() {
> 	...
> 	mutex_lock(&guc->submission_state.lock);
> 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> 		if (exec_queue_wedged(q)) {
> 			mutex_unlock(&guc->submission_state.lock);
> 			xe_exec_queue_put(q);
> 			mutex_lock(&guc->submission_state.lock);
> 		}
> 	}
> 	mutex_unlock(&guc->submission_state.lock);
> }
>
> won't every repeated call to xe_guc_submit_wedge() leak a reference on all
> registered queues in exec_queue_lookup?

declare_pending takes care of overlapping inspection requests but it's 
cleared after reply allow for other inspection to be initiated.

This work intends to be a one-shot once GT stop is complete. It has to 
reject any other requests, one exception is when the inspection is 
released through SKIP/CONTINUE before GT stop is completed in which case 
another inspection can be tried.

>
> [ ... ]
>> +void xe_wedge_prepare_fini(struct xe_device *xe)
>> +{
>> +	unsigned long flags;
>> +	bool mode3;
>> +
>> +	mutex_lock(&xe->wedged.mode_mutex);
>> +	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
>> +	mode3 = READ_ONCE(xe->wedged.mode) ==
>> +		XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE;
>> +	if (mode3)
>> +		WRITE_ONCE(xe->wedged.shutting_down, true);
>> +	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
>> +	if (mode3 && xe->wedged.pause_workqueue) {
>> +		wake_up_all(&xe->wedged.pause_waitq);
>> +		flush_work(&xe->wedged.pause_work);
>> +	}
>> +	mutex_unlock(&xe->wedged.mode_mutex);
>> +}
> [Severity: Medium]
> Why is xe->wedged.shutting_down only set when xe->wedged.mode is currently
> mode 3?
>
> xe_wedge_prepare_fini() is called at the start of xe_pci_remove() (before
> drm_dev_unplug() removes debugfs), at the start of xe_device_shutdown()
> (where debugfs is not removed), and in xe_device_probe() error cleanup
> before drm_dev_unregister().
>
> If xe->wedged.mode is not 3 when xe_wedge_prepare_fini() runs,
> xe->wedged.shutting_down is left false. A concurrent write to the
> wedged_mode debugfs file can then call xe_wedge_set_mode(), see
> shutting_down == false, and switch the device into mode 3 after
> xe_wedge_prepare_fini() has already returned. Similarly, if
> wedge_pause_work() clears declare_pending just before exit and a concurrent
> xe_wedge_set_mode() changes wedged.mode away from 3 before
> xe_wedge_prepare_fini() acquires mode_mutex, xe_wedge_prepare_fini() will
> see mode3 == false and skip flushing pause_work.
>
> Should xe_wedge_prepare_fini() unconditionally set shutting_down = true and
> flush pause_work whenever pause_workqueue is initialized?
Tear-down has to block later mode-3 activation regardless of current 
mode selected. So shutting_down has to be set unconditionally. Fix will 
be proposed.
