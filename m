Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C678D356A0D
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 16:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639690; cv=fail; b=WlonddAAQF2lmco4jhSgiMCPMy5g6ch9yAKSms6hY4Agk64ppx1Tz9wt3Xo06+S2mF0rQWjwlMg3xHM+GQ2PCfa9KpHxHQ0SSl3Yc75VPkKQ+0DesZ2IjUR5LHKk3IEAWT/C8J9L2yqjhuWCAErRV1ZurV/tvwsroV4LbiJYt+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639690; c=relaxed/simple;
	bh=sgyueNvJsfGPEeneEbU4EEJstAGwhcB7uapVd7OmT/I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n65h6hF/QjYVw9RgVZJLnGajF0si4A7X0DjG/YmuNsIcE1SV+UyXKMPNgMehpaaqEaCGg4xKd7BIyP27iGQqCvwWu6a7KhgygU3hmtlOb64Gio3Slb2zevOLFJR8yZ7h+4rvmF4uVaAgbnGUkuzcgZceX4FzxfFqKNUr99gTnCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNKDa0VW; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNKDa0VW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786639688; x=1818175688;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sgyueNvJsfGPEeneEbU4EEJstAGwhcB7uapVd7OmT/I=;
  b=CNKDa0VWsK24JESzvjTZteg93aRA5mr6QraGA2POUcg/xIQQsXS/cUOy
   WjU3PtADYlHLKcHJq5Pdvo/RA/raqgHHnRhTZM8XI77MWkcBOBG0bB+uC
   1Upq5lLQJj2dxEQ/HMytDds8HKMo9x0r34Jd68YLSYiKln2u2TFwWtCbT
   MpIWojkAksPJ42nCeqbp1d43vTl0lDG3Vhlht/QgVY668zV+Y7qy25XOK
   l/PAkd7CEe1Mpzo6b4gHgEcRr2aUGpJYVwAJ1j8+n2N1BBjN9me1cBRKh
   z2+maOdvj45t/+IQ3TBdke4cDlKxzXsH5GA1d02tvgkUiayNQO46oiWDa
   g==;
X-CSE-ConnectionGUID: Zf3GGjeFSgGsAaeXHW16Qw==
X-CSE-MsgGUID: h54UmD6vTjqs6JG5oDRfjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="104750970"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="104750970"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 09:48:07 -0700
X-CSE-ConnectionGUID: urJhUDOFQRi1VWm8Ck4l5Q==
X-CSE-MsgGUID: pAnV+bR3Se6SBt6CVNKrjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="265980009"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 09:48:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 09:48:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 09:48:03 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 09:48:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vq53hgpZ/rANMG5+x+Es2CqhQMKS5RRhSZ5s7qZFwdloOvgCf/zJeyHnUCKL4HVzrKby1xZZmh5Vp0Cwv8qf6b2hY4C3SoIoyZZRkzecucI0T42/6vWtrQ+r/CBxip/tth7d6CB/TRFvMb4GYIfIempkk56QvjvTmd0hryNZ84zbd6dQr2mC6QtutK5b1kdGwnWv6PQOD+lrbKeT5/J+tixC/s10it+P0iocUzzPnxKQnj8cgStzRVnwXGaLKqXz0CdJXmEERhs7UHwtysrJEIdDb5/69wulPSNuJP52Gd98XZ+iHOimOY+R6Tkv+C8AFj0ix59ezVCGNvZ9RKgO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgyueNvJsfGPEeneEbU4EEJstAGwhcB7uapVd7OmT/I=;
 b=u3KxhYzSM9imIZXuYP6i086J52cGoMaaqqrB/kBudBsBAIzEohqJ2xLoHhn1Ic1TcpmqAjPclQVFI4HCIF9jywHd93+M3ZMYCkLQVqRTU6tA1/B8CCLVSPKX3y2/aBC0cJOI8K4yOUxDHopIvdZzWFCnxUFA8hcQJsJoaDFhsrqyYO+1v3KO5Yr5zVuxkLu22qZDeEJsyyIYZUxJx30dsErxc7Wb716xatp977NTroPJnC3vUWxuBmbYqmPJZPNoqiqXZocRbw0yGMi/qde7uPC16DJFrA2uqaDXl1FFX6YiSA1iDQSB6iayjemvIt4JTw2HWiSXYsujgsbLp/f1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 16:48:00 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 16:48:00 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 10/10] drm/xe/vsec: Update PMT internal access for CRI
Thread-Topic: [PATCH v2 10/10] drm/xe/vsec: Update PMT internal access for CRI
Thread-Index: AQHdKpIrSjWWYTsQg0+xkdZu+nCqULaa1oUAgAFbGhA=
Date: Thu, 13 Aug 2026 16:47:59 +0000
Message-ID: <IA1PR11MB6418969FB712931E53A09917C1DB2@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-22-michael.j.ruhl@intel.com>
 <20260812200450.9D1861F00A3A@smtp.kernel.org>
In-Reply-To: <20260812200450.9D1861F00A3A@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|LV8PR11MB8607:EE_
x-ms-office365-filtering-correlation-id: a12a7b7f-d969-41be-c760-08def95aa26a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|38070700021|6133799003|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info: HNyudaP3Qp1vU8H4WVj8t2AmMRNKn2pcv8yT37Zrq5ttSoIHTTKr0BL+/nKYzCw/N1ib7ImqT5kOvcyXMF7qmdogyFDdXaArFAuRtwWdPwqI+CcGnTaDxtc49PTHXm7ryPWToZgghYGmcM1Y9CB3Pd+10DLgpmLBwqbGfeA28GUFLLK/f7q+oqfdvowmmqnoU/EvtittHp9b1/A190NC99vhVLMBmKAE7ZNyzoXXneF9eqi+EsIjCDBfktmzPxsQ1KhIKHWPSmQej1kTQy3FD0GrLIH+WmWLznKnqr2CefKOsTMGgc64htKM2J+qkPYIoJ8ofMo5tq/75bZ6JUHS4elCJvkXPErk7FDI9ihgvi2X45F7HcDeaZLP0ZvBiacRCN13d8RTPzBoOVQA+M0nK0EtI1+QmWOGTXFDNiDPIuUcJwJds+xQHM7uM3/F7MUsQXs43S1NzwA98Q59RGkcV6QN7odMFQVvjYw9KhHE6oqxKxJ7yZJhnMcgsTz85iNA7Lbz+4jNmdRjt1QhVLu0dTKfc+Fu+j1GOxMkie6JNcX9w6bqYTdsxEVhIJUp+TmWPuEdxBAwxMY79taIROYYIqwR86thkxTqLYimgA8bLH40GHQ/gg4d3ODJzqRRvIeuAromj/b8+d5k7LUuUlzgLamZ86Fb3XtM0IGxe9Krkwc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(6133799003)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTBxU0grOXM4UUNMMXgvQTJ6ck9NYk5NTENNQ1ZzVG8yUTJjbVlhbHl3b2hz?=
 =?utf-8?B?eUhyQVc2RjFUcW02K1R4bElxNTFBYytaWWo3ZzAycUVoUTEvMkppSEd2Uk1G?=
 =?utf-8?B?bHF0dmR4Nzd3OENib3JkMytyZUwrTUpiOXdqVkVYUVg0OE1DREJmdnVzMEF4?=
 =?utf-8?B?cnlFV1Y1VGFISXo5MDRjK1c0bWkvNlI4eHJHRnZtbHVZUVRtVHdEWFpRZEJL?=
 =?utf-8?B?Rk9kRjBOYzk2QWdVVHF4YldYd2Uvd1FVMmpXaXNlNmh4dWs2aHF5am5mTkYz?=
 =?utf-8?B?K0pvOFNDSGhETDhTcmEzL1FaME45eC9XY1hFTDN5d0ovYUtVNGJ6QmpZZHR0?=
 =?utf-8?B?TGVHakFrTHIxUnNGdWRmQVFJZjY3eWJLS1Y1YjA4Z3pPSk81U1RTWERQSk5V?=
 =?utf-8?B?MWErZHVad1JtSHJjU2g3OEdxai8zRk9Va1RLMEhyN1hBNS9xQzhnQkRNQ0FX?=
 =?utf-8?B?R3ZUZnR5V0QzM29vaHdWVlhaZFMrdVR0WVZYS2hDazlrQktIRGdjYVB2SXlV?=
 =?utf-8?B?NFRxbi82eGxXV1huWmhGcWlFdHJ4bDM4V3dnK3h1T3JaS2NQYVF0MTZ3cThZ?=
 =?utf-8?B?UGwyNjNFak5aY2RaYVp0STR3V0laa21ESE9CZXNqb0tZWjV0MGpMM3lUZmdj?=
 =?utf-8?B?SWsxd1ErVUlvSFJMdDBYRkhXaFZTdzZONFpyU2xQWGFaSms0S1RvdkxtRDRq?=
 =?utf-8?B?OXlLd3B0bkdPSmd5Zi9IWFh5NUpYSTlBeGN3azlCQWMvWEVEWHYzYVhIYUM1?=
 =?utf-8?B?Vy9aRlk1eGlmQmxFZ08xZ0Q1aDIxTmNBM1ZnMDcvb1hyNFdQcGhvdGsxWE5Y?=
 =?utf-8?B?MVZHWDBVclFudEtNbnp6RjV2SithT2Y1YW9tUWNGaUZ3SUJycE1ES3ZjMjhZ?=
 =?utf-8?B?clcyKzVpNmx5YmlhVUprbERSckJoM0pyZ0V2MGtmRVVMMmRzbWY4TjYxNERQ?=
 =?utf-8?B?NDBOMnVJZllSQmUrR0NjaGw2dlpZRHhNbGg0NE9wVmVUVXYvTjBDNUY3YXM1?=
 =?utf-8?B?WSt1N1haOXZYUHhLRHUvc0laRG9yVnBkNEMyRlZnWXdlMEd0N1ZXS0VPVVQ2?=
 =?utf-8?B?dnkxUk9yMVJMNGpLK1JhQitRckovNUxta0hkMGJ3Q3B6SWFma2dUcG5ZRW8z?=
 =?utf-8?B?YzRMcGpHODJwNHJZOFR0UTRBQmJjMmk3T3lyQngwVVI4dDlRNVpHUEtBVEUr?=
 =?utf-8?B?Mm5kYkhlL1ZjWDVYY250MnJhWm1XVklSemtTS0R0dnlBUXNLRjZwYUhlVk9p?=
 =?utf-8?B?bUtlRVc2bHBqY3VIbGV1czBOUms2ZU8zVmZveHJiYlhqRjV0YkxiOEE4WlVh?=
 =?utf-8?B?ditrMHd6dnV1NU5BeWIxdWpOZE93UG9iR1Y1VU1nNHJYb3k1Q00rbXZWVFFH?=
 =?utf-8?B?MlhFVXVCWDNpRENwazVsQ05OZDB1THcwaWpBK2lkMkx2Yk1xcU9DdkdmVVFE?=
 =?utf-8?B?MzlDUWZoYkgyQnQya25zTEpoTVRmSFpYRHQyYWJVdFhRdUZrdFlRbjNsUElT?=
 =?utf-8?B?cnlZMnkrV1lEb3FuWUJyb2VOcnEycWY5amxKSVV6ZkVsempyNnB6eTBnazhH?=
 =?utf-8?B?dHFSR21jZUlxSWU4aVhLWldKYUYvMFBWUThmTXA2aStJRGZKZGtRYU5EUFhy?=
 =?utf-8?B?Yzc3WUowR3ZlR3hVZmd5dmdVTjQrRHBNb0hSLy9QMStpL21pLytmaUNHYzg3?=
 =?utf-8?B?TCtrc2xaemRNU2F3NGdwZUp2VmVWK3BiSWQwaGFXeU45OXdhMUN5bGVmV1g0?=
 =?utf-8?B?cGVzK1ZKYzN5RCtGbkZXSGFaR3AvamZzTmhjY3N6czh3Z2ZtU2U4Y2lmRlZG?=
 =?utf-8?B?a29RYnJHRkhGY2lid3N2bUlFUjNXQkNXbCtHSGNFbGJUR3hqL29yWGxaQ0gx?=
 =?utf-8?B?UlNWbmZBLzJpbGFZN0NzTjB6dWxSZHRaazR3NGJ3YkRsb0xocXZDeXFmYmx0?=
 =?utf-8?B?YklJblBCdVBNNnpqRHhUYjhTUG1sOGExM0tNMHFFWFZoK3JJZ1BKMFVyVFdC?=
 =?utf-8?B?am1VaW5YckQvOXZDb2UxZ25hZHBobkpEMVJPNUtUVElIL3lzRlBNTnhWWGV4?=
 =?utf-8?B?b2JwbEVZVkNuZllWWklETVkxeEYyTkM4aU05NzY5NFpWMUViZUZvUFpobEc0?=
 =?utf-8?B?WnRZbFVrcHJEM3JOOUFpY2ZPUmc4WlVzKzJVUllPU21vbVZxRmJ0dC9xeVpn?=
 =?utf-8?B?RzhnZDJjWUNNdXZqZEk0UllXUXJmMCtOR0F5WVYyRGRrN1hpN013WFRjMFdu?=
 =?utf-8?B?NFZNMFFEc2MxL1A1WjdNYkZTVWhtVENFSkRUajc4b0QwRjZSaW1IdDhkR3J5?=
 =?utf-8?B?SlljRjZqK2RiWFJVQUp3cGFJdEIxZS95VEJyQmgxK2o4R01IRWdCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: itQ3mG54qGNSksl7+59a45m3e8bmFwmUIfmO0eanKl5Dn55jg7Krd6PpA92O1GK8/EegA+qfNOJkeRp3hjv4qqVPCQHk01Rwi1iThcw6aGpU9cf0FrwMhzk7dCDILmmTwMi3pImOX8ckk0l/+xquaJhPzDDasTZwc1C0hRjOgZHh36vGhZpBPCUX98lYJgfMBpJAd53+0tTzJWcXGAvhzF2vh7Uy6dt9iVfLVN/FKB6s23HD3rVxRLQWVBZ8QruPeRrgEPva+ZNQG9nzSCtVcpEOQN/F8Uwn4yLw8Hz5gX5zRwraR/BpFXAHsV0e74vkjS+q7MhV9wwLW187X6VWdQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a12a7b7f-d969-41be-c760-08def95aa26a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 16:47:59.9803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8rg18Y098uivQ6gvBo+H2HZuVv4qrSAHYHwwOrw8Z7OYwVcoDgGNS17DI5W1iB/I/PTvfS9zxZ7gXNjYVcgr/HZPQcI1ihB1G1VUTaSyRno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8607
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxMiwg
MjAyNiA0OjA1IFBNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPg0KPkNjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJqZWN0OiBSZTog
W1BBVENIIHYyIDEwLzEwXSBkcm0veGUvdnNlYzogVXBkYXRlIFBNVCBpbnRlcm5hbCBhY2Nlc3Mg
Zm9yDQo+Q1JJDQo+DQo+VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBB
SSByZXZpZXcgZm91bmQgMiBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj5jb25zaWRlcjoNCj4tIFtI
aWdoXSBUaGUgZnVuY3Rpb24gYHhlX3BtdF93cml0ZV9yZWdgIGV4ZWN1dGVzIGEgZG91YmxlIHB1
dCBvbiB0aGUgcnVudGltZQ0KPlBNIHVzYWdlIGNvdW50ZXIgb24gaXRzIHN1Y2Nlc3MgcGF0aC4N
Cj4tIFtMb3ddIFVudXNlZCBgbW1pb2AgcGFyYW1ldGVyIGluIGByZWFkX3Jlc2lkZW5jeV9jb3Vu
dGVyYC4NCj4tLQ0KPg0KPi0tLSBQYXRjaCBbMTBdOiBbUEFUQ0ggdjIgMTAvMTBdIGRybS94ZS92
c2VjOiBVcGRhdGUgUE1UIGludGVybmFsIGFjY2VzcyBmb3INCj5DUkkgLS0tDQo+Y29tbWl0IGRh
ZDlhZTE5YjZhNjgwYTUxYzVhZDUzNDk2ODIzNGUzZDAyYmU4YTYNCj5BdXRob3I6IE1pY2hhZWwg
Si4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KPlN1YmplY3Q6IGRybS94ZS92c2Vj
OiBVcGRhdGUgUE1UIGludGVybmFsIGFjY2VzcyBmb3IgQ1JJDQo+DQo+VGhpcyBjb21taXQgYWRk
cyBhIG5ldyBBUEkgdG8gYWNjZXNzIHRoZSBQTVQgdGVsZW1ldHJ5IEdVSUQgYmFzZWQgb24gdGhl
DQo+cGxhdGZvcm0uIEl0IHVwZGF0ZXMgdGhlIGRlYnVnZnMsIGh3bW9uLCBhbmQgcGNvZGUgY29t
cG9uZW50cyB0byB1c2UgdGhpcw0KPm5ldyB4ZV92c2VjX2dldF9ndWlkKCkgZnVuY3Rpb24gaW5z
dGVhZCBvZiByZWFkaW5nIHRoZSBHVUlEIGRpcmVjdGx5Lg0KPg0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMNCj5iL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZWJ1Z2ZzLmMNCj4+IGluZGV4IDhkZTc4Y2QwYWEwM2IuLjBlZjYyYjFlMGU5MWYgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+PiBAQCAtOTYsMTEgKzk2LDE2IEBAIHN0YXRpYyB2
b2lkIHJlYWRfcmVzaWRlbmN5X2NvdW50ZXIoc3RydWN0IHhlX2RldmljZQ0KPip4ZSwgc3RydWN0
IHhlX21taW8gKm1taW8sDQo+PiAgCQkJCSAgIHUzMiBvZmZzZXQsIGNvbnN0IGNoYXIgKm5hbWUs
IHN0cnVjdA0KPmRybV9wcmludGVyICpwKQ0KPj4gIHsNCj4+ICAJdTY0IHJlc2lkZW5jeSA9IDA7
DQo+PiArCXUzMiBndWlkOw0KPj4gIAlpbnQgcmV0Ow0KPj4NCj4+IC0JcmV0ID0geGVfcG10X3Rl
bGVtX3JlYWQoeGUtPmRybS5kZXYsDQo+PiAtCQkJCXhlX21taW9fcmVhZDMyKG1taW8sDQo+UFVO
SVRfVEVMRU1FVFJZX0dVSUQpLA0KPj4gLQkJCQkmcmVzaWRlbmN5LCBvZmZzZXQsIHNpemVvZihy
ZXNpZGVuY3kpKTsNCj4+ICsJZ3VpZCA9IHhlX3ZzZWNfZ2V0X2d1aWQoeGUpOw0KPg0KPltTZXZl
cml0eTogTG93XQ0KPklzIHRoZSBtbWlvIHBhcmFtZXRlciBzdGlsbCBuZWVkZWQgaW4gcmVhZF9y
ZXNpZGVuY3lfY291bnRlcigpPw0KPg0KPldpdGggdGhlIHN3aXRjaCB0byB4ZV92c2VjX2dldF9n
dWlkKCksIGl0IGxvb2tzIGxpa2UgdGhlIG1taW8gYXJndW1lbnQgaXMgbm8NCj5sb25nZXIgYWNj
ZXNzZWQgaW4gdGhlIGZ1bmN0aW9uIGJvZHkgYW5kIGNhbiBwcm9iYWJseSBiZSByZW1vdmVkIGZy
b20gdGhlDQo+c2lnbmF0dXJlLg0KDQpBZ3JlZWQuICBJIHdpbGwgcmVtb3ZlIHRoZSBtbWlvIGFy
Z3VtZW50Lg0KDQo+PiArCWlmICghZ3VpZCkgew0KPj4gKwkJZHJtX3dhcm4oJnhlLT5kcm0sICJQ
TVQgZGV2aWNlIGlzIG5vdCBwb3dlcmVkXG4iKTsNCj4+ICsJCXJldHVybjsNCj4+ICsJfQ0KPj4g
Kw0KPj4gKwlyZXQgPSB4ZV9wbXRfdGVsZW1fcmVhZCh4ZS0+ZHJtLmRldiwgZ3VpZCwgJnJlc2lk
ZW5jeSwgb2Zmc2V0LA0KPnNpemVvZihyZXNpZGVuY3kpKTsNCj4NCj5bIC4uLiBdDQo+DQo+V2hp
bGUgcmV2aWV3aW5nIHRoaXMsIEkgYWxzbyBub3RpY2VkIGEgcHJlLWV4aXN0aW5nIGlzc3VlIGlu
IHhlX3BtdF93cml0ZV9yZWcoKToNCj4NCj5kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jOnhl
X3BtdF93cml0ZV9yZWcoKSB7DQo+ICAgIC4uLg0KPgltZW1jcHlfdG9pbyhkaXNjX2FkZHIsICZy
ZWcsIHNpemVvZihyZWcpKTsNCj4NCj4JbXV0ZXhfdW5sb2NrKCZ4ZS0+cG10LmxvY2spOw0KPgl4
ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+DQo+cnVudGltZV9leGl0Og0KPgl4ZV9wbV9ydW50aW1l
X3B1dCh4ZSk7DQo+ICAgIC4uLg0KPn0NCj4NCj5bU2V2ZXJpdHk6IEhpZ2hdDQo+VGhpcyBpcyBh
IHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgeGVfcG10X3dyaXRlX3JlZygpIGV4ZWN1dGUg
YSBkb3VibGUgcHV0DQo+b24gdGhlIHJ1bnRpbWUgUE0gdXNhZ2UgY291bnRlciBvbiBpdHMgc3Vj
Y2VzcyBwYXRoPw0KPg0KPldoZW4gdGhlIHJlZ2lzdGVyIHdyaXRlIGNvbXBsZXRlcyBzdWNjZXNz
ZnVsbHksIGl0IHVubG9ja3MgdGhlIG11dGV4IGFuZCBjYWxscw0KPnhlX3BtX3J1bnRpbWVfcHV0
KHhlKSwgYnV0IHRoZW4gZmFsbHMgdGhyb3VnaCB0byB0aGUgcnVudGltZV9leGl0IGxhYmVsIHdo
aWNoDQo+Y2FsbHMgeGVfcG1fcnVudGltZV9wdXQoeGUpIGEgc2Vjb25kIHRpbWUuIENhbiB0aGlz
IGxlYWQgdG8gYW4gdW5kZXJmbG93IGFuZA0KPmNhdXNlIHRoZSBkZXZpY2UgdG8gZW50ZXIgcnVu
dGltZSBzdXNwZW5kIHByZW1hdHVyZWx5IHdoaWxlIHN0aWxsIGluIHVzZT8NCg0KQWdyZWVkLCB0
aGUgZXh0cmEgX3B1dCB3aWxsIGJlIHJlbW92ZWQuDQoNCm0NCg0KPi0tDQo+U2FzaGlrbyBBSSBy
ZXZpZXcgwrcNCj5odHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MTIxOTM3NDIu
MjE3MDE4OC0xMi0NCj5taWNoYWVsLmoucnVobEBpbnRlbC5jb20/cGFydD0xMA0K
