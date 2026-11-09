Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794264480;
	b=RS2DjI1ZQs/2B2Y+mJ1HgRMxxkn1k+krt27F4QBc6U7CHssTqNJV8hF1uPe8GjaO2fxu
	 ic4PAZ4LXCGsLQoA6/flulxiu+DghTg8C8LROs5352ervVh1ZGlr2bDxq6eUV9yaqcFYB
	 gLH/IX7nBbtC5LI4bj/ptJ3R4m6jgQ7+CPKIo0NhdbdZvUd7eCqQlnwKVWZaeegi0dJ50
	 4c5P9jpOmch4E6cTc3KG545HlOobMLM1AjaiwQKh6eh0XBm+0Ipe/jP+QAx1QN+0pdtIA
	 4kvS3N7Aax4TX8aP/PoMrLF///AmTeUEtOTvDMchkBV2DSHsVFbiEFLTbhj2QQygaoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264480;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=zcSfcH4vwW6FtA36yKiquZ5YsklwnXdf5o9yE0ZEb1Y=;
	b=kvw66OJn9P0t5RBGDsXwddhrC+rayEvB/mIHE40IH5wibcWgDsq0/ZvVH2bUQiftvmA3
	 szeTV8LrLg7q+syY59cayqOvSgCoF/PNGbpVjDJonGhZxPjH4VswZ3Aa2aysPGDpMzi39
	 WLYqw+f3nF8xf8gWqjoZ3Ki+nvH+jypnwsbyopobeAYTdcTi/xuzKRxn5l4cd76EOFBLy
	 if5XwJ8wPqG6ilmwj5o4HOwCs57WnUvMpsfGm3ehpxd80ttvDocDkku6FT0KbiywLi7Dx
	 lsW7E7j3cNjFdG67obGzsmVGoCF0IcKziRwmCKb+iD6tMpfsouzFDxb6c1c4VyEHgoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MltGoc1r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A8A606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 22:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MltGoc1r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794264479; x=1825800479;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=zcSfcH4vwW6FtA36yKiquZ5YsklwnXdf5o9yE0ZEb1Y=;
  b=MltGoc1rsb++yFk9Dtbefp4ADo24IaD1qPJqHW9JwQzJRqoNxh7oBif9
   /Md9QXE/arrxARSDBtnwYvNHQkKuiGOoZ/sSjW/e9HPn5MwkIsZHrOgSs
   GaNSH1njnVfiG9lTkuYGRJ2/hYCYpA/3nb8jKQ6HzFyY8pNybwC9aAuxb
   gYnNRaJ6VEnJdizAKl3qV11MpzLnrr6lS59m2yKxzKbLt8lZZbtqYU7Px
   qslWL7rrQKp/zzJKWfnLb4pHFEdbJPW6UXNMb57EZgZZs1BxrSmNauF+V
   KbREQhLvpvXTtxOyJqrtTXUn7yJhPrGGLCmOuB/X+XCi4j8u8AqtDfQF2
   w==;
X-CSE-ConnectionGUID: xqmJQKT1SlOMimpVLGPuag==
X-CSE-MsgGUID: r/kEoigtRjyeQTuVtwQiBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2899645"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2899645"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:47:59 -0800
X-CSE-ConnectionGUID: oIHZ4U9sRSOt+Xzj8+Umzw==
X-CSE-MsgGUID: /uAxvL1WQm6KY0rQtsrtuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7855515"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:47:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:47:58 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 14:47:58 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:47:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTUXiXgJb4+lf8r5ZcLMvS8Oxztv4Eq7mMTiKzTElAt22/hPQnsxiqLekP5ySnwkosjGsYuXSmS0ArYgja08UP4t9WZWvCGyqIKwRMXBN9aV5XTgSMYUrPZEr8VIW/FzkqejeCipmIZWGaapQpO/HeqXDBkXN7JwyBoLmBCK2yeMzrl8luOB1/gXYEBqpxvnhNi4xDyaF9IRwV1ts2RYGF3s1wlUsQQwcSUBv4WT/1TrM21CVCPv/9/gNqUg1eguFbtmY4Aq00peZi6tI1A26iVFxHFvbLaMS23xeuhvzCTlPNmFDxALdOGR3tKp1UN6DeHBbS+kVaeSRRQJuUj15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcSfcH4vwW6FtA36yKiquZ5YsklwnXdf5o9yE0ZEb1Y=;
 b=xw98II7uVo+ILjF05KorpXIHB4z/GZZY1mpK8mZqRyRNjot7pWjSA344gkWJKICCVus1Gh7AXk8Wewbh1m/76SjCtWj1aA8In6XRZzX4DQ18lJRRTKFwOTaPi2owr5U4SyOzuW+isVOVqGtNRK5Jn35FzBMpjbW/Oy+F4zJVigDbshTbf1kMivDIoARQECGDRYRTEU57a2wHq0lmAD31UciP+/pYBoq3T8Kyho5SQ20Dv5hIRHeyTbra3ft8cJ8wIOuRhHwzFaHudI+XmhrTh+t6IgD/A20PY92ebEWxMqOTFai7mxjUCMbb0wLq6W3e2OoCUdw/+80UpxrvoWmYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by MN0PR11MB6034.namprd11.prod.outlook.com
 (2603:10b6:208:375::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 22:47:55 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 22:47:55 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v13 13/16] drm/xe/vsec: Add PMT GUID internal access
Thread-Topic: [PATCH v13 13/16] drm/xe/vsec: Add PMT GUID internal access
Thread-Index: AQHdaxeDAZKxYJstuUyBv6K1WJ5N3LcbX+6AgAsBzCA=
Date: Mon, 9 Nov 2026 22:47:55 +0000
Message-ID: <CH3PR11MB046149CD9285A12800DA694B70C1732@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-31-michael.j.ruhl@intel.com>
 <sashiko-outbox-194295@kernel.org>
In-Reply-To: <sashiko-outbox-194295@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|MN0PR11MB6034:EE_
x-ms-office365-filtering-correlation-id: d47d6696-d841-4008-f130-08df3eb37e6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|261102130727099003|4143699003|56012099006|11063799006|261021123027099003|261009223027099003|261022105027099003|261022075727099003|261022115727099003|261026140227099003|261026121527099003|261028144727099003|22082099003|18002099003|10067099003|3023799007;
x-microsoft-antispam-message-info: rv4k3YuKXqfD1DCwI8IHScTkvkd8ura/Y1/IbCRMJ+K6XZLOsm0dzDT8th+PGE7yjJ/XHVKFz33ROD/n1AHoJCcG4vIiHehhq6C7nJlGLaPebwtvuqs8QPCvgCDN07RNmLkw9QwRGAt2OzWywFUhDtPLKwccmBe8R1mm/UQf2q+D+sOsx2kJADREX+sFZhpInoFsE+In9f6IuZvgLEz8qeQe46ENwkx2xQaG00itVNMdKFEXBjO8d1TANwJwUhBk6uK2t4ndmOa3Vb/NWxmhLK4FStdT3bSuMQCr8kBp3Bq4cL8vrYVSVoSd0U0+yCQqZRJgBhcQ4TCeOXgHHlIeFQdoYDkbExKMxK9MPUA4+ZT/6XDE4/nz8SNKnO87JNjBVqC7Dy46EK4OSull+jwEKqS7ZpnRQ4gCdSAjSBNQmt3SRGFtH//2SanYRmTgbPyCgvZCNOM9Lfc7nXWYo/29Oqv61io+Ed/edWkZaNLzyMuhI7nbYztSZqve/XKn8xWit62VzMKjsJmpHCtQQBmlhMvd5k/uMaWpB/KZqPO1Lxp9TCTWViRRt268jGIm+iEtH8246U1XryGpwIZbh77oHzQvbDsONoAjsOTdMXHEVp43ZqTVs1xNxKRVZLI/VzM/dkH2UsdjGv4rIklQEA+0yBilNBVbkIcftLIoU/6eZa8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(261102130727099003)(4143699003)(56012099006)(11063799006)(261021123027099003)(261009223027099003)(261022105027099003)(261022075727099003)(261022115727099003)(261026140227099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUo0YklUYURDNmZVOUxpV2pkMzBOZng1dUpEQUNiblRaWTM5WkhjQnpLWi8v?=
 =?utf-8?B?WCtkTW5RTFlwc1AraXErQWpiUy9XU29kQSs4RUlhNzJNajd2SjdsUUd1Njky?=
 =?utf-8?B?MjMyZ3VCSE1TNzdrQjVHWjRPbm1mcnBSYnJyOEQrNFBObjh2eFRKN3llTFkx?=
 =?utf-8?B?YW52THNnVG02eS9SMWRNY29OVzMyZ1pLRklkZVpPTTJwT3RubzVwSUxhVGdR?=
 =?utf-8?B?cm5HOVBrWkh5c2ZiWTYyKzQyQnRLdWV5U1hUUVNjR3JJT3JHeU4rTmdvM0Vl?=
 =?utf-8?B?WXoyRzlaMVc5VVdsNTdFenpXZVVObkhOUTJqdWZjcVp1MGh2NGN6MytrNGRZ?=
 =?utf-8?B?Y0N6WGQwNW91L1NGSWRjSklJbk1jUDVaM2s5ZE9KVFhPckNNRGtucDhiVm0z?=
 =?utf-8?B?SUdsRUlBL2tpNld1ZDcwWWJYOEtWR0lsakloVnpzU2J4OCtWU1Y4MHJra0Ju?=
 =?utf-8?B?bWs0UUpWakdDQkl5d0VmSWVkVFNLT25RTG0xa3Q2WUM0VkJBVFpXMjAwcitm?=
 =?utf-8?B?blNHK2ZaRTc5Szl6RUkzd09SU3dpcFZ2YllOQ20xRCswN3RNYzJmWklRK3dR?=
 =?utf-8?B?Qk5VcENqazRablZtSWNCSzd3WTRIeGt6K0pqcEFjb2ZsZUxGOEFBR1JUWlUx?=
 =?utf-8?B?SlRxWTBvY3VGKzZPVjF1b0F6U3BzT2NmVDVvdzMrYks1U3JhY3FJeDUvZGpt?=
 =?utf-8?B?a3lDUnhTSkpScDQrU21sSS9wcmZrci9iclhaa0xIQXdLbllmbWNiazRtRkl6?=
 =?utf-8?B?V0dITUp6Z0FkRTZvUHhvbGJUcGNXTEZ6T245MFJoNzQ2L1d0RWk3YUxZVVpC?=
 =?utf-8?B?RWhvOGF2ZzQ2Q09uWk1TYzJNQTllNXQ5ZnEwVGJlRis1UFpvck1zZ1NGNHBL?=
 =?utf-8?B?a2tqY0NHYkNhN0NkOHA2M2xpMmhCbEVmSTZrNzZla3pEMXhRRDZhSXB6dzVz?=
 =?utf-8?B?b0ROcVQ2cUdjaGM0YnJrUVc1RDdqTFJCL3Uwb3NqZmxxYVpFaXdMb0JJYm10?=
 =?utf-8?B?RzdVcUF5NHFIK2UwK0VhNDBXQlBmaG1jSzFWLzRPL0xiWVp0ZW9CL0c0aEw1?=
 =?utf-8?B?Nk9nNmtVNjYwUkliWmZ6NW1sUlliSmpuMHpzajFUSHBPcjlhNFpGcFdBRnBo?=
 =?utf-8?B?MU1QTklHQmVRMG5SdXFQSXRiVEx4cFZUWVN2ZUJlZW1GazBIcXU0RTlsbTB5?=
 =?utf-8?B?cVhHSWU3eENUYkFnMmtFSFNjSHFSSkVGNzRwckViQnh6ejUxZHpraFdoUnRj?=
 =?utf-8?B?dXBpaFJyYUhHRUdzekxYWHNGaDJnN2Y4T2dkbmdNTlA4a2RnbHFzNkhGSVNM?=
 =?utf-8?B?N1hTV0FlN1h1Z0lnRjJqMWt5dldHMEJPM3BLTmV5MzkzS3NoM3ZtcW9wK016?=
 =?utf-8?B?K2xFRzV2aDd2OXhnSFl5ckhNckp3RXNBZ3hUZ3lHYXhVcmVuaW1HeHNJYkRZ?=
 =?utf-8?B?K2NNWDFFUmhhTjByb21LTC9NaHlLbFNMTkplUUc2K3BHT08rbkFRWDZkcGFa?=
 =?utf-8?B?YWt1WVcyNDU3aDNMa1hwNjZmSkdXSnphZXovMEt5VDM2VG1IYUtPeitOUVZl?=
 =?utf-8?B?NmdHc3RlWHBsYjIvWUVQWlBzaWxXQU9Bb1JmN1lUZVJ4K2lSbTRwNVFUUDJi?=
 =?utf-8?B?eGF3eS8vNDV3cFV5dHVkQVdnT2lDK1drUmZBVVNBY3FVTWFFNWYvclVqZGFS?=
 =?utf-8?B?Qk9lb21JUHlTVGxaeWZTSzBXZHRrdDhUM0d4ZlBGeHBtdUtYemxYNkVIdUlU?=
 =?utf-8?B?bXJ2RUJwdDRDZGR2VTI5ZW5FRnFNc1FtYjB3eHROeTVlSlNQM3JwMmVlZ2tG?=
 =?utf-8?B?U0UrcThiem1EMXd1T1RkZUptTEs5d2JNV3F1OWx0c1BLd1hvYlRPUjVwYnNu?=
 =?utf-8?B?UUtGaUt3Tk5WR1UycHE5QVJZSHFXTVJzOG9FZEROM3VJVW5uUjcrNDBEMGRK?=
 =?utf-8?B?WE1keXUvRmRTK1F0eWJWa2ZUOFM4VEpnZSs4RmRtakxxdFhDY0d0Tk01Wnpx?=
 =?utf-8?B?RU5NVUt2L0pidGlhR25kMzYrUmtXMmVjTDZzTmNqRU5Fc1hibzJGNktzbzcx?=
 =?utf-8?B?cTVhcjBUTEVzc2NWUnovNnJEb3RWd3FPTEh1aEg5bWMzby9BNkQzbDF1cGVE?=
 =?utf-8?B?dE1SQktJbkwyZXh4MUlBN2taMUl2RDdQeGpDM2xEL2xiVU1ZMGg4Vk4wcit3?=
 =?utf-8?B?L0p3NStIelZaZWpXK29mS0FzL211Q3MrVlE5Q1l1UnVtRXNmMngyZUJrQ2tM?=
 =?utf-8?B?VDZ4djBiUW1Wb2NUQ21VK3A4QlJaWnFuQ1JDRTBnUldDVGxBM1Fka3M3ZW5D?=
 =?utf-8?B?eVBxcDFYakdjV3psRnR2YzFqRERkTk9JSWpHS3kzay9nZDlibHJSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mjaefdBwFomuK+HGXIQqzoAWyLjvE8UnjewbC2JBVCLRXNEl4M12MFbNJolI8MSHz619znpOppLR9pQ1heDJ4Nnnq1kUo6+i5yVc9OGLqqJl9SV1KRo7xmgtCD+d+PB2kmLHpeNJxWERgvOGLmbJivvnRilAcpUK5tKFZSgt6wN50cRQGeiRGmR0x6nobwMFE4DhJNOdquQjnq5QXswB66uFb8lNrad8Ci7fUmo+Kc7CMbZQ4HQdxDqe9g0SDSpu1DuVCRrtovLK++dl7nLtMkDeNSa/JxGKC7/XSEUEAneJubIN/+CwFJOQGRq5K37/iFegVkUG7U6+q3MK6jwF9w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47d6696-d841-4008-f130-08df3eb37e6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 22:47:55.0794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJY6eqBwPzYSVA66evFZ1R41akZHnxyFHtKYxo3hOkKUexKsbJittGpOPdtGwmBTwmRyhqMMr4PkYIwE+UNrI9Idvw9UUsLXOBrkfBiOa80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6034
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBNb25kYXksIE5vdmVtYmVyIDIsIDIw
MjYgNTo0MCBQTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNv
bT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0gg
djEzIDEzLzE2XSBkcm0veGUvdnNlYzogQWRkIFBNVCBHVUlEIGludGVybmFsIGFjY2Vzcw0KPg0K
PlRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDIgcG90ZW50aWFsIGlzc3VlKHMpIHRvDQo+Y29uc2lkZXI6DQo+LSBbTWVkaXVtXSBkcm0veGUv
dnNlYzogbWlzc2luZyB3YWl0X2Zvcl9mdygpIGFuZCB6ZXJvLUdVSUQgY2hlY2sgaW4NCj54ZV92
c2VjX2dldF9ndWlkKCkNCj4tIFtMb3ddIGRybS94ZS92c2VjOiBtaXNzaW5nIGtlcm5lbC1kb2Mg
Zm9yIHhlX3ZzZWNfZ2V0X2d1aWQoKQ0KPi0tDQo+DQo+Y29tbWl0IGY1ZDc5NWFiYWNlODhjMGVi
MDUwODE4YzQ5ZTU2OWI0YzNhMDJmNTINCj5BdXRob3I6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFl
bC5qLnJ1aGxAaW50ZWwuY29tPg0KPg0KPmRybS94ZS92c2VjOiBBZGQgUE1UIEdVSUQgaW50ZXJu
YWwgYWNjZXNzDQo+DQo+VGhpcyBjb21taXQgcmVuYW1lcyBQVU5JVF9URUxFTUVUUllfR1VJRCB0
bw0KPkJNR19QVU5JVF9URUxFTUVUUllfR1VJRCwgYWRkcw0KPkNSSV9QVU5JVF9URUxFTUVUUllf
R1VJRCBmb3IgQ3Jlc2NlbnQgSXNsYW5kLCBhbmQgaW50cm9kdWNlcw0KPnhlX3ZzZWNfZ2V0X2d1
aWQoKSB0byByZWFkIGFuZCBjYWNoZSB0aGUgUFVOSVQgdGVsZW1ldHJ5IEdVSUQgYmFzZWQgb24g
dGhlDQo+cGxhdGZvcm0uDQo+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZV90eXBlcy5oDQo+Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgN
Cj4+IGluZGV4IGNjOGUwZTZiZWQ5YTguLjc0MzAxODVhZDQxYTkgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPj4gQEAgLTQ5MCw2ICs0OTAsOCBAQCBzdHJ1Y3Qg
eGVfZGV2aWNlIHsNCj4+ICAJCXN0cnVjdCBkZWxheWVkX3dvcmsgd29yazsNCj4+ICAJCS8qKiBA
cG10LnJldHJ5X2NvdW50OiBsYXRlLWJpbmQgcHJvYmUgcmV0cnkgKi8NCj4+ICAJCXUzMiByZXRy
eV9jb3VudDsNCj4+ICsJCS8qKiBAcG10LnB1bml0X2d1aWRfY2FjaGU6IGNhY2hlIG9mIHRoZSBQ
VUlOVCBHVUlEICovDQo+PiArCQl1MzIgcHVuaXRfZ3VpZF9jYWNoZTsNCj4NCj5bU2V2ZXJpdHk6
IExvd10NCj5UaGlzIGlzbid0IGEgYnVnLCBidXQgdGhlcmUgaXMgYSBtaW5vciB0eXBvIGluIHRo
ZSBrZXJuZWwtZG9jIGNvbW1lbnQgaGVyZQ0KPihQVUlOVCBpbnN0ZWFkIG9mIFBVTklUKS4NCg0K
Rml4ZWQNCg0KPlsgLi4uIF0NCj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdnNlYy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4gaW5kZXggNTM4NGZl
ZjVlNWFjNS4uMWVkOTA0ZWMxNDk2NSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV92c2VjLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4+IEBA
IC01NzksNiArNTc5LDUxIEBAIHN0YXRpYyB2b2lkIHZzZWNfZGlzYWJsZV9sYXRlX2JpbmRfd29y
ayh2b2lkICphcmcpDQo+PiAgCQl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+PiAgfQ0KPj4NCj4+
ICtpbnQgeGVfdnNlY19nZXRfZ3VpZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTMyICpndWlkKQ0K
Pj4gK3sNCj4NCj5bU2V2ZXJpdHk6IExvd10NCj5UaGlzIGlzbid0IGEgYnVnLCBidXQgc2luY2Ug
RG9jdW1lbnRhdGlvbi9ncHUveGUveGVfdnNlYy5yc3QgcHVsbHMNCj5rZXJuZWwtZG9jIGZyb20g
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYyBhbmQgdGhlIG90aGVyIGV4cG9ydGVkIFZTRUMN
Cj5lbnRyeSBwb2ludHMgKHhlX3BtdF90ZWxlbV9yZWFkKCkgYW5kIHhlX3ZzZWNfaW5pdCgpKSBh
cmUgZG9jdW1lbnRlZCwNCj5zaG91bGQgeGVfdnNlY19nZXRfZ3VpZCgpIGFsc28gaGF2ZSBhIGtl
cm5lbC1kb2MgY29tbWVudCBkZXNjcmliaW5nIGl0cw0KPnBhcmFtZXRlcnMsIHJ1bnRpbWUgUE0g
YW5kIHhlLT5wbXQubG9jayBsb2NraW5nIGV4cGVjdGF0aW9ucywgYW5kIHJldHVybg0KPnZhbHVl
cz8NCg0KRml4ZWQNCg0KPj4gKwlzdHJ1Y3QgeGVfbW1pbyAqbW1pbyA9IHhlX3Jvb3RfdGlsZV9t
bWlvKHhlKTsNCj4+ICsJaW50IHJldCA9IDA7DQo+PiArDQo+PiArCXhlX2Fzc2VydCh4ZSwgIUlT
X1NSSU9WX1ZGKHhlKSk7DQo+PiArDQo+PiArCWlmICgheGVfcG1fcnVudGltZV9nZXRfaWZfYWN0
aXZlKHhlKSkNCj4+ICsJCXJldHVybiAtRU5PREFUQTsNCj4+ICsNCj4+ICsJbXV0ZXhfbG9jaygm
eGUtPnBtdC5sb2NrKTsNCj4+ICsNCj4+ICsJaWYgKHhlLT5wbXQucHVuaXRfZ3VpZF9jYWNoZSkg
ew0KPj4gKwkJKmd1aWQgPSB4ZS0+cG10LnB1bml0X2d1aWRfY2FjaGU7DQo+PiArCQlnb3RvIHVu
bG9jazsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlzd2l0Y2ggKHhlLT5pbmZvLnBsYXRmb3JtKSB7DQo+
PiArCWNhc2UgWEVfQkFUVExFTUFHRToNCj4+ICsJCSpndWlkID0geGVfbW1pb19yZWFkMzIobW1p
bywNCj5CTUdfUFVOSVRfVEVMRU1FVFJZX0dVSUQpOw0KPj4gKwkJYnJlYWs7DQo+PiArDQo+PiAr
CWNhc2UgWEVfQ1JFU0NFTlRJU0xBTkQ6DQo+PiArCQl4ZS0+c29jX3JlbWFwcGVyLnNldF90ZWxl
bV9yZWdpb24oeGUsDQo+Q1JJX0lEWF9URUxFTV9ESVNDT1ZFUlkpOw0KPj4gKwkJKmd1aWQgPSB4
ZV9tbWlvX3JlYWQzMihtbWlvLCBDUklfUFVOSVRfVEVMRU1FVFJZX0dVSUQpOw0KPj4gKwkJYnJl
YWs7DQo+PiArDQo+PiArCWRlZmF1bHQ6DQo+PiArCQkqZ3VpZCA9IDA7DQo+PiArCQlkcm1fZXJy
KCZ4ZS0+ZHJtLCAiVW5zdXBwb3J0ZWQgcGxhdGZvcm06ICV1XG4iLCB4ZS0NCj4+aW5mby5wbGF0
Zm9ybSk7DQo+PiArCQlyZXQgPSAtRUlOVkFMOw0KPj4gKwkJYnJlYWs7DQo+PiArCX0NCj4+ICsN
Cj4+ICsJLyogdGhlIEdVSUQgaXMgc3RhdGljLCByZWFkIG9uY2UgYW5kIGNhY2hlIGZvciBhbGwg
cmVxdWVzdHMgKi8NCj4+ICsJaWYgKCpndWlkKQ0KPj4gKwkJeGUtPnBtdC5wdW5pdF9ndWlkX2Nh
Y2hlID0gKmd1aWQ7DQo+PiArDQo+PiArdW5sb2NrOg0KPj4gKwltdXRleF91bmxvY2soJnhlLT5w
bXQubG9jayk7DQo+PiArCXhlX3BtX3J1bnRpbWVfcHV0KHhlKTsNCj4+ICsNCj4+ICsJcmV0dXJu
IHJldDsNCj4+ICt9DQo+DQo+W1NldmVyaXR5OiBNZWRpdW1dDQo+T24gWEVfQ1JFU0NFTlRJU0xB
TkQsIGNhbiB4ZV92c2VjX2dldF9ndWlkKCkgYmUgY2FsbGVkIGJlZm9yZSB0aGUgbGF0ZS1ib3Vu
ZA0KPk9PQk1TTSBmaXJtd2FyZSBoYXMgZmluaXNoZWQgaW5pdGlhbGl6aW5nIChmb3IgZXhhbXBs
ZSwgdmlhIGRlYnVnZnMgb3IgaHdtb24NCj5hZnRlciB4ZV92c2VjX2luaXQoKSBkZWZlcnMgZGlz
Y292ZXJ5IHRvIGNyaV9sYXRlX2JpbmRfcHJvYmVfd29yaygpLCBvciByaWdodA0KPmFmdGVyIHJ1
bnRpbWUvc3lzdGVtIHJlc3VtZSk/DQoNCkdVSUQgaXMgZm9yIFBVTklUIG9ubHkgKGRpc2NvdmVy
eSBzdHJ1Y3QgaXMgdmFsaWQpLiBPT0JNU00gaW5mb3JtYXRpb24gaXMgbm90IHJlYWQuDQoNCj5U
aGUgb3RoZXIgUE1UIGFjY2VzcyBoZWxwZXJzIGluIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2Vj
LmMgKHN1Y2ggYXMNCj54ZV9wbXRfdGVsZW1fcmVhZCgpIGFuZCB4ZV9wbXRfcmVhZF9yZWcoKSkg
Y2hlY2sgd2FpdF9mb3JfZncoeGUpIGJlZm9yZQ0KPnRha2luZyB4ZS0+cG10LmxvY2ssIHByb2dy
YW1taW5nIENSSV9JRFhfVEVMRU1fRElTQ09WRVJZLCBhbmQgcmVhZGluZyB0aGUNCj5kaXNjb3Zl
cnkgd2luZG93Og0KPg0KPmRyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmM6eGVfcG10X3JlYWRf
cmVnKCkgew0KPgkuLi4NCj4JeGVfcG1fcnVudGltZV9nZXQoeGUpOw0KPglpZiAoIXdhaXRfZm9y
X2Z3KHhlKSkgew0KPgkJcmV0ID0gLUVOT0RBVEE7DQo+CQlnb3RvIHJ1bnRpbWVfZXhpdDsNCj4J
fQ0KPg0KPglzY29wZWRfZ3VhcmQobXV0ZXgsICZ4ZS0+cG10LmxvY2spIHsNCj4JCXhlLT5zb2Nf
cmVtYXBwZXIuc2V0X3RlbGVtX3JlZ2lvbih4ZSwNCj5DUklfSURYX1RFTEVNX0RJU0NPVkVSWSk7
DQo+DQo+CQkqcmVnID0gcmVhZGwoZGlzY19hZGRyKTsNCj4JfQ0KPgkuLi4NCj59DQo+DQo+V2l0
aG91dCB3YWl0X2Zvcl9mdyh4ZSkgaW4geGVfdnNlY19nZXRfZ3VpZCgpLCBpZiByZWFkaW5nDQo+
Q1JJX1BVTklUX1RFTEVNRVRSWV9HVUlEIGJlZm9yZSBmaXJtd2FyZSBpcyByZWFkeSByZXR1cm5z
IGEgbm9uLXplcm8gYm9ndXMNCj52YWx1ZSAoc3VjaCBhcyAweGZmZmZmZmZmKSwgd29uJ3QgeGUt
PnBtdC5wdW5pdF9ndWlkX2NhY2hlIHBlcm1hbmVudGx5IGNhY2hlDQo+dGhhdCBpbnZhbGlkIHZh
bHVlIGZvciB0aGUgbGlmZXRpbWUgb2YgdGhlIGRldmljZT8NCg0Kd2FpdF9mb3JfZncoKSBpcyBm
b3IgT09CTVNNIEZXLiBQVU5JVCBpcyBhdmFpbGFibGUuDQoNCj5Db252ZXJzZWx5LCBpZiB4ZV9t
bWlvX3JlYWQzMigpIHJldHVybnMgMCAoZWl0aGVyIGJlZm9yZSBmaXJtd2FyZSBpcyByZWFkeQ0K
Pm9yIHdoZW4gIW1taW9fYXZhaWxhYmxlKG1taW8pKSwgeGVfdnNlY19nZXRfZ3VpZCgpIHNraXBz
IGNhY2hpbmcgKmd1aWQsIGJ1dA0KPnJldCByZW1haW5zIDAuIFNob3VsZCB4ZV92c2VjX2dldF9n
dWlkKCkgd2FpdCBmb3IgZmlybXdhcmUgcmVhZGluZXNzIHZpYQ0KPndhaXRfZm9yX2Z3KHhlKSBh
bmQgcmV0dXJuIGFuIGVycm9yIGNvZGUgd2hlbiAqZ3VpZCBpcyAwIChvciBpbnZhbGlkKSByYXRo
ZXINCj50aGFuIHJldHVybmluZyAwIHdpdGggKmd1aWQgPT0gMD8NCg0KDQo+LS0NCj5TYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDIyMjEz
MTQuMTE5MDI4LTE4LQ0KPm1pY2hhZWwuai5ydWhsQGludGVsLmNvbT9wYXJ0PTEzDQo=
