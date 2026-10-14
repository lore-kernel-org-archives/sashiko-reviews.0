Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7988A418360
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972697; cv=fail; b=n0E0ZfcPAuMupKYpRCMButo0mNSI7g/KImTGiZ2BR5g+rdJHIjm+yDUTqYPd42E14AZYC00yiF781O1QJ0J+mmCv9312abzXjcDhBjlkPRk7Yf9XJoT1U0SG6kSLoaPejDW1PsOOTOve0X1hqkRRbZ2PidSKND8qqB0dtsT98F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972697; c=relaxed/simple;
	bh=VOn7timRsg7FbLoFo2uQqPXozGpRBsfsK82pz5CV/88=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KJs0Zdgm3kWMUz+5FyuDAxr9jpj3RlLQsQQp8QORUEZbyZGukbpoq24+studgG4XHzRwintMvpdvt/wvb8FR4UMVeOtfM0sxiM2iFAfdU+6xJ/x/O6HPZHt9HOagJNDghjdvQKoOzcTHnTDLbUcL7XF6IidXjuI7nP2yfMmCpyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3IUgGo4; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3IUgGo4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791972694; x=1823508694;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=VOn7timRsg7FbLoFo2uQqPXozGpRBsfsK82pz5CV/88=;
  b=L3IUgGo4jzMwLitalRHQ5Dv6k7hmrLC5a7XPADPdY5pY5DOBPpjZyzUR
   801cMjGpSDHbqHefQcrwyIHRW5ZXhMme0YF6BzXgxz9aMS9QpWGcZi2+5
   n5cWXRPFp/5Q/+MKhD7g/WlSSdxLT99UlTdroeXrJqv+WDQl3/Tb6OlOW
   DJsKplr2E3kxHWpa8d6QHSsT/Mt4rjxs8CNtUhQMiNhQz5NAywooBhwaQ
   891FyoV+Ep98W1XzanXI/nTG0XGD993e5Uoo73+jKpguN/3XgKxJI4n6Y
   uANz5+0kxL0EY7bzKa1l0TM15NF88pOi2Gnx1ZxmLMdL0fURDZzAMA7ZK
   A==;
X-CSE-ConnectionGUID: v9HakXu7TcO6/h9MmAxt0g==
X-CSE-MsgGUID: OrAmFb/oReK2tz1VqYKAxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="717579"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="717579"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 03:11:34 -0700
X-CSE-ConnectionGUID: eC3P4RVLSmGiMTipUhasuA==
X-CSE-MsgGUID: bV/PjmLoRrW8lULl16RkOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1407292"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 03:11:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:11:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 03:11:33 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqZA6BeLOFugDH2vhems9QJguSGxDI/jmyJSodiMD9JwNkIwGf2PlYbcOPE8RuH3pbtme2tfY20vJRZScSqJ2dkmbDGzo38mz10066CNr4cYxmf5pLTVHawPYiN8yLBvEg2u5JfUDa7jSvo459zd1ERADXGVwQgpmeTWGEQcwLl1QLyYOx56HfQvOkEy6iNUFckB7tzcXUGx//dxGPE3arXx9nBv7XxSUnEC02fY3F6Ua0452/5gnwZNvgfYCd6kJ0vMRlZnp9UVBy4Tkk8B+wSdSrswWDeymTiFmw6Pm2df/FvYtvYCIjYkUm3lhr/q3CTPL7KvKw/lMDE1WW+5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpbFfqfggKiub4Yoz/+ZJhxHQ7IEQBabyd2E45YRkSE=;
 b=XQn4dZUrlC7kQHpjB9v9E7ngwfgp5ETlRGcc8rI6qOxCuL6Yo6antYxaqaHZBhh1TTSZzRnFYwlttaR75IuQQ3R5cGr6qI9qlFsWZftAAtV6B92CB7mqc2LmS+tSzAu9POzQUfD3nhk9ozwcxUgDAQvYszADYOPY2pSpSbVcfA6vGLFeLhtsO7ASgJp7M2Z3A/Sotv2+Ndhzq9gfLvH0QAzWJNnMpqrAlYc7a1UldpnLcRtN/blyfgfz9CI3zYsZZ/ZcVfqfCkYjV9pgUBLnO5kmFhJgKB1u45602yPZENQg0o+MmTqD1GXFR48MxLBjPxwmgufpGrIrNGBokuX7aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Wed, 14 Oct
 2026 10:11:30 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 10:11:30 +0000
Message-ID: <a167479a-1486-4c2c-881f-26e09f3c6329@intel.com>
Date: Wed, 14 Oct 2026 15:41:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 07/16] drm/xe/hwmon: Consolidate temperature sensor
 availability checks
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
 <20261013184939.694945-8-karthik.poosa@intel.com>
 <sashiko-outbox-170375@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-170375@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0032.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::10) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|IA0PR11MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: d0856424-433d-4bd7-c5f1-08df29db841c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: Mqjm2AjIgNQVdXManpEsCTyvieVrUYtxiEeBu70EjNLYgqrFSN4NBKNKnalh+v36NM5X3jsP3TAhVYF1bQilmjN2VrZZ6jYztnoSZXgsi7AeI1npzJCvbxMK3GnYfB+6aLfsSooERKtUB73rn13oj6xPRVI89RUtsZ1opm+rIbhCOkFCZo/pxXubEA7HtzbRO2jMfuSpul1hXykrP8/DYH11CYI7MluLQSpGAUfNLPfXeKUJxebe+4P1UfPtXNRCZe6zHwaV+PR20FMXHH5cyk9O2r6ViOfvNn5Xxi6Ex9QiW1TLUMyzDvlHSRqRlKntvL5fXoti8dx7j2knfkibZ4tsN0iPDet8mTv/uuLINK0ZaedLRPasva7R4JfTdCxM+635KwbcJ++eEg+7+XXi/W4JDpWqaeDmcpHPfchipKrmteNBNLKwNWFdK9/De49a0dUIwatGMeB8ktgap4HEMO3WfiMQbpZuSEKsSVGvtAI9EftRPHepH+ALqCf8EN6mvjivs9mSOUetaa64ytY8Bgm1shyxRgeWhDv/dmja4MZLCFexeE2rDf0xiboAReeTY2zOF57p4ETzdTu87jV28+2g5PFHVUNXXhtlLb/2iG1586Cta9ZW2+Ewb8NvH3CNpxG3997hnx8m8IN/zKl3bS1IzWZCYAYDPfC6wlqMDF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE80V0FCMUlTM0VBejFkWWZnc210UjdVTzhERElGTkJVd1p5UFovanhla2Nt?=
 =?utf-8?B?NVFhM2h3b2NLUk1rdDliSTgyNGIxbUxaWGk5eGtibGh1aUlFQm1Dd2Qwb1lP?=
 =?utf-8?B?bmIyY0pOSHdHMzVZTXFoWVVkWk5lYlBpcCtGcnFGNVhzSEE4NXJXMjRkRWUv?=
 =?utf-8?B?QUhSMUE0WW5MMlJuV0J3UENlajZ2SWNBbm9UdHN6SXJheUdVYks5UTdGM1Yw?=
 =?utf-8?B?Rkg5VmJHSzM0T0NvU3JCQkRtdTlNQWJLOEVPRDBtS0Y1bk4rNjlDaC9QdXVn?=
 =?utf-8?B?dlJqVU43VEJPUXlSU2x0SUZlbFhEN0V2S0JoRm5xSXhxdHltd20rK2l5K3g5?=
 =?utf-8?B?cXdqSVZnaCtMWk4zOWU3Nm9adGpQOUZEV2FzUWZhVnpxdGE2NmZUMFVxdHVo?=
 =?utf-8?B?OFdZUVdTeWlBa1NhMGlMRmlYR0dVWlZGc3U4bjl0R1Q2dWRHYUJJZ2Y2VWsv?=
 =?utf-8?B?dTR2K251V0xub3pBQkx0eDlUL2xtYUZWVVFPQUl5NGNUOWVkblVRcURtcSsy?=
 =?utf-8?B?OWdycU9admFnR0Eyc0pnc09iTnczTGdHWi8rOXQ0Uit0Q1F2ZnkzUm5mRitR?=
 =?utf-8?B?YUQvNGhEanZDUFpvYUZ5ZDFVTWZkRVhhcjBJYjUyTjFTbHRYMmdyTzZzTDVU?=
 =?utf-8?B?eDVVazhYSUtYamNyUWZQRVhNSndlRUN3QlcwVDRSY2JDNnVEa0lOWDAvdktH?=
 =?utf-8?B?TDZRc0FEZjMvMUdNODNGMGl6clNqMnFXVG1BV0pieXgrTjRTQ1RPWlVVUEJj?=
 =?utf-8?B?aERCNm9XdEhxb2xXZ2dkd0hwbFlYWmEzcVN5dzh6bTUzeXhlK1RhQVdYK2tj?=
 =?utf-8?B?SlR6cVBJSUFqR09NMThhSTQzbkJXL3I5OXR4ZmdHN0dzOHB4djdMbm1McUZP?=
 =?utf-8?B?QzcyN1ZqZHBZY0ZEM2IxOUZqRXQ2UWZSSXNUMmRDWWRxT2MzU3JFMEtPVmNZ?=
 =?utf-8?B?ZmJBTnVHS1dDVm1mREFIR2xneWJ3S2tuQWhDeFlsZW9TR2RVQ3hONWVUZTJo?=
 =?utf-8?B?UE00ait2U1RHeVRwV3lEUlZCNUdTWWFUb3p1ZWFmUzZDUlN2ZUpzZTZjcHZ3?=
 =?utf-8?B?cVh0ZjdzczZkV0Jyd0FaUk41S1FRS0hMbFN1Tkpma1ZkbmFKZG9WczRKY2NW?=
 =?utf-8?B?Um54WmsxN243UnNiZkxvR2V3bmxzYVltQ25VSjFsYkc5cEFTbTVXZmFIeDU1?=
 =?utf-8?B?UWRKQ3VyN0pyTTlVQWw2Ti85QVdSVjBBRDAzVUNOKzIyVDdwdGxqOWxmMDlD?=
 =?utf-8?B?cUE2ZjRZamllaUNvdG9SNmZ1TkU5aGNoRERwdWZxdURRUXZlR0Fhd2RFWS9V?=
 =?utf-8?B?a3JGSHU0QnFONUVidnRISnBWbUcwN2tUMENLeWpMY0VUcG01TnBmaVVNck9V?=
 =?utf-8?B?VFJUSjBCSTdBMXhSL25aRWRuT21BbkptazlPRm5VUnlBQk1XZFhnZHhuKzNw?=
 =?utf-8?B?V3ZUbWVrem1zMnJhRjg0M1B6QUl2a2JNUDB1d25TRndlNXRvcENBZE85a08w?=
 =?utf-8?B?UEkyTHZVK0hEOXNXQ2RUVUFrRGtsRmFhd0FwQU9pY05vYUVJWVVqcjM1V0F1?=
 =?utf-8?B?MUtBdDQvOGFBbWRQVzRwRmV4UWU3cWliTUZxL2J3WnN4WVVDNWo0SXV3TWZE?=
 =?utf-8?B?S21HN0FVQ25KRmFDcUpTNjg5SFdoTVdJTHdQT3E1d2orYVVsV3ppUmtYb1Jh?=
 =?utf-8?B?SUcwV0EvREt4ZXV3Z21Pbm54WTMwZXUxbmIxc1NPL1h2Y0YzMnEyV05vb3NX?=
 =?utf-8?B?aU9CTjFPazNZUWFUNDMzbzZ2L3cwNGN0MS9NQlhDc214OGNJOXhyM2F6Zzlm?=
 =?utf-8?B?YWp5NldMQ3oweUpVaEhNYVhRbTkyU1VFbGdaQjl0OGdXc21FM3I1S2lGUGFo?=
 =?utf-8?B?aWpGbDMvbkc3R096MmdwSW1oR0xVdDcxamhhTUJ3UFc0ZXl0U2RrVStZZkhT?=
 =?utf-8?B?T0VwZlNZYVV6ZjZIL0Z3L3owVjAzdXlRNEl5b3hCMnBIQlhBQStLOEJkZFBt?=
 =?utf-8?B?Z1EvbitVWHRKODBqMzJoaTZSM3JsekYyaXZnVCtFcXYxQnJoTWY0WXQ4RTF2?=
 =?utf-8?B?eW4vdHlneVJSUldTY1JwY2MwT211cE5ZR0dZaWkrYVdrZnRveEFHTWRVQVF0?=
 =?utf-8?B?QWFYT3I2QWpOUDdTTTRlMlA4YmFSTFh4L3VoczVvd0RYZ0g3aXJPTnJkakg1?=
 =?utf-8?B?RVFnY3lSL2JoY0lVcVUzRC9ybXp0dEszUWRqMTVnelAzK1h4clIxTFJzZW1S?=
 =?utf-8?B?RnhpSXNEL21zaWtDSVBRYW5LUTR5YzEvd0dWVElzTCtXSEFmZUtESmtobXkz?=
 =?utf-8?B?ZzQyVXp2amY4OHc4aHdudEY1R2NYWEEyWkJLYlA3S1BiRUhCd1Vvdz09?=
X-Exchange-RoutingPolicyChecked: ULHw3seZyAneRj8xZ/3FL/Un8Ehg5vnB/euqoB7fAXs8Hhj9rbyzuU48Q0OcjLw95cyGqxpIz60PUeVQR5ujtwa8ZCbvSo1RtVF8J0T/sv49kId2rmPkPnS2TACeLVyxaC8dHvjkI7bFSe+oh5lp8dttk1nstoFeP5wY4x09mZnzdyYe8s50VnhT8jL6D1ZTomWS6BO56gI/zFu1nJdkr91eDaBLHvYrbYNoYCs3+C3J0UsmYnFSFGuJWWS4lmw0uU0gY9y5HgAIDmvZnokpD+TlDNz4ff50QZX7ZINCwq2ZYSTjGmHyCWi2Hd3qCPH9rMlVfzuQI1uk1UTHPWHOew==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0856424-433d-4bd7-c5f1-08df29db841c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:11:30.4075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BZcgWDF4ElBGdJuZtLwrZVtkceuJX+guSDbdljBrPyzr///rkhR+rO9PQO5Za9fQ/8jDPbJMDOY/LNhZXcTZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
X-OriginatorOrg: intel.com


On 14-10-2026 00:34, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe/hwmon: dynamic hw queries at probe hide sysfs attributes on timeout
> --
>
> commit 4140f9b7c587fc4925ef3079bf0c972416615373
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Consolidate temperature sensor availability checks
>
> This patch introduces a generalized is_temp_available() function to validate
> PKG, VRAM, MCTRL, and PCIE temperature sensors. It uses this helper within
> xe_hwmon_temp_is_visible() to prevent exposing sysfs attributes for sensors
> that are not present during hwmon registration.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 4463f32c8d8cb..b2f18a32487cc 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -1011,19 +1011,39 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>>   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>>   }
>>   
>> -static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>> +static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>> -	int vram_id = channel - CHANNEL_VRAM_N;
>> -	struct xe_reg vram_reg;
>> +	struct xe_reg reg;
>> +	u32 reg_val;
>>   
>> -	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
>> -		return false;
>> +	switch (channel) {
>> +	case CHANNEL_PKG:
>> +	case CHANNEL_VRAM:
>> +	case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +		reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>> +		if (!xe_reg_is_valid(reg))
>> +			return false;
>> +
>> +		reg_val = xe_mmio_read32(mmio, reg);
>> +		if (!mmio_temp_valid(hwmon, reg_val)) {
>> +			drm_dbg(&hwmon->xe->drm,
>> +				"channel %d temperature unavailable, val 0x%x\n", channel, reg_val);
>> +			return false;
>> +		}
> [Severity: Medium]
> If xe_mmio_read32() returns an uninitialized value (like 0) during early boot,
> does returning false here permanently prevent the creation of the sysfs
> attribute for this sensor?
>
> In mmio_temp_valid(), 0 is treated as an invalid temperature, which might only
> be a temporary state during device probe before the hardware is fully
> initialized. Since this is called from the is_visible callback, returning
> false will hide the attribute permanently.

The sensor is expected to be initialized by the time hwmon attributes 
are registered,

so mmio_temp_valid() should not see a temporary early-boot value during 
the visibility check.

The zero check therefore won’t permanently hide an available sensor.

>
>> +
>> +		if (channel >= CHANNEL_VRAM_N)
>> +			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
>> +				"vram_ch_%d", channel - CHANNEL_VRAM_N);
>>   
>> -	/* Create label only for available vram channel */
>> -	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>> -	return true;
>> +		return true;
>> +	case CHANNEL_MCTRL:
>> +		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
>> +	case CHANNEL_PCIE:
>> +		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
> [Severity: Medium]
> Do these dynamic PCODE mailbox reads at probe time risk permanently hiding
> the MCTRL and PCIE sysfs attributes if there is a transient error?
>
> If get_mc_temp() or get_pcie_temp() encounter a mailbox timeout or other
> transient failure when called from xe_hwmon_temp_is_visible(), it evaluates
> to false, preventing the hwmon core from creating the sysfs files.
>
> Prior to this patch, MCTRL and PCIE merely checked hwmon->temp.count
> statically without issuing a dynamic read.
This has also been clarified previously. The sensors are expected to be 
initialized by the time this API runs, so this is not an issue.
>> +	default:
>> +		return false;
>> +	}
>>   }
