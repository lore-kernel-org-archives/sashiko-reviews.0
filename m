Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715581;
	b=z5ppy1tcnWTrz3p6EqM/TlCf1ORYZQyB6D9Mw+HG65F5zDQY0zy1lZMX/5QCDB8wZE5G
	 2UR3PgtKzKpljPEZYOIxGbsy5/HIQ0ixfhsL1oQIortov0YacIbDUYVu5y1nBxNZOLHzY
	 AqEmuadnb/HzN3krED/mcfHeKGr/pZy6sYjXa7FCcQdAwNEItjNtAgbLYf1hxoDhzhNQz
	 dXBj8R2DljdAt8Ik4cxkhFskkBUaxO4pGwarIddKt/AwgtEXOJGUupG0Az+QGLBdXFW9T
	 zAwscbEu4HiQX5f3NIMpsnEmlbcXQ5spqDvgbOGKmOz9PxwUKpx3ZsI+mhtKjt1EsLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715581;
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
	bh=CflNJIAF0ilGZsy+6lTyE08YFE4VsQT+tvn1ymQTlok=;
	b=3Dhknyheaxkz1NdQQL0l4EiZw+jBeFr6k0O2vzoRp9S47n/yreab2sXU60ysg1w2c8xE
	 BgLptAb17N2CSAI2mrg0C9UmhcIcPQv/7y9rwFHTznEteRPo85oQ/Q78d5A1j0I8vx/u5
	 FFLfBvHSNgqhr3as9cukU1HqfT8DY41Za7cwp9psm+HRnmdRXmGxYWmE5hQLVjEjxkmQl
	 rSL0nT4V6UZd+wRqhOGKUi3Skhjba7MEidbgazOOLH5sBZWQPrRckry+kcpOPJ2NLca7Y
	 cWWRBC2sVfED/g3i6cEpc5pq/j0Itu+hfUsKMJPBCZzc6+R08IpO5ktYvnUFkORLnSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Krs3li1c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220CB606D82C
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 14:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 220CB606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Krs3li1c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793715580; x=1825251580;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=CflNJIAF0ilGZsy+6lTyE08YFE4VsQT+tvn1ymQTlok=;
  b=Krs3li1cbCtK727YcTFfQlayUbqy2MgAk52fkyeZGru99Lnmx3tuLSaV
   HY6otR9b1cP/VD5tfBn0djnQ4iqq8cYvHV/Pg2FveiAF4CQ4SJKPjyc5V
   7WRvWjUXaqa/Ju45g1pX9xkl1Z4gYhval/x5m6STL8iGvt5wsVrQI9d4J
   yR3GKZXVU1x5ExCFopMtXQcmawE38uETMRUjU5p1fXRMyr19bs0hlnKmZ
   6Xf6CThaq2AM3I4kYSXvwMNZVWKmtG0VJwizLBWC1UqaqNKnslAIFEGM/
   /2tNXRBjI+PcAR8+JTPSUYqKI18jNhicsKPyf//GYT1P3Jul4GU1zilrw
   w==;
X-CSE-ConnectionGUID: 4/ZfUVJlSY6/JAbrxqs52w==
X-CSE-MsgGUID: W2YlPmDmQ5aB3nE9xHAlYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2318791"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2318791"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 06:19:40 -0800
X-CSE-ConnectionGUID: CVd16CGuQOSgKIiQxqXTNA==
X-CSE-MsgGUID: I3zh4lqRTbWRTWNosnzaeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8216584"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 06:19:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 06:19:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 06:19:38 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 06:19:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNlItR0Wdv+eBEd/YyBNrWYuZt+3oDCukd7cFYKtl8brcKiOy2cHeDQWW7DNMQSHgM+Ag0KmTxWkTQqO1c7tCCUc5RCAffoctN6g2UPiReu/FN5Js+jxPCSAGswqSrcXGWIzpc+fTbvIMxyLAIgyVhkl5raVEwWi2CB8TZkCcSJux0ClYDEFmnIDl+KhS5OwN+zaQv0lvW0NzUUyycPkx/Q1qj31hJGGIbEW4kCnh2pvwJ9LE22nSyMGW5Fgu0g10X64e5IcYWzVqHeH8UGllrpWTdEUKjM9ONEKFJBdyN2CTo1lDQ0wniernN22/KLI90ct6itzcULW/ntMe97EbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CflNJIAF0ilGZsy+6lTyE08YFE4VsQT+tvn1ymQTlok=;
 b=IxjkCENzrE0NOiPDb3ulYpsSVsJcSQIfbFnNkgJLa9beCLzm135yaYlBF47wciK7kraNAAyK2Bs/0Qk818AT/oN37d2WTI+jcfeEXHLSV6quGBR9IIrJoSAdc6rvIxi6/I4X6zCg2ePCyRwybRQEbi8ahKNHm77fIJH7gb+DdtYHAyqxvClhpobXzoxjvfb35jmh9x2JzKzobnePOV0uTdcgOhhUQ7+C8RDbcoHZR8y3v8NE6zQLe5/H4I22b4duY5Ie8nfAWjS9ZOdICV+x47e5OIGFqfin8+5agAcCt83fNyCZq8Gt5veub97KfpJ0TZnSnApZ6yMAuNbbTQV0XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SJ5PPFA058327E4.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::849) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 14:19:37 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 14:19:37 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "Bard
 Liao" <yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: RE: [PATCH 2/2] soundwire: stream: Fix bandwidth leak in multi-link
 aggregation failure
Thread-Topic: [PATCH 2/2] soundwire: stream: Fix bandwidth leak in multi-link
 aggregation failure
Thread-Index: AQHdapAaMMZdof4DMUqAjm0bh5VDFbcaTlWAgAIUNfA=
Date: Tue, 3 Nov 2026 14:19:36 +0000
Message-ID: <SJ2PR11MB8424997B97859DFF4D79F7A6FF692@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20261102060437.824814-1-yung-chuan.liao@linux.intel.com>
 <20261102060437.824814-3-yung-chuan.liao@linux.intel.com>
 <sashiko-outbox-192944@kernel.org>
In-Reply-To: <sashiko-outbox-192944@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SJ5PPFA058327E4:EE_
x-ms-office365-filtering-correlation-id: 78a6e666-a58c-4567-c86a-08df39b57da7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261026135527099003|261026140227099003|38070700021|261021135927099003|261021130227099003|261021133027099003|4143699003|56012099006|11063799006|261009223027099003|261028144727099003|261022105027099003|261026130827099003|261021121427099003|261021123027099003|261026121527099003|261022075727099003|261022115727099003|261022113327099003|10067099003|18002099003|22082099003|261102123227099003|6133799003|3023799007;
x-microsoft-antispam-message-info: gtGM1K3kI7hXiMZY4Ku7r1jM5sIiGcdjELfXHHCStmbay9dIROEPM/TGu2DCop+aS5+lqBdJlk8Fbqba1mIoMFtsHIVbK2XmEMqupiLAIExofVJgIyzTHePJJq14Vs3xiwJEaCJWh29uhSXWRIlNQ4rAEj/DyTv3g/ffOL6EKsHaWL99+YCC+MM/jyc4HF6JcFizMRzpPGvKapYCHpM+6UpxxWb50GhQrNgBUOsnKdX4yikmp50mckzOEmrsx0MLqtw5JxIspFcEvoBdWCXzBgaz8iSJbevJolrja82KBg2RROWwZP54yZzTZ4CBG0ER+WraS7c9VaBIZtQL2FbQJYpp3E25YSNWVFI7szNtXro1iYSSsJhTPASTm0nRw/cLqkhRz5F+JMULV25ZHlAeePqhpg45q7+58gcY+VUvece/sFKvbOTVvKpPlS7ZaPd2dlXg5VhIwzZvuuVxhAEOBXDAV4tF9CSJKUcxqrJUaL11gW4KOb6sBMblF/YIXtrDYX9aE5q7JUsjCP22eAYU7C41Ls/DF2lnWhNwNVq/KmWJgJsHhsInYoWWBqTDTAhS9ZXrAtfoj3fsYFA/LiTPr5u4R/51nhv38DFZnVcJQpZOixvLqyqFXmSMmWXxJEV2WP2BK2BLWiNR1Upo3ueo7E1Rb/SzgUHDaTQIMrCSLrM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261026135527099003)(261026140227099003)(38070700021)(261021135927099003)(261021130227099003)(261021133027099003)(4143699003)(56012099006)(11063799006)(261009223027099003)(261028144727099003)(261022105027099003)(261026130827099003)(261021121427099003)(261021123027099003)(261026121527099003)(261022075727099003)(261022115727099003)(261022113327099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEc4ODBIVXV2UlUwNFVLd2NxS2JVTGViRkJjSFNndXFneWpOaThwY3Y1MVR1?=
 =?utf-8?B?MHg4YVZzZjdPMGM5bDNUc2FyV1RCbjdTcmVxMmxYeXlsUTRlc0VhT0dIU0xC?=
 =?utf-8?B?c081NkRyRHVjc2h6amZZMlQyQmcvODVXT2NrM3Z2QTJRS2x5dXFZaWVOSGY5?=
 =?utf-8?B?MGlHdDlDRzlzajd5Y2hLYnJDM1hyeEJaU3puMVdXVkZmamxlTHZzZUhmcnFy?=
 =?utf-8?B?eHB3a2F6aVJCd2ZhT0N4TGpEVVZqUTJMb285bVh4NEZMcW9FOENuZzJjT3J5?=
 =?utf-8?B?bHdEQ0VEQzZ2OWZJTFVNVmpubjdaSFhYMjFBZjNrYnk5aHNhYVZObEVpS0pl?=
 =?utf-8?B?OWlhUWdUdjRqdTFqUlBIL1ZEOGNGZ1dCV1liUXNtaldkbkN1SmJqRFBqbjly?=
 =?utf-8?B?dE85Qzl6RU1VWURBSEQxemViMUd0Y1dhcTFjQ1hWWElsVnhyc1g3QlJmaCtU?=
 =?utf-8?B?Uk9nTFZsZXI3UkdMSkhacGJMb0ljeU5NOFB3eGxBRDZoM01jeFMzTm5zdGc4?=
 =?utf-8?B?YWFmL3FvQnlldmNIY2sxclo1L2o1Y3R5WHo5STd1c3oyRkdQTUpGYnlIM0xo?=
 =?utf-8?B?SVQzUDhtTU1zMms2amxYS0JrSUgwNS9ZODR2Wkd4RjJUQjlLTHI0d1ZUUmR5?=
 =?utf-8?B?SktjTmdRR1VpaXNkODdHK2pEdFpERzhvSUpqZ1BveG04cFFKRU9NdlRiZ2wz?=
 =?utf-8?B?V2d5TEFlcWI2OWZRZVp0aG5aTkxBWGR2aW1QMnlzaUk3Y3pDRTdKTXczUE9x?=
 =?utf-8?B?WXFTQkJ5VXdYYURWTXlMb0N1L0JGN1Y5Q011SjhZUFFZTEV3dS95bzdQUkpq?=
 =?utf-8?B?S0pHUlhGcEdkdUdRTHZQUlQvUE8wWU9IZWYrOVBjWlZuQjNrL0VKQUJjUlJ6?=
 =?utf-8?B?bVhEOG51L20rMlF3RXBkNFlGYmIvVE15bm1tb0Z5V3pZcnBQQ1I2b21PNjFB?=
 =?utf-8?B?TUJRUVA5dFZMSldQdDVJeHpRaVNRSk43cDNNZGl0ZXROOHNkUVFOdFJrOWlv?=
 =?utf-8?B?Ly9iR1ZxVisxNUQ3ZTZWOUFXOGhUK003ZDNFa0QxZU9NdExONm9Ub01FcWYz?=
 =?utf-8?B?Nkx0M0NjVFlBY1pWZ1FuSldLejRQRFNJSFo3amFITFc2UGFKVFFSYmFwcmtG?=
 =?utf-8?B?ZUhvcWQ0THBBazB6bGxxa0FmN3Q2TUFTbFo2NjdSazcyNnJyMDZEcmUvVVdq?=
 =?utf-8?B?dlpwOWczS0ZRWCtITVRDbndwQWxoUlQ0eGsxSEtUaHVZejFpUmNiNkFkbmpX?=
 =?utf-8?B?RjVCMkdmMFROaFZTalprb0VoZVowOXAvZ2t2Z2xqVGgwL1ZWVDNGNVI2UEZh?=
 =?utf-8?B?Rm5KaDlUaVhCYmJLdUUwWXh1V0d4RkF0M3NOV3VScHp6akUwQ2FMS0tBdnkx?=
 =?utf-8?B?SWhwb1dQZnZhQ3V6em5ndHhzWlNrRENCMEp1U1dQeGs2V2JQakZtYVIySkt2?=
 =?utf-8?B?VGNDN0U1cEw4bVRJTElIYVNXRXNKL2FsNWh5b0RKSEVrTU5xb2xkVytSM1BS?=
 =?utf-8?B?QmM1eDREMmdwN0lXemdNTllzdFhnZUxvRWNzSjQxelZSYWFwa2NEWDVXWnhi?=
 =?utf-8?B?ZzdEUnVCOXBhWkFBdS96MG5hK1A2T0UwSTNGUHhFRGVwVWVxUTNkNXdDTDhK?=
 =?utf-8?B?RlpodjhnVmhtU1AwR3VIbW5OYWd2eStBRlRrc3JIeGF4MndRdDhXSHROWmFO?=
 =?utf-8?B?R2VnNUJDQmNEejJvdFlzcWRDLzFxZUo1K01VVWtzK3A1Y1JZRE03OE1tSms5?=
 =?utf-8?B?L0haV09NSjhtL05KeG5EeU56a2d4dWZFSHZvQSthdHUvQmMzQTV3S0hhZ3d5?=
 =?utf-8?B?MTNWOTdXamVFNks0VGxvY1Y2T2c0YWFUS2hxQms4NWczZDd0ay9USjZkREha?=
 =?utf-8?B?NW9pV0g1TFJKSnRSNnNXZUxWdC9obVB5Y1ppajB6SmVjMDJCVmxUd2pjYzl3?=
 =?utf-8?B?VWdDNDE0QkkxUkluTFYzeVdtTkgycVo5TFQrY2kzajBuU255aFdPV2hYSm1k?=
 =?utf-8?B?SjdiUDhJUHJnOXkrSVRBRExLY2ZJRHVXZElBNDZMS2JNZ2hXUHpXdHMrelNU?=
 =?utf-8?B?aDFoajh1MGFndjJlbVN2ZVRpa1l2VURpTmUyRWt1c2E4MWpsb254YTQ2UmlZ?=
 =?utf-8?B?Z1VNMUUrdkQ4bjcrTWo0a3RPWEpid0RpOThhUStselFKSUorY0l2ZkhMSVJ5?=
 =?utf-8?B?MVFrbEJ5VFcwcThaYWZTMUQyTGNlS0JYM3ZPRXFYSTdwaHlaWGQ3NHpiSXZy?=
 =?utf-8?B?eGdpeU0yOW03ODl4OWJhT3AxWEt0eDV2cU1sQVRaVFA0ZVhPMm1seFppZTZW?=
 =?utf-8?Q?4oA0Q1pShIjDdPE/y3?=
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
X-Exchange-RoutingPolicyChecked: U+JqAHO87PJbtIPsCww+vA0OSB+sMF83Dz08ScdcdNxV2jRz9IPzNGRO/gRQ6MR0EVok8nuj3hZWvMfxcHzYfXzWowSbkVKP4SwlURonKbkbZlBiLkRJL0vg7k6d+1dKXZqrMfW4NQ35m41cl0/yNj9EDRzJ1D6Y/p4qiL+U1yndmF7gFbLBxVproR88MDZbtJtixATQqWWGIePJW5UtYd2mgPEnu0AS5KuyIQ+q3d69LskXeBp4LApZacdc6XBHkQQr08q1Ae6rjweXnJMOu0IcVHpFRt1vZchilgh8HOb/24ot2Fgi/Ag1gO/f9Ku7/kV9t+CLqGwWuvNu+XJtCg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a6e666-a58c-4567-c86a-08df39b57da7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 14:19:36.9365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vEXUYV7n/WC47rHK5BLOMr29ZI8VuEZJAcde23To7tR2G8ehl8zjH7JLXGx2Syf5QCYJ6TSftm7kmMLcY+dIQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA058327E4
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJl
ciAyLCAyMDI2IDI6MTcgUE0NCj4gVG86IEJhcmQgTGlhbyA8eXVuZy1jaHVhbi5saWFvQGxpbnV4
LmludGVsLmNvbT47IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDIvMl0gc291bmR3aXJlOiBzdHJlYW06IEZpeCBiYW5kd2lkdGggbGVhayBpbiBtdWx0
aS1saW5rDQo+IGFnZ3JlZ2F0aW9uIGZhaWx1cmUNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBj
b250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDIgcG90ZW50aWFsIGlzc3VlKHMp
IHRvDQo+IGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBzb3VuZHdpcmU6IHN0cmVhbTogYmFuayBzdGF0
ZSBkZXN5bmMgaW4gX3Nkd19wcmVwYXJlX3N0cmVhbSgpIHJvbGxiYWNrDQo+IC0gW0hpZ2hdIHNv
dW5kd2lyZTogc3RyZWFtOiBpbmNvbXBsZXRlIHBvcnQgYW5kIGxhbmUgcm9sbGJhY2sgaW4NCj4g
X3Nkd19wcmVwYXJlX3N0cmVhbSgpDQo+IC0tDQo+IA0KPiBjb21taXQgOWI0MjBkZTMxNGVjNTA0
MTZkNzljZTMzN2Y4YTFmZWRkNjk4YmU1Mg0KPiBBdXRob3I6IERhdmlkIExpbiA8ZGF2aWQubGlu
QGludGVsLmNvbT4NCj4gDQo+IHNvdW5kd2lyZTogc3RyZWFtOiBGaXggYmFuZHdpZHRoIGxlYWsg
aW4gbXVsdGktbGluayBhZ2dyZWdhdGlvbiBmYWlsdXJlDQo+IA0KPiBUaGlzIGNvbW1pdCBzbmFw
c2hvdHMgc3RydWN0IHNkd19idXNfcGFyYW1zIGZvciBlYWNoIG1hc3RlciBpbiBhIHN0cmVhbQ0K
PiBiZWZvcmUgcHJlcGFyaW5nIGl0IGFuZCByZXN0b3JlcyBhbGwgbWFzdGVycycgcGFyYW1ldGVy
cyBvbiBmYWlsdXJlIGluDQo+IF9zZHdfcHJlcGFyZV9zdHJlYW0oKSB0byBwcmV2ZW50IGJhbmR3
aWR0aCBsZWFrcyBvbiBlYXJsaWVyIGxpbmtzLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zb3VuZHdpcmUvc3RyZWFtLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9zdHJlYW0uYw0KPiA+IGlu
ZGV4IDk2NjEzZGQwNjc3YzQuLjg2ZDk1MWNjOTJmNzIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9zb3VuZHdpcmUvc3RyZWFtLmMNCj4gPiArKysgYi9kcml2ZXJzL3NvdW5kd2lyZS9zdHJlYW0u
Yw0KPiA+IEBAIC0xNDc3LDE5ICsxNDc3LDIyIEBAIHN0YXRpYyBpbnQgX3Nkd19wcmVwYXJlX3N0
cmVhbShzdHJ1Y3QNCj4gc2R3X3N0cmVhbV9ydW50aW1lICpzdHJlYW0sDQo+ID4gIAlzdHJ1Y3Qg
c2R3X21hc3Rlcl9ydW50aW1lICptX3J0Ow0KPiA+ICAJc3RydWN0IHNkd19idXMgKmJ1czsNCj4g
PiAgCXN0cnVjdCBzZHdfbWFzdGVyX3Byb3AgKnByb3A7DQo+ID4gLQlzdHJ1Y3Qgc2R3X2J1c19w
YXJhbXMgcGFyYW1zOw0KPiA+ICAJaW50IHJldDsNCj4gPg0KPiA+ICsJLyogUHJlLXBhc3M6IHNu
YXBzaG90IG9yaWdpbmFsIGJ1cyBwYXJhbWV0ZXJzIGZvciBhbGwgbWFzdGVycyAqLw0KPiA+ICsJ
bGlzdF9mb3JfZWFjaF9lbnRyeShtX3J0LCAmc3RyZWFtLT5tYXN0ZXJfbGlzdCwgc3RyZWFtX25v
ZGUpDQo+ID4gKwkJbV9ydC0+cGFyYW1zX2JhY2t1cCA9IG1fcnQtPmJ1cy0+cGFyYW1zOw0KPiA+
ICsNCj4gPiAgCS8qIFByZXBhcmUgIE1hc3RlcihzKSBhbmQgU2xhdmUocykgcG9ydChzKSBhc3Nv
Y2lhdGVkIHdpdGggc3RyZWFtICovDQo+ID4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KG1fcnQsICZz
dHJlYW0tPm1hc3Rlcl9saXN0LCBzdHJlYW1fbm9kZSkgew0KPiA+ICAJCWJ1cyA9IG1fcnQtPmJ1
czsNCj4gPiAgCQlwcm9wID0gJmJ1cy0+cHJvcDsNCj4gPiAtCQltZW1jcHkoJnBhcmFtcywgJmJ1
cy0+cGFyYW1zLCBzaXplb2YocGFyYW1zKSk7DQo+ID4NCj4gPiAgCQkvKiBUT0RPOiBTdXBwb3J0
IEFzeW5jaHJvbm91cyBtb2RlICovDQo+ID4gIAkJaWYgKChwcm9wLT5tYXhfY2xrX2ZyZXEgJSBz
dHJlYW0tPnBhcmFtcy5yYXRlKSAhPSAwKSB7DQo+ID4gIAkJCWRldl9lcnIoYnVzLT5kZXYsICJB
c3luYyBtb2RlIG5vdCBzdXBwb3J0ZWRcbiIpOw0KPiA+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4g
PiArCQkJcmV0ID0gLUVJTlZBTDsNCj4gPiArCQkJZ290byByZXN0b3JlX3BhcmFtczsNCj4gPiAg
CQl9DQo+ID4NCj4gPiAgCQlpZiAodXBkYXRlX3BhcmFtcykgew0KPiA+IEBAIC0xNTQwLDcgKzE1
NDMsMTMgQEAgc3RhdGljIGludCBfc2R3X3ByZXBhcmVfc3RyZWFtKHN0cnVjdA0KPiBzZHdfc3Ry
ZWFtX3J1bnRpbWUgKnN0cmVhbSwNCj4gPiAgCXJldHVybiByZXQ7DQo+ID4NCj4gPiAgcmVzdG9y
ZV9wYXJhbXM6DQo+ID4gLQltZW1jcHkoJmJ1cy0+cGFyYW1zLCAmcGFyYW1zLCBzaXplb2YocGFy
YW1zKSk7DQo+ID4gKwkvKg0KPiA+ICsJICogUmV2ZXJ0IGFsbCBtYXN0ZXJzIHRvIHRoZWlyIHNu
YXBzaG90dGVkIG9yaWdpbmFsIHBhcmFtZXRlcnMuDQo+ID4gKwkgKiBBbnkgbWFzdGVyIHRoYXQg
d2FzIG5vdCBtb2RpZmllZCB3aWxsIHNhZmVseSByZXZlcnQgdG8gaXRzIG93biBvcmlnaW5hbA0K
PiBzdGF0ZS4NCj4gPiArCSAqLw0KPiA+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShtX3J0LCAmc3Ry
ZWFtLT5tYXN0ZXJfbGlzdCwgc3RyZWFtX25vZGUpDQo+ID4gKwkJbV9ydC0+YnVzLT5wYXJhbXMg
PSBtX3J0LT5wYXJhbXNfYmFja3VwOw0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBDYW4gdGhp
cyByb2xsYmFjayBkZXN5bmNocm9uaXplIGJ1cy0+cGFyYW1zLmN1cnJfYmFuayBhbmQNCj4gYnVz
LT5wYXJhbXMubmV4dF9iYW5rIGZyb20gdGhlIGFjdGl2ZSBoYXJkd2FyZSByZWdpc3RlciBiYW5r
IHdoZW4gZmFpbHVyZQ0KPiBvY2N1cnMgZHVyaW5nIG9yIGFmdGVyIGRvX2Jhbmtfc3dpdGNoKCk/
DQoNClllcywgdGhpcyBjYW4gaGFwcGVuLCBidXQgdGhlIGlzc3VlIGFscmVhZHkgZXhpc3RzIGlu
IHRoZSBjdXJyZW50IGNvZGUNCmFuZCB3YXMgbm90IGludHJvZHVjZWQgYnkgdGhpcyBjb21taXQu
DQoNCj4gDQo+IEF0IHRoZSBzdGFydCBvZiBfc2R3X3ByZXBhcmVfc3RyZWFtKCksIG1fcnQtPnBh
cmFtc19iYWNrdXAgY29waWVzIHRoZSBlbnRpcmUNCj4gc3RydWN0IHNkd19idXNfcGFyYW1zLCBp
bmNsdWRpbmcgdGhlIHByZS1zd2l0Y2ggY3Vycl9iYW5rIGFuZCBuZXh0X2JhbmsNCj4gdmFsdWVz
LiBMYXRlciBpbiBfc2R3X3ByZXBhcmVfc3RyZWFtKCksIGRvX2Jhbmtfc3dpdGNoKCkgc3dpdGNo
ZXMgdGhlDQo+IGhhcmR3YXJlIGJhbmsgYW5kIGZsaXBzIGN1cnJfYmFuayBhbmQgbmV4dF9iYW5r
ICh2aWEgc2R3X2Jhbmtfc3dpdGNoKCkgb3INCj4gc2R3X21sX3N5bmNfYmFua19zd2l0Y2goKSks
IGZvbGxvd2VkIGJ5IHRoZSBsb29wIGNhbGxpbmcNCj4gc2R3X3ByZXBfZGVwcmVwX3BvcnRzKCk6
DQo+IA0KPiAJcmV0ID0gZG9fYmFua19zd2l0Y2goc3RyZWFtKTsNCj4gCWlmIChyZXQgPCAwKSB7
DQo+IAkJcHJfZXJyKCIlczogZG9fYmFua19zd2l0Y2ggZmFpbGVkOiAlZFxuIiwgX19mdW5jX18s
IHJldCk7DQo+IAkJZ290byByZXN0b3JlX3BhcmFtczsNCj4gCX0NCj4gDQo+IAlsaXN0X2Zvcl9l
YWNoX2VudHJ5KG1fcnQsICZzdHJlYW0tPm1hc3Rlcl9saXN0LCBzdHJlYW1fbm9kZSkgew0KPiAJ
CWJ1cyA9IG1fcnQtPmJ1czsNCj4gDQo+IAkJLyogUHJlcGFyZSBwb3J0KHMpIG9uIHRoZSBuZXcg
Y2xvY2sgY29uZmlndXJhdGlvbiAqLw0KPiAJCXJldCA9IHNkd19wcmVwX2RlcHJlcF9wb3J0cyht
X3J0LCB0cnVlKTsNCj4gCQlpZiAocmV0IDwgMCkgew0KPiAJCQlkZXZfZXJyKGJ1cy0+ZGV2LCAi
UHJlcGFyZSBwb3J0KHMpIGZhaWxlZCByZXQgPSAlZFxuIiwNCj4gCQkJCXJldCk7DQo+IAkJCWdv
dG8gcmVzdG9yZV9wYXJhbXM7DQo+IAkJfQ0KPiAJfQ0KPiANCj4gSWYgc2R3X3ByZXBfZGVwcmVw
X3BvcnRzKCkgZmFpbHMgb24gYW55IGxpbmsgKG9yIGlmIGRvX2Jhbmtfc3dpdGNoKCkgZmFpbHMg
b24NCj4gYSBsYXRlciBsaW5rIGFmdGVyIGFuIGVhcmxpZXIgbGluayBoYXMgYWxyZWFkeSBzd2l0
Y2hlZCBiYW5rcyksIGp1bXBpbmcgdG8NCj4gcmVzdG9yZV9wYXJhbXMgb3ZlcndyaXRlcyBtX3J0
LT5idXMtPnBhcmFtcyB3aXRoIG1fcnQtPnBhcmFtc19iYWNrdXANCj4gYWNyb3NzDQo+IGV2ZXJ5
IG1hc3RlciBpbiBzdHJlYW0tPm1hc3Rlcl9saXN0Lg0KPiANCj4gV291bGRuJ3QgdGhhdCByZXZl
cnQgY3Vycl9iYW5rIGFuZCBuZXh0X2JhbmsgdG8gdGhlaXIgcHJlLXN3aXRjaCB2YWx1ZXMgd2hp
bGUNCj4gdGhlIGhhcmR3YXJlIHJlbWFpbnMgb24gdGhlIG5ld2x5IHN3aXRjaGVkIGJhbmsgKGFu
ZCBsZWF2ZSBhbnkgcG9ydHMgcHJlcGFyZWQNCj4gb24gZWFybGllciBsaW5rcyBpbiB0aGUgbG9v
cCBwcmVwYXJlZCksIGNhdXNpbmcgc3Vic2VxdWVudCBzdHJlYW0gb3BlcmF0aW9ucw0KPiB0byBw
cm9ncmFtIGJhbmtlZCByZWdpc3RlcnMgaW50byB0aGUgY3VycmVudGx5IGFjdGl2ZSBoYXJkd2Fy
ZSBiYW5rPw0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBBbHNvLCB3aGF0IGhhcHBlbnMgdG8g
dGhlIHBlci1wb3J0IGxhbmUgYXNzaWdubWVudHMgYW5kIHRyYW5zcG9ydCBwYXJhbWV0ZXJzDQo+
IG1vZGlmaWVkIGJ5IGJ1cy0+Y29tcHV0ZV9wYXJhbXMoKSBvbiBwcmVjZWRpbmcgbGlua3Mgd2hl
biByZXN0b3JlX3BhcmFtcw0KPiByb2xscyBiYWNrIG1fcnQtPmJ1cy0+cGFyYW1zPw0KDQpJIHdp
bGwgYWRkcmVzcyB0aGUgc3RhbGUgbGFuZSBhc3NpZ25tZW50cyBieSBhbHdheXMgdXBkYXRpbmcg
dGhlIHBvcnQNCmxhbmUgZHVyaW5nIHBhcmFtZXRlciBjb21wdXRhdGlvbiwgaW5jbHVkaW5nIHdo
ZW4gdGhlIHNlbGVjdGVkIGxhbmUgaXMNCjAuIFRoaXMgZW5zdXJlcyB0aGF0IGEgc3Vic2VxdWVu
dCBwcmVwYXJlIGF0dGVtcHQgdXNlcyB0aGUgY29ycmVjdCBsYW5lDQp3aXRob3V0IHJlcXVpcmlu
ZyBhbiBleHBsaWNpdCBsYW5lIHJvbGxiYWNrIG9uIGZhaWx1cmUuIFRyYW5zcG9ydA0KcGFyYW1l
dGVycyB3aWxsIGFsc28gYmUgcmVjb21wdXRlZCBkdXJpbmcgdGhhdCBhdHRlbXB0Lg0KDQo+IA0K
PiBEdXJpbmcgX3Nkd19wcmVwYXJlX3N0cmVhbSgpLCBidXMtPmNvbXB1dGVfcGFyYW1zKCkgY2Fs
bHMNCj4gc2R3X2NvbXB1dGVfcGFyYW1zKCkgLT4gc2R3X2NvbXB1dGVfYnVzX3BhcmFtcygpLCB3
aGljaCBhbGxvY2F0ZXMgbXVsdGktDQo+IGxhbmUNCj4gYmFuZHdpZHRoIGluIGJ1cy0+cGFyYW1z
LmxhbmVfdXNlZF9iYW5kd2lkdGhbXSBhbmQgc2V0cyBub24temVybyBsYW5lDQo+IG51bWJlcnMN
Cj4gb24gdGhlIHNsYXZlIGFuZCBtYXN0ZXIgcG9ydCBydW50aW1lczoNCj4gDQo+IAlpZiAobV9s
YW5lID4gMCkgew0KPiAJCS8qIFNldCBQZXJpcGhlcmFsIGxhbmVzICovDQo+IAkJbGlzdF9mb3Jf
ZWFjaF9lbnRyeShzX3J0LCAmbV9ydC0+c2xhdmVfcnRfbGlzdCwgbV9ydF9ub2RlKSB7DQo+IAkJ
CXNsYXZlX3Byb3AgPSAmc19ydC0+c2xhdmUtPnByb3A7DQo+IAkJCWZvciAobCA9IDE7IGwgPCBT
RFdfTUFYX0xBTkVTOyBsKyspIHsNCj4gCQkJCWlmIChzbGF2ZV9wcm9wLT5sYW5lX21hcHNbbF0g
PT0gbV9sYW5lKSB7DQo+IAkJCQkJbGlzdF9mb3JfZWFjaF9lbnRyeShzX3BfcnQsICZzX3J0LQ0K
PiA+cG9ydF9saXN0LCBwb3J0X25vZGUpIHsNCj4gCQkJCQkJc19wX3J0LT5sYW5lID0gbDsNCj4g
CQkJCQkJLi4uDQo+IAkJCQkJfQ0KPiAJCQkJCWJyZWFrOw0KPiAJCQkJfQ0KPiAJCQl9DQo+IAkJ
fQ0KPiAJCS4uLg0KPiAJCWxpc3RfZm9yX2VhY2hfZW50cnkobV9wX3J0LCAmbV9ydC0+cG9ydF9s
aXN0LCBwb3J0X25vZGUpIHsNCj4gCQkJbV9wX3J0LT5sYW5lID0gbV9sYW5lOw0KPiAJCX0NCj4g
CX0NCj4gDQo+IEl0IHRoZW4gY2FsbHMgX3Nkd19jb21wdXRlX3BvcnRfcGFyYW1zKCksIHdoaWNo
IHVwZGF0ZXMgcF9ydC0NCj4gPnRyYW5zcG9ydF9wYXJhbXMNCj4gYWNyb3NzIHRoZSBwb3J0cyBv
biB0aGF0IGJ1cy4NCj4gDQo+IFdoZW4gYSBzdWJzZXF1ZW50IHN0ZXAgb3IgbGluayBpbiBfc2R3
X3ByZXBhcmVfc3RyZWFtKCkgZmFpbHMsIHJlc3RvcmluZw0KPiBtX3J0LT5idXMtPnBhcmFtcyA9
IG1fcnQtPnBhcmFtc19iYWNrdXAgcmV2ZXJ0cw0KPiBidXMtPnBhcmFtcy5sYW5lX3VzZWRfYmFu
ZHdpZHRoW10gYW5kIGJ1cy0+cGFyYW1zLmN1cnJfZHJfZnJlcSwgYnV0IGxlYXZlcw0KPiBzX3Bf
cnQtPmxhbmUsIG1fcF9ydC0+bGFuZSwgYW5kIHBfcnQtPnRyYW5zcG9ydF9wYXJhbXMgbW9kaWZp
ZWQuDQo+IA0KPiBJZiB0aGUgc3RyZWFtIGlzIGxhdGVyIGRlcHJlcGFyZWQgaW4gX3Nkd19kZXBy
ZXBhcmVfc3RyZWFtKCk6DQo+IA0KPiAJCWxpc3RfZm9yX2VhY2hfZW50cnkocF9ydCwgJm1fcnQt
PnBvcnRfbGlzdCwgcG9ydF9ub2RlKSB7DQo+IAkJCWlmICghcF9ydC0+bGFuZSkNCj4gCQkJCWNv
bnRpbnVlOw0KPiANCj4gCQkJYmFuZHdpZHRoID0gbV9ydC0+c3RyZWFtLT5wYXJhbXMucmF0ZSAq
DQo+IGh3ZWlnaHQzMihwX3J0LT5jaF9tYXNrKSAqDQo+IAkJCQkgICAgbV9ydC0+c3RyZWFtLT5w
YXJhbXMuYnBzOw0KPiAJCQltdWx0aV9sYW5lX2JhbmR3aWR0aCArPSBiYW5kd2lkdGg7DQo+IAkJ
CWJ1cy0+cGFyYW1zLmxhbmVfdXNlZF9iYW5kd2lkdGhbcF9ydC0+bGFuZV0gLT0NCj4gYmFuZHdp
ZHRoOw0KPiAJCQlpZiAoIWJ1cy0+cGFyYW1zLmxhbmVfdXNlZF9iYW5kd2lkdGhbcF9ydC0+bGFu
ZV0pDQo+IAkJCQlwX3J0LT5sYW5lID0gMDsNCj4gCQl9DQo+IA0KPiB3b24ndCBzZWVpbmcgYSBu
b24temVybyBwX3J0LT5sYW5lIGFmdGVyIGJ1cy0+cGFyYW1zLmxhbmVfdXNlZF9iYW5kd2lkdGhb
XQ0KPiB3YXMgcm9sbGVkIGJhY2sgdW5kZXJmbG93IGJ1cy0+cGFyYW1zLmxhbmVfdXNlZF9iYW5k
d2lkdGhbcF9ydC0+bGFuZV0gYW5kDQo+IHNraXAgcmVsZWFzaW5nIG11bHRpX2xhbmVfYmFuZHdp
ZHRoIGZyb20gYnVzLT5wYXJhbXMuYmFuZHdpZHRoLCBvciBjYXVzZQ0KPiBzZHdfY29tcHV0ZV9n
cm91cF9wYXJhbXMoKSBhbmQgX3Nkd19jb21wdXRlX3BvcnRfcGFyYW1zKCkgdG8gc2tpcCB0aGUN
Cj4gcG9ydHMNCj4gd2hlbiBidXMtPnBhcmFtcy5sYW5lX3VzZWRfYmFuZHdpZHRoW3BfcnQtPmxh
bmVdIGlzIHplcm8/DQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDIwNjA0MzcuODI0ODE0LTEtDQo+IHl1bmctY2h1
YW4ubGlhb0BsaW51eC5pbnRlbC5jb20/cGFydD0yDQoNCg==
