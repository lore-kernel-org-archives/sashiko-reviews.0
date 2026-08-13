Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6861E4854F0
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639886; cv=fail; b=MOh/SRBoBwYeDISNDBX510zV5BRAFq96YxxBktcXqsM0BpNBn5/SLuS80I9V7AnWRgW81g8GzLjDWhBIc4twFAtlyo79fhBL4PVcfwYYew4ow5drtHGu06VgFCgXPBp/mY9Mq6zboVO4aZFKFz0xZI/cmbFh5CAhFmGRzkQUdlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639886; c=relaxed/simple;
	bh=+Odb/SQUTAq4TdRm5uFtK38V3jcgl6vAV/5ApW2Gwxs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MepDthMW/l0CLrjgfCbajJb6BJY/eTpQyuXkusRLUp3DLgcJevetUhitXz1Xmi6NCzyFBZN8Yaxd2SsXTF9i2vrECGJKeAI+xsot5VVrLB/7+w7xvMFVYIOHVaGsth9TzGmaTbXpqKumx5iGgCjpX1AaJnBlvBMBq2YtQnNpxkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M57sFACW; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M57sFACW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786639885; x=1818175885;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+Odb/SQUTAq4TdRm5uFtK38V3jcgl6vAV/5ApW2Gwxs=;
  b=M57sFACWLS26PFUlsWC+uAqi8NmgflI+z2Wgmrb34OSUE2RFn2TKufpg
   WTLj268lN1YLnbPRiMmTexRe+LE8YBiNbrj6WVcm+mqq7fTMPG+fDUpFy
   6bQpgRhmlUdx2/C74u0Q8Wc10yFC3rYTpdOTpb/K1FZdGVlGRKeTKFqNm
   Jl5smuxhmzWRrXYnU+Ks1uWqx6ew22I7Z2pnWuAxepdKnEDaQ24TZ6ScW
   lOoXjciDEe3Fll1GZLGLIn0bYuD4lcRhPw7l0Fij105QtNqbVKIYQPclO
   HElwh4IdCEudGHNC1rcHxzkcwT4Y518VzmSkR4yNKc9lAlidaKm/bswDA
   A==;
X-CSE-ConnectionGUID: /muYR07ERdqnNKA8cT9ZNA==
X-CSE-MsgGUID: bdg7fcf0Qry5Dy1/t18v0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87437184"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87437184"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 09:51:24 -0700
X-CSE-ConnectionGUID: SCuuJjapRQWoxEp9OWJpdQ==
X-CSE-MsgGUID: yrBQmCPcTQKTWjMCB9sqvA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 09:51:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 09:51:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 09:51:19 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 09:51:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3/CIQ1EPt3DqrqXzQEFgHkstbPainLE0bCyzK/NHU482W7mv9uL4tndbJEkuApnmT56I//rX9wD42mUmNEUhmQHqwlcKvN+NlxJ51VV8uy6SsrjRGA6gip2a7OUoSOpC6i0wL+CP92PeQVZRgkbDIfamzu5MGvSbJWY3R7BPorQnz+wucu0V5U+H61WN+w+mLPbg7zv7O04zvBPsVfyJw5H8lqfadiLN+T60lW5XgMNn0gZwdZc+kCrRhv+Llo7cS0CafXcTX5/nSwRlvSKn5KkDSsWGGz02SZMO7FcLRQKJj1vqqbTq7lL21e+ePXYczvAu6k2GCT89phq5xErzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Odb/SQUTAq4TdRm5uFtK38V3jcgl6vAV/5ApW2Gwxs=;
 b=X5MRNUkaCttvEO+A2+5hSSOMMkGn6chWOrz0GKDdkhX70bpXhK0JcoytStz2ubvE+x41OzdjZR1C1+ziC3H4sHK0u8OiXWSic1mh2WRiM0P8/PnXDKvA+dxRGNpNlwuJ4oreP4G3sUmaNmj2Ik//gfjIdlSpdqoChlMqTxt9cNKEC/WWtvQtqXKonV1TYFQ5lGowx6pN6QHziqlPWQu0RVAsO9OQ9n/EIdn/tR3zMu3wCUNf6Id++0b9xyqzXylfuJZrhFNSO9I3Mn6KD4D2cPLEJ9HlVsf02mBYk5uxhgrwYr6fj69EGeUGFfz9org5wTINF0LAMmcOBTLG9qSmzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by MN2PR11MB4597.namprd11.prod.outlook.com (2603:10b6:208:268::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 16:51:15 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 16:51:12 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 08/10] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Topic: [PATCH v2 08/10] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Index: AQHdKpIo3+ofk7XMPk2/Jk3zAEG1iraa1F+AgAFeHjA=
Date: Thu, 13 Aug 2026 16:51:12 +0000
Message-ID: <IA1PR11MB64188482F342399132A766FCC1DB2@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-20-michael.j.ruhl@intel.com>
 <20260812195710.42D571F000E9@smtp.kernel.org>
In-Reply-To: <20260812195710.42D571F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|MN2PR11MB4597:EE_
x-ms-office365-filtering-correlation-id: 6df9470c-32f3-4707-e546-08def95b152e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: tBAHyaWnZJjSaUsTGpck3eZfKmkFJ0rW9TID0FzNkNByU396JJMVwTZ3xIEP8qZGSm+I2p4nBL8sq8dtcqpa9Y0UrUSrItmlElkutTzLqNphANS8JMdcFnd2Q/EsL4I8f7b738++noaMFRinyCLvYN7qCeb9+nEOLQRrLMCkbkggpJkzvMYOelLXIKLpVKlcfGIENZr54n/XKKGp9Q09t0n0aZhp0axpnFBWeEWvT1KC7dKXZbyh3RiG0/BwvqH20vK7RCwfg4BG1pXHo4WNptS/HnpIQUWnJWmFBnkqylGSSflyDwBivshtYw36KKtJZwnmBkfQ+dKU7mty5i+oBLykzWZuE6bi8Xqmz4BV6ZG6p5Dl0v9eV/ZvImdMNY4wtsu+Q1ztyy+WnDuRT7sfYCQo+UnEphhjKZ/l+iui9Hwye/Lpw8naWX1OFFJo2NsMGlg7KaxYV2jrFGKVtG/d3hGi+xdJCYK2WTFTPb7wOz1nMZhDA09XBN0YOHMLlKLODDZxKTHkCGkq8DEr25b5bvMkIV60rNS23/6WPyPJ1MntTl3f0m0Pz4VYnMFV0+brAGhpqLf81qXOiR09jXwt7aGlAJ7p3aC40/ui72hngiuBQ8yRxIHOLygh/Ssossb4saOVCivjcq6gp6fFyAcwYFdw7YMbdZEX5CyvgqgMZXA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkJWc042RTUwRzhDOS9lMHhVVlI4VmViWGhadmxZSi93cnpEQ2dBbjNWdk1s?=
 =?utf-8?B?N3ltMWV5YmNYODhpTktPTHBobFJJQ0RqYzBueXRRSHFSaDRKWVA1ckV4K1c2?=
 =?utf-8?B?dWx2VmV3OUFtTlVnZzlkcTVvSytFeGs1bjVqR0dDanBVSlJSTFFDT2xLd1Uz?=
 =?utf-8?B?UDM0Vjg0SmVsQWxFbkt4eXpqWHo5SlBsMG1JeDIvRWU4VFdvZWFodDhUNUUr?=
 =?utf-8?B?TjFyN0wwdXo3VDNFTUp2djlWeVZGVlVnM05YWkI2MnZrYWJ1V1VoSGh5T25t?=
 =?utf-8?B?SFQxb1RsUmh5SVZmaVNRNGowVU54QldGZjlGcGRpbHZ0Z0Y4SmhJb1NrVFlB?=
 =?utf-8?B?Q0hrT240cS9SWlhHZDFPS0Q5UVZnQmp1V3ZrYllERElLeUdNbm1uZHNoWEJ6?=
 =?utf-8?B?WFNPVnA4c2pVRWFFSzRiTEFGNGZ6Q0dsa05lU2xpS1YzYlFxL2VtUXA1TEJS?=
 =?utf-8?B?NExFajRhRFRxdTc0L0pFME96dnhOQjl4NjdqWUFreFlCWm1FSU54a3FHeG9t?=
 =?utf-8?B?UVY2eXlLbWZsRHBzRmk5TnZ1WDYrQ3hGcllSaWZBSWZhcTVYQWx0OG5walBS?=
 =?utf-8?B?bjdCWUdDK0c3L09IZTZHNTdHMEY4Q2I2SnUyak1ZdkgyOU1WU0dhOWd2R0VJ?=
 =?utf-8?B?Sk5zYkowUDkyV2VMUEYvZEVITksxTWR5K0Z6NDgySk5kUDFrT3NVS2tpM3lI?=
 =?utf-8?B?cGY1VXlsejRlYWZBT0xzRFNGSEM2UUhuKzk4VTQwMDdJa3M4Zy96dWdqOFBG?=
 =?utf-8?B?WWcvaW80ZFhjNWQ4VnlyWEhneFg1cnRZL0V2Wk4wRlI4eWVSUVBKb0ZlWi84?=
 =?utf-8?B?ZXdiNjExWFR2ZDU5T1NTdU5MZXZqSHg3TUpwMWlRZm41alBKMUErcGs5WWlB?=
 =?utf-8?B?Wm5FYlNCVW5VSlhINjdrMTRSdG54ZjJmdmg0YWNvSG5YSDJJNFZQZzZBc1Qw?=
 =?utf-8?B?dGIrYUY2Rzl3UXU1dTM4N1BGVXQ2TmFSSVVoRkN0dnQyZ2hPRTIySjNJR0oz?=
 =?utf-8?B?MkY3ZTFYaWkxdWNmWmVYTVZOUmNqMHFBYmx1RDlwOU85SjdybWVVQ2grUnNx?=
 =?utf-8?B?K2ZBZ0VRTkZEY3QxanpKdkY1YXJYL1NEdm5JbDdlSFdJUjlsZlF5L054aWtM?=
 =?utf-8?B?dTR6Y0N5ZFcwWTNqaUUzZGQzeW9kMmpXdXNPSkdNMTV5MGRmcGpjRlpJVjEw?=
 =?utf-8?B?Y1dCTUtXL0x0dlNINGtuU2I2V25NaEpoQm15MzBwOFZLU2VMV2RtWnZ0MG5y?=
 =?utf-8?B?cVNBbFJxbUtrVEIwS2dtVWc1UG1ENmlETmJJZzZtYmhReG53OUZzZnQxeUlq?=
 =?utf-8?B?Y3gvQjNHREhzY2MzMUxHc2RlL3F4TFpFRVhwa3FLd0Jyc2FKNE8xWnhGTEhw?=
 =?utf-8?B?Z3VyMWJ4cFpCQkM0U0VFWkxuSnA4aUlxMFppbUJkYVJ4VWV0ZitxdVhUNXQ2?=
 =?utf-8?B?OVhpRExXdUZncG9LUHQvQVNZS1o3WmtGR0ZjTzNKNE5ybGhHK1crdW51V0JC?=
 =?utf-8?B?SXI5U0p2Yzh4YlJkRlAvVGFwWi9NM2doczZ2cDhwcEgwNFdDcXV2RjdqUkMv?=
 =?utf-8?B?eVE2N2Z6L2psbitIcHNRaklmbmtDL2wvenNEdXFEZjRJaHVpZ0FaYTEzS2pH?=
 =?utf-8?B?TzZaSDFMOXZUMS90SmhDendJeVJIOEF3SkhPaWxiaEdTVC9zMmgxY25DVUZp?=
 =?utf-8?B?ay9rQ3lPdm85ZkRzbzEyMG9YeVB6dUNBbThuU1ZOajl4Z0pTcXNvSjVYek1B?=
 =?utf-8?B?ZXQ3VS96TDlmK2hmbmNsdS9VanVJVmVydDkvU0dTK2UrMjlKUlZHSzBIRGEv?=
 =?utf-8?B?d0dQOXhPaDduMkRMOEEvaTlmTDlKNGkwMk0wM3RJWkVWdEpsUkwxdWhHa0NQ?=
 =?utf-8?B?bFRTR2lLS0t3YWI3Vm5sMXkxclgrdC9CNEIwL09xU2VVYnBLcEtTWTJuSjBF?=
 =?utf-8?B?WEdRZnkrbk5nWFRoVGdqUmtEeXk2WHQvTjEvblAxTnNrd3RmU1B3aUJiSXBO?=
 =?utf-8?B?UEtzUE41K3o1cklKcXFGUTFBZFlGZEI4c2VVT3VBakIvZ0N5UjBNY0ExWUJK?=
 =?utf-8?B?Ny9LN2pnTldkQmkwdm5DSVUvMXovb1hDdUZTRXJlUlUyeG1ScDIyd2ZWbUFL?=
 =?utf-8?B?UnkrS1A1RGdJK3A2SDBGVHpKZmZEc2VCYXpjY1UzQ0JVbEJXaDRGbGpGTlRt?=
 =?utf-8?B?OC92ZENocmZWOFJNdmZ6YzMwazJrNjZJMkNGdDlRUy9ueGM1QVNJOUlPVjdH?=
 =?utf-8?B?ZmlwVSt4bDNWcUdwL05tRjZmbHpPM0tkU2IwVG1PNWh0elNnOVFPdmFxajBr?=
 =?utf-8?B?TUhJa1lJbmIrblpuVHh4TFA0VkZOWFVVR1JZajZRZ1dFS0hVNUFvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MRf1dLqX2hK5fBYi2sEWYeJ2B502P7rQjB6iq1OG8LwABKGdFbeZScwAcGCsFGI7taVJFfNNtmGb9wLmDzGz1nooFhzrCq49/2SRM7rhS9u+W7PaFv0x5/dG5PGgm5eQ+R5JKg9Ck4pvNodXzo8cfsosFVB4RoQbk52ZLlHW8kIm1kXsuO7nCMRPgeyRA3Y8TxGJnShBVoJ6MC2QMN/RcZlE+O8RB2tsMbROpERDDZJUbg/bYgUFHZ+A+RS09rUFgeIHE4UjNjtFdNxqUKPoGCVXKjvp4HtnIdZ0Rk3mVshm/SPG9AI0Q506Q/vHL8BbhQFHI4jLmRaMiDPfUq33NA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df9470c-32f3-4707-e546-08def95b152e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 16:51:12.4972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ZfQa4lvcj9e+fXZeeukhSt6HjSc9qQNvYHQgAzE7kZSw0i5m9SwS9b6lIUjULtko3/EbOhF9jMcdndiPafVeRchzsIzAii/zdQimMFkxlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4597
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxMiwg
MjAyNiAzOjU3IFBNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPg0KPkNjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJqZWN0OiBSZTog
W1BBVENIIHYyIDA4LzEwXSBkcm0veGUvdnNlYzogQ3Jlc2NlbnQgSXNsYW5kIFBNVCBjYWxsYmFj
a3MNCj4NCj5UaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmll
dyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPmNvbnNpZGVyOg0KPi0gW0hpZ2hdIElt
cHJvcGVyIE1NSU8gYWNjZXNzIGZvciAzMi1iaXQgY29udHJvbCByZWdpc3RlcnMgdXNpbmcgYnl0
ZS13aXNlDQo+Y29waWVzIChtZW1jcHlfdG9pby9tZW1jcHlfZnJvbWlvKS4NCj4tLQ0KPg0KPi0t
LSBQYXRjaCBbOF06IFtQQVRDSCB2MiAwOC8xMF0gZHJtL3hlL3ZzZWM6IENyZXNjZW50IElzbGFu
ZCBQTVQgY2FsbGJhY2tzIC0tLQ0KPmNvbW1pdCA2NjRhYjc3MTQ3ZGU2ZjQ1NmFmMGNlYWVhZTZh
OTk2ZGRkM2Q2YTQwDQo+QXV0aG9yOiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGlu
dGVsLmNvbT4NCj5kcm0veGUvdnNlYzogQ3Jlc2NlbnQgSXNsYW5kIFBNVCBjYWxsYmFja3MNCj4N
Cj5UaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGNhbGxiYWNrcyB0byBnZXQgdGhlIHN0YXR1cyBhbmQg
Y29udHJvbCBpbmZvcm1hdGlvbg0KPmZvciBDUkkgUE1UIHVzYWdlLiBJdCBhZGRzIHRoZSBnbHVl
IGxvZ2ljIHRvIHJlZ2lzdGVyIHRoZSBDUkkgUE1UDQo+ZnVuY3Rpb25hbGl0eSBpbiB0aGUgeGUg
ZHJpdmVyLg0KPg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiBpbmRleCBkYzQyYjk0OTI0MjhhLi41
NzhkNTkwNDhiMzljIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMu
Yw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPg0KPlsgLi4uIF0NCj4N
Cj4+ICtzdGF0aWMgaW50IHhlX3BtdF9yZWFkX3JlZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiBn
dWlkLCB1MzIgKnJlZywgdTMyDQo+b2Zmc2V0KQ0KPj4gK3sNCj4NCj5bIC4uLiBdDQo+DQo+PiAr
CXhlX3BtX3J1bnRpbWVfZ2V0KHhlKTsNCj4+ICsJbXV0ZXhfbG9jaygmeGUtPnBtdC5sb2NrKTsN
Cj4+ICsNCj4+ICsJeGUtPnNvY19yZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uKHhlLCBDUklfSURY
X1RFTEVNX0RJU0NPVkVSWSk7DQo+PiArDQo+PiArCW1lbWNweV9mcm9taW8ocmVnLCBkaXNjX2Fk
ZHIsIHNpemVvZigqcmVnKSk7DQo+DQo+W1NldmVyaXR5OiBIaWdoXQ0KPldpbGwgdGhpcyBjYXVz
ZSB1bnN1cHBvcnRlZCByZXF1ZXN0cyBvciByZXR1cm4gZ2FyYmFnZSBvbiBzb21lIHBsYXRmb3Jt
cz8NCj4NCj5Vc2luZyBtZW1jcHlfZnJvbWlvKCkgZm9yIGEgMzItYml0IHJlZ2lzdGVyIHJlYWQg
b2Z0ZW4gZmFsbHMgYmFjayB0bw0KPmJ5dGUtd2lzZSB0cmFuc2FjdGlvbnMgKGxpa2UgcmVwIG1v
dnNiKSBpbnN0ZWFkIG9mIGEgc2luZ2xlIDMyLWJpdCBhdG9taWMNCj50cmFuc2FjdGlvbi4gRm9y
IE1NSU8gY29udHJvbCByZWdpc3RlcnMsIGlzc3VpbmcgZm91ciAxLWJ5dGUgUENJZQ0KPnRyYW5z
YWN0aW9ucyBjYW4gY2F1c2UgdGhlIGhhcmR3YXJlIHRvIGRyb3AgdGhlIHJlcXVlc3QuDQo+DQo+
U2hvdWxkIHRoaXMgdXNlIHJlYWRsKCkgb3IgdGhlIGRyaXZlcidzIHhlX21taW9fcmVhZDMyKCkg
d3JhcHBlciBpbnN0ZWFkDQo+dG8gZ3VhcmFudGVlIHRoZSBjb3JyZWN0IDMyLWJpdCB0cmFuc2Fj
dGlvbiB3aWR0aD8NCg0KDQp4ZV9tbWlvX3JlYWQzMiBtYWtlcyBzZW5zZS4gIEkgd2lsbCB1cGRh
dGUuDQoNCk0NCg0KPj4gKw0KPj4gKwltdXRleF91bmxvY2soJnhlLT5wbXQubG9jayk7DQo+PiAr
CXhlX3BtX3J1bnRpbWVfcHV0KHhlKTsNCj4+ICsNCj4+ICtkZXZfZXhpdDoNCj4+ICsJZHJtX2Rl
dl9leGl0KGlkeCk7DQo+PiArDQo+PiArCXJldHVybiByZXQ7DQo+PiArfQ0KPj4gKw0KPj4gK3N0
YXRpYyBpbnQgeGVfcG10X3dyaXRlX3JlZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiBndWlkLCB1
MzIgcmVnLCB1MzINCj5vZmZzZXQpDQo+PiArew0KPg0KPlsgLi4uIF0NCj4NCj4+ICsJeGVfcG1f
cnVudGltZV9nZXQoeGUpOw0KPj4gKwltdXRleF9sb2NrKCZ4ZS0+cG10LmxvY2spOw0KPj4gKw0K
Pj4gKwl4ZS0+c29jX3JlbWFwcGVyLnNldF90ZWxlbV9yZWdpb24oeGUsIENSSV9JRFhfVEVMRU1f
RElTQ09WRVJZKTsNCj4+ICsNCj4+ICsJbWVtY3B5X3RvaW8oZGlzY19hZGRyLCAmcmVnLCBzaXpl
b2YocmVnKSk7DQo+DQo+W1NldmVyaXR5OiBIaWdoXQ0KPkRvZXMgdGhpcyBoYXZlIHRoZSBzYW1l
IGJ5dGUtd2lzZSB0cmFuc2FjdGlvbiBpc3N1ZT8NCj4NCj5TaW1pbGFyIHRvIHRoZSByZWFkIHBh
dGggYWJvdmUsIHVzaW5nIG1lbWNweV90b2lvKCkgZm9yIGEgc2luZ2xlIDMyLWJpdA0KPnJlZ2lz
dGVyIHdyaXRlIGNhbiByZXN1bHQgaW4gNCBieXRlLXNpemVkIE1NSU8gd3JpdGVzLiBTaG91bGQg
dGhpcyB1c2UNCj53cml0ZWwoKSBvciB4ZV9tbWlvX3dyaXRlMzIoKSB0byBlbnN1cmUgYSBzaW5n
bGUgMzItYml0IGF0b21pYyB3cml0ZT8NCg0Kd2lsbCB1cGRhdGUgdG8geGVfbW1pb193cml0ZTMy
KCkuDQoNCk0NCg0KPj4gKw0KPj4gKwltdXRleF91bmxvY2soJnhlLT5wbXQubG9jayk7DQo+PiAr
CXhlX3BtX3J1bnRpbWVfcHV0KHhlKTsNCj4+ICsNCj4+ICtkZXZfZXhpdDoNCj4+ICsJZHJtX2Rl
dl9leGl0KGlkeCk7DQo+PiArDQo+PiArCXJldHVybiByZXQ7DQo+PiArfQ0KPg0KPlsgLi4uIF0N
Cj4NCj4tLQ0KPlNhc2hpa28gQUkgcmV2aWV3IMK3DQo+aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwODEyMTkzNzQyLjIxNzAxODgtMTItDQo+bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tP3BhcnQ9OA0K
