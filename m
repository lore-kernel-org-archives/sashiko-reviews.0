Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847170;
	b=P2ZrY1O3REYQjEronVrWyZ1GYeFroU6ERDBJIzxccUIXCkNe4IE0zP2aGGvqk+PFxGXx
	 X4wzLmPdS910t8LQL9sswUe9ZiTl16w05+kcM8+ml8aCLtW/E6TPp24EsWH8Gj16M8wws
	 k+5uNrjCprbYXcL0OZPuUm1iNPW85n2fPJEZT+ZrDK9/SAJJem9SBOhX4V6351fydP228
	 KBmLuiTU5tnQ/ICcZ7CK+iHqJZvoD3ItD7l9SIszepebsbLcON+034SGTy1HpMd4EuM4f
	 F2i0yJgyDFbDNnuHpHEvPV6YKJ1qC0WcxRW5EG+f0LouI0bDeLC2SGUEMRl94A9YK6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847170;
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
	bh=Q5vav93W6fU1OuYzSEUWoeT/PI9J06KO6mbhGzfn3aA=;
	b=Uc2P+CTWQLM+0p/3A4LTUaBhdjoMfrkUsKQDD9YDpFKlkEMEAe1KLr9yUl5HRftyrYwg
	 Zm5BKaw0fUu7zuE8rfjly2BTy2/HtR6vgD2+f3v2v6zhoCeT32hbUnDuqF3rhJ/oVtyx2
	 Rp7Qm3l0NILRpWrx8RI2IS7FBcObkGF/rFE6Cp+43C4C+HSMuG/dnXDHuNNqkY7d3TNs8
	 n7t8x21EgYLMNWrUNN/lowHpG7H8B9x+tM5obi6wHGJrOL6CEOSLcZcnbwKFdLP8Ua5+S
	 2yRkwErjyzYhwkx/XTYAtq5BjJVz56kag5HDRePWNNwaZYFzhaOlLnlRTBZ/9S01TMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mNN8BYBL;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=eaiHgNOs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B6A606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 16:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82B6A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mNN8BYBL;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=eaiHgNOs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794847169; x=1826383169;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Q5vav93W6fU1OuYzSEUWoeT/PI9J06KO6mbhGzfn3aA=;
  b=mNN8BYBLm13rf8GY7zfxrPE0lZxkf+7tbEEoJP8wY+KCdSYTbTG1XLhR
   Gty1FCmSDSXTBiPU2CDyYOxSUXjunzVfNFy+5lN41YABeqEkMAecVsk65
   pF03jSdXx+WQFkvttVjKytcibTrlH11EuM03T+cu31qct/ws1KVNOT0OZ
   8REuX/v/4E9NTzSPfw5OBeigDSXFZZEkqpso8PrrGnGImVWwE0hCMLNZB
   Fl/lYVjrgDZMv8c2ePGI4qxOapl39ZU2dtFmwI38gAgKVoKRfIGyn/R9p
   J3URC9XE5pUxMey/NvuPBbZaKZXXikOcAXaI2A53S0Y/bjCxuYqy1Snma
   A==;
X-CSE-ConnectionGUID: Z3GXH4CCRo+p77mC++bPnA==
X-CSE-MsgGUID: dsqNV9zSTvu/2HoJeoMCWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3599767"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3599767"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 08:39:29 -0800
X-CSE-ConnectionGUID: R2F+QNfYQBuNqLMZQFzhsQ==
X-CSE-MsgGUID: RtT6In32S+iIMrAuxO92+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="10123462"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 08:39:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 08:39:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 08:39:28 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 08:39:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvWwLEfjbHFgx1hWwZNZkKoiKLE7vXg6+tcEO7Eu+BLeg1RvO2TomjpIwU2RTYuFksHlu9BnLiF1TwXbDOET6CRinM7983qyuopFe3vbb1h7cLY5ej3/LgsvTmNLkFb8e7J406mNfnseRgG+9nwFlKyngOECNCbFFYcNNjWM3jSHU7c9QWhciPbbwUcOWLB+7KMR1GZMkjrLcUNglYFcYOOqq5kTzHC81+erjApVIAr3vbmgwzBsJk+oywuHrLa1bZMgPq3ZoqOBUu9KVc5enksvNxYv5TQW5eIwlqSclcwvGo2+mo+LQwbIbbRRyTQPCjc9HlH57oRcOQsnDpIrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5vav93W6fU1OuYzSEUWoeT/PI9J06KO6mbhGzfn3aA=;
 b=elp0DDICwdlXYLA+rCPgDGe1imJApuYo22DSJpsbd1wOoCrgNDlW8WTK0bdjJchDIi0ivljm+tZ/BTQJQ14ekeeGm5JiX+gXOo4OQWoghVyTKv2UE3N8zkyNOEqhDzYSZJNnNIGxYzrUTGLqeePy2gui8NwTYrCIhgSgLgZC6CPR/ou/6sq0r0a+HLcblcSaBqgx8Aacv2Zrqqedqf8yzLEIsuh8HJQMdqq9szZH1uaogSUDkmdkZr9+CK0JshcrL4hRmPiGMuxJxwVx2mtVDNl79sLjJ+7ZYmBrb1RZo+YNkEFAh3cjHNXFfnIbYbhfVF7RGgPg94qzKqGMjU/pRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5vav93W6fU1OuYzSEUWoeT/PI9J06KO6mbhGzfn3aA=;
 b=eaiHgNOsmyWM2nwfIkr8c8vHJAH/eA0vNOLT3ZvYUdWENNasDxXyfNr01CjPNqb85JdxXb74PpwRCu0QMGM2NqFsnyZk3+I1Zk0fLqn5FbotXwqvjIs+RO/OMewzIUA6h2STb07kM0ZMCu8CdYBMi5MhtUbJwZI7C7Att22hpsQ=
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 16:39:26 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 16:39:26 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v16 14/17] drm/xe/vsec: Add PMT GUID internal access
Thread-Topic: [PATCH v16 14/17] drm/xe/vsec: Add PMT GUID internal access
Thread-Index: AQHdddxEcDouOEa+xEO/J2SiDLRYaLcw00wAgAAR/iA=
Date: Mon, 16 Nov 2026 16:39:26 +0000
Message-ID: <CH3PR11MB046149AB1DA9419C7B4A584630C17C2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261116150649.368686-19-michael.j.ruhl@intel.com>
 <20261116150649.368686-33-michael.j.ruhl@intel.com>
 <sashiko-outbox-217283@kernel.org>
In-Reply-To: <sashiko-outbox-217283@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|CY8PR11MB7828:EE_
x-ms-office365-filtering-correlation-id: f6dd9ade-011f-45bd-c2ef-08df44002d98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|4143699003|56012099006|11063799006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261022115727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: 9I+Nm4T5mB2RM8eIY8MhoH0Hw1/fFI1xIKuPLf7hq301c4bu+j81QUmLWWjKmCNCnVNQU3JfiwoZ9uMoe+2nfmH4xa5znyVjH5z69yreISJTpRZk5uRIQDOcg4VIucfTV2lV/PnJktTjYyYxgpaGSJSKgGKbMmfPOoxlusGIfLyVUGzp6Pejdmb8V6Wmj04CJlHEDWp5NGpbfHY18KJ6efaFQcW65/UWnGLLWwTin7xyOOJA02A1JvDVhPCICeOS6XWFnN9guqwq2txh2ASplvA3JW7UBniO6pWt+JxT1Uhw5Yh1jO/Mmk7VAyoggrINUKyxTq0QDYsiaIIPHqllIRTNs6p4x0TA/Qr3azQGqA3r0XhYfhzTsBDnyA7PJMh+fTYhufL9DMgRXyBigZWtjoQjj5tkzSIMnZ9i61vShu7iYJcPBd8ZcxDOcxlYGjQiNUhHlehn/sQHIHo8qtSJtAyZRe5DvPNaVRNgJQ38lRCBA4axKKyU3igF40dtirpLn4NBnTUsnTweZRKkJRY5USBmUDq46E4cp1dSotoaMzdySpM/zRR9MRXLzN8JBgkVCwQxKqwHbEvubLOEUR+nHwBSwWt1FxESUYXc0V//6Y6hIkS74TJMaWixVq2j3tFMwKVbiHLwCKdG6HjLC6B3Aeb+7pWoxaDTpH4m+bUT4V4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261022115727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVFRK0JRMXFJV1Q3QWFreDZzVTJZVEdPZ1JVSVRRa2FlV1ZLVnJmd2pUYjFt?=
 =?utf-8?B?Mi9JV1VzR0dHNXRCZzdUMjV3RDYybWZDcDRYRlJOWmdjVzNvakl5UWtjdWps?=
 =?utf-8?B?ZEhockNqbWNJemF5Z2NsRWErdjJESEkyZ1dVMHhYTFIvRU1VaG5QUkdHcEVW?=
 =?utf-8?B?a21oUjZXRFZ6WnlCOHUvd2F0dWE0c0tMSEtJUlNPZWpKV2hvLzA0eHB3VWcw?=
 =?utf-8?B?bDB1Q1RkSUtiZlh1bkROYTFsWDEyOThOY21jNHNuSnhmeWZ1bW1pYkJvMHU0?=
 =?utf-8?B?bTB1cENNbjlZRDE5WGZGem5mRnBVMmZKYUVGTjhwWk9EY1NCT0s1NXBWWWRk?=
 =?utf-8?B?WUdlSG9OZFNzemVvdm4vVURLS0ZxTmhrUmtHU3NqUlVPczFsRlhUNi9ia1l4?=
 =?utf-8?B?cWNQd0xpSURkM2x3bXRxNkJTenUrYXVyVGNDTEhKdEE0alUvVDA3QXFvV01T?=
 =?utf-8?B?cWZYTEd0ODhTRTd2eWZtM0t6NkdSMThIS1dWK1QxOWp2ZEJRTmJuZ1RNamor?=
 =?utf-8?B?VzRSUHZwRk83Si93OGthSlkvNFUwanUyMklqcGJsQWhDeEVYSU0vMXJ5ZEF3?=
 =?utf-8?B?a042anJldVlaR1g1ME1kblVRYnU3Z2dRcWpITXMxYXBHMUdHL2NPa3hGU0lC?=
 =?utf-8?B?TkpLRWNzK3JETTY3YmdiMEZybExpVjUwblZUMm83RkRNSi93MEsyMTRFZDQ3?=
 =?utf-8?B?N0lSNE9rRllKQU9Ld0xGc3hFQ1BmNjIzTUNHZ3J4RFc4eWNUT25rTThQNnBl?=
 =?utf-8?B?TWUvT2FCT0JDSlJadVBhZ2hrNHdzMTNiRElhampqN21lRlRTVUtERGdIVHJv?=
 =?utf-8?B?M054TlhJdnNFOFZXSi9ZNW4xeHJoTURFKzl6MGxTWW9HUVFxSDE2K0NYZ1BF?=
 =?utf-8?B?SjBCbmlaNmdYd0M0MTJobWxtdEMyT3lKTmF2SjhlN0xBbThtckNudWVjcXI4?=
 =?utf-8?B?ZWptRi9NRlBoQ0hyME84c3RlRkpXR1lBY0R4Y2M4K3B3WUVZTEZ1dHRNZ3gr?=
 =?utf-8?B?dUcwVnBvZXNWK0hHR1dpTzkyUGZ5SkFtN2FWWk1USHlkd1hIbjJFMGU2V1NV?=
 =?utf-8?B?V2F0QTJlYXBYbGtYYmRYdmtCWVlzVDRodC9HNjdlMDArSUJ2UW5qU0twejRU?=
 =?utf-8?B?UjRwd0R6MDJBR1FVdUo0VmUwcEZmYzJET0hocGFHdlMrcXJmSFJVdHlNaWNK?=
 =?utf-8?B?Q0cra0F1bm9zK2dCeTNmQkZhZDViaTI3L1hBOTQ4elN4SSs4TDVIcWVJbm9q?=
 =?utf-8?B?SFlPcFBoejRvc1NRVDRDb0t3K3F3MitnTnp0UEZwenVVczZnNno5MEFXeTlY?=
 =?utf-8?B?NW1mb2tPeS9oQ1A1TzR5b2dtWEtUc01EZlFIbGFBUHVGZmJob2RCNE9GNEdO?=
 =?utf-8?B?WXhmSUF1QzNacGVuYjgwakJYVEt2MHZsNlBnU3B1Y0dhM1BUSHZOM1V6VGFt?=
 =?utf-8?B?QngraS9MWnhXdzhrWFFvL0lMd2hwWThvelpzTmJxbWw0RG1OK1kvZ0M3TzZ0?=
 =?utf-8?B?Mk40SytvS29PaC8xbE1pdE9GNEtySTBDS0d4M0xReTJlczZlSEtMa1Y0WWIr?=
 =?utf-8?B?c01iTXdxM0Z5Zk11TnZxNkVHRmtZamZwTjNzWVJGTUl2V0xEMVo1S1pnUTJq?=
 =?utf-8?B?UUYzUG5nNDF4NFhRdEd2VFdDVFVwMFlKTlpnRUlmZjdpUFdodzgzaDBPdjl0?=
 =?utf-8?B?QkZRcVBpWTlRdnFyQTZNVXRpakNLSnBYeEkwbnNubjJyOUtBM2dVVzlrWDU5?=
 =?utf-8?B?RmdBK3ExTkFDeThFeGorNGtLa2ZEOGw1MlRvL3ZwdldDeVB4VXg4M09vUVln?=
 =?utf-8?B?ODVLNkQyeDJrQzV6TzFRRVZ5L0JBOEQ0U3d4WDV5eFpXbk1zTG16bmQ1SGI2?=
 =?utf-8?B?bEdYaVBwRlo1a2cvcFYrU0Qxc1RCYW9ucVp6OGlja3RLcWY5QWVBVmU4TGhC?=
 =?utf-8?B?VmxrV1crcW9VWGdncjFFUDhTMzg5UjFkUUxxdURwNE9DVnBpN3ZRa0hZSFh6?=
 =?utf-8?B?eUlNWkdQb0M2Z3dPRWNseWllWVZISVg0eTlQb2NkUFcza080YTJlQVNaQzBs?=
 =?utf-8?B?SGswdjZLZG5qemdVK2Z3ZFAyKzhVVUVaWTZGRDJ4bWpMd0kxdEJLNE9iVllE?=
 =?utf-8?B?KzdCOUZlWkFLOVNFSlF6cXJIallEUUpDTGFjMTErQ2lEUGE0ZnpCQWpZeHhK?=
 =?utf-8?B?K2lyM3FPRmNlaXphd1pXN0NyN09XbVU1UzJ2blN5aGxRaSttUGl1ZElMQ0h5?=
 =?utf-8?B?dW80RVlkNEpIZ3k2TTlFWVVjUk5tNVBmQi9jN3lVcVZKem45dFpuc1d2Wk5J?=
 =?utf-8?B?RkhPRis0ei9zT2VPM09yaTVQdy9RNHJ5TkRZMnZicXBwWDY1SlhjQT09?=
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
X-Exchange-RoutingPolicyChecked: XSYZzy8IUrd8+geIGQs8Cd/Nqtn1+sZh84Barib8w1iVsN/FacCr3abxEVdn1sBmTljZlBe8knkynhngEJ5ClcEoqDXzNxr8JvqAJQf/V2FFQ+QeX2Ki7Xl020U0CTVW0sFwoxavgjZxzchIjo5zuJq+qAqE3/usLZ2zKjuRqMvkrX2ztBPG0yFq8otN1Ln9XVxUZpm1tc48GvYu43GMTQUoopikAEBSV7l0mMgqX5Zv/B6CdCny8Y63IgvqHojxZAf/D8tFSBNr6tVCO7i12eg43xucVBX58kU9lpy52maLQh7CPFIgpcu1J1ZkqIJo9W1KmqI8pX6TA+lmwtjhnQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6dd9ade-011f-45bd-c2ef-08df44002d98
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 16:39:26.4521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysv183YnecI3TvS4yilhUaLaoe8kJrIm7HgM8m4Lblbc49jjZkXqQfy2R16+XWWy61cAj1zCMaW2G9wJFvtG8aPS2VUFFicvI87MALywKiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7828
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBNb25kYXksIE5vdmVtYmVyIDE2LCAy
MDI2IDEwOjMxIEFNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogUmU6IFtQQVRD
SCB2MTYgMTQvMTddIGRybS94ZS92c2VjOiBBZGQgUE1UIEdVSUQgaW50ZXJuYWwgYWNjZXNzDQo+
DQo+VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91
bmQgMSBwb3RlbnRpYWwNCj5pc3N1ZSB0byBjb25zaWRlcjoNCj4tIFtNZWRpdW1dIGRybS94ZS92
c2VjOiBtaXNzaW5nIHdhaXRfZm9yX2Z3KCkgYW5kIGludmFsaWQgR1VJRCBoYW5kbGluZw0KPiAg
aW4geGVfdnNlY19nZXRfZ3VpZCgpDQo+LS0NCj4NCj5jb21taXQgNjMyZDI2ZWZmMjFkM2QwOWVh
YmJlOWE0NmFkMzIyYmViOGY4MzQ2Yw0KPkF1dGhvcjogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVs
LmoucnVobEBpbnRlbC5jb20+DQo+DQo+ZHJtL3hlL3ZzZWM6IEFkZCBQTVQgR1VJRCBpbnRlcm5h
bCBhY2Nlc3MNCj4NCj5UaGlzIGNvbW1pdCByZW5hbWVzIHRoZUJhdHRsZW1hZ2UgdGVsZW1ldHJ5
IGd1aWQgbWFjcm8gdG8gaW5jbHVkZSB0aGUNCj5wbGF0Zm9ybSBwcmVmaXgsIGRlZmluZXMgdGhl
IENyZXNjZW50IElzbGFuZCB0ZWxlbWV0cnkgZ3VpZCByZWdpc3RlciwgYW5kDQo+YWRkcyB4ZV92
c2VjX2dldF9ndWlkKCkgdG8gcmVhZCBhbmQgY2FjaGUgdGhlIHB1bml0IGd1aWQgcGVyIHBsYXRm
b3JtLg0KPg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiBpbmRleCBmZTNkODMzOGNmYzk4Li43Njk1
YmQ2YjZiYzg3IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0K
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4gQEAgLTU3MSw2ICs1NzEs
NjEgQEAgc3RhdGljIHZvaWQgY3JpX2xhdGVfYmluZF9wcm9iZShzdHJ1Y3QgeGVfZGV2aWNlDQo+
KnhlKQ0KPj4gIAlpbnRlbF92c2VjX3JlZ2lzdGVyKGRldiwgaW5mbyk7DQo+PiAgfQ0KPj4NCj4+
ICsvKioNCj4+ICsgKiB4ZV92c2VjX2dldF9ndWlkIC0gR2V0IGFuZCBjYWNoZSB0aGUgUFVOSVQg
Z3VpZCB2YWx1ZQ0KPj4gKyAqIEB4ZTogdmFsaWQgeGUgZGV2aWNlDQo+PiArICogQGd1aWQ6IHJl
dHVybmVkIGd1aWQNCj4+ICsgKg0KPj4gKyAqIFJldHVybjoNCj4+ICsgKiAqIC1FTk9EQVRBIGRl
dmljZSBpcyBub3QgYWN0aXZlDQo+PiArICogKiAtRUlOVkFMIHVuc3VwcG9ydGVkIHBsYXRmb3Jt
DQo+PiArICogKiAwIHN1Y2Nlc3MNCj4+ICsgKi8NCj4+ICtpbnQgeGVfdnNlY19nZXRfZ3VpZChz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTMyICpndWlkKQ0KPj4gK3sNCj4+ICsJc3RydWN0IHhlX21t
aW8gKm1taW8gPSB4ZV9yb290X3RpbGVfbW1pbyh4ZSk7DQo+PiArCWludCByZXQgPSAwOw0KPj4g
Kw0KPj4gKwl4ZV9hc3NlcnQoeGUsICFJU19TUklPVl9WRih4ZSkpOw0KPj4gKw0KPj4gKwlpZiAo
IXhlX3BtX3J1bnRpbWVfZ2V0X2lmX2FjdGl2ZSh4ZSkpDQo+PiArCQlyZXR1cm4gLUVOT0RBVEE7
DQo+PiArDQo+PiArCW11dGV4X2xvY2soJnhlLT5wbXQubG9jayk7DQo+PiArDQo+PiArCWlmICh4
ZS0+cG10LnB1bml0X2d1aWRfY2FjaGUpIHsNCj4+ICsJCSpndWlkID0geGUtPnBtdC5wdW5pdF9n
dWlkX2NhY2hlOw0KPj4gKwkJZ290byB1bmxvY2s7DQo+PiArCX0NCj4+ICsNCj4+ICsJc3dpdGNo
ICh4ZS0+aW5mby5wbGF0Zm9ybSkgew0KPj4gKwljYXNlIFhFX0JBVFRMRU1BR0U6DQo+PiArCQkq
Z3VpZCA9IHhlX21taW9fcmVhZDMyKG1taW8sDQo+Qk1HX1BVTklUX1RFTEVNRVRSWV9HVUlEKTsN
Cj4+ICsJCWJyZWFrOw0KPj4gKw0KPj4gKwljYXNlIFhFX0NSRVNDRU5USVNMQU5EOg0KPj4gKwkJ
eGUtPnNvY19yZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uKHhlLA0KPkNSSV9JRFhfVEVMRU1fRElT
Q09WRVJZKTsNCj4+ICsJCSpndWlkID0geGVfbW1pb19yZWFkMzIobW1pbywNCj5DUklfUFVOSVRf
VEVMRU1FVFJZX0dVSUQpOw0KPj4gKwkJYnJlYWs7DQo+PiArDQo+PiArCWRlZmF1bHQ6DQo+PiAr
CQkqZ3VpZCA9IDA7DQo+PiArCQlkcm1fZXJyKCZ4ZS0+ZHJtLCAiVW5zdXBwb3J0ZWQgcGxhdGZv
cm06ICV1XG4iLCB4ZS0NCj4+aW5mby5wbGF0Zm9ybSk7DQo+PiArCQlyZXQgPSAtRUlOVkFMOw0K
Pj4gKwkJYnJlYWs7DQo+PiArCX0NCj4+ICsNCj4+ICsJLyogdGhlIEdVSUQgaXMgc3RhdGljLCBy
ZWFkIG9uY2UgYW5kIGNhY2hlIGZvciBhbGwgcmVxdWVzdHMgKi8NCj4+ICsJaWYgKCpndWlkKQ0K
Pj4gKwkJeGUtPnBtdC5wdW5pdF9ndWlkX2NhY2hlID0gKmd1aWQ7DQo+PiArDQo+PiArdW5sb2Nr
Og0KPj4gKwltdXRleF91bmxvY2soJnhlLT5wbXQubG9jayk7DQo+PiArCXhlX3BtX3J1bnRpbWVf
cHV0KHhlKTsNCj4+ICsNCj4+ICsJcmV0dXJuIHJldDsNCj4+ICt9DQo+DQo+W1NldmVyaXR5OiBN
ZWRpdW1dDQo+RG9lcyB4ZV92c2VjX2dldF9ndWlkKCkgbmVlZCB0byBjYWxsIHdhaXRfZm9yX2Z3
KHhlKSBiZWZvcmUgcmVhZGluZyB0aGUNCj5kaXNjb3ZlcnkgdGFibGUgb24gQ3Jlc2NlbnQgSXNs
YW5kPw0KDQp3YWl0X2Zvcl9mdygpIHdhaXRzIGZvciB0aGUgT09CTVNNIEZXIHRvIGJlIGxvYWRl
ZC4NCg0KVGhpcyBjb2RlIHBhdGggYWNjZXNzZXMgdGhlIFBVTklUIGRpc2NvdmVyeSBzdHJ1Y3Qs
IHdoaWNoIGlzIE5PVCBjb250cm9sbGVkIGJ5IHRoZSBPT0JNU00gRlcuDQoNClBVSU5UIGRvZXMg
Tk9UIG5lZWQgdG8gd2FpdF9mb3JfZncoKSBiZWZvcmUgYmVpbmcgYWNjZXNzZXMuDQoNCj5BcyBp
bnRyb2R1Y2VkIGluIGNvbW1pdCAiZHJtL3hlL3ZzZWM6IFN1cHBvcnQgbGF0ZSBiaW5kIGZ3IGlu
Zm9ybWF0aW9uIiwNCj50aGUgZGlzY292ZXJ5IHdpbmRvdyBvbiBDcmVzY2VudCBJc2xhbmQgaXMg
cG9wdWxhdGVkIGFzeW5jaHJvbm91c2x5IG9uDQo+cG93ZXItb24gYnkgbGF0ZS1ib3VuZCBmaXJt
d2FyZSwgc28geGVfcG10X3RlbGVtX3JlYWQoKSwNCj54ZV9wbXRfcmVhZF9yZWcoKQ0KPmFuZCB4
ZV9wbXRfd3JpdGVfcmVnKCkgYWxsIGNoZWNrIHdhaXRfZm9yX2Z3KHhlKSBiZWZvcmUgdGFraW5n
IHhlLT5wbXQubG9jaw0KPmFuZCBhY2Nlc3NpbmcgdGhlIGRpc2NvdmVyeSBvciB0ZWxlbWV0cnkg
cmVnaW9ucy4gIER1cmluZyBwcm9iZSBhbmQgdGhlDQo+bGF0ZS1iaW5kIHBvbGxpbmcgd2luZG93
LCB4ZV9wbV9ydW50aW1lX2dldF9pZl9hY3RpdmUoKSBzdWNjZWVkcyB3aGlsZSB0aGUNCj5maXJt
d2FyZSBpcyBub3QgeWV0IHJlYWR5LCBzbyB4ZV92c2VjX2dldF9ndWlkKCkgcmVhZHMgYW4gdW5p
bml0aWFsaXplZA0KPmRpc2NvdmVyeSB3aW5kb3cuDQo+DQo+QWxzbywgaWYgdGhlIHJlZ2lzdGVy
IHJlYWQgcmV0dXJucyAwLCB4ZV92c2VjX2dldF9ndWlkKCkgc2tpcHMgY2FjaGluZyBpdA0KPmJ1
dCBzdGlsbCByZXR1cm5zIDAgKHN1Y2Nlc3MpIHdpdGggKmd1aWQgc2V0IHRvIDAsIHdoZXJlYXMg
aWYgYW4NCj51bmluaXRpYWxpemVkIG9yIGZhaWxlZCByZWFkIHJldHVybnMgYSBub24temVybyBi
b2d1cyB2YWx1ZSBzdWNoIGFzDQo+MHhmZmZmZmZmZiwgeGUtPnBtdC5wdW5pdF9ndWlkX2NhY2hl
IGNhY2hlcyBpdCBmb3IgdGhlIGxpZmV0aW1lIG9mIHRoZQ0KPmRldmljZSBhbmQgY2F1c2VzIGFs
bCBzdWJzZXF1ZW50IHRlbGVtZXRyeSByZWFkcyB0byBmYWlsIGluDQo+eGVfZ3VpZF9kZWNvZGUo
KS4NCg0KaG0sIHllYWggYSByZXR1cm4gb2YgemVybyBzaG91bGQgcHJvYmFibHkgcmV0dXJuIGFu
IGVycm9yLi4uDQoNCndpbGwgcG9uZGVyIGFuIHVwZGF0ZS4uDQoNCk0NCg0KPg0KPi0tDQo+U2Fz
aGlrbyBBSSByZXZpZXcgwrcNCj5odHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEx
MTYxNTA2NDkuMzY4Njg2LTE5LQ0KPm1pY2hhZWwuai5ydWhsQGludGVsLmNvbT9wYXJ0PTE0DQo=
