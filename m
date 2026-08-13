Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88895402420
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786646488; cv=fail; b=qydHCy4m2IRmNM1x2BVwDi6z6GsUDK04b8W4WnoH/q4mE74lII7xUCCcOsHyL3WjbWIGM49EierjfhUvdBBwJH4KeRC+2osHS0wbSQl8xlQD3XaiVjgiXofxK/nc/BdmnI8hHfpg0CcP4LrwfYly83N4/wgfVjQ74SJtaMRrELA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786646488; c=relaxed/simple;
	bh=3QiBa11FwZuaitzeGh56sKWi1JMdwEU499C2+V8WTZ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PmW8n0lSLYA7EKPemSfq2JUHxSgqxc75+0r2EXgf4GJD7AMZXyjtgZq1kIXrC/aHUTac7gkul60mdnaxO6TFiEcjBwjPWqAuCj/9M0D4d1RAYlGaFYirNdpO3XQEH45xQsxuZUlPPHWxpayA9/mNH/svNP9O25kIAdL0AboNfA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQHWlMC2; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQHWlMC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786646486; x=1818182486;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3QiBa11FwZuaitzeGh56sKWi1JMdwEU499C2+V8WTZ0=;
  b=IQHWlMC2yq2zzZiI9pXd+Uz/Rln2laJT1BjdED14yNRPN3v10VffF1lP
   1WtVyGPv3ixOf71EiiwiOGqfULwywA/5C1p8epIxJoMCVfEroLcQBG3fB
   kybjfAAW1lDH9oc7wE4LeoOa/zxfjIo+Ev8NxGwfH4EYrVYRoRZAw3xas
   w9jpWpysuRU2q3N5HPpDpZl0k504I399MVVRV2b3dSQSLwnIy28gfxQkn
   H+/P0JIoFvW4Dm3Fw7+CaWPiqEATckkVY0A0Ty7xJILGW9YWDZGlQgRQ8
   tIvor27NoIumnAWnrpixxY/sb5plt/WreVlGnMK+pLUTs9lQmyntp8Agm
   g==;
X-CSE-ConnectionGUID: EGBcE89yS2GjyW3imI3XhA==
X-CSE-MsgGUID: 7IZcajBVTK6nIofIFmopnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="110015030"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="110015030"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:41:24 -0700
X-CSE-ConnectionGUID: OtwAcUEaQ12kDzfCZnPpgA==
X-CSE-MsgGUID: UhGv3eR4SBi22by2Tz6Hng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="267510781"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:41:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:41:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 11:41:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:41:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKJ/U0HwV1KlDgJjh4SsIbB8wqCf3dk6V/53hHHsnLSxV6AW0ZJyynWo5rvVy0wcTO7XyW1TTwOX6m+KcfE5wE4KCrbaJUXQ9fUZ442+UeOZezZFX9PC8Bd3oP7a7mqXdT/nKzJelTOI3+TD+P5IQW99HoH5U/X0S+f6aeCjUUk1AzfoGTUmxDFBJoi0nmAOQoUMabzZRXX024eIWvUuw03usvApVdo5qeAbuADAP/foJ/fMlPGf2/zmLSgnCA6U2k0Rnkc2WhLLQw6EZ2Do2TPGuhD4RWDXiWEGUmQhNgEC4458s+YmufsI2WKLfydgaNOGxkobYaMmGvAcBO/6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QiBa11FwZuaitzeGh56sKWi1JMdwEU499C2+V8WTZ0=;
 b=UMUnvYYqiPppnoClyqicNxxrPoYekfnJ0jMdrC2sl9HQNQTMQTehp7d21fBKZJpPAJw9F5IsDny7Tj7jCxO4nxsCM+whmiN+/gzSvXB9CIUFbsGEWDr42OY7oOor5UA8I6AOlTy3go2YPSoQz9GlJYBIWwZNJL/jJ5x+RRZBP+WVhp2MNksTUvz0eDdCY+XVw4Bq/+sv+D/CWN4+uDHjVsYoTi5yp9s9yrO8GEmfPCETZr/c+B/qXrMsGcQxfd33RBAG2hGMZA6P57Je0IZO0VCm7vWq3NwGqMEHD26wWZFrW8CHyzWzJe2eKiYsdGyVcb6h5DZ4ESq3O8WBDFJflQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH7PR11MB7025.namprd11.prod.outlook.com (2603:10b6:510:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 18:41:20 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 18:41:20 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 09/10] drm/xe/vsec: Support late bind fw information
Thread-Topic: [PATCH v2 09/10] drm/xe/vsec: Support late bind fw information
Thread-Index: AQHdKpIuQX9i6V/b/E24K4tRochXCbaa05YAgAF7hxA=
Date: Thu, 13 Aug 2026 18:41:20 +0000
Message-ID: <IA1PR11MB64184F357CBDECCBFF56AD08C1DB2@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-21-michael.j.ruhl@intel.com>
 <20260812195421.15EE31F000E9@smtp.kernel.org>
In-Reply-To: <20260812195421.15EE31F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH7PR11MB7025:EE_
x-ms-office365-filtering-correlation-id: c8522ff9-ea22-404e-96de-08def96a77d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|38070700021|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
x-microsoft-antispam-message-info: 1dgH8xpMQRqAm/7c9sTqG18bXORJUCyLe8eTOqySfrUYLf2k0Yk56EzVJRJ59vIU8kmbN5ymalw5TPsCf0iEdCrjDMf3tnW/+XCx2xJkxuFXcuTqtXkoV24UXll7UF+FqPzMuWFY5rG1QJCOZH/IfK0bkZWE6wTYepc8GgaGEu4yIVXUUrsHmMa319QVOMK0nKw2UwZgtTDAxEOJkpuJKcfD1MCf0rfndJ5s5iaeqRYsWBiXp347BFEFcahNa5yZRNO90CRcP0LUFirA4LVZJJy48erfw8KQB+OQWDagl7R6NmkMhQ22nlcynESplQaZQSlNkTQpdrNVTEBJVckGQFznFaSr7UMBlU3oo1YDtncVTvRi63uGCHqDm+5zH4vgNTOZKdddiof+v05ONbuTTjFvcpNuZt9qFMEf3yKjxG5TIqqav8gyKMlDYhAonhgVyATdWEWixsCD2ZigAzXeeJ5a/bmkWkxO2roeFfTGW0yqriaoa3dDo+BO2E3oUYJwZivQOXxQC8jZvUj1h1gMCczdeoS9OJ+lwv6ZVvxrwZat4VpxBbS9bU0dTAUD1SYGA6Yb1A4Vn5lkqF4jpEA+s6wFQfqqmdqv3RQZ4YHqU1d27sdHXWCYedWmdhKabvxWTCa+8DyB+ncZo+tD8VxWL+BNWaw5g+/hxAB22xi5t1M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aG9UWmV1Z0Nmdi9JSzFWU0tJUmxVdDYyanBDTGxlcG5ReXRjNWlnZG01aGYy?=
 =?utf-8?B?b1dBai9KRXNVOUczbUl5RlBCYVovZUNEc0ZkOFBxK2JITHliVGZPUVpjMUZ5?=
 =?utf-8?B?RXkxSHhQZUpNNVpuejY5NGcwdFVWb3RmVS9EWWFSVm9NUE9mTHVUTSs2Q1hU?=
 =?utf-8?B?N0JJdWlobTV0NlZDY20vcFFnazlvYjMwUTQxOVIrb3QwSExkeitKSklzMnVU?=
 =?utf-8?B?UCtlMTBxWWlvQUR2NlNYcVMwOTU0VC9iMXRFaUdhNFM3ZERxdUtiTkY0dS9q?=
 =?utf-8?B?cTVsUy83TVFiRTIreUtZT1hnMndQaEI4M1RFUVV3akx6SVdwZ3V6YXFpYUFQ?=
 =?utf-8?B?d3JSYkllRVVUdjJVNis5MmZRZENrRUNWZlpIWnVEM3RBYjFBUi8rZTRDdWpp?=
 =?utf-8?B?MXFKSG5BYWdWWEMzZTF1Q1VlclpVRE52dVVJcnlhS3VnZlNlNDl5RWRmTWps?=
 =?utf-8?B?MVRIUVhSMU9KdkRjQ2lPZlFnODZaWHM1T0xidERDQVhwUk1WQlNUZ2NjZ2gv?=
 =?utf-8?B?RUlPTGl6MUQ4SzFxVTRKT2NIWGZ2WG9GQlRFQWR5cTFvcHBNSUdUbUd0aEdw?=
 =?utf-8?B?ZTdwUjZ5YVg1Yi9YSGdrQzQwL3pmRi9xeTYxNjlNRllpNXMzQzYrNHNacXE3?=
 =?utf-8?B?TmcxQ0FUQ3dnRVRHeGdGZXZGT0wrRVNVNC9LOE1YMmFwQ3lDQ2pPZ0lNME8w?=
 =?utf-8?B?djRLa25Qd05Xbk0reDFRaHlQNVF1cC9nNjVpUjNVOWI3ZTVrN2txR1U2NUs1?=
 =?utf-8?B?bmU0YlFPdVZUcUx3a3BCMDgzVmRiYm00dFgzNlFNUi95Y1dRcmk2RmJ5SXFC?=
 =?utf-8?B?ZWpya1RIeWF6U2w2UzhiMWg1UXRqMXUrVThFWHlCYURHVG1KU2dNb0pjejVt?=
 =?utf-8?B?c25aTjZ6OUw2S0pkaVlEbU5wQi8xckJ1WU1QWXQ0UExPQUdhdXAyU2NMamhO?=
 =?utf-8?B?VFU1ZGV2YStkbHVoQkVhS0liLzl2WmRqZGt4cGR4bTdHcStyQWhQNDFoeVdL?=
 =?utf-8?B?R09ZQnVBN2JUbHlBdWMvcXI1U2dFSlE5b2dvRnR6M3BxRkFRbFNwZHBiakFL?=
 =?utf-8?B?TVAxT2FsZ3A1dTN1L1Q1MXJBV2RKVllDRjZRdEp2enFaV0FoNHI3QUdpa2M2?=
 =?utf-8?B?T25tc2pYYVhWNXlEVGw2amZZd2ttS2h3NHhNNWlMS3ZoMVQxcGpONHMyanZZ?=
 =?utf-8?B?elE3V2Y1SGswQkxWbkRaSUNmdmJMam0vR2J6OEZQUncvVVZqZ0ljbGZFSW1X?=
 =?utf-8?B?KzNFMldSaFJRY3NOR2hSamNUaW1FM0FCSEpPUnZhb2ZhOXZDcVZObjlPLzNr?=
 =?utf-8?B?NlB1VTlYdnJ6QVd0dkVFU3ZBYXNnWDZkVE4vbGpMQkhTZFN6d2tTYkRJTHBC?=
 =?utf-8?B?K0syenM0SytqNnRiOG42djdnY09mQ21FL3A1dFoxMTM1TzFramxHemxFTGNo?=
 =?utf-8?B?SmhjNVYzeVo3MlVBOE56RnZXb1k3NDQxMU81aXhUNzdKSndhY0VkVzMwK2xN?=
 =?utf-8?B?QWpTOXZhVmk3RG5vYlEwR0krYnhIRXo1b3FwY1JqRFpqQmo1UXhJTHF0QTh5?=
 =?utf-8?B?Y0FIbGIxbHFBYmE0QnNGdGdra3gwMUIzWG1TWlNhUXkrcEloNzNuM08zVnBz?=
 =?utf-8?B?cEUrbGYwL2RsT2cxcWFDM3RycUYrdjc1dnFJdlFQcys4V2UxUzBTOHhYSXBV?=
 =?utf-8?B?MjZSamREWUJyYWtvcTJnOTNCUU9wY1REZDU0c1Q0KytXcDZJcVFBK0g2N1NL?=
 =?utf-8?B?a2hBT2lXR1JydFY5WjBkeHE1ME1NOEQrRzdYNS96WWFDNlNXd0FEdmRYekxI?=
 =?utf-8?B?Tkw0and5bXNidU9kMitZY005WUtzVUhkRTJrcTRoNGZVbkVqY09ncWRldVFR?=
 =?utf-8?B?ckdhYTViY0puMkpEZkhLc2pLYUJMM1NZeVdCaVVZRzF0ZmxDcjZzekt3TENp?=
 =?utf-8?B?Q0RrRzFnaG5scG9TbWFYS3JuWURDaEh4R3dCcWFxWlVWTVF2UllFSTFuanZZ?=
 =?utf-8?B?ck5NdUtzbS9wUHM1TkorU1p5bVFWNzlFZzNscTc4cVFEU0Zyc1JwbHVNYXBv?=
 =?utf-8?B?bFc3U25BYWFaNkE3VVBSWjRnTy9NMjhmZFhhUUdSV0VZaG45TE83OHRrakJE?=
 =?utf-8?B?aDN5cnhaYlhsVDVNdmx1aU5BbFlsamREcUp1T2lYbUZ6ak12L0M4c04yWjFx?=
 =?utf-8?B?TXhpL0JjdWpPaytLN2ZJbk5oQkc2cUljcGNEc3JlSDlxUXlrSGpORnFYOEtD?=
 =?utf-8?B?cGpLRjFmaFJjMXZ5bXhpeFhWdWI3NGhESkF3bmZsQlBPL3FoeGpxaUhvVjFE?=
 =?utf-8?B?S1ZhRWwyTmd1M041ZzhRbXBTamVtYkYwdWlTNy93emFHZmlPblIyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Uu1aPmQ7SVtOgFjxB+/xRMyvHw6W6bwopENm/SmL8XO3iwICGWlLT3crEOOWBw2i3sZ1BBUZfoIH8+JjzahxFnSygOEs55t85j73O2e3lczbOxDfW1CkNMq8McTG3Z5p4l0dSl5/oUYslcKPdoGzTvqWrbuZWdI08BabbODkKCTGxfEw3w9+UiGLPFlwRchGbhXdzPy7UyxFDKs/VVqJYwm0So5taVqqmlAgBD1R8aOcl3/RaMLFwW3Va/pV8I25ln1CYOkm839V/zbGNRBMEMUdI1wyYNGp0bmpew4FkbzDlcvw3dWJMilZvOvyjjGqgrN5B8zZ8NVavoFrudrVKA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8522ff9-ea22-404e-96de-08def96a77d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 18:41:20.4881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hlT6/tLmCJYK0f4LDNb0Q8zi0KPtMlWx7u99bZiyyhCd5zTBYxnjazL3TeY0Ne4e+07tw95yHjpROOaplbFOGzi0Vt0KOXPj44VMmYCpnDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7025
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxMiwg
MjAyNiAzOjU0IFBNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPg0KPkNjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJqZWN0OiBSZTog
W1BBVENIIHYyIDA5LzEwXSBkcm0veGUvdnNlYzogU3VwcG9ydCBsYXRlIGJpbmQgZncgaW5mb3Jt
YXRpb24NCj4NCj5UaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCA0IHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPmNvbnNpZGVyOg0KPi0gW0hpZ2hd
IERvdWJsZSBgeGVfcG1fcnVudGltZV9wdXQoeGUpYCBpbiB0aGUgc3VjY2VzcyBwYXRoIG9mDQo+
YHhlX3BtdF93cml0ZV9yZWdgLg0KPi0gW0hpZ2hdIFRoZSBsYXRlIGJpbmQgZGVsYXllZCB3b3Jr
IGlzIGNhbmNlbGxlZCB2aWEgYSBgZGV2bWAgYWN0aW9uLCBjYXVzaW5nIGENCj5yYWNlIGR1cmlu
ZyB0ZWFyZG93biB0aGF0IHJlZ2lzdGVycyBjaGlsZCBkZXZpY2VzIG9uIGEgZGVsZXRlZCBwYXJl
bnQuDQo+LSBbTWVkaXVtXSBVc2luZyBhc3luY2hyb25vdXMgYHhlX3BtX3J1bnRpbWVfcHV0KClg
IGR1cmluZyBkZXZpY2UNCj50ZWFyZG93biBjYW4gbGVhdmUgaGFyZHdhcmUgYWN0aXZlIGluZGVm
aW5pdGVseS4NCj4tIFtNZWRpdW1dIGB3YWl0X2Zvcl9md2AgcGxhY2VzIHRoZSBjYWxsaW5nIHBy
b2Nlc3MgaW4gdW5pbnRlcnJ1cHRpYmxlIHNsZWVwIChgRGANCj5zdGF0ZSkgZm9yIHVwIHRvIDIw
IHNlY29uZHMuDQo+LS0NCj4NCj4tLS0gUGF0Y2ggWzldOiBbUEFUQ0ggdjIgMDkvMTBdIGRybS94
ZS92c2VjOiBTdXBwb3J0IGxhdGUgYmluZCBmdyBpbmZvcm1hdGlvbg0KPi0tLQ0KPmNvbW1pdCA1
OTAxYmU5OGY4M2Q5YzA3ZTEzODVhMzcyYzdlMzMwYzQwNWMwMTg4DQo+QXV0aG9yOiBNaWNoYWVs
IEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj4NCj5kcm0veGUvdnNlYzogU3Vw
cG9ydCBsYXRlIGJpbmQgZncgaW5mb3JtYXRpb24NCj4NCj5DUkkgRlcgaXMgbG9hZGVkIG9uIHBv
d2VyIG9uLiAgQmVjYXVzZSBvZiB0aGlzLCBhY2Nlc3MgdG8NCj50aGUgRlcgY2Fubm90IGJlIGRv
bmUgdW50aWwgaXQgaXMgcnVubmluZy4NCj4NCj5VcGRhdGUgdGhlIFhFIFBNVCBwcm9iZSBhbmQg
YWNjZXNzIHRvIGNoZWNrIGZvciBsYXRlIGJpbmQNCj5kZXZpY2VzLCB2ZXJpZnksIGFuZCB3YWl0
IGZvciB0aGUgYXBwcm9wcmlhdGUgRlcgc3RhdGUNCj5iZWZvcmUgcHJvYmUgb3IgYWNjZXNzLg0K
Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNl
Yy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+WyAuLi4gXQ0KPj4g
K3N0YXRpYyBib29sIHdhaXRfZm9yX2Z3KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPj4gK3sNCj4+
ICsJaW50IHJldHJpZXMgPSBWU0VDX0xBVEVfQklORF9SRVRSWTsgIC8qIHdhaXQgdXAgdG8gMjAg
c2VjcyAqLw0KPj4gKw0KPj4gKwlpZiAoeGUtPmluZm8ucGxhdGZvcm0gIT0gWEVfQ1JFU0NFTlRJ
U0xBTkQpDQo+PiArCQlyZXR1cm4gdHJ1ZTsNCj4+ICsNCj4+ICsJd2hpbGUgKHJldHJpZXMtLSkg
ew0KPj4gKwkJaWYgKHhlX2lzX29vYm1zbV9md19yZWFkeSh4ZSkpDQo+PiArCQkJcmV0dXJuIHRy
dWU7DQo+PiArDQo+PiArCQltc2xlZXAoVlNFQ19MQVRFX0JJTkRfREVMQVlfTVNFQyk7DQo+DQo+
W1NldmVyaXR5OiBNZWRpdW1dDQo+RG9lcyB0aGlzIG1zbGVlcCgpIHBsYWNlIHRoZSBjYWxsaW5n
IHByb2Nlc3MgaW4gYW4gdW5pbnRlcnJ1cHRpYmxlIHNsZWVwDQo+Zm9yIHVwIHRvIDIwIHNlY29u
ZHM/DQoNClllcy4gIFRoZXJlIGlzIG5vIHdheSB0byBwcm92aWRlIGEgbm9uLWJsb2NraW5nIHBh
dGggIHRvIHRoaXMgZGF0YSwgYW5kIHRoZSBwb3RlbnRpYWwNCnRpbWUgaXMgbmVjZXNzYXJ5IHRv
IHZlcmlmeSB0aGF0IHRoZSBGVyBpcyBub3QgZ29pbmcgdG8gYmUgbG9hZGVkIHN1Y2Nlc3NmdWxs
eS4NCg0KPklmIHRoZSBmaXJtd2FyZSBpcyB1bnJlc3BvbnNpdmUsIHVzZXJzcGFjZSBwcm9jZXNz
ZXMgcmVhZGluZyBvciB3cml0aW5nIHRoZQ0KPlBNVCBzeXNmcyBpbnRlcmZhY2UgbWlnaHQgYmVj
b21lIHVua2lsbGFibGUgYW5kIGhhbmcgd2hpbGUgY2FsbGluZw0KPnhlX3BtdF90ZWxlbV9yZWFk
KCksIHhlX3BtdF9yZWFkX3JlZygpLCBvciB4ZV9wbXRfd3JpdGVfcmVnKCkuDQoNCkFncmVlZC4g
IE5vdCBzdXJlIGhvdyB0byBwcm92aWRlIGEgYmV0dGVyIGFuc3dlci4NCg0KPlsgLi4uIF0NCj4+
IEBAIC00MTYsNiArNDg4LDEwIEBAIHN0YXRpYyBpbnQgeGVfcG10X3dyaXRlX3JlZyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHUzMg0KPmd1aWQsIHUzMiByZWcsIHUzMiBvZmZzZXQpDQo+PiAgCWRpc2Nf
YWRkciArPSBDUklfRElTQ09WRVJZX09GRlNFVCArIGluc3QgKyBvZmZzZXQ7DQo+Pg0KPj4gIAl4
ZV9wbV9ydW50aW1lX2dldCh4ZSk7DQo+PiArCWlmICghd2FpdF9mb3JfZncoeGUpKSB7DQo+PiAr
CQlyZXQgPSAtRU5PREFUQTsNCj4+ICsJCWdvdG8gcnVudGltZV9leGl0Ow0KPj4gKwl9DQo+PiAg
CW11dGV4X2xvY2soJnhlLT5wbXQubG9jayk7DQo+Pg0KPj4gIAl4ZS0+c29jX3JlbWFwcGVyLnNl
dF90ZWxlbV9yZWdpb24oeGUsIENSSV9JRFhfVEVMRU1fRElTQ09WRVJZKTsNCj4+IEBAIC00MjUs
NiArNTAxLDkgQEAgc3RhdGljIGludCB4ZV9wbXRfd3JpdGVfcmVnKHN0cnVjdCBkZXZpY2UgKmRl
diwgdTMyDQo+Z3VpZCwgdTMyIHJlZywgdTMyIG9mZnNldCkNCj4+ICAJbXV0ZXhfdW5sb2NrKCZ4
ZS0+cG10LmxvY2spOw0KPj4gIAl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+Pg0KPj4gK3J1bnRp
bWVfZXhpdDoNCj4+ICsJeGVfcG1fcnVudGltZV9wdXQoeGUpOw0KPj4gKw0KPj4gIGRldl9leGl0
Og0KPj4gIAlkcm1fZGV2X2V4aXQoaWR4KTsNCj4NCj5bU2V2ZXJpdHk6IEhpZ2hdDQo+V2lsbCB0
aGUgc3VjY2VzcyBwYXRoIGZhbGwgdGhyb3VnaCBoZXJlIGFuZCBleGVjdXRlIHRoZSBuZXdseSBh
ZGRlZA0KPnJ1bnRpbWVfZXhpdCBjbGVhbnVwIHBhdGg/DQo+DQo+SXQgYXBwZWFycyB0aGF0IGlm
IHdhaXRfZm9yX2Z3KCkgc3VjY2VlZHMsIHRoZSBmdW5jdGlvbiBjYWxscw0KPnhlX3BtX3J1bnRp
bWVfcHV0KCkgb25jZSByaWdodCBhZnRlciBtdXRleF91bmxvY2soKSwgYW5kIHRoZW4gaW1tZWRp
YXRlbHkNCj5mYWxscyB0aHJvdWdoIHRvIHRoZSBydW50aW1lX2V4aXQgbGFiZWwsIHJlc3VsdGlu
ZyBpbiB0d28gc2VxdWVudGlhbA0KPnhlX3BtX3J1bnRpbWVfcHV0KCkgY2FsbHMuDQo+DQo+VGhp
cyBjb3VsZCBkcm9wIHRoZSBQTSB1c2FnZSBjb3VudGVyIGJlbG93IGl0cyBiYXNlbGluZSwgcG90
ZW50aWFsbHkNCj5wb3dlcmluZyBvZmYgdGhlIGRldmljZSBwcmVtYXR1cmVseSB3aGlsZSBpdCBp
cyBzdGlsbCBpbiB1c2UuDQoNCkFncmVlZCB0aGlzIGlzIGEgYnVnLiBhbmQgaXMgZml4ZWQuDQoN
Cj5bIC4uLiBdDQo+PiArc3RhdGljIHZvaWQgdnNlY19kaXNhYmxlX2xhdGVfYmluZF93b3JrKHZv
aWQgKmFyZykNCj4+ICt7DQo+PiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gYXJnOw0KPj4gKw0K
Pj4gKwkvKg0KPj4gKwkgKiBJZiB3YXMgd29yayB3YXMgY2FuY2VsbGVkIHdoaWxlIGl0IHdhcyBz
dGlsbCBwZW5kaW5nLCB3ZSBuZWVkIHRvDQo+PiArCSAqIHRha2UgY2FyZSBvZiByZWxlYXNpbmcg
dGhlIHJ1bnRpbWUgcmVmZXJlbmNlDQo+PiArCSAqLw0KPj4gKwlpZiAoZGlzYWJsZV9kZWxheWVk
X3dvcmtfc3luYygmeGUtPnBtdC53b3JrKSkNCj4+ICsJCXhlX3BtX3J1bnRpbWVfcHV0KHhlKTsN
Cj4NCj5bU2V2ZXJpdHk6IE1lZGl1bV0NCj5TaG91bGQgdGhpcyB1c2UgYSBzeW5jaHJvbm91cyBw
dXQgaW5zdGVhZCBvZiBhbiBhc3luY2hyb25vdXMgb25lPw0KPg0KPlVzaW5nIGFuIGFzeW5jaHJv
bm91cyB4ZV9wbV9ydW50aW1lX3B1dCgpIGR1cmluZyBkZXZpY2UgdGVhcmRvd24gY2FuDQo+bGVh
dmUNCg0KV2hhdCBpcyB0aGUgc3luY2hyb25vdXMgdmVyc2lvbiBvZiB0aGlzIGNhbGw/ICBUaGlz
IGlzIHRoZSBvbmx5IHJ1bnRpbWVfcHV0IGNhbGwgaW4gdGhlIEFQSS4NCg0KPnRoZSBoYXJkd2Fy
ZSBhY3RpdmUgaW5kZWZpbml0ZWx5LiBUaGUgcGVuZGluZyBhc3luYyBpZGxlL3N1c3BlbmQgd29y
ayBjYW4NCj5iZSBjYW5jZWxsZWQgYnkgcG1fcnVudGltZV9kaXNhYmxlKCkgZHVyaW5nIHRoZSBk
ZXZpY2UgcmVtb3ZhbCBwYXRoLg0KDQpUaGlzIGlzIGNhbGxlZCBpbiB0aGUgZGV2aWNlIHJlbW92
ZSBwYXRoLCBzbyB0aGUgcG93ZXIgc3RhdGVzIHNob3VsZCBiZSBjb3JyZWN0Lg0KDQo+W1NldmVy
aXR5OiBIaWdoXQ0KPkNhbiB0aGlzIGRldm0gYWN0aW9uIHJhY2Ugd2l0aCBjcmlfbGF0ZV9iaW5k
X3Byb2JlX3dvcmsoKSBkdXJpbmcgdGVhcmRvd24/DQo+DQo+SWYgdGhlIGRldmljZSBpcyB1bmJv
dW5kIGR1cmluZyB0aGUgMjAtc2Vjb25kIGZpcm13YXJlIGluaXRpYWxpemF0aW9uDQo+d2luZG93
LCB0aGUgZHJpdmVyIGNvcmUgcmVtb3ZlcyBhbGwgY2hpbGRyZW4gdmlhIGRldmljZV9kZWwoKSBi
ZWZvcmUNCj5zdGFydGluZyBkZXZyZXMgcmVsZWFzZS4gVGhlIGRpc2FibGVfZGVsYXllZF93b3Jr
X3N5bmMoKSBoZXJlIGJsb2NrcyB1bnRpbA0KPnRoZSB3b3JrIGNvbXBsZXRlcy4NCj4NCj5Db25j
dXJyZW50bHksIGlmIGNyaV9sYXRlX2JpbmRfcHJvYmVfd29yaygpIGV4ZWN1dGVzOg0KDQpJZiB0
aGUgZGlzYWJsZSBzdWNjZWVkcyB0aGUgd29yayB3aWxsIGV4ZWN1dGUuDQoNCklmIGl0IGZhaWxz
LCB0aGUgd29yayB3aWxsIGRvIHRoZSBydW50aW1lX3B1dC4NCg0KSSBkb24ndCBzZWUgdGhlIHJh
Y2UgY29uZGl0aW9uLg0KDQo+c3RhdGljIHZvaWQgY3JpX2xhdGVfYmluZF9wcm9iZV93b3JrKHN0
cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj57DQo+CS4uLg0KPglpZiAoeGVfaXNfb29ibXNtX2Z3
X3JlYWR5KHhlKSkgew0KPgkJY3JpX2xhdGVfYmluZF9wcm9iZSh4ZSk7DQo+CQkuLi4NCj4NCj5J
dCBjb3VsZCBwcm9jZWVkIHRvIGNhbGwgaW50ZWxfdnNlY19yZWdpc3RlcigpLg0KPg0KPldvdWxk
IHRoaXMgcmVnaXN0ZXIgYSBjaGlsZCBkZXZpY2Ugb24gYSBwYXJlbnQgdGhhdCBoYXMgYWxyZWFk
eSBiZWVuDQo+ZGVsZXRlZCwgY2F1c2luZyBkZXZyZXMgbGlzdCBjb3JydXB0aW9uIG9yIGEgc3lz
ZnMgdXNlLWFmdGVyLWZyZWU/DQo+DQo+DQo+LS0NCj5TYXNoaWtvIEFJIHJldmlldyDCtw0KPmh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgxMjE5Mzc0Mi4yMTcwMTg4LTEyLQ0K
Pm1pY2hhZWwuai5ydWhsQGludGVsLmNvbT9wYXJ0PTkNCg==
