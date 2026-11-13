Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794608851;
	b=fEwkhdcDz3r3lY5rbQMoFjvGRqXBD/yPfbZfQu73SMp1Vn4FVFeOG7Vgn8YybpjrQHuv
	 oO7BpOsR9JBoZbwsZgkLMjEsBoQtzeMLvva70P93uk4SsnXzXXsVAn+sQJiPWaSs6AgSA
	 96+bVl9WddDdX2ID6mpT8OUimxoRvuIArT3RE11D4GhJEsjnL6bRnJBvi5KW+mYMxePUw
	 1UqK8Cfe80qIGRfatSb1bmf/d8k2JPhn7/5SJbTM+K/Mj+ZltdLOwfBwvZXiDKl3SxI35
	 MsKOBw8mAkGkGRENSTW/nPNNnrKww2gX1XEiJxPalUJT5ZKruY7ZkRy7w0chFB/h1ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608851;
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
	bh=Th79lCgQI2zwV6P3lWpVMylZrmJxD8Hm7W7asDrELN4=;
	b=b3wMdQAbTLY6wybZlyiQmaHk0xbd/Bivx9B1QPEc0MWw5eiTSTt2c9N28gHRnKze/eBG
	 7umpY6UqjRbb2Lj54kjwnvPhdJXEn1rm3IVxo8tADBIjYDFd/Ryrvq4BwSb5MtLbR1gnA
	 C0LocIYy6Ou7SG9hetnVcu9UieZ+ghBRPosmQcN2WbRtmcTgWTkEaMLDaMom/yJiACN1t
	 U0tckT4VGIv3Uizx7Wa0N6fvWpMCKxIzEyyV6W3CTUGlMKpHFtrnt4Z4g8VSJrSO6M5YO
	 I53S9FcTsBnWVlu3iZHGH3ku25g7dUnfUpfO35e1OOTojC+qyR7C2dAnCvfr7LXCNDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UPn6N2j2;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=YJWbBsKJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D0D606A882
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 22:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D0D606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UPn6N2j2;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=YJWbBsKJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794608847; x=1826144847;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+abkPE5mhdKWwWsMCcrWT9s1t0dZxYlXtUt60hyVUfc=;
  b=UPn6N2j2f2NZOU+fZ4fv3QIHVY9sEXh3+lReW7R8NezJh4G265aaCAJS
   myrVb6oknPebxXc5G/9ZT3G41mktbyLUU2UdrTKTXTnmHT37RfCcEa38e
   zAk5uw9ORnZtFEgJfULywcz8RtRl1FqKbvRB8qRfk2PmxMdJVY4N0l3t5
   UakNIN2sgeSzug3rnVDe/iSPu7m6XQaqjkwBgVi3Xf7MI0+xpKygjnSNe
   jVIvfzWUrdgC9dGDnLOQvgK0Nq+xjGrMZU0+twE6TDgL/4GvYjBCxYmoz
   RghFbpYqFmdBseuQJWc+toKeS7o7OWG42OhyLUyLrbqMk15swnd0WO59C
   w==;
X-CSE-ConnectionGUID: 00yntF0pS4S4mZWMxNCuCA==
X-CSE-MsgGUID: p9f4fVU0TnuugYrk8hs2Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3504022"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3504022"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 14:27:27 -0800
X-CSE-ConnectionGUID: cjYilp4XSGuuvem5kkVwpQ==
X-CSE-MsgGUID: RbrleesARLOf0wZAgLqm1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9199517"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 14:27:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 14:27:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 14:27:26 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 14:27:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkVOiHRuYD1Rrw100ggOZf5YpZFkJf8hpeLbUpplzIoxnrJq2htXGj9VQPAnyNi1DrpvbH1/aCu9UY++2s1cixYoGF/6xJyoBv6COqVUkNTfxnsihMP/S56Y7QgoQnbsnr1vWBU3O7qbB9nbloSqgtzVQUI98CXoHBMs7BGXR8A7Ek+KfnY67gIwzYrPMDm+SfN2fkUt3o87x8qB1DVvUh6n9xrcVYJKqqxOsxHxQw9ZgizYCT8XkEXLfppcCWOgp2mluoQiwFNZZPbrbm8kzWEjI7V+8pbXt1DzJO+yRGLixLdDZ04b/Bt9xNDJtnSOAwub+o9gYrSi0mnqZ6ZTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Th79lCgQI2zwV6P3lWpVMylZrmJxD8Hm7W7asDrELN4=;
 b=Hz7UAi/K8rvxXepATnEeP2LrKaAnd1/K3afjJjgfwTaKZpxRK+NNT8Fm0hjrA1Ucw1PJgmgN4phRnumP4LOTcbuSYRGdUIP7GEQsCnWY9wllpmzI4XCJlvTRXyfqZDTLER74ChY2kz0AIMX67V89WrwCH17nYhrI3GeD0gYqF0m0opTrxDTv73GmyDvtFf8iCcnvbbqL70v3jc8pFwF6KUzEpj9RTLSagYAoudSApiucnSBN7Tpf604O05IS96Pd76ar07wGZiTQGir878qwyBm3uHUnssvHo9eLzUM0vxT5iNJzXO37lFR1MLhTdFJaZpKSaqs75Z/P82buxUL65A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Th79lCgQI2zwV6P3lWpVMylZrmJxD8Hm7W7asDrELN4=;
 b=YJWbBsKJ6aSB41q0hsOAhEtfsHHLZHYJIXpGcT3sbCwKVEYYj24CUAl5n8oam7yNrW5wsdStcK2bzoTpzpCr/V30yqA4yrl7k3ZITwCrKBqx01sWS4hA+GmYtRmgLWYSl7gfT2/944dxEyfrDAp9vbe4ouoF9s4m29mvNNyqU0A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 22:26:47 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0592.012; Fri, 13 Nov 2026
 22:26:47 +0000
Date: Fri, 13 Nov 2026 14:26:01 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 4/7] drm/xe/oa: Skip OA HW teardown on a wedged device
Message-ID: <aveOefedREMKMgzt@soc-5CG1426VCC.clients.intel.com>
References: <20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com>
 <20261110190052.3514226-13-umesh.nerlige.ramappa@intel.com>
 <sashiko-outbox-207649@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-207649@kernel.org>
X-ClientProxiedBy: MW4PR04CA0291.namprd04.prod.outlook.com
 (2603:10b6:303:89::26) To DS0PR11MB7408.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: d306e868-8878-4feb-e9a3-08df41d53389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|11063799006|56012099006|22082099003|18002099003|261022105027099003|10067099003|261028144727099003|261026140227099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: Z38DhBi+PAh8tp1SQg6NMmDyhSXYfmehwGFFoziiZI9T7WY/hILWrmvPQhew2PlKctU5V8GCvsNiUyHSlhz67GBJ2Sno9PrMOiLNvTcbbrawLcx0nymdY4YZKeTuA9lOWFdN4/0tTzSYPDK4vBfeYOnYMXeS6ph0KVXNQZMoB3fq5DnjZJzk/8sXYnoS98Sx0SgVXzxY8eDp4Rc13fXU2guutFHUW5PjF7Hpmrum99jj7DYDCqDvMHqQuPnQ7p3KNTg1zwz4hhnoqINAzoWmHrVKnJgLrrnMhxgCZ/ANYLgkT4s7FzdRKGFG4a/FmrIPxU6dKdmmXf48OnTjaSWSaj6gBRFKmUhky1+XwOa5ILItu+uGL6yuCp/AiqvAAerUQ8T91G0RVdmmQt4DGn83WxPGKDI891YpatggS//ola56ma7bUlcz7tF3U2mJycuzDcwOvgVA7PWD+PrLP/g60k0e+6cBdKwXlA8qg4N5A7XXWbkT4DGXKc/MrsZcddwkOdQBwosZtPMe0jgvbDcmvUaI1synAq0NRL2cc4f/3KUhivpSQO+9TATX0PLZ9lg4JVO6d0tAxsz8vnifWswQ+PPVzvDMgdklpzygz75U20c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7408.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(261022105027099003)(10067099003)(261028144727099003)(261026140227099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmRrUVA2YVhVYWtnWWdFQjhwMkZidkpCOS9zTFpaYisvZEJ4Zis4NEg2QUJq?=
 =?utf-8?B?aVJCWUZLaTkwM0FqRi9TUzhRb1dKdzJQS0JlYzUxWmxmaC9vSHZCMDdJb3FO?=
 =?utf-8?B?dkw3dnpuVGpMalVwWVFoV2FuUVVFSXBRMURZYSt6WkxmSFVFVGE0bGx2ZENS?=
 =?utf-8?B?OUIxcG92SXBxTVpLQmR1aEp5cWxVQ3ZraFFxVnlKQ0dKUG8yK3I4TVJVYTZ0?=
 =?utf-8?B?QzkxWWhWWGgyMGVFTVRWempyK0l5T053UXNnTU52bzljZjNOL09YMU1IZzNN?=
 =?utf-8?B?Qk0zVm90cThQVktoWG5ydWxtdSttYytwaUV5Wm5BQVZiQlhaR3FuemR4Nkhv?=
 =?utf-8?B?MGlOVjRoWkpYaUF2SjAxakxnT3MwRnkzTW1wWm9wZjRGZHpvWUphSVFWU2xw?=
 =?utf-8?B?amRRNmxnUFg3SGFpRWJUR09hNnh3WDg4VkJZMUNVY2VCZXU1L3NZanRZOUtW?=
 =?utf-8?B?Zzc3cWNVb3hoQm93SmJTVlJ6amlqbUV0akhyQllXYk1yS21iekp5UU9ua0t1?=
 =?utf-8?B?djVOWEdMZUhsbzkxa2lLNkx0RXRvV3JjdWc2TTdVcUN3bmlqMjhoMDR2TnhC?=
 =?utf-8?B?UVZCRG8wNk9Ud1BxNVpMdXE4ZnlhcGNVQlNJN2drejlyVWNwN0JERDJuQVY1?=
 =?utf-8?B?UWorZFJTK0tHbitxcldlaVIzRFkwQ1BFQU5IVGF4RmMrZlNsZjltdnVCa1Zk?=
 =?utf-8?B?a3lkNkgyTVZsZDJsYUFpQTdTSTNlN0dUcEw5MDRGS2IyeXpTZTdXOXdsby96?=
 =?utf-8?B?T0ZXSDhMQmUwUlRpcG44aXRpZUUwa05pRENYSURvS0xyVDZ2QzR2TXVZWEUv?=
 =?utf-8?B?ajlQQWJaOFBRYm1rcVVJcTU3am1xb0tWSFlMZUcxZnYxaDc5N29nVS9VZGhS?=
 =?utf-8?B?aVovcVYxcG1HVUZLS01Sd0UyYU9uQ1M1dVlMSzRlbkh0MVB0YURXaW5ncThs?=
 =?utf-8?B?WlB6cHZYL1FNZ0NwUlEwTEkzNlN4aHh3TXZTWEsxdE5pY3ljNWRLclB1UFZZ?=
 =?utf-8?B?UHhlZ0dNOGxvU2gzdWd2bmxoQ3BnM3RwMmRMS2x2ekdiZjd0U2Q0cHNabFNZ?=
 =?utf-8?B?V0VaNHRyWDJMcDM3ek1qOHIycDZoNmh2cllqL2hTVzd1Q3ZQa3hYbGtuSUND?=
 =?utf-8?B?MFN3UGRtYkxHWVo3VmZQcUtNOEc3bXc3SHF6MXhlSnZEelZkOXhmWTFKeHl1?=
 =?utf-8?B?UWtvREl0QlBZYnhKUTFHbUJxVVFWYkY2Y0g0NDNDY2N2L3Ewc1dHY2YweWts?=
 =?utf-8?B?eElRdHEvRDREVnhLZVQyaEljVXhzZllidnRyOHBxbHpiS3hpaHE5d1YveDlU?=
 =?utf-8?B?ZDUvcFJTYU4zMm5zb3hrNVg3eXE1c1hOaE9kemx6Qno1cWVFLzdMWmJQeHAr?=
 =?utf-8?B?czN1bmkzcHpNNU9ZTU92TjhObTd6bURBVDRJL1hOeHhvWC9vVmRNYVVoODQ5?=
 =?utf-8?B?eE1JU0V4NklFOC9QTS8yNXJ4VFZkU1daV1N4Rk5ZdC81UldDZERkOWRRVDU2?=
 =?utf-8?B?K3puWS9KWVZucTcxbGo3L0ZibFZDMTYxRzcwNy8vNE5jOCtCVFU2cW4xUG5U?=
 =?utf-8?B?eWdHRlR1YWI3VzZ0TGc3REpubGJoN2VsOSsxWW0wd1A0aEl6eHFFSVIxY0FH?=
 =?utf-8?B?L1F6TWVSckh0MDJKTTJYdUxKMmhDRXBQN1BZWWx4SHgxZHNlSkVRNUExY2ND?=
 =?utf-8?B?dGNPb29IZGxvaSsrUkJvdk81aHlHdVBieGFkbGpCZmN4MEI2ZTZjMFFBVm5j?=
 =?utf-8?B?Q3ZzTnhycGYyOTN1aUxsMTNFSlEzQXpxRUlZNzQ2WVhNalhuaUp3N1RpaDhH?=
 =?utf-8?B?Y1IwU2FHc0M5ZG9DVzJkaTE1OUN1ZlpTNXlodWVKV0QwbWZoQVRIdlRIYWQr?=
 =?utf-8?B?RU52U2EwZHFVWVVsS09ZLzduMzArMkJPY2szVjdFTG8zNDAyWkJaNTIxa1Bo?=
 =?utf-8?B?T21DVCs1alBlOEFUYmYvYjZNYldadiszL2ZVNEhDVkFXMytZdFBrVWRQTmVK?=
 =?utf-8?B?Y3NUYmhuZi9oR3Z1blRlMDBIWHI4dG9xa0NTVXB4bCs5ZkhoNWg4bVhHQnND?=
 =?utf-8?B?ajhDZU8rRytqQ2J2ZUNvYUVRbWljYTREMUFhdHkyNzkyOCszbkR1WjlOL2RN?=
 =?utf-8?B?Qmx4K2xiTGVHTjdTRnVEN0hrbzJRc01MWGJEYVo1UUR4ek9uajVqYUw1SCtk?=
 =?utf-8?B?YjlEamJwTzN2YjVkTXZSS0w5K1ZIWmZqK2ZnM1dURTVHK2QvY3J2VzNDK2I0?=
 =?utf-8?B?ZFRmM2V2bHlpOE5NS1RZYlJwdHJqcWcxMXphd1o3K0xoTzVwVThmMGZmQlpo?=
 =?utf-8?B?R1R5emtDRXNIcWxlYmdLemNRQy93QWVIanJVaGJGZHVKWW15L3p5SnUySEFs?=
 =?utf-8?Q?Lsba5sqXJgd9+870=3D?=
X-Exchange-RoutingPolicyChecked: fHOIpFE+827CfsrhlKWuaQ7ub3enuQkySKr5V+sQjD680S1V8pnRiS6MQx2Ty4qVhcnz6hDlWxlZF8HHmPNtbuxEuZ8Dcug5Z1ztoijL0h2hCtWxhyEL+0FFqr80kaJAO92N8EwcGJSK1EFkVgOauZCkdhj6vMUO1Fin0vNb3zlkz/x23UCG2pGO/ikl7gQCAE3msuurjEaj2X6oTwZUae/Ae/Xw3ioQ6y77+b3kEbfnTRzT1K0PJFdX1WnIyra7S6Ki/zufBW+Imgn5WQa0Sy5O9pVMk5kBYqDncZcIpFsK2bFUdfRrqKbLadsJcHam2/NxCjmZQieMGOjFqH1zug==
X-MS-Exchange-CrossTenant-Network-Message-Id: d306e868-8878-4feb-e9a3-08df41d53389
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 22:26:47.1497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQfNWS2S6PeXFEueWZBMLNKHiGe0mcsrmEAp0om9Q6Jcc+Afd93Qb+SUKgPCnwGCR+u4HgeSxnH717EwCAoUN/Eu80s3dSSsNqiBS3eHu8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
X-OriginatorOrg: intel.com

On Tue, Nov 10, 2026 at 07:17:22PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential
>issue to consider:
>- [High] drm/xe/oa: build failure from non-existent xe_wedge.h and
>  xe_wedged()
>--
>
>commit cfe215fb928c6338b6dd8582d19a4f894fb6bd7d
>Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>drm/xe/oa: Skip OA HW teardown on a wedged device
>
>This commit skips OA stream disabling and hardware teardown when destroying
>an OA stream on a wedged device, and ensures the poll timer is unconditionally
>canceled in xe_oa_stream_destroy().
>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index df9a3ea0875d1..6383a2e036ab0 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -43,6 +43,7 @@
>>  #include "xe_sriov.h"
>>  #include "xe_sync.h"
>>  #include "xe_wa.h"
>> +#include "xe_wedge.h"
>
>[ ... ]
>
>> @@ -905,7 +911,12 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>
>>  	mutex_destroy(&stream->stream_lock);
>>
>> -	xe_oa_stream_hw_teardown(stream);
>> +	/* The poll timer may still be armed if the OA disable was skipped */
>> +	hrtimer_cancel(&stream->poll_check_timer);
>> +
>> +	if (!xe_wedged(stream->oa->xe))
>> +		xe_oa_stream_hw_teardown(stream);
>> +
>>  	xe_oa_free_oa_buffer(stream);
>>  	xe_oa_stream_free_resources(stream);
>>  }
>> @@ -1704,7 +1715,8 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>>  {
>>  	xe_pm_runtime_get(gt_to_xe(stream->gt));
>>
>> -	if (stream->enabled)
>> +	/* A wedged device may be unresponsive, skip HW access */
>> +	if (stream->enabled && !xe_wedged(gt_to_xe(stream->gt)))
>>  		xe_oa_disable_locked(stream);
>
>[Severity: High]
>Does this break the build?  Neither xe_wedge.h nor xe_wedged() exists in the
>tree.  The helper for checking whether an xe_device is wedged is
>xe_device_wedged() in drivers/gpu/drm/xe/xe_device.h, which xe_oa.c already
>includes.

I see both xe_wedge.h and xe_wedged() defined in the code. CI builds 
fine too.

Umesh
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com?part=4
