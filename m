Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795131099;
	b=frPZasN835Q0hPGkdHtbqEbqwaW35Z+S2cjLZcnkn1S6FMTA6le60i2pEt/exU9pX9Ph
	 F3yIbO6qHp8+E7IT6w4WNG5kTMZBxH5owpnseKds9FEJa4eDSRLum877UhgN9VuRyy8m9
	 5atulrdKFFMUEsF5zN00mg7o8TH7P6OwKE3k5On+I6+5mzJOajwqVqdtWAxIIEz64/OqW
	 MXiDBB5p7J5Yy9VV1Lsv9BQjgH7NneHBL6FRL6XvBgCxN4CScksTKacmOUHsa051eC0nl
	 d0uMOS/+E+EsRreV4nUX3NbWM75jBY2CY5cUTt7Af6zDzwzKuQyTbQvCkETSRGeD9KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131099;
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
	bh=E1ToPjqF85KTBNMBll0aEoEsDVYbfN8/dKqblu1TF4M=;
	b=zc1CFqU6NcZKeizDBctdHP8h4rFDgmPR0ONpWJTBcgNWmtXsVl36b52mdFBl/4QKkhXL
	 YhOtitJK7tmT59bB5mhtIBnGRma6R/l34lfQATlUw+cSGPnvELg+3gqv4UITBApvTfxEe
	 8eKI2N2kQsQQ2TODRTFzndGXQkULb5EKnOMqwEkAGZnmOJNH/SFpwphRQCL6aD8SI2xvG
	 GXq/j+qI+mNmz6dPXTKLSR+ZXmRF90YOtmNDwj1L4LRfEwA5yX8Fg0EiAy2n0aNz+boiO
	 ZUkzmAP6RDuCPv4ISL5A44tFSQKW5qhUDJ0zy1dPnaRuj1JwwgW8t3fuhTBGDaOyYhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PnKWOzUW;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BbGCrMZq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0A9606A325
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 23:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F0A9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PnKWOzUW;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BbGCrMZq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795131100; x=1826667100;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4ZAb8DMjgG/J5R7OaMr1I1+etS1MfB++E1EcnAcRK2g=;
  b=PnKWOzUWZ/btON4WRFftbKe7CCmSWzTm87vY/wZ7sagkahTnCM0LV5WT
   2qkoFHyEzRuD7OrcyeY76EXkMnFWor68M381GtJMjlSuhnKs5PyHRm8u0
   d21NY4e0L5x3UG4Fiy5y5egKiYP6PQiid7Uex2mawqZwK1ceTJ6MeGnp4
   U1dsMnGWtos7Pn5gba13Llr5KXfy/S5mijUMWd5/cJ+5gT6o75fpFGlig
   +scI5hAIvsvET/B9zxymi9ixnld5qFRSQut5IsyjRar7VLajgIUBfGKa8
   MZv5z4+OEenAIUr0rybmygRngzeYpWxmDwHUKKAW/kKnK/xOP5T57lCjv
   w==;
X-CSE-ConnectionGUID: qnV7v/JCSjyXsD6a0p98xQ==
X-CSE-MsgGUID: J084/SZSQHmL1P9l57uKnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4019474"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4019474"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:31:39 -0800
X-CSE-ConnectionGUID: +Hr1iM+4QGCn8U2JDX9gYQ==
X-CSE-MsgGUID: lIqYcrOaQm6NNfmZ3sl/mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10888953"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:31:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:31:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 15:31:37 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:31:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oe6KQFS+9tPADzkf7bxC8lbrDftsiHgP8RWkNuvrx7coXmY7vCsQAxE4dpqUZx2DGB7ywHz4mfmZ/LjSWbsG7HJGDyooXz0Q02SzCfVI34r7173X29zWY7xqmeoKCCb6ljQ/xKmYLlDfFW9MLxyksUVVKzPhPvRKnZIg/o0KH0swZxLyMxPqiFiLNCJmHoWz1W4U+DF7Tvo7QxWtj4x6pAPjsvbT19N9DvdV7s48MaNJWVjyj530m/oBk0izJ8B6aJ4GZRHYAx5u/3ja2N/9OeWh2X8bFe6+WgPvVJc0GhjN6fIs9vIukLUX6m3V20PcFKVyB27LrzcDhJn7kvwDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1ToPjqF85KTBNMBll0aEoEsDVYbfN8/dKqblu1TF4M=;
 b=TMCquAWxQvwinenDxXq9DYK31dJ5CoewkaTmNrCGTxdeZj5aRck/Y+WnEALwsURkmEmuouFN4i6BMHPp+JQLElVrkpqtzp1lvwweZtDDStue8eBPeTmvNG+MXDdj4Pw6N4ShFlgG5NxfWhQwKEyQiY9RUQRw+pSwc97no39MeKOHr+exSsdGymCdkL8lC8DfFzqUZOE+ZBamwbTeSWPG8rVcoLIXPUuiPlPjJI9Ixdk1TUfWb24yu3CEOvUVh99UvAog+A0VS0BgxA3qM0B86xsGOGIN/M7XHfxEcvUChUdoINPwHMafx+mmaULDjUfc0mIQCplLOFxbk5d4GKxtnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1ToPjqF85KTBNMBll0aEoEsDVYbfN8/dKqblu1TF4M=;
 b=BbGCrMZqWz2CrSdLMl4PqpoprQ7UfTBOkt0QSRzwD9F7ZTI3jVjaQU/d83sJDveYtpAblzFNEFRfq78s45CfVTi++fPMJOz3isw2+DyrTIJD9+2qj2B/rhZY2RJi6Q/TJxqJefef//mDu+FlADcUSq5HueeKB+hr/DRnzN/CCnY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by MW4PR11MB7161.namprd11.prod.outlook.com (2603:10b6:303:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 23:31:35 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 23:31:34 +0000
Message-ID: <5745ab1f-ed23-4005-80fa-cf90a1749467@intel.com>
Date: Thu, 19 Nov 2026 15:31:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/wopcm: Simplify GuC WOPCM programming
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261119230423.322057-3-daniele.ceraolospurio@intel.com>
 <20261119230423.322057-4-daniele.ceraolospurio@intel.com>
 <sashiko-outbox-224176@kernel.org>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <sashiko-outbox-224176@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:a03:255::30) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
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
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|MW4PR11MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 7482df7d-2158-44d1-0bf2-08df46953ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|4143699003|11063799006|261022075727099003|261026121527099003|261022105027099003|10067099003|261026140227099003|56012099006|261028144727099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: CQ/lrEitDFl+bp4jOK2PfZq9bwPd7lSeBn0Z4FNKPbKatQKESrxd4RphFEbBV5x5z4fHKodyXO7vwbMHYE9P2/Kejtt8LIsASbTxUjVtFuvZ3RxHrIxpIw0UIrg96pDlbPT4f0tDYfr3fdz8EtfmGWKNhGneEr1rNrIBsRGdsxQmc91RIEfuSP8LYSVkd8w30Cx6NdsuYHwfe78VU6zQc4Zy8BZ/y31Lbw+7cyRgpSExHNA5XZcY5ZaO0OLUuLiEDXrcfcv/zO46CJn1cXTiFxFLkf8ZGDbRl8UR2+i54y8v1Ptc3CFxcF4gm4mybxlbjkABunFXNIIzWo8Bh36NSpv3vdnaxobR5J9TCZNPu1K7lS3wRXDShqCjeM3S5nNB3SHkBipPgwJEuA+gYWniAY+s56zPTm5QQtNZ5vvvzl7ohf6S7dSzgvxN3eVUyZ5N3WkuII8dDC3MM5oCilKdlUPdLglUYckO1BEgTSkoXzRx5OrMLSFNkXzBeSdDmWNBZVedcJ5fY5Qa0XHslHUm2exHxlT6vHFa8a9s5iredaGO65747OqEOlwDkwUwoh8Jn7JLYx9+9LfM6wzoxf2FKf8Wc0wq53joj0p9M057u3c7GvvLRPbtp4p/iy3jsL7K1yWizx0ZxMHKoFINTvr+MZNS1dTI7wQWbPkCXXDUtio=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4985.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(261022075727099003)(261026121527099003)(261022105027099003)(10067099003)(261026140227099003)(56012099006)(261028144727099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXZjRHJWQmxoYmNpTUdaM1BQdFA2cDl5STJMSEQ1UklpU1J1UnQwV0ZhV2Ix?=
 =?utf-8?B?Q0FyMk1yV0lVSkxqeEszM2xLcEpnWXNiQTEyZGhjYm9nc0N4dFVWMDFkRWo0?=
 =?utf-8?B?b0ZMYXNmRytGUUd3dHNtT1NTZ0pzMFlSbHQ0UFlwVmFGcVVPeVNSL2NvelI1?=
 =?utf-8?B?bXdubVJBOVVFa1FBUnBXM3ByS0IvWC9ROXhIUEJheTBKenIydlBCMW1BT2NJ?=
 =?utf-8?B?bUVyd0N5c0E0NU51Q1JqWVBoQzNLZkNCekp1cTJibDQ2T25TbWNDWDJWS2JU?=
 =?utf-8?B?Sld3Z1cxUm00L0h5SzQ0RzZzdVpna3l0c25EeFRxQmgzSnZTZkdXZ1NBUzIv?=
 =?utf-8?B?amJRMlhjdXEwVjZYZUx4WlMvakkxR0hCNW9pMkRIZU5jbUJtZ2JWUzhsYmdO?=
 =?utf-8?B?Skt4Ui9ncHkrYjBhRy9weTBlMTFLMkJBZitlUFlmU1dVdWtHNEEyTUxkYXIv?=
 =?utf-8?B?WkkxV2tVaitodTVuSGYyMkRCWWJBYmljQ2hiMmljblIvN2pMRFVSRWI1MXVL?=
 =?utf-8?B?TWNnZEE5VXZXcFpodkRxekZndlQrMkcrMy9MaDYya1o4dkhNRE9aZlJpL0VS?=
 =?utf-8?B?cUgvNndIMFlOcHNxS2RhVEFpWkh6R1NmV2lmM05Qb0FEM0pNckUwU0UyOGYx?=
 =?utf-8?B?QWtDQ0xsRUM5RWI5N09oaUkvaGNSOVJKbTh2Q1JBVy8velEwTEVRbFRLRjJG?=
 =?utf-8?B?K1V6QnQ4SEZtZlhiaFg2eVJ4MmZzUW1oRzVHdGZYRVZQODMzWTg3WFBKRm1F?=
 =?utf-8?B?MSs1dXBoeHJHS0xPRm1xSC9MeXNHTTRabkJQSVZKUzVqRDhJTjkyQkZjYlNt?=
 =?utf-8?B?VUovb3k5R3V3SW4yYVlDNUZDQXlVS3dSNEtKR2hsMDBnYmlzeFRnVW1GRXVu?=
 =?utf-8?B?d3ROd01LMkF4TEVKME1MSW5MSmJBMG5wc1V1R09DRWYwZ2JzdDRvN2RtdmZT?=
 =?utf-8?B?cXB3dTdKaTMrSDVqNUVLcUJUWjU5U3hCY1V0cExBNkdoSUdPM0Z0dm9aVHZv?=
 =?utf-8?B?RTAwa1JraDNESEFQNU03K3o2Zm8rVnF6ei9WQjNzRGNWZGMwZVE0QlF0Unlm?=
 =?utf-8?B?ak9SVGRMQVF6NjUxVC9GV1hNcERDQ2podjRUYUt1bm85VlRWeDFoUUxtR1Z4?=
 =?utf-8?B?VHJ5Zm9EeEhCcUFCT0xJbnU0UEczRGZFREdNcXhidVhHendNUnpOOXdjcTEv?=
 =?utf-8?B?NGxOcjYrYUJIR0JxRnhkeXJ0elFtY2UvZzZtQ1lWbExUVWEzRHY0VTZVSzZQ?=
 =?utf-8?B?WFdOc1JPYjZsK0k0RWR4U1RramltdG9aTnIwQndPbkRsdjBtRTZPSDhsUUo4?=
 =?utf-8?B?alFCaVBIaUI0L0Z3N2pUUktHRDFZK3hvb1cxSEFHVmlYdGcwa2l3SzNCNEJR?=
 =?utf-8?B?ZWk5UnhOQWh2T2lVMG9tSi9vSjFQdVNlNEtSZ0YrQW5QN2V0NXBtVUYzeXM3?=
 =?utf-8?B?YlRNMjI5eldVMnM3WlljWDd0cnYvOTU5ZWhrMGt5VW01YXVKVE0wcFV0WnhN?=
 =?utf-8?B?bGNJRkNiMnA0TUk4TlRUaVBzR2NzczZ2MzUzRzJxOCtXRm1ZekdkVjBOUUx4?=
 =?utf-8?B?eWR1MTAxTTh0SURCUXdaSmY1UlZ5Y3h0SWgxcG5pRStzeExDQ09HaEMrN3NC?=
 =?utf-8?B?OWVIdDJnK1FKVEtTeHJTa1VHWWR4d3B1UEZUUEhXK3R3QlNsSU9mOVUxZU5a?=
 =?utf-8?B?c1p3VzN4T3Y3Z29OUjlyZWg4akoxSk5VakgzVlVVbG1pelBGL2Npd2Rxa1hq?=
 =?utf-8?B?NEhQNy9QWVk4UlNraWdQbWpkaEU0OWxzSDBqQk1NMzVtNklvVFNCMjQxc3di?=
 =?utf-8?B?NVdSNk5Mc2ZxSDZObXZ2TFJxK1o5eTJXZWsydk1BYVV4SG8xaFVMbFRBZ3Yw?=
 =?utf-8?B?Ti9LYVd1OTFBNnBHYUszK0lIbnQ4RjhkVmJYMVRNekJwMHF0OU1lL0JEa1BW?=
 =?utf-8?B?SVNYeFBFdkZvTDBWbXBZdGNJYmFrK1QwVlNsNitZQTZCcUNaT3poc2VtZjV5?=
 =?utf-8?B?dytqNXg2V3l2MytTL2s0OVhVckZZd0tmQzJkMk5sZUtVYk42aFRWVU40ay9u?=
 =?utf-8?B?RzBGNlBYajJ4OEszeVp1YW90MEtmWVpZSjUxd0tzclBhRVJiS3FtNUxiME1x?=
 =?utf-8?B?UUR2M2FwTFM4Z2Q5dkdmdnhoMDEvVG05Rk5PL1FqdTVLd0JHN2ZJQ3A5MkdC?=
 =?utf-8?B?WkV5NnhLb1lJL3NUOGRyb3FrYWlKZ3RDaFpocTBNbnRqNHVUQWVEV3Q1WnpD?=
 =?utf-8?B?OGpLMDZ0dkRveVlCaGJNbDRoVDFWbkhwQzR4bzgrRUhUNlhzNEtpSFNNOFF1?=
 =?utf-8?B?b283cE1RUTZFVVVMUUhVdDBMNERQc2xqMDNYWmt2QnNDQTM5WThjM1pYREFK?=
 =?utf-8?Q?Q+59hMKM40TS/VDU=3D?=
X-Exchange-RoutingPolicyChecked: aPzvdWySd8OfuzhDu2ZqFLkAQk2gHgK7P1VOugM05GWqZfzAOMUgMUnXnC6QdmzFy7SWeDF922l+d39Wm3DxdZkipcnKohBqXmEwnjJE75GXqaW4sUFlGHfgtnFmnAyV/Dp4f1wAgSGr+3oDp8fRrWgQWDaMuaNeFFqxnODCjHuwUrwUV01NzXAT9hAz4B/AVpT8KNN8F6aSllXyBkcJNS+jVMovZV0URwJgNTrd128eW/oLfRm6xgYS9caC2QA1aJlhxMM6/AigFburUIDG9D+EHYN+cW0AMt+jbT2XQWsGMu6hcXRvzsJjKHHJM8Jn/6+0FoIg5rNFWph67ukkdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7482df7d-2158-44d1-0bf2-08df46953ffa
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 23:31:34.8564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZ4/sm7JRUYsC+Ntjnb/trr9MER4btjgPQpFlRlu6WhBwN1pgieVJlstbygLs9pbJf6FXcIUyFoG2Hhh2aJVb/qWWs38zRU44/BkKCkgQSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
X-OriginatorOrg: intel.com



On 11/19/2026 3:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/xe: u32 underflow of guc_wopcm_size in uc_program_wopcm()
> --
>
> commit 2876ad005940248a7d3945230ac1cf31aa3198e3
> Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> drm/xe/wopcm: Simplify GuC WOPCM programming
>
> This commit removes the separate WOPCM module and layout checks, moving
> GuC WOPCM register programming into xe_uc.c.
>
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index b32ba504041c5..ff13f6e6ccb66 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
> [ ... ]
>
>> @@ -52,6 +55,126 @@ int xe_uc_init_noalloc(struct xe_uc *uc)
>>   	return ret;
>>   }
>>   
>> +static bool __wopcm_regs_locked(struct xe_gt *gt,
>> +				u32 *guc_wopcm_base, u32 *guc_wopcm_size)
>> +{
>> +	u32 reg_base = xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET);
>> +	u32 reg_size = xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE);
>> +
>> +	if (!(reg_size & GUC_WOPCM_SIZE_LOCKED) ||
>> +	    !(reg_base & GUC_WOPCM_OFFSET_VALID))
>> +		return false;
>> +
>> +	*guc_wopcm_base = reg_base & GUC_WOPCM_OFFSET_MASK;
>> +	*guc_wopcm_size = reg_size & GUC_WOPCM_SIZE_MASK;
>> +	return true;
>> +}
>> +
>> +static int __wopcm_init_regs(struct xe_gt *gt, u32 base, u32 size)
>> +{
>> +	u32 huc_agent = xe_uc_fw_is_available(&gt->uc.huc.fw) ? HUC_LOADING_AGENT_GUC : 0;
>> +	u32 mask;
>> +	int err;
>> +
>> +	xe_gt_assert(gt, !(base & ~GUC_WOPCM_OFFSET_MASK));
>> +	xe_gt_assert(gt, !(size & ~GUC_WOPCM_SIZE_MASK));
>> +
>> +	mask = GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
>> +	err = xe_mmio_write32_and_verify(&gt->mmio, GUC_WOPCM_SIZE, size, mask,
>> +					 size | GUC_WOPCM_SIZE_LOCKED);
>> +	if (err)
>> +		goto err_out;
>> +
>> +	mask = GUC_WOPCM_OFFSET_MASK | GUC_WOPCM_OFFSET_VALID | huc_agent;
>> +	err = xe_mmio_write32_and_verify(&gt->mmio, DMA_GUC_WOPCM_OFFSET,
>> +					 base | huc_agent, mask,
>> +					 base | huc_agent |
>> +					 GUC_WOPCM_OFFSET_VALID);
>> +	if (err)
>> +		goto err_out;
>> +
>> +	xe_gt_dbg(gt, "Programmed GuC WOPCM [b=%uK, s=%uK]\n", base / SZ_1K, size / SZ_1K);
>> +
>> +	return 0;
>> +
>> +err_out:
>> +	xe_gt_notice(gt, "Failed to init uC WOPCM registers to [b=%uK, s=%uK]!\n",
>> +		     base / SZ_1K, size / SZ_1K);
>> +	xe_gt_notice(gt, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
>> +		     DMA_GUC_WOPCM_OFFSET.addr,
>> +		     xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET));
>> +	xe_gt_notice(gt, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
>> +		     GUC_WOPCM_SIZE.addr,
>> +		     xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE));
>> +
>> +	return err;
>> +}
>> +
>> +static int uc_program_wopcm(struct xe_uc *uc)
>> +{
>> +	struct xe_gt *gt = uc_to_gt(uc);
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	u32 huc_fw_size = xe_uc_fw_get_upload_size(&gt->uc.huc.fw);
>> +	u32 wopcm_size = xe_tile_wopcm_size(tile);
>> +	u32 guc_wopcm_base;
>> +	u32 guc_wopcm_size;
>> +	bool locked;
> [ ... ]
>
>> +	/*
>> +	 * On legacy HW (pre-PVC) where the driver is responsible for
>> +	 * programming the WOPCM registers, the WOPCM is divided into three
>> +	 * regions, in order from bottom to top:
>> +	 * 1 - The HuC region, which contains the HuC firmware + a 16KB reserved
>> +	 *     section.
>> +	 * 2 - The GuC region, which contains the GuC firmware + a reserved
>> +	 *     section for GuC's usage.
>> +	 * 3 - A reserved region for HW contexts, which is 36KB in size.
>> +	 *
>> +	 * To keep the math simple, we remove the HW context region from the
>> +	 * WOPCM size, calculate the size of region 1 and then leave the
>> +	 * remaining area for region 2. The official binaries are guaranteed to
>> +	 * fit in the WOPCM, so the math below can only go wrong if a user is
>> +	 * manipulating the blobs. In such a scenario, we'll catch the error at
>> +	 * FW load time, so no need to double verify it here.
>> +	 */
>> +	wopcm_size -= (SZ_32K + SZ_4K);
>> +
>> +	guc_wopcm_base = huc_fw_size + SZ_16K;
>> +	guc_wopcm_base = ALIGN(guc_wopcm_base, 1UL << GUC_WOPCM_OFFSET_SHIFT);
>> +
>> +	guc_wopcm_size = wopcm_size - guc_wopcm_base; /* already 4KB aligned */
>> +
>> +	return __wopcm_init_regs(gt, guc_wopcm_base, guc_wopcm_size);
>> +}
> [Severity: Medium]
> Can guc_wopcm_size underflow u32 here when a modified or oversized HuC
> firmware blob is supplied?

Not with real binaries. If the user is manipulating the binaries to 
purposely cause a value underflow, we'll fail gracefully later at load 
time. The comment above the calculation explains this.
Also to note that this path only applies to pre-MTL platforms, for which 
the official support comes from the i915 driver.

Daniele

>
> Firmware header parsing in parse_headers() only checks that ucode_size and
> rsa_size fit within the loaded file, not within the tile's WOPCM size.  If
> guc_wopcm_base exceeds wopcm_size (or equals it), wopcm_size -
> guc_wopcm_base wraps around (or becomes 0) while remaining 4KB-aligned, so
> it passes the GUC_WOPCM_SIZE_MASK check in __wopcm_init_regs() and locks
> the write-once GUC_WOPCM_SIZE and DMA_GUC_WOPCM_OFFSET hardware registers
> with corrupt values before firmware load runs.
>

