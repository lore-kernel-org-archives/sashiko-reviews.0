Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795758178;
	b=aGuDE8m3LKK1HJzbnYemPRCs/Mh0qHN1xiNpDh1B94IeWiKQsm6QujQU63zoq38lLImX
	 ykM1nVpikt45SyZ2kByahJxFseq8a4KsjAL6IfNHEzHzbmDMxBOGLGYUnHySbfsqJsUV4
	 ZCV1rNc9IszBXYra9Yv3Uqt6MsGFDbdlVf4t2k9x+nrWgFYF1kzjugQsrGP/65PnTP/eO
	 lVq0cQkEVZckw/OPVW18LDMp5WykyNFNHUkItsJw3hGYwjM8nRTFeLoH7AIPVNsazyYNC
	 ZiTWjF0+DWgFJ5Kj0KaDARKF/MUPS9hCnjha+nG2g9Xj9a/XaWxsAy+mfBLz6ZEC1WA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758178;
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
	bh=rNbrYxScDx3VmXYz49+OhnjqDyakOBu4ezjjfP8w6Lk=;
	b=OPfyKVHWUt7NvheemSljJvRM5REM1xxDHik+5aTz5JW4cfIdTxytApuX1/ZAknE0N1Lb
	 hSOUewQmFfYqZquKkA1K39OBpi1lD/67ZoBYEKAS5RsazkAv7htNtSYVCffAe7xNk+4Bq
	 T8bJrygyxLI7nAvF3C2sib3Enbf3ypHS2aj4ilIhJU8VIq7G1Xxg8rVbw9EQVITjiKb/Y
	 uyk7XF2ABYcQwgx0S0Zz5oPGa32BWrQLbm/S2BJnoAR0THTRtk16kvUBU6YvsfbAZGOlh
	 QtSSx0fq8ufSnk+rnjgZI1CckmCPAJVNzBDrf76y03bRGM/CCn1AaQTossmS/Xm+/AA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WoxCs45C;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ea0KVIH0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150CB606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 05:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 150CB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WoxCs45C;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ea0KVIH0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795758177; x=1827294177;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=rNbrYxScDx3VmXYz49+OhnjqDyakOBu4ezjjfP8w6Lk=;
  b=WoxCs45CvtJQOXgRWSjQAuTbHkgFtWbNcrd0vAkdNQZf8TLfOei8VzCY
   XpPnzvEi/ABqRqpbkOwIbkGYPqeVKnx9xmvUjCUAxo1eVj8XiaK97DtjZ
   WhsnOugs1SedZsDc/LpbWGQ43uFYNxMSNXwE5gEc0aJw+hKWe+7XkdC6E
   yFMxELe2ehLnFu0bYQ7zzho9ZTr3a37HL/AEnGv1df7DdbZ9Vbv2y4wC/
   lSmL1X7GYgf/O6MBr9dQmbTeMzQp11yDufCTOTXfwiYFBCRLZVrc5so7J
   EPCrIKKnueYW5mZE84gPXCv1vK3ANeX+u0zH3saYIM6djdFF49Ftt6ngy
   w==;
X-CSE-ConnectionGUID: zD/wKwk4Si67X4uyr3IMUA==
X-CSE-MsgGUID: EF9jy7ViQqqzsPCMPg2IVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4574287"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4574287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 21:42:57 -0800
X-CSE-ConnectionGUID: NZuUmu/HSLSFqp9lCwEb5w==
X-CSE-MsgGUID: zBQNIFYcQkqFYqbHpE45jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12173905"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 21:42:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:42:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 21:42:56 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:42:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5aJPnpJ3ELknNouATGW2xHMz4Q7sKunKjMSf3mzw2m/GmmG93fEdzEL8fqoWXpkLEJ1cluHRvL1DBQmjmMAODpvxqBFxTGj549uqj1EYNdO9d+lVW+UM7/SH3GEUbnEy+cZYRTEyu9cwEnWsnFGi4yf4+F8eEktyJhlvO8uLNjYtVDPC2XrHdjvxKat/EUPpBlUf0q36433SEI6ZPDsv+fYGazRa8hiaIroi02JNV3cIp4TQCQOA0WiS2toFavsawbbNU2jqI4W+3xHoF++myhG4KzbRiMa2Zu3dbJxBkPsDFuvh6VeM1ckwDtuJZOx5O5Oho1P86sLoYU1yEdTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNbrYxScDx3VmXYz49+OhnjqDyakOBu4ezjjfP8w6Lk=;
 b=sJ03rVwjXaCC71SV58gUSzC7NQR65ElgQGiqS3YiG38ybDP66n2RQOWgY/X4zdatkUWPtv6ybd4hDJvI8Ff2ZWtAep2x3qBeLI7A4wtusWdg3v8F5SBH6V08wrXApjrGH+egJJtoap+8ltPvfQHEzxz+gyFARiFWCCuEXIYtAX5iIMRsRUH0iSvjcMMN+YzjZdg5hdgf0sR8ZGg5xV7BdF/SxBySzo5XZkjeeDXh80FrnxUT12cwv0BSArvpzCbeYMiRh83j93lkH0PYHsnWLW3KFJoOpy4bUulXhIbK4uiBJCw4EOZ3hcMhxyj4H9eMvfZjOsunMC2ysWbkYfAv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNbrYxScDx3VmXYz49+OhnjqDyakOBu4ezjjfP8w6Lk=;
 b=Ea0KVIH06VSLM1Z2dpZ/svvDKevWrOwFUQBvESAn9atKFV6G5Tp8oHY6shGzSucsMmZlk/Vhr4p9qXUXwQIay14/n23ZHQ/YfZuDrPPpI4/ltDbzuYOImO2wj30iDDWbRn73nOT75eI6veYGrbSVBgZFBeXmnSnQu3+ZXMvN8j4=
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA1PR11MB9825.namprd11.prod.outlook.com
 (2603:10b6:806:4d7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 05:42:54 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 05:42:53 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 14/15] drm/i915/display: Use pipelock on PTL
Thread-Topic: [PATCH 14/15] drm/i915/display: Use pipelock on PTL
Thread-Index: AQHdfXBgkXbpvPHLh0O7eyeuQQJGsrc/6xGAgAF+Q3A=
Date: Fri, 27 Nov 2026 05:42:53 +0000
Message-ID: <DS4PPFE901A304FDF557F173F17D010220FE3412@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
 <20261126063459.863698-15-suraj.kandpal@intel.com>
 <sashiko-outbox-234916@kernel.org>
In-Reply-To: <sashiko-outbox-234916@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA1PR11MB9825:EE_
x-ms-office365-filtering-correlation-id: 31e6f172-07a0-4d5b-2b5c-08df4c494803
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|261009223027099003|18002099003|22082099003|261022075727099003|56012099006|10067099003|11063799006|4143699003|261102123227099003|261028144727099003|38070700021|261021121427099003|261026121527099003|261022105027099003|261026140227099003;
x-microsoft-antispam-message-info: 6ZSTyyVaWSIvpwhP+R5CbYhSau8V9CKtLBHoeI6W1ASQLHmyJa0x3uM8WGVUd4fdN2YEAtqTalDuDzHluqWR9eXLLApVfiPitE455apQ8uzra0ujtBd48hpC7Pu/XKacPZNIrozF/xsbqKcUW/RTVl5azzL24FrKztOyDKyKil3kavTs/og1rRy8SnwaWFHnAjXskZoLP7KMuUYWY54pEDY7TbYDHBZjJkgk7FquccPrQXF3YePNPWMAQJQqIBkUHuUFzP3zJEd/RfnLruFmHTaN9CCOROlnwFCpBI1YHJN/XOr0M1VRizsxxKJbS+epaP2eYzxWMMpCeaBuYj9Yu2nbdSwBY5aqmgOFcqLfsDpCt6OqJb4Pipfq6Lg+GzJh0GlzV7Vj01BYFGwgdmqtqDA0q/Z9oW52avGR1EIFRdxP70XFsY5gDJykRGXoSw9HK/pfKGbhdaZZM1q07hEHpJNymwmy1ucdwIp75wqtX9hGikbnlYbkTjIuxJ95P/3IVzNTBGtFAQTxTBmiF2IRvH2KW7YbSH59FcusmVsOy895E/NnWAgYYYif3Cilv8TbGxafFGienREK+YWgQSWqCkXwDz0kzv2kIYN3XPJd41BEx/ofaBy23dBDEeMc3+LDoS8O62ynY+gPSEe+9c5OqN4ZM9pMSwOV5ViD2Telszs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFE901A304F.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(261009223027099003)(18002099003)(22082099003)(261022075727099003)(56012099006)(10067099003)(11063799006)(4143699003)(261102123227099003)(261028144727099003)(38070700021)(261021121427099003)(261026121527099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkJURUFIT1RpTGFVbEZmV0ZoTVBTeXFodlFVd2hvaWFGTTA2d3EzMlN4WGll?=
 =?utf-8?B?a21ZOS80dVg2M3V4eUU1NmlWNkx0ZTlRQ3VwbjdtWmdUNWxOQ05nNS9NSTFH?=
 =?utf-8?B?c0VnajV2M0ppNmp4SGZVVFI1NmNrYTRBWmNUcUFXQXBWTWQ5R2JnRHJFbjdx?=
 =?utf-8?B?U0d3NVdtZHdPTEs5NnZBR25ENURkTTdIcEdnTXVHSzhGYmZmcHR6ZlFjMUZk?=
 =?utf-8?B?U05USmhCb3kzNHFWTVJPazFEWnVjSktIZXhEWDNhV3pKQnlvN25wMk53R3JZ?=
 =?utf-8?B?KzNINXorb3pBazRzbkgwcVpWZ1UvaEFkREI4ZzM3UG1lRk9LYk5IcUxVaFJr?=
 =?utf-8?B?N2Z2SGdzcm11eUM4Zm4yOExuVEtSQmk4dTBSTFhEU0htUW8xaC9jbVZya0Jh?=
 =?utf-8?B?N00vTzlFQnBkMFNiL0FiL0JNaDNialJwWWVWNFJUZk1jbGc0OGQyMVpMQ05O?=
 =?utf-8?B?SWFHd3FKdktQLytkS1hieXRiY3BVaFVtaDQ1ZlFVVXhHc0lPcWpScXUyU05h?=
 =?utf-8?B?clZWVXhaWnNTWllYRHVOS0FhZitVeE5vRzJkaDlIWndMQTBUejdMbjdmcmVo?=
 =?utf-8?B?MElpWnREOG92R3N4Ti9qMGVGYzJSc09vVkhxN1kwNHM0ajhTaW40TUhTa01U?=
 =?utf-8?B?UWR4ZXNCY1d3dU8wTEhiY1M1cEtRQUZxZytBQnpCc0dPbStpQ2pic0dqTWEx?=
 =?utf-8?B?SFROT2V1SERFY0dDSUFiMmUxMXdZbHJWWEJaUjdIRWJEemlmSHJHenVVaktn?=
 =?utf-8?B?Y2N5THAxeG0zNUxWaHVIdXI1SXBEcU9MajhNOEhLaDkvNTZxOXAveUJEaEVL?=
 =?utf-8?B?eDlnSm5PMVRSdmVkTkVqNmQvZkVBamFqKzYyekRzUWx0VXpZNDBiREMvKy85?=
 =?utf-8?B?ZGYwRlM0bUhsVlpkQ3VrNDJRZFpUTGtTSEtFYjlUZHBrejNscEw3cjlMa2ZM?=
 =?utf-8?B?UUdWWlJENVVLazlocTEyeUdrQ3ZsOHZ6dUJhZVdaTUhBNVd6aFJpTml0bE1G?=
 =?utf-8?B?bjRhTlJ5SnhvSy91eDFtZVJCRWl4ZW1NSEFKR0RPcnQzSVZFZzNKUENpaVJo?=
 =?utf-8?B?ajd2ZFdhQXpaYzMrZVJzTkdtNGpHSEhjck1yN3dWTUVUR3pGM1BWM0RYSjFC?=
 =?utf-8?B?VGthbnRvMDJ6UVRLUUNYYkRJQlZ3TE93KzdEbG54eWUrZ3NnN3k0eldoVkZO?=
 =?utf-8?B?YVpFOXF3SGlVTTU0YUVLb0lPaGpNeERlMmxINjZNSWRacUV6ZUlXRHIvYjBJ?=
 =?utf-8?B?MFBlZUZtN1ZFWndZUDFBR2N1eCswQUdYREZoaG1odkFPYmdTSDNQOG9OTmhF?=
 =?utf-8?B?UEpKMktMVWdnUjd4b3NYOWo1WGU5RzM1THpOSVd2N1ZKd1JjMGZEVzZQc0pG?=
 =?utf-8?B?Ylc2YUNTUzJWYlMvL2l0SiswS1lOZnBKSmJTS3p5elNGTjk1OHBiYVkrRkhE?=
 =?utf-8?B?NndJaTNFSWRJZmxadFROQjUrc05jYnJPTHBhSnIrREV3S2p0Q2xiZUJFbGpB?=
 =?utf-8?B?QXN1OWpuV1NkeTBORGNEQmluQ0dmZ2RVbTZ0NGVkeFhuN3IrOE1nczdQbXFM?=
 =?utf-8?B?dU5HemVKTE1PWmlNUWR1eTBJdjFCSEwza2IvRG1vQWZ2eEsxakJoMVV1L2JP?=
 =?utf-8?B?enRLKzBkdkhXVDVyTUJsWm15RDVaVVpsS0tzTXZYWEFCNzQzalpmb1BJYzNu?=
 =?utf-8?B?SXUwdnJkekN5dFdFUHpBbjR6U1lnQXluaCtieGpVdTZWMDR0ZmJnMk1aY3JU?=
 =?utf-8?B?QkpMU3ZhY2J2eEY1endVdXFvTzBXaHduSkVtdndsQWpPM29zQlNWZFBWV2Nq?=
 =?utf-8?B?Nkl3TW1uSTFMMWtaZnVVbGlqU05Bb0dGWm8vdXd6TThqRXhiYUpkTk5nTmhl?=
 =?utf-8?B?STE2aUE3WXNGcGNMUVY5NWF0bTQrZjF0a3FsbTJVc1lpV2F5eDNOYkJOY05E?=
 =?utf-8?B?VERSZ0VZVkVWcXN3V0hTY2psRnM4YmU5RHZuTmlYWDdWdHl2eXViZWl1SFFS?=
 =?utf-8?B?ZDJnblpaSXI5N1FRbmpBcU9MbWd3NlZIZnFMeHJMT05QY2RoMDAzeDE0TEpB?=
 =?utf-8?B?OExsR1lxeXdjZnF1OWU0azgyTFlRMTZDMVRib2tqUldPL2JKdU5PQUdBeTFp?=
 =?utf-8?B?SzdBZ2RWcTI2NUJXeDhraHlvbGRSTnVqL2ROTWlNL3d4THlKQjZIQ3JnNFhG?=
 =?utf-8?B?dHBrZTlQcnhDK29SYjUzbWdOWnZRU1Y3WjBsMVpOT3EyK05FWFR3OHo2Tm9D?=
 =?utf-8?B?WW16MUxyaHRpUVR6Nmt2UFBOWG4yQTgxMi9qdFJXSXJ6b2ZTRjZSMmJTQ1dC?=
 =?utf-8?B?UkZPRXlWeUtkdTNWQjhBMEQ2TlpPMzA4UG90cEZuaTc0SDdLV3hmQT09?=
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
X-Exchange-RoutingPolicyChecked: SJWtgZy9Ap9hUG7Q3bir7D8GtKxS6hEl/f15/GofPAsZURHsvPh3JgcBJEveCCDkyUjhzxN2Bd6vbU5R2H2gCnzD36y7HZLD96wSlqRjFn8vYcB+HKgaLMGZFV2KPQsYYzV0JTTkV4HqGCRSnaYh5sS/nCJNF9kPNyjTGePCNtLorZCnBIZUb9NIXMZ5ty2sYA6oO32ztQLVS5y5xto+bMcMXueXZTn5nl7oxGMSCrIB3sPtff0f6OYoSxWfPN35+dpqCrtJ0AifwJkmFXUoqPa4fbdZnMsX7xY7veBNzvSv0nf5wXAopHBM23CaEKstZccZQo5tBCBPcAhfpLxaEQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e6f172-07a0-4d5b-2b5c-08df4c494803
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 05:42:53.3790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q4gF9AzzurfXQzCE2cbq/l1QiSF2I5fJwapsKj3eAuhklLoz2P/rJzTFF7VxSbuGaFH1oL8EOSYvoNMmDuAqnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9825
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMjYgTm92ZW1iZXIgMjAy
NiAxMjoyNA0KPiBUbzogS2FuZHBhbCwgU3VyYWogPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPjsg
aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gaW50ZWwteGVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMTQvMTVdIGRybS9pOTE1L2Rpc3BsYXk6
IFVzZSBwaXBlbG9jayBvbiBQVEwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRp
b24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlIHRvDQo+IGNvbnNp
ZGVyOg0KPiAtIFtIaWdoXSBkcm0vaTkxNS9jeDA6IE5VTEwgZGVyZWZlcmVuY2UgaW4gaW50ZWxf
Y3gwcGxsX3VwZGF0ZV9zc2MoKSBvbg0KPiAgIEhETUktb25seSBwb3J0cw0KPiAtLQ0KPiANCj4g
Y29tbWl0IGE5ZGRjNDVjOTEwZDRlMTUxYjU5YzlkZmFjMjlkMjU4MGZjMThiY2UNCj4gQXV0aG9y
OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCj4gDQo+IGRybS9pOTE1
L2Rpc3BsYXk6IFVzZSBwaXBlbG9jayBvbiBQVEwNCj4gDQo+IFRoaXMgY29tbWl0IGVuYWJsZXMg
cGlwZWxvY2sgb24gZGlzcGxheSB2ZXJzaW9uIDMwIChQVEwpIGFuZCBkaXNhYmxlcyBTU0MgaW4g
dGhlDQo+IENYMCBQTEwgc3RhdGUgZm9yIGNvbm5lY3RvcnMgd2hlcmUgcGlwZWxvY2sgaXMgcG9z
c2libGUuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2N4MF9waHkuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9jeDBfcGh5LmMNCj4gPiBpbmRleCBkMTNiYjNiMjc1MGE4Li4zMTMyNGFjNDY5NjU1IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3gwX3BoeS5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jeDBfcGh5LmMN
Cj4gWyAuLi4gXQ0KPiA+IEBAIC0xOTkyLDYgKzE5OTMsMTAgQEAgc3RhdGljIHZvaWQgaW50ZWxf
Y3gwcGxsX3VwZGF0ZV9zc2Moc3RydWN0DQo+IGludGVsX2VuY29kZXIgKmVuY29kZXIsDQo+ID4g
IAlpZiAoaXNfZHApIHsNCj4gPiAgCQlpZiAoaW50ZWxfcGFuZWxfdXNlX3NzYyhkaXNwbGF5KSkg
ew0KPiA+ICAJCQlzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwID0gZW5jX3RvX2ludGVsX2RwKGVu
Y29kZXIpOw0KPiA+ICsNCj4gPiArCQkJaWYgKGludGVsX3BpcGVsb2NrX2Nvbm5lY3Rvcl9wb3Nz
aWJsZShpbnRlbF9kcC0NCj4gPmF0dGFjaGVkX2Nvbm5lY3RvcikpDQo+ID4gKwkJCQlyZXR1cm47
DQo+ID4gKw0KPiA+ICAJCQlwbGxfc3RhdGUtPnNzY19lbmFibGVkID0NCj4gPiAgCQkJCShpbnRl
bF9kcC0+ZHBjZFtEUF9NQVhfRE9XTlNQUkVBRF0gJg0KPiBEUF9NQVhfRE9XTlNQUkVBRF8wXzUp
Ow0KPiA+ICAJCX0NCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gQ2FuIGludGVsX2RwLT5hdHRh
Y2hlZF9jb25uZWN0b3IgYmUgTlVMTCBoZXJlLCBjYXVzaW5nIGEgTlVMTCBwb2ludGVyDQo+IGRl
cmVmZXJlbmNlIGluIGludGVsX3BpcGVsb2NrX2Nvbm5lY3Rvcl9wb3NzaWJsZSgpPw0KPiANCj4g
Rm9yIGFuIEhETUktb25seSBEREkgcG9ydCAoaW5pdF9kcCA9PSBmYWxzZSBpbiBpbnRlbF9kZGlf
aW5pdCgpKSwgZGlnX3BvcnQtDQo+ID5kcC5hdHRhY2hlZF9jb25uZWN0b3IgaXMgbGVmdCBOVUxM
LiAgT24gZGlzcGxheSB2ZXJzaW9uIDMwLA0KPiBpbnRlbF9jeDBfcGxsX3Bvd2VyX3NhdmVfd2Eo
KSBydW5zIGR1cmluZyBwcm9iZSwgcmVzdW1lLCBhbmQgcmVzZXQgb24gZXZlcnkNCj4gZGlzYWJs
ZWQgQzEwIFBIWSBkaWdpdGFsIHBvcnQgd2l0aG91dCBjaGVja2luZyBpZiB0aGUgcG9ydCBpbml0
aWFsaXplZCBEUCwgYW5kIGNhbGxzDQo+IGludGVsX2MxMHBsbF9jYWxjX3N0YXRlX2Zyb21fdGFi
bGUoLi4uLCBpc19kcCA9IHRydWUpIC0+IGludGVsX2N4MHBsbF91cGRhdGVfc3NjKCkuDQo+IGlu
dGVsX3BpcGVsb2NrX2Nvbm5lY3Rvcl9wb3NzaWJsZSgpIHRoZW4gdW5jb25kaXRpb25hbGx5IGRl
cmVmZXJlbmNlcw0KPiBjb25uZWN0b3IgdmlhIHRvX2ludGVsX2Rpc3BsYXkoY29ubmVjdG9yKSBh
bmQNCj4gY29ubmVjdG9yLT5iYXNlLmhhc190aWxlLg0KDQpXaWxsIGZpeC4NCg0KUmVnYXJkcywN
ClN1cmFqIEthbmRwYWwNCg0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTI2MDYzNDU5Ljg2MzY5OC0NCj4gMS1zdXJh
ai5rYW5kcGFsQGludGVsLmNvbT9wYXJ0PTE0DQo=
