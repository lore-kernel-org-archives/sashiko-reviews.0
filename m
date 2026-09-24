Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3871A8F7B
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230352; cv=fail; b=JSsL/TOeC4WQzGQk81KXA7+Zv/4Fu+9PZEyZ+VtPb3tZLzmz11hFy0Q50CJQnNrEpvj6rWefxJT5Cz8IeCtGB7dfz8um/s0RBseZn8DUSmhXfcvUm+iIRNkonWt9dj69bLWJLSjXz81QKAL3wni4Fa4Pop4w0dwyRbp3dMFXY/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230352; c=relaxed/simple;
	bh=bFNgQC6o1XXPBD5/jJkGObPlHXJ/5pp84j9hFg8cR/8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d1JHG14GQjaQyiCzgvTkoJn81BURCsKAe36CyhT/no80rq2NAmZceM9iBuX9NO8fM507e9R9HBpv6xOlO1x30OGLysSF7l+11/SJTrSZGW/TYtGdy9AMYFIkGc3ov+DAGF8FzardWmIj7MJV0VYmCb85g2QJzDqGpfYaewtM3zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfaYajLG; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfaYajLG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790230351; x=1821766351;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bFNgQC6o1XXPBD5/jJkGObPlHXJ/5pp84j9hFg8cR/8=;
  b=NfaYajLG349ChjaZq822OF03sd4Pan1T11osbMLRMQiZpKhTBlrzX8iF
   dSrt3mFaIfbjNhCEPnZKHFT0KPrSSxRXEmMhzXs+hAMT0ESDaOjvp5Gpn
   Sgx7rgJxqGufLT1mtIBu0xgDolOLeXUEenBJnDDAro8VqMDRTnBSLBJx+
   ZjLiElQ20lhs3hwu4qcvVemusAS85j7UolEXJnrfbmPM7Mcx4ZDicCpp/
   IeuCCnNn0vt+wLbB8yIdFKQdn7acS+eJXao9+/L/xYUlkxH3WuO5Z8DEL
   64wcrCUtEPHv7kJWz0Bi3a65eXjVDq7YY7PwRfjSZKWzgqXHkYl2xuKOj
   w==;
X-CSE-ConnectionGUID: dT3GZuyySGyH63of7Ke+Kg==
X-CSE-MsgGUID: ZWCBc8GZQsOOuEEQG4pXgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90055055"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="90055055"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 23:12:30 -0700
X-CSE-ConnectionGUID: VcrbiQkjTO+XlwlnGrYHrg==
X-CSE-MsgGUID: 1uYqtCF2T6+rUg/jm2XjKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="271770181"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 23:12:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 23:12:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 23:12:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 23:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXMK3PEoHlB/6NVoNMXA1MdiO3hNtShp2fx9Ag3y99wD/kiBc0UaODDC2/7r4H6pHVu+TAcPqwt4oNVU65XLmGRX4uQi17YAsl8QU9qu+8maHKhxjH237MZLYBacXH02dYh6VHP6JjyjzHObiY8A41BOGlfk+BaXt83cYvy/6h3WeXRMZwuI3Qh9WhJDmSHXfkxdf4J5uQvm2WdZUWrIXPqi+5cl1zclMU4C48Nqfv3qKucTFJlYaDO+50yCvp/gMopLEWmcKhAIt6vCcUj9ZoveFG/vgOP9Da8LWrK51dF1KKXOSy1LPtHyD00ZCLiRQuwAxS5ZcM0xmQPeRSHlQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFNgQC6o1XXPBD5/jJkGObPlHXJ/5pp84j9hFg8cR/8=;
 b=n02OFTsC28OK9486XI8C2ug7qQO5ngF1FQmrDL6ZrSpx4Yzryri6jw8URdJawO9OpVKuT2aOFzw8wk6U2NcZqBns+ZlNfJA4/lcueZijJKVSntdQSAgLhvMZxMf43x5q1iNNVh38U5XcdSHZlLtkl2wGoW8gsWi1XL/H6QKbk4R3a9yiIlywWmq1y7BdcbCBIbrkvK1TbKvC/bGPDTmGQKsq4dNBRiQyk84lVOlL2qxizGj3WGnG7BeeQrTZVDLtFocWsWLb0m4SMbu5gSSzTERsxWKZ1adE+wEsLrK/huaTrgcCx8tovCNOJkVgocVM5nccqWsVSEY+YiYrVuyyzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH8PR11MB9952.namprd11.prod.outlook.com
 (2603:10b6:510:3d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:12:22 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 06:12:22 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/i915/display: Don't require a 1:1 pipe to port
 mapping for DC3co
Thread-Topic: [PATCH 2/2] drm/i915/display: Don't require a 1:1 pipe to port
 mapping for DC3co
Thread-Index: AQHdS+m/MpW5+Qr/YUStYOAGJQ4517bdPZmAgAABZOA=
Date: Thu, 24 Sep 2026 06:12:22 +0000
Message-ID: <DS4PPFE901A304FCC877717E910BB3F9D19E3812@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260924055734.2138787-1-suraj.kandpal@intel.com>
 <20260924055734.2138787-3-suraj.kandpal@intel.com>
 <20260924060535.E81611F000FF@smtp.kernel.org>
In-Reply-To: <20260924060535.E81611F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH8PR11MB9952:EE_
x-ms-office365-filtering-correlation-id: e5b22a07-6554-40e2-58cd-08df1a02cbd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: 0YokTzLeOuiFo+IaP+U4i4yS/jEzITFSedEyMnDE+zljX4/i9asUTQE2hw6AYOL98esKsEwuPMUXXDYLzpmrB4tXKVNA2zqBXJzKVc/w4gi0VObcj0+BTpBnOgLQiggGEMjkLmJ2Xfu9XqvuD1qHVuL7mmofgqSEu8YZojrZSccZbsu2gwNnaow+++LkCl+eL0e4EwhcK9dW7TaV023KgWKgdmTCrsfykD9ej4kKri3i+Fic1YUL6UBB8LOstB0NCaD3xOGLgsSK3o/n+EVtjRFoykgtS9tG8VvfFPpnhvinF0EGsZPZpLgwWhKNnQMotSpwrZmpEsSiTaUmN+l5JoqSoqgvatBbWU9ethg/24RFODroIN0fx2Yyk1UVZXHZlExzOpyB3gpfpOb29lp37Q+JJ0i0CSTjNRkfnmCBTKnqEB/xS/O/qj3qmdlQSkuUAzFsNYjpHxCFxipyN6dZhDC1wnHkYBCH4MHw12v2Lg5Se7Gy/RkZBrehxJf+TOuQ8c3xD8A6AIFA8WMrMKd1iGRdxr9cyzezNlvBa4KgSlau7hlNM90Ulqc52Xand2A+DwIrq+uSPhOKcOXP2LQhv+I28KOEnphp2V9WmXCbJB8GFtEkKIp9YVJr6Cf8dmUfZXxsFDkrNxyuSAAsrUvQpYa1KpcwF72rhRXg5XjZBVo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFE901A304F.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZndJc09hb0hjb3ZRb3BTdC90WkxpUEdISXQveEkxNE9QTXg2VXh1K0RoQWZS?=
 =?utf-8?B?anI3b2U0QzFjM0NjaXh4bURPeGJ5bTJUVGxDMndCOUJjVzRFenZhK29WMlZK?=
 =?utf-8?B?cmNrdzM1dlFJNzd6QWR5bDRWTEp5N3dGL2YzcW9pVnYvOW5BZlhnbkFPemZi?=
 =?utf-8?B?d0U1UVo1RVZXaktwWW1pbTA1L01jR1VFamt4bVdJNW5WUGcxb0loL0xVTU9q?=
 =?utf-8?B?cVJUbHc4R0lLb1NpczFRajZtZ3prSVNlVFlhVlNmWVBtOU85NmQzSU5hbnUy?=
 =?utf-8?B?NVRBMi9HbDFoOTEwekQwYWpjM05mc201cjIvUlB2YnMwYTZTMXlVVTBBRkdF?=
 =?utf-8?B?bER5bWFJOFVnM1ZLSXlndTZlbVNxT3pDMmpweXRLQjJObW81bE5OeTZ5SUpD?=
 =?utf-8?B?NDYwQm9OSHJQWUtucTh0VnhjS0k2THNnT3ZEaWcrQS9pVCtGeE02MEpmVUVQ?=
 =?utf-8?B?Y3VLRWNhTUdOR3VJRmJvQ2pVeXJXeWpZUnRROXc2bDVkc0RIY1o0aXhnZDEz?=
 =?utf-8?B?N0JEeEJmQm82MWExZzRiOGJrVFZtcXZGTjJlL3hYL1JZL0wxbHBoVys4bjZ0?=
 =?utf-8?B?YkZIdkFUWnM0SSthU0p0TGhYSERvRXZhQ0lGaGdDNDlhS0JjNjVCTnVYQjQ3?=
 =?utf-8?B?VkgxWS9WN1ZxL1ZNa0p0OHcyclBpQjBscUlka091REF2ek1qNGxkMkxYcUNP?=
 =?utf-8?B?MmhSY2crR0xBVVpxL2NUTHJVQWlJaE52OHJ5Q3phZE1GNzVzY0c3YmVlV2s3?=
 =?utf-8?B?T1dFYUlEWEtlbFdENktPclpEeHppaDRvU3ZTZzBuL3BnZHZaM3pXa1k3a29l?=
 =?utf-8?B?dnorM3ZEMzNFamtUcktIT2JhRGY2bHhEUU1LRmhLYmh1SGxRNk00MmRZc2hk?=
 =?utf-8?B?dHB6YlNTcGZwRmNQMGp5d3RKNzZuMWRGYjY5T0tuaWZBdGJGR3NSREZpMjVO?=
 =?utf-8?B?YitZS1d5YUdicjhVajB5aXlYamFDTFhPSEtaV2VobWQ0c0VWQXFjWnJ3MzNt?=
 =?utf-8?B?WGNzeUNiOWx3ZEU2QmtIazVUd3d4b01zc2ZTekpUb3NKaTlGdzFGaWNJelpG?=
 =?utf-8?B?TW91OXpYbEc1TEZYdkZFc1lrV1JFeHVuUEt2eWMxb1RYMm1Sc1FHTFlZck4r?=
 =?utf-8?B?cmlYUURkaGJ4Um04U2hmRnJXTFFpNSs1RzM4TURRakRZN0hGQ0x3d25QYnJm?=
 =?utf-8?B?K1ZKS1VPemF6NlAxeXFVY0o2d1N5a0l6SFdFVklIL1IvRXpnUFNVMVFLd3B0?=
 =?utf-8?B?ZE84emJkdGpjRm1OZmtGT2VhV25IUlR6L1k5Rlhod1A0TjZVaVU1ZjZYM3VJ?=
 =?utf-8?B?WHRJdkU0REtNN3JSNll0Ym1BbkJKY0ZhQ1VvL2djRndJa1J0UXlkQ3hpbHkz?=
 =?utf-8?B?Z2pqOVc4UGVNMG1Ud292SG55Y295clR5VEhrOE1YMzBBT1J2NTZuOEJ5YTk0?=
 =?utf-8?B?K3psY21vQnhxVVgva29rQ2g2cEY0L3lzMWRUaXNkU3IzVG1HaWRLSTlINVpp?=
 =?utf-8?B?eHlkSDRqWkU4MFppdlFwbFdGcThzeTU1VHJROUxVdnlNZ2VNL3E4UEE5c1NE?=
 =?utf-8?B?RU5VVnowdmp1V2FwNlg0eEp2QXJPTTQxSkJUUThxZ3hLRGNEL2w3dlY3VzJB?=
 =?utf-8?B?RjBBdER3YTRWQ3VRUVVKaU9xcVgvdjY4Zk4wa2VsVzM0ODJLQTluNmN2RW9I?=
 =?utf-8?B?WmE1WTlCRVZyV2c0QXcwSVlWdE1qMVhPVXBPdmFUT2svVHBraXBUMTBMdTIw?=
 =?utf-8?B?WU05eUhSeXZxaFZaWnFUZWtYUDdISzRzRmZjMGZacEMrbEU5aytjQ0g4M3E3?=
 =?utf-8?B?TG5zeEYwUGdSYVZPRkpWb2RyaTFSR3NUVW1STlhlazA1UWhLUkNiVlgrZm1C?=
 =?utf-8?B?MWQ5QmlvdXJQeE5GWDVzZXdVYjl0QUlrdWM4SFhIL1cxK3A3SmFWUnNBNEt0?=
 =?utf-8?B?RXhzMFZ1OFIvNitPYW9TZWhyR01WTW9Tei8rVFBGTWdsSFhGUGNOVzlSL2R4?=
 =?utf-8?B?M2h6T0QzQ0QvWmg2YnRocm5Icy9xazB2dTVsSUJLZHN0c3lKK2dORlJ4M0Jr?=
 =?utf-8?B?NnFaa0hrS25rKytrd1NEUXZVWTlZZEdPby9vNlRxSkNyRStyL1ZFRzZnOEU1?=
 =?utf-8?B?eHB2ZytjU3FwaWZydHJKcFoxaC84NEtEVTRrNHRyRC9VQ3poRXgxV212aGFF?=
 =?utf-8?B?K1FGSm5yQnRWbG9tQktRazRUK3F0U3MvMmVMdnRSa2kwNEREbm01NlFmdXVT?=
 =?utf-8?B?TUZOVlMzMUJFSzlhSEwyY0dJN1dnbnZRRmpua3Z4NzBqMENnYnZENm5mSUZR?=
 =?utf-8?B?ZU5QQTM2NTVseVdiWUpHVHNFRW00aVM5UlZmeGJkS3VOVHNTWVFodz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4txETbcVtgKw6I2mk/GxjJsHOkUsg1iWNHJ6L3zWHYXUU5qg8pGJ8DKXM5/qZ8dVBmu2TIhJl/kgYNPA5eNG5HgMmdNrPCJ5hCAAGikaG6GWIg879JkBiOzzf762ziVavirETFNFht6TP29KV4YQtxmczG/EMN6pNP++SEKSmlz5b8JQsC63n3eGTOHYSrIuKveRLBhBYC+JFfp9o/VzrCjOVqyTQkBkLMHahwJrVZA/xWnthvoDSPoiJ4ZbMwc6G6TPg1a67s+8fbO470vSjtTNHOlY9HV4yQv8gwmuiu8jDezBxTu3yAtu7JQduVaViY1nOx7E23QS12HBRDuu7w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b22a07-6554-40e2-58cd-08df1a02cbd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 06:12:22.1706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1F4hE/wGS8FZJG77pDTZmrxFezEtNOury31L3PqUu0dNvN38vSRRXzpv+Q6Rz1enHjyH6yq5N56a/kSGaZ8X2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9952
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMjQgU2VwdGVtYmVyIDIw
MjYgMTE6MzYNCj4gVG86IEthbmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4N
Cj4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZHJtL2k5MTUvZGlzcGxh
eTogRG9uJ3QgcmVxdWlyZSBhIDE6MSBwaXBlIHRvIHBvcnQNCj4gbWFwcGluZyBmb3IgREMzY28N
Cj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpDQo+IHRvIGNvbnNpZGVyOg0KPiAtIFtNZWRpdW1d
IGRybS9pOTE1L2Rpc3BsYXk6IERDM0NPIGFjY2lkZW50YWxseSBkaXNhYmxlZCBmb3IgRElTUExB
WV9WRVIgPg0KPiAzNQ0KPiAtLQ0KPiANCj4gY29tbWl0IGZlOGVkY2MwMWM4MjUyM2ZmODNjZGE1
MmI0Y2RhYWI3NjFmNTdmNjYNCj4gQXV0aG9yOiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFs
QGludGVsLmNvbT4NCj4gDQo+IGRybS9pOTE1L2Rpc3BsYXk6IERvbid0IHJlcXVpcmUgYSAxOjEg
cGlwZSB0byBwb3J0IG1hcHBpbmcgZm9yIERDM2NvDQo+IA0KPiBUaGlzIGNvbW1pdCByZWxheGVz
IHRoZSBzdHJpY3QgMToxIHBpcGUtdG8tcG9ydCBtYXBwaW5nIHJlcXVpcmVtZW50IGZvciBEQzNj
bw0KPiBvbiBYZTNwX0xQRCAoRElTUExBWV9WRVIgMzUpLiBJdCByZXBsYWNlcyB0aGUgcHJldmlv
dXMgaWYvZWxzZSBjb25kaXRpb25hbA0KPiB3aXRoIGEgc2ltcGxpZmllZCBjaGVjayB0byBhbGxv
dyBEQzNjbyBvbiBlRFAgcGFuZWxzIHdpcmVkIHRvIG5vbi1tYXRjaGluZw0KPiBwb3J0cy4NCj4g
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheV9wb3dlci5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXlfcG93ZXIuYw0KPiA+IGluZGV4IDJlNTM0ZGRiNzM0NzkuLmQ0NzVlNjJlOGY0MGIgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
X3Bvd2VyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXlfcG93ZXIuYw0KPiA+IEBAIC00MjgsMTggKzQyOCwxNCBAQCB2b2lkIGludGVsX2Rpc3Bs
YXlfcG93ZXJfZGMzY29fdXBkYXRlKHN0cnVjdA0KPiA+IGludGVsX2Rpc3BsYXkgKmRpc3BsYXks
IHUzMiB0cmlnZ2VyICBzdGF0aWMgYm9vbA0KPiBpbnRlbF9kYzNjb19wb3J0X3BpcGVfY29tcGF0
aWJsZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiA+ICAJCQkJCSAgICAgY29uc3Qgc3Ry
dWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUpICB7DQo+ID4gKwlzdHJ1Y3QgaW50
ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoaW50ZWxfZHApOw0KPiA+ICAJ
c3RydWN0IGludGVsX2RpZ2l0YWxfcG9ydCAqZGlnX3BvcnQgPSBkcF90b19kaWdfcG9ydChpbnRl
bF9kcCk7DQo+ID4gIAllbnVtIHBpcGUgcGlwZSA9IHRvX2ludGVsX2NydGMoY3J0Y19zdGF0ZS0+
dWFwaS5jcnRjKS0+cGlwZTsNCj4gPiAgCWVudW0gcG9ydCBwb3J0ID0gZGlnX3BvcnQtPmJhc2Uu
cG9ydDsNCj4gPiAgCWludCBudW1fcGlwZXMgPSBpbnRlbF9jcnRjX251bV9qb2luZWRfcGlwZXMo
Y3J0Y19zdGF0ZSk7DQo+ID4NCj4gPiAtCS8qIE5lZWQgdG8gZm9sbG93IDE6MSBtYXBwaW5nIGJl
Y2F1c2Ugb2YgQ01URyByZXN0cmljdGlvbiAqLw0KPiA+IC0JaWYgKERJU1BMQVlfVkVSKHRvX2lu
dGVsX2Rpc3BsYXkoY3J0Y19zdGF0ZSkpID09IDM1KQ0KPiA+IC0JCXJldHVybiBudW1fcGlwZXMg
PT0gMSAmJg0KPiA+IC0JCSAgICAgICAoKHBpcGUgPT0gUElQRV9BICYmIHBvcnQgPT0gUE9SVF9B
KSB8fA0KPiA+IC0JCQkocGlwZSA9PSBQSVBFX0IgJiYgcG9ydCA9PSBQT1JUX0IpKTsNCj4gPiAt
CWVsc2UNCj4gPiAtCQlyZXR1cm4gbnVtX3BpcGVzID09IDEgJiYgcGlwZSA8PSBQSVBFX0IgJiYg
cG9ydCA8PSBQT1JUX0I7DQo+ID4gKwlyZXR1cm4gRElTUExBWV9WRVIoZGlzcGxheSkgPT0gMzUg
JiYgbnVtX3BpcGVzID09IDEgJiYgcGlwZSA8PQ0KPiBQSVBFX0IgJiYNCj4gPiArCQlwb3J0IDw9
IFBPUlRfQjsNCj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBXaWxsIHRoaXMgaW5hZHZlcnRl
bnRseSBkaXNhYmxlIERDM2NvIGZvciBwbGF0Zm9ybXMgd2hlcmUgRElTUExBWV9WRVIgaXMNCj4g
Z3JlYXRlciB0aGFuIDM1Pw0KPiANCj4gQnkgcmVwbGFjaW5nIHRoZSBlbnRpcmUgaWYvZWxzZSBi
bG9jayB3aXRoIGEgc2luZ2xlIHJldHVybiBzdGF0ZW1lbnQgdGhhdA0KPiBleHBsaWNpdGx5IGNo
ZWNrcyBESVNQTEFZX1ZFUihkaXNwbGF5KSA9PSAzNSwgaXQgYXBwZWFycw0KPiBpbnRlbF9kYzNj
b19wb3J0X3BpcGVfY29tcGF0aWJsZSgpIHdpbGwgbm93IHVuY29uZGl0aW9uYWxseSByZXR1cm4g
ZmFsc2UgZm9yDQo+IGFueSBmdXR1cmUgaGFyZHdhcmUgd2l0aCBhIHZlcnNpb24gPiAzNS4NCj4g
DQo+IFNpbmNlIHRoZSBIQVNfREMzQ08oKSBtYWNybyB1c3VhbGx5IGd1YXJkcyBlbnRyeSBpbnRv
IERDM2NvIHBhdGhzIGZvcg0KPiBwbGF0Zm9ybXMgd2hlcmUgRElTUExBWV9WRVIgPj0gMzUsIGRv
ZXMgaXQgbWFrZSBzZW5zZSB0byBkcm9wIHRoZSBzdHJpY3QNCj4gdmVyc2lvbiBlcXVhbGl0eSBj
aGVjayBoZXJlIHNvIHRoYXQgZnV0dXJlIHBsYXRmb3JtcyBhcmVuJ3QgdW5pbnRlbnRpb25hbGx5
DQo+IHJlc3RyaWN0ZWQ/DQoNClRoYXQgaXMgb2theSBiZWNhdXNlICBEQzNDTyBpcyBlbmFibGVk
IG9ubHkgZnJvbSBYZTNQIG9yIGRpc3BsYXkgdmVyID09IDM1DQoNClJlZ2FyZHMsDQpTdXJhaiBL
YW5kcGFsDQoNCj4gDQo+ID4gIH0NCj4gDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3DQo+
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkyNDA1NTczNC4yMTM4Nzg3LTEt
DQo+IHN1cmFqLmthbmRwYWxAaW50ZWwuY29tP3BhcnQ9Mg0K
