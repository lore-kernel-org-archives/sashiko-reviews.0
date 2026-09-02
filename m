Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8846372ECA
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 17:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371538; cv=fail; b=YGAHoE0x3YWF4azuwVY9+XCuMQApnbXtIasx/3Ww7SU8uLLdgxoW4w1zlr9MSdrinDWxZxVrEssKKVCNeyyMt3T3dsI1MfvSw47CPBUcL1iIophkhBpo7NO/+OPFwr4NE5ukvQYpWqS6nbjoPV1y+J4/iiPBlrFiPOdAf0HHWHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371538; c=relaxed/simple;
	bh=Tcly6kKFrZS01GRMyQkY2tbzGmsgyJ9MbOSHFlBro3o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E3CCzhPQVYShclAyIC+PR9oMF/0Cmp/IJI8z0Qb11Noiex+K2TLvSjSq1HemC78w3N94UCP5ow5r/lXRn5NFsjoyGOUTJ7F4BgQaI6t9qwC1gRVk9add8tQ1kPS7fe80TYwiw2DcolYeUAHe5r5uup93jKjR7TLCIBzSm2K+jac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKJK3n5r; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKJK3n5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788371537; x=1819907537;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Tcly6kKFrZS01GRMyQkY2tbzGmsgyJ9MbOSHFlBro3o=;
  b=NKJK3n5rR91x5GF+rk9cawnuAM1yrnfD5wb5/DOEuEuSf+0kdVXTtd8F
   hpotUlgpzIlcQRYUbKr0hhzTRieiYN7Yhycfx5AqUojbai33cdaSIfxM1
   AbgZ4jM3GhMC2pDjmaizdgoRbHq3rSP4mWOSFZAkgxlZUqIHss2mH9hjp
   3PAgAttWXrmr0RfrqookgNheCpFgjXc6pfVE3PW3hg4vp7/hb3AWpzOeC
   tkoBkRVJ0eNh/P/rMn8bZ/rG0LPct357h2J8l5682toC3WGhdetXCn95E
   Y/MolASqnKYhstZmO+BsDyYbPZNq2bqZZkyQcT9uM3TSwovSV7BYeR2uI
   g==;
X-CSE-ConnectionGUID: IXQqnC3JRrqS8rGPjO6MiQ==
X-CSE-MsgGUID: yUM1eOrVT7iBl1sVKtXMCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88605247"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88605247"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 10:52:14 -0700
X-CSE-ConnectionGUID: EKwTIpmWQZ2U+AIZ7vOVcw==
X-CSE-MsgGUID: Ein+10q8Sd2HnO6prmqQtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="266237204"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 10:52:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:52:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 10:52:13 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:52:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mX9Lo4do3IFRL7fmuiPVBUhTiTE0Jc7kW2EPqsr2qb6aSV0W8TvSBEsb8ezNRrS03RY6VTqXZleAlCPigXy9Qq8tm8vG7DwQXS9y2tMwEWRYXG5ebZ2EGTv5ytGTxaGmIOc9FW0hALQ+k1HkDNBWBGDBHY8uw+AEPrtzknBp1J7VDjuaWcBKP57mD2o8kp32BypgMrwdROcsmC1BTKJ8GUu5RSqIBpXGey8Gn7xaMsuALwX656atghrfisdS2/o/Z5b8s5CYGt1XHoNIvMv82NrbgV3GUpRf7UACM3i9L4vigwqy6CqUrKSuHYBfzXQtVGMKsCFagoV4QTeJvDDCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tcly6kKFrZS01GRMyQkY2tbzGmsgyJ9MbOSHFlBro3o=;
 b=myCfmx0iIANTRDtJTDt5iabTGqSRGcuwx5uhn6tQ0Z8ff07lwFrfFfc9vx2Swo7SK4VTZlrnSuCqvjSylBM9pPKx5DQTmnjfzdUPw6DBlnfJu14qNkl27MkzAKisu4+VloHfJaWIA+30L3cBRc8BlhcBdazoy32MROXLzIJKveZ9IvtQebT1+eGI0LR8shUWhPghb9LaZj96WTjVyBAgrYvb+SRSFulAhtCeE2ecAuRivJ5nW02vZ8gJ1/XOfBPhzaf+XHFfGPbak9OG+dnoXrUet/426lRPxXWaJuR9ypwV0CHHoYhexIUjyveMKxMkMtRKYbj+DKIuKqziqKKbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA1PR11MB7872.namprd11.prod.outlook.com (2603:10b6:208:3fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 17:52:10 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 17:52:09 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V20 06/15] drm/xe: Guard teardown paths against purged BOs
Thread-Topic: [PATCH V20 06/15] drm/xe: Guard teardown paths against purged
 BOs
Thread-Index: AQHdOusO10Kmh4TlMU6BLNXfjB0t4ra7cb2AgAAfrOA=
Date: Wed, 2 Sep 2026 17:52:09 +0000
Message-ID: <DS0PR11MB8718526E204E1F6D3E810F7581B72@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-23-tejas.upadhyay@intel.com>
 <20260902155744.0ADA41F000E9@smtp.kernel.org>
In-Reply-To: <20260902155744.0ADA41F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|IA1PR11MB7872:EE_
x-ms-office365-filtering-correlation-id: 4a414ffd-87ef-40f4-1d32-08df091ae95d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|4143699003|11063799006|5023799004|10067099003|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info: 3TXaHQBPrT7tec1VcJTSChHoorgrQMDJn4ul4VYFGfrme74TOMRzOUwm08WfIYTap4YCoN85GVoMsM7ozz9XUsaxU3bNKRYMYu/O7FLgK++az6k9oaG+YsHBCX6dEPxXvdqF747He+pKR1g55DUNgORGGns9CvKh3okOEeDeQwcr8+VpCtFlziGe7uvnkMsrMmUOFzUps0gq/cs6suPmf8m6L4Z8krXcXt3diEgBS84I044KxkPRzEU+TMLgXIlMScBuCin29zTFrsui5x3aVKfoXELqQ+7Bk5IedruArOo/z6CgVu7E1cjMTdMemSTExkhD1BnubZR45+gvTvJqU5ToTMJ9Rj2n1nf893evG7vhqSD0wI6UFanoUpATNwxqCmK+mmZTTO3VH3fH6TKMGWxwLZsrJuQRRPDrOyYxBT+s+B8pRuNq1+rCCa2Y1I20W3QImf2d3aHbcX6jpFy+7/MMHyXm74NhqeWIFWjq/Njsefcka1EX3EwOmXSsT2UCk6VOznwlf2d0W47TPmpBqmFXlkZ58oVNZaf0bbTzWue31kfatpHnmTPcTer1m4LDHoZWlMPTOnPx1yU3Cr1TS7mDbJjR1I28CMlI2kocuIC8OGRrnnqfx4hbQRecLhI7ZgIsDkFIKe8GwoohyUVVRVbykbWIHyISmKWxDsF5094=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(4143699003)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmsxTmN5Tm1zbWE5VldRUVVIdHRzRDZUODU4T1gyV3pEUFk3cXNrRmpjV1o1?=
 =?utf-8?B?Q1R0WW13a1BSdEowdlIrcFFlc3VVcERyY3VESDh1VFRyL0JoeDk0WlB0b3Jt?=
 =?utf-8?B?WDFzYXV1QnMvM0ZuL2R0V2dlYlhySTZIdXVLWGtjMzg0YlFVaitMWW1YVkhz?=
 =?utf-8?B?L3ZwdGovejhWUkE5R0w1UVAxdVp4Kzh4ai9GSytiYlB4a0pWQVlJZkRmbkhk?=
 =?utf-8?B?MS9yYXJKY05vRDE0R1RmVXpzUEVaaEhkWmx5VTBXOVpTZDR5dTFLdXZsak9F?=
 =?utf-8?B?UVdoakorUk9pajROaVdDbUF1ZmhJcDhpTzZobVNiY3p6ZjBCOEFUcFdZNzF2?=
 =?utf-8?B?QVdZdVBGeWtUdUtSRjlBcUd2ZmtrTEtpVUV4b2xrZDBhZlovMEY2cHNhejFT?=
 =?utf-8?B?R1RiTUczMnc5K3Vsb2lCbGVxMWJuRnFsQ1ZyWVVVUDZBZW84ZGorRmxCSVo5?=
 =?utf-8?B?QnAzSlA3bHVzYlFyclNPZVM3OXhTd0lmU1ZSdlluc1hjVXQzZmQzOG9oUGda?=
 =?utf-8?B?YWdvd2wvcHlmNnR3ckNjWDZrOC9wME94bFBYTlFpOGxDcXA3N3BlT0tvb29X?=
 =?utf-8?B?eTVzTGZ1RXZQK1FlMjVyeUZtbDhaOUdvMlFzMUlDS0ZXWWlBQjl6dXFuVmJq?=
 =?utf-8?B?dHRiZnRqdUxvQVBNejlYbmVXMUdyRDZITFlIWkRZWVpiWjQ4SVZreGlMb1ha?=
 =?utf-8?B?amh4Z0RNS3Q0NlR1R0tDNWxoaFIxenlKWUdSS09mem5ab2NRL2RMb3JhZjk0?=
 =?utf-8?B?QXdIVUpTUEM5TURNMlJlRkVOYzVGT2puV0IwcVZaQXMyNk1KL3BnTm5OT2dD?=
 =?utf-8?B?dUZ5R2hkVUF0cmxPcWQ4U1crYmdDL292QnNyVXFQeVNpSXRBMVc0U0gzeUdC?=
 =?utf-8?B?SzVjMVphWnErWExuQUJHZEZVZ2xGVmlDOGdyU2VmTXNuVTlRTFdPRnE5RVZ1?=
 =?utf-8?B?bDJpMGZaSGU5NWd5TERiRmMzcVRvRktmMFdBVzZZdlZvejJ0S3hGUkFhYnRz?=
 =?utf-8?B?MVpQUk9rZVFOa2IrazZENWlicGlMQ3R1UlNjd3d3QmFydTJSdXREWDFDVXlZ?=
 =?utf-8?B?TlJFUFdpSFJyK3Z6TjNrRWVFNTdVdDQwTnBoVlN2U1hjYmlLemxFQ0Eyc09B?=
 =?utf-8?B?RmU4aVlnTlRmWStIekVlczNxK0dNb3pvRmpHSU05aGNRaVN4UjZ6SHhmUmt6?=
 =?utf-8?B?Vnl1UjZQRE1jdlNZaXRLRDZEY1lUZlN3T01zZkRRL21iV1Jaa2sxWTgzWVpa?=
 =?utf-8?B?bVk3b1hleXl2OFZ3SENaNzA1eVdGTkxXczF2dytkMFZONWQrUlJNNEhpTHFz?=
 =?utf-8?B?OHlJS051Q0lGZzhMSWoxd1g5VGxNck84d1V5NVhESEYrMG45VEJzdUNacG15?=
 =?utf-8?B?Zk91RVNWZVlWNTAxbGQwRk1PTk1QS3ZQVldDdkc3UWlOek54eTUvN25zU2N5?=
 =?utf-8?B?RTFyVFFNM3VwS0tVRVQwU1JHN0ZDUnNqUHFKcGxRbFIybk9teVA1TW0zdjNk?=
 =?utf-8?B?ajY4azhNY2VieitKbzZURjdHckY3Y1k4MzgxdlpFSWZzc3NCSG12UzJhZ1FB?=
 =?utf-8?B?NGVkZmVzSUpZQk1qelR0bjU5cytjQWIvd2ZlejQvV2c1ekl4U3Q1SFNadDlo?=
 =?utf-8?B?SWpRb1VpWjV5d1ZlNlhXbVdkbjVCTWRsSDRQeVBXMEw0L3d5M0ZFWkt2SUpR?=
 =?utf-8?B?TGhBSmQ4cEJoZG9YRE8veEwzdGtPaFFnTms3UUlKTGpuWFc3NGVJMklPWUZT?=
 =?utf-8?B?VkdsWlBtRVRSSmRLcklaNWR2Rld0TksvbXRlVTdjS1RDQVYwVWZRSjJ6WGFL?=
 =?utf-8?B?a080elNpOWQ3OGNEd0Jra2hLYTBaYmpvS0Y1bTNnWXBZdHl2ME1UTEk4eG00?=
 =?utf-8?B?Vm1nTTJZc3NOTVppdEkwYU0xYlprTHFFSkJYT1ZuRlpsTmVzaU01VkpsbVh1?=
 =?utf-8?B?YVR4Y2xLRkRnd2IyRUZsTzF5czBLMFQxemV6alZrSHdad1BlcnljVnVQS2c4?=
 =?utf-8?B?dE9sNWREVUJmSlIvNms1bnNhbjFJQldyR2g1eC9jWXNic252T0E4SWF0eGVn?=
 =?utf-8?B?UEVZWU5CUjAzMElxcVp6czFRdE1pWXFKYmVIbUpLdGdJdnBvWEhma3c4ZE53?=
 =?utf-8?B?ODdDbzFEYnRnNmNjZ29zd0hvdzVza01pREp1bEpvNWZXRDVhT2pyMk05K1c2?=
 =?utf-8?B?NXBhbERVRkJKdmwyY1M5RHUyUDRDdXlMMTNtUUR0STNPVUdQWGhGRGxmTDhv?=
 =?utf-8?B?NXhiN2g3YlJFbnBlSnp4T0UvKy95NmJ6QlprK1BhZlN1QnE0QjBxSUUxVUN4?=
 =?utf-8?B?d3Y0RVBGOG5tckRnWmtzOTJQenNTUVpQeENac3dZNlgwYlVyZy8wQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YG5IHwCrCT7UfwkdiYuiIeOGYpKC9CxS3EmVXu9FEL3woy1UaarDJD7hGT31QVYfROHeUf7flDn2LG0mEqEwtBxO8arCljZh2W3db3XA3wdJXYxRyGqLeO6Y1eV6LRpXLSViRT/fTer+Ili5FFck32nOyYe+cyzPkRgFeMQqizhde37b/D4430gt/CxVKfQuvf71QyIcKMeFY0rOjCP8Xwj1v0FFZSkiA4FHAsWJWJB6YluOIYOa0uJsJUP9D3/JqQ1LSxUsUqiZez8eZR/283LnMe+YwxKwYCqvAjtbnS4rBvanm+8lx3I8r+wtQWzapKkaAsXGJsVlC8yrw+guIg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a414ffd-87ef-40f4-1d32-08df091ae95d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 17:52:09.8468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AmdOgJk/d/EiOA0dfAI5sKl5tDmtWbS/JVbNvUfeE/6AWX3q6rx9QMYcDyhOgtyjhIIwhYBzoL1QNOoxxVjAgX7Z2DZnUZuMNRavviq7aFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7872
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMDIgU2VwdGVtYmVyIDIw
MjYgMjE6MjgNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29t
Pg0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggVjIwIDA2LzE1XSBkcm0veGU6IEd1YXJkIHRlYXJkb3duIHBhdGhzIGFnYWluc3QNCj4g
cHVyZ2VkIEJPcw0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlr
byBBSSByZXZpZXcgZm91bmQgMiBwb3RlbnRpYWwgaXNzdWUocykNCj4gdG8gY29uc2lkZXI6DQo+
IC0gW0hpZ2hdIHhlX2JvX3VucGluX2V4dGVybmFsKCkgaXMgbWlzc2luZyB0aGUgeGVfYm9faXNf
cHVyZ2VkKCkgZ3VhcmQsDQo+IHdoaWNoIHdpbGwgY2F1c2UgYSBjcmFzaCB3aGVuIHVucGlubmlu
ZyBwdXJnZWQgRE1BLWJ1ZiBleHBvcnRzLg0KPiAtIFtIaWdoXSB4ZV9kbWFfYnVmX2JlZ2luX2Nw
dV9hY2Nlc3MoKSBmYWlscyB0byBjaGVjayBpZiB0aGUgQk8gaXMgcHVyZ2VkLg0KPiAtLQ0KPiAN
Cj4gY29tbWl0IDU4ZGY3YmY0OWM5M2MxYzcxMzRmNzNmZDgyMjRkZTZmYTBmOTA3ZjMNCj4gQXV0
aG9yOiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBkcm0veGU6IEd1YXJkIHRlYXJkb3duIHBhdGhzIGFnYWluc3QgcHVyZ2VkIEJPcw0KPiANCj4g
VGhpcyBjb21taXQgYWRkcyB4ZV9ib19pc19wdXJnZWQgZ3VhcmRzIHRvIHZhcmlvdXMgdGVhcmRv
d24gYW5kIG1hcHBpbmcNCj4gcGF0aHMgaW4gdGhlIHhlIGRyaXZlci4gSXQgcHJldmVudHMgdW5w
aW5uaW5nIG9yIG1hcHBpbmcgYSBidWZmZXIgb2JqZWN0IHRoYXQNCj4gaGFzIGFscmVhZHkgYmVl
biBwdXJnZWQgYnkgVlJBTSBwYWdlIG9mZmxpbmluZy4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4g
PiBpbmRleCBjMjU1MzI3NjY5ZGE1Li5iMTYyNzUzY2ViYjcwIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2JvLmMNCj4gPiBAQCAtMzI2Nyw2ICszMjY3LDkgQEAgdm9pZCB4ZV9ib191bnBpbihzdHJ1Y3Qg
eGVfYm8gKmJvKQ0KPiA+ICAJc3RydWN0IHR0bV9wbGFjZSAqcGxhY2UgPSAmYm8tPnBsYWNlbWVu
dHNbMF07DQo+ID4gIAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHhlX2JvX2RldmljZShibyk7DQo+
ID4NCj4gPiArCWlmICh4ZV9ib19pc19wdXJnZWQoYm8pKQ0KPiA+ICsJCXJldHVybjsNCj4gPiAr
DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IERvZXMgeGVfYm9fdW5waW5fZXh0ZXJuYWwgYWxz
byBuZWVkIGEgY2hlY2sgZm9yIHB1cmdlZCBCT3M/DQo+IA0KPiBXaGVuIGEgRE1BLWJ1ZiBleHBv
cnRlZCBCTyBpcyBwdXJnZWQsIGNsb3NpbmcgdGhlIERNQS1idWYgZmlsZSBkZXNjcmlwdG9yDQo+
IGZyb20gdXNlcnNwYWNlIHdpbGwgY2FsbCB4ZV9kbWFfYnVmX3VucGluLCB3aGljaCBjYWxscyB4
ZV9ib191bnBpbl9leHRlcm5hbDoNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kbWFfYnVm
LmM6eGVfZG1hX2J1Zl91bnBpbigpIHsNCj4gCS4uLg0KPiAJeGVfYm9fdW5waW5fZXh0ZXJuYWwo
Ym8pOw0KPiB9DQo+IA0KPiBCZWNhdXNlIHhlX2JvX3VucGluX2V4dGVybmFsIGxhY2tzIHRoZSB4
ZV9ib19pc19wdXJnZWQgY2hlY2ssIGl0IHdpbGwNCj4gYXR0ZW1wdCB0byB1bnBpbiBhbiBhbHJl
YWR5LXVucGlubmVkIEJPLiBUaGlzIGxlYWRzIHRvIGEgcGluX2NvdW50DQo+IHVuZGVyZmxvdyBh
bmQgZmFpbHMgdGhlIGFzc2VydGlvbjoNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5j
OnhlX2JvX3VucGluX2V4dGVybmFsKCkgew0KPiAJLi4uDQo+IAl4ZV9hc3NlcnQoeGUsICFiby0+
dm0pOw0KPiAJeGVfYXNzZXJ0KHhlLCB4ZV9ib19pc19waW5uZWQoYm8pKTsNCj4gCS4uLg0KPiB9
DQo+IA0KPiA+ICAJeGVfYXNzZXJ0KHhlLCAhYm8tPnR0bS5iYXNlLmltcG9ydF9hdHRhY2gpOw0K
PiA+ICAJeGVfYXNzZXJ0KHhlLCB4ZV9ib19pc19waW5uZWQoYm8pKTsNCg0KRXhwb3J0ZWQgQm9z
IGFyZSBydW4gdGhvdWdoIFNCUiBub3QgcHVyZ2VkLg0KDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RtYV9idWYuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RtYV9idWYuYyBpbmRleA0KPiBiZjA3Mjg4MzhlYWQ1Li41ZDlmMWNkMjRiN2YzDQo+ID4g
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RtYV9idWYuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kbWFfYnVmLmMNCj4gPiBAQCAtMTA0LDYgKzEwNCw5
IEBAIHN0YXRpYyBzdHJ1Y3Qgc2dfdGFibGUgKnhlX2RtYV9idWZfbWFwKHN0cnVjdA0KPiBkbWFf
YnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwNCj4gPiAgCXN0cnVjdCBzZ190YWJsZSAqc2d0Ow0KPiA+
ICAJaW50IHIgPSAwOw0KPiA+DQo+ID4gKwlpZiAoeGVfYm9faXNfcHVyZ2VkKGJvKSkNCj4gPiAr
CQlyZXR1cm4gRVJSX1BUUigtRU5PRU5UKTsNCj4gPiArDQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hd
DQo+IERvZXMgeGVfZG1hX2J1Zl9iZWdpbl9jcHVfYWNjZXNzIG5lZWQgYSBzaW1pbGFyIGd1YXJk
IGFnYWluc3QgcHVyZ2VkDQo+IEJPcz8NCj4gDQo+IElmIGEgRE1BLWJ1ZiBleHBvcnRlZCBCTyBp
cyBwdXJnZWQsIGFuZCB1c2Vyc3BhY2UgaW52b2tlcyB0aGUNCj4gRE1BX0JVRl9JT0NUTF9TWU5D
IGlvY3RsIHRvIGJlZ2luIENQVSBhY2Nlc3MsDQo+IHhlX2RtYV9idWZfYmVnaW5fY3B1X2FjY2Vz
cyB3aWxsIGNhbGwgeGVfYm9fbWlncmF0ZToNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
bWFfYnVmLmM6eGVfZG1hX2J1Zl9iZWdpbl9jcHVfYWNjZXNzKCkgew0KPiAJLi4uDQo+IAl4ZV92
YWxpZGF0aW9uX2d1YXJkKC4uLikgew0KPiAJCXJldCA9IGRybV9leGVjX2xvY2tfb2JqKCZleGVj
LCAmYm8tPnR0bS5iYXNlKTsNCj4gCQkuLi4NCj4gCQlyZXQgPSB4ZV9ib19taWdyYXRlKGJvLCBY
RV9QTF9UVCwgTlVMTCwgJmV4ZWMpOw0KPiAJLi4uDQo+IH0NCj4gDQo+IFdpdGhvdXQgYW4geGVf
Ym9faXNfcHVyZ2VkIGNoZWNrIGJlZm9yZSBtaWdyYXRpbmcsIHhlX2JvX21pZ3JhdGUgd2lsbCB0
cnkgdG8NCj4gbWlncmF0ZSBhIGRlc3Ryb3llZCBidWZmZXIgb2JqZWN0LiBUaGlzIGNhbiBjYXVz
ZSBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZQ0KPiBzaW5jZSBiby0+dHRtLnJlc291cmNlLT5t
ZW1fdHlwZSBjYW4gYmUgTlVMTCBmb3IgcHVyZ2VkIEJPcywgb3IgaXQgd2lsbA0KPiBzaWxlbnRs
eSBtaWdyYXRlIHRoZSBlbXB0eSBiYWNraW5nIHN0b3JlIHRvIFhFX1BMX1RULCBwcm92aWRpbmcg
dXNlcnNwYWNlDQo+IHdpdGggZ2FyYmFnZSBtZW1vcnkuDQoNCkV4cG9ydGVkIEJvcyBhcmUgcnVu
IHRob3VnaCBTQlIgbm90IHB1cmdlZC4NCg0KVGVqYXMNCj4gDQo+ID4gIAlpZiAoIWF0dGFjaC0+
cGVlcjJwZWVyICYmICF4ZV9ib19jYW5fbWlncmF0ZShibywgWEVfUExfVFQpKQ0KPiA+ICAJCXJl
dHVybiBFUlJfUFRSKC1FT1BOT1RTVVBQKTsNCj4gPg0KPiANCj4gWyAuLi4gXQ0KPiANCj4gLS0N
Cj4gU2FzaGlrbyBBSSByZXZpZXcgwrcNCj4gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwOTAyMTQ1MzQzLjQ2NTY4Ni0xNy0NCj4gdGVqYXMudXBhZGh5YXlAaW50ZWwuY29tP3Bh
cnQ9Ng0K
