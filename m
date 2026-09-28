Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC7B2C15A5
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598738; cv=fail; b=SmxPYJMOkQaEqgowz74CM4iC6Jd/e9LRML/+sd9hbuawTLZ7Y5hid6JPoGF6PGrq7ku6eQAOvFa4EC/2JQ9m54hO4a4SwHA7ZfA1oFzcT9rUy/6DtI36Bdp3yEM9u1/2fpwKn2AdEBy96Ytnd8NXosTRD/84pvEqa+ac7/9fZWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598738; c=relaxed/simple;
	bh=NdVkUcrMId9rT33fnu3YrU7+LZqJVpkJx+s1lm0vY7U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j/0nArCEyeFHPRniqA+d7IRzVPBpx6OxjZ/Dje60mNZAitaYoSInKpe0WWoVsKJWrtUygyBx27OqbT92Cb8gebc40cGgp8JA9XbE+T+6ebLOs29paWNptiTH5NZ4DQep5AmhRrgIoaC4xMypitC7eihQ9UFarRfp6rMP72VHi18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzi9/I3E; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzi9/I3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790598736; x=1822134736;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NdVkUcrMId9rT33fnu3YrU7+LZqJVpkJx+s1lm0vY7U=;
  b=kzi9/I3E/q22ZbtqA5L+zzfbTIsf0Z9rU+jo7b3al6Sj1SIMlnqlu/8z
   Sg75Y886oNgsJm7EGwUDwYtLp4SBbquH/Q91lGZoHjRVMdGiXFnVFBnXF
   8vGnVPEVK7RfAuEmWf7Lwm1H1e2HUkBRjGtnsCmrEX0h2e+3jtR7UCaZi
   8IdH+I+XTy5G1viIgzK30l9fHTVPp5Bj67jZJRH9+PrD6Lzp4iv+e08Y3
   K/TPYjFuRFY8eN0UDK1gKjVkuh1L0EAmQltW6Bnm29cBPvBUNizCYVe5t
   j2fNawjjqSGZTmj99oovGVvbPB3PT4dP8YKOD0y110RGJ20UBD2qsupHi
   g==;
X-CSE-ConnectionGUID: 2t7er/r9TrCBl+c389wIxQ==
X-CSE-MsgGUID: /lt+/i2JSgSEiQAXxQEkAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101464007"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="101464007"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:32:15 -0700
X-CSE-ConnectionGUID: QKFn4uSST+2LGxAB/qnJyA==
X-CSE-MsgGUID: ee/xc4AGT2uP0ySMgVIOaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="279767914"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:32:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 05:32:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 05:32:15 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 05:32:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsJWyIZutopA9yZmdtUw2i5X6rXPGlnRzkecec0QI/g6mkLhRnu9G+GkbaYXunm/F9vjiEXqCcMvJFPLtKNuc39TY1S8B+HT7EzoXXIndVcfoIneNSC0A7EaU+sPgHdNH0yptukgxKpP49yJlC+A0BHFBYvtSVvQrdpmjgGYBdRzLSAOVPZrDOnOvqGLiyffcPrXGrglcP3OxAH9Qnohh1KuSTHZm7SwYO3l9zydrvrkZ7HHzC756cPApaQBEGgqdEWAyLt5e2hnoLC57auKPSPRPEitK/v5T4KMxdWlzQYw47BZRLUZgxhUdGMRKyHNxn4Cn+uHsuBs65Qpb3Zblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdVkUcrMId9rT33fnu3YrU7+LZqJVpkJx+s1lm0vY7U=;
 b=Oen73AmhQSBhX914VtQqWJ213WLvsRI9iXpVK2V7+wnU7/hCaEvzsVzcYWU3KATmUz8xICmjXdmxFyvw8ygjg0nHw1erVsGmjnMV8lml73PzXDjTmY2Tp3Mtu6NcI+ChrN00qho8Epzths5YttfOQmDkTHAGFdiVPpQBHmazrQmLPC60zKabnMhk0ARwT8bIGlIich9QwD159NAq9fb5cK4LW3Sl9c5WdJxz3Teertf5xdAIS9ewTM/HKSOBN/JY8Hy37bZ/RdZMoPkqM4s9fO7Q+rVcMhS0VoMBQA48ffp4lFL4nW6WeXUvu9z/lk9H2ZrwwNX2yaY6BEPM9/Omlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 12:32:12 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:32:12 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v4 05/12] drm/xe/memirq: Report errors using structured
 xe_log API
Thread-Topic: [PATCH v4 05/12] drm/xe/memirq: Report errors using structured
 xe_log API
Thread-Index: AQHdTyrC/we1wA1l2Eup5W5piPVt0bbjucYAgAAyWJA=
Date: Mon, 28 Sep 2026 12:32:12 +0000
Message-ID: <BL1PR11MB54136B8C1759EFCD2CD1EE2BE28D2@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-6-dnyaneshwar.bhadane@intel.com>
 <20260928093052.F01D91F000FF@smtp.kernel.org>
In-Reply-To: <20260928093052.F01D91F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|PH0PR11MB5141:EE_
x-ms-office365-filtering-correlation-id: db3cefa3-d3f0-4a48-3ff0-08df1d5c8595
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: SZ0F9qMBu0bVWO+8E6pi7M6jPZACFPD2oqVFjZpr3Lh7Sr03qHUa2E4a8wu92C9pS5X7Clc37yvdIka42wlPMF5T4icZ7lGT7Va5oZgRWGlGPgoRGmk3zifQrtjioHjpMYJR89HgxHnttAgw4/VnnlYcMHnAXy2R5LqEPI5sGcUt2bXQrLAJeNQZVQ3QbRy/G6jdxtGXPnHEQSZKIK5Gexd2/DrM8bg+YqebTlfWLw5S32uSL7z1vUijiw0sqB2prL0G36OoBwMZqHQQkft7TIVnHLi3HdrH0gncBRLt0alkm6MLR9upbt0GUZB5Yo4+iB8HRqei1YHrBOaCOU7KXyDm9nX8VNbexU5eG6zkMUX1NTxEtFUV8BvhgZGyKzV3a3k8dKVvhzklGfRRRg75Mzk1jgs2X4N5lA+nV9Z/y807LwITTex1a5p47iNppgsB6en7BJtBhDhg8j78oegDIhiVd36Hs5WATSkJDhHlbsPBWq10tKvCGkWoUoE+gcE8bFdj8FN8PLSddbxHZ6m/3MoqNO5EHBL3fo+lyltd/rXuJ33iEcfUTggg9bJ/SrnJ88PCXmlqIj/um2eiC7kbO81syn5WCUPAbBbjAjNOWQsGUIO+dOaF5rvpILDt9kQF10gl+IDEU6uR6wVj35euAuTfZsg3bW7HlVSO3Qa0v7s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5413.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWY3SzZ2VGZ0VG14bmxmc0lRbE4zM3UyVCtmRXdRTVYxMkUyaWJuZWJzZDdh?=
 =?utf-8?B?OEFya1V3MWtZekxIdHBpQVgyN0R3bnhUdmdWa1ZlbEpDRU04WG8vcVh3aitK?=
 =?utf-8?B?OUhUZDk2OWZmTkNZU282SjNmaE5pR05iTFhaVGwyTW96WVFBdGdiODVsbUVo?=
 =?utf-8?B?d3lyL01ERE41SmhHU2U5V2VVSTBnanpuSHkvZGJTOXYrL1Qvb3BRbnRpb0NS?=
 =?utf-8?B?amxBQlA5Sk9GRWVXSVJWc0J6SldGZHFMOHRVUVVkQjdQVHVwaGxTRmhLTU1B?=
 =?utf-8?B?eFdGNnhyNmxlbXVBTGhnUWQyQlo0cDU1ODBKSjV3M1RYL0I3cHNVVTB0VXRK?=
 =?utf-8?B?N2VGTU9EQWsvWnpvZ1Nscm0xQVN2d2w5NldicmVGL1MzKzBlMGtWbktIbDcz?=
 =?utf-8?B?SzN2RENUckRCMktoM0w3eVpqMmRZZk95MHRoY1UvVzVoQ3BNRmlETWFVdnJN?=
 =?utf-8?B?WEw4Wm1CbHRXZWpCV3FZRkp1Mks1ZDlSK0Qrd0xUQldJU2h1djZuUzJYY2o2?=
 =?utf-8?B?N1ZGcDE5RVA1TFJUWnR2cWlCZ3JjUWdRZVhOSGRJUVlabzA2V1NERnI5MHgv?=
 =?utf-8?B?QkZoRXJONk5ieC96S3pXc293ZFhPVHdsNkZhM1FVZG5kUkxLck5UQ2c1OFJq?=
 =?utf-8?B?S3pYeVdKeE8rWFczOUlIYVUvc3V2cWM3eGt4KzV3NmlNSHRkNmJKYzVBNkNS?=
 =?utf-8?B?cTdvdm9CbytjODAvdG11Q2dhRXl4YlU1UkJyNjViOElkQzFPUUdXcG1ReDkz?=
 =?utf-8?B?dXdVTi8zQk1uSk5PcEx4MSthdzlVL1RtdjRVcnJzV3FISTJUejlRWXpWQVFK?=
 =?utf-8?B?ZDlzdk1hdHdzczlEWUltbWVOMVNrTms0RkZibGJlbklnTGFCM1dWRHhXdFZr?=
 =?utf-8?B?WHpYa3N1YnhTWm5xUEUwbVBaazZaR0VwK1FDSk1aNkZWYzF3VVBzT0dIdi9G?=
 =?utf-8?B?Uit2VWQ5ZzJTKzVvMGVyeVpzSzQvRWsvdDFoZStlYkQwZldGWExiSmRLVVNn?=
 =?utf-8?B?NUtwRUFOUUxaanFLK3R4STA3cXlTd2xVUFRzR21NL2FjTzdsdFpzZ0NYM2VB?=
 =?utf-8?B?TnRZcVhWR3NBRyt5S2xqVkpFbm9DRDNNcVljVDE4NHlsN0FhUStjQkdEN1dD?=
 =?utf-8?B?dWdlMlQ5Z3hqWnlHRXNoRGRXMFRrSFEzamZQR2k1a1JzNFBlamlmWFhBb1Z2?=
 =?utf-8?B?L0toZDBzajVQWTFuMFltMDFKSm1nY096Rit4anZxVEVaMmZNZ0tjd3FUMzVt?=
 =?utf-8?B?aGhnYmVMMnhlTmh1cFl3RHVSczZFZ3dYeEVnT3hIMFRqL1NYWkFzb1ovZTJq?=
 =?utf-8?B?M3pUNkJPTWgrL0dmVDNua0NzYjFELzhQemZXS3Ixb0ZQQTVIUzVZOHlyVk1p?=
 =?utf-8?B?VWhOTmZrYWdOdGo3QURmYUo5d0hxem1qeUJ0dExKVXFzbUNRYzFROVcvVTA5?=
 =?utf-8?B?UUZzSWU3Nk9NS0VlOERUZXJHT0krMXJMUVZaWjIyajhXdVZkN1pxTEhzQUhO?=
 =?utf-8?B?MmRZRDN5K1NLRmtvTlJDbnFPMVE1ZWk2d3FUNFB5OUNrbzBHUFFZRVR1blRY?=
 =?utf-8?B?MzBTanlYcWVJWlY2NVNhRkxEYmlFWm1OMGVVTUJDSGJ1aG9ZMzlKc0l1Q25m?=
 =?utf-8?B?ditIV2l6L3BtMThUN0pvKzgySWFTNGgrS2I0RWpZczBpR0xRMWpSbGFvVXFG?=
 =?utf-8?B?cUNmYlpUTElZRm1oWHhybStrYW8zUklHZG1lN1YvMVIwMnBjcjFuYzI0VFFK?=
 =?utf-8?B?Vm1mRWlVSjFrNU5CWTZQQk1aajA5L2h3RXRsYjgya0lJdDZMNFhWUkh3Sm53?=
 =?utf-8?B?YkFjbjUybmpMMjMxenc3ck9WWEtUaElZcXlTNmljRjZhK3o3TFl2TTN3WTB4?=
 =?utf-8?B?NFdiSHZWV00zMWhvT0E0YmxCcUsrTWFSbmVkYktCNStLRVZtL1NwV05Ic2lr?=
 =?utf-8?B?bEtPQWFsbURGbkNpdlo1VWxoSytoQlhnWkFUWUUzcU8xZVBrR1hEVm8rTUpX?=
 =?utf-8?B?QXNRYVl6clJQbThXYnJwWjRSR3VNanhhRmg1WEhkMHBOL1lqT1puL0xhSXNx?=
 =?utf-8?B?QUNNTFhCME5qZ2hhMXcrcmN0V3YvVHBSd0lteUVmSTROMFFuUmY2bURZamJH?=
 =?utf-8?B?YUtkTG0xYkVQOHEySGN5dG1VVXR2aEw4ZE5xd1g0OXVEVDBIZTIxRlJNZXZG?=
 =?utf-8?B?ZWdXZEh5MWlxSlNqV01TSFlBdEVpczlUcGVhNERTSGQ1RTFLYmRwRlAwZldz?=
 =?utf-8?B?ZUtJVHYrcHpSdTdkbWx4c0VOcTRvZEgyanpWeFl3Q1JObDMrM2VMcGRUbzJE?=
 =?utf-8?B?dXVkVVZxdXVVOUFSWHAwc0NwWmJhN3YvcGpPb2RVWkpaYVEwTytCeTArSjhn?=
 =?utf-8?Q?rUCQXOlnB94NUjOs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DU+yzQAbpXSFNILGnObsfuasEMnn7Je/JP+N9e2hsyY5an8eZ54q+8wsOa0K2vHvhqiHf1lbBKFW+sDprt1UDtoeSnalXEKw8cLxQskyblmykExlAEEMoEN0IkIN8eaYXse+84a6aIp7/udnVj2tGbySbKUw1YFlxvzbPw+/PUndMG7Y+Lsdy8STMjKftuwD9UE4Exv9I1lvx+CO9X3Vup4tTVaeh2XIZVEMViNnea9CuxICwAa2eaR/64H+WumdxUwPGaUnLiF0sE2+LIDwKYvAVrcp31ElMVp7Czx49Bepl74kBgivDqxSWL96Nsj3XpIhe4f8W1h0oy/aTA9xrg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3cefa3-d3f0-4a48-3ff0-08df1d5c8595
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 12:32:12.5126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u2zJAmWKRZgn6ukmeefjbfrhZcJgS7T5JcaYJmIKeJTjLwMIzII1/ywZYi7VseVl2lagFixXOpCjtjQWM9cWrzPJsehRdTXG52QAVtiwMwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBTZXB0ZW1i
ZXIgMjgsIDIwMjYgMzowMSBQTQ0KPiBUbzogQmhhZGFuZSwgRG55YW5lc2h3YXIgPGRueWFuZXNo
d2FyLmJoYWRhbmVAaW50ZWwuY29tPg0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDUvMTJdIGRybS94ZS9tZW1pcnE6IFJlcG9y
dCBlcnJvcnMgdXNpbmcgc3RydWN0dXJlZA0KPiB4ZV9sb2cgQVBJDQo+IA0KPiBUaGFuayB5b3Ug
Zm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlh
bCBpc3N1ZShzKSB0bw0KPiBjb25zaWRlcjoNCj4gLSBbTG93XSBkcm0veGU6IHVudXNlZCBtZW1p
cnFfZXJyKCkgbWFjcm8gZGVmaW5pdGlvbg0KPiAtLQ0KPiANCj4gY29tbWl0IDhjY2M5ZTBjNzFi
ZTkyZjUzNjE2YWJjMGI2NWI1YjNlYzAwNmQ5NjcNCj4gQXV0aG9yOiBEbnlhbmVzaHdhciBCaGFk
YW5lIDxkbnlhbmVzaHdhci5iaGFkYW5lQGludGVsLmNvbT4NCj4gDQo+IGRybS94ZS9tZW1pcnE6
IFJlcG9ydCBlcnJvcnMgdXNpbmcgc3RydWN0dXJlZCB4ZV9sb2cgQVBJDQo+IA0KPiBSZXBsYWNl
IG1lbWlycV9lcnIoKSBjYWxscyB3aXRoIHhlX2xvZ19lcnIoKSB1c2luZyB0aGUgTUVNSVJRIGNv
bXBvbmVudCB0YWcNCj4gZm9yIG1lbW9yeS1iYXNlZCBJUlEgZmFpbHVyZXMuDQo+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWVtaXJxLmMNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9tZW1pcnEuYyBpbmRleCA5ZGZlOTY1Y2I0NmVjLi4zMmI5Zjg3YTEwZWNm
DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21lbWlycS5jDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21lbWlycS5jDQo+IA0KPiBbIC4uLiBdDQo+
IA0KPiA+IEBAIC0zNzAsOCArMzcxLDggQEAgaW50IHhlX21lbWlycV9pbml0X2d1YyhzdHJ1Y3Qg
eGVfbWVtaXJxICptZW1pcnEsDQo+IHN0cnVjdCB4ZV9ndWMgKmd1YykNCj4gPiAgCXJldHVybiAw
Ow0KPiA+DQo+ID4gIGZhaWxlZDoNCj4gPiAtCW1lbWlycV9lcnIobWVtaXJxLCAiRmFpbGVkIHRv
IHNldHVwIHJlcG9ydCBwYWdlcyBpbiAlcyAoJXBlKVxuIiwNCj4gPiAtCQkgICBndWNfbmFtZShn
dWMpLCBFUlJfUFRSKGVycikpOw0KPiA+ICsJeGVfbG9nX2VycihtZW1pcnFfdG9fdGlsZShtZW1p
cnEpLCBNRU1JUlEsIGVyciwNCj4gPiArCQkgICAiRmFpbGVkIHRvIHNldHVwIHJlcG9ydCBwYWdl
cyBpbiAlc1xuIiwgZ3VjX25hbWUoZ3VjKSk7DQo+ID4gIAlyZXR1cm4gZXJyOw0KPiA+ICB9DQo+
IA0KPiBbU2V2ZXJpdHk6IExvd10NCj4gRG9lcyB0aGlzIGxlYXZlIHRoZSBtZW1pcnFfZXJyIG1h
Y3JvIGRlZmluaXRpb24gYXMgdW51c2VkIGRlYWQgY29kZT8NCj4gDQo+IFRoZSBtYWNybyBkZWZp
bml0aW9uIGluIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tZW1pcnEuYzoNCj4gDQo+ICNkZWZpbmUg
bWVtaXJxX2VycihtLCBfZm10LCAuLi4pCW1lbWlycV9wcmludGsobSwgZXJyLCBfZm10LCAjI19f
VkFfQVJHU19fKQ0KPiANCj4gd2FzIG5vdCByZW1vdmVkIGluIHRoaXMgcGF0Y2ggZGVzcGl0ZSBh
bGwgb2YgaXRzIGNhbGwgc2l0ZXMgYmVpbmcgcmVwbGFjZWQuDQpMZXQgaXQgYmUgZm9yIHRoaXMg
c2VyaWVzLCBJIHdpbGwgYmUgc2VuZGluZyBhZGRpdGlvbmFsIHBhdGNoIHNlcGFyYXRlbHkgYXBh
cnQgZnJvbSB0aGlzIHNlcmllcyB0byByZW1vdmluZyB0aGlzIGNvZGUuIA0KRG55YW5lc2h3YXIs
IA0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYwOTI4MDkyMTE0LjE2MTAyMDMtMS0NCj4gZG55YW5lc2h3YXIuYmhhZGFu
ZUBpbnRlbC5jb20/cGFydD01DQo=
