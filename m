Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5722BEFE8
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473422; cv=fail; b=W6NMgF4DHvDrmTu3HVDyziji1cPytSdcSstolu7ddqdQS/hWrsQ6qOVUqRtMDgLFZEhjPHNtnf2JKAgKiwbF+eZu+O7ZiS76TnzsSS4YcJPHWWNtspb0HZVoCqUzvLSLWZf3nsI49zdIl05pRdZ/jUYDLQMIB2lzh0sl5iTkHj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473422; c=relaxed/simple;
	bh=S3Ei9Bn3U4NfJNB9Vt/V04kqscVoqtLus7uboFIqiFg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cm5l4M3IUwwe3mWuIBeFkHxQYosNpyqFtvn2peMUVKjohGuIrAfiWz8ZhdjA9CXRxf4UYd2/p6YaD/MhoLb3XdByS0lRtjF3BMwAqOh9oAvklLfn64EkabDboX7D7uCih8t7DEKQASm9fqVGapMT6CXFK0wdTfTwhgpCv1z3P0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6w5y13x; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6w5y13x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789473420; x=1821009420;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S3Ei9Bn3U4NfJNB9Vt/V04kqscVoqtLus7uboFIqiFg=;
  b=Z6w5y13xtg5i/h6ODu4yueWrFV+eQmp6A1E6PUt5s5dw+VcDEr5nCCBH
   C/kKNqL1xFBaippUj83p/tdbBps2IncURmBGv2wAcVk4+36m3CTufBweo
   bqeLBPXm56Mp7f3ytOH4Ad0iASl74hTpjvpolyq4zbDJ6+2N9LSjg93pq
   4atq0p0PL1M8uX/nz7VOb4vHWRYz+uroiVd3SGMKg8KN9Wss83ufkbxzJ
   vrcYuxYxr7oRH1SYQP7DpSqG0ertFYK+b0X+9qcOCOfhxaund+/chDgoF
   p8mL0k6PnrEJATjEspiJgSeuEwbmjuZY0EZhQpgSKvv0EL923RCeJFU1K
   A==;
X-CSE-ConnectionGUID: ZCjBdJ1TR2u5qsC+P6vJaQ==
X-CSE-MsgGUID: SE3ReDoxTwyx+eS+m1BZuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77393997"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77393997"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:56:59 -0700
X-CSE-ConnectionGUID: gjxELmH/SQeC6lpxsftZAQ==
X-CSE-MsgGUID: LpFyPjKpS5KSPxTGXzpNCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1215980"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:56:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 04:56:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 04:56:58 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 04:56:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6id7DCmSn9Rc0vHQdNlfnnsnVsbDAYXw1Vv/Bn/r0hQHKnlTqxTA9rOG0Nlcf5vshPP7rT8VzteiqIm8wEkkpPH505z0OYPe7s16wj/Pk4UQ2GiyD86LIwOm7chJ1dzHRA/c6QrblGU/4PJWp6m9lVPHtiQUS9DImiXs9P0QRzV3p5U1jAkq8lrN3AwmHV/HjDH4C05m18ZaXnL/PtHiq1VVHu+dfPt4BPbgPtapCtVY1nspMpMVru0kiPwVkQmLt3IK5cQE1xtEA5VrUR2D7DSPaRPIxT4SUphVZX+p+Lqbj9V28eBA50hLQVXDO0ibDvc3j9YclHpA0W0ysTrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3Ei9Bn3U4NfJNB9Vt/V04kqscVoqtLus7uboFIqiFg=;
 b=k2mCW56etpp9B8YVrJJRBFhDQbf0DQ9aZvL7MdRU3U83hbEawlZ5pgP+sky6Kro6fFRyDW5Y+rd5sky+c8fBLU8BJ1Idjihw60Nvn4Sdtbs5h6LSCWDt/rd6JbWlWjrH0V8feBBZN9hiH4+V1Dt4YIJEr9J2lNKLQ90v6zoI6Ed8+IvJVypTTxqfiU47p23MMlRZBHN5E+e9WRvOrsLouwzPOO+IW5lnF8BW1sfEULzF1zwIA7lQIwt/glIxUKVo3+fkc6mCp1OdNsIz8B1eevAo+0fu+Mf+cY7zEyntbfARise+Pz/jOWc0TafxBZxMaqlhBizqQubrvOdADAoeTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 by LVWPR11MB9905.namprd11.prod.outlook.com (2603:10b6:408:3be::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 11:56:42 +0000
Received: from SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3]) by SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3%6]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 11:56:42 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
Thread-Topic: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
Thread-Index: AQHdRQNxzrtgV6bzrUSSIBL4BTCYwbbPf7SAgAABx+A=
Date: Tue, 15 Sep 2026 11:56:42 +0000
Message-ID: <SA3PR11MB762596BC57E9E3D9207C5CEEC8BA2@SA3PR11MB7625.namprd11.prod.outlook.com>
References: <20260915111314.564847-1-tilak.tirumalesh.tangudu@intel.com>
 <20260915111314.564847-3-tilak.tirumalesh.tangudu@intel.com>
 <20260915112510.4FBC51F00893@smtp.kernel.org>
In-Reply-To: <20260915112510.4FBC51F00893@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB7625:EE_|LVWPR11MB9905:EE_
x-ms-office365-filtering-correlation-id: 1ab500f1-151f-4109-ef33-08df1320686b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|38070700021|3023799007|4143699003|10067099003|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info: X8lnHdzcYj80OPqMFW7ozpNLzk+TZFsfXh3twtUnC4UmlgpuHggMOf+Eb2W07Sihjyq963Rb9rh9KPWCaDuMAJFXoPdEShKuAh3Zo5DGqoYt8BqbnwJ4pLJta9ZDWvzF+Vvb7pihwb1cN8qzHQOeShzuUyIGceScHkCw6zzk6kDwtnX9/PhvffOnmRFtEWo8XKozoIW4J5qdR3MtCEqG173wHAREqqT29VVH/A9kwYw19qiO3g+Xc+tOpZk9yCkX2wdYltWoJ4uKEKEDeFOGLPvphqZNN7LyvpVxLgHdpzdyXuv8ukUGROFUgEsyZgVE+CY7XfB8lokKCWQm3i0h54HZTdsiYJhirYE/ibQxW+3Ei+3yJMzYj/dIs5wWpR6lrr5oMtQ6HpfNQ3MtWIn7HQxEjYuFJ5mgv1XzaZN0SDVaCp36ymnEJUGdaHEtkcfmhbcVJi63PNLyIRSBibTD1RkmXRxUYe++r9N3ZfRDql2r7ZI3+hiaSmZBwdOV+CK0BmHCuzsNZ2HFIsql29uUFh1c+bTB3/isKDpRJEC+yOuQCYC5TY3a3hyOQnzChRMkttrMrOz5dDrCkiz6D9qrjfkvA7JXxmCrX23RlhErb/1q44Hxso7ZExKaVV+Mf8p+PO5daZyQv1qnllCreWcJiggEy6qrUgcXCe7igLf2EVM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB7625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(38070700021)(3023799007)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjRVditaMnMyZk81dzlUMFM5MWlwWEFTcHpaaFU5U3g5b1RtY3dPTG0yeXc2?=
 =?utf-8?B?L1JIWHNrbGJhTzduL01wUWZwQVFBbU9HYzN5UTlnVldwM2FBb25nU01iMkRz?=
 =?utf-8?B?cDR3VnNWVytuTWg2U1B6WlF5ZFcyTXNtSkhoOWtEcFpRRkJFTktGdnl6T0VL?=
 =?utf-8?B?Slc4MWF4emFiaGxKM0ZNdGRPOHBPUHpTRHo1aVJmUlN2QVhjUjNiNmJ6K1J2?=
 =?utf-8?B?ZlZtdlVWWkxtRlhXdzFndm1BY3ZhaVl6WDB5NXVnTlZkb3E4KzBacEQ4VG1K?=
 =?utf-8?B?NXF5a3JVbTFBbGF5SXVMTVlEOTR2NFlEbTVHVFZJcEh0bktoQmF1OVVNb1Vw?=
 =?utf-8?B?dU9EMWVHcmxOdUhjTFpsam5BVVJtVThvd3piSElxZENYQURRclBvc2l0N2xh?=
 =?utf-8?B?RjlieDVHTmY1Q1RQZFRqbm1yU2Joa0JxNG1pTVBGc3Npbm1IeWNwSmZrWEdF?=
 =?utf-8?B?cVNrSWpiN3R0eFJURUx6cTdOSWlheTN1UFRwUEJSM3RLdjZoOWF1dFhxamZX?=
 =?utf-8?B?cTF0TGZrU0RrdVkvOFNOMXIzYmtNTzVtQ25YdEhuMGZ2L1hRQjZXVTBPTVNL?=
 =?utf-8?B?b3h5djNVckYwZGJQL2IySlFVc3FGa242SUF5ekVxZ002bERmMzVDK2w0Skdm?=
 =?utf-8?B?SjE4QjFEdjBqalhUS2ZsZUFPOU0vRXA5QThIeE5BSzRib3QvY0VHdzV6NVBx?=
 =?utf-8?B?Mkd3WDluYnVqbkVQNUdYZ0pnUVlwTFA4REI4UTZLWG5FT3pyYjhLWUhOZExh?=
 =?utf-8?B?bDBNdG9LU1AwMnBLRVVjejYwa0luaFRpQyt2NUFyRDZ5QnhLS01vd3FDMmxr?=
 =?utf-8?B?dXkzYVFkd293Z004bHJZU3hZTmxBK1BkWVVUS0xRV1FHMFJ4NkJNdnRKUG5N?=
 =?utf-8?B?K3J4Uld1NTZWd0hTTTYrZE45S3p5V2YrZ0dXNXJDb21FRyt6MWdVWkYrNkU0?=
 =?utf-8?B?TUtCdEtoQlgxbnpqVld3UkdhWWt0U0Z6SCtVOW1zQ25vTDJPcm1GUWpJOFVH?=
 =?utf-8?B?L3paR1djWTd2Sk5HSUhjY3NaVGNwZzYvcFFUaWgvWmcxWENZcGt6eTFMT3BQ?=
 =?utf-8?B?ZFBBTUpxRkIzbzBPNy8vYTRQd24zZXB1Z1g1YlJiZkdFOGJhMXNmRmxzMFFY?=
 =?utf-8?B?ditaQndPTzRUMUgvSVRJZ0w2b3JWcm1qOFVWNWt3cWQ2M3dvUlFCaVJ6VFU2?=
 =?utf-8?B?NklRZHArOFFwc2RIME1pV1BTUFRnOWpuRksrdUZQQ0FFZHFMV3JDQ01yWElr?=
 =?utf-8?B?RWxJMjNiLzhsY3JIN1NkT2grL2l2ZVRldXNuck9sRUJwa1hFVTZEM1c4M3E2?=
 =?utf-8?B?VzJGVWpLVEQ4UDNrNGVHTlJCcEFUdDlEZWhMZUJUeHE1eStWdFJIaUNEdTJN?=
 =?utf-8?B?MnlES2U5cjJXRU1yaXpQZSs2OGVGaFZCNEllZWhqSG8yMU0xTmI1ZnhVeUNr?=
 =?utf-8?B?WGFSREZ6TnpvNDlOREFwdC9CTnpsOTIrZlFzOStXem1HeG1rVm83eEt5L2E0?=
 =?utf-8?B?S0paWEpnYTAraEpSRC9VV2ltbTNPUDI5RVZVMUlxSnRVL2NmOGNNc3V5eVk0?=
 =?utf-8?B?bzVHaUFtbjRzMlZ5bm5UVVkwa1hxMzlNMGY3UFl1eUxIT1VUSXR1ODhsYlEx?=
 =?utf-8?B?bTRCcjFYQkJ3dGVNeEwyVFJYaWhoVThvMFRDOTdZbFA5bWlTNUNIQk1SL2Qx?=
 =?utf-8?B?aUJmYk4rV2hybEp1Y1VmK0RpV05aaHlaQ0E0ZXk2MnJFQWFHSXV5dU9HekJM?=
 =?utf-8?B?Wk9QancyajloekxZRVJ2R3pmc3lkN2x6YmVkQkNsenBmYjVobXg1QUc3MlQv?=
 =?utf-8?B?a3VlK1ZyK3psajRnTzNCVWpqUFpoa0FTV0RpdWNOb2JZc0p1ZlFrTFNSdFNZ?=
 =?utf-8?B?a0o0SFVxbTJHOVFUbW93UUduMUh3MmI2ZXoxMnF3QmRYaGhKNFJaZmNlOVZT?=
 =?utf-8?B?aU9DbFptRXlPaUE5RGU1cGVjNkRGUkJ3N0FQUkV3WktUWVhPd3hzb0EwLzdt?=
 =?utf-8?B?MzVYV0tONzVHRi83dlRuaHk2ZVNBVG1PNFZmb2Y4UjgxemNjNHdWNTR1VXo2?=
 =?utf-8?B?c1BrNE9UTjhrYXdnNER0eTlCeXFadnlRVk1xTnViRjgyVU9FSTNpN3UxUGZM?=
 =?utf-8?B?VmZqV3BPV0NlTjNYUkdXaU9SaWlZY0NRTnFkRkxSeVNDaHJkNXFiTGJ3V3Q2?=
 =?utf-8?B?SHM0OHZiTCtubEYyNHZUS28yOUdBNXNmS3JtZzR2cTF6RXdSU2pIUHFmMnlL?=
 =?utf-8?B?YVVDdmlGZVNtMElFVVh2dUtENExQby9OUVJGVW1RTitKc1ZselpMekVoZGgr?=
 =?utf-8?B?cWJ3Wjc1dkJMOEJ0c0V5N1o5UDVyU1l1UVBJQUpQcnJGbjNtaFhqeWNuc093?=
 =?utf-8?Q?QSw1FRWIBVRffBC8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Jk3kLcxwO6ccjd8kG1I1Zo6jmh5EJAFPGyLdhKR+2Rd8KUpF+fUWrO0ZXfyClBzHXg/5G4RsX0nygGqd0ANT9ylO+bclZgwEEarjijVD3xb03B8+jDgLGHZlu6U3mN3Qv1K5aq789vVPwjlDuYYnfqYziN9Ao+D2narOQXtAGHTmPHtccSz8AwE4zu+q4OmveXIVN/BXkm1AlrKGFewe8kbHhEsRgFqgRPA5wlZI5WKBiF3DuMtSY9ZTy+WqUXobWhMW9n0RjbLtzHFAkqn3iwCCDHshDfon0RaeVBBtCSnvBSIweHRvOO3cu6Ng7sZt2SETHaUSwh9wT4rVuO1iBA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab500f1-151f-4109-ef33-08df1320686b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 11:56:42.1160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A/FQ+MY21npCb4HBVe98pFfkimA4FRYyuLpgxTCRgHajg3BU0Zi0zd8J+/g4SVDseOd9hH8lm/TobL0vKp1qdEIBNvGfBzpmx7k4LetlwmfMnyYNWJJ4kBd7XX4fSjDj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR11MB9905
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMTUgU2VwdGVtYmVyIDIw
MjYgMTY6NTUNCj4gVG86IFRhbmd1ZHUsIFRpbGFrIFRpcnVtYWxlc2ggPHRpbGFrLnRpcnVtYWxl
c2gudGFuZ3VkdUBpbnRlbC5jb20+DQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGRybS94ZTogQWRkIHdhXzE0MDI1OTQxNTg3
IHRvIHhlMiwgeGUzIGFuZCB4ZTNwDQo+IHBsYXRmb3Jtcw0KPiANCj4gVGhhbmsgeW91IGZvciB5
b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNz
dWUocykNCj4gdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0geGU6IHRpY2sgcXVhbnRpemF0aW9u
IGJ5cGFzc2VzIFdhXzE2MDIzMTA1MjMyIHVwcGVyIGJvdW5kDQo+IGNoZWNrDQo+IC0tDQo+IA0K
PiBjb21taXQgMGJkMGE1OWIwOWJkN2MwZmExMzZjN2QxNDFjNThkZjRlNTMxNTM1Yg0KPiBBdXRo
b3I6IFRhbmd1ZHUgVGlsYWsgVGlydW1hbGVzaCA8dGlsYWsudGlydW1hbGVzaC50YW5ndWR1QGlu
dGVsLmNvbT4NCj4gDQo+ICAgICBkcm0veGU6IEFkZCB3YV8xNDAyNTk0MTU4NyB0byB4ZTIsIHhl
MyBhbmQgeGUzcCBwbGF0Zm9ybXMNCj4gDQo+ICAgICBBdm9pZCBwcm9ncmFtbWluZyB0aGUgSURM
RURMWSB0aW1lciB0byBsZXNzIHRoYW4gNSBtaWNyb3NlY29uZHMuDQo+ICAgICBBcHBseSB3YV8x
NDAyNTk0MTU4NyB0byBHcmFwaGljcyBWZXJzaW9ucyAyMC4wMSB0byAzNS4xMQ0KPiAgICAgYW5k
IE1lZGlhIFZlcnNpb25zIDEzLjAxIHRvIDM1LjAzDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9od19lbmdpbmUuYw0KPiA+IGluZGV4IGU1ZTc2MWMzM2ZhNjguLmEwYzI5YWFjYmJmZTEgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+IFsgLi4uIF0NCj4gPiBAQCAt
NTg4LDMxICs1ODgsNzYgQEAgc3RhdGljIHZvaWQgaHdfZW5naW5lX2luaXRfZWFybHkoc3RydWN0
IHhlX2d0DQo+ID4gKmd0LCBzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UsICBzdGF0aWMgdm9pZCBh
ZGp1c3RfaWRsZWRseShzdHJ1Y3QNCj4gPiB4ZV9od19lbmdpbmUgKmh3ZSkgIHsNCj4gWyAuLi4g
XQ0KPiA+ICsJCWlmIChYRV9HVF9XQShndCwgMTYwMjMxMDUyMzIpICYmDQo+ID4gKwkJICAgIHhl
X2d0X1dBUk5fT04oZ3QsIGlkbGVkbHkgPj0gbWF4Y250IHx8IGluaGliaXRfc3dpdGNoKSkgew0K
PiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IERvZXMgdGhpcyB1cHBlciBib3VuZCBjaGVjayBm
YWlsIHRvIGFjY291bnQgZm9yIHRoZSBzdWJzZXF1ZW50IHRpY2sNCj4gcXVhbnRpemF0aW9uPw0K
PiANCj4gSWYgbWF4Y250IGlzIHNsaWdodGx5IGxhcmdlciB0aGFuIHRoZSA1MDAwbnMgbWluaW11
bSAoZS5nLiwgNTEyMG5zKSwgdGhlIGlkbGVkbHkNCj4gPj0gbWF4Y250IGNoZWNrIHdpbGwgZXZh
bHVhdGUgdG8gZmFsc2UgYW5kIHRoZSB2YWx1ZSB3b24ndCBiZSBjbGFtcGVkLg0KDQpUaGUgaWRs
ZWRseSA+PSBtYXhjbnQgY29tcGFyaXNvbiBpcyBkb25lIGluIHRoZSBuYW5vc2Vjb25kIGRvbWFp
biwgYW5kIFdhXzE2MDIzMTA1MjMyIGlzIGludGVudGlvbmFsbHkgY2hlY2tlZA0KYWZ0ZXIgdGhl
IFdhXzE0MDI1OTQxNTg3IG1pbmltdW0gc28gaXQgcmV0YWlucyBwcmlvcml0eS4gVGhlIG1pc3Nl
ZC1jbGFtcCBjYXNlIG9ubHkgYXJpc2VzIGlmIElETEVfV0FJVF9USU1FIGlzDQpjb25maWd1cmVk
IHdpdGhpbiBhYm91dCBvbmUgdGljayBvZiB0aGUgNSDCtXMgZmxvb3Ig4oCUIGEgY29uZmlndXJh
dGlvbiB0aGVzZSBwbGF0Zm9ybXMgZG9uJ3QgdXNlLCBzbyBpdCBpc24ndCANCnJlYWNoYWJsZSBo
ZXJlDQoNCj4gDQo+ID4gKwkJCS8qIG1heGNudCBtYXkgYmUgMCBpZiBJRExFX1dBSVRfVElNRSBp
cw0KPiB1bnByb2dyYW1tZWQuICovDQo+ID4gKwkJCWlkbGVkbHkgPSBtYXhjbnQgPyBtYXhjbnQg
LSAxIDogMDsNCj4gPiArCQkJY2xhbXBlZF9iZWxvd19tYXhjbnQgPSB0cnVlOw0KPiA+ICsJCQl3
YV9hcHBsaWVkID0gdHJ1ZTsNCj4gPiArCQkJLyogaW5oaWJpdF9zd2l0Y2ggb3ZlcnJpZGUgdG8g
a2VlcA0KPiA+ICsJCQkgKiBzZW1hbnRpY3Mgb2YgV2FfMTYwMjMxMDUyMzINCj4gPiArCQkJICov
DQo+ID4gKwkJCWlmIChpbmhpYml0X3N3aXRjaCkNCj4gPiArCQkJCWlkbGVkbHlfcmVnX3ZhbCAm
PQ0KPiB+SU5ISUJJVF9TV0lUQ0hfVU5USUxfUFJFRU1QVEVEOw0KPiA+ICsJCX0NCj4gPiArDQo+
ID4gKwkJaWYgKHdhX2FwcGxpZWQpIHsNCj4gPiArCQkJdTMyIGlkbGVkbHlfdGlja3M7DQo+ID4g
Kw0KPiA+ICsJCQkvKg0KPiA+ICsJCQkgKiBXYV8xNjAyMzEwNTIzMiByZXF1aXJlcyBpZGxlZGx5
IDwgbWF4Y250LCBzbw0KPiBmbG9vcg0KPiA+ICsJCQkgKiB0aGF0IGNsYW1wOyBvdGhlcndpc2Ug
cm91bmQgdXAgdG8gZ3VhcmFudGVlIHRoZQ0KPiA+ICsJCQkgKiBXYV8xNDAyNTk0MTU4NyBtaW5p
bXVtIHN1cnZpdmVzIHRpY2sNCj4gcXVhbnRpemF0aW9uLg0KPiA+ICsJCQkgKi8NCj4gPiArCQkJ
aWYgKGNsYW1wZWRfYmVsb3dfbWF4Y250KQ0KPiA+ICsJCQkJaWRsZWRseV90aWNrcyA9DQo+IERJ
Vl9ST1VORF9ET1dOX1VMTCgodTY0KWlkbGVkbHkgKiAxMDAwLA0KPiA+ICsNCj4gaWRsZWRseV91
bml0c19wcyk7DQo+ID4gKwkJCWVsc2UNCj4gPiArCQkJCWlkbGVkbHlfdGlja3MgPQ0KPiBESVZf
Uk9VTkRfVVBfVUxMKCh1NjQpaWRsZWRseSAqIDEwMDAsDQo+ID4gKw0KPiBpZGxlZGx5X3VuaXRz
X3BzKTsNCj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBXaWxsIHRoaXMgcm91bmQtdXAgcHVz
aCB0aGUgcHJvZ3JhbW1lZCBkZWxheSBhYm92ZSBtYXhjbnQsIHNpbGVudGx5DQo+IHZpb2xhdGlu
ZyBXYV8xNjAyMzEwNTIzMj8NCj4gDQo+IElmIHRoZSBjaGVjayBhYm92ZSBieXBhc3NlZCBjbGFt
cGluZyAoYmVjYXVzZSA1MDAwIDwgNTEyMCksIHdlIHRha2UgdGhlIGVsc2UNCj4gYnJhbmNoIGhl
cmUuIFVzaW5nIERJVl9ST1VORF9VUF9VTEwsIDUwMDBucyBjYW4gcm91bmQgdXAgYnkgYW4gZXh0
cmENCj4gdGljay4gRm9yIGluc3RhbmNlLCBvbiBhIDE5LjJNSHogY2xvY2sgKDQxNi42Nm5zIHBl
ciB0aWNrKSwgNTAwMG5zIHJvdW5kcyB1cA0KPiB0byAxMyB0aWNrcyAoNTQxNm5zKS4NCj4gDQo+
IFNpbmNlIDU0MTZucyA+IDUxMjBucywgdGhlIHByb2dyYW1tZWQgSURMRV9ERUxBWSB3aWxsIGVu
ZCB1cCBleGNlZWRpbmcNCj4gSURMRV9XQUlUX1RJTUUgaW4gdGhlIGhhcmR3YXJlLg0KDQpSaWdo
dCB0aGF0IERJVl9ST1VORF9VUF9VTEwgYnVtcHMgNTAwMCBucyB0byB0aGUgbmV4dCB3aG9sZSB0
aWNrIOKAlCB0aGUgcm91bmQtdXAgaXMgZGVsaWJlcmF0ZSBzbyB0aGUgV2FfMTQwMjU5NDE1ODcg
IDUgwrVzIG1pbmltdW0gc3Vydml2ZXMgdGljayBxdWFudGl6YXRpb24gcmF0aGVyIHRoYW4gZHJv
cHBpbmcgYmVsb3cgaXQuIA0KVGhpcyBjYW4gb25seSBleGNlZWQgSURMRV9XQUlUX1RJTUUgaWYg
IElETEVfV0FJVF9USU1FIGl0c2VsZiBzaXRzIHdpdGhpbiBvbmUgdGljayBvZiA1IMK1cywgd2hp
Y2ggaXMgdGhlIHNhbWUgcHJlY29uZGl0aW9uIGFzIHRoZSBwcmV2aW91cyBjb21tZW50IGFuZCAg
bm90IGEgY29uZmlndXJhdGlvbiB0aGVzZSBwbGF0Zm9ybXMgdXNlLg0KIFNvIGl0IGNhbid0IHZp
b2xhdGUgV2FfMTYwMjMxMDUyMzIgaW4gcHJhY3RpY2UuDQoNCg0KPiANCj4gPiArDQo+ID4gKwkJ
CWlkbGVkbHlfcmVnX3ZhbCAmPSB+SURMRV9ERUxBWTsNCj4gPiArCQkJaWRsZWRseV9yZWdfdmFs
IHw9IFJFR19GSUVMRF9QUkVQKElETEVfREVMQVksDQo+IGlkbGVkbHlfdGlja3MpOw0KPiANCj4g
LS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwOTE1MTExMzE0LjU2NDg0Ny0NCj4gMS10aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50
ZWwuY29tP3BhcnQ9Mg0K
