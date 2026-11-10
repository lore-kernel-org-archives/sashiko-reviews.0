Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794327675;
	b=0RUjjw4zBT+y7u+IRgYwD+Kj+ZIku8WjwIsIcOf1Cs5QWXgYfIKGhH5ojzynRBd9Ib06
	 tjckDorkAXlyiAbtP9OXLt5VVH/rIWQ9wedeihQs+cf4QVgkR363fYI4vxZNOjtrBb83J
	 8CVV3qS4w2zOVwIS6uPGHyKgGLTkSdze/Ss5UV8v2QOeQBKpXPMsGcE0PLJJJoKXLBBlD
	 MzkJit+58ucEBVh/LYxrQi/J/0tJn8mBPMHWaKDTUiUFOZ63bV78xRbWXg9YNji3+cDJP
	 KIFmuCAud6CNDwB4NweOKGu5oDzjd+kVIi8NdIX1zjZ0xBxQDvDDFnekPTeAtaqIc/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327675;
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
	bh=BnBgI8CqFCIVG7q/OMpTC+PDsINeodXEo5zECJ84M+A=;
	b=cTleW+WyIk2MLZy7n4pLzD1fN5mUNPFv7Lzq32amESLTmvJ2391CznZkErMbyx0983rM
	 gIMh7B4tPxuUXzf2IPo0Yu+c1I7IGW/VKS94jznMO9e37yo8cRNmXfZmcsljlqOHoKGV3
	 +MRJEh3oDNqBfSZJ/FUfYYqIuBABaMJASpm7j0m4XkaSGpv8KvuI2bYL0yAOxQ2tRuxmT
	 HlscrjiFLkEmNgvZIazTyamGDOZwXU020tQGcB2aGkQ64qmfzMyF8iL99CIt1pHj5ymqZ
	 +cekROjhsM9NO6970I1I02yjohRh3q8AX74rF6R8gMrsNLSJlyhiQyWNcD/cnbetJFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DkJorwTX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A07606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 16:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DkJorwTX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794327675; x=1825863675;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BnBgI8CqFCIVG7q/OMpTC+PDsINeodXEo5zECJ84M+A=;
  b=DkJorwTXZhtO8FNjhr4aEeP4mJk8ldd/qC0+jpVV5+u7UCO8IoeelNIw
   pCovpH33ko8JDn9ioiKEcmUaJTkKgYo+I1ULi+NTHnMBp0EMTJKk8Ht5y
   DEUCZ4jzeItVTQIigmL6/Wra0Fvy9oNL9lBMSH3UyxyKIr+t08NjoOD3K
   g5FzA2Jk396hX9zMNHp78Kt6jYHSJJX5cRJcEG+pjDqJBfzTXt2z6RooQ
   NJ8ujMwcHzuhq458et31ELmwhVTlLaGLSs9OjgNB0PcXkCp9n8BWl+kSj
   Rys+8nZSQszrib1C6dZirD7qyUqm0MRe2FvyNk00mU2n+GNXCcnV9Aem4
   g==;
X-CSE-ConnectionGUID: 4HH5gGqHQKyqihlBQ6PjCA==
X-CSE-MsgGUID: NIkbAbQBRraSRlCXjzjKjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2969231"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2969231"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:21:14 -0800
X-CSE-ConnectionGUID: gUQKA9UpRHWu+MhXbOfw7A==
X-CSE-MsgGUID: pTndXgH8QEu1E+Jhrua4gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8256207"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:21:13 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 08:21:13 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 08:21:13 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 08:21:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLUMPhl/vD0UFGmy7WBiZBvML5fFy4uQgs9/dlC0f8ZbtFy3r0iJ0RQiQaW5WwoU2bgva9fbcOjRezOkQgDR4FYR1bm78LOZhSpxhiwX2vzJrkKQ8o35yKIkmLhvEJgke7NU47io4ggTysfRt46/Lh6UFsjIkmIUFNkhjBWLEM5W06eEyCAdSiPILwxvlqwv4wsfrEQL8uiiBlENwzTPzRH6WzQdORgpMvTHQ5RliqXmH1Ce8WDxLV6saCyGNETbRfJ/Sh8hPG7wHc6CFeLUQQjFzQMMcLd2GZK9aYM1Az7c4lKxq+krj+zdNG9eX7A7aUXcBAPPB+BkZirMWmTp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnBgI8CqFCIVG7q/OMpTC+PDsINeodXEo5zECJ84M+A=;
 b=vtXQVYiwoMIZD563cE1uoRkXBuWR3TyXRHFZwhnNy8wTBqZ3SSF3rAh5TsHP21teGcI/Dotqk1vEuH6z4RPem9Q1ENZXlAMGjmkn/RyENvjg6/EAW9r1Rvpkn93Vf+VOl2nXaXMF+PxwjkzoXs4Hx0Xfx4fZN7SZh/e5I+Xg0PJlw5x/ixPysIL4EQE6os5lQVf81lZP5VajsK5I4c7uL8V80fsND/x0XDEruQ60ew6DCLdllAII1GPLgLrGvT20AgcrXjbvW5WjU4Ueup6siGy0ycSUQcWTpr+IK5+BYomuxnIK/laV6EXvF2ivZ1C1GtFAYWIGycoEmISqaDFaTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DS4PR11MB474012.namprd11.prod.outlook.com
 (2603:10b6:8:50e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 16:21:11 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 16:21:11 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v13 15/16] drm/xe/vsec: Refactor platform check
Thread-Topic: [PATCH v13 15/16] drm/xe/vsec: Refactor platform check
Thread-Index: AQHdaxeCr874GDbIbk+9f959M6SHQbcbYdgAgAwmx+A=
Date: Tue, 10 Nov 2026 16:21:11 +0000
Message-ID: <CH3PR11MB046149AB1AC0C5E772A19680B9C1722@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-33-michael.j.ruhl@intel.com>
 <sashiko-outbox-194301@kernel.org>
In-Reply-To: <sashiko-outbox-194301@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DS4PR11MB474012:EE_
x-ms-office365-filtering-correlation-id: eafd3325-7032-4a7e-0896-08df3f46a273
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|6133799003|10067099003|4143699003|11063799006|261028144727099003|261009223027099003|261026140227099003|261102123227099003|56012099006|261022105027099003|261021121427099003|261026121527099003|261022115727099003|38070700021;
x-microsoft-antispam-message-info: d5uQbNqYrK4YNW4zZ4XaZjcIl8y393datBS0ahK1MHjlCNO/XUZT7ee8vAir4IuwjYchZX8klB6M7Sz5mo7OAmpiqzbuqyeK5lK+12N68fp9mueC+uT1GLLRgdeQQFij9mjrDgiwcZFR6W5Unel+8qE6VopVqkPbvYmFk9gvDEMcCEybHqnKtXWm2D4oXWCdnlkXiDU7RUFVKsmEuCWVNPeRvY61qmK51f+Ub+xuGbYj8Ay246IjL8NLyZa8OdEKV5AbxIkH5Sl1qRRMLh68SXLFjyYZTKPTInJVpeejqijFLlRCYNrW0dreY63MzQhKgUnKAkEHD9W+e36YzRbN6nIAlYQi0bLCKttMqoIFiqBZPYDjs7eZE4+EbGzml5RSLdRSccHal2J1/aJ7NB+oeHO/BMw2KrXgatm13HlmwvGfsnDCvoD3zqSDYEJz4YRlAC6RaRTeL3fAFShi8DhcBvqn9RBGtuFxfhw8oboBbJVHs4fhydlD5VeC87Toph62VMKVhUFva3zriE54pJA/R+yhIpoBwx/dXGKFoBdMxt47uvAfJaMjNrDE2rRZC3wTOsbE6Gn5c63LNTFbBCR/4TTVox1mekxtLZYzyAEiFUIZO1eIdZo0slVMPOUqpvikA35iD2AZ56pEhSVHrrrYpzjGqXd7ybqbhOpHqlyN5kQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(4143699003)(11063799006)(261028144727099003)(261009223027099003)(261026140227099003)(261102123227099003)(56012099006)(261022105027099003)(261021121427099003)(261026121527099003)(261022115727099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkxLanhKaEsvRURmU3RTUzNzTFdaQ1ZyVElaTDk3NCs2KzRqZHlNWjhkUVJ0?=
 =?utf-8?B?V1UrUXBxdXhRMGIzQUpQNjVLSzVId1pUb3hKSGR4NVY5UjdjNDl4ekg2MFBz?=
 =?utf-8?B?OGY4OTAxZDZkMXN1ejR2MUNVYy9vbzF1QVpDcTFGN0NTK05XZEdaVHZOVmdG?=
 =?utf-8?B?d2R4RzlZWFNQTzMwY0VzKytDd0NjNnlMMUM5UHpOTUh5TVR2RldESGFvWU4z?=
 =?utf-8?B?cEQ5b2VZbE5sTDJDWlZLSU4vakt1SFVDWG1Wc3ZySjF2OFVmZEpteFVHbHN4?=
 =?utf-8?B?TldRRjVRNjdzcWd3UWl2YTUyMzh4SDVxdllzcU51dEd0cmo3UnVZaDdFaUJF?=
 =?utf-8?B?MU5lZ0xuQVRHMTY2TTRCbGdIVUxuUnNvWkFFdlhtd0ZwUERvUE94MTJITkZQ?=
 =?utf-8?B?VHlraGNEaDVHTzM5NUZHRWhTQVZ1LzBPclNBa0Q0ajRZL0pLMlNOWDVISkdY?=
 =?utf-8?B?T0x1WUExQ2RRTTNVaHVlWmc0QmFDWk9oVzBrZnZyYUh2UE5pVUIwUVJBdDJq?=
 =?utf-8?B?N0NERkp3cm5uaGNtMXhKRTlPdld1d212MnpaMG1xTzhMK2ZuNG5EbDZpZXVq?=
 =?utf-8?B?dkI5aU02VFFQL253WjcvcGIzQXVQUCtBNmZmS2d4a3Bpb0lmeXJ6ai9Icndz?=
 =?utf-8?B?UWd5Ty9UWSs0L1ROb3RPekw1WWZNN2tPOVJUTDFuMmZSWjZzOVRJeDF0OTJn?=
 =?utf-8?B?d25SRXd3VUF3bkpJVmltMzNHSFdkQjZuS1RlVjkwOTcwdExoVU9kdXkzZXF2?=
 =?utf-8?B?L21RMnlhM2F6UUlySDFqODFVVjNpbk04UC9FVUxsZmNHbE94ejZZUGhxSEt3?=
 =?utf-8?B?cWRmOVBtUDdmQkt1TXFPZXNxWGNwNkhzNjc3VnpRMndXT2svSStYdGRnelJT?=
 =?utf-8?B?dlltaUppaXU5cWFUWFRVNjFML2pDWVNYTzlJdUNJRFBrcXdqMHFSUXROVHpS?=
 =?utf-8?B?TXZJaTBqTlBIUER4VVpwZmxNaWV3bUtlaVFCRFVMNkVpMzJYNVpZM3hxMngx?=
 =?utf-8?B?VEhNcEZLTkRCdXppditUTHI2R2JCcVkwU0lNS1FXWWF1djVSazNyU1pXMjNi?=
 =?utf-8?B?RGloVWdRaDlJVGpwZ3h4czZoN3hmTmNpeW53UG45NFdhMWpSUHNVV3piR2FQ?=
 =?utf-8?B?Qyt1Nko4L2o4Uk4zaFhadndPcy9ybHlLQjREK2VhNCsxVjVyc1hDcUh1NDJU?=
 =?utf-8?B?SmVDQnNjY29QYktMNGVDTXIxY21kWnhGQklIa3ZOY0JrZU9vUGhrR3FLKzNI?=
 =?utf-8?B?bFVMeFlhK2FwS2c4ODNGaE15OFYwdkVndHpPam55dG8waFYzeGpBVHVQK3d1?=
 =?utf-8?B?NTFsQVBWZS9veWc5WFNzSUlEWFZiVjArWStxMjNOSkhmMWNpSFh5MWdQYlBD?=
 =?utf-8?B?S0ROdnhqamRwZU8zWDIwVHJzeEFSeTdEMzBPYnpSRnB2cDF6K2YyZ1dqazVz?=
 =?utf-8?B?T1RqMlhtN3Z3NW0wUnJTNmtLdm1hanZmMUF3Ym5YL1lUT01VSTd2VmszOThM?=
 =?utf-8?B?WVY3VXJvdlpOb3BYZXBaNXR6ZkZRU1BqbEdtVnh4V2puV2hYNjJkNFRHR1g3?=
 =?utf-8?B?TXlZeElsTWp5SkhRcTdCWnc5ZG92aEY2M0lpZTZURVZWeFErbjlTRVJNWVZZ?=
 =?utf-8?B?Q21tUTRFTktBSExlT2JRbXdobm51SmpSY2ZGejdqMEJxdzB0cC95TU1vNUpy?=
 =?utf-8?B?M1pnOVpIekZ6bC9ONEcyZ3Q5Q29CNmZZSi9lWXNKZ2R1L3MzcTBpeFllSDkr?=
 =?utf-8?B?a01aMkVneUkrSWw1SExJWjRsK2hQYk16Zkw1eU5wUkUwQ2RHLy9paWR3Q3Rm?=
 =?utf-8?B?eWd5UHVlYmxpSWc3SlZXRE5hWmUrSTFlM1Qwa2lTMGhwdEZRVG1JRGdjL2Fq?=
 =?utf-8?B?LzZpZ0VVVzJ5Q3NubFcrSUhqaXFieFdZaUovbWw4c0VKbmJmZUFXaWtMd2NU?=
 =?utf-8?B?Qm56a0pWK2t4b2dXMlNqNUFQRUJiYVJ4emFwTmpNSzNlTE1TOEJLTlN6aXdV?=
 =?utf-8?B?c2VRZHA2MERXV1RrN0hpNGlQSDhDcVpseGdSSWgxemNYcUptTlFhbHlWemw1?=
 =?utf-8?B?S1MwdEVYenpQYlg1YmtBempmaVlxMVJtK2RwcGthcm5GVU9sTmhSek1HUDNi?=
 =?utf-8?B?UVpHcFVtb09HWW05RVYxeWVaQUZrc2FneVpDNnQrdVlaUVZmQlRwMzRuUlBZ?=
 =?utf-8?B?eWtVSUgyTlozc09BMHpWZDJMRExsamQvaUJKZkFYOEZiZGR2cUJBNU1NU2hS?=
 =?utf-8?B?MWJsWC80VUpXZFo5a0pTd2M4RmJnNjBuaytwc01MRGNLbzZMUWdRN3A5Qmts?=
 =?utf-8?B?UnJwaG5Wb1JSeUxBRUR1VC9GMWpkbjErM25taFdWa3A3SEc5dVBTZz09?=
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
X-Exchange-RoutingPolicyChecked: Yi0RAwrTAKRsFdic3740dvbZGl6KPR/g7CDr6guzPgVnDrhySYVBAG0O5jvtWWpRvrArl5z5Pyi6gRPtp2zuvQ/crIjWAr6Upyl+KbXt1ywacQqu1miGytcNC5DngHzUxrWmc5zOWOGIMUE7AaWHjFEEsFQFTH6ijaidyAhdQdnFFVsO7khyNPOvBHhorwWzCKcIz2SGnLbmwQ1u1Uq+0TIXayPNt5MSvhwroMyxjR/mOFqUZtvAvBc9uF7XUtQHUSsCfcBXQoFaq3WtRP50CzQAZSfj0PZezulxjj7ABFJX9t2fXfCEf2yqad/AvdQ3xqgvGf0+ZkWDW1h1djGftw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eafd3325-7032-4a7e-0896-08df3f46a273
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 16:21:11.5054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O3UkvFUGxe+ZSnBXzkxCcBm8N3S2YgRNK8MOjUKJKt8pVfFMW8fgGpoOudyG0auPzIMRpP1raGg4R1TUeU1KDPJM7osIvawmNKeOkA9Ij/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB474012
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IHNhc2hpa28tYm90QGtlcm5l
bC5vcmcgPHNhc2hpa28tYm90QGtlcm5lbC5vcmc+DQo+U2VudDogTW9uZGF5LCBOb3ZlbWJlciAy
LCAyMDI2IDU6NDcgUE0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRl
bC5jb20+OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJqZWN0OiBSZTogW1BB
VENIIHYxMyAxNS8xNl0gZHJtL3hlL3ZzZWM6IFJlZmFjdG9yIHBsYXRmb3JtIGNoZWNrDQo+DQo+
VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj5jb25zaWRlcjoNCj4tIFtNZWRpdW1dIGRybS94ZS92
c2VjOiBtaXNzaW5nIHdhaXRfZm9yX2Z3KCkgYW5kIEdVSUQgdmFsaWRhdGlvbiBpbg0KPnhlX3Zz
ZWNfZ2V0X2d1aWQoKQ0KPi0tDQo+DQo+Y29tbWl0IGZkNzYxNjhiMTkzYmM1NmJhODNiNWM5NWU2
ZjhiZTY2ZjU1OTdiMjYNCj5BdXRob3I6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxA
aW50ZWwuY29tPg0KPg0KPmRybS94ZS92c2VjOiBSZWZhY3RvciBwbGF0Zm9ybSBjaGVjaw0KPg0K
PlRoaXMgY29tbWl0IGNvbWJpbmVzIHRoZSBwbGF0Zm9ybSBjaGVja3MgaW4geGVfZGVidWdmc19y
ZWdpc3RlcigpIHNvIHRoYXQNCj5ib3RoIGRlYnVnZnNfcmVzaWRlbmNpZXMgYW5kIHBjb2RlX2lu
Zm9fZGVidWdmcyBhcmUgcmVnaXN0ZXJlZCBvbg0KPkJhdHRsZW1hZ2UNCj5hbmQgQ3Jlc2NlbnQg
SXNsYW5kIFBGIGRldmljZXMuDQo+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RlYnVnZnMuYw0KPmIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPj4gaW5k
ZXggYjU2ZTRhYWQ0MDY5Ni4uNWE4MmY4ZWFiMmM2NiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZWJ1Z2ZzLmMNCj4+IEBAIC03MDIsMjMgKzcwMiwyMiBAQCB2b2lkIHhlX2RlYnVnZnNfcmVnaXN0
ZXIoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+PiAgCQkJCSBBUlJBWV9TSVpFKGRlYnVnZnNfbGlz
dCksDQo+PiAgCQkJCSByb290LCBtaW5vcik7DQo+Pg0KPj4gLQlpZiAoeGUtPmluZm8ucGxhdGZv
cm0gPT0gWEVfQkFUVExFTUFHRSAmJiAhSVNfU1JJT1ZfVkYoeGUpKSB7DQo+PiAtCQlkcm1fZGVi
dWdmc19jcmVhdGVfZmlsZXMoZGVidWdmc19yZXNpZGVuY2llcywNCj4+IC0JCQkJCSBBUlJBWV9T
SVpFKGRlYnVnZnNfcmVzaWRlbmNpZXMpLA0KPj4gLQkJCQkJIHJvb3QsIG1pbm9yKTsNCj4+IC0J
fQ0KPj4gLQ0KPj4gIAkvKg0KPj4gLQkgKiBQY29kZSB2ZXJzaW9uIHJlYWQgZnJvbSBQTVQgaXMg
Y3VycmVudGx5IG9ubHkgc3VwcG9ydGVkIG9uIENSSSBhbmQNCj5CTUcgcGxhdGZvcm1zIGluIFBG
DQo+PiAtCSAqIG1vZGUsIGFzIGJvdGggcGxhdGZvcm1zIHN1cHBvcnQgdGhlIG5lY2Vzc2FyeSB0
ZWxlbWV0cnkgcmVhZA0KPm1lY2hhbmlzbSBhbmQgaGF2ZSBhIGZpeGVkDQo+PiAtCSAqIFBVTklU
X1ZFUlNJT05fT0ZGU0VULg0KPj4gKwkgKiBSZXNpZGVuY2llcyBhbmQgUGNvZGUgdmVyc2lvbiBy
ZWFkIGZyb20gUE1UIGlzIGN1cnJlbnRseSBvbmx5DQo+c3VwcG9ydGVkIG9uIENSSSBhbmQgQk1H
DQo+PiArCSAqIHBsYXRmb3JtcyBpbiBQRiBtb2RlLiAgQm90aCBwbGF0Zm9ybXMgc3VwcG9ydCB0
aGUgbmVjZXNzYXJ5DQo+dGVsZW1ldHJ5IHJlYWQgbWVjaGFuaXNtDQo+PiArCSAqIGFuZCBoYXZl
IGEgZml4ZWQgb2Zmc2V0cyBmb3IgdGhlIHJlcXVpcmVkIGRhdGEuDQo+PiAgCSAqIEF0dGVtcHRp
bmcgdGhpcyBhY2Nlc3Mgb24gb3RoZXIgcGxhdGZvcm1zIG11c3QgYmUgdmVyaWZpZWQgYmVmb3Jl
DQo+ZW5hYmxpbmcgc3VwcG9ydC4NCj4+ICAJICovDQo+PiAgCWlmICghSVNfU1JJT1ZfVkYoeGUp
ICYmDQo+PiAtCSAgICAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfQ1JFU0NFTlRJU0xBTkQgfHwg
eGUtPmluZm8ucGxhdGZvcm0gPT0NCj5YRV9CQVRUTEVNQUdFKSkNCj4+ICsJICAgICh4ZS0+aW5m
by5wbGF0Zm9ybSA9PSBYRV9DUkVTQ0VOVElTTEFORCB8fCB4ZS0+aW5mby5wbGF0Zm9ybSA9PQ0K
PlhFX0JBVFRMRU1BR0UpKSB7DQo+PiArCQlkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMoZGVidWdm
c19yZXNpZGVuY2llcywNCj4+ICsJCQkJCSBBUlJBWV9TSVpFKGRlYnVnZnNfcmVzaWRlbmNpZXMp
LA0KPj4gKwkJCQkJIHJvb3QsIG1pbm9yKTsNCj4+ICsNCj4+ICAJCWRybV9kZWJ1Z2ZzX2NyZWF0
ZV9maWxlcyhwY29kZV9pbmZvX2RlYnVnZnMsDQo+PiAgCQkJCQkgQVJSQVlfU0laRShwY29kZV9p
bmZvX2RlYnVnZnMpLA0KPj4gIAkJCQkJIHJvb3QsIG1pbm9yKTsNCj4+ICsJfQ0KPg0KPltTZXZl
cml0eTogTWVkaXVtXQ0KPldpdGggZGVidWdmc19yZXNpZGVuY2llcyBub3cgZXhwb3NlZCBvbiBY
RV9DUkVTQ0VOVElTTEFORCBhbG9uZ3NpZGUNCj5wY29kZV9pbmZvX2RlYnVnZnMsIHdoYXQgaGFw
cGVucyBpZiB1c2Vyc3BhY2UgcmVhZHMgZGdmeF9wa2dfcmVzaWRlbmNpZXMsDQo+ZGdmeF9wY2ll
X2xpbmtfcmVzaWRlbmNpZXMsIG9yIHBjb2RlX2luZm8gd2hpbGUgT09CTVNNIGZpcm13YXJlDQo+
aW5pdGlhbGl6YXRpb24gKGNyaV9sYXRlX2JpbmRfcHJvYmVfd29yaykgaXMgc3RpbGwgcGVuZGlu
ZyBhZnRlcg0KPnhlX3ZzZWNfaW5pdCgpPw0KPg0KPkluIHJlYWRfcmVzaWRlbmN5X2NvdW50ZXIo
KSAoYW5kIHhlX2dldF9wY29kZV92ZXJzaW9uKCkpLCB4ZV92c2VjX2dldF9ndWlkKCkNCj5pcyBj
YWxsZWQgYmVmb3JlIHhlX3BtdF90ZWxlbV9yZWFkKCk6DQo+DQo+ZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RlYnVnZnMuYzpyZWFkX3Jlc2lkZW5jeV9jb3VudGVyKCkgew0KPglyZXQgPSB4ZV92c2Vj
X2dldF9ndWlkKHhlLCAmZ3VpZCk7DQo+CWlmIChyZXQpIHsNCj4JCWRybV93YXJuKCZ4ZS0+ZHJt
LCAiUE1UIGRldmljZSBpcyBub3QgYXZhaWxhYmxlOiAlZFxuIiwgcmV0KTsNCj4JCXJldHVybjsN
Cj4JfQ0KPg0KPglyZXQgPSB4ZV9wbXRfdGVsZW1fcmVhZCh4ZS0+ZHJtLmRldiwgZ3VpZCwgJnJl
c2lkZW5jeSwgb2Zmc2V0LA0KPnNpemVvZihyZXNpZGVuY3kpKTsNCj59DQo+DQo+VW5saWtlIHhl
X3BtdF90ZWxlbV9yZWFkKCksIHhlX3BtdF9yZWFkX3JlZygpLCBhbmQgeGVfcG10X3dyaXRlX3Jl
ZygpLA0KPndoaWNoDQo+YWxsIGNhbGwgd2FpdF9mb3JfZncoeGUpIGJlZm9yZSBzZXR0aW5nIHRo
ZSBTb0MgcmVtYXBwZXIgaW5kZXggYW5kIHJlYWRpbmcNCj50aGUgUE1UIHdpbmRvdywgeGVfdnNl
Y19nZXRfZ3VpZCgpIGFjY2Vzc2VzIENSSV9QVU5JVF9URUxFTUVUUllfR1VJRA0KPndpdGhvdXQN
Cj53YWl0aW5nIGZvciBmaXJtd2FyZSByZWFkaW5lc3Mgb3IgdmFsaWRhdGluZyB0aGUgcmV0dXJu
ZWQgR1VJRDoNCj4NCj5kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jOnhlX3ZzZWNfZ2V0X2d1
aWQoKSB7DQo+CS4uLg0KPgljYXNlIFhFX0NSRVNDRU5USVNMQU5EOg0KPgkJeGUtPnNvY19yZW1h
cHBlci5zZXRfdGVsZW1fcmVnaW9uKHhlLA0KPkNSSV9JRFhfVEVMRU1fRElTQ09WRVJZKTsNCj4J
CSpndWlkID0geGVfbW1pb19yZWFkMzIobW1pbywNCj5DUklfUFVOSVRfVEVMRU1FVFJZX0dVSUQp
Ow0KPgkJYnJlYWs7DQo+CS4uLg0KPgkvKiB0aGUgR1VJRCBpcyBzdGF0aWMsIHJlYWQgb25jZSBh
bmQgY2FjaGUgZm9yIGFsbCByZXF1ZXN0cyAqLw0KPglpZiAoKmd1aWQpDQo+CQl4ZS0+cG10LnB1
bml0X2d1aWRfY2FjaGUgPSAqZ3VpZDsNCj59DQo+DQo+SWYgQ1JJX1BVTklUX1RFTEVNRVRSWV9H
VUlEIHJlYWRzIGFzIDAgYmVmb3JlIGZpcm13YXJlIGlzIHJlYWR5LA0KPnhlX3ZzZWNfZ2V0X2d1
aWQoKSByZXR1cm5zIDAgd2l0aCAqZ3VpZCA9PSAwLCBhbmQgeGVfcG10X3RlbGVtX3JlYWQoKSB0
aGVuDQo+ZmFpbHMgeGVfZ3VpZF9kZWNvZGUoKSB3aXRoIC1FTk9ERVYgYmVmb3JlIHJlYWNoaW5n
IHdhaXRfZm9yX2Z3KHhlKS4gSWYgdGhlDQo+dW5yZWFkeSByZWdpc3RlciByZXR1cm5zIGEgbm9u
LXplcm8gYm9ndXMgdmFsdWUgKHN1Y2ggYXMgMHhmZmZmZmZmZiksDQo+eGVfdnNlY19nZXRfZ3Vp
ZCgpIGNhY2hlcyBpdCBpbiB4ZS0+cG10LnB1bml0X2d1aWRfY2FjaGUsIHBlcm1hbmVudGx5DQo+
YnJlYWtpbmcgc3Vic2VxdWVudCB0ZWxlbWV0cnkgcmVhZHMgZm9yIHRoZSBsaWZldGltZSBvZiB0
aGUgZGV2aWNlLg0KPg0KPlNob3VsZCB4ZV92c2VjX2dldF9ndWlkKCkgY2FsbCB3YWl0X2Zvcl9m
dyh4ZSkgYW5kIHZhbGlkYXRlIHRoZSBHVUlEIGJlZm9yZQ0KPmNhY2hpbmcgaXQgaW4geGUtPnBt
dC5wdW5pdF9ndWlkX2NhY2hlPw0KDQpObywgdGhlIHB1bml0IGd1aWQgaXMgYXZhaWxhYmxlLiAg
d2FpdF9mb3JfZncoKSBpcyBmb3IgdGhlIE9PQk1TTSBwYXRoLg0KDQo+DQo+LS0NCj5TYXNoaWtv
IEFJIHJldmlldyDCtw0KPmh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEwMjIy
MTMxNC4xMTkwMjgtMTgtDQo+bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tP3BhcnQ9MTUNCg==
