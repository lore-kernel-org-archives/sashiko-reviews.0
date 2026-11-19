Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795130477;
	b=Aj18RSf8BfkWjzRwk0x64FdjmuVAXxjNPakT/Oc5N26Jl3jk8VJ8fCcT8UpSglcTcq3g
	 D056ys5NrlqtO8MQnO7gH2ikn7KGXEynPn35slBYUyzG/HI7VBkSoPvQWe8Nr0OTtJiXI
	 qJUbbCtJ/S6wPW6c/uGHgMVPVC5C/fGLHW3AMXn63+XBNIDmWKGEpGJic0msRqNw30L0R
	 VnsrI4vZy65veC/EDlxSa3tKA1cvjmkd3vGtizzOXeTXmhMSpMTbFlw/Pz7smhDqQiB7u
	 /4upJELuXe61vwPSuN86jcKfIbomNnWYTMEfBU2tNBrkwJPJHZmit/s2UEONE/Jurug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130477;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=TuN87agKzcCTzBNqdCBncjMlunbZoa66uJOmrQDxtVk=;
	b=u+YtJNgdq3AVqktl5UB4OBnDK9FCwRB3bcm+e5Z/FynwdQ1EdL+z/qYRY/f6qcx3f72T
	 C/4fqOjv7cDBNQMgCTjsZXtDZGRjoY7lqGmogpTsiInNgcNxFCEgOduUUAvRzI9kbBVcw
	 SXzm9mr5MjPjbxM1Hv4X8mqyNrwbo1iwpIW32GE2iaJ9O0IXbW77NoMVHeVvnZNt/tdM9
	 ND0r9ME+VBxkVJzc4N1N/38vH7Uz7s7qtlR5M1x1IF7WsvGL7EYFI7WlEsPzuyOTiT9aZ
	 h9qZOyzdEBrfjfZ/w4209I1yf5TQlGTtKNOlH86Zty7b/CD782dK7/9JQPoKrS3qrdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nMRuk0di;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DCPkSJ56;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB510606A320
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 23:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB510606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nMRuk0di;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DCPkSJ56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795130477; x=1826666477;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TuN87agKzcCTzBNqdCBncjMlunbZoa66uJOmrQDxtVk=;
  b=nMRuk0diY+6J06AJWNtY1mPzcWPKzVSu9VTNAesrM0iQtvCa/Mfg2DUW
   0MVTRtTHzNbVnwsaa6WdFRGOBrSFiybU90Q6rUkgMG/XMq1XYrUVId4T3
   +KY6pBSh7Eufmlg4Q0xSRGbueEGnK6LacqrgwtV8UeX9dWifrLllsdy0V
   h3iOk4EhgFuyOkctAdPi/WiY0qsJCiN/nxEeynBYGs25IQqDlRxzPbPpt
   yEG6MRmNGmzBpreNQTky8lwNdX1zmmsevhIeN5eWOS7R0/xLkEZLgH5Cf
   VmqNHmEKb7D3/ipyznYURgUiErjrqKNdZZGSAfMabdkavJOSlFdneMCMA
   A==;
X-CSE-ConnectionGUID: WIHJy6YgQWiuYVHC99Iovw==
X-CSE-MsgGUID: PsZZkt1STty7lpwaOJ+PbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4008902"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4008902"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:21:16 -0800
X-CSE-ConnectionGUID: d1YPKDUzRiuJmtDQa0L+Fw==
X-CSE-MsgGUID: tQfswZRSTBqhJREfovUE9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12263491"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:21:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:21:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 15:21:15 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:21:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuwQfZTbL9m1mc/x8czYve5rBzatjb2Q3aoBGcWe5JVdgX0ysAU6YbosFxeaGPFIyYVKN4NJ3ubdOa8CRE4M+k4pjr7BuD4rMzJ/Mxrzflst8wELZRCoQIzjw1Y27Gg890vf4AaGtKYY+dqiIuBda64dnOcNnv0jIF4WJVP/hkAS7V4ZPGwyY5luwUJrJRznvfxCvT2HdiTM4m9pjKqKMWhA9bI7tq5GWaS7KMzHnjqnp7CpAsHcHxEFmRhXogEzMLb1boCU9GXaHy+AxIRCVuoDTQoaDyduGdXpSrRkhEhcrY0jWmVbf8Q5Xfc2sh3Og99PXNOkZ2jqYwXfTiOAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuN87agKzcCTzBNqdCBncjMlunbZoa66uJOmrQDxtVk=;
 b=AIUIwegS52++Ckz93HhITCYEkrfP+JifLPIh+HMyOcwP+Py7s1R7vDcuDGPos93KR7a7p1+QlPRpzLNZnjqn0mfveOqN0Kmy2CIC+izSCihsbkuv3B/GTF5tthxsbPs1uqQGkqemuCvenlfv2MkiMT+Ky9pwSkjuGwJJU6cP/s+Ya9DLHdfzd+PIkqdYExPEJ/MO0KVAWkqJYUgeqgvYL48VxOq9C8EnmEbk2xXnRjgZcdmNlU+sQauB6H8uCCRigvDrKVjP74OjcVJjxXfOdo+p0L6LYMzkG1EPDPJmYUL8qMzF0ixopzr3koorRKATsN4pevxd5Aiu19rLjXBUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuN87agKzcCTzBNqdCBncjMlunbZoa66uJOmrQDxtVk=;
 b=DCPkSJ56IGEjmrw9B9MMIHYIKgGHPI3ge8oNcfYCXgznLKxwVgM9n0tMP3PvK4/cNyQ/C+vkser9wGQfK9YKGJMQOc+s5iXYRuOzCmoF+lrFqwgja+DQjjlMhv3SqKgh8VYPhmYB/PD73bWhtat/DxpC8o1UdpMUC6RsxHCqIow=
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by SJ1PR11MB6081.namprd11.prod.outlook.com
 (2603:10b6:a03:48c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 23:21:11 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 23:21:11 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/11] drm/xe: Do not claim flat CCS without a graphics IP
Thread-Topic: [PATCH 06/11] drm/xe: Do not claim flat CCS without a graphics
 IP
Thread-Index: AQHdcWlQyxTTf2xgPUKah4+xiJlC3bcoNKcAgA3h14A=
Date: Thu, 19 Nov 2026 23:21:11 +0000
Message-ID: <7afe1da0112fcd6ff8fe2ae14f6129226959c2d8.camel@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
	 <20261110231442.218721-19-stuart.summers@intel.com>
	 <sashiko-outbox-208170@kernel.org>
In-Reply-To: <sashiko-outbox-208170@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|SJ1PR11MB6081:EE_
x-ms-office365-filtering-correlation-id: 8fe6c9e2-5001-435d-4238-08df4693cc4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261022075727099003|38070700021|4143699003|10067099003|56012099006|11063799006|261028144727099003|261026121527099003|261021121427099003|261022105027099003|261026140227099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: VJycTO5W0iA6HFFdzGgUwk6lgjJM46BgkMRiMtlWLHl+pB+5OqIAmdd6htsQW+akI79cLgyWqvyxuyMLM171Z3aJlgbFwjd2Fb4KOmP3CvuZNyWO9WN7imwzpwmltpD+UDaaQHoKoVV8xA2QV/FXrVlagONI1BlZxAWr0XR0OK71kTl3NUNmc5+jBTuOCIrGeRJRib89vgQJGDPdd1uQ0Jpk6FK7iLrs1TVr48JM5v18tI6e2P8egcz3n+toT8TjFuLPlpJMUvo9DgFnTqrnFVJBSdCKIUr3ReYwS0UMVtUzzTPiWuhUGbLbMhRkUX+GsdvyHbatwVSYNiumPsrLzG3wY6m0vjGktiOnUTobeIBvpLCW9793+T3ykWYHPEShLBQ8sRMuPr75i1dnTjvDGaoruYlrtnhJ/PFQc2bpMUrjPSiv6ISSn8rTPJuD7YCO6luwHPXGxdm/7EQGX/ZdCVNmwbqxfWlJFWt2RZmorgEAdNCy+l2WIhYK8391/Cptfd39vf+u//oAVmbjVMKllqsxvxSq/MdvH60TJM+YGOdZy7o9sEOJLGT8GSCau/AHtbltlSo6vTOf9AojHdTRur3xubhmtqh0/rnusFhvROanjv0J6fQqVTdSyiaYYPCuJneeTTsSG68xWvO9NDxlVHlZWo1OuS7x6sAuqVCS3b9hwWMvXctd3T3sbx3PLXBhm1PPqcKhfxkyabO143Yv5QUBupnQ7iYraV+cF5d7zyI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT6PR11MB072844.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261022075727099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(261021121427099003)(261022105027099003)(261026140227099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUpkbm90b1pZdmhMQ3UydnJGK1VsdXlFSFQzMkh1NHJNQXdaamtHTVJWZTFs?=
 =?utf-8?B?Z1BWenFPeFpxWXVNWjFYOXUvQ1lCQ2tFTXhUdzdocGJMRDJjY2YzZTlML2ZW?=
 =?utf-8?B?L1Y2eSt6NzRvd3FKNFc0WFN3NDY2citSdkxUTHNpRHFBMDVjL3NUYjhBbXZU?=
 =?utf-8?B?OEdya0FYaHdEVFpBRHJ2VXA1czBGWDZ1c2pYSHp5SStEVktHQ3BJbVcwL3Vm?=
 =?utf-8?B?a2VSQ2o5dW44NHBXM3FSUVhwTS9LcjJMWXVCd2x3dGFuYmp5UkdheXdXdnZl?=
 =?utf-8?B?dHlzbEhxOVFZU051dkhJRXBhdWVyQ1M3MXpYRFMyN0srSzg4b0xMck16RWNa?=
 =?utf-8?B?bHh3ZHNrelo4WjBjQkRVL3FxRVA0Y2IwT3J2T2hDWmR1UkU0NisySDQvbTk5?=
 =?utf-8?B?YitFV05wOTcwR0ZuTVVQc3V0UmJLaFA3VEMrRHVUQUdCYWNoN0I5UjNBQTU0?=
 =?utf-8?B?NWpmZ3l5U1hYM0F4TS8zS0VLV0J4dDdsb3ZUakcxQnN2QVRhOWxxaXRBc3Zz?=
 =?utf-8?B?V0NoOFdVYXBKS0tkWVNRTmsvL2NuZnBrenRqdktzUjJ4eG01dXZTeU9ycUoz?=
 =?utf-8?B?UStMRkFwUDVHWVM3U1UzTW55SDJtdXVqMTNzK3FYMUppYm9LQWdVbUdEOElo?=
 =?utf-8?B?ZWVBT3VMNk51ZHZ4cHRxZjYrUk4xMVFSbStTV0FMaU9VVytPWHNOMGNpbTZt?=
 =?utf-8?B?RUhCZ1NORDZwRk5CZHlXbW1HNVA5d2h4M21IQ0tLY3lLS3dtbHRTSG5uTE56?=
 =?utf-8?B?cWQxOGZEN2s1dmh2L09qbGt4Q2p2OTVBc1JUR01nT0FvNHV4MHUwR1Y2Rk1l?=
 =?utf-8?B?WWV2SVdyWkphQjdySnc0L0dNVjFIZmUxbkxaMTVCVERHRElKaFZtSE8wUk8v?=
 =?utf-8?B?MjNhZFVUOGh3KzdqZnZ6WkpZMjhOY1RvcG5UdFMzUmc5MkdVMTdYakNzdzlF?=
 =?utf-8?B?ei80SkNtREJJYVVoWjM2NFVzelVLbXY2OGo5SVlrYTlGMytjSWpqMFdHLzUv?=
 =?utf-8?B?SytsL2ZGRGtGZ2UwYVpVZ3NWYkhDM0FueFdZa3pldWw2bWN1ZDIxMkNzVjV6?=
 =?utf-8?B?R3JLSS82U3BJYnpkTVdkbW11b1dxZjJReVA3ZTM2d1R2byswc1p6T0lFUzZm?=
 =?utf-8?B?aG1uZVV3L0JSMWhVSEQxcDVienhjUFFqd3REVndvQW1qcEVzb051aTJCemx6?=
 =?utf-8?B?SWkvbFJuU2wySW1kN2l1aU5mMUw1T1lBZ1NWeUJXR0RVWFFUTzNIQW10eElY?=
 =?utf-8?B?YmtiWHVJRDNEdm00OCtVZDUwTG9hTnBqSkw5UjFNV0xkeFgvRjVhdTZvTUt6?=
 =?utf-8?B?N3J3TUwwY2JyVnNObm90VmptME1HaU5Rc1FlWnNrc0U4R3BGUElVWW10Mlli?=
 =?utf-8?B?YVJCWmdCTFJZYlV4aWwwMWZpUUdma3Z4TWF5YVVZK3RVdW1vRndtUENZMnVJ?=
 =?utf-8?B?UC8zTmRzUkdUQWdpZEkzcEU4a1diUUZ5Ui9udWkydmtrbXdDKy9MM0syRyt0?=
 =?utf-8?B?WStrRjNnVlNuTnk5UmYxZVhBNExtZTQxMHViTlpVdU9pNHFpTjFOY2FicldO?=
 =?utf-8?B?bkdOTFFQME1OQmkwaXhUdGozdituYlhhajhKUit5eUlYZ21QOUVaSEU5Mmg1?=
 =?utf-8?B?eXVtRDV2cjd2NGFtVU1HZTdiRENzOUJCV2s2aHNocGJseS9URE42Z1hNSEJx?=
 =?utf-8?B?cko0bG9qK2Y0ZnhRd0hhSVY0anZhZERuNjRITEZvL280bUU4OWJGK3EyS1NC?=
 =?utf-8?B?SDZneHdWc1dOZlNsRUZ3UHVLUlJJSk95em91OXpqUDgzcGY3YXZKcVg2WEUw?=
 =?utf-8?B?WWhWZGtNMFMyejFoNVNmWWdxL050V2N2Z2Y4TE1XeUtzTFJKUnpFQURJenZh?=
 =?utf-8?B?NVpvSFM5anZGbll0QTZpZXFRcUM1THBoajk0Rzd4S2MvdkxlaDI5QmtBcTNo?=
 =?utf-8?B?MnFlUW9CZmFQQ2kvT25EM1I5aGp1OG1mbVEzTUQ5ZXVWRThIMnFnWWFWYjFD?=
 =?utf-8?B?MTRqUTByM0VkcjZNZU9kR2FOcXhtUzMwOExxalV5TWNieGZzM2piR2dnM1dH?=
 =?utf-8?B?NWprZUFLTjdoQTdZMmZMc0dzM2UvOVVpL2s2emtTSDZOcHEzY1I4cnBnM20x?=
 =?utf-8?B?eG9qeGwrZ24xeUZsdjM3UlNPM2t0T0Uwdy9BckJoenp2RndQS05aMUxJK3ZY?=
 =?utf-8?B?WEs5NncvNk8yTGtWQVhmTkVUbWdkblFQeVZZb0NHcWZoOG8yMCtVV2JTcVJM?=
 =?utf-8?B?aEI4eEozb3c1QUcyQ3VhV0ZoWmtrWTBsUGVLZ3NEN3FJUUQ1SFArL1ZBcUtU?=
 =?utf-8?B?eXVnWkIzR2cxN2Yvb2QrUDlEeE5yaTVMTjR6cUV1SStkb2N1cDYxbWIxYS9r?=
 =?utf-8?Q?iVHz9bFJB6koVdnA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2C7BD823816F34D931BF72F8F07E23D@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: p/4+S3ZktBX0djVUU+mRUf/sam6q7aIwKSsv9gyaXaujPcN2d+wN6fNqZAMbJ0SuP2p/AvcSMiW0ISgwV9YrfTQqcfrHwT47QKJb+dHRqgJzH+VwEGBJSVf7mw3wa4Y9dyHxw1O0uWwKAJKZaD/FI9w023w8c4ZjfPc+mFeQUFFrH2WuZ/cvj9+hV8a/WX81s62RcervQcRs70CJCSb0IBGZlOf9aWY/cqWAyyYEx26xv10QLvwsELAB6iKpPfScmBtjZPKrlVy0fdxgz+dUCY+hekAQwCvSR0TwW53vSVpsZ4451OiX4dPhi0Vv0OpwpBeZbfCbw9RYyPalpF1C2w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe6c9e2-5001-435d-4238-08df4693cc4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 23:21:11.1400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8g61SiLuLn72l2iIdlW7qztz8EO1Eyv33IWZMOz8YVb2eg26SAjhar4jVWtJl8dcXkRrjbF+8eYWp63jhsWOzzfmkz4Lw0sFtAFkvtpcqnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTExLTExIGF0IDAzOjIxICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAyIHBvdGVudGlhbA0KPiBpc3N1ZXMgdG8gY29uc2lkZXI6DQo+IC0gW0hpZ2hd
IGRybS94ZTogY2xlYXJpbmcgaGFzX2ZsYXRfY2NzIGluIHhlX2luZm9faW5pdCgpIGVuYWJsZXMN
Cj4gQXV4Q0NTDQo+IMKgIG9uIG1lZGlhIEdUDQo+IC0gW01lZGl1bV0gZHJtL3hlOiB4ZV9pbmZv
X2luaXQoKSBsZWF2ZXMgaGFzX2ZsYXRfY2NzIHNldCB3aGVuDQo+IHByaW1hcnkNCj4gwqAgR1Qg
aXMgZGlzYWJsZWQNCj4gLS0NCj4gDQo+IGNvbW1pdCBmNTU1NzE4NDg0ZDdhODM0Y2Q0M2RmMjcx
YTM4NGE3MWFkYWNjOThiDQo+IEF1dGhvcjogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJz
QGludGVsLmNvbT4NCj4gDQo+IGRybS94ZTogRG8gbm90IGNsYWltIGZsYXQgQ0NTIHdpdGhvdXQg
YSBncmFwaGljcyBJUA0KPiANCj4gVGhpcyBjb21taXQgY2xlYXJzIHhlLT5pbmZvLmhhc19mbGF0
X2NjcyBpbiB4ZV9pbmZvX2luaXQoKSB3aGVuIHRoZQ0KPiBkZXZpY2UgaGFzIG5vIGdyYXBoaWNz
IElQIGRlc2NyaXB0b3IuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcGNpLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiA+IGluZGV4IGIz
ZTVjMDI1Njc3Y2YuLmU0MjIwY2IwY2MyOTggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3BjaS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+
ID4gQEAgLTExMDYsNiArMTEwNiwxNCBAQCBzdGF0aWMgaW50IHhlX2luZm9faW5pdChzdHJ1Y3Qg
eGVfZGV2aWNlDQo+ID4gKnhlLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
eGUtPmluZm8uaGFzX2N0eF90bGJfaW52YWwgPSBncmFwaGljc19kZXNjLQ0KPiA+ID5oYXNfY3R4
X3RsYl9pbnZhbDsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlLT5pbmZv
Lmhhc191c20gPSBncmFwaGljc19kZXNjLT5oYXNfdXNtOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgeGUtPmluZm8uaGFzXzY0Yml0X3RpbWVzdGFtcCA9IGdyYXBoaWNzX2Rl
c2MtDQo+ID4gPmhhc182NGJpdF90aW1lc3RhbXA7DQo+ID4gK8KgwqDCoMKgwqDCoMKgfSBlbHNl
IHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoNCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogRmxhdCBDQ1MgY29tZXMgZnJvbSB0aGUgZGV2aWNlIGRl
c2NyaXB0b3IgcmF0aGVyDQo+ID4gdGhhbiBmcm9tDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIHRoZSBncmFwaGljcyBJUCwgYnV0IGl0IGlzIHN0aWxsIGEgZ3JhcGhpY3MN
Cj4gPiBmZWF0dXJlOiBpdHMNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICog
bGF5b3V0IGlzIHJlYWQgYmFjayB0aHJvdWdoIHRoZSBwcmltYXJ5IEdULA0KPiA+IHdoaWNoIGlz
IG5vdA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB0aGVyZSB0byBiZSBy
ZWFkLg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGUtPmluZm8uaGFzX2ZsYXRfY2NzID0gMDsNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgfQ0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICh4ZS0+aW5m
by5wbGF0Zm9ybSAhPSBYRV9QVkMpDQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IERvZXMgY2xl
YXJpbmcgeGUtPmluZm8uaGFzX2ZsYXRfY2NzIHdoZW4gZ3JhcGhpY3NfZGVzYyBpcyBOVUxMIGNh
dXNlDQo+IGhhc19hdXhfY2NzKCkgdG8gcmV0dXJuIHRydWUgb24gWGUyKyBwbGF0Zm9ybXMgd2l0
aG91dCBhIGdyYXBoaWNzIElQPw0KPiANCj4gV2hlbiBncmFwaGljc19pcCBpcyBhYnNlbnQsIEdS
QVBISUNTX1ZFUngxMDAoeGUpIGlzIDAsIHNvDQo+IGhhc19hdXhfY2NzKCkNCj4gZmFsbHMgdGhy
b3VnaCB0byByZXR1cm4gIXhlLT5pbmZvLmhhc19mbGF0X2NjczoNCj4gDQo+IGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9yaW5nX29wcy5jOmhhc19hdXhfY2NzKCkgew0KPiDCoMKgwqDCoMKgwqDCoMKg
aWYgKEdSQVBISUNTX1ZFUngxMDAoeGUpID49IDEyNzAgfHwgeGUtPmluZm8ucGxhdGZvcm0gPT0N
Cj4gWEVfUFZDKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxz
ZTsNCj4gDQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gIXhlLT5pbmZvLmhhc19mbGF0X2NjczsN
Cj4gfQ0KPiANCj4gRHVyaW5nIG1lZGlhIEdUIGluaXRpYWxpemF0aW9uIG9uIFhlMisgcGxhdGZv
cm1zIHdpdGhvdXQgYSBncmFwaGljcw0KPiBJUCwNCj4geGVfcmluZ19vcHNfZ2V0KCkgdGhlbiBz
ZWxlY3RzIGF1eGNjc19yaW5nX29wc19nZW4xMl92aWRlb19kZWNvZGUgYW5kDQo+IGF1eGNjc19y
aW5nX29wc19nZW4xMl92aWRlb19lbmhhbmNlLCBlbWl0dGluZyB1bnN1cHBvcnRlZCBHZW4xMg0K
PiBBdXhDQ1MNCj4gcmVnaXN0ZXIgaW52YWxpZGF0aW9ucyBhbmQgc2VtYXBob3JlIHdhaXRzIChW
RDBfQVVYX0lOViBhbmQNCj4gVkUwX0FVWF9JTlYpDQo+IG9uIGV2ZXJ5IHZpZGVvIGFuZCBwYWdl
LXRhYmxlIG1pZ3JhdGlvbiBqb2IuDQoNCkknbGwgcmVzb2x2ZSB0aGlzIGluIHRoZSBuZXh0IHBv
c3RpbmcuDQoNCi1TdHVhcnQNCg0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IFdoYXQgaGFw
cGVucyB3aGVuIHRoZSBoYXJkd2FyZSBoYXMgYSBncmFwaGljcyBJUCAoc28gZ3JhcGhpY3NfZGVz
YyBpcw0KPiBub24tTlVMTCksIGJ1dCB0aGUgcHJpbWFyeSBHVCBpcyBkaXNhYmxlZCB2aWEgY29u
ZmlnZnMNCj4gKGd0X3R5cGVzX2FsbG93ZWQ9bWVkaWEsIGFzIGVuYWJsZWQgYnkgY29tbWl0ICJk
cm0veGU6IEFsbG93IHByb2JlDQo+IHdpdGhvdXQgYSBwcmltYXJ5IEdUIiBhbmQgY29tbWl0ICJk
cm0veGU6IERvY3VtZW50IHRoYXQNCj4gZ3RfdHlwZXNfYWxsb3dlZD1tZWRpYSBub3cgcHJvYmVz
Iik/DQo+IA0KPiBJbiB0aGF0IGNvbmZpZ3VyYXRpb24sIGFsbG9jX3ByaW1hcnlfZ3QoKSByZXR1
cm5zIE5VTEwgd2hpbGUNCj4geGUtPmluZm8uaGFzX2ZsYXRfY2NzIHJlbWFpbnMgMS7CoCBPbiBk
aXNjcmV0ZSBwbGF0Zm9ybXMgd2l0aCBGbGF0DQo+IENDUywNCj4geGVfdnJhbV9wcm9iZSgpIC0+
IHRpbGVfdnJhbV9zaXplKCkgdGhlbiBjYWxscw0KPiBnZXRfZmxhdF9jY3Nfb2Zmc2V0KHRpbGUt
PnByaW1hcnlfZ3QsIC4uLikgd2l0aCBhIE5VTEwgZ3QgcG9pbnRlciBhbmQNCj4gZGVyZWZlcmVu
Y2VzIGl0IGluIGd0X3RvX3hlKCkgYW5kIGd0X3RvX2Z3KCkuwqAgT24gaW50ZWdyYXRlZA0KPiBw
bGF0Zm9ybXMNCj4gd2l0aCBGbGF0IENDUywgbGVhdmluZyBoYXNfZmxhdF9jY3Mgc2V0IHdpdGhv
dXQgYSBwcmltYXJ5IEdUIGtlZXBzDQo+IHhlX2JvX25lZWRzX2Njc19wYWdlcygpIGFuZCBoYW5k
bGVfc3lzdGVtX2NjcyBhY3RpdmUgaW4geGVfYm9fbW92ZSgpDQo+IGV2ZW4NCj4gdGhvdWdoIHhl
X21pZ3JhdGVfY2FuX2JsaXQoKSBpcyBmYWxzZS4NCj4gDQo+IEFsc28sIHRoZSBjb21taXQgbWVz
c2FnZSBhdHRyaWJ1dGVzIHRoZSBwcmltYXJ5IEdUIGxheW91dCByZWFkIHRvDQo+IHByb2JlX2hh
c19mbGF0X2NjcygpLCB3aGljaCBvbmx5IGNoZWNrcyBYRTJfRkxBVF9DQ1NfRU5BQkxFIGFuZA0K
PiByZXR1cm5zIDANCj4gZWFybHkgd2hlbiB4ZV9yb290X21taW9fZ3QoeGUpIGlzIE5VTEw7IHRo
ZSBsYXlvdXQgcmVhZCBpcyBpbg0KPiB0aWxlX3ZyYW1fc2l6ZSgpIC0+IGdldF9mbGF0X2Njc19v
ZmZzZXQoKS4NCj4gDQoNCg==
