Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22104511205
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 20:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469079; cv=fail; b=OMUoJaCos5M6cMpfjiKJcmx9Qdrw3/wFF0r4HAPLZVgLFWX3ebgnTI0lW1DGFex4h1P0Ne3MlfhiaBDbfKpn0dioFUEV5IQ41wTMeKltd9b3WIkq1Dbft+QU74UgBDDV600fs6saxzPOLg+OImJOw3iBrdGZUaX/z+pm5AINADE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469079; c=relaxed/simple;
	bh=D8pnLCx8pg8lZJjUJNPJzIRi8FhIUle9/gxBFTCRO18=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GBettCsp0j04VCrU0LSir3xWicCiEVwDnhieQeB3DGYf6JEhtToUvPkVys+hOBIyCDpbGvmQu1QQx7NupnbPcJ+NYkdwfuzbLAXYnnrxSyzE48DQTSq5ePX2VOBdS9tSxsEj0oqHAKv37FC5gf63lrpquIiKDQojDBhdnC/faWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKfWk0XC; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKfWk0XC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788469074; x=1820005074;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D8pnLCx8pg8lZJjUJNPJzIRi8FhIUle9/gxBFTCRO18=;
  b=AKfWk0XCbPO+xzL7HvaOuDS1wdV1k34R9o6NpgGq3F64AYVJa8QPdisu
   VvFceoNoQ1Cze9nYWOVbHTRAoTrYSdcETHzQveUcTgK4aUBJuhFlxkZ+L
   XF7FzJIstFUUMi/F+051hiSJbbkTAClUOv3m/hIT6sbVimW2yNGLF/OuM
   gq40/G8O1Mpow7sUWbI55Q5SXp6CKYJuwW2Rgf/9EkvUJWKWOXTfOehr7
   AOhWUfh0de5UwNia3H4AKpECkxgox9CtnEgtoTSVSuZ9jGOUkcLzqsAvj
   lkBZl2cR0bzP18Rsd2bvgMKdkXgLL1Wc0M6QvQqiExE1jMSzR12yLcOz+
   A==;
X-CSE-ConnectionGUID: sl1rLQ61QPuvPXpAEsEo5Q==
X-CSE-MsgGUID: bmmMnRmmSmyyOulBx4boVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88986725"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88986725"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:57:42 -0700
X-CSE-ConnectionGUID: IlpNKt9KRKq7/Q7FYvgsCA==
X-CSE-MsgGUID: GCS9eXU8RzurTkzy4Ai2pw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:57:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 13:57:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 13:57:41 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 13:57:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRzls9Lv/6Caji1IMFeafyHQrSPKwgBH2X4/3o7tMfjHJm5sKFKKoiw9zPBsDv6WrO/YkoVLCsSiQvgBoNcLDZwU2c2hRhRWIkvB/s6tCA6Db+H7Ix8kPmpl6W0VP4bw95I/A1Q1LG5W70aHMoNUQAsNoyTt5XDIpRgDqDdEsHgH3DJPHdM860yP2peK8qRf6VmxnZrGzC5A80g0D9d70+vMYLcZTkWiaCYXiUV9315XyzHNVCBHyEh7H+/6fSMduqRudCvKR09v3EKblxO5N19gqrp8BK6j2Tfd6fgjpFOtbq4mMy7Ml6zL+nIYTiZ6ma5s+G+KG1o5sfvZVJq0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8pnLCx8pg8lZJjUJNPJzIRi8FhIUle9/gxBFTCRO18=;
 b=a+IzY9JRWx7qB7Qd4Rpz8cPkCMc1xTLychlYf2khg/A3kWlOcRMAxQrCvFJnhs1fQGZBtz8I5TgOB7Rk0tdtpom3WuZZjqPzE/vG17ZGRDAedv9EgFo3eOY1px4pcw+cf76c6rxk5GUv+z6SVJl8q45Iiz1NREexJOi5rw3ZCi9n0l7Z8vRBhO6o7XP7spAM1pHp3a1C/T44haj20SKUu1iIOZaUmwbqkQpXaS/jVYlVWfL2DpycqlNAP0eyv3Z58Gh621xFqNKHjMI+YVK2gswlavbDUgI7eK3ME3MKljcs46lmAzElZ9+mCeZ0vHXp6f+H4m38vDOodxwM1GiOTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by LV8PR11MB8771.namprd11.prod.outlook.com
 (2603:10b6:408:206::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 20:57:38 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 20:57:38 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 15/18] drm/xe/vsec: Support late bind fw information
Thread-Topic: [PATCH v5 15/18] drm/xe/vsec: Support late bind fw information
Thread-Index: AQHdO+BYLFpTR6H6GkOuVeEfnfhTrLa9TbUAgAAIAVA=
Date: Thu, 3 Sep 2026 20:57:38 +0000
Message-ID: <CH3PR11MB0461492F50DF2B8353B55DB0D0C1B62@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-35-michael.j.ruhl@intel.com>
 <20260903202808.A8A5A1F000E9@smtp.kernel.org>
In-Reply-To: <20260903202808.A8A5A1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|LV8PR11MB8771:EE_
x-ms-office365-filtering-correlation-id: 983cd661-0f59-4119-0dc4-08df09fdfd26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|22082099003|18002099003|38070700021|11063799006|5023799004|56012099006|4143699003|10067099003;
x-microsoft-antispam-message-info: ZcjQ6/cASu2KunrtdOSZP0inQDifhelrcBkWv7CwIIjeTG2II+zLN7jAHZOVM2lUWsi1FfDCQFMYawe4rnXGlfmxX5Wn8EKYmdUZXU6prEm6uU/tt75i+Wiy4ZAOKCZTi1MckANJsqFuYtoKvJnTndZiXnX3squcSNnScaIKGs/Cy1leZRD1vkf2DqzHbUOZt2o7JSOJKE3symvxXI8wHY+wFzTU2tuELc1w5EgthxyXX2vA+BzdPAgEL6huP6G3w4OHHXjuM05O0BpplgEr/ZvQQ9ODCoOUG7EX6miu845IOEjf+9jPq2lqnltrCnKYgku+rRWZrjlcSx4cQNFISr6+PiGrPoIuS98YDmCxph9A2jcPyJ8Qph4oockVOawNXSdQMkNabQ93LdiLzXAa/32nJzGJMc+4mhG3d2x8xOHddNFJrv14vjLTbOGMb976hHUq1FBS148jQ6DVQw2pFbwmv1jGH+BlDcLGmqD9XvvUCG47WsTwoLOVJ5r4mEJaE0N7BwZ1Sm81G3E2CEDWzaNNO0/gjyzQoU/GGXTtJpUZKwuqNE/u6iEXrph742Tk3/qCRlC5KcFe8IRAyKrN41ar1iv7rEc0/fSsy6p1kFbMZ8LDaSH73SbZZIK/RFCW5DOiPzhU6mGj7TZIHgjzGyFdcaXxtqkkR+9iWGviZgY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(22082099003)(18002099003)(38070700021)(11063799006)(5023799004)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWFLUWE2dkFaY0RIZHRrTmZDYlJLM2kxbjNYQU1BYnBjaGpWYnVTTmZFTVQ3?=
 =?utf-8?B?V2FtSFc5OFkrQmtJUTNnNjRQY0lvZTUwemY3eFU5cC82M1pJa1JyMmRBZDdD?=
 =?utf-8?B?blhMVzhPaW5ld0dDaEVLZXllQmk3emkxNXpYUE5LcGQyUVRPSWkyaUw4UjU0?=
 =?utf-8?B?cGJnYlRGd2JGRzFSamd4MGh1aHRyRE51Z3NjS1lPZWJVZDR5SnRUaHlJUkkw?=
 =?utf-8?B?WE5LL2QwOGxTa05PR3BaRXZ0WGhXdmo5TmQyM0xqcWpESVdSTjI4U3pzc1VR?=
 =?utf-8?B?N0w2L3ZEd2pvRGtaSFJ6QzJ0SmEvbHoycmtkUEdRSHJuL1dqdlc5MDFQbE5j?=
 =?utf-8?B?a2xVcDlwcDdRY3dJSFpIaFh0WmEyMjBSNGFHakdRZHJhK3luYmtJZjMzS1dt?=
 =?utf-8?B?Mnc3VVh3NzdsSnlLcmw1c1ZzSWpIQ2R3VzRIUUx3VFJLQ0o1Qmk2RkFaYlg1?=
 =?utf-8?B?algyN2REQ0toWUJFYy9od1A2Y2xRaUZIY25rZkFVOEZncThPUnJoT2ExN1lp?=
 =?utf-8?B?WEtOOS9UdTJOR0RaQ2t1Tnl1MGEvb2NOdUJxYS9ZT1RJa3I1cG1OdEdJYU1w?=
 =?utf-8?B?MkNEeFBJTUd6WmlaTkkwekVWWmFpMHFLNWhycGdVdVNvUzJmSEFUeFAzM2x3?=
 =?utf-8?B?cTM5MHJSQkc3cldNZWlWakRDc2ZFMG93SjhpQkgvL1ltYWlSdk9Xb09LUVU0?=
 =?utf-8?B?NWxlaXRveFJodDNGWUVWQmtSUHBGYlNSQmJFWU1Yc1dPS1lzNXNlMlpmSFZr?=
 =?utf-8?B?VVdiSEdJR2ZrSzkrNjN0UXRPVTJqK1dmekdTSVlCdjJlN3Jqc0tEc3YrQWJC?=
 =?utf-8?B?cjZtdDhDeTM5TGFtd1hLd3lLS2FhM2U2VDdOU2dPTVc0NVNmamJUcEk3Wk9D?=
 =?utf-8?B?MWcyMks5SnFHRnF2elNXZjdTWExQaWZmQ2RTK1FsMDlnUHJLQnJBV1lPZGRu?=
 =?utf-8?B?WDhXa041aXQxcFhpOWpMd2d1UDkydUdqVkI4Vkt5Z0FzUTlJZEFwRWV0Ryth?=
 =?utf-8?B?VUprWndsWTl6L0hXMmN0ZXlTREE3NGhFeGdZK0c5aEM0bDV3ak9FUVA5R25E?=
 =?utf-8?B?d3hoaUFhbDZLQVFSQ3RHcTRFYkgxbzR2aWZscllXOWpmN3RPQk5IYTVvd1c1?=
 =?utf-8?B?U2pmRVBobC9jMUxtZE5WVXZ3T0NGQ3lFNEhQNVFHWVBXZUtmd3dpMjh0YWRE?=
 =?utf-8?B?Nms2R2tIRW42dWpvWnNMazVSUk5jb1huczFiMWduVnk0N0pyWmU4MGF5bkJp?=
 =?utf-8?B?eW5vMzFNRGRJbXQ3aElwOUdoeWVxWDl3MVJsSzc2U1BIeFFtSlRiLzQ1bXhI?=
 =?utf-8?B?aS9nRDVJZnJmVHFoOTBRbzNvNWk0WEorbmRJdDV6cVkraGZMTlhYeW0vWmxu?=
 =?utf-8?B?NGpOZjZpNG5uYWZBbGtaZm85bVNBQnhGUUwyT3NWbFc2VWRYaW50WGprRVJn?=
 =?utf-8?B?cS9HVm1HM0hPMWJQRzA3QXF4UDYydkJwa0p5SUVndHRRYjByRTFPVU1QQnpl?=
 =?utf-8?B?ekpIWkNUS0o4UE9yQkVsYzhvOTByQlJxc0dScmUvNWFhYWlkN1MyVjRUbE5H?=
 =?utf-8?B?ZGhwanMxZVpmcEx1OHlnME1DYXQzS0lsaEJiajJwNVp2dE4rRnhrTUVyYU5Z?=
 =?utf-8?B?Q2VCbHNicmhWUysvTTJvTzlZMWtLUU1CaVNNNVgzei8xZUNHdW9QN3o3YmRo?=
 =?utf-8?B?K1UybUNIa0lyN0xaaFdFWlgyaVQzSXA0NDhGSDhBbXNESWNwdStzZHhpdFBF?=
 =?utf-8?B?OERtVDluZE55TFpsQTEvN2Y3YktQaDlWaDl1MURMWm9MY3VxeWtKWmF2RUZ5?=
 =?utf-8?B?V2tCL3Y0clN6NktzTDBuYWlLQ1hBMXV2UTFFZnBKbDQ3SlEvWDI5TlAzeHUy?=
 =?utf-8?B?bVMxTnZJZ25UaEdWaVQ3Skp0RnpLWGhpWkxiNk1mYWtTdnd2SWNKNys2cWNL?=
 =?utf-8?B?Z3h5bDZJRjRRUGdUQnZwSlJtQSs1dGN5Wm95bXA4Wk93UXlva2NyZ1JYeGts?=
 =?utf-8?B?czNUOFdhZWU2eHVoT1piTVhxQ0NmNXRrWGMyalF6UW5Ha1BHQkFjSERMRXlM?=
 =?utf-8?B?UlRBMzk3bVhTdld3MktzaHd3YWM5U3pGbDZzN1RMUTY5RTRGMDdHTmt3QXd1?=
 =?utf-8?B?bklua21vNml1eG5JdFhyRkFSTUFHeVpsUktPRldUcTc5NTVLcUZYQTJZclVq?=
 =?utf-8?B?QUQ4aU5IWmdvMFRjUlBaaHFxNkcyUlFlYzg4dzl5eUpGUkswZVZXekRSdFJo?=
 =?utf-8?B?RFZVamYyY2ZlbWhHVjhTdVFPcDhMRmtmbnNLSEN3T0ZhQ0o1L0lyTUx4bEV0?=
 =?utf-8?B?WTFpZHMxazNFWWN4WVRQQW4xVzdad0huOVhndWRiRHNoWGcyalIrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BQNlpQXDyllVFNuV8ZJhZ7Sret7eajIE5Pf9aNRc4XbZF9Vby/AZvszypyI/Dm5vZI8RvB2znh4kttL5jJmjvwFtroLdDmmye2iw0t494940wqlxH0YHiiutmrgX/hWJWguAUbnQa3fnofuwa45qVMTI+X4IVwzenFvAbF996Wk8i1iKaEFESCVMnnt2Hl/HbVQgHg+kORdIaKTP85vBMDxC2sQvfPLAV7CWg2F06LvXMFata4i48h8WJMWNqxaLxNmF1roAxqUyxnrbWuwf++itnZB0jSVkDir/nJMFnUdLzCuT9oFtjx1rBYqWK36P2DvLCFRiQGeodu22siacgQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983cd661-0f59-4119-0dc4-08df09fdfd26
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 20:57:38.8023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SEuR3ZXsL00tdvavp5g4b5llULJCOgov/rKCWAg89ZOdLA2zjaPPrg94Da+/6CLT0i2MbxBKUqKin9g1ppY92EIvMaI/rLOsH67k5a0RvZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8771
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IHNhc2hpa28tYm90QGtlcm5l
bC5vcmcgPHNhc2hpa28tYm90QGtlcm5lbC5vcmc+DQo+U2VudDogVGh1cnNkYXksIFNlcHRlbWJl
ciAzLCAyMDI2IDQ6MjggUE0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBp
bnRlbC5jb20+DQo+Q2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjUgMTUvMThdIGRybS94ZS92c2VjOiBTdXBwb3J0IGxhdGUgYmluZCBmdyBp
bmZvcm1hdGlvbg0KPg0KPlRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28g
QUkgcmV2aWV3IGZvdW5kIDMgcG90ZW50aWFsIGlzc3VlKHMpIHRvDQo+Y29uc2lkZXI6DQo+LSBb
SGlnaF0gQXN5bmNocm9ub3VzIGBkZXZtYCByZWdpc3RyYXRpb24gcmFjZSBjYXVzZXMgbWVtb3J5
IGxlYWsgYW5kIFVzZS0NCj5BZnRlci1GcmVlIG9mIHRoZSBhdXhpbGlhcnkgZGV2aWNlLg0KPi0g
W0hpZ2hdIEFzeW5jaHJvbm91cyBydW50aW1lIFBNIHB1dCBkdXJpbmcgZGV2bSB0ZWFyZG93biBs
ZWF2ZXMgaGFyZHdhcmUNCj5pbiBhbiBpbmNvcnJlY3QgcG93ZXIgc3RhdGUuDQo+LSBbSGlnaF0g
RGVsYXllZCB3b3JrIGFjY2Vzc2VzIGhhcmR3YXJlIE1NSU8gZHVyaW5nIHN5c3RlbSBzdXNwZW5k
Lg0KPi0tDQo+DQo+Y29tbWl0IDFiNjdhNzgwYzNmYmM2MTlmNDQxZjZkZmRjMjEwZDExYzUwZjY0
NzYNCj5BdXRob3I6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0K
Pg0KPmRybS94ZS92c2VjOiBTdXBwb3J0IGxhdGUgYmluZCBmdyBpbmZvcm1hdGlvbg0KPg0KPkNS
SSBGVyBpcyBsb2FkZWQgb24gcG93ZXIgb24uIEJlY2F1c2Ugb2YgdGhpcywgYWNjZXNzIHRvIHRo
ZSBGVyBjYW5ub3QNCj5iZSBkb25lIHVudGlsIGl0IGlzIHJ1bm5pbmcuIFVwZGF0ZSB0aGUgWEUg
UE1UIHByb2JlIGFuZCBhY2Nlc3MgdG8gY2hlY2sNCj5mb3IgbGF0ZSBiaW5kIGRldmljZXMsIHZl
cmlmeSwgYW5kIHdhaXQgZm9yIHRoZSBhcHByb3ByaWF0ZSBGVyBzdGF0ZQ0KPmJlZm9yZSBwcm9i
ZSBvciBhY2Nlc3MuDQo+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zz
ZWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4+IGluZGV4IDMzNmM0YjdkMjg0
YmMuLjQ4Y2FjZDIzYjA3MWUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dnNlYy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+WyAuLi4gXQ0K
Pj4gQEAgLTI4MSw2ICsyOTEsNDggQEAgc3RhdGljIGludCB4ZV9ndWlkX2RlY29kZSh1MzIgZ3Vp
ZCwgaW50ICppbmRleCwgdTMyDQo+Km9mZnNldCkNCj4+ICAJcmV0dXJuIC1FTk9ERVY7DQo+PiAg
fQ0KPj4NCj4+ICtzdGF0aWMgdm9pZCBjcmlfbGF0ZV9iaW5kX3Byb2JlX3dvcmsoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrKQ0KPj4gK3sNCj4+ICsJc3RydWN0IHhlX2RldmljZSAqeGUgPSBjb250
YWluZXJfb2Yod29yaywgc3RydWN0IHhlX2RldmljZSwNCj5wbXQud29yay53b3JrKTsNCj4+ICsN
Cj4+ICsJaWYgKHhlX2lzX29vYm1zbV9md19yZWFkeSh4ZSkpIHsNCj5bU2V2ZXJpdHk6IEhpZ2hd
DQo+RG9lcyB0aGlzIGNvZGUgYWNjZXNzIGhhcmR3YXJlIE1NSU8gZHVyaW5nIHN5c3RlbSBzdXNw
ZW5kPw0KDQpObywgYSBwbV9ydW50aW1lX2dldCBpcyBkb25lIHRvIGVuc3VyZSBhdmFpbGFiaWxp
dHkuDQoNCj5JZiBhIHN5c3RlbSBzdXNwZW5kIChlLmcuLCBTMykgaXMgaW5pdGlhdGVkIHdoaWxl
IHRoZSB3b3JrZXIgaXMgYWN0aXZlbHkNCj5wb2xsaW5nLCB0aGUgZGV2aWNlIGlzIGZvcmNlZCBp
bnRvIGEgc3VzcGVuZGVkIHN0YXRlIChEMykgYnkgdGhlIHN5c3RlbSBQTQ0KPmNvcmUsIGJ5cGFz
c2luZyB0aGUgcnVudGltZSBQTSB1c2FnZSBjb3VudCBoZWxkIGJ5IHRoZSB3b3JrZXIuDQo+DQo+
QmVjYXVzZSB0aGUgd29yayBpcyBvbiBhIG5vbi1mcmVlemFibGUgd29ya3F1ZXVlIGFuZCBub3Qg
ZXhwbGljaXRseQ0KPmNhbmNlbGxlZCBpbiB0aGUgZHJpdmVyJ3Mgc3lzdGVtIHN1c3BlbmQgY2Fs
bGJhY2tzLCB0aGUgd29ya2VyIGNhbiB3YWtlIHVwDQo+d2hpbGUgdGhlIGhhcmR3YXJlIGlzIHBv
d2VyZWQgZG93biBhbmQgY2FsbCB4ZV9pc19vb2Jtc21fZndfcmVhZHkoKS4NCj5SZWFkaW5nIE1N
SU8gZnJvbSBhIGRldmljZSBpbiB0aGUgRDMgc3RhdGUgY2F1c2VzIG1hc3RlciBhYm9ydHMsIHVu
aGFuZGxlZA0KPlBDSSBlcnJvcnMsIG9yIHNpbGVudCAweEZGRkZGRkZGIHJlYWRzIGxlYWRpbmcg
dG8gdW5kZWZpbmVkIGJlaGF2aW9yLg0KPg0KPj4gKwkJY3JpX2xhdGVfYmluZF9wcm9iZSh4ZSk7
DQo+PiArCQl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+PiArCQlyZXR1cm47DQo+PiArCX0NCj5b
IC4uLiBdDQo+PiBAQCAtNDY0LDEyICs1MzQsNDQgQEAgc3RhdGljIGVudW0geGVfdnNlYyBnZXRf
cGxhdGZvcm1faW5mbyhzdHJ1Y3QNCj54ZV9kZXZpY2UgKnhlKQ0KPlsgLi4uIF0NCj4+ICtzdGF0
aWMgdm9pZCBjcmlfbGF0ZV9iaW5kX3Byb2JlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPj4gK3sN
Cj5bIC4uLiBdDQo+PiArCWludGVsX3ZzZWNfcmVnaXN0ZXIoZGV2LCBpbmZvKTsNCj5bU2V2ZXJp
dHk6IEhpZ2hdDQo+Q2FuIHRoaXMgYXN5bmNocm9ub3VzIGRldm0gcmVnaXN0cmF0aW9uIGxlYWsg
dGhlIGF1eGlsaWFyeSBkZXZpY2U/DQo+DQo+QmVjYXVzZSBpbnRlbF92c2VjX3JlZ2lzdGVyKCkg
YXR0YWNoZXMgaXRzIG93biBkZXZyZXMgYWN0aW9ucyB0byB0aGUgcGFyZW50DQo+ZGV2aWNlICh4
ZS0+ZHJtLmRldiksIGNhbGxpbmcgaXQgZnJvbSBhIGRlbGF5ZWQgd29ya2VyIGNhbiByYWNlIHdp
dGggdGhlDQo+cGFyZW50IGRldmljZSB0ZWFyZG93bi4NCj4NCj5JZiB0aGUgd29ya2VyIGV2YWx1
YXRlcyB0aGUgZmlybXdhcmUgYXMgcmVhZHkgYW5kIGNhbGxzDQo+aW50ZWxfdnNlY19yZWdpc3Rl
cigpIHdoaWxlIHRoZSBwYXJlbnQncyBkZXZyZXMgbGlzdCBoYXMgYWxyZWFkeSBiZWVuDQo+c3Bs
aWNlZCBkdXJpbmcgdW5iaW5kaW5nLCB0aGVzZSBuZXcgZGV2bSBhY3Rpb25zIGFyZSBsZWZ0IGJl
aGluZCBvbiB0aGUNCj5lbXB0eSBkZXZyZXNfaGVhZCBhbmQgYXJlIG5ldmVyIGV4ZWN1dGVkLiBU
aGlzIGNhdXNlcyBhIHBlcm1hbmVudCBtZW1vcnkNCj5sZWFrIG9mIHRoZSBhdXhpbGlhcnkgZGV2
aWNlLCBhbmQgc3Vic2VxdWVudCBhY2Nlc3NlcyBjYW4gbGVhZCB0byBhDQo+dXNlLWFmdGVyLWZy
ZWUgc2luY2UgdGhlIHBhcmVudCB4ZV9kZXZpY2UgaGFzIGJlZW4gZnJlZWQuDQo+DQo+PiArfQ0K
Pj4gKw0KPj4gK3N0YXRpYyB2b2lkIHZzZWNfZGlzYWJsZV9sYXRlX2JpbmRfd29yayh2b2lkICph
cmcpDQo+PiArew0KPj4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGFyZzsNCj4+ICsNCj4+ICsJ
LyoNCj4+ICsJICogSWYgdGhlIHF1ZXVlZCB3b3JrIGlzIGNhbmNlbGVkLCB0aGUgcnVudGltZSBy
ZWZlcmVuY2UgbmVlZHMgdG8gYmUNCj4+ICsJICogcmVsZWFzZWQgaGVyZS4NCj4+ICsJICovDQo+
PiArCWlmIChkaXNhYmxlX2RlbGF5ZWRfd29ya19zeW5jKCZ4ZS0+cG10LndvcmspKQ0KPltTZXZl
cml0eTogSGlnaF0NCj5Eb2VzIGJsb2NraW5nIHRvIGNhbmNlbCB0aGUgd29yayBoZXJlIG9wZW4g
dGhlIGRldnJlcyByYWNlIHdpbmRvdyBtZW50aW9uZWQNCj5hYm92ZT8NCj4NCj5TaW5jZSBkZXZy
ZXNfcmVsZWFzZV9hbGwoKSBoYXMgYWxyZWFkeSBzcGxpY2VkIHRoZSBkZXZyZXMgbGlzdCBieSB0
aGUgdGltZQ0KPnRoaXMgZGV2bSBhY3Rpb24gZXhlY3V0ZXMsIGFueSBjb25jdXJyZW50IHdvcmtl
ciB0aGF0IGJ5cGFzc2VkIHRoZQ0KPmNhbmNlbGxhdGlvbiBjaGVjayB3aWxsIGF0dGFjaCBpdHMg
bmV3IGRldnJlcyBhY3Rpb25zIHRvIHRoZSBhbHJlYWR5DQo+c3BsaWNlZCBwYXJlbnQgbGlzdC4N
Cj4NCj4+ICsJCXhlX3BtX3J1bnRpbWVfcHV0KHhlKTsNCj5bU2V2ZXJpdHk6IEhpZ2hdDQo+Q291
bGQgdGhpcyBhc3luY2hyb25vdXMgUE0gcHV0IGxlYXZlIHRoZSBoYXJkd2FyZSBhY3RpdmU/DQo+
DQo+VXNpbmcgeGVfcG1fcnVudGltZV9wdXQoKSAod2hpY2ggZXhlY3V0ZXMgYXN5bmNocm9ub3Vz
bHkpIGltbWVkaWF0ZWx5DQo+YmVmb3JlDQo+ZGV2aWNlIHJlbW92YWwgYWxsb3dzIHRoZSBwZW5k
aW5nIGFzeW5jIGlkbGUvc3VzcGVuZCB3b3JrIHRvIGJlIGNhbmNlbGxlZA0KPmJ5IHRoZSBjb3Jl
IHRlYXJkb3duJ3MgcG1fcnVudGltZV9kaXNhYmxlKCkuDQo+DQo+QWNjb3JkaW5nIHRvIHRoZSBQ
TSBzdWJzeXN0ZW0gZ3VpZGVsaW5lcywgdGhpcyByZXF1aXJlcyBhIHN5bmNocm9ub3VzIHB1dA0K
PihsaWtlIHBtX3J1bnRpbWVfcHV0X3N5bmMoKSkgdG8gZW5zdXJlIHRoZSBoYXJkd2FyZSBpcyBz
dXNwZW5kZWQgYmVmb3JlDQo+dGVhcmRvd24gY29udGludWVzLg0KPg0KPj4gK30NCj5bIC4uLiBd
DQo+PiBAQCAtNDc3LDMwICs1NzksNDUgQEAgdm9pZCB4ZV92c2VjX2luaXQoc3RydWN0IHhlX2Rl
dmljZSAqeGUpDQo+WyAuLi4gXQ0KPj4gIAljYXNlIFhFX1ZTRUNfQ1JJOg0KPj4gIAkJaWYgKElT
X1NSSU9WX1ZGKHhlKSkNCj4+IC0JCQlyZXR1cm47DQo+PiArCQkJcmV0dXJuIDA7DQo+PiArDQo+
PiAgCQl4ZS0+cG10LmJhc2Vfb2Zmc2V0ID0gQ1JJX1BNVF9PRkZTRVQ7DQo+PiArDQo+PiArCQl4
ZS0+cG10LnJldHJ5X2NvdW50ID0gMDsNCj4+ICsJCUlOSVRfREVMQVlFRF9XT1JLKCZ4ZS0+cG10
LndvcmssDQo+Y3JpX2xhdGVfYmluZF9wcm9iZV93b3JrKTsNCj4+ICsNCj4+ICsJCXhlX3BtX3J1
bnRpbWVfZ2V0X25vcmVzdW1lKHhlKTsNCj4+ICsJCWlmICgheGVfaXNfb29ibXNtX2Z3X3JlYWR5
KHhlKSkgew0KPj4gKwkJCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmeGUtPnBtdC53b3JrLA0KPj4g
Kw0KPm1zZWNzX3RvX2ppZmZpZXMoVlNFQ19MQVRFX0JJTkRfREVMQVlfTVNFQykpOw0KPltTZXZl
cml0eTogSGlnaF0NCj5JcyBpdCBzYWZlIHRvIHNjaGVkdWxlIHRoaXMgd29yayBvbiBhIG5vbi1m
cmVlemFibGUgd29ya3F1ZXVlIHdpdGhvdXQNCj5zdXNwZW5kIGhvb2tzPw0KPg0KPkFzIG5vdGVk
IGVhcmxpZXIsIHNjaGVkdWxpbmcgdGhpcyBvbiB0aGUgZGVmYXVsdCB3b3JrcXVldWUgYWxsb3dz
IHRoZQ0KPndvcmtlciB0byBleGVjdXRlIGR1cmluZyBzeXN0ZW0gc3VzcGVuZC4gVGhpcyBwZXJt
aXRzIGhhcmR3YXJlIE1NSU8NCj5hY2Nlc3NlcyB3aGVuIHRoZSBkZXZpY2UgaXMgaW4gYSBzdXNw
ZW5kZWQgc3RhdGUgKEQzKS4NCj4NCj4+ICsJCQlyZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jl
c2V0KHhlLT5kcm0uZGV2LA0KPj4gKw0KPgl2c2VjX2Rpc2FibGVfbGF0ZV9iaW5kX3dvcmssDQo+
PiArCQkJCQkJCXhlKTsNCj4+ICsJCX0NCj4NCj4tLQ0KPlNhc2hpa28gQUkgcmV2aWV3IMK3DQo+
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTAzMjAxMDAyLjEwNjQ4ODktMjAt
DQo+bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tP3BhcnQ9MTUNCg==
