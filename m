Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795712744;
	b=PIQvTfNe+h8fAJ/+BrdG3v+N1nWQ13fFlEZ5QTEKfU903RHBbNDmE4gmAwc2bSSu+Maa
	 ECiiFXjsjKw+I3vCZuqqDq+sYt55u6O1iEn8EwGV3jZo24Dt9U3xFJrRODnWHfneeMUja
	 AinpNzrmJWmp3IsAnyV+HzvGpK+CW2MJcjpdjzuyQ/yAAx0QNz5k8XrVMSC31isyohWA1
	 fm7P+Ws2E6iUfctd8r5zwxu1LVZImPsznNvEnwuwb86ete17NBTGYKX8zO1uLvgSvfHXr
	 HoWmi+vGpGkwgI+XP+d/vxVTrQTLg768NhUBn3LRa8Y+EgCCKLoGTewTLps3+VqUy3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712744;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:References:Content-Language:From:CC:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=rPgomA8hfjLRaw7FKQeDCZ+6UVRASDuzjLYUB3CdXKQ=;
	b=EYEDVjAlSS4+Hv5ZgMS/50Ww1AryJFMyfFRQTE18z6v83D/XbX1MRRuKR0jZSv8DnstA
	 He9L+pzLs8Fe9/TEhOq7acEtFnUuvIL7XT9AUImHFaGgc7vN3+TLIEklpjRylbM6K1mbX
	 o0ITqN2woUC6lSlucs1qPBfTstV5VAb7zuWLCVXsDn3BHu0H1qtwWRiQGBe75VhlGOCn7
	 AB0rQyl1XNEQnZy3/W8GKHkc1m7ntm8LD9axh2tYwVI7JSxHsnWKfqVUDrjtw/sN3aP05
	 VZAc0SYRqKbAgpxaVBL379YoPjg/RBJScxcqbB1DTJYClQ/Vch6Yq8KMqzOdEvmJ5mA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SSKpZyfZ;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=CeAUZ4qd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E19606A323
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 17:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E19606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SSKpZyfZ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=CeAUZ4qd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795712744; x=1827248744;
  h=message-id:date:subject:to:references:from:cc:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mnKMPuivXi1H2AuE/ShvkJhIn8e5v6t6lPWW7Q644uw=;
  b=SSKpZyfZxtTeOhDHJA4RZcLQalIMfAqLaP0vjiRh7Zp0JBw6pCC3jrNd
   rjXOTnQjOfBWvWZxIHhvqObHTBVvF7YPSP+iYcXRLNc2UtOhE5FX2m/rq
   rQ/tM0zHPXYwVUBRj1TymcLsm4EIKJ8q3O3/06ZZggnLuQs1zDbAzvIrE
   V/lB8UcK8fenJkJbnVshiw+f1DIAjfCRbbvBU9UhWTxypiuSbhH3ZlWH/
   yAvUX+i6arG1ENk75r8q/T2gjzYc56d+mpovsOwW4IVL63RFssggZoAoB
   q6++6YOyK0pzfAM68E7aLZ/RRgxo/2dyygpdzqRbOsYAHgQXEEXDVk54p
   A==;
X-CSE-ConnectionGUID: 2l/8xDMDTt6hb/oL0lQV8g==
X-CSE-MsgGUID: VvI3NpJpQuuPfDlo4pupxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4511637"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4511637"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 09:05:43 -0800
X-CSE-ConnectionGUID: eCjwfrowQjSgmBt6pM1SaQ==
X-CSE-MsgGUID: 7kdWYELqRRulnDfclvpJ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12444962"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 09:05:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 09:05:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 09:05:42 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 09:05:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUSq9YY236+kI5Ktth8ZKT1uJP/d6JR+4NPhJNbH07338oEUaWcK+8OrVZ4m5OadVJCkNV0Iy7Zm1WHibrGOsWGf0xR6uyxZNfQfKnYIjS3PyAhA8qhm0j3Vpw/1FS9KNhvn3LYmHglPQ9rGKI8oORKMd4cmsychsHBArYmVVzJ1JHDfWwFgKamjxxcC358RkYX3fAIVNN2DD+I5Ri7GQPMHCATlh2D12ofCjapE5JuwCSdcUzPvghuSfPhCZhVbrJl681xw59ktlapZaNvuRxcPAx747WBOvu41ri6JodSynu+3vzxVbDCO8x3EEQ8eX5B6MIOjXiuWhHChW2H9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPgomA8hfjLRaw7FKQeDCZ+6UVRASDuzjLYUB3CdXKQ=;
 b=FzbId5AolhLM3WPRMJlJMNfewCa/dJdjlWsYTFkc1MMYeo2QpRQdWQQYsa2/cyY1cQm1rTc2LraR/wdN7HJ5NmbEUO8lrtRMao0rUX9CByFXQoA89hfXkzagg/dobZZs09vxcm9h9H8vFm+WnUxaGSWZpr4pDTZMQ9QmY/vMGmA0VuQ/TShS9h1FF0ujZ8FehdboESvuYsQfReXQroouibWrZSz94YMZHQ9b2O8ox3m1NPl/ydqKCEyA+HBPawdUbO3f1XqausDEAjWTTHmmRXZvb8Pr3NdNSfrPxf0T77NTzgWIuczA29VIJqMpD/iyjH5IsfNR9n0gqyF8y1FALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPgomA8hfjLRaw7FKQeDCZ+6UVRASDuzjLYUB3CdXKQ=;
 b=CeAUZ4qd5A+K0gna3qau0t7kGHVaz3HKNQPidD3syaYeJK4qnPYYcYm8RBDbbDcwQwr6TGRDlGCDCUrDyvFM9KxrH46qPwIbOqCxYdYp+vVOOvDVL+mct4PxUoFyobWFUoBnh7PJzrlLeSZJPb8d3NfNGufE4vPYeaAu04aBncA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by DM6PR11MB4675.namprd11.prod.outlook.com
 (2603:10b6:5:2ac::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 17:05:32 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 17:05:32 +0000
Message-ID: <755a855f-50aa-4337-a991-78b64ef07ae3@intel.com>
Date: Thu, 26 Nov 2026 22:35:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] drm/xe/hwmon: Enable fan curve control support
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-7-karthik.poosa@intel.com>
 <sashiko-outbox-230573@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nilawar, Badal"
	<badal.nilawar@intel.com>
In-Reply-To: <sashiko-outbox-230573@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0283.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::16) To FT1PR11MB960200.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|DM6PR11MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3201df-a467-4a2f-1804-08df4bdf7aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|22082099003|18002099003|56012099006|4143699003|5023799004|11063799006|261022075727099003|261026140227099003|261022105027099003|261028144727099003|261022113327099003|261009223027099003|261021121427099003|261102123227099003|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: aFYN+ukY+yNfB4nFJaDidtQkPOs5sWby6sUb8tFMBNYK2jo7sm3MIw4HQDvEmZz4J34t/fIiTIxY28rd3QJmLNYoOrV/Zvp9nlJNgARGenYmIE8h40A49Svq93ESwkPUR7XTV0ih8xOk83CAw5H5lsFdmH/5bkDm5C6u2aIr6NDhzvxtao1biuGDflGLKBbaNmC8Ys3QDsfXGWy34qYQyobwL/l9UQmV4IjDvMZB1wu+T2zO+xVbSJ5/Emh1xGMVEUzIuJkJ6omdOwPeeYaPLNkegBW7SFa3kpZ+8TgCgF4Eg8wRCc7w+qDRIvbZwoUGvtIx9Zi0t5y6gZe3VFf6tAZupMCOyfpBKxBkCywNF+MeP8C+aKfSb96RsHHn/SDdyZ+xUyrKZ8csp7HVCCU8414BAYNo7B/XZ/MoXkF23Tg3/YGqB/DMDTvzA/MaM85uNzmG4hILqSb6kSDKpXHAr+eoT/xIijgdSbrWEis++0B9FiU6rQ9dN4rasW9NqvKrTzrTrOLmcTQQ6IioGB9AlCnoyW3a9M55nP86aRr6BPphr+KBXiNZeQU0t6PG2WsVGEJLs9SeDJNaUBnhxcl1Gu9gHw/W+T9rrdxse6+aARrEYjxbEGNg3z1Umr95ZitO1hTkj7lYeQA0qUpEzbIZnDE5cGMuZZgR+m1xpNJPCfo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FT1PR11MB960200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(5023799004)(11063799006)(261022075727099003)(261026140227099003)(261022105027099003)(261028144727099003)(261022113327099003)(261009223027099003)(261021121427099003)(261102123227099003)(10067099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWJBSFMreUdiZnVYQjFoaThBSFdvOC9PdU9GVGZ5b2gxTUlkeFRDc25oenhR?=
 =?utf-8?B?cFM4N0FRNkJpNlYxNjRkQys5c1dzQy9FdkVsUmFhcVNZaTJYUHpoT1JjQith?=
 =?utf-8?B?d3kveExwUG5IVFRkUXJodkk1VlJiazYxTjdFemxxbWxucVZ3MkNzVVR3SWVZ?=
 =?utf-8?B?OHdmdUtkVEtldmVuTlJTNmU0aDk2Z0d2dkZ0OWNrRnhtdG05TFVtS3BQR1Zm?=
 =?utf-8?B?R3o0KzJ0RFpRYWFEUk5tWEwyL3JhVHJBWW9mejVhR0IzUXFYM0Y0cGx3MlVs?=
 =?utf-8?B?aFArb2pKRHFuWE1Xd09pWDhVVUxiSU9lTHlEQnRNY2trYnllZzBzY0dJYjJW?=
 =?utf-8?B?QmQ5UXdnRjdrcVg3SDQyOGFWd01OSFZEYjA5LzEva1gybGJwYjNzaEdFNkFJ?=
 =?utf-8?B?TmphaXM1QndTdkJvQlB1ZGlJMkRzY0Q5dVpnUGpObXhielJYQkhxaFA4QWp6?=
 =?utf-8?B?UE5KUTRxUDRGeXdIdXBGbU9PcVBOWXp3NkVyUkhITXlkckkzWDZWclRTM3RT?=
 =?utf-8?B?dmsxVHIvQ29sbUw0UW5YczJpVkl6RUdRMXZxb0dwVmMyNWI1cjZ5YUZHRU05?=
 =?utf-8?B?YlBXVUExY2pXWnRzbXBBdmJnUEJHeTJLY1I2ZHBmR1VlZmxTemMwZ00vcmJ3?=
 =?utf-8?B?V2tpZG8rSW5NS05zampxeERqNUVsR2x5ZXcvd0lyaFBaQUtMZXdiM25mZnJT?=
 =?utf-8?B?Z0MxZHluR2ltYndVZ25LUDg1U21IUHpIa0pWZzl1NnBHRWVrbE5YUk1LdVJl?=
 =?utf-8?B?T09jbzNaZFJZNkR2RlhDWGE4V2o1Vk1lckxMejFEdFF5TnhXMjZwWjE4K0Mw?=
 =?utf-8?B?a3k0aHhyWlJib3NEWkwxelRjZWxveDdGWitlOWNxd1A2VCtQTlhDbWpJRVpR?=
 =?utf-8?B?SVl5UXpBeHM2TWN3Y0hHY3hGeTNSK1FYckZtK09HZDhQWWpiUVhuRk5KMGsy?=
 =?utf-8?B?ejNTTlFONkpiaU15WlF1MVEzNkpRK2F5VjJKTTFBdXpKK3dJWlFFbm5PZll5?=
 =?utf-8?B?VHNEU1lWcW4ybGltdU5qY1NuVUFJdUpRelU0T1o0ZFJYWHFnVllzdjJnVS9K?=
 =?utf-8?B?Tm5senZQK2tOS3l1V1plbVpRQ2JzQXI1MjVqU2RwS3Z2Y0tjN3N3UmhtM3Fu?=
 =?utf-8?B?enJxc3RLR25sb1J3eHMxWkkxeUN2NXcwTkpPTmV2T1Zkck9NdHl3cWFsRERy?=
 =?utf-8?B?Q0c5RVhXNmt6a3dQMjBFNVVhQWpndXRsaWE3MjJCVWYwUUNoNWFqSFp1clYz?=
 =?utf-8?B?MDZLMGdQb3UyM0VwdmlQN2ZPNGp1bWs2akpXODJJbU0xb2R6aCsvMktCQVR6?=
 =?utf-8?B?UGg2a09mNmNqcEl5M0s5VGFYT3VNZ3hNSytYWU0xamNyY0l4eWptdHFuQ01T?=
 =?utf-8?B?TUlpYUxOeFhiTlk2ZzlaOW9SUU5LUkRCZk1mc3pjUStDS2RpV05oU28xWG45?=
 =?utf-8?B?aGh2ZHVBWjNMYVJpbXpUTG1RNkgwWVhTcEZzY1MyR2VZdytJcFhmdHE2SnlX?=
 =?utf-8?B?ZGRMM3E1ajJ2L0VrVTRoNE9YbkhPN1MvMmFNRkdiVWlPYTB2NEo2N0Z2a2Ra?=
 =?utf-8?B?Z0Q1KzgzS1B1ay82YkZTMEVmQm5FaEVUSkE4RllmSS9iYlRsWGUwMGNiT1I4?=
 =?utf-8?B?TGlVVW8vYWlKREdKSXVLdkQwNXVZMGM2TVh3alFQTUJJVGVPaVV2UkFMYlBo?=
 =?utf-8?B?TXVhZkEzNnE2cm84RWx3YjVLR2RDa0VtcFF4dngyK25oeWJ1OFNhZ1JZTFVx?=
 =?utf-8?B?N3FWeW9Hc3o1NUtBaDMwVllDL24xNWdVTi94WFJSb3ptWm9PM0xLbjc4Yytk?=
 =?utf-8?B?S1VBUklBaUJhQ2JKT090aXQ3Wm5meWNLUGNkd1lXcFJQdllaQW9tTTdMMjR4?=
 =?utf-8?B?NlQwWXZ5VFlEZWgrNU1hbWJrMkpRcktKNk41WWJEcmF5NU5VTTlxNEx2MGU4?=
 =?utf-8?B?RytnTUJjclUxSzJCa2dobFdJWGZnRDBtL2dIOUJpUFo5T1FzZjhwbGtlU2lU?=
 =?utf-8?B?YkZaWjMyK01mdEhHM29oUWpPMGY4Q1A5UEdYU2xMWkpEaGI4RWlMZXlRelgx?=
 =?utf-8?B?cFZaUUsrcmpYcXllRHlCSG9IaEdJS1JDcERuNVJVK2luQ05URVBGOEpGRTIw?=
 =?utf-8?B?NnQySC9DQXFtV0lqZnFQQWlkMThTRE81SnNOcnQ3a1VENWlPWHNpaFIrN2R5?=
 =?utf-8?B?SnBsc0hIcHR3OG1MdXlWRDNqQWxJcGJJRklWSXZhcVNHdk1ncGhGOXNWcGRD?=
 =?utf-8?B?eHkwRXVJT1pDcHNIRDh3dTY4a1BzZzFoaEpVTXAxZTQyU1MrYXF1cWFDRy9E?=
 =?utf-8?B?ZU4rRS81RmpDY2hWZUp0cEFodkg5ZTdWRmV2VFhId0hCSitlV3Z2UT09?=
X-Exchange-RoutingPolicyChecked: JF9SM7OuNFiY7OMfB304x2YQWnalv49kjVCPuASU79qFruXpFm34a5TgyN8fjJFf1rVsMXuhWUrWpZd3GrCtOzMNBYI3iiwtXPbhXEXec52LX+tFiHlZCdDtuLHCxYdy8Zz4/XuTQ/FMHiK51vurG19D/moro/nwr3R3GNb/dfg/hyc7owqimWzFGN4bUJpQLkP0G2vY4RkNezh+duHIQdFQtSsFK8nPL8t2ar1L5Eml8zp/ut+caMpki5bq2RHPWV05cHvnyEMxrR6cX6K6XSqtw2EkFQpKvbY1BOCaX282yJMr4s4GOsNuyO37ryhvHPY9Hp12jPBB0kLZaYGNIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3201df-a467-4a2f-1804-08df4bdf7aeb
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 17:05:32.2726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fD7Xpdu4KsrzgSJGNXmRhwD07sBhOdruiiG6Bgy+BwQIEMrB+NvapQJ8HoqV8lpoyI4yrSfoOAyxVRLmtLHelg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
X-OriginatorOrg: intel.com


On 24-11-2026 11:32, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential
> issues to consider:
> - [Medium] drm/xe/hwmon: stale staged state on error in
>    xe_hwmon_update_user_fan_point()
> - [Medium] drm/xe/hwmon: missing is_full_speed check in curve store
>    callbacks
> - [Medium] drm/xe/hwmon: min_pwm clamping bypassed in
>    xe_hwmon_pwm_auto_point_pwm_store()
> - [Medium] drm/xe/hwmon: overflow and post-rounding check in
>    xe_hwmon_sysfs_to_hw_val()
> - [Medium] drm/xe/hwmon: live pcode count vs cache mismatch in curve
>    show callbacks
> - [Low] drm/xe/hwmon: missing ABI documentation update claimed in commit
>    message
> - [Low] drm/xe/hwmon: xe_err() and 0-based indices used in curve store
>    mode logs
> - [Low] drm/xe/hwmon: guard() mixed with goto unlock in curve sysfs
>    callbacks
> --
>
> commit 148c3dbca37416a6517d9d7801eb5f432ec2b872
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Enable fan curve control support
>
> This commit adds hwmon sysfs attributes pwm[1-3]_auto_point[1-10]_temp and
> pwm[1-3]_auto_point[1-10]_pwm to stage and commit custom fan control curves
> via pcode.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 59a8521316c2c..77c4d1b0ecaef 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> @@ -1337,12 +1423,354 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm, boo
> [ ... ]
>> +static ssize_t
>> +xe_hwmon_pwm_auto_point_temp_show(struct device *dev,
>> +				  struct device_attribute *attr, char *buf)
>> +{
> [ ... ]
>> +	fi = &hwmon->fi[fan];
>> +	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
>> +
>> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_table);
>> +	if (ret)
>> +		goto unlock;
>> +
>> +	/* Slots beyond the active curve can still be staged for the next curve. */
>> +	if (point >= point_count &&
>> +	    (active_table != USER_FAN_TABLE ||
>> +	    !(fi->fan_table[USER_FAN_TABLE].temp_staged & BIT(point))))
>> +		temp = 0;
>> +	else if (point >= point_count)
>> +		temp = fi->fan_table[USER_FAN_TABLE].staged_fcp[point].temp;
>> +	else
>> +		temp = fi->fan_table[active_table].fcp[point].temp;
>> +	ret = sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);
> [Severity: Medium]
> Should xe_hwmon_pwm_auto_point_temp_show() and
> xe_hwmon_pwm_auto_point_pwm_show() use the cached
> fi->fan_table[active_table].point_count and check temp_staged / speed_staged
> before falling back to active fcp[point]?
yes cache table point count should be used here
>
> Querying point_count live from pcode via xe_hwmon_get_fan_point_count() while
> reading point values from the software cache can desynchronize the bound from
> the cache:

Yes that why we shall read point count also from cache.

> if a previous table update or stock table probe failed and reset
> cached point_count to 0, pcode can still report a non-zero count and cause
> show to read unpopulated or stale fcp[] entries, and if stock point_count
> exceeded MAX_FAN_CONTROL_POINTS (which xe_hwmon_read_fan_control_info()
> clamps), xe_hwmon_get_fan_point_count() fails with -EINVAL. Also, checking
> temp_staged / speed_staged only when point >= point_count means staging a new
> value for an existing point (< point_count) still reads back the old active
> value until the whole curve is committed.

I think fan-curve points shall show active table values untill staged 
values are committed to hardware.

hwmon ABI says these attributes define the PWM-versus-temperature curve, 
but it does not specify staged writes or whether reads must return 
pending versus active values.

Rodrigo, Badal, can you share your comment over this ?

>
>> +
>> +unlock:
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int xe_hwmon_update_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u32 point,
>> +					  bool is_temp, u8 value)
>> +{
>> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +	struct fan_table *table;
>> +	u32 point_count;
>> +	int ret;
>> +
>> +	table = &fi->fan_table[USER_FAN_TABLE];
>> +
>> +	if (is_temp) {
>> +		table->staged_fcp[point].temp = value;
>> +		table->temp_staged |= BIT(point);
>> +	} else {
>> +		table->staged_fcp[point].speed = value;
>> +		table->speed_staged |= BIT(point);
>> +	}
>> +
>> +	/* Wait for a complete prefix; (0, 0) ends the curve without becoming a point. */
>> +	for (point_count = 0; point_count < MAX_FAN_CONTROL_POINTS; point_count++) {
>> +		if (!(table->temp_staged & BIT(point_count)) ||
>> +		    !(table->speed_staged & BIT(point_count)))
>> +			return 0;
>> +		if (!table->staged_fcp[point_count].temp &&
>> +		    !table->staged_fcp[point_count].speed)
>> +			break;
>> +	}
>> +
>> +	if (point_count < MIN_FAN_CONTROL_POINTS) {
>> +		xe_dbg(hwmon->xe, "fan %d curve needs at least %d points, got %u\n",
>> +		       fan, MIN_FAN_CONTROL_POINTS, point_count);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = xe_hwmon_commit_user_fan_table(hwmon, fan, table->staged_fcp, point_count);
>> +	if (ret)
>> +		return ret;
> [Severity: Medium]
> When curve validation or xe_hwmon_commit_user_fan_table() fails here, does
> leaving table->temp_staged and table->speed_staged set wedge subsequent curve
> writes?
> Because every bit in the completed prefix remains set in temp_staged and
> speed_staged after an error return, the next single-attribute sysfs write
> immediately sees a complete prefix and re-runs the commit check with the left
> over staged points instead of waiting for both temp and pwm of the new curve
> to be staged.  In addition, if xe_hwmon_commit_user_fan_table() fails in or
> after xe_pcode_write_batch(), pcode's user table may already be partially
> overwritten while table->point_count is not invalidated to 0 as in
> xe_hwmon_set_user_fan_pwm().

We shall clear the staging masks so that next curve starts fresh.

If table write failures happen we shall reset the table to stock table.

>
> [ ... ]
>> +static int xe_hwmon_sysfs_to_hw_val(struct xe_hwmon *hwmon, long val, bool is_temp, u8 *out)
>> +{
>> +	long max = is_temp ? U8_MAX : 100;
>> +	long hw_val;
>> +
>> +	/* Temperature is in degrees Celsius, speed in percent. */
>> +	if (is_temp)
>> +		hw_val = DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
>> +	else
>> +		hw_val = DIV_ROUND_CLOSEST(val * 100, U8_MAX);
>> +
>> +	if (hw_val < 0 || hw_val > max) {
>> +		xe_dbg(hwmon->xe, "%s value %ld out of range\n", is_temp ? "temp" : "pwm", val);
>> +		return -EINVAL;
>> +	}
> [Severity: Medium]
> Can validating hw_val after DIV_ROUND_CLOSEST() overflow val * 100 and accept
> out-of-range sysfs inputs?
>
> Because val is an arbitrary signed long from kstrtol(), large values overflow
> val * 100 or DIV_ROUND_CLOSEST() before the range check and can wrap into
> 0..max.  Checking after rounding also accepts out-of-range inputs near the
> boundaries, such as negative temperatures in -499..-1 (which round to 0 and
> can trigger the (0, 0) end marker) or pwm values of -1 and 256.  Validating
> val against 0..U8_MAX * MILLIDEGREE_PER_DEGREE for temperature and 0..U8_MAX
> for pwm before converting avoids both issues.

yes, this shall be address with out of range check

longmax= is_temp? U8_MAX * MILLIDEGREE_PER_DEGREE : U8_MAX;
if(val< 0|| val> max) {
xe_dbg(hwmon->xe, "%svalue %ldout of range\n", is_temp? "temp": "pwm", val);
return-EINVAL;
     }
>> +
>> +	*out = hw_val;
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t
>> +xe_hwmon_pwm_auto_point_temp_store(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   const char *buf, size_t count)
>> +{
> [ ... ]
>> +	guard(xe_pm_runtime)(hwmon->xe);
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +	fi = &hwmon->fi[fan];
>> +
>> +	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
>> +		xe_err(hwmon->xe, "pwm%d_enable not in manual mode; cannot update temp point %d\n",
>> +		       fan, point);
>> +		ret = -EINVAL;
>> +		goto unlock;
>> +	}
> [Severity: Medium]
> Does this check allow staging and committing a user fan curve while
> pwmN_enable is set to 0 (XE_FAN_PWM_FULL_SPEED)?
>
> When full-speed mode is enabled via xe_hwmon_set_user_fan_pwm(),
> fi->pwm_enable_mode is set to XE_FAN_PWM_MANUAL_USER_TABLE with
> fi->is_full_speed = true.  Because xe_hwmon_pwm_auto_point_temp_store() and
> xe_hwmon_pwm_auto_point_pwm_store() do not check !fi->is_full_speed, curve
> writes succeed in full-speed mode and silently clear fi->is_full_speed = false
> on commit, switching pwmN_enable from 0 to 1.
yes, we shall not allow this in next revision
>> +
>> +	xe_dbg(hwmon->xe, "staging fan %d point %d temp to %u\n", fan, point, temp);
>> +	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, true, temp);
>> +
>> +unlock:
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +	return ret ? ret : count;
>> +}
>> +
>> +static ssize_t
>> +xe_hwmon_pwm_auto_point_pwm_show(struct device *dev,
>> +				 struct device_attribute *attr,
>> +				 char *buf)
>> +{
> [ ... ]
>> +	ret = xe_hwmon_decode_curve_index(hwmon, sattr->index, &fan, &point);
>> +	if (ret)
>> +		return ret;
>> +
>> +	guard(xe_pm_runtime)(hwmon->xe);
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	fi = &hwmon->fi[fan];
>> +	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
>> +
>> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_table);
>> +	if (ret)
>> +		goto unlock;
> [ ... ]
>> +unlock:
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +	return ret;
>> +}
> [Severity: Low]
> This isn't a bug, but the four new curve show/store callbacks mix
> guard(xe_pm_runtime) with manual mutex_lock(&hwmon->hwmon_lock) and goto
> unlock; using guard(mutex)(&hwmon->hwmon_lock) would avoid mixing cleanup
> helpers with goto-based unwinding.
ok
>> +
>> +static ssize_t
>> +xe_hwmon_pwm_auto_point_pwm_store(struct device *dev,
>> +				  struct device_attribute *attr,
>> +				  const char *buf, size_t count)
>> +{
> [ ... ]
>> +	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
>> +		xe_err(hwmon->xe,
>> +		       "pwm%d_enable is not in manual user mode, cannot update pwm point %d\n",
>> +		       fan, point);
>> +		ret = -EINVAL;
>> +		goto unlock;
>> +	}
> [Severity: Low]
> Should this and the matching check in xe_hwmon_pwm_auto_point_temp_store() use
> xe_dbg() and print fan + 1 and point + 1?
>
> Logging at error level lets unprivileged-style invalid mode writes spam dmesg,
> and printing the 0-based fan and point indices reports "pwm0_enable" and
> "point 0" when writing to pwm1_auto_point1_pwm.
ok +1 will be added
>> +
>> +	/* Speed and min_pwm are in percent; keep zero for the (0, 0) end marker. */
>> +	if (speed)
>> +		speed = max_t(u32, speed, min_t(u32, fi->min_pwm, 100));
> [Severity: Medium]
> Can an active curve point bypass fi->min_pwm when userspace writes a pwm value
> of 0 or 1?
>
> Both 0 and 1 convert to speed == 0 in xe_hwmon_sysfs_to_hw_val(), so skipping
> the clamp here leaves speed at 0% and xe_hwmon_commit_user_fan_table() writes
> 0% directly to pcode for active points whose temperature is non-zero.  Also,
> if a point has temp == 0 and userspace writes pwm == 1, rounding speed to 0
> without clamping turns the point into a (0, 0) end-of-curve marker.  Clamping
> active points (0 .. point_count - 1) to fi->min_pwm at commit time after
> identifying the (0, 0) terminator would enforce min_pwm on all active points.
>
> [ ... ]
I’ll preserve nonzero PWM inputs during conversion so they cannot 
accidentally become an end marker.|min_pwm|is no longer supported, so 
the driver will not apply a minimum clamp to active points.
>> +static void xe_hwmon_init_curve_attrs(struct xe_hwmon *hwmon)
>> +{
>> +	int fan, kind, point, i = 0;
>> +
>> +	/* Per fan: all temp points then all pwm points; is_visible relies on this layout. */
>> +	for (fan = 0; fan < FAN_MAX; fan++) {
>> +		for (kind = 0; kind < 2; kind++) {
>> +			bool is_temp = !kind;
>> +
>> +			for (point = 0; point < MAX_FAN_CONTROL_POINTS; point++, i++) {
>> +				struct sensor_device_attribute *sda = &hwmon->curve_sda[i];
>> +
>> +				snprintf(hwmon->curve_names[i], XE_CURVE_ATTR_NAME_LEN,
>> +					 "pwm%d_auto_point%d_%s", fan + 1, point + 1,
>> +					 is_temp ? "temp" : "pwm");
> [Severity: Low]
> The commit message states that this patch updates the Xe hwmon ABI
> documentation for these attributes, but
> Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon is not modified in this
> patch.  Was the documentation hunk dropped by mistake?
Yes by mistake it got dropped, adding in next revision
>
