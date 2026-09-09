Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012941FF1B5
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 17:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973620; cv=fail; b=NoquiHoVU1E6UjpmaWExWPmdv40p85uF2VZWuwdlOV0gcpcFKRQgreKzT//2qwXSzv/uWe8iZAp5zDDKIVuOdDJ1oUGZOKnWZ8gFT+FYfjoHUI97bWEOSRISjiy9l6fTzqJhLGVDkoMNxqsoLX1YnDD4NMqBwJ4XbIdrKWAd4ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973620; c=relaxed/simple;
	bh=AYhB9nUCvE7GbsBh6nzxZW5yjlWqWJ9qdWyyFtmLcC0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QOcVFGDJQ3s79ZIL/60gjUoHDhbNbeh+K6lB16DW01p9Hc1ZW+xF6pSgGhYkApOQpUQrrLWILI8nL5IjiN6G1hTP0l9YyBeZWyIWjt6zWqEd6dhPuFZvQaA7Mk379mrkjwASVZkcVQOqCaMfLlG13/a5nWLrB6ZhGoHm1+V0zEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/Qwa/Tz; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/Qwa/Tz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788973618; x=1820509618;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AYhB9nUCvE7GbsBh6nzxZW5yjlWqWJ9qdWyyFtmLcC0=;
  b=R/Qwa/TzIbTwNLIDAkcjtkkNZfTbjm02Y5Md0HXoe2bTFW4ksrlhRJWi
   fEsZ2DKH2DBXswlljbwRsgF+k6gzf3bYcPcBMZ4DGjJHtYD84CjtkvlZG
   HlzDspHUdcWhY9OylzEeT7WZnmOjbF0PUoeS37s0M0PShTuwyV3JVkI/4
   fo8jMos1R4knKgdNNqkmfX4Eh0gwwBXD6/EjYF07+MaBmU1tb6yTSwq8X
   lWB8m2NYxJOW/SQTlcusiUub0ZhD67PamAuEd6IQx4vNTxiWCT9RS4wWH
   KpAKVIqRJm1u+eLWj7U6IV98hmZG+mMjMZZlaP2h5syX47N+OyRsQyp2g
   A==;
X-CSE-ConnectionGUID: lITdwnJaTGGcaVgZ6alh8w==
X-CSE-MsgGUID: ykS8NP3eSRG9MXc8Jy7yTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88555250"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="88555250"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 10:06:57 -0700
X-CSE-ConnectionGUID: Gf8s+cXkRqus73Y835EcZQ==
X-CSE-MsgGUID: ohtTtLEiQLeWlghEsp4mXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="275519258"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 10:06:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 10:06:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 10:06:56 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 10:06:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJmV43U3FlV5AvbA1G+oDAKCEX60vWEf4LtUGo1gjUWwxDtYlujU4+8EChSg346aC/bE8wdfQa3JrzOGMHGUQNyq3NZFt0+1Pl4SSJ6EGaBFIiqw5X/S8WGWIfJLNSSEsF7DinSTePeLOclyNWJ8QjPoaAQXss0ISlLySmC9B2JNNKoBwTjzoLuwrwwU6xi0zQKxXUjUllZPHdNaqUipzdrX3pabXGq+etrjg5VTpnwv93uI1YmyxkLvEXLSEvDmAo9975yvNvAUeIzIaDGekIPnoAv7uSwjDFCwhMPMOd00TpE4V/Pr0Vxs+31XJYBt5UXDPSmJy+dqeTlrCGnOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYhB9nUCvE7GbsBh6nzxZW5yjlWqWJ9qdWyyFtmLcC0=;
 b=HnhXTLfmdEeKNQ8dAy9ttHKr/SchUeEY8sosbGwGsriHz7L0IHa1X6JPAjKBOiBq8Stl8iQoLEa5yDghx4PjTfyMVgs02SYM6QrkGOKXGRBJNMOrzuxtUCk9jrDU3h8+NBRKEd9CKUYxqMT97siNeqEl0K3vawLSWlluWclSdV3XfyPsD4KAJpIwsypWUZcW4J8KLmKhIjKtEyljm/Foxa522YgyDlhrNuc240DQfoW7Dm56GHzJ+KG/NcFHo6TvgQqWOekHCQo3DVppnPl5lnIpD4qDjuKk9sFLH2IAw9zjJsHK2TE/nkihTtz3GNyUdSaSzyVUjx03GEhNeV8uWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 by PH3PPF957B3B2A8.namprd11.prod.outlook.com (2603:10b6:518:1::d39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 17:06:48 +0000
Received: from SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3]) by SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3%6]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 17:06:48 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
Thread-Topic: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
Thread-Index: AQHdQHci1TIJ2hvMM0evGB4U+uWM+LbGcNuAgAAG2+A=
Date: Wed, 9 Sep 2026 17:06:48 +0000
Message-ID: <SA3PR11MB762540142F49EFF9814359DFC8B02@SA3PR11MB7625.namprd11.prod.outlook.com>
References: <20260909161844.125147-1-tilak.tirumalesh.tangudu@intel.com>
 <20260909161844.125147-3-tilak.tirumalesh.tangudu@intel.com>
 <20260909163307.8AA771F000FF@smtp.kernel.org>
In-Reply-To: <20260909163307.8AA771F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB7625:EE_|PH3PPF957B3B2A8:EE_
x-ms-office365-filtering-correlation-id: fb29977f-2d58-46f3-3cba-08df0e94bc44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: 4fJzl5xTNzksLfm1ZDqojqCBwo3Zf3aHNKFJ4f7YIEJnJ3ilZrXR73DvkSovrLaknOx10hHJbGTDOjRi4yImf4Q8CPRz1XYp9UJL804QRYEvalyShqAa+CfWgkj3LZdJj9waecZeZNTe/nDQGkbtA03b/lFYqoqPvU9L2tnhD6mdqiHabKDVP9WR/Hq+eqoMKiHy89R8Yh3gNuzjd6jzAi9R0oDJt5kEA4pczUPDg1C6vsnr7zc/ApmXYCR3E0YAAaT2mK1C3mrRcpgrNfPH3xn677gYEJcu9SPfl9jd1T8OADEghVYZZL8gFsJQGnhCLLexFRfgIiAIWexeCi6RiuwK4O3EAKEF4mRr8cskwNH2ySRriAv669AQhnPD/POITYW9ZM2E8Fdsg4i1Onj3DP4E/WDDLTryEIu6gsI3FbnYX65s1nikKf9N7U0jAUHLmRJfPTHxlv8Ku7CRxZIZd42It/32LwPtj1sIzQ++dosGlVah5JphROE0i+pQsyB+wDEUROANrfly7BPHd/To+y7uATFefX2kMR+tmJQ/sOZ/Kh8Tjv/WTwU501D336OkKBhNK8F4OqluDMfxHJFiXB15bbyfpmJrdskicwocR9PuF98Xw1Z/uRD2VKv50c68SXvY7QWTAzxQjFPddEBvWjZ3LNxDJb9x92qSUGemFqw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB7625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmpxeTNJZkNMeC95TXJ6WjQ4emhEb1Y4N3RDdDFIZjk2M2phcEhObXZIQU15?=
 =?utf-8?B?YXdWbmNGUXpjcDhVRnMxcWhxWXpmZFdTY1FBU1lQTWFFVEZKOW1LUTFWWGZF?=
 =?utf-8?B?STlSOXVtbEN6dGpGWUlSVFZEK1NyUDJJb0MwOHJiaEQ4WmVENmtiT0pRbDl3?=
 =?utf-8?B?cWwyMmRaM1hKRDF0cFpZTzlvajBtZlNVSTVLWlZ5ek5IUzMrWDUyRG1hVE85?=
 =?utf-8?B?NFBHMlJYN0JWYXlUcGF1czJOazR5L21mWEFTajR6VEhlV2pmNm9ETUpaZEds?=
 =?utf-8?B?Z1hEM0lRTTAyYkpISW52WU9aTllGRG9jZGU3V3o0R3d2MHNFOFc4QU5kZVV2?=
 =?utf-8?B?cWl0QnVZWDNwTjZueHBKQUpERWxsUXZxWklaR3U5Z0ZUSHpaclZhMGxFYmtF?=
 =?utf-8?B?bXBYenFGT1RIRlpVZUZUTlFPYWt6d2FTU1QxdFlYR0NzdituZStWVUhvY0Qy?=
 =?utf-8?B?WFpqeDV0dTZ4WUxGK3lWeUczOU80MG4zVXplYmh6M3ErS2xpcjJnMkJjSStP?=
 =?utf-8?B?bzJzTUhqZG9Bak82a3VDTDhjYjY0NlpFbWYrZWdITUhlZlpuTlBFZHFJcmRo?=
 =?utf-8?B?dVVUcllNQXhCQ3h0dm4yOFZEMktVamJjV3FMUEZpOWVCc0JhYzlEcUV5aE02?=
 =?utf-8?B?Z3FhMjIxbEl0Q3VLbml0bXNSNVcwc3NIelZpVUpKMEFWNklRV0lsSG0yclFT?=
 =?utf-8?B?c3VpTzZKUGlnZkMvQUxQUDFKaDVFSkttbHlOcU9MaWNKbXZiYURPYTN0b2Jt?=
 =?utf-8?B?OHJWNU5LeDdQbHk4cklXQzZmQURRL1NtRmFCUWI5Y3RoeFlNWWF2RDVOVHBC?=
 =?utf-8?B?dDRCcVlRZStyRHdXWU5iMjRYS2QyY3E5TTVwYXZUdXU5Y0VFTDJRQUdPVlJH?=
 =?utf-8?B?WDVJczNWSTJoVkx6RzExZFF4L0kwQzNqekE1NWVucmhXTkZSRURyd0t4WkZM?=
 =?utf-8?B?b25lQi9zdCtFbnBVYVJCMVR4VFVhQzFGcENsLzhDVW00ZVRHM0xWZ0V3dVVR?=
 =?utf-8?B?VldzcFRFeEhqaTNqUloyRUdwQ3diYzZmaWZHcjNqODdGWUNEQWhRd0dYK3Mv?=
 =?utf-8?B?Z3VJK2dqUHZucUNMWkdyZG5NYnVNdzhPdzlEVzkwQjhoYThWVWpVWlA4Mnly?=
 =?utf-8?B?UWxSRmxobVZjZ3hkRG1OT1pXRWw5WUphRml0cGxnMkxoS2tXWVZoZ3FpYjVn?=
 =?utf-8?B?UEFPQ1Q0d245Q1RZMm1vL2U2N3YwcDJjQ21EMis0RnJqTXpGeVlyZ2cyL2Nv?=
 =?utf-8?B?YlA4V2ExbW1ha1FNNVEvTUxrS0o5eDlzSEZtYTM5b2NraWVUOC84MlBWMktW?=
 =?utf-8?B?aU84TEg4bkxmTitUYVlqc3BDTHJRR0Z4RFFNZFVxczJUSUZoeVozS1VwQTRx?=
 =?utf-8?B?U0Z6NVczZTFuRXY5aHhwcWJMZEhUeTYvaWVDTDN1Y1E0cnZGQ3J5OXFkY0ow?=
 =?utf-8?B?WDlkamQ1anVIZ0taRjloZ0hFbnpIcUdzUFZNMkNSSVZlMVhIQnBnVUJlNHhS?=
 =?utf-8?B?U3JqVE1aN3BTbGZUZ0ppRnhpQ2tNeEo1VjdoUzlXM1g2cXFUdEpsREJZUHlG?=
 =?utf-8?B?d3hvUGdjVlNjakJSM1JhT3g0eTZjQlNoQXhqWERsdlhVQkxPNm9lVW8rZFMx?=
 =?utf-8?B?dUQrSno2eXR2L2Y5elN2QWxFeUtHU0JmY1BZSWVBeGtXK1NnMjgrSzZVK0Nj?=
 =?utf-8?B?WnJoQlFYOEltcDVPMVdGMjVLekR6U1VMKzdzZEV3MUJLVE1makd2aDR5MEF6?=
 =?utf-8?B?dkJqMXNmSFFnaXBsdzNiL0hETUFMTEZIMFdiV1dCdEVkVmRUbUsxVEcxZ1dX?=
 =?utf-8?B?WnpuNUdCYk1acEI5NzEzTy9ZRlFlem5WQUM0aWpRWW04N0srUGNORnpkTEtj?=
 =?utf-8?B?N0cxV2dBSzBiTVZWZEdVQ2laZ2tpTEs1dEJpWWsvNkY2cHpyd0VXbDA4NkdN?=
 =?utf-8?B?UHFGTVdhbmVsT243NkNxTk9yelJveWxORlhWc0twV0RRWjdYanFGZy9HVjBs?=
 =?utf-8?B?bmNGbUcra2g5VHVxTElQTXIyWEFXN1dJcG5OcmYxWTQ3WEx4UThJQlFNZVl5?=
 =?utf-8?B?TXRDbkY0Ni93RW5xMGdRRmFFcmhYbFluUzVROFNCOUpaOVMyVENJWHZBelBv?=
 =?utf-8?B?L3lLUGRkRGZqbWZXZ2hFQmRrK0s5V0M2YVhFRWFEWis1N1FkWk1rWkJlbHcr?=
 =?utf-8?B?c0s1Qm9BYlMyUXo0c3JDVGZBSXlVcVRSOHVVRWh1Rm83ZE1VTHdBVUVHUFpa?=
 =?utf-8?B?RW15d0wwSTBSRU1nd29kNEJVQmZ5S3dmM1VkQzh3dVY1cmZGdG42SE16bWl5?=
 =?utf-8?B?bXBacXVGd0U0WmViNnM2Y2V1TFIzaXpaZ0lTVE9PajJsY05CcStXSEg0RG1a?=
 =?utf-8?Q?+03IAgQ4aVYUGMRtXnE/ORanYUAwCW3WS671pX86/rKqS?=
x-ms-exchange-antispam-messagedata-1: xrvEP/DvgPkkiAAWCiHxGWFfJBZb9lg+Bo0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Od7CkxOFSsvNtbVA7FQZy53DDMBA1zdFFm3yBH6KFl2DQskP9wcvmidAF9K+iuSRl9Olp6vEZj67iUADRwPf0WR9MedRFCbGo4hPFeNlJAaTk0r1Yu+LSwyj1udNY/l4bgaf8yT0i1PxiK0rEGcyV4J5zupqH0NNPNPZ6Y/qaz10Zp7/t1ao80/VmckFPevKnZXuk4+0wPv78lSTaOPiF/YAd349pzE2STF7pQacbGSPM3D2x6EQZmf9XmT1NKxPvgJk8SlDwxt6HECSCofTeZRcV8V8kTE8d3H2Y2fCK5tpxOhT5tIwqxH1RQ4Gt1TsWnC1OqA6aub+cxgF/k4Gtw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb29977f-2d58-46f3-3cba-08df0e94bc44
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 17:06:48.6355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCRZnviOOC1jpG0TR7wI4gnC34tY9LAb0OeDqcbdmQNqwi5cDRoYDqTa7tXqg5nbVq97+IXD3zS3nNsvPatkWncvcU7McK5QStRVzjoT4qC3B+EhrMqlH4IMtV1KzvS1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF957B3B2A8
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMDkgU2VwdGVtYmVyIDIw
MjYgMjI6MDMNCj4gVG86IFRhbmd1ZHUsIFRpbGFrIFRpcnVtYWxlc2ggPHRpbGFrLnRpcnVtYWxl
c2gudGFuZ3VkdUBpbnRlbC5jb20+DQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGRybS94ZTogQWRkIHdhXzE0MDI1OTQxNTg3
IHRvIHhlMiwgeGUzIGFuZCB4ZTNwDQo+IHBsYXRmb3Jtcw0KPiANCj4gVGhhbmsgeW91IGZvciB5
b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNz
dWUocykgdG8NCj4gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gVGljayBxdWFudGl6YXRpb24gcm91
bmRpbmcgdXAgY2F1c2VzIGBpZGxlZGx5YCB0byBleGNlZWQgYG1heGNudGAsDQo+IHRyaWdnZXJp
bmcgc3B1cmlvdXMga2VybmVsIHdhcm5pbmdzIGFuZCBXQSBpbnZhcmlhbnQgdmlvbGF0aW9ucy4N
Cj4gLS0NCj4gDQo+IGNvbW1pdCBkNzc3MTEzZjUyY2VkN2ViZGEwM2NiYjkxNTUyNTg3MDFlNDI3
YTQ1DQo+IEF1dGhvcjogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoIDx0aWxhay50aXJ1bWFsZXNo
LnRhbmd1ZHVAaW50ZWwuY29tPg0KPiANCj4gZHJtL3hlOiBBZGQgd2FfMTQwMjU5NDE1ODcgdG8g
eGUyLCB4ZTMgYW5kIHhlM3AgcGxhdGZvcm1zDQo+IA0KPiBUaGlzIGNvbW1pdCBhdm9pZHMgcHJv
Z3JhbW1pbmcgdGhlIElETEVETFkgdGltZXIgdG8gbGVzcyB0aGFuIDUNCj4gbWljcm9zZWNvbmRz
Lg0KPiBJdCBhcHBsaWVzIHdhXzE0MDI1OTQxNTg3IHRvIEdyYXBoaWNzIFZlcnNpb25zIDIwLjAx
IHRvIDM1LjExIGFuZCBNZWRpYQ0KPiBWZXJzaW9ucyAxMy4wMSB0byAzNS4wMy4NCj4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+ID4gaW5kZXggYzg2ODkwZTA5YjU1NS4u
MzdjZDdmZTM4YzJiNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdf
ZW5naW5lLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4g
WyAuLi4gXQ0KPiA+IEBAIC01ODgsMzMgKzU4OCw3OCBAQCBzdGF0aWMgdm9pZCBod19lbmdpbmVf
aW5pdF9lYXJseShzdHJ1Y3QgeGVfZ3QNCj4gPiAqZ3QsIHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3
ZSwgIHN0YXRpYyB2b2lkIGFkanVzdF9pZGxlZGx5KHN0cnVjdA0KPiA+IHhlX2h3X2VuZ2luZSAq
aHdlKSAgew0KPiA+ICAJc3RydWN0IHhlX2d0ICpndCA9IGh3ZS0+Z3Q7DQo+IFsgLi4uIF0NCj4g
PiArCQlpZiAoWEVfR1RfV0EoZ3QsIDE2MDIzMTA1MjMyKSAmJg0KPiA+ICsJCSAgICB4ZV9ndF9X
QVJOX09OKGd0LCBpZGxlZGx5ID49IG1heGNudCB8fCBpbmhpYml0X3N3aXRjaCkpIHsNCj4gICAg
ICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl4NCj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBXaWxsIHRoaXMgd2Fy
bmluZyBzcHVyaW91c2x5IGZpcmUgb24gc3Vic2VxdWVudCByZWFkcz8NCj4gDQo+IElmIG1heGNu
dCBpcyB1bnByb2dyYW1tZWQgKDApLCB0aGUgdHdvIHdvcmthcm91bmRzIGNvbmZsaWN0IGVudGly
ZWx5IChvbmUNCj4gZm9yY2luZyA1MDAwLCB0aGUgb3RoZXIgZm9yY2luZyAwKSwgd2hpY2ggd291
bGQgY2F1c2UgYSBXQVJOX09OIGFuZCBjbGFtcA0KPiBjeWNsZSBvbiBldmVyeSByZXNldC4NCj4g
DQo+IEFkZGl0aW9uYWxseSwgaWYgbWF4Y250IHRpZ2h0bHkgYm91bmRzIHRoZSA1MDAwbnMgbWlu
aW11bSwgdGhlIHRpY2sNCj4gcXVhbnRpemF0aW9uIHJvdW5kaW5nIHVwIGJlbG93IGNhbiBwdXNo
IHRoZSBkZWxheSB0aW1lIGFib3ZlIG1heGNudC4gT24gdGhlDQo+IG5leHQgZW5naW5lIHJlc2V0
IG9yIHJlc3VtZSwgdGhpcyB0cmlnZ2VycyB0aGlzIHhlX2d0X1dBUk5fT04oKSBhbmQgZm9yY2Vz
IGENCj4gY2xhbXAsIGNhdXNpbmcgaWRsZWRseSB0byBvc2NpbGxhdGUgYW5kIHZpb2xhdGUgdGhl
IGludmFyaWFudHMgb2YNCj4gV2FfMTYwMjMxMDUyMzIuDQpUaGlzIGNvbmRpdGlvbiBpcyBndWFy
ZGVkIGJ5IHhlX2d0X1dBUk5fT04oKSBpbmhlcml0ZWQgZnJvbSB0aGUgZXhpc3RpbmcgV2FfMTYw
MjMxMDUyMzIgaGFyZGVuaW5nICwgaXQgZGVsaWJlcmF0ZWx5IGZpcmVzIHRvIHN1cmZhY2UgYW4g
dW5leHBlY3RlZCBJRExFX1dBSVRfVElNRSA9PSAwIHJlZ2lzdGVyIHN0YXRlIHJhdGhlciB0aGFu
IHNpbGVudGx5IG1pc3Byb2dyYW1taW5nIHRoZSBkZWxheSwgYW5kIGFsd2F5cyByZXNvbHZlcyB0
byBhIHNhZmUgdmFsdWUgKDAsIHdpdGggdGhlIGluaGliaXQgYml0IGNsZWFyZWQpIHJlZ2FyZGxl
c3Mgb2Ygd2hpY2ggd29ya2Fyb3VuZCBpcyBhY3RpdmUuIE9uIGV2ZXJ5IHBsYXRmb3JtIHRoaXMg
c2VyaWVzIHRhcmdldHMsIElETEVfV0FJVF9USU1FIGlzIHByb2dyYW1tZWQgdG8gYSBub24temVy
byB2YWx1ZSwgc28gdGhpcyBwYXRoIGlzIG5vdCBleHBlY3RlZCB0byBiZSBoaXQgaW4gcHJhY3Rp
Y2UuIFRoaXMgY29uZGl0aW9uIGlzIGd1YXJkZWQgYnkgeGVfZ3RfV0FSTl9PTigpIGluaGVyaXRl
ZCBmcm9tIHRoZSBleGlzdGluZyBXYV8xNjAyMzEwNTIzMiBoYXJkZW5pbmcgLCBpdCBkZWxpYmVy
YXRlbHkgZmlyZXMgdG8gc3VyZmFjZSBhbiB1bmV4cGVjdGVkIElETEVfV0FJVF9USU1FID09IDAg
cmVnaXN0ZXIgc3RhdGUgcmF0aGVyIHRoYW4gc2lsZW50bHkgbWlzcHJvZ3JhbW1pbmcgdGhlIGRl
bGF5LCBhbmQgYWx3YXlzIHJlc29sdmVzIHRvIGEgc2FmZSB2YWx1ZSAoMCwgd2l0aCB0aGUgaW5o
aWJpdCBiaXQgY2xlYXJlZCkgcmVnYXJkbGVzcyBvZiB3aGljaCB3b3JrYXJvdW5kIGlzIGFjdGl2
ZS4gT24gZXZlcnkgcGxhdGZvcm0gdGhpcyBzZXJpZXMgdGFyZ2V0cywgSURMRV9XQUlUX1RJTUUg
aXMgcHJvZ3JhbW1lZCB0byBhIG5vbi16ZXJvIHZhbHVlLCBzbyB0aGlzIHBhdGggaXMgbm90IGV4
cGVjdGVkIHRvIGJlIGhpdCBpbiBwcmFjdGljZS4NCg0KPiANCj4gPiArCQkJLyogbWF4Y250IG1h
eSBiZSAwIGlmIElETEVfV0FJVF9USU1FIGlzDQo+IHVucHJvZ3JhbW1lZC4gKi8NCj4gPiArCQkJ
aWRsZWRseSA9IG1heGNudCA/IG1heGNudCAtIDEgOiAwOw0KPiA+ICsJCQljbGFtcGVkX2JlbG93
X21heGNudCA9IHRydWU7DQo+ID4gKwkJCXdhX2FwcGxpZWQgPSB0cnVlOw0KPiA+ICsJCQkvKiBp
bmhpYml0X3N3aXRjaCBvdmVycmlkZSB0byBrZWVwDQo+ID4gKwkJCSAqIHNlbWFudGljcyBvZiBX
YV8xNjAyMzEwNTIzMg0KPiA+ICsJCQkgKi8NCj4gPiArCQkJaWYgKGluaGliaXRfc3dpdGNoKQ0K
PiA+ICsJCQkJaWRsZWRseV9yZWdfdmFsICY9DQo+IH5JTkhJQklUX1NXSVRDSF9VTlRJTF9QUkVF
TVBURUQ7DQo+ID4gKwkJfQ0KPiA+ICsNCj4gPiArCQlpZiAod2FfYXBwbGllZCkgew0KPiA+ICsJ
CQl1MzIgaWRsZWRseV90aWNrczsNCj4gPiArDQo+ID4gKwkJCS8qDQo+ID4gKwkJCSAqIFdhXzE2
MDIzMTA1MjMyIHJlcXVpcmVzIGlkbGVkbHkgPCBtYXhjbnQsIHNvIGZsb29yDQo+ID4gKwkJCSAq
IHRoYXQgY2xhbXA7IG90aGVyd2lzZSByb3VuZCB1cCB0byBndWFyYW50ZWUgdGhlDQo+ID4gKwkJ
CSAqIFdhXzE0MDI1OTQxNTg3IG1pbmltdW0gc3Vydml2ZXMgdGljaw0KPiBxdWFudGl6YXRpb24u
DQo+ID4gKwkJCSAqLw0KPiA+ICsJCQlpZiAoY2xhbXBlZF9iZWxvd19tYXhjbnQpDQo+ID4gKwkJ
CQlpZGxlZGx5X3RpY2tzID0NCj4gRElWX1JPVU5EX0RPV05fVUxMKCh1NjQpaWRsZWRseSAqIDEw
MDAsDQo+ID4gKw0KPiBpZGxlZGx5X3VuaXRzX3BzKTsNCj4gPiArCQkJZWxzZQ0KPiA+ICsJCQkJ
aWRsZWRseV90aWNrcyA9DQo+IERJVl9ST1VORF9VUF9VTEwoKHU2NClpZGxlZGx5ICogMTAwMCwN
Cj4gPiArDQo+IGlkbGVkbHlfdW5pdHNfcHMpOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5e
Xg0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IERvZXMgdGhpcyBjZWlsaW5nIGRpdmlzaW9u
IHB1c2ggdGhlIGRlbGF5IHRpbWUgYWJvdmUgdGhlIG1heGNudCBib3VuZGFyeT8NCj4gDQo+IFdo
ZW4gbWF4Y250IGlzIGNsb3NlIHRvIHRoZSA1MDAwbnMgbWluaW11bSAoZS5nLiA1MTIwbnMpLCBy
b3VuZGluZyB1cA0KPiBpZGxlZGx5IHRvIHRpY2tzIHByb2R1Y2VzIGEgZGVsYXkgKGUuZy4gNTQx
N25zKSB0aGF0IGV4Y2VlZHMgbWF4Y250LCBzdG9yaW5nIGENCj4gdmFsdWUgdGhhdCB3aWxsIGZh
aWwgdGhlIFdhXzE2MDIzMTA1MjMyIGNoZWNrIG9uIHRoZSBuZXh0IHJlYWQuDQo+IA0KUm91bmRp
bmcgdGhlIDUgwrVzIGZsb29yIHVwIHRvIHdob2xlIHRpY2tzIGNvdWxkLCBpbiBwcmluY2lwbGUs
IGxhbmQgYWJvdmUgbWF4Y250IGlmIG1heGNudCB3ZXJlIGNsb3NlIGVub3VnaCB0byB0aGUgZmxv
b3IuIEluIHByYWN0aWNlLCBvbiBldmVyeSBwbGF0Zm9ybSB0aGlzIHdvcmthcm91bmQgaXMgZW5h
YmxlZCBmb3IsIElETEVfV0FJVF9USU1FIGlzIHByb2dyYW1tZWQgd2l0aCBlbm91Z2ggbWFyZ2lu
IGFib3ZlIDUgwrVzIHRoYXQgdGhlIHR3byB3b3JrYXJvdW5kcyBkb24ndCBjb25mbGljdA0KDQot
VGlsYWsNCg0KPiA+ICsNCj4gPiArCQkJaWRsZWRseV9yZWdfdmFsICY9IH5JRExFX0RFTEFZOw0K
PiA+ICsJCQlpZGxlZGx5X3JlZ192YWwgfD0gUkVHX0ZJRUxEX1BSRVAoSURMRV9ERUxBWSwNCj4g
aWRsZWRseV90aWNrcyk7DQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MDkxNjE4NDQuMTI1MTQ3LTEtDQo+IHRpbGFr
LnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20/cGFydD0yDQo=
