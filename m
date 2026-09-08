Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A4C559CB5
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873983; cv=fail; b=b5FN8bwfXoEaOl/2ZcNMKnZe01ehhFLUiBZEMB0Cx79UAW03b2aJpehEo/YDsoOwp5KIJVtpvN2i5h/0gIciB0O4eJOJY7MuNx/NmyoRIFy3kC114BWY04ovQn3sxf/dcNLnKai+ETvxgT1jGEOCk2KvRtdnGBW+a78wqjAlmso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873983; c=relaxed/simple;
	bh=JACOqHfhsxAjMr3knJ+ciDYodMmDlKngjmCbHi52mSk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uy68576GJt07DJYzl2LfGZpUOcSZkaPiEZEIY82qAkE1ugFnlsGPsqGPEXpHfbXmCjjM9UP9aS2wuJFd1a+tFSlRblVn0TT1XRteoQPgrTTSjX+CEVCu2WC/UR7/8K+6pXjjB/dOciTRVkPxZIb4Q9oVUqFl/n5k+FhErlAh89o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGqvP/mr; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGqvP/mr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788873978; x=1820409978;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JACOqHfhsxAjMr3knJ+ciDYodMmDlKngjmCbHi52mSk=;
  b=JGqvP/mrT16b2CI/k2BUN5/iIsgJrLuKASaHd+MuRoIGjntyy4jp470s
   kBCZs0Kfhz7+PwGNWFJS4aOl5oF6spjitkvmK7xXNd8DAbUWIEdefSZfo
   fr5anL2pnreIEnMArjDFZOMZT6czR6Q5brQjYMq6RyGQqNJWJ5NjlBYyG
   DIGViXNaDH0NKLPaLVgqBZCEZOGnduF/Zwr5fQoWW1+guHM1GQO/xIdQp
   5OyzCXnmusLSMfi3oIqLDBDVcd+vbbyEvNhbaTr3VqFWnYmmaXfwsHjHT
   FBdfBYt1mTz1ILPEk0fZBicUzsGS4dyoK2+AV9BToISH1zuu0yy2fGXsX
   Q==;
X-CSE-ConnectionGUID: VmvbsbPQQHGItzQntM8BPQ==
X-CSE-MsgGUID: ckzXd4WwQtKMXPDje7Vq7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="112053301"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="112053301"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 06:26:08 -0700
X-CSE-ConnectionGUID: MyR7zqEoSDS41QGVlaQ12g==
X-CSE-MsgGUID: VYIpfsLKTLK+3r9M0elVHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="271513173"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 06:26:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 06:26:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 06:26:07 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 06:26:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYhyeJZglPjaIuEcxN6qG+Lzoy0xNP5GigWkag/uAj2/VKqD4NPKckjEIgxQ4UZC4EWf/1oRQanmsuSrjeMAxfgnqbzbw8UVuAs4wTHuipRXXJNI+U3cOmiceYGKWlqcDCgwfrPOZxZR7ACU+BL3KDhi6HMcleTcj+H76Jq/M8jJ/qYh7x1HIJ7uWHnBADrfBWRKSTE02SzJtEAGqkB4V2RwMxbnp/PZXP4qXmP8PjD1El4IsSdkbz3ZovYO9utGqpF6zdU6jzGDiW5o8DZjqLYTqQVk65+LaNqxi+9y6cKkyHnQTeLLW2BvHitxCZkIKaNZRBGAMFKYtMIRR8R9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JACOqHfhsxAjMr3knJ+ciDYodMmDlKngjmCbHi52mSk=;
 b=SO4fvfA73UXsMpJGBbrG6fUvjeOHcf5LLLHxPsA2SjbA8u8QGnk6tD2NU3AVpKqLlSIckUkG8Iq8C07Kc1mMMdDKhCXZklOiO3YDLIqW5PsB/qct4UiwObI1/2TyaYYci/ha1qDZsQWBM2J2TPOo3SCwvMzqKCHXLkQfp6HAXX/qINIqNmGjuuYkK4gmwXvXfJ3x/h+d5TrXkLiyO8tLF0fV+FihE5axWHOTZplQmV6b0ITcbiy78dCTIUGn4SNNVPs15HkECUkuezquJCnrDp03/kULA4h7toDFpawsekDW+x0R50ajWBcEpYti/3P0jCxXpd/EVWF+oaVHHoHIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SJ0PR11MB5198.namprd11.prod.outlook.com (2603:10b6:a03:2ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 13:26:04 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 13:26:04 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [V3] drm/xe: Skip clearing purged page-table BOs
Thread-Topic: [V3] drm/xe: Skip clearing purged page-table BOs
Thread-Index: AQHdP4elZkmhJsBbLUuR+0Gm6MN7LLbElXkAgAAUtwA=
Date: Tue, 8 Sep 2026 13:26:04 +0000
Message-ID: <DS0PR11MB8718070BCCDE4CF62B8F94F581B12@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260908114545.915049-2-tejas.upadhyay@intel.com>
 <20260908120458.6D42F1F00A3A@smtp.kernel.org>
In-Reply-To: <20260908120458.6D42F1F00A3A@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SJ0PR11MB5198:EE_
x-ms-office365-filtering-correlation-id: f8543227-b94c-4477-df82-08df0dacbbd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|10070799003|376014|23010399003|1800799024|366016|38070700021|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: WJ+bOPcrJRm7570CZc5QOkeu6g3V2Y6hAmT6IN/7vxYawZ+KCIIquWkqV/xEH9nKFmHlgZoKbtuF6UWWFGuah3Nez+HCqp2vDfKQ8A7ccXz/Vjs7YpLmNtj24Bkf/5wtR3q2uZM+Q0V5s51RzjVfUAjuz6XEMldJkggFJH86D0kJSP2NPArRlc0pmk9nM7sqcYaEMRUwAhGwHHd/aUf5nV+lJ3Sz3Y8MknEHD1vSKH0bw4PKK4pAgiZhzUYmYtOSk/XXyz1yquIE+0+hY1oiWnKJZXW42WHLkzyUbxBy4MU1VbHLAL0RT7Ye4ZZKkzmDveE781nAn1+xYP8ii8lf9zZbCWsS64FP2/K2w11FGKxNRiHi+L/9A6GstAxD6zTFlCdPTv9olN5eQf/FfUWtm1JQGVCCmeH5Nwuv++eUjg7sSJ4w2JOiTzJnu7p0kJ62OTQBwM9DlvnuKNSEJ/cU+Vgx/DFiqtKjz9cP2X7sdQm0E/f9RNrtJzrWjFH8S4IE5YjxmKJyiRxog5hb8hhrkjpEi7lhm+hISsMR3ryYcNlpILcAfpjvT0FB9QSCqnq8brGGJWGPRfOlp0eUecMi7N6+mj4fMI3wgVohCusIyY14G9Yq84e5eGYhIy/A02YFaGfaK+vuUE6R+kNzHv0iaTXaRPAN4MCz/Hw19p4Jj5M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnhXYlBVeHBOQVNNKzA1UWJNdUVTRFVkUEcycllSOXMyVEVQVUJaeGJ4c0Zu?=
 =?utf-8?B?MjV0UHExRisrc1RWcksrcERoOCtKZldobVJ0RGw3UUxPSytmUUxFUzE2WGtq?=
 =?utf-8?B?NHRIWGxLVFg4QlZxaG5BbWtML3Q1RmRaNFNPenRuWmxzbWljQXNtcFZoNjM2?=
 =?utf-8?B?U0ozN1NMcWVOb1VJL0pEVFVLWG9aTGdobTlodmxmUE51MXpKRnI4VS9ubEs5?=
 =?utf-8?B?ZDNESzNtdm1BR3FIK3NoakxiSy9EdWY4OVkzRlUyaFRXb2hTb1JjbjJZOFB3?=
 =?utf-8?B?YTNJcldINEtZRWpoczN6YXRaWVJNSzRWb21JVjAwS0ZwL2thUkRTc3Z3ckNL?=
 =?utf-8?B?bkVRQjUvNzhNZm1heXRuRUdtWEpUdWNuMXpIVTFnSWd5RE14Zlo0VFJVUXJX?=
 =?utf-8?B?bDkyQTVkVi8ydEx5M3NabW12V3FscU91bVQvVlJpUFh5NURQOTZmRjdNcmhD?=
 =?utf-8?B?MmxEam85R290V3dCcWdGQjEwR3VEY1dzZ2RSQ0NnVnUwVTVtZVpJakVRdndl?=
 =?utf-8?B?YjlkekNKdVhQeC9kdm42L3lEa2JaZDNZUTQ3SExuYkFYdGhYajNCQjl6dzRa?=
 =?utf-8?B?Q3dvTmt0cTEwZmpsLzVqaXFEQ0lvOTJQeGhxT2ZFVFdQUWhHenR1L1U5K0RW?=
 =?utf-8?B?YlhjSy9taGR2YUxwN2pvVGNMZVo0NEl6c29Xem9VZUpoWExwV2N0OEpHbkk1?=
 =?utf-8?B?SitoMGpXSXVOeHVZZ0xJZU5iMHVhbGRXS0VSZjg5aVMyT3JVRHplVGIzZmZV?=
 =?utf-8?B?My8wc2EvbGVXTkFyQWNKWC9jcWVRQ3JpbTdtNUJXVmdoTVRTWUdoM1NOSzA4?=
 =?utf-8?B?ZFJsaGVWWUhNajBMc1pIdnRsTE5tSVorNW5BVkxqSHQ1TVNxaks3cHhxM1hF?=
 =?utf-8?B?SS8zM0xoMUhySElSWEZ2bDZ6QTFDLzhocjJNZFI4aTAvYzNTVFpTRjhLWVVa?=
 =?utf-8?B?ckFyNTl4L25NMjFhdHVaT0NEYktkTjhuakdjZXpBSlEzZk9mTC9TUEZkZXlB?=
 =?utf-8?B?M25hcW5zTFVieXNyN1pVQ0t1K0picHdOZW9qMGVwVVIrQkZTdjVUVnAxWFhV?=
 =?utf-8?B?K09iQS9Mbk1NYUdWR2pMZ1EzdmxSVms1MG9LdUxCUEMwc1lzK1JFWjBSWlNH?=
 =?utf-8?B?cFRRVi9qZk1mWHUwWkNJaXV1SU9MKzQ3aC8yRHIrU3JQREhHVG8wZWM3d2RB?=
 =?utf-8?B?d0o3OG1xdzVtbit6OG9rQjZ0VTRjU2ZnMG12ZDlyem5rWmtJTHJUVVFHQVo1?=
 =?utf-8?B?YXNMem9DOXd2eDBTaW45UUo5czV5TlZZNEFhSFhHS2JZbEo4bjk0MDFDbGlW?=
 =?utf-8?B?MTQzQXlzdFpnR0lHcnpkUnYxTzRMU3RiQitpdW4yZFlCZjFPR29XdHhzOXor?=
 =?utf-8?B?Y0RYM0s1TmRRZy9yOS9vVWNMU1FGSnB5YTZVU1R2WExhYzFNcXVMalVhbVdy?=
 =?utf-8?B?dXNiWlJ6YUVRcCtTOERibXpTRjlXRjdsNEljdkU0SjduNm9KRnQ1Q05RUENO?=
 =?utf-8?B?MXlXTGJnWGN0V29qZ3FGS3hhVVFERWs3WityVTk4QnNibzhZTTROV1NwMkhS?=
 =?utf-8?B?VGRya1lLMVA0Sk5PbmhHeDhLVW1VOWV6SVlyaUFqMFNjTzhBYUxzTkxtMmF1?=
 =?utf-8?B?SHBIZ0VUbkFIdUpWQ05TbHhScm41NG9oTWYxMEkycU9nVWFVOEFMRW9QZ3JC?=
 =?utf-8?B?bVoySTlpZ1JidmpFOGYwUmtuMi9UeUNFWUNoUnZjZml0d3NiWTJkeVBBVndI?=
 =?utf-8?B?R0VrZytjKzdyL0FWcGJiUmtuaDZvMmFla2NHU29pMlFwM0lxQ3VYNnNmN0pI?=
 =?utf-8?B?ZUxQamZFN3g5czZnLzNNMmt4UDVVdktsd25leUY0SFFSNzl5M0xDYXl2QTlH?=
 =?utf-8?B?by9kYmNXU2dHR0w5QWhTZWZRdlVNdkdWMVAvU2g5ZENNVlNQY01kUkk3cXRO?=
 =?utf-8?B?Mzg3eEt2TnJkNzhzZmR1SGdsamJGOHlGUlpyVk5LMDY1cUYwamhZRk9DUDQw?=
 =?utf-8?B?WENGVUMyalZBakloM3pzaGsvYkJuTFFJck4zSkMrcXFpaFBXNWpBYUtuODFH?=
 =?utf-8?B?TTZtMWlCaDJLN3gxcW9NVVpSQldGRGVVTFNUODdxU09FWGdWeUFYS2FiOWV5?=
 =?utf-8?B?K3ZWeUVBWFZveC9RZkExdlUzallGcXNEWVN1Y2tTMUQ3VWpxODZRMTFrNHBH?=
 =?utf-8?B?Q3FlUHdya3VSdkhub281RzNMREltRHU0MlhaM3VSSzE0Zk5MbFZFTFJwRURY?=
 =?utf-8?B?S3lEaEpHczBKby82QldBb0FndTZoUU5aYmxxTmhraWJKTWRDYTZ6dmR0NDlq?=
 =?utf-8?B?emp1SUFLbjJHWGNsN05LbzI2bkhFeGVHeWNsY21RU0Q3ZW51cEFVVlZ5RlZo?=
 =?utf-8?Q?4qkdzQBLTmvVdvNNt6+hVAoF9IM/MarjZ7x7irNMEYzmO?=
x-ms-exchange-antispam-messagedata-1: CdMPS5kGvBti1Q==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZE1ucRdmL3siNQ3SepTduFiVA63OS8RI1Kc1JJ1neDTzm6z73L2TjEGwkrCXyKRpZIB1nkkQaHs2HeOmL85MvcgsqMYBvLjC3eCIaHwKndsFZ8+QlApdoMy2ZsyoRX9fO9XVkJ0f+ha53HPudgN4cVEO42sSv0HBHelfLI5gjawwgaUCfDsXhlTn1y/vtdMtLxz2pC8b7DfO7G00UNTIOyNCgC0TVUEBU0RIRu0yBQQnOgGvn2bDlKldq2JOvfqzHMXjkRboBNsdMugXZBUcvHGx4Bwaze2ZCxUhVPrmt0+/xQBVJ5ZGKWRUPwG4hxPQiy/xkDW/Cus40lumVKCYFA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8543227-b94c-4477-df82-08df0dacbbd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 13:26:04.6057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+rALhSpwv5XX2c8u8u2Dhxxy+W2geshtUqxskXBD+tF2bnspZabQh+359ekbt/gLoO1stMrZxkDHiLt1Z6ZiSIk1zRuIkyLsIno+bN5S2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5198
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMDggU2VwdGVtYmVyIDIw
MjYgMTc6MzUNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29t
Pg0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBb
VjNdIGRybS94ZTogU2tpcCBjbGVhcmluZyBwdXJnZWQgcGFnZS10YWJsZSBCT3MNCj4gDQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDIg
cG90ZW50aWFsIGlzc3VlKHMpDQo+IHRvIGNvbnNpZGVyOg0KPiANCj4gTmV3IGlzc3VlczoNCj4g
LSBbQ3JpdGljYWxdIEVhcmx5IHJlbGVhc2Ugb2YgeGVfc3ZtX25vdGlmaWVyX2xvY2sgaW4geGVf
dm1fY2xvc2UgYWxsb3dzIE1NVQ0KPiBub3RpZmllcnMgdG8gdW5tYXAgbWVtb3J5IHdoaWxlIEdQ
VSBwYWdlIHRhYmxlcyBhcmUgc3RpbGwgdmFsaWQsIGxlYWRpbmcgdG8gYQ0KPiBwaHlzaWNhbCBt
ZW1vcnkgdXNlLWFmdGVyLWZyZWUuDQo+IA0KPiBQcmUtZXhpc3RpbmcgaXNzdWVzOg0KPiAtIFtI
aWdoXSBNaXNzaW5nIE5VTEwgY2hlY2sgZm9yIHBhZ2V0YWJsZSBCTyBgdm1hcGAgaW4NCj4gYHhl
X3B0X3phcF9wdGVzX2VudHJ5YCBsZWFkcyB0byBhIGNyYXNoIGlmIHRoZSBCTyBpcyBwdXJnZWQu
DQo+IC0tDQo+IA0KPiBjb21taXQgNzBlZmFhNjA2YzI2MzM5NDNhZDIyNjdkZmM5NWMyODg1MjU5
NzFhZg0KPiBBdXRob3I6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+
DQo+IA0KPiBkcm0veGU6IFNraXAgY2xlYXJpbmcgcHVyZ2VkIHBhZ2UtdGFibGUgQk9zDQo+IA0K
PiBWUkFNIHBhZ2Ugb2ZmbGluaW5nIGNhbiBjbGVhciBhIHBhZ2UtdGFibGUgQk8ncyB2bWFwIGJl
Zm9yZSBWTSB0ZWFyZG93bg0KPiBjYWxscyB4ZV9wdF9jbGVhcigpLiBDaGVjayBmb3IgYSBwdXJn
ZWQgQk8gdW5kZXIgaXRzIGRtYS1yZXN2IGxvY2sgYmVmb3JlDQo+IHdyaXRpbmcgdG8gdGhlIG1h
cHBpbmcuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+ID4gaW5kZXggNWQ5OTBjMWMzNzQwYS4uNDI2
ZThhMjljNzU1YSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+ID4gQEAgLTIzNiw5ICsyMzYs
MTEgQEAgdm9pZCB4ZV9wdF9kZXN0cm95KHN0cnVjdCB4ZV9wdCAqcHQsIHUzMiBmbGFncywNCj4g
c3RydWN0IGxsaXN0X2hlYWQgKmRlZmVycmVkKQ0KPiA+ICAgKi8NCj4gPiAgdm9pZCB4ZV9wdF9j
bGVhcihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX3B0ICpwdCkgIHsNCj4gPiAtCXN0
cnVjdCBpb3N5c19tYXAgKm1hcCA9ICZwdC0+Ym8tPnZtYXA7DQo+ID4gKwlzdHJ1Y3QgeGVfYm8g
KmJvID0gcHQtPmJvOw0KPiA+DQo+ID4gLQl4ZV9tYXBfbWVtc2V0KHhlLCBtYXAsIDAsIDAsIFNa
XzRLKTsNCj4gPiArCXhlX2JvX2Fzc2VydF9oZWxkKGJvKTsNCj4gPiArCWlmICghaW9zeXNfbWFw
X2lzX251bGwoJmJvLT52bWFwKSkNCj4gPiArCQl4ZV9tYXBfbWVtc2V0KHhlLCAmYm8tPnZtYXAs
IDAsIDAsIFNaXzRLKTsNCj4gPiAgfQ0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBUaGlzIGlz
bid0IGEgYnVnIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGRvZXMgeGVfcHRfemFwX3B0
ZXNfZW50cnkoKSBpbg0KPiBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYyBoYXZlIGEgc2ltaWxh
ciByZWdyZXNzaW9uIHdpdGggbWlzc2luZyBOVUxMDQo+IGNoZWNrcyBmb3IgdGhlIHBhZ2V0YWJs
ZSBCTyB2bWFwPw0KPiANCj4gTG9va2luZyBhdCB4ZV9wdF96YXBfcHRlc19lbnRyeSgpLCBpdCBh
Y2Nlc3NlcyAmeGVfY2hpbGQtPmJvLT52bWFwIHdpdGhvdXQNCj4gdmFsaWRhdGluZyBpdDoNCg0K
Rm91bmQgY291cGxlIG9mIG1vcmUgcGxhY2VzIGxpa2UsIGFkZF9jb21wYWN0X3B0X3BybCgpIGFu
ZCB4ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlc19jcHUoKS4gV2lsbCBoYW5kIHRoZXJlIGFzIHdl
bGwuDQoNCj4gDQo+IAl4ZV9tYXBfbWVtc2V0KHRpbGVfdG9feGUoeGVfd2Fsay0+dGlsZSksICZ4
ZV9jaGlsZC0+Ym8tPnZtYXAsDQo+IAkJICAgICAgb2Zmc2V0ICogc2l6ZW9mKHU2NCksIDAsDQo+
IAkJICAgICAgKGVuZF9vZmZzZXQgLSBvZmZzZXQpICogc2l6ZW9mKHU2NCkpOw0KPiANCj4gVGhp
cyBpcyByZWFjaGFibGUgdmlhIHhlX3ZtX2ludmFsaWRhdGVfdm1hKCksIHdoaWNoIG9ubHkgaG9s
ZHMgdGhlIHVzZXIgQk8ncw0KPiBkbWFfcmVzdiBsb2NrIG9yIHRoZSBTVk0gbm90aWZpZXJfbG9j
ayBhcyBzZWVuIGluIHhlX3B0X3phcF9wdGVzKCk6DQo+IA0KPiAJZWxzZSBpZiAoeGVfdm1hX2lz
X3VzZXJwdHIodm1hKSkNCj4gCQlsb2NrZGVwX2Fzc2VydF9oZWxkKCZ4ZV92bWFfdm0odm1hKS0N
Cj4gPnN2bS5ncHVzdm0ubm90aWZpZXJfbG9jayk7DQo+IA0KPiBTaW5jZSB0aGUgcGFnZS10YWJs
ZSBCTydzIGRtYV9yZXN2IGxvY2sgKHRoZSBWTSBkbWFfcmVzdiBsb2NrKSBpcyBub3QgaGVsZCwN
Cj4gY291bGQgYSBjb25jdXJyZW50IFZSQU0gcGFnZSBvZmZsaW5pbmcgZXZlbnQgcHVyZ2UgdGhl
IHBhZ2UtdGFibGUgQk8gYW5kDQo+IGNsZWFyIGl0cyB2bWFwLCBsZWFkaW5nIHRvIGEgTlVMTCBw
b2ludGVyIGRlcmVmZXJlbmNlIHdoZW4NCj4geGVfbWFwX21lbXNldCgpIGV4ZWN1dGVzPw0KPiAN
Cj4gWyAuLi4gXQ0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+IGluZGV4IDllNzE1NjdiMjdjYzcu
LmU3N2ZmM2NmM2NhMzggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+IEBAIC0xODc2LDEw
ICsxODc2LDEzIEBAIHN0YXRpYyB2b2lkIHhlX3ZtX2Nsb3NlKHN0cnVjdCB4ZV92bSAqdm0pDQo+
ID4gIAlib3VuZCA9IGRybV9kZXZfZW50ZXIoJnhlLT5kcm0sICZpZHgpOw0KPiA+DQo+ID4gIAlk
b3duX3dyaXRlKCZ2bS0+bG9jayk7DQo+ID4gKwl4ZV92bV9sb2NrKHZtLCBmYWxzZSk7DQo+ID4g
Kw0KPiA+ICAJaWYgKHhlX3ZtX2luX2ZhdWx0X21vZGUodm0pKQ0KPiA+ICAJCXhlX3N2bV9ub3Rp
Zmllcl9sb2NrKHZtKTsNCj4gPiAtDQo+ID4gIAl2bS0+c2l6ZSA9IDA7DQo+ID4gKwlpZiAoeGVf
dm1faW5fZmF1bHRfbW9kZSh2bSkpDQo+ID4gKwkJeGVfc3ZtX25vdGlmaWVyX3VubG9jayh2bSk7
DQo+IA0KPiBbU2V2ZXJpdHk6IENyaXRpY2FsXQ0KPiBEb2VzIG1vdmluZyB4ZV9zdm1fbm90aWZp
ZXJfdW5sb2NrKCkgaGVyZSBjcmVhdGUgYSByYWNlIGNvbmRpdGlvbiB3aXRoDQo+IE1NVSBub3Rp
ZmllcnM/DQoNCldpbGwgZml4IHRoaXMuDQoNClRlamFzDQo+IA0KPiBJZiB4ZV9zdm1fbm90aWZp
ZXJfdW5sb2NrKCkgaXMgY2FsbGVkIGhlcmUgYmVmb3JlIHRoZSBHUFUgcGFnZSB0YWJsZXMgYXJl
DQo+IGNsZWFyZWQgYW5kIHRoZSBUTEIgaXMgaW52YWxpZGF0ZWQsIGEgY29uY3VycmVudCBNTVUg
bm90aWZpZXIgbGlrZQ0KPiB4ZV9zdm1faW52YWxpZGF0ZSgpIGNvdWxkIGV4ZWN1dGUuDQo+IA0K
PiBTaW5jZSB2bS0+c2l6ZSBpcyAwLCB4ZV9zdm1faW52YWxpZGF0ZSgpIGluIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9zdm0uYyB3aWxsDQo+IGNoZWNrOg0KPiANCj4gCWlmICh4ZV92bV9pc19jbG9z
ZWQodm0pKQ0KPiAJCWdvdG8gcmFuZ2Vfbm90aWZpZXJfZXZlbnRfZW5kOw0KPiANCj4gVGhpcyBj
aGVjayBldmFsdWF0ZXMgdG8gdHJ1ZSwgc2tpcHBpbmcgdGhlIHphcHBpbmcgb2YgR1BVIHBhZ2Ug
dGFibGVzIGFuZA0KPiBhbGxvd2luZyB0aGUgcGh5c2ljYWwgbWVtb3J5IHRvIGJlIGZyZWVkIHBy
ZW1hdHVyZWx5LiBDb3VsZCB0aGUgR1BVIHRoZW4NCj4gc3RpbGwgcmVhZCBhbmQgd3JpdGUgdG8g
dGhlc2UgZnJlZWQgcGh5c2ljYWwgcGFnZXMgKHdoaWNoIG1pZ2h0IGJlIHJlYWxsb2NhdGVkDQo+
IHRvIG90aGVyIHByb2Nlc3NlcykgdW50aWwgeGVfdm1fY2xvc2UoKSBmaW5hbGx5IGNsZWFycyB0
aGUgcGFnZSB0YWJsZXM/DQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtw0KPiBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MDgxMTQ1NDUuOTE1MDQ5LTItDQo+IHRl
amFzLnVwYWRoeWF5QGludGVsLmNvbT9wYXJ0PTENCg==
