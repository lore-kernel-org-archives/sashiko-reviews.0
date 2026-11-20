Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795178763;
	b=JASqKtY4Ve60j2NSMuU9k0FET3F8cS5JsoZMClziWmL2HCHgw6dOOXQmYcO8q8wxAKM2
	 ntQkAME+9vDO/NhzR5zn2uZ4H6EdveZqXXrCuzT5VKYTrh5jjdnxCMQ8UUSkk+A0/xhyY
	 tJvA2wwmw8Ytn8RN/4XBR9ERvgLi1dMWcspUEPKZZRgynZ8mm7xJqYSEmGqgygip/AgP/
	 nDB1U0cOHP/rCTLROESJHb8BjqctShvc9QZQ033vO6rYq/xqMuEq3tn8nToMsTrwaVpW2
	 DxbUn+ZzkIO4IiS0+w/eNWDSW6dIWKKNNXFJE7XME0bkQXsLrVzHtovxYJboZg9rgfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178763;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
	bh=XMCWHvkHAB2FoNGBBURsYBS/7K5ZeMGLt8AILqwmWOw=;
	b=KXZ8loNxI+YNP7ZE0tKJk3X0nKFZtNkzgn3Nk/lZfEePatZhHgXAFYU0X2molQI/P7Qg
	 orHFLiVtMERpptW01UrAnosE3Ui4on6+3CeKnQ73JX2BgVe1E8jVpMqK8dyVPAUn/0C0q
	 r0qHIJMq6+L3AREdNWVSTZJQt9WgufLW09a1vm6YhOBQdezFDh92+yNogqrCr/jwEieF3
	 3WU44/jJw7Iyuv4nHolyMOHkh7l0/PzYuPZZFiIGqs/Ait3alY/zqRTx3lPzzcKbks9CD
	 KayRqM01h1M1Y+pUV+fFKzGbk3nY+I6CyckMNg9y6MGbpkdIKCKp8befEBuZw1OAzHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V9bGIEoW;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kGaWCZx4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B7B60A2603
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B7B60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V9bGIEoW;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kGaWCZx4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795178763; x=1826714763;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XMCWHvkHAB2FoNGBBURsYBS/7K5ZeMGLt8AILqwmWOw=;
  b=V9bGIEoW+6az5wRYOr2Sh8Q2kIsmHtVxZjeks+5nbzkm1OcMZL74Gpmr
   1RW/EipRLBXkGcsbbeQ1NT68lFvf8+VSZk+q+09cTJaPQ2cVJRQpHXd/K
   qPI2YMpJD0plcAVE6FWNvR9jlVSbMg48RaUO+vQxU4C19Qh5+3KqsVFly
   PeuZvl1hdUPv8oiylVVrsS9aPTW2M+rpZN/iGB+vUQ0pz80LdBpKXRCE6
   B+3u1ZofNTjsnrpD8TMu3oBlapNecPJtdhduW99/n6sjzqYvPpxGyZBU3
   oQmF+KxhQscKuPAdiU368PsG35MOO+mlL+xJKfCY0T/r9lPCeqXdj7By9
   g==;
X-CSE-ConnectionGUID: YAPXpgzsT1mlbzfAI/Efbg==
X-CSE-MsgGUID: RYqZH+xQRgCaynkCZ2Pjpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3946534"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3946534"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 04:46:02 -0800
X-CSE-ConnectionGUID: WtqbPVGGQRyJKMzBGl9HHg==
X-CSE-MsgGUID: fE3UMLSyT5aoxcPhTxDx9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10765077"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 04:46:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 04:46:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 04:46:01 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 04:46:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rK0XHRGStjawc8aKNeaFDLTKLoUjzc5gWAQNAa4jO9Lih/ZdNRGdHasasme4ApT1FgbRSfokuMtR1OIWkTi2JAyjW0SMt5T4wxhi1wnP2Pr3kmvKAFAB9XzYiKgbJPPhTRN3eUTzLjuKmrrglIjKnnSZ2uoOa/e8R/mZHVKwH8eqF4n0rB/5t+6TaWEY9YeY736NEhhnEEGapxDMakTTISvXvPKpIS8CsMZ+sEs4r14dRDz6ER0/S6o7Dlsd/NWgDswk5VyM45gNQSKxoOh1DF6XJOlU/vjipYXht6CWBp5mWKqWlFQBJuKSJ54ivAV41Rd62CX53a5B74QjAXHrqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMCWHvkHAB2FoNGBBURsYBS/7K5ZeMGLt8AILqwmWOw=;
 b=lkWOihbTncvwpSAbH/qVBbjI4/iTaL1bvLcwUNXVS30R3B/KgdmsnSF7Us/TnZvAHz0EMlkL5w9dwVkwuu3n3KsDSAZyJEEXAsAiM3p/XMuuzbyg8GZGrQjQ73CUDIGd0J0Afwbq02Tgxfot5i7LKdrGmSb8RlEiK1mc8CBiD3EQZTs5F4BMBI+eJemE16z4gceAjcbDu7I/wuwxAGYXV+9qVFXcf2RAcgi+bfgj09h7+92CGX6OVwl1PbYetOujGzuwplKWFWJjfUQB5KagNVhj4jFAakCj89gUf83SyvQB4/fqVlOUnO0zix6ipGNyJR6ePU4A/3HJZUM4v6AwOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMCWHvkHAB2FoNGBBURsYBS/7K5ZeMGLt8AILqwmWOw=;
 b=kGaWCZx4ZTpHFNTSS38EzdSFQ85JyRoj+2ogJgYUrb/R9ngYSvX4Ngis8Z2rPvy66NnHhQTXt0DDcukUlrzdWbNAK87nkuUqkPafbhHAYJ5RhtW+Uec8qLYsOERMvs61EeIYm4iC+zOOhmDwd3e3cqdQwCME4mjVW/pInKN/bLU=
Received: from DS4PR11MB131308.namprd11.prod.outlook.com (2603:10b6:8:502::7)
 by LV2PR11MB9540.namprd11.prod.outlook.com (2603:10b6:408:378::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 12:45:59 +0000
Received: from DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920]) by DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 12:45:59 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/4] drm/xe: Add has_sem64 bit to graphics/media IP
 descriptors
Thread-Topic: [PATCH 1/4] drm/xe: Add has_sem64 bit to graphics/media IP
 descriptors
Thread-Index: AQHdeOdmxP8RDIa4GUqKWyz7GXO9L7c24gAAgAAFmeA=
Date: Fri, 20 Nov 2026 12:45:59 +0000
Message-ID: <DS4PR11MB131308A5ACA4071B96F628206FC8782@DS4PR11MB131308.namprd11.prod.outlook.com>
References: <20261120120231.748267-1-tilak.tirumalesh.tangudu@intel.com>
 <20261120120231.748267-2-tilak.tirumalesh.tangudu@intel.com>
 <sashiko-outbox-225139@kernel.org>
In-Reply-To: <sashiko-outbox-225139@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB131308:EE_|LV2PR11MB9540:EE_
x-ms-office365-filtering-correlation-id: 977d6300-4f59-4056-9a76-08df47043a39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|22082099003|18002099003|11063799006|4143699003|261022105027099003|261028144727099003|261026140227099003|56012099006|261026121527099003|10067099003|261009220027099003|261021121427099003|261009223027099003|261009221227099003|261009221727099003|261009223327099003|261022075727099003|261102123227099003|38070700021;
x-microsoft-antispam-message-info: IDaPV/tVDC7I+oNUVIsAO8cqmw82qiylJ20IeqTQowLChRXr3u3zcTHBijFG4t5iY7aAPTobuEtd8YRMNG/zCUeZwv0XC+II1D9yJz3P6KtmfiQdxoANOcln2IfVGAWRMb/UzRh+xb2bEYuwm18MNm0GfR44QH4Zr3JqG8eAsSJ/8MAR+EylgTZ6PsZ21XZimWLmkQzpaDd7oSFYH6HSoeoIcXNx282FMOnRUwI3YoopRdfLY+PcwUPGQf7FmgPZHs36HdFZZRkFY5nPABP3bpZnX48U0HKvheYVcMzE0QmnI8koYr8RvcvCtxmlQwAYlQ4aUUZ41QeH0FbcerSfbOw5DHpIumUbYg+FJdYsay0IA1h4Qifp0+t8aoWE7ZP7cfIjKBrlIzIKQI2E4SdJ4gnxYKU9czYz7QWkouYyZ6GICW8AvVI+6XizRiJYVYvtcARHwF5SMgmKSRtHaJerkGu4ksktp2HWkBcjycpyMuxxivV+N/BK12kP9kg9vx0qvIr4KHzUrV6Ct6+HGvdAsAW2QqdGD3lthoE6v+GvMixQpdjRMla47u/5iCTYgLaJUS9K0EFHTXhVyY97zjVUsWTDZx+QD/8p46UtJiw4aqeTMiScI+9fOi5eCCNc1pgLKbzwPfIjm2FOqa41iAVJTz2j9ZC1jjUCGXj6uP8lAwA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR11MB131308.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(261022105027099003)(261028144727099003)(261026140227099003)(56012099006)(261026121527099003)(10067099003)(261009220027099003)(261021121427099003)(261009223027099003)(261009221227099003)(261009221727099003)(261009223327099003)(261022075727099003)(261102123227099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVFEZXRNRE9naGZJME9SSUV0a1NsaXd0M1JaeEhna0J3RE8ybmxrVnRaVCtr?=
 =?utf-8?B?RyswWlV6aEhONGxCMVp1MXlkNEFOcWpXNEg0NjA0b1Fxei84YzNmSEIvblhN?=
 =?utf-8?B?YjhnRXo5UVFTaTBuSkVHWUEwbzc3dUlMOVNacnoycEY2OU5GUHd2ZEhCc2I4?=
 =?utf-8?B?R2htZnMwOHl2NUJzaXdLTzQ4ZmhjTFdoajFwVldzTFJWZFhMYTdXNWdNWVln?=
 =?utf-8?B?WkI2SXQrVzMwc1UyTjhoN1lRSjR1dWU0MnRyVWFuV2s2UjBaN0t1K0FPbit4?=
 =?utf-8?B?WXphNVhDYTRPTmhsSEVEQ0NZM3dpRE1vekRjVVlKUmdCOE96UnNWeG1lOXpq?=
 =?utf-8?B?N1hYQnlxbjZOZkVBckJXdStHQlYvVWNBZ3dYUHU2dWh6UG5iWGJvWnJhTWRJ?=
 =?utf-8?B?RDNiYXBFdGU3TnFINm1BT3dGN2FEdHYreFZkdlZUZklSV0t0S2xkdmhYWHcz?=
 =?utf-8?B?WVh4TGE4NUFiME9TNHltcStKRHNkSG0wY0NuenBMajVhcnJUZVdvSWYyTEd5?=
 =?utf-8?B?bTYvV1NSVmVOUzBnK29wSFYyeEFzd3JLSVpPRmU0YzVuUDJLVzBGOGwwMndM?=
 =?utf-8?B?OThFWGloM3JpbmN3dVF6VTJYb2FDUGwyNnl4NDhKN0dHTk1JcmdlVC83UFBC?=
 =?utf-8?B?MGRId1VLVkNFdFZTYVRDd3QrVGJFcTJXMGpoVmJrQlhMU01lcWRtOFhBUXc0?=
 =?utf-8?B?a21VMjY2MS9MUG14NVR2VEJQMmx3cm9Kejd4VG9LMFZNSzltbmN6bmpCMFBa?=
 =?utf-8?B?ZWJQTG5DNDcrMlB5Sms3VWFXcG82TXh2bVZlL2VQOGwxbUFrZ3dsb3NMMWV1?=
 =?utf-8?B?dTlhbFY0UzJzaitXcTUrWFZWVmlOR0xaYXRvekhiNkUwMDQ3UmRKanZ0Z056?=
 =?utf-8?B?MmR2czBaR3FwTmUzbk1jZWZ5RG5HR0N2Z1FJODNIOGJ5Z21CdTJZbmNYVFZp?=
 =?utf-8?B?TkQzY2Z5L0lpUmxPSmJwaEI5Nlh3VTdPZDBFVzBZcXkydW8vS1QvUTJLZzl5?=
 =?utf-8?B?YTBzNjlSNDdmUjhXSWtoQ0NIM0hvUVBjYndENDVaMmxBTDJPOTRHVVJDajRU?=
 =?utf-8?B?bEpmT1Vmak1tZWxUMzAyemxxKzJnZG1ndDBodmF2eTNYRmpEODhtV2tYUkxI?=
 =?utf-8?B?WmNBUENOU2V4b1IvSm5sMmZJQ3gveDUwcHVUcVR1aklJZDBvOEoyNnNJVVdK?=
 =?utf-8?B?T1ZxeThGRnZPdDVNN2haZ0pGYlY3a2RQNjJrYXozVGNkZUl4dW04a09iRWQ3?=
 =?utf-8?B?Qkp5WGxvQk1WZGdtNnpYcHRiTzFBWFdZZ0lrYmNOd0JyUGhJcjZlSTVlQ1dP?=
 =?utf-8?B?OVJ6Mm9ubkZDV1BXdlRlUWZKK2hlSGRjTG5Gb3NXUmVVSFhGUGtQaW5XeVZa?=
 =?utf-8?B?dkJxdlFla1REY2tiZDVzT2VadGFEM1BLbmVKSjA3VlBFSHNGRW1SOHdFYjNt?=
 =?utf-8?B?Z0FndWs4UElWNVc5ZDBvelI1MGI1bzRNeWY0dGhrQnljejZHTzk0c1B0Wjly?=
 =?utf-8?B?U01sU0N2VDFvN3hYbXlncGdBTVViVi9pVzVidkZNdUhncG9DdG0yR0Zuc2o3?=
 =?utf-8?B?Y3NpTmg2L2RQbWdldWdVMUtpRjZxb2NGTmQ3ODhoek93Z0VYQ3lNdUU4bk93?=
 =?utf-8?B?QjlQYUxtdkFvdEhCcW5sMjZQZU83aURCUVIvaG41R2FZNFZRSjlCbFlJMkZu?=
 =?utf-8?B?ek85WW5JaU5Pby9hUFBMMkVBTUlRUENGbE04WkpEdDZnRXhYdlFITy9nOGF4?=
 =?utf-8?B?QXhBbnRYUklvbXhjb1V0eWdVVUdyL0p5TDEzN2x2SGlpZkYva21tQnY5L28x?=
 =?utf-8?B?dUFKQmlCbHFjNktRUGNISHZhS3RhSTBpQ3RlMUl6bFAyUlZWSHZIN3hGNDQ1?=
 =?utf-8?B?YlFSRXovZ2hVemNocVgvVlM0K2tyWHhFWG9wWnFXa0o3QlBCUkgzcWxnZXNw?=
 =?utf-8?B?UzhqQVV1S0lMa2lydk9PYXF4WmJNVVM4bmU1NlVCdW5yZlRLa09Bb0x4c3Rh?=
 =?utf-8?B?LzZTUU82czJTeVBuYW5BaWk1VC9yOUU4ZTNtU0l3bHhLT2Nhd2VIOGIzdE9j?=
 =?utf-8?B?eklqbE1hdHU1YVZkVmsrRUZDcnNLU1F3ZWR0S255NGlsMVYrWWR4b1FTMUNW?=
 =?utf-8?B?dExkSVdheWZ2WU1uZGRKMHdvYzhlTERlZXo1YnpWbG10bGdXTUxUZUxpQjVN?=
 =?utf-8?B?dU9XWnhPR0gvTXc2Z0dzakF4RXpCRU8rRW13SWlvbjY5eHVRbzlxYk1kZnNQ?=
 =?utf-8?B?elZBT0R0aHU1dTJjV0trZlgvYVZ5dFY0T2U5blM1SFJqeTBUS2xXUGZCaWtx?=
 =?utf-8?B?V2FZR0w5Z0MrR2Nvd3prK2o2VmhYU2QzQTFkNEFJRG5nSWFBNFhHbysyVTRZ?=
 =?utf-8?Q?R/uzUPF3JbftgDI0=3D?=
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
X-Exchange-RoutingPolicyChecked: n/Wc4G1CDg3Ilba3lN/pk0r3i9VOdOG2Ov7+IrSP41rsFA3UGmUEASIhZrGLf2SaDP5kLvCpyin8Yu7Cg+N8FKr+9g37RfEt7MSVOh9OLNNC7VFV63j8skeL/YKaQXTAhLbCtpyn4Xxl0ZiRfQAGtC7uhsbMS81G/FHvNlAo3nF54UME678u9JOHhkKj7M1w6N1Q9aRv5AyTTBRjyPcqS2V2gHsf8tjsydnMc/kjDia20JQkCxngP32COc1TQ46jsXOkdOh9+4ju+QcSDUox3+GXm0JFe7hn4zv7qIfWUTw52hSAk7YXoi03/+9u040j5TIP2QvZBlTEQbDVu95xgA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB131308.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977d6300-4f59-4056-9a76-08df47043a39
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 12:45:59.1639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ubdnJVrygTKK1o83VA7u6X2jmKKJcqh4hArpQoic3noOyf9aHJHWPTuASEDc814EGSkOY1uuysb7NM6iJuEhCl0lLRbRCaGo8WHa7k4oWpnB91eZLxFDVwyVmbMs/nZA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9540
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMjAgTm92ZW1iZXIgMjAy
NiAxNzo1Mw0KPiBUbzogVGFuZ3VkdSwgVGlsYWsgVGlydW1hbGVzaCA8dGlsYWsudGlydW1hbGVz
aC50YW5ndWR1QGludGVsLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzRdIGRybS94ZTogQWRkIGhhc19zZW02NCBiaXQgdG8g
Z3JhcGhpY3MvbWVkaWEgSVANCj4gZGVzY3JpcHRvcnMNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91
ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3Vl
IHRvDQo+IGNvbnNpZGVyOg0KPiAtIFtNZWRpdW1dIGRybS94ZTogbWlzc2luZyBoYXNfc2VtNjQg
aW4gZ3JhcGhpY3NfeGUzcF94cGMgZGlzYWJsZXMgc2VtNjQNCj4gICBvbiAzNS4xMS8zNS4wMw0K
PiAtLQ0KPiANCj4gY29tbWl0IGEzYjI4MTgzM2I2N2M1YTZjZTFhY2RiNGZlMTAwNWQyZGVhMGRh
ZGQNCj4gQXV0aG9yOiBUYW5ndWR1IFRpbGFrIFRpcnVtYWxlc2ggPHRpbGFrLnRpcnVtYWxlc2gu
dGFuZ3VkdUBpbnRlbC5jb20+DQo+IA0KPiBkcm0veGU6IEFkZCBoYXNfc2VtNjQgYml0IHRvIGdy
YXBoaWNzL21lZGlhIElQIGRlc2NyaXB0b3JzDQo+IA0KPiBUaGlzIGNvbW1pdCBhZGRzIGEgaGFz
X3NlbTY0IGNhcGFiaWxpdHkgZmxhZyB0byB0aGUgZ3JhcGhpY3MgYW5kIG1lZGlhIElQDQo+IGRl
c2NyaXB0b3JzIGZvciBYZTNwIHBsYXRmb3JtcyBhbmQgcmVzb2x2ZXMgZ3QtPmluZm8uaGFzX3Nl
bTY0IGR1cmluZyBHVA0KPiBpbml0aWFsaXphdGlvbiwgY2xlYXJpbmcgaXQgb24gYm90aCBHVHMg
aWYgdGhlIHByaW1hcnkgYW5kIG1lZGlhIEdUcyBkaXNhZ3JlZS4NCj4gDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
Y2kuYw0KPiA+IGluZGV4IDNiZDY4ZWQ5ZGFhODEuLmE3Y2ViNTcwZDg5YWYgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3BjaS5jDQo+ID4gQEAgLTEyNyw2ICsxMjcsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHhlX2dyYXBoaWNzX2Rlc2MNCj4gZ3JhcGhpY3NfeGUzcF9scGcgPSB7DQo+ID4gIAkubXVs
dGlfcXVldWVfZW5naW5lX2NsYXNzX21hc2sgPSBCSVQoWEVfRU5HSU5FX0NMQVNTX0NPUFkpIHwN
Cj4gQklUKFhFX0VOR0lORV9DTEFTU19DT01QVVRFKSwNCj4gPiAgCS5udW1fZ2VvbWV0cnlfeGVj
b3JlX2Z1c2VfcmVncyA9IDMsDQo+ID4gIAkubnVtX2NvbXB1dGVfeGVjb3JlX2Z1c2VfcmVncyA9
IDMsDQo+ID4gKwkuaGFzX3NlbTY0ID0gMSwNCj4gPiAgfTsNCj4gPg0KPiA+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IHhlX2dyYXBoaWNzX2Rlc2MgZ3JhcGhpY3NfeGUzcF94cGMgPSB7IEBAIC0xNTMs
MTENCj4gPiArMTU0LDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfbWVkaWFfZGVzYyBtZWRp
YV94ZWxwbXAgPSB7DQo+ID4gIAkuaHdfZW5naW5lX21hc2sgPQ0KPiA+ICAJCUdFTk1BU0soWEVf
SFdfRU5HSU5FX1ZDUzcsIFhFX0hXX0VOR0lORV9WQ1MwKSB8DQo+ID4gIAkJR0VOTUFTSyhYRV9I
V19FTkdJTkVfVkVDUzMsIFhFX0hXX0VOR0lORV9WRUNTMCkNCj4gfA0KPiA+IC0JCUJJVChYRV9I
V19FTkdJTkVfR1NDQ1MwKQ0KPiA+ICsJCUJJVChYRV9IV19FTkdJTkVfR1NDQ1MwKSwNCj4gPiAr
fTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfbWVkaWFfZGVzYyBtZWRpYV94
ZTNwX2xwbSA9IHsNCj4gPiArCS5od19lbmdpbmVfbWFzayA9DQo+ID4gKwkJR0VOTUFTSyhYRV9I
V19FTkdJTkVfVkNTNywgWEVfSFdfRU5HSU5FX1ZDUzApIHwNCj4gPiArCQlHRU5NQVNLKFhFX0hX
X0VOR0lORV9WRUNTMywgWEVfSFdfRU5HSU5FX1ZFQ1MwKQ0KPiB8DQo+ID4gKwkJQklUKFhFX0hX
X0VOR0lORV9HU0NDUzApLA0KPiA+ICsJLmhhc19zZW02NCA9IDEsDQo+ID4gIH07DQo+ID4NCj4g
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9tZWRpYV9kZXNjIG1lZGlhX3hlM3BfaHBtID0gew0K
PiA+ICAJLmhhc191bmNvcnJlY3RhYmxlX2Vycm9yX3JlcG9ydGluZyA9IDEsDQo+ID4gKwkuaGFz
X3NlbTY0ID0gMSwNCj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBTaG91bGQgZ3JhcGhpY3Nf
eGUzcF94cGMgKEdyYXBoaWNzIElQIDM1LjExKSBhbHNvIHNldCAuaGFzX3NlbTY0ID0gMT8NCj4g
DQo+IEluIGFsbG9jX3ByaW1hcnlfZ3QoKSwgdGhlIHN0ZXBwaW5nIGNoZWNrIGlzIHNjb3BlZCB0
bw0KPiBHUkFQSElDU19WRVJ4MTAwKHhlKSA9PSAzNTEwLCBtYXRjaGluZyBNRURJQV9WRVJ4MTAw
KHhlKSA9PSAzNTAwIGluDQo+IGFsbG9jX21lZGlhX2d0KCkuICBCZWNhdXNlIGdyYXBoaWNzX3hl
M3BfeHBjIG9taXRzIC5oYXNfc2VtNjQgPSAxLA0KWWVzIHRoaXMgaXMgaW50ZW50aW9uYWxseSBv
bWl0dGVkIGFzIGdyYXBoaWNzX3hlM3BfeHBjIGRvIG5vdCBzdXBwb3J0IGl0DQo+IHRpbGUtPnBy
aW1hcnlfZ3QtPmluZm8uaGFzX3NlbTY0IGlzIGFsd2F5cyBmYWxzZSBvbiBHcmFwaGljcyBJUCAz
NS4xMSwNCj4gdGlsZS0+YW5kDQo+IHRoZSBjcm9zcy1HVCBjaGVjayBpbiB4ZV9pbmZvX2luaXQo
KSB0aGVuIGNsZWFycw0KPiB0aWxlLT5tZWRpYV9ndC0+aW5mby5oYXNfc2VtNjQgYmFjayB0byBm
YWxzZSBvbiB0aGUgcGFpcmVkIE1lZGlhIElQDQo+IHRpbGUtPjM1LjAzDQo+IChtZWRpYV94ZTNw
X2hwbSkgR1QgYXMgd2VsbC4NCj4gDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEyMDEyMDIzMS43NDgyNjctDQo+IDEtdGls
YWsudGlydW1hbGVzaC50YW5ndWR1QGludGVsLmNvbT9wYXJ0PTENCg==
