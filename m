Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B722233D9E
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 00:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481547; cv=fail; b=ZPvg3LlGYw7X3JQ4G/OyIsTxsSHcYsplcSp+7IjP8asxDLiDmDFHBf+WmAFIkxHMmca/SFg2dZ547lsS37ZWVQ4DQsgZObllGLeksGBUH4npSL+ruS3wv6cL7KUJctWZpz0Q41FaorMw8atKlGuWJP1XYX34nv62Lh3akZqOT7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481547; c=relaxed/simple;
	bh=Z+aaWNMSi5rV3nkoifutj5uHbqvsWI1qpIH/pUjr5Os=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eUthph5FvXtnUY0K11Ya5AJWtAl5iPHxWc8Kgv2qc65eilF2I2BROEV/Qs5RVwrTH6RBTExv6oHw+ok+DhOtRwWuPaCBSxM1/6Qr5r37ptBhZ94DjsD+pTnAOkmrfq7lflE+RE+aUs7/aTRu50aHUF1X+D3ECkeFO5IxRvesE9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PstulXHg; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PstulXHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788481542; x=1820017542;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Z+aaWNMSi5rV3nkoifutj5uHbqvsWI1qpIH/pUjr5Os=;
  b=PstulXHg8QZb3namfIW47O+nLGxLuC8EO7jC7KVP5HX3S33GFx/AxIko
   EkgOPNssWhZQ+GuY0L/u2CNmL/t2WfjzxbQ5eNZTWlt5qSDeCCOdZhYHI
   fihLz+q0xluLX7qcVxj2sCi8a4iOgpv4euCghM4372qGPcZVsyHU/VMn0
   UNVK4VCQeGqgHNKUpIW3sJ/DQmOm8ao3EYvdC8YYv8WgK19YCfX8juWpr
   A5tohBFti7i/OSrQ8I3DyXe6UqecrunY5Zer4reHsBhPftqv3vsK1PE2c
   DXjiCu8AuD2rEt9/+XYXmqeKoWtej/ZrKamxd7rNjAsy2lIUN2JCHyg5f
   g==;
X-CSE-ConnectionGUID: +ibmQ0A5Sc+qGzkoYAbzbw==
X-CSE-MsgGUID: 0+Bs+C/5SYCUyh+aALAjvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91491486"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="91491486"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 17:25:42 -0700
X-CSE-ConnectionGUID: 56qrJHGdRJCk6ccsuYoPqg==
X-CSE-MsgGUID: +fN5TXI2RYy8pNE8WfJRKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="266202464"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 17:25:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 17:25:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 17:25:42 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 17:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTK1kzPQEZPTzOaWFDCjBPTU400UE2f7X5Q/O4IXE3XY95Rgyta74/OUuFdXbY7iKtQx4yGeIA7NaL0jK07jhuzTjkoTBLYrpURkkhrvbxzzWBdbhLPG5xdzIkN2MwZk9c7a7ff3y0oxsB4EQaT+xGH88Q+aNcD8hYXro369rAkIV1/CB3emoucLgNFDf0iulUNVZtSj7lsrJKxO5gAyDcUD+GUbo6V+hne90IWnKKPg+/7cB7BXexFs/dTixFXutNFZGdwylj/OxfFMomc6i8UNs3jAj+8l5o3h321jaIYSt71nEcvxRj9yIskAoCWgRaWvpah8UlpxcsvIi0dyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UboWB3iP9ylgm1Jgq++eLKDE7/Q9jI7g9MR6i2mhnEI=;
 b=UB6pLDLF5S/CBHQowxYuFFX+ipA5oqjqUCc1y5/ylVqwnBs54GeCE3WTfdKEFP2vUhd8ug8aCowb7WJjUHMvU7zwbSZt+JoBTLgyEseKJ7qIA+GyqWKWoU8gmCwLt3qdvvGaokD/YQEsKvg2OMu7jn/gBfA6/WSp3iXIUTKfunFU310VHemC4LRKifHiKOaWq60VhjPwmgf4X+ox+xysPV3T9VPaUvQbRjrsEM9WP7BGPIm0F20WM2uFMP+GWdUt9PJhQEfBP/kSMYgN/aX02CAxv/UQfl799MifT8L61Y+Yk6QioYt5ZGgtJLVeS3Z+QSKMFtobqOLJeaHj/gTqFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by CH3PR11MB7763.namprd11.prod.outlook.com
 (2603:10b6:610:145::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 4 Sep
 2026 00:25:40 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f%8]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 00:25:40 +0000
From: "Bai, Zongyao" <zongyao.bai@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state
 machine
Thread-Topic: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state
 machine
Thread-Index: AQHdKrew0dMrEEvgZkiZlIp5UXD1+rabHmoAgAFhgYCAIKjHAIAAhqLQ
Date: Fri, 4 Sep 2026 00:25:39 +0000
Message-ID: <DS4PPF46B98A11D1C8B7E69924F51B40A28E0B52@DS4PPF46B98A11D.namprd11.prod.outlook.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-3-zongyao.bai@intel.com>
 <20260813002313.3FED01F000E9@smtp.kernel.org>
 <72c98be1-1bd6-476b-9549-8e81f503a43d@intel.com> <apmcgtsW8SB2W_JO@intel.com>
In-Reply-To: <apmcgtsW8SB2W_JO@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF46B98A11D:EE_|CH3PR11MB7763:EE_
x-ms-office365-filtering-correlation-id: 479372a8-a613-4ecb-262b-08df0a1b0c8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|38070700021|4143699003|6133799003|11063799006|10067099003;
x-microsoft-antispam-message-info: /hJxx09XUqHvtMp1+iMYxgYdx5e5NDhpW4SrRRggyz/4gIGfHeEfIKMbUucynBNHZqh9IjfzrEksNrlQC0AjrY1ciFX1s8OXFJRJS3/KqWgc0EOkStfcz+O0Z326ySX85BBVpda6oeQPYgtZQJgiHofbghP6EHXOOmHhLs2AYQtJ49eu8IahhFF2P2Ih7p9IjrnxmaJHoT3C2L3Q4ooyk82rpWW8+XAKH81qvZ2jZHytbIEz8XmsWUtj4nktbyxkhx9mK5CMqbi1+xFwjgg+tZWyQaQQQElxh2fauuQ31fqIMsucBpCSgqQ32n344hFgWCARBdheKw6kot6QoeSH9afcZVYi8ihmfwRc8Zdnhl1XU9Iew7hK/guX5ixGCDPo/P1hCHTB9xad1lRSo7GpwZcRmDELzuWPDPJF3A54U5jaqKVdMCOpdfsZ/09x8Eg4HGPgytK3hxF8YheZ7GgeXLhqd8E8vcN8t6mDeMo1L+uFDbAlYWgRagqP3tjPG2CsGtl/d89en2JzBwX7TqM2Qf0fQuymOz0r148uMemyFOD58CXQ0xRhYlNRU6MsMLZ5/UkoWfrrbnyGr26sZvnB0e0W0tBaXclJo2jELAfKLZdW5yd388EYGpphUyJW28+ixmK7+jCpFt3OJJfT3ifPA03GfPAS55uxECZqz5RjaHC0HjQ6EYCPmZKZwmtZM/wXf3oU1KjyNE7w/TniMh3SYyzdqQxbJtML6uAAo7ULmrI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF46B98A11D.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(4143699003)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?v49508Es/GKqoaiebfxIoLuEUTMDGzS9dus1GBDtiepbZn6b9cBdfa1aBn?=
 =?iso-8859-1?Q?4KDSwqu4HOLsYKlvtL9xRNc+PMk1DsFWk5E3eU6BIQduuzgUGiUlaro2bk?=
 =?iso-8859-1?Q?JSyFmWdPIC+He28yXzdtGZJ89sbABfjS5v9J8svyHAJ3ChHZtK/8rJUBt/?=
 =?iso-8859-1?Q?xsWvXENCOyOTUZ00A14ZjGL1q+5lbv3p0tQNRxw+aSFGLK+sN2JbWI0fnh?=
 =?iso-8859-1?Q?2GHT9hJOr1dM0NWXujx4wLFYjbW4XV8F60UIvck16yOgOpi2WD/zlGizEB?=
 =?iso-8859-1?Q?ZNwYJKMcl1Q+FICXPfBM7RlXGyVkIYPZSvc87hYS2k0MvsXDTf7zlvA8hM?=
 =?iso-8859-1?Q?j2ZtZWUYN+tXEFyyWXDDA3+eWTjnDLAJy/wAatXUCIUcroXUTH5uTNeaiI?=
 =?iso-8859-1?Q?Ox7XN9Q7ixniXgiNwrh68fhiWkJ4wztE5GmMkkfkps9yvj72iYkQPC/piS?=
 =?iso-8859-1?Q?H+cv4JcJS3j5X2hBLEhCLoopkVM7iTqvFq/2w2VfzQH8hKu+6FWK2O/oCb?=
 =?iso-8859-1?Q?7XmZwSi0LDHF5nj79XcWv62ttMbEAVf9W0IevOChKaz0ileVpqr/5JNCoK?=
 =?iso-8859-1?Q?oW6vxL/iMpU4vl8HfNe7TZ/at/1QvqgMo9Ag4thG8dvxDlTK7/wctZN+Ge?=
 =?iso-8859-1?Q?EKuskAo7EVr05BIhLfbrTqfeYMPFG4PhBNmvuQgBPTbKfWdaMseDMNIBar?=
 =?iso-8859-1?Q?87hWHRsDLNLG000QvytuQNi82hw+Y13VZavC/DY2eLLONrGxaPKBQ0QjOw?=
 =?iso-8859-1?Q?Bk9GelwWtnrruyIqR95oDDRMgstgFsx0niehf6fV6nTK2vRqHrN16wNhXl?=
 =?iso-8859-1?Q?THoNHh5s/IESpMF/CHpbNPD8pbP9U/RAElQiRYgeD7zJKFJhuF8pM7CcFg?=
 =?iso-8859-1?Q?IGqn9L6iljs0ndCf0/C0Q+VfWe7tN9/3lE9z7Mjcbxf4qom0GvJDMyNeE/?=
 =?iso-8859-1?Q?6Y+vl47utbX0YZXW6J8ZKwy13u50c/xrOqZr70HyLO8W9urTHPRsk1ccyN?=
 =?iso-8859-1?Q?iL4QUy6/4mi20hBgJwUF21RnHKF80B2Bz13cVrh8NHEcD59Sps+gfCnACi?=
 =?iso-8859-1?Q?WAB/7AFNIl1arjHdyjHJWwQj2Nabyvz/2sTsbTzZcwG8ZQKuVcnaDekO+v?=
 =?iso-8859-1?Q?Y7KOOuxTAGq+LkiPKMS+saSGGaXdQXmOYEIY3YP3DbkA9bl83rHO7AJR/H?=
 =?iso-8859-1?Q?9IbnkvlMQlvHMd7/IrdEmdJeuii4+a+vwJJowi7yC/urHsgAyQRBY6Djc2?=
 =?iso-8859-1?Q?PDzJxwi2wfjU/dvVE1LdWluNxgIXuEd/qe6H2K9aZxjzwuMFxUpHYARzOB?=
 =?iso-8859-1?Q?pjxLkbKaqXsFK99vZDHGeYK16JzsG17fqa1F6TZNaO+OT1aGwv9h/AAMg5?=
 =?iso-8859-1?Q?k0fJyEMl6P+al+73MPMKjjvoMyFftrJoCoHSUvLskVoq00ORBP0IifMxt4?=
 =?iso-8859-1?Q?vBEM6tAiZHkGsi9LVAjVOTI6DCMXTrDtTGLbZlmScNI4+sWGjzHHTd00qH?=
 =?iso-8859-1?Q?4C+IPP3lTQZk5qwl90wM+gmfVQlG3byyZC2GscTnTTNIKyqpye9L8cNdGG?=
 =?iso-8859-1?Q?WB77l2cLIf2lVHbVXGUrlzI2AfDghCf2m0QhnyobRGBnHgkGkYxOI2c9El?=
 =?iso-8859-1?Q?THzRhzma9LXR3PAzjHgmC2wnqk+8N4QnuYr/gEmLqGtpMdy3HXH1zjpq8R?=
 =?iso-8859-1?Q?v7uKkBOurRPStoXOyUMUFSj095JhphEiCLTxFs+FTRjKAqNljqfv8USMqY?=
 =?iso-8859-1?Q?sgGyIL4a90OSjaqRPFhPxxStEF+yfi2J6I8/vuTuPqumOsxWqZWHSlZPvh?=
 =?iso-8859-1?Q?zS/pagZ6Jg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BC60X1KJxZgZdNHTpuyZ14zNoXtPbS3gGzfIpa7FPe+XvHnfbGmWRDmu8pt+vrSTN4gHBMAEcDXEF0T/XcnfLyQG6gJCq0nYgZh6QkNuMpu7xnvivbabSOzaX95jtS8bG6c/j/mbyUdvZvzNiaFoUrVMDu3ZPx2c1xoNhtpnQpboMsBhlLoTA7gTOUlOSkvRn4WCRHxsuUoY4OSXwtwrYAd6i5n9tMIqrgCgiP4ePl/4+WdyW6q+jo4g42D68NXyl1u7kPttXHc+UVoEyZke8IhPXMPmuU3+kfTcL68kKZuQaEpcghewIWtD6wnZJkNyQn016XOi/HDiE+eCObHfPw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479372a8-a613-4ecb-262b-08df0a1b0c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 00:25:40.0203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mDRjoYwX5JKh4IoA5CtrRKAfZYvbQnT3uDEX74bZMe/FvhHbGmmZPos+nGosYjAw8r+ouUV4XeiqzXM1yX7p9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Thursday, September 3, 2026 9:13 AM
> To: Bai, Zongyao <zongyao.bai@intel.com>
> Cc: sashiko-reviews@lists.linux.dev; intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state
> machine
>=20
> On Thu, Aug 13, 2026 at 02:28:27PM -0700, Bai, Zongyao wrote:
> >
> > On 8/12/2026 5:23 PM, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> > > - [High] Use-After-Free in delayed-release forcewake due to
> > > devm/drmm teardown asymmetry and timer re-arming
> > > --
> > >
> > > --- Patch [2]: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release
> > > state machine --- commit 7a90eb7b65ee38383fb6f1973ddea842f2c9c391
> > > Author: Zongyao Bai <zongyao.bai@intel.com>
> > >
> > > drm/xe/forcewake: add delayed-release state machine
> > >
> > > Add an opt-in forcewake release path that keeps an idle domain awake
> > > for a short hold interval. A subsequent get can reuse the domain
> > > without issuing another wake request or waiting for its ACK.
> > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
> > > > b/drivers/gpu/drm/xe/xe_force_wake.c
> > > > index 197e2197bd0a3..3f5013c7424c8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_force_wake.c
> > > > +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> > > [ ... ]
> > >
> > > > +static void xe_force_wake_fini(void *arg) {
> > > > +	struct xe_force_wake *fw =3D arg;
> > > > +	struct xe_force_wake_domain *domain;
> > > > +	unsigned int tmp;
> > > > +
> > > > +	for_each_fw_domain(domain, fw, tmp)
> > > > +		hrtimer_cancel(&domain->sleep_timer);
> > > > +}
> > > > +
> > > > -void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake
> > > > *fw)
> > > > +int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake
> > > > +*fw)
> > > >   {
> > > [ ... ]
> > >
> > > >   	}
> > > > +
> > > > +	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_fini,
> > > > +fw);
> > > >   }
> > > [Severity: High]
> > > Does registering this teardown via devm create a use-after-free windo=
w?
> > >
> > > Since devm teardown (PCI unbind) happens before drmm teardown,
> > > background tasks like gt->ordered_wq (which are destroyed during
> > > drmm teardown) can still be running after xe_force_wake_fini() has
> executed.
> > >
> > > Also, if a timer was pending here, canceling it without putting the
> > > domain to sleep could leave the hardware permanently awake. Is there
> > > a need to clear the state or issue domain_sleep() during teardown?
> >
> > The devm/drmm lifetime asymmetry is real, but this fini is not exposed
> > to it in practice.
> > The only delayed-release caller is query_engine_cycles(), an ioctl
> > that holds a runtime-PM reference and runs inside a drm_dev_enter()
> > section.
> > On remove/unbind the driver calls drm_dev_unplug() and then flushes
> > forcewake on all GTs before devres_release_all() runs
> > xe_force_wake_fini(), so no timer is pending by the time this runs.
> > gt->ordered_wq only runs the GT reset worker, which never uses delayed
> > release.
> >
> > The bare hrtimer_cancel() without domain_sleep() is intentional:
> > the power-boundary/unplug flush has already settled the domains, and
> > teardown is followed by device power-off/FLR, so leaving a domain
> > awake is harmless here.
>=20
> I'm honestly not comfortable with this dismissal here.
> It is not only a left-over domain awake, but some potential UAF.
>=20
> Why did you chose the hrtimer instead of a delayed workqueue?
> The workqueue you can flush and wait in the finish.

Hi Vivi,

    Thanks for your review!
    I just confirmed that a delayed workqueue provides delays at the millis=
econd granularity.=20
    For this scenario, a 100 =B5s delay should be sufficient for the tunabl=
e parameter.
    Regarding the potential UAF issue, I still need some more time to inves=
tigate it further.

Thanks,
Zongyao   =20

=20
> >
> > Zongyao
> >
> > > [ ... ]
> > >
> > > > @@ -242,12 +330,24 @@ void xe_force_wake_put(struct xe_force_wake
> *fw, unsigned int fw_ref)
> > > >   	spin_lock_irqsave(&fw->lock, flags);
> > > >   	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
> > > > +		assert_domain_state(fw, domain);
> > > >   		xe_gt_assert(gt, domain->ref);
> > > >   		if (!--domain->ref) {
> > > > -			sleep |=3D BIT(domain->id);
> > > > -			domain_sleep(gt, domain);
> > > > +			if (delayed_release || domain-
> >delayed_release_requested) {
> > > > +				domain->delayed_release_requested =3D false;
> > > > +				fw->delayed_release_domains |=3D
> BIT(domain->id);
> > > > +				hrtimer_start(&domain->sleep_timer,
> > > > +					      us_to_ktime(xe-
> >forcewake_hold_delay_us),
> > > > +					      HRTIMER_MODE_REL);
> > > [Severity: High]
> > > If a background task drops the last reference here after
> > > xe_force_wake_fini() has already run, could this unconditionally re-a=
rm
> the timer?
> > >
> > > If the timer is re-armed during this devm/drmm teardown window, the
> > > timer callback might fire after the struct xe_gt memory has been
> > > completely freed by drmm, resulting in a use-after-free.
> > >
> > > Would it be safer to use drmm_add_action_or_reset() for teardown, or
> > > add a mechanism to ensure we don't start timers when the device is be=
ing
> destroyed?
> > This cannot re-arm the timer during teardown.
> > The delayed branch is only taken when either the caller used
> > xe_force_wake_put_delay()
> > or a delayed release was previously recorded, and the sole producer of
> > both is query_engine_cycles().
> > That ioctl is drained by drm_dev_unplug() before the all-GT forcewake
> > flush, which runs before devres_release_all()/xe_force_wake_fini().
> > No background task (including gt->ordered_wq) drops a forcewake
> > reference through the delayed path.
> >
> > So there is no path where a delayed timer is re-armed after fini and
> > fires against freed gt memory in this series.
> > I agree that switching the fini to drmm_add_action_or_reset() would
> > additionally harden this against any future caller that releases
> > forcewake outside the unplug/flush fence; I'll keep that as a
> > follow-up rather than fold it into this patch
> >
> > Zongyao
> >
> > > > +			} else {
> > > > +				sleep |=3D BIT(domain->id);
> > > > +				domain_sleep(gt, domain);
> > > > +			}
> > > > +		} else if (delayed_release) {
> > > > +			domain->delayed_release_requested =3D true;
> > > >   		}
> > > > +		assert_domain_state(fw, domain);
> > > >   	}
