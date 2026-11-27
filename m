Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795756491;
	b=TzaxcIMoIdbkHJGQ0/E9HVdntgSn3KwQmxXsfnWMtK0yH+5bE8P7GPnAil7LvtLmY6tH
	 nKmDaEvkX7k59TGczalURsEAw9doYWY0mFERUQ1pUmxO/cDZUoOyU7p8welCvVE24aXFa
	 i3PN5koTSPFhZRZg46suscCGhhwLwlYJZUx1xIi6ZDhh/0/8JM3B0Vxqe7jyH+G0a3z+A
	 DL/kfbl91rRG9Ia+gGYN82ZaS2YuttWGt+cTJkKb0PWwiQU5fL7P88AnWzZMEQf0IfuRe
	 QlGvKBGy3/cwv7HByrevZj+juaEFA08V/5xAiGt80nRLUxejX8rS7H1/bpJpd1b8smw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756491;
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
	bh=00ff13m5Z+voOLNuZkmxW235O1NDdI8MflM9Sat7taw=;
	b=YAhBDZNHa+AtlK7ExsP3meCh+dpnxSy43h/uX24nRf9/HR5cIS1xFRYNVht98Tcn2Gmu
	 4U9UrM5lkhN+Zv1NTzrPy5gjmoBrXaT5hNOHngNiC+RHsRHO731sA65nlGdFSRnwpkmkW
	 ULMieQVB61YUaAr8DWN6G7TEXR7KiUz+XQXjvmm7dP0SJuLTTLRVp7/32NEml51WH5iuW
	 /WYLGEeo/TDpum/vSgsEkauLYCaLOLbpDRBORqQ4uPQ7bcACwq3s+EZ/AdQm7NevJ9Xea
	 bFrgoyt54PIvp2uLQqkt1Bvh0z514k4rQlOXwnjOCtJXUC8AsXRs6OGp2L2oe8TZz7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LGZBbb9c;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ALh0NNgq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C2B606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 05:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C2B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LGZBbb9c;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ALh0NNgq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795756491; x=1827292491;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=00ff13m5Z+voOLNuZkmxW235O1NDdI8MflM9Sat7taw=;
  b=LGZBbb9cEGxR+Wy9WDIahHqMefYjLzHX3JS3wQf4vJ2cRS0MT0pIH0LX
   1W3D3+y9ZpuFSVvntR+cFUllhIqJoxzpE5q3WkPW1ZzGp6OkaafBCw0V6
   LNHThCOk4BGQIvcGRt+T8tdh1UOhfTViujmSN0E5e5VKwOuBmMMY9WozP
   OuiOEBk9yWc/v9n3BPkdOYva07LdinvAD6lUjokc9/EybXH/Th4cBE/RT
   WBw1/PnxH4i5QpqPUnTkssEWhAxlpfVmnln5sw+ezH8fHWnqHZqE+HSpv
   CmpjE6eSe187FryIWiS0qC3ex5j2qba23evTXmSntq/+E0nV5yqYIZc3I
   A==;
X-CSE-ConnectionGUID: NVRQntUdQme9hr7pQqAjgA==
X-CSE-MsgGUID: 2OE/dM7pS96YwKGNZdezOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4677833"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4677833"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 21:14:50 -0800
X-CSE-ConnectionGUID: uNNaOdWfSHCCmHwVMvaqLQ==
X-CSE-MsgGUID: Ely1aHX7Qtq3KJg1iBMv6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12548851"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 21:14:49 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:14:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 21:14:49 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:14:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zcy3uCFOXbA+Uv6p/wNHKpgWv9tGtlmbndqcBrhLzhJR7Urs1MEP5XqlEiW8BCJ7ltPrVOKccjetp4cV7NvCsqfcn67SoNgF+CRA3ch2WdC6MiWNWuLHGsGqNkIQTC/jrMoumQaR7D9qI7luRIXLYf/xrgO74Si4hzz7ShoHem0H8lgsfOxdzvzaHvZszkxsqEp2EVs6dJiOYE1Te0P3jMyxEcyqpfNpcV68BrZMlWVq6oI8YDUw2cMxUXebO+1QcPMiGS3sXD+LnHuF91xZ92yYz/1xIjVcc1ZXpPaAzA/o0XfirgLxVSZOQbcWrEorj3cj0gQphnkMU0NLq78mWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00ff13m5Z+voOLNuZkmxW235O1NDdI8MflM9Sat7taw=;
 b=UI6ATu75PCl/uGvg7lFRVFNJtRDAvLhcx+JBYq8Zc2f3xHd3hkwOvMAsm8A99HGplWcswvJwGI+kk/akOzLfdC1vTEXJk86THTdKVatvRhnjTt2CC48rgMwYberKYNe5kZ0aXezvdhyIAPaJ2SRVn3jLzeKRsRh1m60wDuOZ9v8vDYDX62jOlv9DoKW5zFseTj1IQ3gcW328YhJy8PsZ3xkSQH/Kes9lmSHvLP1blRuiMlTDRILEaO9lXEnh1Unb/5qewj8ytXDi5JWwHIRfV3XgWY3lZJ9tSSfmRuouxv0v2oBH1T17v4k1kMTHB+NfB4SJa/ke5V3DyHjtwUBgwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00ff13m5Z+voOLNuZkmxW235O1NDdI8MflM9Sat7taw=;
 b=ALh0NNgqsmvWLyoNCk+UxOcI6lg+L+LBS2ffVbhjWhVkWvart7yO5Diru+WN6lTu9nW5rKMjxlGwEI7llrdDPbjsmldS/GQj/Cgre9pKsWW4qy8QYO0i44n+pI6DVMtm6LZem3XqbTA3Z9JaQHXJAqOCf6YtyiaISijmF8Ey3cU=
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SN7PR11MB7138.namprd11.prod.outlook.com
 (2603:10b6:806:2a1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 05:14:43 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 05:14:42 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 11/15] drm/i915/pipelock: Equalize the guardband across a
 pipelock group
Thread-Topic: [PATCH 11/15] drm/i915/pipelock: Equalize the guardband across a
 pipelock group
Thread-Index: AQHdfXBb4kJrJ48+NkGHRZx+U2iZYbc/6cGAgAF3q4A=
Date: Fri, 27 Nov 2026 05:14:42 +0000
Message-ID: <DS4PPFE901A304F20564B2BB29AE31C73BDE3412@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
 <20261126063459.863698-12-suraj.kandpal@intel.com>
 <sashiko-outbox-234903@kernel.org>
In-Reply-To: <sashiko-outbox-234903@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SN7PR11MB7138:EE_
x-ms-office365-filtering-correlation-id: 5785d45d-6201-43c1-17c0-08df4c455855
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|4143699003|261009223027099003|22082099003|18002099003|56012099006|11063799006|10067099003|261022105027099003|261028144727099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info: vTBG4tbS1kKvDNQvuN4M2Woglqtp6ypJ4NBwp1ej9nbUz5qUil5OEg0RsgZVGHRzKlM+gWKcFeWDoqShZo+EIpGT8S7jWRtTUl16fwW6OhN+5yBiqR/Dq/5K1QCWG9Ci+CoIGMYAlGIVMnv+q/zwE5WZmLBqkaDjEl1laZi2+gjOahqg1WyDknBcIt2ChIYg/kzTwAhwaRzDIkzvno+W9mvwQfTmo5inzPF7UO5lT4WxEHbQ9jtEZ3vPieME7sJGcQANCi0AKPTOi4g6xu+0QosZVEvFsVBgZpRUd1EU0gCbU6xqtiAEm8NtfHHXOny0lSs7gxakWohbwkwU9V/cDbLUpJ9rjE1YZSEhisfX5W0T/ehQfhrClqm0WjeewtmZzAsIAPT1fn3BJmNyJEARJxkkJW4FlB3X74PDQDRI83CzS37zfwNflYIfiSdQLQtwQEiBT6AFG1hcFp9BL0yq4fXFwQNKKSY7SjmmKDtz5FheAnB1TnJpZ27SriAk5pZD3+jOPY74Nlowf/NcYEP5tIcCgBzRSsroBSFw8FTZMUhy6Egf/IGeSiD6qvekouaNYEf51FuLcNtcao4RBc1JqWtXGSe3pIO2vr2LWt+eRzLh3n2zbYbkbzxZON+fn13CcJHtT540JgwFpEG7igoGyU+W3xKadH8D6QBm+hrsUks=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFE901A304F.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(4143699003)(261009223027099003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(261022105027099003)(261028144727099003)(261026140227099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnozaVQzNlh0SjNjUXd6QkpuR2RFWGFPT0Nzc0JhM1FGR1FwQ1dhZDBQRHBI?=
 =?utf-8?B?RjJlVS9ET2xFMmt2TVRhaWYyUVdPeFlMNXhMMi80YWU1WTdPUGZBakhSMGdi?=
 =?utf-8?B?UUEzeFc5NEVPSnZQZmxzMzJGV2txdk05N2wwM0F0aVpwcGlJWHBQWVhFa2tC?=
 =?utf-8?B?b1AyRU5RZEM0VmgwZGRCVUdoZnpOdXdxZm1PZ2xUem5zWGU0eHJ2SUgzbU8y?=
 =?utf-8?B?NGYyTUJReWtrclI0UVlaM0dBVld0OTJvZ216a1dBejU0TGN3UG9TM3R2dCs5?=
 =?utf-8?B?NDVjM3h4WGxYcWkvSTRwbnhNaW90U3c5Nm5FYTVHVWQxcElNV3BxTzNyQmFS?=
 =?utf-8?B?RkZjT3ljaTgxeFV3MWc1aUR5bmRseGJnR1pSQXdFcTFvTW81UDBkNmJleko2?=
 =?utf-8?B?Ym1TVUpPVWc1dm0rTkdYUHBkLzZpUFY5clUxcHUvenBYUHVoQWZqUFYrNDZQ?=
 =?utf-8?B?Y0Z1Q0ZCUFNLQzBrNk9iV1p2TlBiU3B3NTBsSWpQQS9ZZDZmcG42REVjWHMy?=
 =?utf-8?B?cVBuV3R0dTRsUGVHdklIRXVJSFIvRXRxVG90endxd2RQcTMvMjJKd0FPcUdJ?=
 =?utf-8?B?TzV1ZFBDZmViUkRFbzlWYWR6NlJkSGZKSk1YcW5NMWVrMGNKRUNjTlVxNldk?=
 =?utf-8?B?eFdIVE5nSXFOMUZlRHFaZDQ1WXlZQlN1ZW5INHZNdFlTaHZWalVYSXZkcThl?=
 =?utf-8?B?OTg0bjl6ZGFId2NDMisvb1lIcWVSdHVVNDRmUXdxVEdpTElYbHpYSG5TTHJu?=
 =?utf-8?B?VE9pbDhyRGJ6dEN2NDcreDJPS1R3ZVhteU5xQ0phM1hRWjJiWEJQNkdXY01K?=
 =?utf-8?B?b0NKK3luRkgyMVpsR3BrcUp5RVpNQkI3WExIY0E2a3N1ZVlIcTEvekY2UnNI?=
 =?utf-8?B?S0VMc1hRK1lPSlpKRW5Ea2VEMDN4VHVCVmxJNVFOQTcySVlTRStEcVNwa0dF?=
 =?utf-8?B?VTJheUxhSnRSYkhNd0lPV0licEQ1ZU4rUU0wQzZjR2VKRmVrb1RVRUhjN25I?=
 =?utf-8?B?c0ZIa3BQRXFuL3NOamwydFlQejJicHNGMCt1Um5neTVZQ29QZDBUbmQxNWJC?=
 =?utf-8?B?SVA3ZjFlS293WUNnNnBYdENBSTg4VWZ0UFJ3UkVaUDFNdjc2eW5hM3RkRmdW?=
 =?utf-8?B?OFJWQXF5MDFkMUd4RjZ2QmRlMDI2VmdZQ2d5cTdWY0hTVE5XSnRqVWJzNkJG?=
 =?utf-8?B?VXBZa0dPNFJCOWtjMGYrbmcwajk1TkFWTVprc0czSFpZU2xSK1NnNlk2QndY?=
 =?utf-8?B?VXp6WSs1dnZWbzlST1VqYUhPWWx3LzlPaHU2TlAyekIwWVdBT0RHYVBKb0pt?=
 =?utf-8?B?Q1FCa2MwczFMTDFibjJESjQxWGFMcWM3TURUb2Y1V1ErWHRDZWpqV2RnR1RQ?=
 =?utf-8?B?UkE3WndwTjBIeEQyUWV1dXpKOFNlQ2p4dEFYYndESHZzbnVVWGRaNkhibnFt?=
 =?utf-8?B?YkZtVE5XdVoxeFBqMWZCY1BRdW5jWEZnbSt2djVvNk5LYy9tVjF2aTc2RVBJ?=
 =?utf-8?B?TTZhQkRLQkppQksvcTVzMTNrMmtzbTQ0ZzBsWGFzYXBMSE0yY1E5M1h2TW93?=
 =?utf-8?B?THorQ1BGY3JSVFljYXJNd0JyQUpVU2dycll0ZVplTGRwQ1N3L05ISFU0L1dT?=
 =?utf-8?B?cnEzUndsamgxUXdPc09YUDZ5Mm15TExPaFJZeWljRDVzKytiZFMzZjB4b0k5?=
 =?utf-8?B?Q1lDdGwyY3VseDIzOUdkRnFKaEJGUWVFUlFvSXZJY0tMMHJrZ3FmblgwMW9X?=
 =?utf-8?B?TS9kd1had2N1TXdOSUMycWsranNtZGdVTUJLdytPMmJNbEF6a09hdHk0NnlX?=
 =?utf-8?B?RjJaTWlmRm9MNUNLSUxCaDJqL1dDUG03enlhZmkvTStMVXZ4UXRQM3pEcUpH?=
 =?utf-8?B?VzJPU1dZeGRhbmEyakxzc1l3YnlwOG03K0UvYzhCdjZIYkRSdDVEVEk3NGYv?=
 =?utf-8?B?aWdwN2VMczkydDZFQzVDTVh5ZnhacEk0cy9MeDlnRER2ak54cHh4N0xzUWpT?=
 =?utf-8?B?dHA5ZGZCQkV5RWtFMlJ6U0ZRa2hZVzdwY3dBVmJDU2s4bDRaNG1hcTBUYVdp?=
 =?utf-8?B?dUx6OFhwSUxEdnBJVU9ZdXBpTDJiTVh4UnVSQkFOSDhwTFhFd284NDM3UzlV?=
 =?utf-8?B?TlRxNHkySDVyYUM4QjR4V0NLcFZ0dWRZZmJPRFVvN1FjbmtCZ1dKT1R5RXQz?=
 =?utf-8?B?TTNWZ2RvRFIwdGhNOU90Q1NENFdKeVl1cjdyUFlLY1pqSEovYlBEaU13VHI4?=
 =?utf-8?B?dTJ2U0RDbzdoN0JUeElZc2dmN2hmbk1IajRPRFBJLzlCckNkcnpFeUtKSkp1?=
 =?utf-8?B?RXZBYlkzYXdxWENTcTQxcGNBaUg0S0liWkY0bDBoYjdjY2VEQTRydz09?=
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
X-Exchange-RoutingPolicyChecked: NqjUO5hmlQKtNqmcxZ1bb/CQ7umZ8P1TWYprFoCC0/AjQfIsJD+6JyOIT+Gwjhi7X9R+aEb+zv/MWySojpRU9xKvNZ/FbL3sXJVAa4eshudDV2AmTVGx4ELLGYYaJ95dvtNPk0rJA7PqxVy4F58rZG4NTzzeHMB6fgmzkacJEjeR0OtbxP1IhsTMuLQtD/IwLWtHxwgyB2Wff8BBlkhcg40ER/NqRx9b8Jb91jb77ZOFEhuoLHJpv3hr7rHOnOkIeuVv15rtpRfheuofYBk+tf9FH13QBi4aMl+dO6POTsAYqf87vplzx7Y+Vfi1204/FSD013jzts3CjccxSBpkLg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5785d45d-6201-43c1-17c0-08df4c455855
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 05:14:42.7819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4zP67uH2x5FIWiyu9TCefJJlAGnukgeTJ1VQtrkxdQPEKruNoE5Eu+aUEHN0oyNn5MjD08td6oeCvxevslG+MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7138
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW1BBVENIIDExLzE1XSBkcm0vaTkxNS9waXBlbG9jazogRXF1YWxpemUg
dGhlIGd1YXJkYmFuZCBhY3Jvc3MgYQ0KPiBwaXBlbG9jayBncm91cA0KPiANCj4gVGhhbmsgeW91
IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRp
YWwgaXNzdWUgdG8NCj4gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gZHJtL2k5MTUvcGlwZWxvY2s6
IG5lZ2F0aXZlIGJpdCBzaGlmdCBpbg0KPiAgIHBpcGVsb2NrX2dyb3VwX2d1YXJkYmFuZCgpDQo+
IC0tDQo+IA0KPiBjb21taXQgYjQyODcwYzU0NWExNmYyYjMzOTNhNzk0NTU2MGQ0ZDMxZmE5YmQy
OQ0KPiBBdXRob3I6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiAN
Cj4gZHJtL2k5MTUvcGlwZWxvY2s6IEVxdWFsaXplIHRoZSBndWFyZGJhbmQgYWNyb3NzIGEgcGlw
ZWxvY2sgZ3JvdXANCj4gDQo+IFRoaXMgY29tbWl0IGRyb3BzIHRoZSBndWFyZGJhbmQgZXF1YWxp
dHkgY2hlY2sgZnJvbQ0KPiBpbnRlbF9waXBlbG9ja19jb21wYXRpYmxlKCkgYW5kIHJhaXNlcyBl
YWNoIHRpbGUncyBWUlIgZ3VhcmRiYW5kIHRvIHRoZQ0KPiBtYXhpbXVtIGFjcm9zcyBpdHMgcGlw
ZWxvY2sgZ3JvdXAgYmVmb3JlIHJ1bm5pbmcgRFAgbGF0ZSBjb25maWcuDQo+IA0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3BpcGVsb2NrLmMNCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGlwZWxvY2suYw0KPiA+IGlu
ZGV4IDIzYjZkYjA3NDM4NWQuLjI3NmE3YmZhN2M0YmYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9waXBlbG9jay5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9waXBlbG9jay5jDQo+IFsgLi4uIF0NCj4gPiBA
QCAtOTIsMTQgKzkzLDM4IEBAIGJvb2wgaW50ZWxfcGlwZWxvY2tfY29tcGF0aWJsZShjb25zdCBz
dHJ1Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZTEsDQo+ID4gIAkJY3J0Y19zdGF0
ZTEtPnZyci52bWluID09IGNydGNfc3RhdGUyLT52cnIudm1pbiAmJg0KPiA+ICAJCWNydGNfc3Rh
dGUxLT52cnIudm1heCA9PSBjcnRjX3N0YXRlMi0+dnJyLnZtYXggJiYNCj4gPiAgCQljcnRjX3N0
YXRlMS0+dnJyLmZsaXBsaW5lID09IGNydGNfc3RhdGUyLT52cnIuZmxpcGxpbmUgJiYNCj4gPiAt
CQljcnRjX3N0YXRlMS0+dnJyLmd1YXJkYmFuZCA9PSBjcnRjX3N0YXRlMi0+dnJyLmd1YXJkYmFu
ZCAmJg0KPiA+ICAJCWNydGNfc3RhdGUxLT5pbmZvZnJhbWVzLmVuYWJsZSA9PSBjcnRjX3N0YXRl
Mi0NCj4gPmluZm9mcmFtZXMuZW5hYmxlICYmDQo+ID4gIAkJaW50ZWxfZHBsbF9jb21wYXJlX2h3
X3N0YXRlKGRpc3BsYXksICZjcnRjX3N0YXRlMS0NCj4gPmRwbGxfaHdfc3RhdGUsDQo+ID4gIAkJ
CQkJICAgICZjcnRjX3N0YXRlMi0+ZHBsbF9od19zdGF0ZSk7ICB9DQo+ID4NCj4gPiAtdm9pZCBp
bnRlbF9waXBlbG9ja19jb21wdXRlX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiA+
ICpjcnRjX3N0YXRlKQ0KPiA+ICtzdGF0aWMgaW50IHBpcGVsb2NrX2dyb3VwX2d1YXJkYmFuZChz
dHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gPiArdTE2IHRyYW5zY29kZXJzKQ0K
PiA+ICB7DQo+ID4gKwljb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZTsN
Cj4gPiArCXN0cnVjdCBpbnRlbF9jcnRjICpjcnRjOw0KPiA+ICsJaW50IGd1YXJkYmFuZCA9IDA7
DQo+ID4gKw0KPiA+ICsJZm9yX2VhY2hfbmV3X2ludGVsX2NydGNfaW5fc3RhdGUoc3RhdGUsIGNy
dGMsIGNydGNfc3RhdGUpIHsNCj4gPiArCQlpZiAodHJhbnNjb2RlcnMgJiBCSVQoY3J0Y19zdGF0
ZS0+Y3B1X3RyYW5zY29kZXIpKQ0KPiA+ICsJCQlndWFyZGJhbmQgPSBtYXhfdChpbnQsIGd1YXJk
YmFuZCwgY3J0Y19zdGF0ZS0NCj4gPnZyci5ndWFyZGJhbmQpOw0KPiA+ICsJfQ0KPiANCj4gW1Nl
dmVyaXR5OiBNZWRpdW1dDQo+IENhbiBCSVQoY3J0Y19zdGF0ZS0+Y3B1X3RyYW5zY29kZXIpIHNo
aWZ0IGJ5IGEgbmVnYXRpdmUgYW1vdW50IGhlcmUgd2hlbiBhDQo+IGRpc2FibGVkIENSVEMgaXMg
cHJlc2VudCBpbiB0aGUgYXRvbWljIHN0YXRlPw0KPiANCj4gSW4gaW50ZWxfYXRvbWljX2NoZWNr
X2NvbmZpZygpLCBhIGRpc2FibGVkIENSVEMgaXMgcmVzZXQgYnkNCj4gaW50ZWxfY3J0Y19wcmVw
YXJlX2NsZWFyZWRfc3RhdGUoKSAtPiBpbnRlbF9jcnRjX3N0YXRlX3Jlc2V0KCkgKHdoaWNoIHNl
dHMNCj4gY3B1X3RyYW5zY29kZXIgdG8gSU5WQUxJRF9UUkFOU0NPREVSLCBpLmUuIC0xKSBhbmQg
dGhlbiBza2lwcw0KPiBpbnRlbF9tb2Rlc2V0X3BpcGVfY29uZmlnKCkuICBTaWJsaW5nIGxvb3Bz
IHN1Y2ggYXMNCj4gaW50ZWxfY3B1X3RyYW5zY29kZXJzX25lZWRfbW9kZXNldCgpIGNoZWNrIGNy
dGNfc3RhdGUtPmh3LmVuYWJsZSBiZWZvcmUNCj4gZXZhbHVhdGluZyBCSVQoY3J0Y19zdGF0ZS0+
Y3B1X3RyYW5zY29kZXIpIHRvIGF2b2lkIHVuZGVmaW5lZCBzaGlmdCBiZWhhdmlvcg0KPiBhbmQg
VUJTQU4gc2hpZnQtb3V0LW9mLWJvdW5kcyB3YXJuaW5ncy4NCg0KV2lsbCBmaXgNCg0KUmVnYXJk
cywNClN1cmFqIEthbmRwYWwNCg0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTI2MDYzNDU5Ljg2MzY5OC0NCj4gMS1z
dXJhai5rYW5kcGFsQGludGVsLmNvbT9wYXJ0PTExDQo=
