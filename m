Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795775161;
	b=1HWj/7jRpOY6S8zZxKJvoqs4wjzYQlROk2lscqQcaQP0kSKJNSvNBT3VcoLi8FOstlGa
	 gmJp0TRfQ8mfiZHMfAF/3n7qmSx2iLOAG3iKyUXMe4NguWm+6//tuneDA7r1ACfn3dy5/
	 QICL+lj1/TEgl1lMX49xYWte1LHudahB0YqZhLoyw4kYzhvKabWLZ7FnBfHzMV/IYQzpA
	 XB/vfQJpkC9UNGehI7lCU8EVJLVI9KcnImJfjU1joCAj7OgoJ5Eq2Jd0Mxk2rjepm0CC7
	 /hhKc34VI+AKjMv7ZaEkseoA5RbCqVtUnfB/SG/H4hhazWudPUSUSRTQgleOBcKkhpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775161;
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
	bh=HIHlmX7OfhvjmufFE2SnMbm5npWJkeDWNaYJdBGVFEY=;
	b=D9QIYxLRQJKNexkrXOJr1z64InMU2uly5agNW6IslKLelXoGYLiiEWHYHhc6SqbzukAQ
	 RChpl2eVSnR0G5rwD5RTNMFtEgFST48jRvSr+kbNUB4gayT5i2WPAO3YD1lx3+j7HxUu4
	 w5A/VNweTpa72IVbhITBiKLmnV9YvqeA/s8SJHkqq9Z9ZMzfRUasSuHEYJx/Ocv+DJDUm
	 WAtGgtp0jaPl08GITuSnjV+hVTyp4CVvOD/oG4MNmifPc46W4g4VZqFtA09aQDg8Nw+h9
	 XvL6afjM8SWJwoaMmgeUZNfmfIHpHPbiHdGvDABCVm9NJeJ2aQZzT2HOKLnfuULrJEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jm9EO6Wg;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=X0Yr3jXr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6935606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 10:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6935606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jm9EO6Wg;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=X0Yr3jXr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795775160; x=1827311160;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4CjKmOGHQt+vKxnA8y6p3Tfb1TtcLqQ4Ra3nOwL7OnE=;
  b=Jm9EO6Wg7E93aDEz5r+jvlQxihb+5odDBgFF/lviX2T8yL2fFPWA+S7m
   W5zBcsQO1lZnwIc+ADOcIpZ8ZZx6KTUWKlAkdd41Edxr965osVnxApvJz
   8d/vyq0Dv9uZZ24A0JkSZXXX3nTDwNtLShXeSZ8Ajk6X1f89NH63s7fYX
   8tvJgALs4BiAUv02E8gyKDjgOuaQtBG0S/hSzC7eLL7hUMceGHSw30IJD
   NWzwEDmyRpeNa3fmeFJ6U0NPpSRmyeUtRbjfgiAs55UI88zpgBRMLYeS0
   XU6catyrjCDTH7oy8FBKXLZON2CCEOsXAM0cYc1vl62jW1EuhoR6Pgmrf
   g==;
X-CSE-ConnectionGUID: KPlw9d7RQqOWLeVIFQ0LSg==
X-CSE-MsgGUID: qZhNhSn8S0mODLoKOEiWMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4684424"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4684424"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 02:25:59 -0800
X-CSE-ConnectionGUID: EpIb9zROTgiOqNnkjszBnw==
X-CSE-MsgGUID: bKnNDyZFRkuZXEKbUms6og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12238901"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 02:26:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 02:25:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 02:25:58 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 02:25:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5riFT/pZHZ9QlyDRH5HgmqGtueek37B3yC/o/6ZUaz2JiWbneRUnR8fF5sWOyOiKZ8MBv1SldeM9WXAjI/HX4TOanDCxkDLYF0PlPiWJIpc9EiQ+Yo4yNSyr04DV8fliVmxyv7qgs6ZUC8E52ijGRfwr7hilel/wmugtdvw5Ni29klPgn85oFyTQgoNbQtd3R1PlFD+CQ5FODgtIjLiWli1qFClwoOReOJAUenln2ljR1RFOgSQ1FZODS94LBUrxbYEgox4hTFb/PaM9GLm1XE5szvk7Oa+BUAz6ClgAzEbFmzamwy0/UC9+NpbchY8joz2hKYqXLN2Sy8Lprwt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIHlmX7OfhvjmufFE2SnMbm5npWJkeDWNaYJdBGVFEY=;
 b=Tr4wSp0vmpGqdfCQG7+zHrgkXcjJfF1KxgR0cWNXRn0v0TlcerOKrnS5B/JDltlEvnD6mIX6/6BymoD0VH1TSLTA3GcMhsTNvZWX6/rHmKcEAMQJI+J0wWB/RK9e5MzqTyV803TOCHRMgnOE/iphr9YjItBOS/x+MwWd8wfyTF8BJ0+wL90fKK5ILONZ4FPgVVlbwWcydjYyHFeM4eGtifZnkARA/7CPwtQN2ZR63kzcyurm9TD5UZ01KC9QPrVrI48avUQM4Mr0R/BZiEijpwwCaAjkxbynJ8+O6dMPXgsx37+VMGPwnbPyryhJSXf2BVabKKyGMf3w+biBvWSRfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIHlmX7OfhvjmufFE2SnMbm5npWJkeDWNaYJdBGVFEY=;
 b=X0Yr3jXr38QzUHCpBhH8CHyVQcHCNNMg55jVqg7GgJxWwOl619ygBc+Y42cp7FJRm1afHcaJg885/Zp8xYXmuvFCTXSwD04LsNK/iOZvv/4Iv6fNquhcV/07RAkRAYtDsY8mfPECgoosO95XWBV23BVnUMd2GdwTWmv/7IcJV40=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by PH0PR11MB9726.namprd11.prod.outlook.com (2603:10b6:510:396::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 10:25:57 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 10:25:56 +0000
Message-ID: <8e98504b-665d-40af-89ba-7fb8fca40e4f@intel.com>
Date: Fri, 27 Nov 2026 15:55:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] drm/xe/cper: Handle CPER allocations in atomic
 context
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261127092914.2176025-8-mallesh.koujalagi@intel.com>
 <20261127092914.2176025-12-mallesh.koujalagi@intel.com>
 <sashiko-outbox-236990@kernel.org>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <sashiko-outbox-236990@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0157.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::15) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|PH0PR11MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: d4664ffb-0f2d-4c24-13e3-08df4c70d2ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|261021121427099003|261022105027099003|261026140227099003|261026121527099003|261022075727099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: MKbfO1Iw8hI8OFkNSIOdRI88Z+/5fcVIV+wsWMTuDZQGc6Oh5CuWYTdBFaMHOcq7g7CM8gxvw/ymnN293XsTc/RYe0Gs9/ZjD77d5xS26Dhuzf9GgW55MiLQZ8yytJu/XYEYvhfsg5rRY190xc7xx2ZjEiY/QU3iQLJFcn8rgkPL3fiTFft6SJnkQ1t4225Nynqe8y3af+6mrVWFerfzHObC1dyx2d8eTD9McxvXSqvx+3zewlLohyDCX/7qptBrkpPX3KaWFZoU0VDDMGhrnpHYjVUbE4Byp2x5oWl2gRb8r8Tx7d7ssrw2Viluvgk0mqCPrv8PP4vLN+bKZdbI2Fw5VZvv7cDaqDBO5RJWoHg4XyT8DYVqlUKfJJDH/lIsiN6NbWbRkQP1RZ9iv9o052V4LG0j3VuaN6RpyK6TFrQnAVTzRXD8dDY9RBmcaY/OuaY14IwzdeENX6AroToOCC804I46QTSFlpIx/8IkLwRznRT963NToCpWvY/+D2y7+4ONM41T1SipfaDsLda8d94tJMYoj9TizpJQPOaeVUZ3SuKsg+SWiP9Dgbv8NO6Q42wvtvjBEscRaejMuJhLSXcSr0p5K5s8I7ra7NX1YqXHnMluZyaTUi8uGgKy7LW8dqE7CAjKhtTY/FkH2DZGTuc4mPHr1GPtww2AJFDUiSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7862.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(261021121427099003)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXUrZTJYVWtSU3J5NTd2WkRmaURpeUlUbSt2V09URTRQcVZ2TldpTXdZaGRN?=
 =?utf-8?B?ZlBnSWxJTUoxb0NYK1JJMjJ4bXdXbWRKUXA1bDE0OGVzM253T0twMzA2Tmlp?=
 =?utf-8?B?Ujk0Q0Vid0xuY0RtZUJPSVBVSnRzMGlaS0NsdC8rSFM4VkdzRDlRclM2aHdj?=
 =?utf-8?B?dU5Mdm9PZklVZWtZYXhpRVNsaGNPME9keGZpdlpKay9qSU5hcHJWWGNsN2dh?=
 =?utf-8?B?ODVkYk1DSWNUNUMySmZ5QTMwdTBDbnd0eFA5bnk1Ny9XYXhjaTBYQmdIYWhP?=
 =?utf-8?B?Mi96NzJZQitLc2o0Mm5td3RwTGl3MmFrOXQ2a2lJUHFQWXdDVWFhRFFEcDEy?=
 =?utf-8?B?ZnBpY1pSZ21xQkRucHRsd2ZMYkFJZWdlRkFOYXo2MFVkdTFmRzNLY2dSTnZ6?=
 =?utf-8?B?ZDZMZnFDd3VocDludW1iQVZuK3UvWWdVNEczSjB3L0dHZVVEUUxMa2pmWEov?=
 =?utf-8?B?NjlJWFIrcGVlMTVGdVFiRWZqL0w3Q2pNTy9xdlovSWVQT0Iwcm4zdXRxdFo4?=
 =?utf-8?B?ZjE5Nk5DekhtdzE0RVVHWmx4QVJ0S05tZ3NITTliUGZ4TDdOdnQyREZ3RmVV?=
 =?utf-8?B?UUdIUXJQYnJlcWw1WlZjUkhsNlI0S0hCWUFBWG1rWVk1UFVNS2xQOWw2Zkg2?=
 =?utf-8?B?TkRvRFNCRUJJTTB1RXVTY0VSUE9nNjgyQXlaSVJ6N3pDZ0RCeGwrMW9tNDN6?=
 =?utf-8?B?WklSZiszMHFmZDlSV1J1RXU2aHZkQVBKWjVnSXVLelR0ams0c1JoMjZ6eFVD?=
 =?utf-8?B?SlBwQ2NSR0pOUWJDdDR2ZVpKdTM0T3Y4OFBZaHV4bGwvY0VhR0tEekw2dkc0?=
 =?utf-8?B?NG1mZXVuc0JDY3lwQ3Rlc0h5T1VPNUZtclZBSStMSFpEQUM4bUFjTjRiU0po?=
 =?utf-8?B?c1hCWW9KNld0YTZXd2VqLy9ZWWlKYnFwQk42VDB3NVcyaTlscTQ4dnNWallx?=
 =?utf-8?B?RlJkQ1J2SzRwcGNDdXpjY0hnRGNHU283bC8xd1JsYnErSm5oa256MFVtRG9o?=
 =?utf-8?B?TGtvOHBUOTAxZFU5RWV2MFZoT1MxUXZhajhxQ3JtSGRjWHE4SXp0VGxkVmlk?=
 =?utf-8?B?Z3VvaXdZekYwN3BYS0ZsT0p1ei9tQ2I1cDg4TEhHVGNmMTJQZnpFRjM5bXBK?=
 =?utf-8?B?MnV2cUJNVlVIaCt5NWZOWWx1RUczekNsY0crRTZqcTIxSm9hRXYyU1lVWWlj?=
 =?utf-8?B?ekxYc2YxT0xHU2Jub3pJM29BQUFrQlUralpZWXk4TGJUYjdobEFVMWdYak0r?=
 =?utf-8?B?SWlnTG9hd1hWOUVKRlpNMWNVa0hNd3lEM0hkUXJiaHNwMjRwa1dNekVHZ050?=
 =?utf-8?B?Y0dUK2llNWJwOXA1UVlsRHE3OUs5NmdZZXRtR0UrYU5uZlB5KzJXdytPU2xH?=
 =?utf-8?B?bS8xZng3czdKTkpOVkZZSnlYOUMrUUlLNExUUDIrNmlUanFpSmVyTVVoZDlO?=
 =?utf-8?B?dVAxc2xpdHJJczBySlo3TG96aGZ5bEZ5MjRGZFBUby9QYU96ZVZVMThWaDFl?=
 =?utf-8?B?N3hZMURyU2w2Q0oxU25UUkZ1WENjUWQ0eDBGWlRZdy81ekV5TTJzci9mU3Nu?=
 =?utf-8?B?VTBRekVTSi9NTlM4cS9NRkxOa0ZCWnpxNU9Va2FJRnllNm5yK3BpUk80K3dl?=
 =?utf-8?B?NFpuYkRMaWpCcm9oa1I5cXZyclNRM1Z4VWpkYzJrVUtxRlN5dDV5aHFjM00w?=
 =?utf-8?B?U2Y0THhUbXljQjhIMEJoSmJXUk9JUkxOMjJ5cG4ycTFSUmpGcFlkZW5TbG9v?=
 =?utf-8?B?OFR6Z1E4bUVHVXpSYU5rYWRjcmU2bExaZlNDV1d2RWJvcnJQZFZCd1RJdkgx?=
 =?utf-8?B?dlZuMHVOQVFTUURMVVFncDBGSU1aMjU1alBBQWFYdzFtdGsyOHhsYlJkMEdF?=
 =?utf-8?B?UzVMcWdGSUxscVgzYVBmR01YbGNJTXBZT0V1SmJKdTBBWlI2YWV4YXBuOGdI?=
 =?utf-8?B?MHRXUmlZL3laWVdvUzJkNDBLSEEwSy9DdytrNWRXUmJVanRLZDNWdmhlOHRM?=
 =?utf-8?B?RnA1eUwvd010ak5wN2tSejh1QTFJbjRxOUNjb3ZTdE9mUWhBN0JyU3JZMjZl?=
 =?utf-8?B?K29SVUlBVFdtMHlrRWZTeEJydmo3TDVRRkJXMHZnaDFrdHdjSGt5dVJtMjNN?=
 =?utf-8?B?YW5uWGpsRlJqVFNsbmM0cm0xWkNpcVk5UXVMeHdGWXA2WXdVZEI0TXJ3aGVE?=
 =?utf-8?B?bmpYbEJ4alA3NWNuckJrTnhvSUg2V3hNdWQyaHlJZlpWZGN1Q1NZazh0dllT?=
 =?utf-8?B?NVFnRFNtUHlBOVU3czYzOHRQZ3ZrYktPSXVORWlnUVNGaFZzRjFhUGIwYjE4?=
 =?utf-8?B?VkNYQ3J1ZHJnU09icGpuVm1vQXlObFR1Qk5KMVhJTHdpZkJTTStUZW91OXYz?=
 =?utf-8?Q?uWkLmAHLShDNFh5A=3D?=
X-Exchange-RoutingPolicyChecked: MusXDxfIG4wQBCRVaUgO71CL+8RJV4Jp+j0uhBet9OB4S+5BQIHhx2ZxUq/iXXQiWwttqErnW+82jbfHMzfLuth/lsYk7cx2X1bTrFXecX+t1sb8vFKu/D+is26UrwDjrqTfsK5iQetinPr8AlUQvhv/f5s7moaIlFTl/BQCPZ1CuxQGj3q1ydTbqc2xvnOWXWhA8VKlEYH2Uf0Wj07AX8feWMRjeKRbdrYtdJJLDNBUEUUmd0Gn1MB6PkW3EBXJuig0FXeWSwSI3lAsiQLV1N0lwheqyzM8bYQovTGIbP4DRIf76Nm6lQXkLKPV9XmDc6VAdWw9mbUNp4MTBMJ+3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: d4664ffb-0f2d-4c24-13e3-08df4c70d2ad
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:25:56.8194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0F7NW5nI4k2o+gLy7k+SCVHk+2GVjCnjMfiAgtym6QZHK9CmsHb+uHIF9OJWsj5Ze6Wwzgqhr/oVYVt0x4mfXoxbTBFqxW37neglpqVHJlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9726
X-OriginatorOrg: intel.com


On 27-11-2026 03:07 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/xe/cper: commit message contradicts GFP_NOWAIT use in
>    cper_emit_sw_err()
> --
>
> commit fa3585155a74f119f9e4b51f2fac71fc5b12420d
> Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> drm/xe/cper: Handle CPER allocations in atomic context
>
> This commit adds a gfp_t parameter to cper_record_emit() and updates
> cper_emit_sw_err() to allocate software CPER messages and records with
> GFP_NOWAIT instead of GFP_KERNEL.
>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index 9161f2b52e9ba..10a4085d47f0a 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -183,7 +183,7 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
>>   static void cper_record_emit(struct xe_device *xe, u8 severity,
>>   			     const guid_t *notification_type,
>>   			     const struct xe_cper_intel_hdr *ihdr,
>> -			     const void *einfo, u32 einfo_len)
>> +			     const void *einfo, u32 einfo_len, gfp_t gfp)
>>   {
>>   	struct cper_section_descriptor *sdesc;
>>   	struct xe_cper_nonstd_record *rec;
>> @@ -191,7 +191,7 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
>>   	u32 total_len;
>>   
>>   	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
>> -	rec = kzalloc(total_len, GFP_KERNEL);
>> +	rec = kzalloc(total_len, gfp);
>>   	if (!rec)
>>   		return;
>>   
>> @@ -477,7 +477,7 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
>>   				    entries[i].einfo_size, &ihdr);
>>   
>>   		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
>> -				 entries[i].einfo, entries[i].einfo_size);
>> +				 entries[i].einfo, entries[i].einfo_size, GFP_KERNEL);
>>   	}
>>   
>>   	free_info_arr(info_arr, num_entries);
>> @@ -511,7 +511,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>>   	char *msg;
>>   	size_t msg_len;
>>   
>> -	msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
>> +	/* TODO: Handle xe_log_* helper function for atomic context */
>> +	msg = kvasprintf(GFP_NOWAIT, vaf->fmt, *vaf->va);
>>   	if (!msg)
>>   		xe_warn(xe, "Failed to allocate CPER message\n");
>>   
>> @@ -525,7 +526,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>>   	timestamp = ktime_get_real_ns();
>>   
>>   	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, msg_len, &ihdr);
>> -	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
>> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len,
>> +			 GFP_NOWAIT);
>>   	kfree(msg);
>>   }
> [Severity: Medium]
> Does the commit message match the changes in this patch?
>
> The commit message says it adds a GFP argument to xe_cper_emit() and
> introduces xe_log_*_atomic() helpers so callers can use GFP_KERNEL or
> GFP_ATOMIC "without relying on a single GFP_NOWAIT allocation policy".
> The code instead adds the gfp_t parameter to cper_record_emit(), uses a
> single GFP_NOWAIT policy in cper_emit_sw_err(), and leaves atomic
> xe_log_*() helpers as a TODO comment.

Added long-term solution to handle proper gfp flag in atomic or 
sleepable context so please ignore

Sashiko warning.

