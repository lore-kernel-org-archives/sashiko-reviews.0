Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5963344A3FC
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942117; cv=fail; b=eygD5s3qWNwxGGc5uBTZ6fdhcBHwxWexmj7pqSj1YwMFuFKZSatqTsy5dbqaTNNkUkhwr3041GtdgxxtijXJEsKe4hNgmEwwIXH2a6ldlC8XjfyMdpjEixKmW+U5B3WW50Pua/mHMse2vvyNRS7lYZqqHVpc/x55U9aT6HFM+0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942117; c=relaxed/simple;
	bh=LH7Pp2RwGhCjUwKdSFfabkrA5Ekrh/LsZSFael5o2wc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ooiL0WLKTMTWJCnbakYQteYJYM1Y7yAmF9XlRp6HNvXC7mLAgIHq0AQZ9Eap+Q3JkFj0nVATZdy47NFPBAgIgWZBJ+8Bfk7RdPrA9Cp0J7ZnVt1Igv5fbs7apnnprE76+HJzatKAnSAOl4ROiQg4o4vPPpGW8PENOGCxvhskfMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiaXhNj7; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiaXhNj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788942115; x=1820478115;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LH7Pp2RwGhCjUwKdSFfabkrA5Ekrh/LsZSFael5o2wc=;
  b=UiaXhNj7wuBcSXyT1BooOg53ewP7W6n2KFIKZ1ycPGqVpJQi78788cNY
   pRbq43NMnD4Yn4XaT01urRxCLpl58Jb5hSrHLfdAVbaDfzaVPpTFeSu+s
   jqhurrtgy7DUUN7urDmlDG0tmdeEP0DU3KwBfTuJ415akyG0dIiEku0mU
   iQfDO7Gxs5z09S736zcW4+m08m+X/274KQTJcwh0TfiH5qWF9cC/RKcMT
   4B256YirPc0HXO5MYCC4JQcyQQQ6FOCU5SXRkVQj0GaOYCGEAJ+Um58Wq
   66bfN/TKvq5NsswF7lXbaD1sFHKXco2HqyLVtdL0/Lgy3lhS0obxMWsvZ
   w==;
X-CSE-ConnectionGUID: s0Yus2BEQQeFO31Q7PdzjA==
X-CSE-MsgGUID: HFRRIK44SRqVgd4rxJ5SwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89283753"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89283753"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:21:54 -0700
X-CSE-ConnectionGUID: WeSgERqSTvq+C1HDaRJH0g==
X-CSE-MsgGUID: eYELgsA7R8ywX51U77DxFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="269497526"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:21:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 01:21:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 01:21:54 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.71)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 01:21:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNINkLlGkik22AKjIBnMK50ltA4vt2QPKTjvSvloEdWb9mW3qJNISkyvTIoOkGxJDoT2rg6flzZn8U6SBb17NntpHT6ATxewLSQTjE2crFSIv8tQDC3yCKlUj08iWCjs7cTaPg/cfln9Zm4DN6VoJB4NCFuhXVa56OcGSPkTKmjV+F+MTc9OnWPVuWn6w21inn0NJlwP3EvcKsWmcFmvHsRtf0woTEb8LjLc34SQYfIigmRGYkoXwEQAUDLJbx/TsBYLYIlsM768+Pi78biMk3E85Abr3JOHrXCuLEPYyoKn4gwYjmLrkPM7MywpKZ+8y9GjhsX3SNgkTp1dVDjjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LH7Pp2RwGhCjUwKdSFfabkrA5Ekrh/LsZSFael5o2wc=;
 b=VtAyXQReWPB+xbwe87LYJUSxyq/xKoR0SfM/2wTqCy3yJjdnSI6zZtb7eE6H9wtX42M4zi7UOD7ZvyUaCTYaaL1NRpV02LaigPtwe+PNGqVsuMgrXNpk3X/5HT8frGvhN0hbgVlE0x0mxY3v8q6YMafaMCWNrVGNKLFyKmPpTq2tJ0c3/F5c9H7Pgp63Mikn9/qWwM9lggbuB0C9PB3KWFuWyXQoSjjWOzHpOp7ABKgVf58JjX+OQYaZLJp/TL+175t1nq7oF+lE98o8Nq7ryQP7p0/wDpj/viFXZ7l9m9XFyHBuCI+aHLZarx7B1G+QonUjt8EQfQ85fa2WS1gybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.6; Wed, 9 Sep 2026 08:21:47 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:21:47 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [v5 2/4] drm/i915/display: Force disable DC3co when AS SDP skip
 frames is enabled
Thread-Topic: [v5 2/4] drm/i915/display: Force disable DC3co when AS SDP skip
 frames is enabled
Thread-Index: AQHdQC+XPeLovbL6EUG7LQUY303mGbbF4qCAgAAE+XA=
Date: Wed, 9 Sep 2026 08:21:47 +0000
Message-ID: <DM4PR11MB636068C7E1E2798F4DFCE6DBF4B02@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260909080810.2202879-1-uma.shankar@intel.com>
 <20260909080810.2202879-3-uma.shankar@intel.com>
 <20260909080203.AFE1B1F00A3A@smtp.kernel.org>
In-Reply-To: <20260909080203.AFE1B1F00A3A@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DM4PR11MB6168:EE_
x-ms-office365-filtering-correlation-id: 1a7de32a-5a42-43d4-5a44-08df0e4b641e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|6133799003|3023799007|22082099003|18002099003|11063799006|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: SbsBtnhiemPvYenbGDMyRVBI604l15QdXeunMtiESWwIpRFZ0qMCf+/KaMLZPvpfgwLxE9zwqMpKy2HLWK6/i/lWZ0RdGrRIMev/3HFpjsE6/yCzAHL3JSVf0IqWpfijObt9DyQ6hily9J0+xk31IrI2k83Vw+FA9q1gofisQwvXjpZtG41exLkk1SG9X0yORbW7HxnNjvULFGriBnIP5KIvK4oZTK1f+XwCiudp05ZGU8FRW0tqEE0awk0gYbRyiusVZ0FHAQpx/09GgXfRzK7UktLitDGienCg0fYFk6DTGERFTLA6kUK1GdkZW9eNl1KWGh+bQThFpjP/NN+YfVaU0WqFfiT++IohzwHsnyvLySjBJftI5w4sGwoUB1QLxGx5KsaaySnqUXvUJ5R/4pvJY7AJCFMFh4xjlrt+vYBTBWDZqjIMPtP2IwFh0b1N1aC3nUG4jVUI+eEb9Zn6NFYOfPwBMaVk7AH8ut57WGU3vOdH8CIGJp/TcXhQPLJQuW+hgvDT5y6bGWtLb3bDnNm2kAeTNuTvB/rD1ni7wMqKqrMxBR0ndoS5ZB+UgS/sbxypLpB0UIVNFRAuWHzE4yoo7FwYow+tFFAR3H5k1SkVlQH6IK5LHhu/uktks1dBMu0FKdFul52AR/NfIyxZ0LmVuHmfz5OrWKlIuDUcbdw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6360.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjRuczZacWE5SGthRFJSRTYzTG9kS3lIRzdyd0hZajRqRnlrWnVnbXFtYXpj?=
 =?utf-8?B?WDRGRlNmQzA5ckVJMzNkR2JBMGh1Y2NKYzBrbjZRbFNwandLdzJmNGFCZDZu?=
 =?utf-8?B?QUgvcHlHYXlwQ3grVTE1NFFHNE5wYXJJWEZuUGFrcXpmMkhPWTdpa1p4clRX?=
 =?utf-8?B?ZGQ1YjUzUXZqcUJIaFJWYmxjUGxnbUk4d2daRVdubjRuUW42bXZFazM5Zk9Y?=
 =?utf-8?B?blFGNndwa2p6QjhoQVUvL0Mzc2pzZUlObUJaQmhSckFjdU9UT0c0Y2dzQmdF?=
 =?utf-8?B?bjl1OWdxSE9xRk41M25vSUpvSVQ1Um9RR1JEenFLTUF0M1FHcm1IRkRJdDVn?=
 =?utf-8?B?aTBpWnVCaEZwOXdocVFTZGk5U2NiRzQ0R3hjQmtTNVovRFVTdDBhSWVwSUhT?=
 =?utf-8?B?aHJRNmdZUkZzc1BuR0czV0Njc2J3WkFvRXJQSWVRMHZFbzBiM2xtci8wVUVB?=
 =?utf-8?B?YnZFODhmSTRyKzdmNDFBSVJYaWNzeVZ3TlJyS1d4SWVvTk0xMU5LYVUrbnUz?=
 =?utf-8?B?NXRBTHUwQkRzYlFLU3JtMUZjY01jK3RGdU1rb0JmWlNnWXNxR2gweitLU2R3?=
 =?utf-8?B?Q25YWTlzdzMra1NhQitrcW5zYzZydHJDRWMrZFpjZTM4Rzl5RFczeXJKajBX?=
 =?utf-8?B?OWJrK05NcmltNWpoM1lxanlWU2dNMERTVVRUUHRvbzZoZzFmZEMzY0R0VFBt?=
 =?utf-8?B?ZERBYTh1aEpBVysyNi94cldXMjg4NUdzUllHUkVVUzR5L0hHbnQ4bkQydFpC?=
 =?utf-8?B?aGZwb0JEQ3NuK0hWbm4rLytDaU1lU09VbW5xemZXblRGc1gxMFNBcGx2RjJV?=
 =?utf-8?B?ZDEySzdDdFg0MFVUMEMrb2dvZURyNmlUYyszMXBlNGxVTUhqd3U5QWN3UEcr?=
 =?utf-8?B?UVhzSzZ1NkNHRmE3WmdublpyZ0c2RFppdW5Kd2RGN3lwa29CbEhkc0oraFR0?=
 =?utf-8?B?d1orRXZUYjdaUExIdE52VUYzWnVSNTF3WW02TGNDY1JPbElVdkhNWEkra1JT?=
 =?utf-8?B?UW1sY3EwdDhtWEZJZGh2SXFNSUVWLytTdFYwdVN6emFaYkwwNGtQTGhSNzhj?=
 =?utf-8?B?cVRRV0NMV2hXSmcvRmdNZXBTRXpNaW1yUVdpMDhoeWxINGIzNVZtbDhDcVVs?=
 =?utf-8?B?V3ZGcW5uaTV4MlptYmFYZkd1WXRJcEhDSEtXa1VPSmhCMkVDWmNLeEZ0MGRz?=
 =?utf-8?B?bkxKYzlMTEFXbjlnL3RBelQ2dnpydms1WDZqZDhnb3JDNTFvKy8zNUxacDhN?=
 =?utf-8?B?eTcvWGJuaUlZWFduNXJ2Y2g3N0VURjUrYlpTT3c0NUhFTEFCcXl1K05KTXQ5?=
 =?utf-8?B?MEl3QmE1c3VLLy9ienRLSFE5anhYQzFKWEU5THpOaWo5NFpJdFQrVjJLRWQ3?=
 =?utf-8?B?S3FDYVpSQzFSVEpONWltZHl3Z1hzekVQZ2Y3N1ZMWkVqemFDN0tieVV3Q0RB?=
 =?utf-8?B?U0o3bXBaaTJVaXVZVTlHd2U4NXl3aHhuY2wrZzh6dHhLRVZnZW9rTnZxcWNa?=
 =?utf-8?B?dmV5eHZ0UzlYOTJMTVoyeExJaTZpbTVkeEFHaGF4SktaeVlvR0ZyTERXeWtw?=
 =?utf-8?B?MkZNbWducGlaUU9odE1PbTB0aUtCcTZQbWRmUUg3VUNZTy8zd3VycEtNeG5R?=
 =?utf-8?B?MzMrNGdFS2RwTzAwYzZrTWhGSXJvKytKM21nKzdob2tSNjV6MWYraGJ3dnBI?=
 =?utf-8?B?dEVmVDF2Mmxzc2N0ZmNwQi9BblZoVXdPaHoveWxhTEJIMGJocVZ3QzNpSFVu?=
 =?utf-8?B?YnRtSGo2bTQ1MmY5SUFkR2V0aHdDY1I3bFVYUGhLaDVDdkUxTmVUQkE2cHh0?=
 =?utf-8?B?M3I3OFkwTDB2NWMxMnNZL2lUai9DbmxJcUREam5PRTBTSUJUNGd2WC80cWM2?=
 =?utf-8?B?RHJjZFZ4cE8vZUJJOTJybXJGN05hQnQ4VlBxN25veGF0ZGJDSDJCM3ZCRk5u?=
 =?utf-8?B?MGtsZG5WMlROTEhMS1JyNW9aZXg5ekRlSzRLSDZLbVBEZ2h5VGhlMTRFL0Ex?=
 =?utf-8?B?bitMRkFUeGFiZkpGbHFIOUsyb2pnODJlMU5NNXhrOG5vRkx2SHVtZVR4d1Zw?=
 =?utf-8?B?SVFqWEJrRVFKeHFDeUY0Y25OM1c5ZFdaT1lvcDBPR3o5YjNNTGNFcUZpRm43?=
 =?utf-8?B?dE1kTG1hMWtiSUFSbDR3R090RUROOHdJeWZJRHhITENkUXZkOGRUNnlYMHlY?=
 =?utf-8?B?OWx3M3piMG15S0RMaURjU2FaUmdXR2tUL2MwemJDMCtiblZzbUxZdHdMaWkv?=
 =?utf-8?B?eWI2SHM5YkhEOFRpTjhZRE5ncHgxOEd6TVdHWHVka0lJU3RBdnZZRmFZL1ht?=
 =?utf-8?B?eEJvbk5PeVNZVnNRZUhUNkQvZWw5d3lmalk5Z0VJcFVVaENkLzd3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rSnizorWWduEuQmwMzS3y6zN7DwGWk947DfSrEBBlMWWiqzCG2X1IDOQHp9NXjaZITEQeIKp6uGPsFY5R78N/+HP5+bw9O+31sAGxoJHl5t4jz83GGy67SHWXqd1HeHhOX1G2FRxnetwPwojdItNGbBgouLEx+g2eeHi5sjgENS2SDk+5UD0bxTpzCAXULArV8fWAKPm/dIvScyG3oxoV++XqgMr+H87qMZ6HXHnidzdP7sH0Aj93xZtbrCV2oRJ4o11oDHp/jsCTtFVRxax2FfHbKa8qTgh79Sd0/uzg6HgqOy94qCxiz/fER5FzphgNJk020RceOvBya7UOrG+YQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7de32a-5a42-43d4-5a44-08df0e4b641e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 08:21:47.4750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/ALtKQfk+BUrmFBjtkvHgQDxS3SXnt3PXQAv1fkqHFs9VKhly6oyLlqKgDkXISWN8zFYi0eYptyeGuAN5393w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0
ZW1iZXIgOSwgMjAyNiAxOjMyIFBNDQo+IFRvOiBTaGFua2FyLCBVbWEgPHVtYS5zaGFua2FyQGlu
dGVsLmNvbT4NCj4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhl
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW3Y1IDIvNF0gZHJtL2k5MTUv
ZGlzcGxheTogRm9yY2UgZGlzYWJsZSBEQzNjbyB3aGVuIEFTIFNEUCBza2lwDQo+IGZyYW1lcyBp
cyBlbmFibGVkDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtv
IEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPiBjb25zaWRlcjoNCj4g
DQo+IFByZS1leGlzdGluZyBpc3N1ZXM6DQo+IC0gW0hpZ2hdIExvY2tsZXNzIGFjY2VzcyB0byBg
Y3J0Yy0+YmFzZS5zdGF0ZWAgaW4NCj4gYGludGVsX2Rpc3BsYXlfcG93ZXJfZGMzY29fY29tcHV0
ZSgpYCBmb3IgQ1JUQ3Mgbm90IGluIHRoZSBjdXJyZW50IGF0b21pYyBzdGF0ZQ0KPiBjYW4gbGVh
ZCB0byBVc2UtQWZ0ZXItRnJlZS4NCj4gLS0NCj4gDQo+IGNvbW1pdCA4YzIwOTU5MWZkY2E4MDZl
YWViMDhmYjk0NWMxYTU1N2YxM2NkMTg5DQo+IEF1dGhvcjogVW1hIFNoYW5rYXIgPHVtYS5zaGFu
a2FyQGludGVsLmNvbT4NCj4gDQo+ICAgICBkcm0vaTkxNS9kaXNwbGF5OiBGb3JjZSBkaXNhYmxl
IERDM2NvIHdoZW4gQVMgU0RQIHNraXAgZnJhbWVzIGlzIGVuYWJsZWQNCj4gDQo+ICAgICBQZXJp
b2RpYyBBUyBTRFAgKHNraXAgZnJhbWVzKSByZWxpZXMgb24gdGhlIEFTIFNEUCBzdGlsbCBiZWlu
Zw0KPiAgICAgdHJhbnNtaXR0ZWQgd2hpbGUgUGFuZWwgUmVwbGF5IGlzIGFjdGl2ZS4gREMzY28g
dXNlcyB0aGUgaWRsZSBwcm90b2NvbA0KPiAgICAgd2hpY2ggc3VwcHJlc3NlcyBBUyBTRFAgdHJh
bnNtaXNzaW9uIGVudGlyZWx5LCBzbyB0aGUgdHdvIGFyZSBtdXR1YWxseQ0KPiAgICAgZXhjbHVz
aXZlOiBsZWF2aW5nIERDM2NvIGVuYWJsZWQgd2hpbGUgc2tpcCBmcmFtZXMgaXMgcHJvZ3JhbW1l
ZCBicmVha3MNCj4gICAgIHRoZSBwZXJpb2RpYyBBUyBTRFAgYW5kIHRoZSBwYW5lbCBuZXZlciBz
ZWVzIHRoZSBzbG93ZXIgcmVmcmVzaC4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9wb3dlci5jDQo+ID4gYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcG93ZXIuYw0KPiA+IGluZGV4IDBlYmVj
NmUwYzI0MDAuLjFiNjBjZTJkZDAwYzQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcG93ZXIuYw0KPiBbIC4uLiBdDQo+ID4g
QEAgLTQ4OCw2ICs0ODksMTQgQEAgdm9pZCBpbnRlbF9kaXNwbGF5X3Bvd2VyX2RjM2NvX2NvbXB1
dGUoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUpDQo+ID4gIAlpZiAoY3J0Y19z
dGF0ZS0+aGFzX3NlbF91cGRhdGUpDQo+ID4gIAkJdHJpZ2dlciB8PSBEQzNDT19UUklHR0VSX1BT
UjI7DQo+ID4NCj4gPiArCS8qDQo+ID4gKwkgKiBQZXJpb2RpYyBBUyBTRFAgKHNraXAgZnJhbWVz
KSBuZWVkcyB0aGUgQVMgU0RQIHRvIGtlZXAgZmxvd2luZw0KPiBkdXJpbmcNCj4gPiArCSAqIFBS
IGFjdGl2ZSwgd2hpY2ggaXMgaW5jb21wYXRpYmxlIHdpdGggREMzY28uIEtlZXAgREMzY28gZGlz
YWJsZWQNCj4gd2hpbGUNCj4gPiArCSAqIHNraXAgZnJhbWVzIGlzIGVuYWJsZWQuDQo+ID4gKwkg
Ki8NCj4gPiArCWlmIChpbnRlbF9hbHBtX3ByX2FzX3NkcF9za2lwX2ZyYW1lc19lbmFibGVkKGlu
dGVsX2RwLCBjcnRjX3N0YXRlKSkNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gVGhpcyBpcyBh
IHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IHRoaXMgcGF0Y2ggZXhhY2VyYmF0ZXMgaXQgYnkgYWRk
aW5nIG1vcmUgcmVhZHMgdG8NCj4gdGhlIGxvY2tsZXNzbHkgYWNjZXNzZWQgc3RhdGUuDQo+IA0K
PiBDYW4gdGhpcyBsb2NrbGVzcyBhY2Nlc3MgdG8gY3J0Y19zdGF0ZSBsZWFkIHRvIGEgdXNlLWFm
dGVyLWZyZWU/DQo+IA0KPiBMb29raW5nIGF0IGludGVsX2Rpc3BsYXlfcG93ZXJfZGMzY29fY29t
cHV0ZSgpLCBpdCByZXRyaWV2ZXMgdGhlIHN0YXRlIG9mIGEgQ1JUQw0KPiB3aXRob3V0IGxvY2tp
bmcgaXQ6DQo+IA0KPiAgICAgcGlwZSA9IGZmcyhhY3RpdmVfcGlwZXMpIC0gMTsNCj4gICAgIGNy
dGMgPSBpbnRlbF9jcnRjX2Zvcl9waXBlKGRpc3BsYXksIHBpcGUpOw0KPiAgICAgY3J0Y19zdGF0
ZSA9IHRvX2ludGVsX2NydGNfc3RhdGUoY3J0Yy0+YmFzZS5zdGF0ZSk7DQo+IA0KPiBJZiBhIHN5
c3RlbSBoYXMgbXVsdGlwbGUgYWN0aXZlIENSVENzIChlLmcuLCBBIGFuZCBCKSBhbmQgYSBub24t
YmxvY2tpbmcgYXRvbWljDQo+IGNvbW1pdCBpcyBpc3N1ZWQgdG8gZGlzYWJsZSBDUlRDIEEsIGlu
dGVsX2Rpc3BsYXlfcG93ZXJfZGMzY29fY29tcHV0ZSgpDQo+IHJ1bnMgaW4gdGhlIGNvbW1pdCB0
YWlsLiBJdCBjYWxjdWxhdGVzIHRoYXQgZXhhY3RseSBvbmUgcGlwZSAoQ1JUQyBCKSB3aWxsIHJl
bWFpbg0KPiBhY3RpdmUgYW5kIHJldHJpZXZlcyBpdHMgc3RhdGUuDQo+IA0KPiBCZWNhdXNlIENS
VEMgQiBpcyBub3QgcGFydCBvZiB0aGUgY3VycmVudCBhdG9taWMgY29tbWl0LCBubyBsb2NrcyBh
cmUgaGVsZCBmb3IgaXQuDQo+IEEgY29uY3VycmVudCBub24tYmxvY2tpbmcgYXRvbWljIGNvbW1p
dCBvbiBDUlRDIEIgY2FuIHN3YXAgYW5kIGZyZWUgaXRzIHN0YXRlDQo+IHdoaWxlIHRoZSBmaXJz
dCBjb21taXQgaXMgcmVhZGluZyBmaWVsZHMgbGlrZSBjcnRjX3N0YXRlLT5oYXNfcGFuZWxfcmVw
bGF5IG9yDQo+IGNydGNfc3RhdGUtPnZyci5lbmFibGUgKHZpYSBpbnRlbF9hbHBtX3ByX2FzX3Nk
cF9za2lwX2ZyYW1lc19lbmFibGVkKCkpLA0KPiBwb3RlbnRpYWxseSBjYXVzaW5nIG1lbW9yeSBj
b3JydXB0aW9uIG9yIGNyYXNoZXMuDQoNClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgY29uZGl0aW9u
IGFuZCBpcyB1bmxpa2VseSBzY2VuYXJpby4gVGhpcyBjaGFuZ2UgaXMgbm90IG1vZGlmeWluZyBp
dA0KYW5kIGlzIGp1c3QgdXNpbmcgdGhlIGV4aXN0aW5nIGZsb3dzLiBJbiBjYXNlIGFueSByZWFs
IHVzZWNhc2UgYXJpc2VzLCBhIHNlcGFyYXRlIGZpeCBjYW4gYmUNCnNlbnQgb3V0Lg0KDQo+ID4g
KwkJdHJpZ2dlciA9IERDM0NPX1RSSUdHRVJfTk9ORTsNCj4gPiArDQo+ID4gIGRvbmU6DQo+ID4g
IAlpbnRlbF9kaXNwbGF5X3Bvd2VyX2RjM2NvX3VwZGF0ZShkaXNwbGF5LCB0cmlnZ2VyKTsgIH0N
Cj4gDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MDkwOTA4MDgxMC4yMjAyODc5LTEtDQo+IHVtYS5zaGFua2FyQGludGVsLmNv
bT9wYXJ0PTINCg==
