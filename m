Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793694549;
	b=cmXUk9eVD8iAxkOGUzGnn2jWaykwiU4ooQLIGncxUdwAGjNjAlWYcYochZ180kbNsMAr
	 3Pm+YKxQqMDjv95vn7AqFw3SMqDDiyauHXmVj/GoLPsPU0CvFzwtLv1vsOkNHov+0iM28
	 jSl6iQuI0Q3BKAuMmLfIqCk1XzTooA3M+5AyqdHbIsUViZ6MghxPkmyErq2X+EmRhD3gZ
	 YY3IbLWyxX/k59elEjFKXpy+OuaXEe/4m2Vwe/uCiU91UfIiJgGsBczdcQNvyjvxfoOyb
	 96r4S8/HBYxOVklWBIRG5EEaDZqmZ5f05hNNVHbcY0DuFZX6baxOlZQ5rIAcNeyBFJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694549;
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
	bh=BBJyehNc8hR3r4ct849ZSS6YMh7RwlofT4qeyhs+waA=;
	b=XDMlClp8KblhAbF30mE8saexX0b5wZG4rTolgtrQE8tamrs3Jy1F3DXikAKEYZXSxA4E
	 796RCO0NBN4E7uh08G86Ql5r+DpSKN+BEc2w7VA/b1rzBl2WNjCrWJa+r0/3BHSYFc8lC
	 6uEegr2m03jQ8geWjfHPflizUHGZw+HnLt0AwyB4Dm5snaxMl90H8pBTWMkClPvPklcrn
	 uk0zn1kPtnMTCUTLclvWAEOWAm53azpbnN7a0XyzAPRzScCdosuoVRshu+bjWercYF/WR
	 zhn0y3JWvVbQGgPfHV1CNU6jzurCI6OXKK/Bw5yFZBz8ENZd2Y4eK2TQdmEfJhQNtGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kr8oDalu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9CC606A333
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 08:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A9CC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kr8oDalu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793694548; x=1825230548;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BBJyehNc8hR3r4ct849ZSS6YMh7RwlofT4qeyhs+waA=;
  b=kr8oDaluPQFotqp4DyLCfQjGDoul2k+Rvo5dpBnPoATZDJBGVuG4fFj8
   s+n9mLlrVs2UqJRFCiuMeyuNtsSkiDgJ31HoLXYI/w+eRzC4TosueaCvh
   6V9k86oO+s6KAe4kVVPWQLyfNsFTUWZ/arsoUu4I37NyTjmVjuTXZh3M2
   bM8jS83eOiQ7zBoD1SfRqqnmHcxCoDHAl50wmNACCkzdmhWSD+M6y1zac
   2vR9GWQHZhRhHeN986xTaXkHP5BfcmpvLqyVVzTGWpjBDy4Vy77oFf67d
   FkgdhjKkpNk47imyl29NxfIK5xg8YiSFdhT3KzszcSgENMqkRUs8HbrFg
   g==;
X-CSE-ConnectionGUID: o2ux+KCRSjCrqhrcFT1hag==
X-CSE-MsgGUID: FgWw6YCzRDefn6CTLZVRrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2424426"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2424426"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 00:28:49 -0800
X-CSE-ConnectionGUID: 6SWhf3O8T9aJOM+Qr72BKw==
X-CSE-MsgGUID: 4xIjMtHoTZeI/B3yxRZJvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6249923"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 00:28:48 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 00:28:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 00:28:47 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.59)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 00:28:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hn8alxRLrbn3iqJACF7vPP4bN49rSmhSD9epYDlrpix2eS/IBbS/A8Iu8RlDyd5WHlwxUfp7EbI4sNWw1OKSZLUzhtEm2fqHnjouSswSp9Nt0RNXkCq/UHjxh2EhyejsWZBWGyvTv6V0c0PsGL8dW/Ng4ceYJT2lqgmk7VrgYP6+Hg/8k5kWpVYzg69SGp8a/veV3lzlVEmHASgy55wAcnJQwFixzl2vrkkGo9Rc4/mH62yPwPICaHpvRl/Os/pL8RuO0vlZy30uXpK7NBz8BGDvfkAPtZ8QP1/pnzNvLagLLvf+wGU0Cfs/SPoPIup9ODX9Kzc/h9Kej2oqan/Rsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBJyehNc8hR3r4ct849ZSS6YMh7RwlofT4qeyhs+waA=;
 b=tEuTOyK/fQEQegXmJaZBhitSUvK8DFqSOUSvGJ927thZXxcKz+EleSMf3eHA2An6yVxCKgDDtt/ieNSjFBSy6xqllRWwMPN1xiIWLlUn11n5Ya6Bx2h2nQknqqfCUY5sO7MXIYie9bPwJ/LH34HxPn3T1asbhjXbfociLpkc36ceMptGIlRTH8aBy7lmlToVtLWC+GAgwylHP2dvJ2xLAsbCWsJbIyaT9SZUO5I9j9uNGaRK7Hey4puQObG5e90P7ElXirgTsXoloTJSnP26Ge/5NuVnTuQRrSInNQFaUDhlrphb900TK3SUej0d2/mWx1x7laVlh9DGS0zgvClcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 08:28:39 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 08:28:39 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "Bard
 Liao" <yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: RE: [PATCH 1/2] soundwire: move lane bandwidth into bus params
Thread-Topic: [PATCH 1/2] soundwire: move lane bandwidth into bus params
Thread-Index: AQHdapAaN/nbVKf0pUCQ+APuDX+i8bcaTiqAgAG3P1A=
Date: Tue, 3 Nov 2026 08:28:39 +0000
Message-ID: <SJ2PR11MB84240CE803A01D45BBD993ACFF692@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20261102060437.824814-1-yung-chuan.liao@linux.intel.com>
 <20261102060437.824814-2-yung-chuan.liao@linux.intel.com>
 <sashiko-outbox-192942@kernel.org>
In-Reply-To: <sashiko-outbox-192942@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|MW3PR11MB4602:EE_
x-ms-office365-filtering-correlation-id: 4c96c5eb-9dc3-4092-20c1-08df39847664
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|261021135927099003|261021133027099003|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261021121427099003|261021130227099003|261026135527099003|261026140227099003|261022105027099003|261026130827099003|261022115727099003|261022113327099003|261021123027099003|261026121527099003|261022075727099003|10067099003|18002099003|22082099003|261102123227099003|3023799007;
x-microsoft-antispam-message-info: Nravvb/RCK7dzdM3lT81s7cKCJwpwN4Bv1fFlW0XMKslPui/5g19hxrbnmLDCqOP76kKlsxGQTmzUSFvs7J0tg9R3kYmIPnD3NKywRiwh16Lfcn1tIcHkUFvRUQayV7tfYWhSdrRfLT+p2YKjKtIOaz/0FwkmTRvef2lDvZlsoHbvVGN+d672hEi6b9RRX/yS6MLMBQq6EJyoUAgrS8BajDG+YX/d+dEBke1U7Cgm/qw5PRl+PqbXvy8BFUd5OBseA8AZ5EyIjpqjF9na8TdN9I9CcUOK0lpWFIlNCJ82GQeb2sXs0FxZauuAefvoUZ7s3ObDfs485OVc6TUV8UkdXtos3C1Jkk7UCzv+N9q09U2QWZ5OM9cmVM0OX7ODptpKFF8BRunscn9baCLNGAnWiQfFbkOMwfJtcFOvdwFfZS98TzSfEyqvFb7xOK+3zbIPx6dxVQhqhPXzoPqymoxFNI9YPGRm6GemC6WoI5iDH7Iq5bN486jbVuNnSc9CpKFW8anavFd3TicrwLrlkdLyr83iQUcA7GBOe398IqDpwQAQCma3tZ7e4MIoqOyrnyR3iTJkCn/5+qOPgsjWG4rCLR6Gr/n/4fz+32YORkBShyB5uzHzwb26x//DnkGHesBCEjqtP528tHwAaHAhR7AbhR1u4n0123sECBu1h9Ez58=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(261021135927099003)(261021133027099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021130227099003)(261026135527099003)(261026140227099003)(261022105027099003)(261026130827099003)(261022115727099003)(261022113327099003)(261021123027099003)(261026121527099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWFBc29BNnNlWmxjR2FNZ29UUnNqSVUxZlFhU3NrN0xFaGpNVnh0SVlTLzlx?=
 =?utf-8?B?RlNkREZ6ZGk5TXdWSHVFcVNDSEdwRDV3MElMcE9NbkMweXB6U1ZlVVkxNFJS?=
 =?utf-8?B?SUVITmNEYjh2UThyUmR4OWZLOHB1UmNPVlEyc1BKOUIybXJlZUxteGN0a0FN?=
 =?utf-8?B?SWFXdkpaazY2Q3IxRGlIU29yV0RRcE54YmFpR1I3NUZOT1h4TzJMM215QXRT?=
 =?utf-8?B?amZjVzNQR1A1ZW0xWExtYXpHVFpMUXhoc0J3cVBDSXUrYTBWTlhGQUxyZ2pn?=
 =?utf-8?B?TC9VYUQ1cEErWjNFOVI0ZXFaMW11SkU0VHNJVXAwV0IzeUpNQ0RUbmpBZnhh?=
 =?utf-8?B?c1phc0JpU294T1F3OHVveWpoelE1Nlh5NGxnUEdqVzBkSHZRTWk2OUhDZ2I2?=
 =?utf-8?B?QkhucXpFZHNjSTFLZkVzbkZxUnMxRGh5OUZVaytzbWNObVpNa2NjMjNDYUJz?=
 =?utf-8?B?MURUd1lKZ2wvSFZFeTdhSFBremxwejVZU0lOUXh2Q2hiTzFKYThDbEdCYTBu?=
 =?utf-8?B?S2V3M3NCVmhhTjA5MWRST3gzc0RmUkN5dHdZUlE5YTNCd0RWOWFBaW9OWGxD?=
 =?utf-8?B?RFNJTVd5Z2xIOEFQcGN1NGZJaktwaUxBQzVwWXlrSjhWeXk0OURUNVB1MU5M?=
 =?utf-8?B?cnRoWFV3NUZCZGZpQlNDd1dKZkM4ZHRmS1dBY21mRmZ2dWY5V1ZBbStwV2FW?=
 =?utf-8?B?bTdBTTN0UjU5MHhla1BieG5ZTGFCNGFNb3pGbUFOTVdQN2o4RUNpRFZLaGxH?=
 =?utf-8?B?WHQ4NnZGVXJWdU1DZkg5RnpLNEdlYUFOYVc1S2dVMVdCQ0pBVUwwNHBiRGxN?=
 =?utf-8?B?cHJ0enRoeHRBa2lzaU9JQXZ4ZVNMQkZFZmxrRFptUEZ6bW9meUZMNFhrb3Y1?=
 =?utf-8?B?WTlodjcwekFFWHphUGVTWmlUdStkRThrYXVZeGtwdURFRUZ1QXhZRVNXMVZT?=
 =?utf-8?B?Sno3VnVpVDEzQ003WkhXTG9QclRpUkxybUxqaGxXTlB4N09EM3ZMYkd5V0Nt?=
 =?utf-8?B?S0JqdzU4U2U5d3FVOGFIMzkvQWtPUmN3ZHN3ZVlPZlI5WHpOM0RBQ3FMSmF2?=
 =?utf-8?B?b1JyU29oM3gxWGV4UkhLakFOc0M0dnNndm5VWWNnZU5KaXZ3NFZOS1NmS1o4?=
 =?utf-8?B?UWllMnBwNWJxaHVCaWxzYkt3dXptaTNxVUVVZHBsb2ZPcUFGYldyL2xmLzRB?=
 =?utf-8?B?dytsUkVLSldUMHdGZVQvTkVlbElLU1hkTmpWd0FNTm1Leit2UDJMZkZVQzB5?=
 =?utf-8?B?WXMzZ3ZGS3lBam52MS9sYlNhRkZNUGgvSFhXMmxTN2NaMzFhOFg0UG5kU1dJ?=
 =?utf-8?B?bkcxbTBMNGU3emZwSktrOWZ3MlpyTUdGR3ZpcUFzRWJxRGFKMTJvOUdjVjhE?=
 =?utf-8?B?K2dYL3ZNdys3dmVtaFNCb0dISmt2ZFYzMVNmcXpEa3loalJPUFFKYjA5WkpS?=
 =?utf-8?B?ZzZtQXlHZHY3OEVsUlJvUVFtYmd6VHJSWmRZVEJwWmV3S1dXank2S3lrRldV?=
 =?utf-8?B?Sno4Y2RvVGxvTkV2MFhkQzdrR3Q5OHpON2Y3ZEVNZmJ3dGZBUkVlNGVGbEtX?=
 =?utf-8?B?RUphZjk3ZlRXSjZWUnlmSFhVY0lWa1E0dEJqMWVGa0hrRUVJN1d1QjVsNS9u?=
 =?utf-8?B?WHRhd3c5dTM3RS9NTWYwbnNMWU9JYnF3MW53S2FWNkZCQU00bUZxM09tUVhO?=
 =?utf-8?B?RitlS3NlZHRESW4zMUVrR24zTWlZYWxwN0cxeUhIWG01d2pYUmhBeTByM0Uv?=
 =?utf-8?B?RFdJOWlPbFI2VFp6TGk0WXQ5azZISGJHWUhLNzlRcU0rdlhPcEVvc2lCUzhI?=
 =?utf-8?B?b2h5QWgrZ1N3VmhzT3dKTHlOVGU2RHNQM1Iwci9NWHlUL1V0QWVZemorMlln?=
 =?utf-8?B?bjJaUU9RL0FURVdkSE9yR3dLcEVpU2I2TmhDOWFyUHFtZndBbGU5S3MwK2wv?=
 =?utf-8?B?OXhjVWl1WmJ0cHBaUlNheG5HdGZHUHhvNHJvbTRRK0JBWFFSUXZWNnVjbmF6?=
 =?utf-8?B?ZWVpTmwzcjM3WmhEazcyVXJaWVZNZXk5SEN6YXVDNW1DKzFEbmtYOVhpYWt2?=
 =?utf-8?B?dlE4ZUdkWTJIbVJPQi9Nak5rVDNEWGVoRVhXcDdzUkpjMk5SVDRPcXR3UXNJ?=
 =?utf-8?B?UWw1eVIxZWhoRG5NWHJ0eHNwd3NhZDdKaThvYU5HeTVuWmhJN1llSFZtWUZu?=
 =?utf-8?B?ZnpTOTJKTUhwbXQ3U05wOXVHbzlKRzlKRjc1MFJDWkpzMGdsUUgxN1lpK3RW?=
 =?utf-8?B?eThUb0ZTbzYwQlhJaEd3dElYV0pvNHhlaHVXQWFObmNidDFCUDZ2b2lCdDVI?=
 =?utf-8?Q?5UPytfZGSkt+uyaGxP?=
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
X-Exchange-RoutingPolicyChecked: ZoGLDSieV3vQDt4dJ093+oBxzHob3vvTpgTTrLRxKRKAyKOenP8UabPLdP9xsx9jEf7TwaUu9B8oNp+HemRSfzGAJ/FxHLQpD30UAGPKsFaLVrw7yH6ey7/zziG18lac1xiiI0v4GKCIBdGPuYP+2ljxPW57s5jOfrJclzpjpf4aq61IoJfOFE9ToLbfCLuLv4Vk8kIT1JWFCVG6AX4gk8VcUxtcR4AXjL8q9F6OP3BsaQjo/qPd0tuS0FRMjj+BSNjvp383RTSEnwfMB7ZKsnyiS1BVnZtJc/DzTMs8cLfK2pML3vDQY58FGuJKYfsm6tKZh7HeC2L7Q3Sbp0sUjA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c96c5eb-9dc3-4092-20c1-08df39847664
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 08:28:39.3891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LZXkCRV40j552WKB17E1Ao2C5y8bo9ATRwO4AflF+H/zK0zRx0Nv3ZWnc1kiKiLHhzJF4ZS/DPWEPGDtKAAC1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJl
ciAyLCAyMDI2IDI6MTYgUE0NCj4gVG86IEJhcmQgTGlhbyA8eXVuZy1jaHVhbi5saWFvQGxpbnV4
LmludGVsLmNvbT47IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDEvMl0gc291bmR3aXJlOiBtb3ZlIGxhbmUgYmFuZHdpZHRoIGludG8gYnVzIHBhcmFt
cw0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZp
ZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj4gY29uc2lkZXI6DQo+IC0gW0hpZ2hd
IHNvdW5kd2lyZTogdW5yZXN0b3JlZCBwb3J0IGxhbmVzIG9uIGVycm9yIGluIF9zZHdfcHJlcGFy
ZV9zdHJlYW0oKQ0KPiAtLQ0KPiANCj4gY29tbWl0IGJjOGRjNTRiZGI4NTJiNTc5MzkyNDZmNDVh
MWQ1YWI4MDI1ZWU0NTYNCj4gQXV0aG9yOiBCYXJkIExpYW8gPHl1bmctY2h1YW4ubGlhb0BsaW51
eC5pbnRlbC5jb20+DQo+IA0KPiBzb3VuZHdpcmU6IG1vdmUgbGFuZSBiYW5kd2lkdGggaW50byBi
dXMgcGFyYW1zDQo+IA0KPiBUaGlzIGNvbW1pdCBtb3ZlcyB0aGUgbGFuZV91c2VkX2JhbmR3aWR0
aCBhcnJheSBmcm9tIHN0cnVjdCBzZHdfYnVzIGludG8NCj4gc3RydWN0IHNkd19idXNfcGFyYW1z
IHNvIHRoYXQgdXNlZCBsYW5lIGJhbmR3aWR0aCBpcyByZXN0b3JlZCB3aGVuDQo+IGJ1cy0+cGFy
YW1zIGlzIHJvbGxlZCBiYWNrIG9uIGZhaWx1cmUuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3NvdW5kd2lyZS9nZW5lcmljX2JhbmR3aWR0aF9hbGxvY2F0aW9uLmMNCj4gYi9kcml2ZXJz
L3NvdW5kd2lyZS9nZW5lcmljX2JhbmR3aWR0aF9hbGxvY2F0aW9uLmMNCj4gPiBpbmRleCAzMGE0
OTVhYmUxOWVhLi4zZDZiOWM4OTVlNDZmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvc291bmR3
aXJlL2dlbmVyaWNfYmFuZHdpZHRoX2FsbG9jYXRpb24uYw0KPiA+ICsrKyBiL2RyaXZlcnMvc291
bmR3aXJlL2dlbmVyaWNfYmFuZHdpZHRoX2FsbG9jYXRpb24uYw0KPiANCj4gWyAuLi4gXQ0KPiAN
Cj4gPiBAQCAtNTA3LDcgKzUwNyw3IEBAIHN0YXRpYyBpbnQgZ2V0X21hbmFnZXJfbGFuZShzdHJ1
Y3Qgc2R3X2J1cyAqYnVzLA0KPiBzdHJ1Y3Qgc2R3X21hc3Rlcl9ydW50aW1lICptX3J0DQo+ID4g
IAkJCQkJICAgICAgbV9ydC0+c3RyZWFtLT5wYXJhbXMuYnBzOw0KPiA+ICAJCX0NCj4gPiAgCQlp
ZiAocmVxdWlyZWRfYmFuZHdpZHRoIDw9DQo+ID4gLQkJICAgIGN1cnJfZHJfZnJlcSAtIGJ1cy0+
bGFuZV91c2VkX2JhbmR3aWR0aFtsXSkgew0KPiA+ICsJCSAgICBjdXJyX2RyX2ZyZXEgLSBidXMt
PnBhcmFtcy5sYW5lX3VzZWRfYmFuZHdpZHRoW2xdKSB7DQo+ID4gIAkJCS8qIENoZWNrIGlmIG1f
bGFuZSBpcyBjb25uZWN0ZWQgdG8gYWxsIFBlcmlwaGVyYWxzICovDQo+ID4gIAkJCWlmICghaXNf
bGFuZV9jb25uZWN0ZWRfdG9fYWxsX3BlcmlwaGVyYWxzKG1fcnQsDQo+ID4gIAkJCQlzbGF2ZV9w
cm9wLT5sYW5lX21hcHNbbF0pKSB7DQo+ID4gQEAgLTUxOCw3ICs1MTgsNyBAQCBzdGF0aWMgaW50
IGdldF9tYW5hZ2VyX2xhbmUoc3RydWN0IHNkd19idXMgKmJ1cywNCj4gc3RydWN0IHNkd19tYXN0
ZXJfcnVudGltZSAqbV9ydA0KPiA+ICAJCQl9DQo+ID4gIAkJCW1fbGFuZSA9IHNsYXZlX3Byb3At
PmxhbmVfbWFwc1tsXTsNCj4gPiAgCQkJZGV2X2RiZygmc19ydC0+c2xhdmUtPmRldiwgIk0gbGFu
ZSAlZCBpcyB1c2VkXG4iLA0KPiBtX2xhbmUpOw0KPiA+IC0JCQlidXMtPmxhbmVfdXNlZF9iYW5k
d2lkdGhbbF0gKz0gcmVxdWlyZWRfYmFuZHdpZHRoOw0KPiA+ICsJCQlidXMtPnBhcmFtcy5sYW5l
X3VzZWRfYmFuZHdpZHRoW2xdICs9DQo+IHJlcXVpcmVkX2JhbmR3aWR0aDsNCj4gPiAgCQkJLyoN
Cj4gPiAgCQkJICogVXNlIG5vbi16ZXJvIG1hbmFnZXIgbGFuZSwgc3VidHJhY3QgdGhlIGxhbmUg
MA0KPiA+ICAJCQkgKiBiYW5kd2lkdGggdGhhdCBpcyBhbHJlYWR5IGNhbGN1bGF0ZWQNCj4gDQo+
IFtTZXZlcml0eTogSGlnaF0NCj4gV2hlbiBfc2R3X3ByZXBhcmVfc3RyZWFtKCkgZmFpbHMgYWZ0
ZXIgc2R3X2NvbXB1dGVfYnVzX3BhcmFtcygpIGhhcw0KPiBhc3NpZ25lZA0KPiBhIG5vbi16ZXJv
IGxhbmUgdmlhIGdldF9tYW5hZ2VyX2xhbmUoKSwgcmVzdG9yaW5nIGJ1cy0+cGFyYW1zIHJvbGxz
IGJhY2sNCj4gYnVzLT5wYXJhbXMubGFuZV91c2VkX2JhbmR3aWR0aFtsXSBhbmQgYnVzLT5wYXJh
bXMuYmFuZHdpZHRoLCBidXQgbGVhdmVzDQo+IHRoZSBwb3J0IHJ1bnRpbWUgbGFuZSBhc3NpZ25t
ZW50cyBtb2RpZmllZDoNCj4gDQo+IGRyaXZlcnMvc291bmR3aXJlL2dlbmVyaWNfYmFuZHdpZHRo
X2FsbG9jYXRpb24uYzpzZHdfY29tcHV0ZV9idXNfcGFyYW1zKCkNCj4gew0KPiAgICAgLi4uDQo+
IG91dDoNCj4gCS8qIG11bHRpbGFuZSBjYW4gYmUgdXNlZCAqLw0KPiAJaWYgKG1fbGFuZSA+IDAp
IHsNCj4gCQkvKiBTZXQgUGVyaXBoZXJhbCBsYW5lcyAqLw0KPiAJCWxpc3RfZm9yX2VhY2hfZW50
cnkoc19ydCwgJm1fcnQtPnNsYXZlX3J0X2xpc3QsIG1fcnRfbm9kZSkgew0KPiAJCQlzbGF2ZV9w
cm9wID0gJnNfcnQtPnNsYXZlLT5wcm9wOw0KPiAJCQlmb3IgKGwgPSAxOyBsIDwgU0RXX01BWF9M
QU5FUzsgbCsrKSB7DQo+IAkJCQlpZiAoc2xhdmVfcHJvcC0+bGFuZV9tYXBzW2xdID09IG1fbGFu
ZSkgew0KPiAJCQkJCWxpc3RfZm9yX2VhY2hfZW50cnkoc19wX3J0LCAmc19ydC0NCj4gPnBvcnRf
bGlzdCwgcG9ydF9ub2RlKSB7DQo+IAkJCQkJCXNfcF9ydC0+bGFuZSA9IGw7DQo+ICAgICAuLi4N
Cj4gCQlsaXN0X2Zvcl9lYWNoX2VudHJ5KG1fcF9ydCwgJm1fcnQtPnBvcnRfbGlzdCwgcG9ydF9u
b2RlKSB7DQo+IAkJCW1fcF9ydC0+bGFuZSA9IG1fbGFuZTsNCj4gCQl9DQo+IAl9DQo+ICAgICAu
Li4NCj4gfQ0KPiANCj4gSWYgYSBzdWJzZXF1ZW50IHN0ZXAgZmFpbHMgaW4gc2R3X2NvbXB1dGVf
YnVzX3BhcmFtcygpIChzdWNoIGFzDQo+IHNkd19zZWxlY3Rfcm93X2NvbCgpKSwgc2R3X2NvbXB1
dGVfcG9ydF9wYXJhbXMoKSAoc3VjaCBhcw0KPiBzZHdfY29tcHV0ZV9ncm91cF9wYXJhbXMoKSBy
ZXR1cm5pbmcgLUVJTlZBTCB3aGVuIGNvbHVtbl9uZWVkZWQgPg0KPiBzZWxfY29sKSwNCj4gb3Ig
X3Nkd19wcmVwYXJlX3N0cmVhbSgpIChzZHdfcHJvZ3JhbV9wYXJhbXMoKSwgZG9fYmFua19zd2l0
Y2goKSwgb3INCj4gc2R3X3ByZXBfZGVwcmVwX3BvcnRzKCkpLCBfc2R3X3ByZXBhcmVfc3RyZWFt
KCkganVtcHMgdG8gcmVzdG9yZV9wYXJhbXM6DQo+IA0KPiBkcml2ZXJzL3NvdW5kd2lyZS9zdHJl
YW0uYzpfc2R3X3ByZXBhcmVfc3RyZWFtKCkgew0KPiAgICAgLi4uDQo+IHJlc3RvcmVfcGFyYW1z
Og0KPiAJbWVtY3B5KCZidXMtPnBhcmFtcywgJnBhcmFtcywgc2l6ZW9mKHBhcmFtcykpOw0KPiAJ
cmV0dXJuIHJldDsNCj4gfQ0KPiANCj4gV2l0aCBtX3BfcnQtPmxhbmUgYW5kIHNfcF9ydC0+bGFu
ZSBzdGlsbCBzZXQgdG8gbm9uLXplcm8gdmFsdWVzIHdoaWxlDQo+IGJ1cy0+cGFyYW1zLmxhbmVf
dXNlZF9iYW5kd2lkdGhbbF0gaXMgcmVzdG9yZWQgdG8gaXRzIHByZXZpb3VzIHZhbHVlIChzdWNo
DQo+IGFzIDApLCB3b24ndCBzdWJzZXF1ZW50IGNhbGxzIHRvIHNkd19jb21wdXRlX2dyb3VwX3Bh
cmFtcygpIGFuZA0KPiBfc2R3X2NvbXB1dGVfcG9ydF9wYXJhbXMoKSBza2lwIGNvbXB1dGluZyBw
YXJhbWV0ZXJzIGZvciB0aG9zZSBwb3J0cyB3aGVuDQo+IGJ1cy0+cGFyYW1zLmxhbmVfdXNlZF9i
YW5kd2lkdGhbbF0gaXMgMCwgYW5kIHdvbid0IF9zZHdfZGVwcmVwYXJlX3N0cmVhbSgpDQo+IGxh
dGVyIHVuZGVyZmxvdyBidXMtPnBhcmFtcy5sYW5lX3VzZWRfYmFuZHdpZHRoW3BfcnQtPmxhbmVd
IGFuZCBsZWFrIGxhbmUgMA0KPiBiYW5kd2lkdGggaW4gYnVzLT5wYXJhbXMuYmFuZHdpZHRoPw0K
PiANCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LCBJIHdpbGwgZml4IGl0IGluIHRoZSBuZXh0IHZl
cnNpb24uDQoNCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYxMTAyMDYwNDM3LjgyNDgxNC0xLQ0KPiB5dW5nLWNodWFuLmxpYW9A
bGludXguaW50ZWwuY29tP3BhcnQ9MQ0KDQo=
