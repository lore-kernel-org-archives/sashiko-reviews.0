Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B043C09EC
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 21:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787260134; cv=fail; b=T32ueM1iWKTT3yPa5y/uO6P0SP+hPWa7WIlo5p2vTuGqbocl37846eoKrXuMe74WNRSvIx+lXyao9GgqXQaEKf78GJFXTdHoEcDZCIz2A7JFHo3P9kR8Nn9XAg12TMtRDEYSlmM+J73x7ZZ2ik0RpPZgMbyzcovCPQMORFkcUSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787260134; c=relaxed/simple;
	bh=jPlf768eURtkYipOJSiRN8MITrSFTmZeMTQYP1VfBDc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OWdIgqjO5wuo3E141zrNdGk6o4F5eNeOf9zTGuLg5pEkFW+cKh3i73Oblnkwe990zDP9eoMVg1K33NYy5nR02mwGbcuvmkj9J/HqtHcFTzS7m0GurjENG1yKIr61GgBh7uXxqpy0VvRS1bv+NbQgjT3nYvn/wQK0fVbe+/BFHvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfidNo52; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfidNo52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787260131; x=1818796131;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jPlf768eURtkYipOJSiRN8MITrSFTmZeMTQYP1VfBDc=;
  b=BfidNo52RciUlk2Tg1pJ8gpgHia4FenDdVnxP/fJM+0vjar8gZi3m/EN
   pCuj2C0AVH8FdvM5EA6PfGvqg/XomrpmJfgrD7pUGzRODm5kbD5L6r2iG
   c5yWU1fJ+ioarkvb531KEdeCdB3vfE/KW+JeQLA3petymaIbc1mA3kXI1
   Qt/GitqYmiE+j8eTvIny/1FW0591DDkagIJt/820JfMAdjA7jSkmArXUN
   G9OULuB4FLTW+QtxwOvAkwiNnwYcsroELbg5V6QWIxAqLlcXH0/bEPiNX
   0PeoOHV+FJ+fzJyT8WAScvvduZxeO/RZpXSJ1STiJgfUpv3E9+jlfmVa2
   g==;
X-CSE-ConnectionGUID: mRF4ee0RSB2BTe74H1JyUg==
X-CSE-MsgGUID: of6m/nIqRfmamLWiU+aNgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87721281"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="87721281"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 14:08:51 -0700
X-CSE-ConnectionGUID: wHPKdk1GQgSpKpxKoVZjIw==
X-CSE-MsgGUID: +aIiYUHnSNudnPp9bA+azQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="262425712"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 14:08:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 14:08:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 14:08:49 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 14:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iL7L5hG5w/XbwrvL/dahvmJzgve2L8hAbjBk8Q5z360wITLVuMMvGVCJo7gi050RyiTeoa7ui/1A785kIiufmIk+7wZey+pUJHDKzgBUER9pYNtaOIhcg9bXTc6/FVJFcCwBYsNWEGcpnr5Uq3vJeqskLr4nimGrhaD72ZUmrRkim5g8VployJxdIE8ZIKZx5Ld+eLZnqFbdR0DzIlUX3OMNvdv7qE1iWvWNuGCY8zqBy1xrweNUQmhKE7au7wuEKsUKkp3nXQwloY7Ne7CaN2uXyHerbbRbUpnzsGelD91mtLnfOlUTnUn0UXc+NHeByotHBbj6PuUh+quuryxkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPlf768eURtkYipOJSiRN8MITrSFTmZeMTQYP1VfBDc=;
 b=bUnJ05AdpWSFHv6zQ5hS4XO6iZENBqAT1ycgq3Tl2saRyAitBYtkHHTCx/GJTFdKCtUHQ3wTyqcc95pzqPKQSeVMU1CaXjUfV/3CW8BItFRwDTi8tBrGHggenTOdrhLK1QmoIl1lT3AY7h6uMmUWKweT4Hpu6c3JkxseWQkNhV++zGLcrS3MloF8M/zoDVLL4Gj+RoS8I+o5n1YSItccM/ECazv1ckmWSyko46DHP68fb33gWgKEIipLFkVA1jcGOQ/2wHMttbhRCFwza5dB94BvbTcqseLFsQZjFpcYy9iHsydemnt8507VLFSIduQAfgTa1bxhrC7e+NZ6Chn7KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by LV0PR11MB9837.namprd11.prod.outlook.com (2603:10b6:408:385::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 21:08:44 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 21:08:43 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/10] drm/xe: Add infrastructure for debug configfs
 parameters
Thread-Topic: [PATCH 08/10] drm/xe: Add infrastructure for debug configfs
 parameters
Thread-Index: AQHdMN+Pb3tBZVvYN0iUMxDXk6EEebanYMeAgAANogA=
Date: Thu, 20 Aug 2026 21:08:43 +0000
Message-ID: <7a4c189b484d937b6924aabe0c0a588464eabe17.camel@intel.com>
References: <20260820200719.84681-12-stuart.summers@intel.com>
	 <20260820200719.84681-20-stuart.summers@intel.com>
	 <20260820201956.0A36F1F000E9@smtp.kernel.org>
In-Reply-To: <20260820201956.0A36F1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|LV0PR11MB9837:EE_
x-ms-office365-filtering-correlation-id: 580d7304-a611-475c-ffb0-08defeff37c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|3023799007|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: NkWNNvmOcCOfax3TrydQonG22JPJc8AWFwQTkVxmYfeJz07RzMyQ19MrYw65izFiqJhDJT+2XSXh/Ww8UiLPumwjNBrhE1W7McG+ARW8MpsTJr2iaNl5+d2ebn28KvMmWRU3znJwLUaq+rDMc4SzXFNO8JrFiMT3lTM/zWVKvE23/Kla/vp43JNQcFzt7jAwH8/EzqglksfvhOZYWyW28CObwfAD56PDByU+sMEJQFWPD1JwRDFV4wa1Ld5LPsfLEm0uVI+/4F1nHqQJeMWHt6qNgiv+kkiD50gI9Kqd2BHQjfA1DkyfdD2Mwbajc00h3c6BNwprmNibfHyiBvyhuAymB/+HoGRin2QEbipjo1Fr6Q/vsEM1qDBYEqHUlAsyQh0NZ5fX7qzfsUWRvLRro6e0Uu/BVbscOdKrd8zc6/brzHhFHc8T3w1dX5Kyu6ubARChjqsu1VqmWHucp0Rzw/j0sl8AxRWj2vWXswvW3rmk04JE95jo8myPZXz378JUuyLoBcrNTmV8ai8Z/ROSaz+c6Z/Dc5n7Xjzjd/EBW9Pp9XpAbDaC3O5MwLmBOYEyJb7iDjPW9vHMQshTCnF0F0boKMUNv9Hb3a2A0kxTmpbN3rsnKkYKSJf3zpzaZdf2RR3Wh4lI4lGggFu0O+VGKgCmlbeJHRqzOyMJT5/OTURJAtCLOQpU+5q6rglv7kJ4Q+HOUwgFFWuAgRRwzYaoJglHqBbHNmIoBJ6QMvYnmDA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(3023799007)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sm9BU1c0dmRNaFdzVmtaUUlCd1F4Tm0venRqS0tUVkZUMkFHSm04b1U5WEI1?=
 =?utf-8?B?Rm54dWdHMFFJeGd2RDBHVGtSQlJOUnlYaVg1ZWpzMDZkZ0p3Q3BNc3F6U3lD?=
 =?utf-8?B?Tld5TUxsUmtNNnl6VlNjUnl0Snl4U2dXMWo4aGZMZlU1KzFTTTBmNXd3eHRL?=
 =?utf-8?B?cmJ4ZDV2SHBDeVpXUVlYQmIrOUptRDdvWXUrWmVpeWN5aDRINHF3TVhlMU5E?=
 =?utf-8?B?ZVRLRHlHc28vREo5alprNnlkeXR2cDYwcy9SSHpuQllCamtyYVRTaWtxcVc5?=
 =?utf-8?B?bS96QWVxUzJsVWhGTXY0Ykg3VEpDeU5QUVZjcldZUEYrb0dMWmYvY2tpV3Bo?=
 =?utf-8?B?b3kvVGgxZjVEQ1hXVUh2RzVWanFuSW9JLzBJaEV6WGNQSE5tbW1ORmwwWGdK?=
 =?utf-8?B?M0lCMVE5OHlBbVE0N3JhWFdPVmFVVmFGZFJpbVVIUEJldTE3ekoycHJMQ254?=
 =?utf-8?B?WUdma012MGlWNG5BeWowWnVqa0txVmlYQ3NtdHk3b1hRSWlxSk55YkxZSzIx?=
 =?utf-8?B?WFZkVXo4SktPa1JtRXNSQXZQekY4dlYyM2thSytHSTNNa0pNajByQ3hTTlUy?=
 =?utf-8?B?eVBqdDM2dDdUV2NMdG1GN0tqbG56Yy9Ha1pjSVYxUm45QkNFS0svdWZ1Qnlh?=
 =?utf-8?B?R1JraW9XU3NIdjh2L0M0VTkwTk9LUWtqZG1mQ3FBSTNWSzhHKzZONGYzMGlv?=
 =?utf-8?B?bS9JcjlVOWpBdFU5TnQwNHRrSkN4L2s3NituRFV0U3NqUVV1Y2kzSkdQZVdK?=
 =?utf-8?B?RUY0V2kzcTlUdDJNZGIyZG5rSmJWNE5aeVluaDF2V29hRE1BcmJhZHFQZjlE?=
 =?utf-8?B?RENsclZwbENGTFNTazRocEljb1NvRjR6VFd4b0ZORHR4RCtoby8yb1R1Wmh5?=
 =?utf-8?B?UXEyQk9YTExTNGliZ3pQTnpZcURIUUIxUEZzT0NWWEMwcTZEWVEzZWdHVUIz?=
 =?utf-8?B?cXY5Z3B1UUNEMzJObEluMnVBVHZsK3dTUEtrbGl4RHVGbW11QlJuT3RQL2hU?=
 =?utf-8?B?MDRTNkkzNFdGS1pqbWN2VTdzR1hLai92UU81eXJSZGRwTDk4eGh1UUtXZlJE?=
 =?utf-8?B?RGhxTitnRE44Yzc0SDNwV2FWN3ZGOEw2R3BsVEZDTStFWGQ5UFpOTXA5L2ZS?=
 =?utf-8?B?bW45NCtyQ1p1NEtQbmhpd2ZBTnNLMCtLbHp0RGNHNmh1Y3VzenJMTzdWNURj?=
 =?utf-8?B?REN3aUxvczZ4SUVKWFJMSkJSRHlQbkRNOGxBUnZFUlVjTTZaczdjeWM1WjVy?=
 =?utf-8?B?UXpmTjhld3BJd1UvL1ZZTU1GRnVKSU16eXVha1A4d3NiM1ZWelo0S1gvTUVn?=
 =?utf-8?B?WVhSS2VsT1lqd3dVbzM3dStoWGZnNHZoMW1lTFFpdkhUYUp4MnZiZm9TQkgy?=
 =?utf-8?B?bGJ3UkgxdzFrQnhOR3ZZcUIrbi96VUlIcnRkY0xzU3dCWmpvYnB1WUhQK05v?=
 =?utf-8?B?a2RVMFdTaGJEME10a2d0cm5xNTRzejk4N3BxZGVrMkREazlGa1daVkhZZGtL?=
 =?utf-8?B?cllUZWpWZFRYTzkycFF6LzhGUDZLbDN4d25QNmtWRG0yemExcmxSVVI1OW5y?=
 =?utf-8?B?NEk3a1JZa2xOYWFuWGtzY3JBU3hZeUdLbHlXcU1DYzR6ZmxPRGV4WGJncGM5?=
 =?utf-8?B?NkVXR0J3TUxpajRoZmpXWnBVYmlObjRLRC9lVVdCOERmQkdPME16Tk9Bd3ln?=
 =?utf-8?B?dEF2ditnWHN1S3lpejVZbVc3YXRpVG5SRHVqekhrUlBHYVlaQW5adkwraHZl?=
 =?utf-8?B?VVdqRWlNWEZybWNJMUdjbmk2TENFMURIS0Z3ZnNldWlDdFlRWGhnQWIrdGMv?=
 =?utf-8?B?NDN6NlZManNZb0dtcVhodEdKS1dqYkprZnJGRm5LWThiVE16SXNJRkZFZGts?=
 =?utf-8?B?UWZObkpIV1Y0QVdJNWJmcGN3enpYZk16c0RlWk9Vc3hMNEd2TmczU3NXeVpR?=
 =?utf-8?B?U1pjTnZCWGlRS3BVTG9MVWlKWnFYU1hrNkJYTE0vU2tvKzRnV0FPZUdhdnVF?=
 =?utf-8?B?dlUvL1lEUzJjUTB2VXBYelFlVFRkOXdRaDZRWjZaUDdObHNsK1lhYWt3bHM3?=
 =?utf-8?B?YTY1UEJZbVdMWFViczhSUDBCREdFUXEvbHFUUzAyZGhWbWludDF2TEtuYWxI?=
 =?utf-8?B?VXJqRXF2YXhya3YvN1FxS0pyM2d1dWlDK3g1NGhIOWhSQk82S1AvY0ljc2Nx?=
 =?utf-8?B?cjVYU2YrVmNsMmJLeGVqZWtPQjNwNTRVTFVOMVczSjFGbGpGTWZBYTNiaDZv?=
 =?utf-8?B?RkgwVkQwMElZeTNQQ2tCZ0N0RWcxc25XN3Z6SmlhT3dHcGVIV2M4bWVUdUFJ?=
 =?utf-8?B?TkJFakxlbFA4VTltWXd1Q2RoUEY1dHZ2VEJ1Zmw0ak1YMk9aK2Vlb1hnZDIz?=
 =?utf-8?Q?Lni+cIijtdD1axJQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F272BF45746D8147972B72DA42A39576@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: G+AWYfpGq8rER2TSrkuJnDSde98Wk22pO6YUCMahcyu1mmvfuVOzXWTKPlKQeNxWAFsv8hsDW1acwEfc0Qu5qVPg/Sz6My7PPNgiH+C+NEJuUARplN9rczY0gh9HGGaNtWoD9YgmWFdP9sUViQUjlo/5+ugeenS53AJXC6B0DyVnH1qzESDtSLp+J7uzgILqjsNtasVspb+A1WMwW8KbEHah/1eY5G0KPqxfpYhvAipikLhFD9yWk0zpWbqR5HIN9CXcbU6CaRhPLEEyG0UXym3IsPAdxEys5c/awYN6PTinZGODO9DSr1FcD87kSlXt3ydd67TBgRM/IoCRV5BABw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 580d7304-a611-475c-ffb0-08defeff37c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 21:08:43.8899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wYvkbMk5IjaEMeMD8aYuypdehJpo88yBjTMgWUP4EFOIn98F8L9FmCK43ydfeHT2ylhdUsnLNa/2MOsM1pdrm4LG8eF7jKDWLyvS3ccKplo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9837
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA4LTIwIGF0IDIwOjE5ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAxIHBvdGVudGlhbA0KPiBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTG93
XSBHbG9iYWwgbmFtZXNwYWNlIHBvbGx1dGlvbiBmcm9tIGdlbmVyaWMgYXR0cmlidXRlIG5hbWVz
DQo+IC0tDQo+IA0KPiAtLS0gUGF0Y2ggWzhdOiBbUEFUQ0ggMDgvMTBdIGRybS94ZTogQWRkIGlu
ZnJhc3RydWN0dXJlIGZvciBkZWJ1Zw0KPiBjb25maWdmcyBwYXJhbWV0ZXJzIC0tLQ0KPiBjb21t
aXQgYzY2NjNlNjkyOTA0Yzg0YjM4NzUyMjViNjViZTQyMTAxNjJmMWY1ZQ0KPiBBdXRob3I6IFN0
dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+IA0KPiBkcm0veGU6IEFk
ZCBpbmZyYXN0cnVjdHVyZSBmb3IgZGVidWcgY29uZmlnZnMgcGFyYW1ldGVycw0KPiANCj4gVGhp
cyBjb21taXQgaW50cm9kdWNlcyBhbiBYLW1hY3JvIHBhdHRlcm4gZm9yIGRlZmluaW5nIGRlYnVn
IGNvbmZpZ2ZzDQo+IHBhcmFtZXRlcnMNCj4gaW4gdGhlIFhlIGRyaXZlci4gSXQgYXV0b21hdGlj
YWxseSBnZW5lcmF0ZXMgYmFja2luZyBzdHJ1Y3RzLA0KPiBjb25maWd1cmF0aW9uDQo+IGF0dHJp
YnV0ZXMsIGFuZCBhY2Nlc3NvcnMgZnJvbSBhIHNpbmdsZSBwYXJhbWV0ZXIgbGlzdCB0byBzaW1w
bGlmeQ0KPiBhZGRpbmcgbmV3DQo+IGRlYnVnIGVudHJpZXMuDQo+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWdfcGFyYW1zLmMNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Z19wYXJhbXMuYw0KPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4uMDBlNWZmMTc1YzBhZg0KPiA+
IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNf
ZGVidWdfcGFyYW1zLmMNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gKy8qDQo+ID4gKyAqIERlZmlu
ZSB0aGUgY29uZmlnZnNfYXR0cmlidXRlIG9iamVjdHMuIFRoZXNlIGFyZSBub24tc3RhdGljIHNv
DQo+ID4gdGhleQ0KPiA+ICsgKiBjYW4gYmUgcmVmZXJlbmNlZCBmcm9tIHhlX2NvbmZpZ2ZzX2Rl
YnVnLmMuDQo+ID4gKyAqLw0KPiA+ICsjZGVmaW5lIF9YRV9QQVJBTV9ERUZJTkVfQVRUUihfVCwg
X25hbWUsIF9kZWYsIF92YWwsIF92aXMsIF9nZXQsDQo+ID4gX2ZhbGxiYWNrKSBcDQo+ID4gK3N0
cnVjdCBjb25maWdmc19hdHRyaWJ1dGUgYXR0cl8jI19uYW1lID0NCj4gPiB7wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+IA0KPiBb
U2V2ZXJpdHk6IExvd10NCj4gQ291bGQgdGhpcyBuYW1pbmcgY29udmVudGlvbiBjYXVzZSBnbG9i
YWwgc3ltYm9sIGNvbGxpc2lvbnM/IA0KPiANCj4gU2luY2UgdGhlc2Ugb2JqZWN0cyBhcmUgbm9u
LXN0YXRpYyAoZGVmaW5lZCBpbiB0aGUgZ2xvYmFsIG5hbWVzcGFjZSksDQo+IG5hbWluZyANCj4g
dGhlbSBhdHRyXyMjX25hbWUgY291bGQgbGVhZCB0byBsaW5rLXRpbWUgbXVsdGlwbGUgZGVmaW5p
dGlvbiBlcnJvcnMNCj4gaWYgYW5vdGhlciANCj4gc3Vic3lzdGVtIGhhcHBlbnMgdG8gZXhwb3J0
IGEgdmFyaWFibGUgd2l0aCBhIGdlbmVyaWMgbmFtZSBsaWtlDQo+IGF0dHJfdGltZW91dCBvciAN
Cj4gYXR0cl9lbmFibGUuDQo+IA0KPiBXb3VsZCBpdCBiZSBzYWZlciB0byB1c2UgYSBzdWJzeXN0
ZW0tc3BlY2lmaWMgcHJlZml4LCBzdWNoIGFzIA0KPiB4ZV9jb25maWdmc19hdHRyXyMjX25hbWUs
IHRvIHByZXZlbnQgbmFtZXNwYWNlIHBvbGx1dGlvbj8NCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKg
LmNhX25hbWXCoMKgwqDCoMKgwqDCoMKgPQ0KPiA+IF9fc3RyaW5naWZ5KF9uYW1lKSzCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4gPiArwqDC
oMKgwqDCoMKgwqAuY2Ffb3duZXLCoMKgwqDCoMKgwqDCoD0NCj4gPiBUSElTX01PRFVMRSzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXA0KPiA+ICvCoMKgwqDCoMKgwqDCoC5jYV9tb2RlwqDCoMKgwqDCoMKgwqDCoD0NCj4g
PiAwNjQ0LMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4gPiArwqDCoMKgwqDCoMKgwqAuc2hv
d8KgwqDCoMKgwqDCoMKgwqDCoMKgwqA9DQo+ID4gX25hbWUjI19zaG93LMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPiA+
ICvCoMKgwqDCoMKgwqDCoC5zdG9yZcKgwqDCoMKgwqDCoMKgwqDCoMKgPQ0KPiA+IF9uYW1lIyNf
c3RvcmUswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArWEVfQ09ORklHRlNfREVCVUdfUEFS
QU1TX0ZPUl9FQUNIKF9YRV9QQVJBTV9ERUZJTkVfQVRUUikNCj4gDQo+IFsgLi4uIF0NCj4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Z19wYXJh
bXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX2RlYnVnX3BhcmFtcy5o
DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAwLi45NTRj
YTQzNDMxMzZkDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9jb25maWdmc19kZWJ1Z19wYXJhbXMuaA0KPiANCj4gWyAuLi4gXQ0KPiANCj4gPiArLyoN
Cj4gPiArICogRm9yd2FyZCBkZWNsYXJhdGlvbnMgb2YgdGhlIHBlci1wYXJhbWV0ZXIgY29uZmln
ZnNfYXR0cmlidXRlDQo+ID4gb2JqZWN0cy4NCj4gPiArICoNCj4gPiArICogVGhlIG9iamVjdHMg
dGhlbXNlbHZlcyBhcmUgZGVmaW5lZCBpbg0KPiA+IHhlX2NvbmZpZ2ZzX2RlYnVnX3BhcmFtcy5j
IChhcw0KPiA+ICsgKiBub24tc3RhdGljIHNvIHRoZXkgY2FuIGJlIHJlZmVyZW5jZWQgZnJvbSB4
ZV9jb25maWdmc19kZWJ1Zy5jJ3MNCj4gPiArICogeGVfY29uZmlnZnNfZGVidWdfYXR0cnNbXSBh
cnJheSBhbmQgaXNfdmlzaWJsZSgpIGNhbGxiYWNrKS4NCj4gPiBUaGV5IGxpdmUNCj4gPiArICog
aW4gdGhlIHNhbWUgdHJhbnNsYXRpb24gdW5pdCBhcyB0aGUgWC1tYWNyby1nZW5lcmF0ZWQNCj4g
PiBzaG93L3N0b3JlDQo+ID4gKyAqIGhhbmRsZXJzOyBjb25zdW1lcnMgc2hvdWxkIHJlZmVyZW5j
ZSB0aGVtIHZpYSBhdHRyXzxuYW1lPi4NCj4gPiArICovDQo+ID4gKyNkZWZpbmUgX1hFX1BBUkFN
X0RFQ0xBUkVfQVRUUihfVCwgX25hbWUsIF9kZWYsIF92YWwsIF92aXMsIF9nZXQsDQo+ID4gX2Zh
bGxiYWNrKSBcDQo+ID4gK8KgwqDCoMKgwqDCoMKgZXh0ZXJuIHN0cnVjdCBjb25maWdmc19hdHRy
aWJ1dGUgYXR0cl8jI19uYW1lOw0KPiANCj4gW1NldmVyaXR5OiBMb3ddDQo+IFNpbWlsYXIgdG8g
dGhlIGRlZmluaXRpb24gYWJvdmUsIHRoaXMgbWFjcm8gZXhwb3NlcyBhdHRyXyMjX25hbWUgaW4N
Cj4gdGhlIGdsb2JhbCANCj4gbmFtZXNwYWNlLiBBZGRpbmcgYSBwcmVmaXggbGlrZSB4ZV9jb25m
aWdmc19hdHRyXyMjX25hbWUgaGVyZSB3b3VsZA0KPiBhbGlnbiB3aXRoIA0KPiB0aGUgZGVmaW5p
dGlvbiBjaGFuZ2UgYW5kIGVuc3VyZSBuYW1lc3BhY2Ugc2FmZXR5Lg0KDQpUaGUgb3RoZXIgcmV2
aWV3IGNvbW1lbnRzIGZyb20gU2FzaGlrbyB3ZXJlIGFsbCBwcmUtZXhpc3RpbmcgaXNzdWVzIEkn
bQ0Kbm90IHBsYW5uaW5nIG9uIGFkZHJlc3NpbmcgaW4gdGhpcyBzZXJpZXMsIGJ1dCBJIGRlY2lk
ZWQgdG8gYWRkcmVzcw0KdGhlc2UgbmFtaW5nIHN1Z2dlc3Rpb25zIGluIHRoZSBsYXRlc3Qgc2Vy
aWVzLi4NCg0KSSBzdGlsbCBuZWVkIHRvIHVwZGF0ZSB0aGUgSUdULCBidXQgSSB0aGluayBvdGhl
cndpc2UgdGhlc2Ugc2hvdWxkIGJlDQpyZWFkeSB0byByZXZpZXcuDQoNClRoYW5rcywNClN0dWFy
dA0KDQo+IA0KPiA+ICtYRV9DT05GSUdGU19ERUJVR19QQVJBTVNfRk9SX0VBQ0goX1hFX1BBUkFN
X0RFQ0xBUkVfQVRUUikNCj4gPiArI3VuZGVmIF9YRV9QQVJBTV9ERUNMQVJFX0FUVFINCj4gDQoN
Cg==
