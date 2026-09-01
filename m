Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D23D386578
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 05:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788239434; cv=fail; b=OkwtrwJzdgEi12MhOPDvaUBcNKIWZwZ8sQzIUs3lLssWwTVjdNz+PdK+/8asBIUr3UZTjyfmKB396ClLP7ZDrpHcTjZtZrpLJJy6/xRKb1HAPuxYzuMtAhHzFliLesVrScOsiePpmSUuynsA+pDVL+tMFWtKfVWYhpe5OFacKNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788239434; c=relaxed/simple;
	bh=EVzsgizL3ugzH/ov1nrFM5UGO+awO0k7iRisbxxDyms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MMn26RqhoXo4+P1116YWXrPoLpsRvLaeEm8MEfLIDr5STDyJMfnDX0nDoKGhg35igukHgZvh6UtwPfFdUYCi+EyVemiOaxaF334OuHf4xvT1YkNCrXp378ExChNb3qy4DwonhVNjxmlJh0lR7P+vyf7HhGKtT9bNu+vRoBmC0Rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVFcDrri; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVFcDrri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788239432; x=1819775432;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EVzsgizL3ugzH/ov1nrFM5UGO+awO0k7iRisbxxDyms=;
  b=HVFcDrriaZmaK52nYQ8kL3iEEAi1ILtg18tMXvgS/dxGkR/7du0O+Pyg
   ql/wyPCIRxhKqdYruS5W2gnAcgY5anVQLsbRzpYvjgF35PFHcZiqy6GDN
   CR7XxMwwTO7pHApuXZR4loAQQKr16wP94c8YzY4WHMH4tLtmTbTS/fKa/
   bx8UM8PCStcT3BAnJIY5WHTBmaNGRocCjxOyMdHDQjh2oqYGfb2Z6qK97
   khRLZbSxF0wprsWlpcgt3gFpNLUZSUUaAf3N42R5c5OeP29o6SagL+PUN
   8D/9ToEJ6G7FRHSNQzChRfmYyGp7Bvmhu4wjpt7+PTirf9n4rajp+fDiv
   Q==;
X-CSE-ConnectionGUID: Ki8o9fXqTLe6bnb1aHc73w==
X-CSE-MsgGUID: 2Qr6c5D4R2e9H944qCoItg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="100009474"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="100009474"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 22:10:31 -0700
X-CSE-ConnectionGUID: RN5RKmZ/QGmy4Nj9qCTQJw==
X-CSE-MsgGUID: gbt5tXZtQ3WL6wwg2y6d1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="269571410"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 22:10:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 22:10:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 22:10:30 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 22:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAQp+C/EcbVlp2vA1dwS7XUE176oYKcIJJT+2WO+pR+SVBPrSt5EnLgKSELCDBmcALnF76RPaAFIkAMZajSgz25rUZYBChKmm4WsUr/qqKMjFKDg/jEUUV5Edi2lqoRBXnCDo2ZOcLbW2/ElFffa/h7AryLSXN4okEfcN7/AMSxbyqoy4hQ5B0ge+SaZJ/2xfxoYvjKt6uJPuk35bd4TtBZloX5pbmfK4pnjZ4hGTvo12aubXs2rlR7R+u+zpJTNleOsgPo6azbryOkx4kbdHFBu/UcdBxVxWmBsZ0GuZQi/mlsFIIyX4sZwYzjJlYvegUHDrrF3W6n5fMqYD3lZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVzsgizL3ugzH/ov1nrFM5UGO+awO0k7iRisbxxDyms=;
 b=hKfkTiEjM0loUaybNL/NthFbJITZX3VQ5J5zhyJUWhmXi3tggKvtpimEW/s0CutcvhOBTCsUONLhIdPs/R7LfRn8j9UCNt9p4k8CM0eRyFCtMtTZxEjNLrY69Z4NEVnwAa9NZBcE7FukS/zXRhfXIGiHMJ/4+SmvUu+6OcZOqT/4aT7LcwqSGupcZmlS6/DIJ+NcFXlVBQgnWFyasmsuX1dFW86NjxkWX0c5bQcu/gMCp1iFBaj/HAhoL6xBfIJaHo1AWvGk7V9VV5FTQaHNpR/aSVqPjqTmimXewKrfEINlxf+1qjVlPeUUzt7xjxoJLRtnr1pTaop0fzF4WX0myw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA2PR11MB5052.namprd11.prod.outlook.com (2603:10b6:806:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 05:10:22 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 05:10:22 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V19 07/15] drm/xe/vram: Extract buddy alloc and free
 helpers
Thread-Topic: [PATCH V19 07/15] drm/xe/vram: Extract buddy alloc and free
 helpers
Thread-Index: AQHdORUFknIfl7txiUyN9SFDmHxT3La3zbuAgAFgM0A=
Date: Tue, 1 Sep 2026 05:10:22 +0000
Message-ID: <DS0PR11MB87183C69315E6A7DCCBFBF2381A82@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-24-tejas.upadhyay@intel.com>
 <20260831080848.30F171F000E9@smtp.kernel.org>
In-Reply-To: <20260831080848.30F171F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA2PR11MB5052:EE_
x-ms-office365-filtering-correlation-id: fe0f3141-7433-4265-cb31-08df07e75370
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: 4hPs6LNAhnejkwyVCkMf01U/NcnB09oepw3VD264fY8pYS2OJryaYeiNRO8j6ILdbL6RV9IDnu1mi//1KV1nh5h6csAdUcWapt9OKkawz2I2XQfgZIkRdUhF+MpwqHpp7lHBKHKu9um23G70W5602AI7pwBpkd4pWIYbPxOUsUuEKC+B+zZ9c7LvkyCzu4hitOb+oxrnX2Of45f8fLvBEb6phgu/FSI3gvBO42N4z/t3TE3XS2kh3RoIwWHtpFcXOEY4Fgr7vnQPpFgq2q3NYmtjl7TnKd3TYGiq7xfXwx+POrwCskAi07WpSmAjdAm6Z7GREvWA9GRBV1NVpPtNrBxtbNYbxZ3EGk084F2OiIPE82TYGiMwZFQ2av65jIpce2OxKdFIY8ZD9NDEkmAmvLggqDAKKtYKHSv5Efw3v2pt6+bzmaccLA2Hi5IwS9s3eLRVT/4X9H9Q0heB9xOpANx3m21xFU+c02lYM6EF5jy0O2kemroovzhjeG7P4Q+BIBgKuMOKkCp6CZIQLK1PZbAE5wEouan0jy20hmGX+ON0H3qIf9aolGQ/ymrVNiusLc1lJLwJfa+YHvZUjrLaXCO8i1OhccXQ8aI8xvZJzKZgTBoI6Fvl2JEKb1CaobPlYsYSOxt4iMxYDdUyITxnX/S+K+v4bt6XbgPJb/iaml0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVA5bTQrNm9naDBWdElVUEdYOWcrWWkzOVVuNWpycjRBRXArTk0vbloxK0Zl?=
 =?utf-8?B?U2dZSUFxMEcyeGpCNytXRDlvY2tpbHlwMkxwS0JLZVFqYm95eS9EVTU0aEZW?=
 =?utf-8?B?NzliaGRaM1FaMXJhUmpPTS9qSGVwWitZQW5xeithRk9qbE5OWFlBZGE0bWx3?=
 =?utf-8?B?WXpDaTNNN0Y4TlJlUTJaYm15RWk4TkwycHo1ZVZNQmorTFJRSTdONkd3ZjJa?=
 =?utf-8?B?cExVemtyS00zNWE4VXpINkNMNDVGaXhsbE5sY2VrYUY0MDR3bnhHSS9CMVF1?=
 =?utf-8?B?SFBkVzJDZjJrOXREUDNvYnZ3Y1JmS0N0bGZzcnZXYm9ZMWt3QW44Y0N0WVYy?=
 =?utf-8?B?bmtDUFRuMFpRVEllVm44aHdGNjd3R1QyNlI3L09OdlFpeCtyOXNqYnB4RUt1?=
 =?utf-8?B?LythYzZmTEVRUHlRRlBlYXhpRlFBK2pUSThRaEVPMXhSVGlrUjRPQk8xVngx?=
 =?utf-8?B?OU9RUnp3NndOR3A2dUYyY0hHM0oraVBjaVlKN0ZQa0IvRndPTmpvNm04Qjdn?=
 =?utf-8?B?TEF4Uzh4cFU5ZnZhdlB6VXdTU0FyTzF4UVB0RjNJTm9xS3JzYktnWVN1dUFm?=
 =?utf-8?B?MHdseUpJZWx6YkNLL1QyKzNGL3dobUMvNDMxME44SjB3QnNPMW5SeUJxeGJD?=
 =?utf-8?B?b3FGVjFnN1p3Y2V0c3dyeFEyQWsvaTNFOHJaNFZEa3o5WVE4RWlLRjh1TFlj?=
 =?utf-8?B?eEt1ajZwMzMrUGxXREVJV3BhNk80alB2NVRWK1NKYVYzOTA2K3hKeE5FZGpK?=
 =?utf-8?B?K1VBeVdObzN0emVyOUhlcEU4UDRKSS9yUGg4ck9lZWZTUlpyaDl2dThIdU9w?=
 =?utf-8?B?Vi9nNGF1SUVSNlcwNWtZTFJlejdBVFBxRzd6ckRCc0ZvZTlxV3kvaTdmc09G?=
 =?utf-8?B?RTdBSldBbllENmx4NjBUQitQc2s5blBFR1ZKMEhRaXRYaXQraEczbkJhejNZ?=
 =?utf-8?B?bUtWYzR0ZXVHZ1V4YW5sOG9md0xZU3c1QlNiYWVuV1VtUjhySUZNb0RKUGUz?=
 =?utf-8?B?TWE2OGpIRFZjR3dNL0IrZHB2eHl0Zlh4ZFdaVGwzL3JPZTNFZ1l5WUNhZFJL?=
 =?utf-8?B?N2s3M0VvaURuQU1PenJNSDljZVJ5WkdWdWVGVzV2MnhjV2F6Z2lWeFR1VVdr?=
 =?utf-8?B?UklQakhHbVBINStwQ2txTmdNVDZuM2xoOUpUR04ycXRLeDluVjV0bjFIUGU2?=
 =?utf-8?B?SlRnbW11QWVZQithUGRpb2FZM2dWLzBxY0k0TTUzZ0F6RHdseW5DYnA1LzZV?=
 =?utf-8?B?RW00aElpOXhxNXpDNEFvVldNa3JwNGhrUmRwN2xBQUR6SEVnRVZmbVk0WTFK?=
 =?utf-8?B?cWpjR3Vzd2o3TUI4SFFOU0dPSDFiTjBYTE4wTGdBTDNuQ0FVVkN6R0YzNmw4?=
 =?utf-8?B?L2gvNHpRZTYrMXkzM1AyN1paY1lUSmFpK0REWWs5MDltNW9nVTYxeG0xaWdm?=
 =?utf-8?B?TTE5bzVYa3pRbUtsMk10TXRTbGU0NDNNN3BqdnJCVkhUcTU3WGUyazFuNkRw?=
 =?utf-8?B?ZDA0TUtSN0JiS1JEN2lTSGI1c3VoWlpnVE1RT29HVEJHcTVqRTRpakRGeURv?=
 =?utf-8?B?dElHeSttTDJvUW1LRGNFZTIrMUFRZU55OTZXb09zL29aNmhOcHpobUZjOGVB?=
 =?utf-8?B?bWRDcW9BVTFKa1NjOTlyZld5ZkN2Z1cvRXhyMjFkUkE2RkdCeE1RT2JMSnBj?=
 =?utf-8?B?VEFva2JkYzdqMUFKdWRVdFdYZEFOaGxjZFY0cXdvWTJQSExFQXNyWWUzK1VO?=
 =?utf-8?B?L1V4TmdJMUFCaGdORmw0VUNDM2diNy9yb1lYbk5kTnc1UmN2a0FNaHBlMGJM?=
 =?utf-8?B?aFU3SzFSMXdTZlBUNzRuRDZBNUVpQXcvZXpNNzJkaUNhRDBWM25oaWkrMFI4?=
 =?utf-8?B?bkd4ODByay9TL1FGdW5FMm9zSVZpclBmU3V1Y0JDQzNhNGQvSUszUzYzUlov?=
 =?utf-8?B?eDRHTk9QSVpqMTE0aDErelIrMzdDV3RoSnhIWVhvSlQxWmJhdTlIeXMraDNx?=
 =?utf-8?B?VWRjdFhPajZaKzRjTmEwckV4RG55NVhIUzNMaHczc1h2SGVSUGppdExoNGlh?=
 =?utf-8?B?WVlFN2hkZysydEwrdW96eUtUQWlhcUtNV2FkTlJtSFZYN0V0SHFpSHZ6cmdx?=
 =?utf-8?B?b0ZGaDBvakxMTVQya3VsWXloQi93eThNR0pqWlVLOUxkVlJOY01IbmhOdHRO?=
 =?utf-8?B?Q2x5eTUyamt2YmRDZzE5MG44eUtxaURDSEJNYU53S2I0cm5LeW9WYkZhTXQ3?=
 =?utf-8?B?MWEzNUZvd3VSc0p0SndwR3Y5MmMvZnlDMU5BWkdweVNDdUpzZUdrbmdZUXhz?=
 =?utf-8?B?aE9iRlNJV1cxSWVyV0M5QTduc2pTVzVhN3JDTGFMTWNNOXBieU9Ldz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rhHVR2OfMF31lpXwTnGhPy8wzNz/pC2ZguQsSPBrmFP6SUOjdFPcqEgkE8R2Gf0zbB6gu0NDlmkhMcfrfX3NilhIINtgAUnkBKoKxH3hxt9IqVpRdrnNhKBN3NpLDUTobxzgG8NfBscmg0oxZ5FaVv1P6DzWZJWlnfIZlsFR1VjMH9l52QAJOeplezxYOMIbzcRYvmhZZ2Gp0INo98TV3c0brMQBg23/j4W0S8AO2FJ8lSpddQ6WGNi00TqutgrjgcVpnpLxsIk/5iYRCo9I2uoXxb0jakJO7I9PuFz/jRV0Qp0k1EKHekMN5Rl9BReNbUjEN1OjIhpviW0iuh3W9Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0f3141-7433-4265-cb31-08df07e75370
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 05:10:22.8203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3tjydtlqkUJA9NqNkJACfdqfaQP2kGX8mbHHYfXh3lqwQBxGxrXou3e/vKwYpXV2znruGjDV8s783OBWZxaw0Dyk8UEw4GlW0n9ocJ+cHUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5052
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMzEgQXVndXN0IDIwMjYg
MTM6MzkNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0K
PiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggVjE5IDA3LzE1XSBkcm0veGUvdnJhbTogRXh0cmFjdCBidWRkeSBhbGxvYyBhbmQgZnJlZQ0K
PiBoZWxwZXJzDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtv
IEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKQ0KPiB0byBjb25zaWRlcjoNCj4g
LSBbTWVkaXVtXSBVbmluaXRpYWxpemVkIG91dHB1dCBwYXJhbWV0ZXIgYHVzZWRfdmlzaWJsZWAg
aW4NCj4gYHhlX3R0bV92cmFtX2J1ZGR5X2FsbG9jKClgLg0KPiAtLQ0KPiANCj4gY29tbWl0IDk0
ODNjYWViOWFlYTljMDQ1ODBiZGQwNzFlNTY1YzAxNThmNjgwZmENCj4gQXV0aG9yOiBUZWphcyBV
cGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiANCj4gZHJtL3hlL3ZyYW06IEV4
dHJhY3QgYnVkZHkgYWxsb2MgYW5kIGZyZWUgaGVscGVycw0KPiANCj4gVGhpcyBjb21taXQgZmFj
dG9ycyBvdXQgYmxvY2sgYWxsb2NhdGlvbiBhbmQgZnJlZWluZyBpbnRvIHJldXNhYmxlIGhlbHBl
cnMNCj4geGVfdHRtX3ZyYW1fYnVkZHlfYWxsb2MoKSBhbmQgeGVfdHRtX3ZyYW1fYnVkZHlfZnJl
ZSgpLiBUaGVzZSBoZWxwZXJzDQo+IGNvbnNvbGlkYXRlIGJsb2NrIGFsbG9jYXRpb24gd2l0aCB2
aXNpYmxlLXNpemUgdHJhY2tpbmcgZm9yIHVwY29taW5nIFZSQU0gcGFnZQ0KPiBvZmZsaW5lIHJl
c2VydmF0aW9uIHBhdGhzLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3R0bV92cmFtX21nci5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1f
bWdyLmMNCj4gPiBpbmRleCA1MWU5ODNlZTNiYWQ0Li4xNmVjZWE0OTc3ODA5IDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3IuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3IuYw0KPiBbIC4uLiBdDQo+ID4gK3N0YXRp
YyBpbnQgeGVfdHRtX3ZyYW1fYnVkZHlfYWxsb2Moc3RydWN0IHhlX3R0bV92cmFtX21nciAqbWdy
LCB1NjQNCj4gc3RhcnQsDQo+ID4gKwkJCQkgICB1NjQgZW5kLCB1NjQgc2l6ZSwgdTY0IG1pbl9w
YWdlX3NpemUsDQo+ID4gKwkJCQkgICBzdHJ1Y3QgbGlzdF9oZWFkICpibG9ja3MsIHVuc2lnbmVk
IGxvbmcgZmxhZ3MsDQo+ID4gKwkJCQkgICB2b2lkICpwcml2LCB1NjQgKnVzZWRfdmlzaWJsZSkg
ew0KPiBbIC4uLiBdDQo+ID4gKwlpZiAoZW5kIDw9IG1nci0+dmlzaWJsZV9zaXplKSB7DQo+ID4g
KwkJKnVzZWRfdmlzaWJsZSA9IHNpemU7DQo+ID4gKwl9IGVsc2Ugew0KPiA+ICsJCWxpc3RfZm9y
X2VhY2hfZW50cnkoYmxvY2ssIGJsb2NrcywgbGluaykgew0KPiA+ICsJCQl1NjQgYmxrX3N0YXJ0
ID0gZ3B1X2J1ZGR5X2Jsb2NrX29mZnNldChibG9jayk7DQo+ID4gKw0KPiA+ICsJCQlpZiAoYmxr
X3N0YXJ0IDwgbWdyLT52aXNpYmxlX3NpemUpIHsNCj4gPiArCQkJCXU2NCBibGtfZW5kID0gYmxr
X3N0YXJ0ICsNCj4gZ3B1X2J1ZGR5X2Jsb2NrX3NpemUobW0sIGJsb2NrKTsNCj4gPiArDQo+ID4g
KwkJCQkqdXNlZF92aXNpYmxlICs9IG1pbihibGtfZW5kLCBtZ3ItDQo+ID52aXNpYmxlX3NpemUp
IC0gYmxrX3N0YXJ0Ow0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IERvZXMgdGhpcyBhY2N1
bXVsYXRlIGludG8gYW4gdW5pbml0aWFsaXplZCB2YXJpYWJsZT8NCj4gDQo+IEluIHRoaXMgZWxz
ZSBicmFuY2gsICp1c2VkX3Zpc2libGUgaXMgaW5jcmVtZW50ZWQgdmlhICs9IHdpdGhvdXQgYmVp
bmcgZXhwbGljaXRseQ0KPiB6ZXJvZWQgZmlyc3QuIElmIGEgY2FsbGVyIGRvZXMgbm90IGV4cGxp
Y2l0bHkgaW5pdGlhbGl6ZSB0aGUgbWVtb3J5IHBvaW50ZWQgdG8gYnkNCj4gdXNlZF92aXNpYmxl
IGJlZm9yZSBjYWxsaW5nIHhlX3R0bV92cmFtX2J1ZGR5X2FsbG9jKCksIHRoaXMgd2lsbCBhY2N1
bXVsYXRlDQo+IGdhcmJhZ2UgdmFsdWVzIGFuZCBjb3JydXB0IHRoZSBWUkFNIHZpc2libGUgbWVt
b3J5IGFjY291bnRpbmcgaW4gbWdyLQ0KPiA+dmlzaWJsZV9hdmFpbC4NCj4gDQo+IFdoaWxlIGN1
cnJlbnQgY2FsbGVycyBzZWVtIHRvIHBhc3MgcG9pbnRlcnMgdG8gemVyby1hbGxvY2F0ZWQgbWVt
b3J5LCBjb3VsZA0KPiAqdXNlZF92aXNpYmxlIGJlIGV4cGxpY2l0bHkgaW5pdGlhbGl6ZWQgdG8g
MCBiZWZvcmUgdGhlIGxvb3AgdG8gcHJldmVudCBhIHRyYXAgZm9yDQo+IGZ1dHVyZSBjYWxsZXJz
Pw0KDQpEb27igJl0IHNlZSB0aGlzIGFzIGlzc3VlLCBzZWUgYmVsb3cgOg0KQ2FsbGVyIDEgKHhl
X3R0bV92cmFtX21ncl9uZXcpOiB2cmVzIGlzIGFsbG9jYXRlZCB3aXRoIGt6YWxsb2Nfb2JqKCkg
4oaSIHZyZXMtPnVzZWRfdmlzaWJsZV9zaXplIGlzIHplcm8taW5pdGlhbGl6ZWQuDQpDYWxsZXIg
MiAmIDMgKHBhZ2Ugb2ZmbGluZSk6IG5lbnRyeSBjb21lcyBmcm9tIGt6YWxsb2MgKG9yIHNpbWls
YXIpIOKGkiBuZW50cnktPnVzZWRfdmlzaWJsZV9zaXplIGlzIGFsc28gemVyby1pbml0aWFsaXpl
ZC4NCg0KVGVqYXMNCg0KPiANCj4gPiArCQkJfQ0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiArDQo+
ID4gKwltZ3ItPnZpc2libGVfYXZhaWwgLT0gKnVzZWRfdmlzaWJsZTsNCj4gPiArCXJldHVybiAw
Ow0KPiA+ICt9DQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtw0KPiBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MzEwNjQ5NDIuMzE1NzIwLTE3LQ0KPiB0ZWphcy51
cGFkaHlheUBpbnRlbC5jb20/cGFydD03DQo=
