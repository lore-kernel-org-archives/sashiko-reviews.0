Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA9047CC67
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633506; cv=fail; b=q948tblUiq6SFgTVsCRJkm5x3PuVJpwsYvilBWPnakklvSf51OKfF3/QZdJX98jGUYwu8/bQwhdWj/WDHI3qKQMzKlUmm440xiQESnYLWTgtSNExBjjnneyFCtE/z1KPrwK3MAQGAcWdOneOUU79ByFFbXf055nFpmKvDblZoBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633506; c=relaxed/simple;
	bh=D3gyYHlDCYoi3ZNMMU6BmzUBGywszidvZ81bP/RhmGg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gBmpKwMwmvpjhyPOtMwPw/g+mN3N8G04eFw+V4Ods0mu4tdCmSbe7XMoZtp5CHnb5GF5S6UsN6HSvdpbBdu9QZjVICnLxNRnw2ZnyeGje5kHrARtveqXA9BcxyvUjycRPAdxlkZBP1BjY/Br3MWZLuEbBCjIa85etEo6ooMcz8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlqk0TgI; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlqk0TgI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786633505; x=1818169505;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D3gyYHlDCYoi3ZNMMU6BmzUBGywszidvZ81bP/RhmGg=;
  b=dlqk0TgIQhQTtssOkfV3ZBMYHBwNXXgUdvz8DRab5aWzomfjTGFQPf7i
   OHstvfNhAP+s11XYbzM7AHVo108GAClNacf0IISvOklLK2eH/RTXEHMep
   b9U0+HRqJf3k2X0yLQMErQX246iDAuaD5ZDXJb21exaK3Zofmk/10N2oi
   KkX0p/Uve5Mzw7v/veZfqARIiReknGKDPxBddJaqJ/8c+ndUrDek+lqlo
   MaiYTZH0oDJ9/WdmEjg9NmINA9p3bpx0ghQTnmHcodnWfgwHEdKqvaZmE
   8n1Xre+6/RXJrGYMPZpuMQuhl1m4J7I6w+yaB6v4kBNw60eMrEMXjVIR2
   Q==;
X-CSE-ConnectionGUID: eBxsttfqQWWpqYrbxSnnFg==
X-CSE-MsgGUID: Np+dQaZSQV2c6mLxJcBZQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97556315"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="97556315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 08:05:03 -0700
X-CSE-ConnectionGUID: PLiqWqc0R1O1GnMseJUcKw==
X-CSE-MsgGUID: GIRwR+ycR0qVxdHRcUmzDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="262202866"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 08:05:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 08:05:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 08:05:01 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 08:05:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVvErXum4SRh4/WNiJ8Lu5/NR/oIWT0rP5atWEFaJisv7h2Cs4jhRU1dAqSRfr4HnG4jwrZ/JCp3ko5BnqxE39ix93GXNTq1fVjf6bi+eIGvXyZRdQXKWjg2ZNQwkjgvm3rQwCPO83ytnjxewKuSKbiiT+lELWS/A3eGGs4AR4EZb26SquALv44S62hV/p1PzQyox1v2239XcORzMOoBc5CcDThOIGMAs0Eh51GM560sHPVZn+Z4dU6+x2UHnU0K1TRp0bxoDidWWsokhxyuUzeCbSGe3XoyStQBDxbA9fbNPthcw7Ko6fGcZgxnVdTun518cVNhbPvT4217jiznGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3gyYHlDCYoi3ZNMMU6BmzUBGywszidvZ81bP/RhmGg=;
 b=dqV9Kwb8S1ozCuYZYw3dCPGIxTQ1U+uyoa2DOI8gMGZZNv0RAX/jR/xeoYHVOiER1nZAwW2Y26y72G7CvibdTjEtHUX/7cYYE08RmcJaYHsOgjFEY1XZdxDMztKXCaeOGHBsaaYbIzW82PYGrDk7mlN1IUNi2I7DcCtIL6E/7r8DRQvyfOpkl4vRTI1L03DblaWHbh72eQw7OmRFZxFBamSmIk0UiCTJ4DuAA26bFttifLhC8tFXZdGfC+4XaEEqXl+TG1QByDU158ZHWVxXgwjDJVlM7RsRCHLeq9GjrnhMLpY62cP0k+PhpDM+LBnPGawiMqyrFgFQWENJ3uwjlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA3PR11MB322977.namprd11.prod.outlook.com (2603:10b6:806:588::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 15:05:00 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 15:05:00 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 06/10] drm/xe/vsec: Support Crescent Island PMT
Thread-Topic: [PATCH v2 06/10] drm/xe/vsec: Support Crescent Island PMT
Thread-Index: AQHdKpIjkdoV0/G0hk+XoUP73ApHhLaa0jGAgAFCj2A=
Date: Thu, 13 Aug 2026 15:04:59 +0000
Message-ID: <IA1PR11MB6418DA0630271FAF1004A2D7C1DB2@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-18-michael.j.ruhl@intel.com>
 <20260812194921.E75AB1F000E9@smtp.kernel.org>
In-Reply-To: <20260812194921.E75AB1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA3PR11MB322977:EE_
x-ms-office365-filtering-correlation-id: 26e43356-ac2d-4516-1b1e-08def94c3f00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|56012099006|11063799006|38070700021|6133799003|4143699003|10067099003;
x-microsoft-antispam-message-info: mjb9ggDlO6K/UTmx00RW9zjxeHOMYYE79CNP5E6k0q3PLbFs6VRjjQwB1X5slCm8uAtFlvPVPSXIFHDq/J6lUXCAfhZRz1fejVH18ISxR9D0U/9NdhaB2h98Og6kXOB35FYPbQKehTT+cTBPSczHZXjH9sSeTjafl2QahrJDilqbg1y3WzZZPvMoMRzuSSbJHUxg3ZHyLIDE+8evACAKrRxw0TK9Ot8DhUL+irwS1HAJFeIYryiqABNlKYpkUel8iXR6lK7KdmzDcXfDQFnbD1SWgOx8hAhZSw/5BXTx5+LCvowVys1WWvw1C/axijug2dissLKguWLCbAO3sNegJilHzwuHP93qHmvsPqYDB80OYmDrzNsH8hYdXPQlaRUas4NIZVzevU8PzXVNxkdOh1CsXVrSu8PbxPVKDsmaf/+0/GbP/VIymXHOu3Acj9taIZpPPtdPyWg0Q8SsGI752T5Tm8sKXqHL2rI53fhHGbtATJtsQJKJaujH31woPFdteLneR+4Ye4vuxCg5lJbAA9/iY3utNp8U/RuLoj6tpZR7oktEnrnCPK/r9njyuoiUiF4WWtEy5CfhMpYdIfv2Qr6QCSE4FIPjpPuly65vD07HJXd/TtIUxX3/CIQPi1/e3mJI7koKj2cq79e4s0LbxSwQBQ7JzJ7SBa+4ScLAwas=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VndXZW1ZT2diRkgyZVFadG1aT0gzTnpHWGhhZWlGK2xmNUVyQnhUU2NOWkxo?=
 =?utf-8?B?enZVdU5YbHEvM2tkYVBQZGdCUm5vNzZMMmgzOUVyblhEdGMxYUdRdEMvYjVp?=
 =?utf-8?B?NDU1Nk96QnRlYkpNdktOOTdMR21ib2pzcHk2Q0xEb1N4TkplWXVDNHRVODlJ?=
 =?utf-8?B?L0RRSUxXYnd3STRxc0c1VDZWV200MEVYNzc4SDhGZWtEMjlOQUVZaXV3UEln?=
 =?utf-8?B?TjNJaUJmNWRObGJCN2ZaZDg1SjhmamNvTjNwVk9GdFl2blpFQ2dXVnB6S2Yz?=
 =?utf-8?B?c2doV01LQUVYdXVRM0VDWlZhNVo5dVEwNDlId2lxekpjY1lITGRsL0p1RnBh?=
 =?utf-8?B?VTFjdXNGWUZSQldJODNJeDZEdzN2RDR0MkZFMWlHTXRVRkRhU0tvZXhUVERw?=
 =?utf-8?B?S3hVU2grWFFqU1NLc25CcmRoQzkzeURtVEFrU05OV25jL1pwTjZHS01qcXJ4?=
 =?utf-8?B?OFROY1RKaFlHNm5xSGlveHRycVlLSzNzanNkeWlNd0tiUGdmRXNOOGsyRUN0?=
 =?utf-8?B?a0NEd1Z2eERqTlJBeFQ4TUIwQ3NQSzdvL2U1eW9INVFJYWFWdE1xNWdIZm5W?=
 =?utf-8?B?OWtDV2VDNEFBQWducUlWV2FiZWg2R2VMTkIyY3VPTlhVNkt2dXNqZmtwUEJ2?=
 =?utf-8?B?OWpDODhLTFRYUVRyWktQTjJ0WHVWY1FhYXRIUUV6NHBueStYVHJzMWxRb2VL?=
 =?utf-8?B?SDB1VDJ0UW5uZm95Nm1WdkN1SUR5Qkx2a2VwNWpuckw4M3cyL1hiL2RiRW92?=
 =?utf-8?B?bHY2c3F2Y2hqcCt2aTRQbnpDTGJwdUJtSjdiZVhFcmdRcG8wL0cycldSbzlP?=
 =?utf-8?B?Mi8ydnZSWFAxUDEvSC9veGxTc0xTWnhTaExrWmRmVVlJcklsTDBycDlqeHg2?=
 =?utf-8?B?UWdkc3NYNnNOTnlOdktSSXkxV3p0UndvQ0hSWFZES3BuV2JEcElqNVIwMTc1?=
 =?utf-8?B?dkZVRjE3MC91Y1hMVENnYXdYMjRQWU9ud0ljUUxGMHlLYkN5K0pSNTFWaVNO?=
 =?utf-8?B?OWJDaFhqeU9mMWNuZ1MwU2h3WjV1d3ZxMVhSWmZ5SWdMS0NNOEkrWVhZMDBK?=
 =?utf-8?B?K3FjUEc2d2pWelQ2dm85UC9OeGpiWmNDM1o1WWtkYVlpZTJhQUcwNjM3NUJa?=
 =?utf-8?B?eERwbDNVR2FVZVdUUHZXVjZidlFLaU1nWCt1dVFkODFIeGp0ZnNCN1FseWNH?=
 =?utf-8?B?K3JJYmVPOXorVHhMZ205TE9EaHQwMTRWdHpCS25LMzA2YW90K29DcTVHR2tM?=
 =?utf-8?B?TTY3N3EzMnlsdXQ4SXh0bnk2M2kxRjlBbnAzcm5JNS90KzRGWHVqazZmb1FV?=
 =?utf-8?B?WDIvVERuV1AzeHlrMXJBSDNyU3FhU3RBN2pUcHBEQ3JiK085VlhCQU5QcEFR?=
 =?utf-8?B?aUtGS2s1RXVabzhmN0F2d1FkTGtvRGw1V05lVUlJbkp0a2ZoRGtwY25DMCs4?=
 =?utf-8?B?a3BRNTFCd0VOZGhCa2ZabFdpdkg3MWNVbWQydUxFejZFUDdhMnMrc0o2NkxU?=
 =?utf-8?B?NTd4cVZNdlhpU3RZZUhZMkVoQlpXc1BHNUEvZk1KNGd1MHJTMTc2c1M1cENN?=
 =?utf-8?B?ZU85dDMvblNDTHJ4VHlQUVY0UWdaQjV3WXllNVNpc2t4eS9nSWwxdllxZ0RY?=
 =?utf-8?B?S21qWWZEcTFiU3ZCeitha2hndTQ2REZzWHlXSjh6VUpzRUkxMVBMeENUNHA0?=
 =?utf-8?B?akptanFremYyUFYwSm8xZW9YTk9MdnU2Z21UNFVBT0Z4ZWg5Wk84ZW1RTFFP?=
 =?utf-8?B?ZjZ0L2Eyc29QQXY0VTJPVnZyTHVXK2RGeFNFbEFLdEgxM3c2b0FoUUVUUDht?=
 =?utf-8?B?TFRVdVp6cGFWZ1IzTFN2WlQ0NGZFN1FhNDNHSlJ2cERKRDduQjY0ZnI1MVJ5?=
 =?utf-8?B?cHR0b0dqVEx6U2lKeXJRV0tMNG1jK2R4SnU4R1ArN2QzTk96N2k3NVNXQWRO?=
 =?utf-8?B?eGppSVZlK2NVN3QvZEcwOHhIcEQyQXVPOEVYUXV0TG8xaGVtMExqUTZZSFIy?=
 =?utf-8?B?VjdTOGsrcDdtdSt6c0QxcWpsRmJab0dmQzhKZEZGSXpPRkxBNG4ydW9EQlZv?=
 =?utf-8?B?ZWlwQTlOR2oyMjAweGRwb3BHRHMxUWpQenY2K2pEUTE3dHgxY0EvVjlieEdq?=
 =?utf-8?B?QkovUFA0OHNhTVRUdjhkTStudFlNSVlMS042d2E0eVJLUExhRUh0eHlycEVw?=
 =?utf-8?B?eWZ6cjRaZDBWbFZWb1RvS085SHlXejRyckd1dG9YaHRucGsyN2JnVWlId1Zp?=
 =?utf-8?B?aS9uakZ5K0JibTRWOE9LM2JyNGEwTGM2Y0hLMFpMM2NtdjhtazZINGgxdFho?=
 =?utf-8?B?TU1HUEpUSFl5REFEZkxFZEZtVFh1dW1TVHh0VTNxWkNJWUNCdC9hQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ht8YF+zGeZos2ltlOnHgx3D9yzEWnYfFPTM802/bpyYjM04YLflPRg2S5Ni0rZgqg6WQcX9oUHHVinMMA4Uoi44OURbg8tjvwoKvgfKVbhB/qGM9w3XfsW3TzJMy/h71Yz/KHu76+n+qmzRFgmc+boRk0eYTem4evQmLd7/8+xI4WewkFewf6ug6u8CFT4fodqIBxD5Hu72SK1bbujSbKmXgXc099av+bA9XPbHRdBVTcmmQtFVALeb9DolFewoYNymJ4jByEAe3tuHMd/kpKkCNCrNor7sz5qJbplVmFdbRuO7SaZ8ZxXX2c4Vqb2Gr8pOguEqhvW3F6j0+/fa9iw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e43356-ac2d-4516-1b1e-08def94c3f00
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 15:04:59.6914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MM8oRwmUnKasiHDUWOKh1cj1bsZkZTrV44RVRenktFPug5yJ605tU2Mysbf61Eg6acT4jTqfspgvh83w71GRp0qY3FTA4bNSJukloy+RCv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB322977
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxMiwg
MjAyNiAzOjQ5IFBNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPg0KPkNjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJqZWN0OiBSZTog
W1BBVENIIHYyIDA2LzEwXSBkcm0veGUvdnNlYzogU3VwcG9ydCBDcmVzY2VudCBJc2xhbmQgUE1U
DQo+DQo+VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcg
Zm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj5jb25zaWRlcjoNCj4tIFtNZWRpdW1dIFRo
ZSBDcmVzY2VudCBJc2xhbmQgKENSSSkgUE1UIGZlYXR1cmUgaXMgY29tcGxldGVseSBub24tZnVu
Y3Rpb25hbA0KPmFuZCB1bnJlYWNoYWJsZSBkdWUgdG8gbXVsdGlwbGUgbWlzc2luZyBpbnRlZ3Jh
dGlvbiBzdGVwcyBhY3Jvc3MgdGhlIFZTRUMNCj5pbml0aWFsaXphdGlvbiBhbmQgZGVjb2Rpbmcg
cGF0aHMuDQo+LS0NCj4NCj4tLS0gUGF0Y2ggWzZdOiBbUEFUQ0ggdjIgMDYvMTBdIGRybS94ZS92
c2VjOiBTdXBwb3J0IENyZXNjZW50IElzbGFuZCBQTVQgLS0tDQo+Y29tbWl0IDAxMzU2ODNhYjdi
NzY0OWMyNTAwZTM1YzM1Zjc2NWY1MTcxMDNkOTgNCj5BdXRob3I6IE1pY2hhZWwgSi4gUnVobCA8
bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KPg0KPiAgICBkcm0veGUvdnNlYzogU3VwcG9ydCBD
cmVzY2VudCBJc2xhbmQgUE1UDQo+DQo+ICAgIENyZXNjZW50IElzbGFuZCAoQ1JJKSBzdXBwb3J0
cyBQTVQgdGVsZW1ldHJ5IGFuZCBjcmFzaGxvZy4NCj4NCj4gICAgQWRkIENyZXNjZW50IElzbGFu
ZCAoQ1JJKSBkaXNjb3Zlcnkgc3RydWN0dXJlIChEVlNFQykNCj4gICAgaW5mb3JtYXRpb24gdG8g
YWxsb3cgZm9yIFhlIHJlZ2lzdHJhdGlvbi4NCj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdnNlYy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4gaW5k
ZXggOGFiZTExZTYzMTJmMC4uNjM0NWIwYjRiMjZiOCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92c2VjLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2Vj
LmMNCj4+IEBAIC0yMSw4ICsyMSwxOSBAQA0KPj4NCj4+ICAjaW5jbHVkZSAicmVncy94ZV9wbXQu
aCINCj4+DQo+PiAtLyogUE1UIEdVSUQgdmFsdWUgZm9yIEJNRyBkZXZpY2VzLiAgTk9URTogdGhp
cyBpcyBOT1QgYSBQQ0kgaWQgKi8NCj4+ICsvKiBQTVQgR1VJRCB2YWx1ZSBmb3IgQk1HIGFuZCBD
UkkgZGV2aWNlcy4gIE5PVEU6IHRoaXMgaXMgTk9UIGEgUENJIGlkICovDQo+PiAgI2RlZmluZSBC
TUdfREVWSUNFX0lEIDB4RTJGOA0KPj4gKyNkZWZpbmUgQ1JJX0RFVklDRV9JRCAweEUyRkENCj4N
Cj5bU2V2ZXJpdHk6IE1lZGl1bV0NCj5Eb2VzIENSSV9ERVZJQ0VfSUQgbmVlZCB0byBiZSBhZGRl
ZCB0byB4ZV9ndWlkX2RlY29kZSgpPw0KPg0KPkN1cnJlbnRseSB4ZV9ndWlkX2RlY29kZSgpIHVu
Y29uZGl0aW9uYWxseSBjaGVja3MgZm9yIEJNR19ERVZJQ0VfSUQ6DQo+DQo+ZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZzZWMuYzp4ZV9ndWlkX2RlY29kZSgpIHsNCj4JLi4uDQo+CWlmIChkZXZpY2Vf
aWQgIT0gQk1HX0RFVklDRV9JRCkNCj4JCXJldHVybiAtRU5PREVWOw0KPgkuLi4NCj59DQo+DQo+
V2lsbCB0aGlzIHJlamVjdCBDUkkgZGV2aWNlcyB3aGVuIHRoZXkgdHJ5IHRvIGRlY29kZSB0aGVp
ciBHVUlEPw0KDQpUaGlzIGlzIGEgcHJlbGltaW5hcnkgc2V0dXAgcGF0Y2guICBJbXBsZW1lbnRh
dGlvbiB1c2FnZSBoYXBwZW5zIGluIHRoZSBmb2xsb3cgdXAgcGF0Y2hlcy4NCg0KTQ0KDQo+WyAu
Li4gXQ0KPg0KPj4gIGVudW0geGVfdnNlYyB7DQo+PiAgCVhFX1ZTRUNfVU5LTk9XTiA9IDAsDQo+
PiAgCVhFX1ZTRUNfQk1HLA0KPj4gKwlYRV9WU0VDX0NSSSwNCj4+ICB9Ow0KPj4NCj4+ICBzdGF0
aWMgc3RydWN0IGludGVsX3ZzZWNfcGxhdGZvcm1faW5mbyB4ZV92c2VjX2luZm9bXSA9IHsNCj4+
IEBAIC02MCw2ICs5OCwxMCBAQCBzdGF0aWMgc3RydWN0IGludGVsX3ZzZWNfcGxhdGZvcm1faW5m
byB4ZV92c2VjX2luZm9bXSA9DQo+ew0KPj4gIAkJLmNhcHMgPSBWU0VDX0NBUF9URUxFTUVUUlkg
fCBWU0VDX0NBUF9DUkFTSExPRywNCj4+ICAJCS5oZWFkZXJzID0gYm1nX2NhcGFiaWxpdGllcywN
Cj4+ICAJfSwNCj4+ICsJW1hFX1ZTRUNfQ1JJXSA9IHsNCj4+ICsJCS5jYXBzID0gVlNFQ19DQVBf
VEVMRU1FVFJZIHwgVlNFQ19DQVBfQ1JBU0hMT0csDQo+PiArCQkuaGVhZGVycyA9IGNyaV9jYXBh
YmlsaXRpZXMsDQo+PiArCX0sDQo+PiAgCXsgfQ0KPj4gIH07DQo+DQo+W1NldmVyaXR5OiBNZWRp
dW1dDQo+QXJlIHRoZXJlIG1pc3NpbmcgdXBkYXRlcyB0byBnZXRfcGxhdGZvcm1faW5mbygpIGFu
ZCB2c2VjX3BsYXRmb3Jtc1tdIHRvDQo+YWN0dWFsbHkgcmV0dXJuIFhFX1ZTRUNfQ1JJPw0KPg0K
PkN1cnJlbnRseSBnZXRfcGxhdGZvcm1faW5mbygpIHJldHVybnMgWEVfVlNFQ19VTktOT1dOIGZv
ciBhbnkgcGxhdGZvcm0NCj5ncmVhdGVyIHRoYW4gWEVfQkFUVExFTUFHRToNCj4NCj5kcml2ZXJz
L2dwdS9kcm0veGUveGVfdnNlYy5jOmdldF9wbGF0Zm9ybV9pbmZvKCkgew0KPglpZiAoeGUtPmlu
Zm8ucGxhdGZvcm0gPiBYRV9CQVRUTEVNQUdFKQ0KPgkJcmV0dXJuIFhFX1ZTRUNfVU5LTk9XTjsN
Cj4NCj4JcmV0dXJuIHZzZWNfcGxhdGZvcm1zW3hlLT5pbmZvLnBsYXRmb3JtXTsNCj59DQo+DQo+
QWRkaXRpb25hbGx5LCBkb2VzIHhlX3ZzZWNfaW5pdCgpIG5lZWQgYSBjYXNlIGZvciBYRV9WU0VD
X0NSSSB0byBzZXQgdXANCj50aGUgUE1UIGNhbGxiYWNrcz8NCj4NCj5kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdnNlYy5jOnhlX3ZzZWNfaW5pdCgpIHsNCj4JLi4uDQo+CXN3aXRjaCAocGxhdGZvcm0p
IHsNCj4JY2FzZSBYRV9WU0VDX0JNRzoNCj4JCWlmICgheGUtPnNvY19yZW1hcHBlci5zZXRfdGVs
ZW1fcmVnaW9uKQ0KPgkJCXJldHVybjsNCj4JCWluZm8tPnByaXZfZGF0YSA9ICZ4ZV9wbXRfY2I7
DQo+CQlicmVhazsNCj4JZGVmYXVsdDoNCj4JCWJyZWFrOw0KPgl9DQo+CS4uLg0KPn0NCj4NCj5X
aXRob3V0IHRoZXNlIGFkZGl0aW9ucywgaXQgYXBwZWFycyB0aGUgQ1JJIHBsYXRmb3JtIHdpbGwg
bm90IGJlIGZ1bGx5DQo+ZGV0ZWN0ZWQgYW5kIHRoZSBQTVQgZmVhdHVyZSB3aWxsIHJlbWFpbiB1
bnJlYWNoYWJsZS4NCj4NCj4tLQ0KPlNhc2hpa28gQUkgcmV2aWV3IMK3DQo+aHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODEyMTkzNzQyLjIxNzAxODgtMTItDQo+bWljaGFlbC5q
LnJ1aGxAaW50ZWwuY29tP3BhcnQ9Ng0K
