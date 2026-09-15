Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C77217723
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 06:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452584; cv=fail; b=R6/HDdJeLYojPbt3BMzPFCfiNr4Llw8HQKaj6SqKYfoS8nxJVPtSbW93fR2VCDA5rqrxkdqIBxArp8rFvFkqNmASkeIxJWWJcjrnK0GtwOGcRAjpxJVByljyXwZbCM4Bp+1yTZgPfFWkt7vY/pgC9T1Q1K9e2MeUI4m34NPu48U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452584; c=relaxed/simple;
	bh=J4uqgbDgOcC1ezrMPGcqJ4lKupPmr9zQFAALmNZee+g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PPgjlvGz0yA2tNwHqhG2cG15ZLj5OmxSZ4NAxHHcfmZrqsFV9I6u7bvNJbguUy10b06Cl6iQ5iJ/iaCoR7jJfvDqXoH5HN6KOdNA/HzktRzbVpOUDDA1y7im8/L0h1BecV9MnPlc9DVasDxxP9IQ1PxQTc0c8Rao+1GAFQlJrEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLj1yA8w; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLj1yA8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789452582; x=1820988582;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J4uqgbDgOcC1ezrMPGcqJ4lKupPmr9zQFAALmNZee+g=;
  b=JLj1yA8w/tPvvcDx3XDKcwiYWR9xSyLv9trm670oZU+VKvLIPzAEPC+o
   t8aPPgzd7pATvy/9lDSHfXnJ1WmJ7UDbFw/2BFNcwOqVN5+/7MK/3q085
   4En9L1hz7IIHfFQ3hJSgyu3PAYdvyBjyP96rcLTON96P0K6XNUQfNROPQ
   1rx+KbVRvaRvsuHJHZrHkoBMPmsSH0ZPHAbNK4eDgdy6ZLrPy+SUmkqQ6
   Rk8jZjKOT81BMxuXZdxfIKcpFFTGRnybtRbgZg4pyv5vLu/ykxG/mK5WH
   aWeeHaziIvYuRJBlpQQqBT3FOJLBg84v7zQ0ODCi1FVNpzcMErvp2NePz
   Q==;
X-CSE-ConnectionGUID: srD3UWiaS36ijvGIIzJQPg==
X-CSE-MsgGUID: fC9QbcJ3Q/G00EiTEgiTnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77367644"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77367644"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 23:09:29 -0700
X-CSE-ConnectionGUID: ZRO1M3GxQuelojrEIWUuXA==
X-CSE-MsgGUID: 4Jl/0kyKQMOrINqFHNF/1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271442767"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 23:09:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 23:09:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 23:09:28 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 23:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1jQBmYLu8pEkCi7KITnd+YtrBclV6T80fdTvov0MiElpRpsfxZx8TqtkGoamv68caoD6V2YkiRhBd9S4Klac73hqFeo4eN6FEBcA1K3aDPJzWOdoKM9pj2F/42FZExXSOhDDXmK6JZYXHriYuI/xgUtSbYkLPONqb3oXtWE0km4UD1IZ5JHM7CY3b7jcI0dKHh7rJVosrYUnk0xzh2RlU51kQis142OpHn7Mndj1WXOW0SpzQ0IoE8O0ZqQ1c+dN81yiIImMg0aZBY2xU9LnYm6nm9bHY9kFywaVT5CR9cyGiEko8cdMBVlmZnEdNL3cZNpDEdCSs1fJNVjIuv8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4uqgbDgOcC1ezrMPGcqJ4lKupPmr9zQFAALmNZee+g=;
 b=RA4PlOSePCbRVg3lkn5SJXXA6YFXTWG8wSPmmJCk0Gqphk7OKgVIeLV13jvOyOs9pVkyLxIMGIvv0+LKDaijFwXED8K/2wDD27VHDi2qh+/zvqSykxeY0rtso5gz5oAtu4eDne4SIB3nkXV+i8A4/QYj/ERb3Tef3E4TchK8hSLyTxGGZN8zmMG/clOX3Pa+/Zsq9R0sgPa/I0XKw52kKpVU94SAp9tdhahuSag3duq21GaSEVz4qOHqa7iGoqhLQ0Z+s92NvltHcInvG5oQCgEzCUqBBZzmZ6Vy7jMZoSi/0eVj/C/TL6zqiuBEg60V+9sWlzyfH1bDXfSRlSw5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CY5PR11MB6187.namprd11.prod.outlook.com
 (2603:10b6:930:25::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 06:09:24 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 06:09:24 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 07/10] drm/i915/display: Add bits for Wa_14021768792 for
 linkm/n ratio > 10
Thread-Topic: [PATCH 07/10] drm/i915/display: Add bits for Wa_14021768792 for
 linkm/n ratio > 10
Thread-Index: AQHdQaQuGIbPfpAdXkWXBFwZIYAeq7bIyOMAgAZkYqA=
Date: Tue, 15 Sep 2026 06:09:24 +0000
Message-ID: <DS4PPFE901A304FC76D615C9D6FE87C53CEE3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
 <20260911041449.3699400-8-suraj.kandpal@intel.com>
 <20260911042908.78CB21F000FF@smtp.kernel.org>
In-Reply-To: <20260911042908.78CB21F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CY5PR11MB6187:EE_
x-ms-office365-filtering-correlation-id: 0b91d40b-1ca2-4645-7e8a-08df12efe45f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|5023799004|4143699003|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 1P9Li5ygBuO6rM3xj4hLM4OyHBDuuby9r+AR9iEi2GDV2D8awrEkkTBUsjxtSB25akdopKmv9HKeYZyPOQ+xp4ylj4/hEWtYAuWflttgrS1l/zF8wye/Dn9FFbO8/SGW6VpjiHIw3+bgMESLs5IE/GPKLUHdouPziV7DhrPDNG7tSHjFreVpUugtqZW67xYfVQFPz2WN07hb+ROdVluPOiQRaQCIkuGEyGNitYTooqkdIe8Fuuz9vkjQFCMBFKRIDnIBQjoVoNrLNLTwfaVOxu3O1aaElmugTulLNapfEpEhpLrrYKyTHJRYw0dt+jHZlayePFhEsYEVaE5g5CrGHPoC9LBH636yJikWQFfArtFM0ApeWQ0v1Og/fjSUNqLPmhpfMHwm5YxksEcfj0gyFWk6AlkY2tPxMW6EAm1wIRuUYnjxs1huQ3xv/gSlwFnjgb+Q/YIwaJEPUu8z3aunMCEs/6F3Tfb4E6Xj98DyvEFLNqbDLg/4+r1YIGCVJApCy/rF53E1swtwpwVxcGDhL2bzztayLTQqq1wn2N6AkbeftNUMGSDiBvkI3McXNQrrqhxU218PNFK29WPxD0A7Y9dPbJtOMblFTYmCpGwY4oqOwop8nCjx+r14i23g9K/jqzUxKDFKPaVXPfwQKQug79j9JgCb3eUosFz9VzxIv5U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFE901A304F.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHViQmtUSCtHUyswK3hlaUVqZUtLSTJLNWVpTk5XTmNFZ3UwcFhXdElFYnNH?=
 =?utf-8?B?cWFvVitsWEFZdTk4ZE5uRzV1SHpyNVVEQnV4a3JlN0dsb1pHMUNWaFZvQWdQ?=
 =?utf-8?B?QkdxSVNsT09ZN0s1UXozcGFoM0RPNU40UUZ5SHdCbUlINlpidnppeS9tQjdr?=
 =?utf-8?B?eTF5UEFBUzVaR1NRNkVFT2hxMXNJRXZqUGZ1TGEzZnB3MXRZb3R0VFZHK2lo?=
 =?utf-8?B?MXJ2OVhWSFhKVVFwejYvczNWd0l0dzRFMGV6RXMzNVhyOXh4bUFENEM4enlr?=
 =?utf-8?B?ZzVHSHl1RmZ1N21sV1d3c1FONGhiVk1kQnZ3T1lxM3prZkhudGdzVEJtT0dB?=
 =?utf-8?B?RmRMSTdhVEtvdktxcDkyMmxoNWxtSmdzVlIzek04R1kzaEpmQUorMUJ1dVd0?=
 =?utf-8?B?c0lWVUM4LzZraTlnYUNvaEZ0QytHc0ZSOGVLWUNnbGwyd2JVWUFGK2tvdXBB?=
 =?utf-8?B?R2NKU2pya0YrcVA4RmJMdlBlMVQzZ1RtMTBZQTVzcEp2aTg2cWNZTWRaenZy?=
 =?utf-8?B?K241bW92MnNLZm5RZDA2dFNJSWFIcHRjVEFmR2dOZjNlT1hBMElaeWhKUnZB?=
 =?utf-8?B?UGppbE5pc09rS3dsOWppWmJQTnR6SmcvSUFUcXV6QU9qMmtBcXZpazhYNklh?=
 =?utf-8?B?OUpMclZNcjNpRHljTi9JK3hBQWN5TDZ3V3RUYm14SWowVmZkYWNEaG44N3JJ?=
 =?utf-8?B?UWR6MEZBMklMY0x2cU5jZi9rQWxhbmdsc1ZuOGRZY2lsb2NlQzJvMWNjdE4r?=
 =?utf-8?B?T1FmbkhTbGswR05tZHBpQ3BCYW9FbXlzSk1ieXBpa3k4VCtlNFVlSS9EUWxO?=
 =?utf-8?B?VnJ0Y1VxK0Y1REdKc2xmTWZIRDRHTCtFcXQxNi93c1ZITDhweE05NjdTNGR0?=
 =?utf-8?B?cXhJcitQVWpseWgvRnplcG4zWGNvYTRWTG5xdlQzdEl3dHY3UmtjUm9TN0Yy?=
 =?utf-8?B?SVcwWGRhZ2U5WnBUWWY3UERQTTRObFovVjFFcll3ZkhXNWtnSmZGMm5hNkVl?=
 =?utf-8?B?VlkxTnlzWm94RDFoK0l5eGNJSjJibnpVak1CSzU5dUVnZGs2Zk02TVQ3SFo1?=
 =?utf-8?B?eXNacjZXK0FsMkQ5cFRDVHJpSSt1cSs5anpWQjhxZlZyTVo0VUNPNk9UK1cv?=
 =?utf-8?B?UEtuSm5HOVpvYzlnMW1vdUhMcCs4N2RLS283Q1BOVkcvTU1uN1MyMVFXa0NT?=
 =?utf-8?B?Q1lUb1ZjYmhhbDZWZ0c5d2NOdUprOEIyLyt2VzV1dWZkNjVqU0IydzFXNDZo?=
 =?utf-8?B?WTE4QkVhOE5Taks0K1RpRnJ3RFh6T0oyckRtS09MK241OGJlN0RCa05KWk5x?=
 =?utf-8?B?bDZqaGxCTFZRSnNBK3cyekt6NTV6SlFUemYwSnNSUVJQYnlveHVCZndvZnlu?=
 =?utf-8?B?cVBCNHJDODJ6VWV2N3h6UUxXanJKeXhxQkZteTVjenU2TVNhZVlyTHMvOCtu?=
 =?utf-8?B?OVd6bE9hOGR1N3lSZVJtdE5mTk1STWkvTWo5Yjgvejdib0wzQmtpK1l4dldZ?=
 =?utf-8?B?TGx0Y3RWcDlDY3FSR1JNU0lyalBEdGNSR2k0OW5YWU1HTzAwRjBsTk9GN2Fy?=
 =?utf-8?B?R0E0YUVXUS9qbGhieVFHV3NuSHFEZ1l6L2x3KzFwQW9BbTBrOGo5Ni93Y2tS?=
 =?utf-8?B?UzJNYlhKVFlsU1greUpLWkU1NzhzMThJem1NOUp3ZU1yR0RrcWNhQ3BvbWlU?=
 =?utf-8?B?MFM4MkV3TVJ6eS92OVJsNzBhWkdwWk43dEo5ck1VZXRuVUErMmJCaVFBcGt4?=
 =?utf-8?B?VGx4TzdoQVpZYVNPUFM2bXJQZjl0WDZIYWlJLy9DeGIvdkt3MTZkVU5ocVJk?=
 =?utf-8?B?b09QQlhoYUlVU1BkeWFhK0FrL3lxOVdyaVZCYUQzL2F1U1RwL09LbTZvQVYr?=
 =?utf-8?B?eFZzNVVJUW4vaE5kcXN2Q1Qzb1BiN3ZBdWVxa0hNSDJ5RU5zQjNsTFN6Rmpl?=
 =?utf-8?B?c1ZxeHB6amUrUFM4aEFVVURkS1pVdytzU1Jkb0RIMnNObFo0blV2NmFxZjBZ?=
 =?utf-8?B?RlZ3TDM4QmtUZHZSSjNveFFHWDN5bW5jeC9YQmZPdllFSThZTHlSWVRWRyti?=
 =?utf-8?B?RkZQcVVKNkdjRnJwTFExVE5jRDVVRTBGaGNieGlWaGZqY0FmTDhUUTA1VXBB?=
 =?utf-8?B?OTNMbUd1NjBpbXE0REJwTHQraE41SUJwZzZsd2xpbGNyb2xaeko5Y21tQVJF?=
 =?utf-8?B?UHAvVHZzMTVUQmNWeGJmZXltZXZLSU1ONE4ra3lHQlczcmJXMDBZRHN2QmRK?=
 =?utf-8?B?MGRURjdIdHRhY09PZGNJR0NRVzN2YkNaaDNTTGRJZTlCQ2xPdEIrSDNobFdH?=
 =?utf-8?B?dS9tOGJVUklmQlB4NkRhMnJWaFAwN09SRW5FaUVKRkdaU1ZzU0hyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: l76DoFc6SGidMbkXr67tI71x5DlacotH2QEV8qbHGhrbLdGXpnIlAYuddQNY5b1+WkXIwYziOBfxSe6gVffJVhHDpNL0CtM4PJZsG/PTRdsI6J2ypxlVpem7Rj29f3Mr19jG5Y1vXuMtajr+JKouIDi5/kZAhDPAT+pKMbCGCZRgmHuzPeU20waIlPAZ1e1RAJBrLXgC8ljCidLWJxBhWZHEBrYQzStYHco0MEEdc4N2+QhfAOf7LTIDe+n4VXbM/Vw7NutIvsz91lA7D0OilAaIpTQ2jHKMLYCbqSqXxpnHXv1DgIQCvL7UW6DL86j3IeJEEpDetYEqliiUBQdyOQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b91d40b-1ca2-4645-7e8a-08df12efe45f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 06:09:24.7477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmoyoLqb4WltsLNsjKg3SQORlWD9Z/BTrRBBGI+WqtDzHQqsUno7N2zpyRUgDg/hKTyb8wlCFZXfp9fSgl+AyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW1BBVENIIDA3LzEwXSBkcm0vaTkxNS9kaXNwbGF5OiBBZGQgYml0cyBm
b3IgV2FfMTQwMjE3Njg3OTIgZm9yDQo+IGxpbmttL24gcmF0aW8gPiAxMA0KPiANCj4gVGhhbmsg
eW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3Rl
bnRpYWwgaXNzdWUocykgdG8NCj4gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gSGFyZHdhcmUgc3Rh
dGUgcmVhZG91dCBmb3IgVEdEREEgYnlwYXNzIGlzIGdhdGVkIGJ5IHNvZnR3YXJlDQo+IHBvbGlj
eSBjaGVja3MgYW5kIHN0cmlwcyByZWdpc3RlciBmaWVsZHMsIGhpZGluZyBpbnZhbGlkIGhhcmR3
YXJlIHN0YXRlIGZyb20gdGhlDQo+IERSTSBzdGF0ZSBjaGVja2VyLg0KPiAtLQ0KPiANCj4gY29t
bWl0IDFjZTM5YjFkNDY4NmFhZTIxMTlkMDg4NmE5MWMwOTllMjIwYmQwYTANCj4gQXV0aG9yOiBB
bmtpdCBOYXV0aXlhbCA8YW5raXQuay5uYXV0aXlhbEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IGRy
bS9pOTE1L2Rpc3BsYXk6IEFkZCBiaXRzIGZvciBXYV8xNDAyMTc2ODc5MiBmb3IgbGlua20vbiBy
YXRpbyA+IDEwDQo+IA0KPiBUaGlzIGNvbW1pdCBhZGRzIHN1cHBvcnQgZm9yIFdhXzE0MDIxNzY4
NzkyIHRvIGJ5cGFzcyB0aGUgaGFyZHdhcmUNCj4gbGltaXRhdGlvbiB3aXRoaW4gdGhlIFRpbWlu
ZyBHZW5lcmF0b3IgRERBIChUR0REQSkgZm9yIExpbmsgTS9OIHJhdGlvcw0KPiBiZXR3ZWVuIDEw
LjAgYW5kIDE1LjAuIEl0IGludHJvZHVjZXMgaGFyZHdhcmUgcHJvZ3JhbW1pbmcgaW4gdGhlIExJ
TktNLA0KPiBMSU5LTiwgSERNSV9FTVBfREFUQSwgYW5kIENISUNLRU5fVFJBTlMgcmVnaXN0ZXJz
IGFuZCB0cmFja3MgdGhlIHVzYWdlDQo+IHdpdGggYSBuZXcgYnlwYXNzX21fbl9yYXRpb19saW1p
dCBtZW1iZXIuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXkuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5LmMNCj4gPiBpbmRleCAzNDc4OTJiMGMxZGE3Li5hNWIxZDRjNDYyM2EzIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
LmMNCj4gWyAuLi4gXQ0KPiA+IEBAIC0zNDg3LDE2ICszNTIwLDY0IEBAIHZvaWQgaW50ZWxfZ2V0
X21fbihzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSwNCj4gPiAgCW1fbi0+bGlua19tID0g
aW50ZWxfZGVfcmVhZChkaXNwbGF5LCBsaW5rX21fcmVnKSAmDQo+IERBVEFfTElOS19NX05fTUFT
SzsNCj4gPiAgCW1fbi0+bGlua19uID0gaW50ZWxfZGVfcmVhZChkaXNwbGF5LCBsaW5rX25fcmVn
KTsNCj4gPg0KPiA+IC0JaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDE0KQ0KPiA+ICsJaWYg
KERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDE0KSB7DQo+ID4gKwkJdTggbGlua19uX2V4dCA9DQo+
IFJFR19GSUVMRF9HRVQoUElQRV9MSU5LX04xX0VYVEVOREVEX01BU0ssDQo+ID4gK21fbi0+bGlu
a19uKTsNCj4gPiArDQo+ID4gIAkJbV9uLT5saW5rX24gJj0gflBJUEVfTElOS19OMV9FWFRFTkRF
RF9NQVNLOw0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IFRoaXMgdW5jb25kaXRpb25hbGx5
IHN0cmlwcyB0aGUgZXh0ZW5kZWQgYml0cyBmcm9tIHRoZSByZWFkIGhhcmR3YXJlIHN0YXRlIGlu
DQo+IGludGVsX2dldF9tX24oKS4gVGhlIGRybV9XQVJOX09OIGRpcmVjdGx5IGJlbG93IGl0IG9u
bHkgdHJpZ2dlcnMgaWYNCj4gbGlua19uX2V4dCBpcyBub24temVybywgd2hpY2ggZmFpbHMgdG8g
d2FybiBpZiB0aGUgYml0cyBhcmUgemVybyBpbiBoYXJkd2FyZSBidXQNCj4gd2VyZSBleHBlY3Rl
ZCB0byBiZSBzZXQuIFNob3VsZCB0aGlzIGNvZGUgcmV0YWluIHRoZSBleHRlbmRlZCBiaXRzIG9y
DQo+IHVuY29uZGl0aW9uYWxseSB2YWxpZGF0ZSB0aGVtIHNvIHRoZSBEUk0gc3RhdGUgY2hlY2tl
ciBjYW4gZGV0ZWN0IG1pc3NpbmcNCj4gaGFyZHdhcmUgY29uZmlndXJhdGlvbj8NCg0KVGhlIGV4
dGVuZGVkIGJpdHMgaGF2ZSB0byBiZSBzdHJpcHBlZCwgbGlua19uIGlzIGNvbXBhcmVkIGFnYWlu
c3QgdGhlIGNvbXB1dGVkDQoyNCBiaXQgdmFsdWUgb3IgaXQgbmV2ZXIgbWF0Y2hlcy4gQW5kIHRo
ZSBsaW5rX25fZXh0IGNoZWNrIGhhcyB0byBzdGF5DQpjb25kaXRpb25hbCwgaGFyZHdhcmUgbGVn
aXRpbWF0ZWx5IGhhcyB6ZXJvcyB0aGVyZSB3aGVuIHRoZSBieXBhc3MgaXNuJ3QgaW4NCnVzZS4g
VGhleSdyZSBkZXJpdmVkIGZyb20gbGlua19tL2xpbmtfbiBhbnl3YXksIHNvIGEgbWlzbWF0Y2gg
YWxyZWFkeSBzaG93cyB1cA0KZWxzZXdoZXJlLiBJJ2xsIGp1c3QgZHJvcCB0aGUgZHJtX1dBUk5f
T04uDQoNCj4gDQo+ID4gKw0KPiA+ICsJCWlmIChpbnRlbF9kaXNwbGF5X3dhKGRpc3BsYXksDQo+
IElOVEVMX0RJU1BMQVlfV0FfMTQwMjE3Njg3OTIpKQ0KPiA+ICsJCQlkcm1fV0FSTl9PTihkaXNw
bGF5LT5kcm0sDQo+ID4gKwkJCQkgICAgbGlua19uX2V4dCAmJiBsaW5rX25fZXh0ICE9DQo+IGJt
Z19nZXRfbGlua19uX2V4dChtX24pKTsNCj4gPiArCX0gZWxzZSB7DQo+ID4gIAkJbV9uLT5saW5r
X24gJj0gREFUQV9MSU5LX01fTl9NQVNLOw0KPiA+ICsJfQ0KPiBbIC4uLiBdDQo+ID4gK3N0YXRp
YyB2b2lkIGJtZ19lbmhhbmNlZF90Z2RkYV9yZWFkKHN0cnVjdCBpbnRlbF9jcnRjICpjcnRjLA0K
PiA+ICsJCQkJICAgIGVudW0gdHJhbnNjb2RlciB0cmFuc2NvZGVyLA0KPiA+ICsJCQkJICAgIHN0
cnVjdCBpbnRlbF9saW5rX21fbiAqbV9uKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZGlz
cGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoY3J0Yyk7DQo+ID4gKwl1MzIgbGlua19t
X2ZyYWM7DQo+ID4gKwlpbnQgbV9uX3JhdGlvOw0KPiA+ICsNCj4gPiArCWlmICghbV9uLT5saW5r
X24pDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCW1fbl9yYXRpbyA9IERJVl9ST1VORF9V
UChtX24tPmxpbmtfbSwgbV9uLT5saW5rX24pOw0KPiA+ICsNCj4gPiArCWlmICghaW50ZWxfZGlz
cGxheV9jYW5fYnlwYXNzX21fbl9saW1pdChkaXNwbGF5LCBtX25fcmF0aW8sIGNydGMtDQo+ID5w
aXBlKSkNCj4gPiArCQlyZXR1cm47DQo+IA0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4gVGhpcyBw
b2xpY3kgY2hlY2sgaW4gYm1nX2VuaGFuY2VkX3RnZGRhX3JlYWQoKSBhYm9ydHMgdGhlIHJlYWRv
dXQgb2YNCj4gRFBfRU5IQU5DRURfVEdEREFfRU5BQkxFIGlmIHRoZSBkcml2ZXIgY29uc2lkZXJz
IHRoZSBjb25maWd1cmF0aW9uDQo+IHVuc3VwcG9ydGVkLg0KPiBJZiB0aGUgaGFyZHdhcmUgaXMg
bWlzY29uZmlndXJlZCwgdGhpcyBlYXJseSByZXR1cm4gbGVhdmVzDQo+IGJ5cGFzc19tX25fcmF0
aW9fbGltaXQgYXMgZmFsc2UuIFNob3VsZCB0aGlzIGNoZWNrIGJlIHJlbW92ZWQgc28gdGhlIHRy
dWUNCj4gaGFyZHdhcmUgc3RhdGUgaXMgcmVhZCBhbmQgZXhwb3NlZCB0byB0aGUgRFJNIHN0YXRl
IGNoZWNrZXI/DQoNCkZhaXIgcG9pbnQgb24gdGhlIHBvbGljeSBjaGVjayBpbiB0aGUgcmVhZG91
dCwgd2lsbCBuYXJyb3cgaXQgdG8gdGhlIHBsYXRmb3JtDQogY2hlY2suDQoNCj4gDQo+ID4gKw0K
PiA+ICsJaWYgKCEoaW50ZWxfZGVfcmVhZChkaXNwbGF5LCBDSElDS0VOX1RSQU5TKGRpc3BsYXks
IHRyYW5zY29kZXIpKSAmDQo+ID4gKwkgICAgICBEUF9FTkhBTkNFRF9UR0REQV9FTkFCTEUpKQ0K
PiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4gKwlsaW5rX21fZnJhYyA9DQo+IFJFR19GSUVMRF9H
RVQoSERNSV9FTVBfREFUQV9MSU5LX01fRlJBQ19NQVNLLA0KPiA+ICsJCQkJICAgIGludGVsX2Rl
X3JlYWQoZGlzcGxheSwNCj4gSERNSV9FTVBfREFUQShkaXNwbGF5LCB0cmFuc2NvZGVyKSkpOw0K
PiA+ICsNCj4gPiArCWlmIChsaW5rX21fZnJhYyA9PSBtX24tPmxpbmtfbSAlIG1fbi0+bGlua19u
KQ0KPiA+ICsJCW1fbi0+YnlwYXNzX21fbl9yYXRpb19saW1pdCA9IHRydWU7DQo+IA0KPiBbU2V2
ZXJpdHk6IE1lZGl1bV0NCj4gVGhpcyBleGFjdC1tYXRjaCBjaGVjayBwcmV2ZW50cyB0aGUgcmVh
ZG91dCBmcm9tIHJlY29yZGluZyB0aGF0IHRoZSBieXBhc3MgaXMNCj4gZW5hYmxlZCBpZiB0aGUg
ZnJhY3Rpb25hbCBwYXJ0IGluIGhhcmR3YXJlIGlzIGluY29ycmVjdC4gU2hvdWxkDQo+IGJ5cGFz
c19tX25fcmF0aW9fbGltaXQgYmUgc2V0IHJlZ2FyZGxlc3Mgb2YgdGhlIGZyYWN0aW9uYWwgdmFs
dWUgc28gdGhlIERSTQ0KPiBzdGF0ZSBjaGVja2VyIGNhbiBjYXRjaCBpbmNvcnJlY3QgaGFyZHdh
cmUgY29uZmlndXJhdGlvbnM/DQo+IA0KDQpUaGUgZnJhY3Rpb24gY2hlY2sgSSdsbCBsZWF2ZS4g
U2V0dGluZyB0aGUgZmxhZyByZWdhcmRsZXNzIGNhdGNoZXMgbGVzcywgbm90DQptb3JlIC0gYSB3
cm9uZyBmcmFjdGlvbiBjdXJyZW50bHkgc2hvd3MgdXAgYXMgYSBieXBhc3NfbV9uX3JhdGlvX2xp
bWl0DQptaXNtYXRjaCwgd2hlcmVhcyB1bmNvbmRpdGlvbmFsbHkgYm90aCBzaWRlcyByZWFkIHRy
dWUgYW5kIG5vdGhpbmcgY29tcGFyZXMNCiB0aGUgZnJhY3Rpb24uDQoNClJlZ2FyZHMsDQpTdXJh
aiBLYW5kcGFsDQoNCj4gPiArfQ0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTExMDQxNDQ5LjM2OTk0MDAtDQo+IDEt
c3VyYWoua2FuZHBhbEBpbnRlbC5jb20/cGFydD03DQo=
