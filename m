Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17FD4FECD2
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 20:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788468936; cv=fail; b=BjbZokOoUSA6B6rVNWfQ63v0RjPpSdux8q5xn7lrRR+saxckwGvJxcqU4w333S5LmueZYJmc5A6ZS88GuWGfTS35kGws4pprGd/An8o+rxWjbz7mwt1ifHhNoX1TMDbFZibajttO2z4tpdDj2TSYt0GQd9Vn1NqycXSLQx4P55A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788468936; c=relaxed/simple;
	bh=T090jPHA6nZqpRx/FGEpf8H9pvezKXwKxbUXjMpU1GY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LtI68lrnvLInTaz/2Ih9rmqIZI+FkytcBm1cQigj+lVkn6kJDu9qpVAS5r3RhpmeEdsujlnJNysg6ZkDVLeVM+3LRfLXSI7QJyRLFTTPXHF4vfUApPjiRVGfT+qMgSSaw/d3JNio9K9gn6gGrbtO/6lPMMlXahqEX8e6Qi/9L1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nL6Nospz; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nL6Nospz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788468928; x=1820004928;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T090jPHA6nZqpRx/FGEpf8H9pvezKXwKxbUXjMpU1GY=;
  b=nL6NospzdNY/2Mq/ZkDebaFlYi0acheVykW4dEYH8yjupGab2SS8Yrxg
   fB321vqU7qEbPl2766kkhGcei2nBk9YmHVAjz1RL3hkGNVw9NKBO6oTJd
   rAF8NYAS/izX5cuqjmu6KfI+Iaaa9A74tHiWMC60XhN+db7WztyTL+EUr
   88fpuWjwbZ0fb10ZrzrkNjRaONjuq9hjyWOBd52SdSGb3ZlUFyj5uyl5l
   /88E4GpPco+VsRPEA3iqqA1Eu0HDYOH8243dDpFwvYX2aVOJiq6MorJf7
   WpHUZrQk50SSIhoQxzH0+SrOcTEdBi6JtSIddoCRQsRYZEh2ARLyAG3il
   Q==;
X-CSE-ConnectionGUID: taYqdebfRQWKwjeBULWuBQ==
X-CSE-MsgGUID: xXN0SPF3SVmdwzWZz8e08w==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99624813"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99624813"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:54:18 -0700
X-CSE-ConnectionGUID: VssSDn87TX+yEzICR7RrJQ==
X-CSE-MsgGUID: ltkS8nsKR3+Gk2b+T8sSmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273618677"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:54:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 13:54:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 13:54:17 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 13:54:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6LvTnn4x0UQmYUMmP5VXAia6XIueO2DNlZrl70H98/NIjnQYilM023RDVNsMUSE6RDLlPpx/GhsQfMebETt2EmDhVumsdhlUlIHf/1QMfvQEVIbkkc00/UDN38a4iWpzMnRgP12WVOG0pXUjxvWnS1g9s8mFUD+s8cflEQG6a6mXqWU9DLsac8emjnvV6lfA543r9AYJFATayUBjXMFftni4giUbjt5oeAZDRmUlS+bTxuwyir5Ruoj4/jkryni6JLwwmZpJzplEViLjyHLtUQoIQ5TZ5wf+yhL2SRL8+qVesXh6X8ZUKBKCocH9yUlS4otp9clypDpkQQGch0yOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T090jPHA6nZqpRx/FGEpf8H9pvezKXwKxbUXjMpU1GY=;
 b=ETUJI9Yr9r73fs93zN7EzCSCqKBPX3Cgml4FD+HJZYlmS4H+iw742vgfObzq0jgmrt2mnHvBzSP1AfzjnqTI/mnT5wfh00V2uI5K87L/5MJcx7zHPGJIAVA3ZVkZb1RRWQA3SbMNTGi4HLSbUxTyGBHHpNvfVsY8iIhwztBACnv1D8vYl6epCBgx3gCxEvexMLc77zZbQCChHdcA1udHymd5Fio6eUkVdpu5mDFlgHmykwLUdO5zg+4unMAGZNpbu3pJ8dlKVD/Id2vbiVErXN4MPIhNgO2YjYy2aMkPXWnqGL9bGg4fe9IhUwx6ogQmMDz1PCWwVNWerIVVfxW5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by LV8PR11MB8771.namprd11.prod.outlook.com
 (2603:10b6:408:206::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 20:54:15 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 20:54:14 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 05/18] platform/x86/intel/pmt: Do not remap when using
 callbacks
Thread-Topic: [PATCH v5 05/18] platform/x86/intel/pmt: Do not remap when using
 callbacks
Thread-Index: AQHdO+BS8hUDkGTzl0+ucDUSeBAS5La9TKSAgAAGZmA=
Date: Thu, 3 Sep 2026 20:54:14 +0000
Message-ID: <CH3PR11MB04614971B6089DC6F242C98E79C1B62@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-25-michael.j.ruhl@intel.com>
 <20260903202420.5FE301F000E9@smtp.kernel.org>
In-Reply-To: <20260903202420.5FE301F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|LV8PR11MB8771:EE_
x-ms-office365-filtering-correlation-id: 6f88b3ba-64a8-48de-3279-08df09fd8393
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|22082099003|18002099003|38070700021|11063799006|5023799004|3023799007|56012099006|4143699003|10067099003;
x-microsoft-antispam-message-info: arUp3dnXL4+X0wLJMOe9nYF5lrKv1a5UstXdC3MS0DsbrDabV2bpup8VAgSjRCiIAMwfyl5BxWBQpZqkUh7Uvf4rDkneJp4FrTD+BMdhbISOzqZR9I15NynRe6ww6/SzjacXU7WURoBGZ8j3u5RuPRDY4JTXrOE8eFn4Yr0CAAtM2t/uG9fZQAw2eDRSIZbfzSsiq+63QHiG/or0rV2e4MYUEnhnHtDCU/lI6Mtlo3X6MLjRLz1+n4eDGFa6vJ+PxiumJ5vYyqKVahD3mezDr1zQsp55ffCM64N53AmGuBXsUH75bghS32BuKQx+F9AW+2ZPTG3qjNfF/b+OsRjvR0+q1CGUTFhXrB+6O4JJLqeq/FC63+GUF5jEfCPKiglvk8y6IisXkESzbNQLfAf6ZsBmF2iZg4pfwNiFSVQYZQRlYP0CVoUXdMUnugZorH8f1IO8exueFgagrmyPhg4uNHC5L9rclbOCoR7ho+WghjXA33b85p9jBwtSmD/QVWOqtjoLSj1POcuWdMo5HTDcvQ2nceIjVpwho5LV6OHdzFd+G1N+FLc7Sp4NIim0a1t82k5CaOjAjnhaEyygM5JSRozNvd8uNR9gDijCm2WyuVa3O0OajNGWoKw3K5Jsgy+cKvZODlDRC1FVDgXPTjuJTEP+v0SYQhOGzrx1+Oc//gI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(22082099003)(18002099003)(38070700021)(11063799006)(5023799004)(3023799007)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bktxUy9OdEhFMTRUY2xqSFNjeFFOMGxuckNvL2VIUnVuVEs2Zlh1RmRuTjJk?=
 =?utf-8?B?T2QrSHZTODl0L3h5WFBlUHhBaWdtYUlGayt0RjMrc3B2V1E4T3d3endrWnQ0?=
 =?utf-8?B?MGdsaCtyQ0E5Y3RXOGtJaS92djVyZHk3aUhhM29JODlnM2xhaWNCeVF0cWdy?=
 =?utf-8?B?QnM2UDRwdk94NTA5OG03QmFVT00zT3IzYUE1UFBBNzY3YVgzdkVEd1NCS1dB?=
 =?utf-8?B?aThXVCtvdldZczh3RDZMUHZaWDE5eEhuQXc4U0o3dUhSUW4wT2ZNeTJYQXA1?=
 =?utf-8?B?S0NiUE5FeHZIbitOL2M5QXlBVlh6eXVHWlNLVVl0RUFDN2NvRy9leU9tS2No?=
 =?utf-8?B?MzVvN1pyQnBpalA1aEFoTUhVOU54S01idTdFZ0MzTHFEbm5KMklFRVd2dFJE?=
 =?utf-8?B?OExvUWFoUVQ2WlMvLzNucSs3RFhyOTVLMmUxWUdDRFZKeU9iZFdmQlBtSTUw?=
 =?utf-8?B?cFA5WVdOWVh2SkZzMXhNOXhQNEE1TmRjU2ltZ2xLVSsrb3FrR09vOG0wR3JL?=
 =?utf-8?B?aHNGQzRlQWRqUEozWVd6c0tDMzFYVndNZnAzTHFEYitQNlNBQ1hCYW9TMCta?=
 =?utf-8?B?VmFqSWpUYm9DTFdNUnhlRGRqYjRUVll6THkrMkZmUDN0ODNNNUpCbXlkaXpS?=
 =?utf-8?B?cjBDOUlkRDFaa2ZzaWhwZHZ4QlBJTnppUE0wWTZ1SmdqdUF1eTRHcm5lZzdq?=
 =?utf-8?B?VkRxekdlaXVDZ2luRGsrZk5GbjhZQjVrY3Q1NnJ4UklaNS9HOVdUVzNtUi92?=
 =?utf-8?B?Tkp6WitETmdLVFoxdVJxdlpPc0NwcXJLWVAyYkdjU0tkc1hXNCtuS2ZybFBz?=
 =?utf-8?B?QzNOcGp1djVjZE1VRTRtOVlDcy9YUjM1a0dRc1B0ek13WXpocFFaMllzMWR6?=
 =?utf-8?B?S0RWUEJzZEpUbmhteUlud0tzQnlCUGI5TTRFMm5WbXFhL2Jyc3NQZll3S0tY?=
 =?utf-8?B?RDBSaUNjRXlla1BUQ2ZxY2oxTUF3TERCWEpYOFhFZy9wQnNWMmo2OVRiZk1Q?=
 =?utf-8?B?VitVdWViOGsrdnd6VmR6T3FDUGFkRThMTjJyN3VnaUhSWU1IR0w4OUJjbEU0?=
 =?utf-8?B?SWMvTkoyRXRSakQ4ZXlteVNNZmhWZE5nbnpXSldET0VXcFdTQ1dwU2g3Mjdv?=
 =?utf-8?B?UVZuZldMYnBmVDhBaWo5bndqYVQxTFU3dkxVejVCS3dlWEl3Kzc5RjA1TFhW?=
 =?utf-8?B?dzV3Wmw4WVJxWmh3TzBBbVBmUnowQjZsU21SNm1sQ2VQcGFVaHUzdmtjcGgw?=
 =?utf-8?B?aWlWS3dLM2pHc2pSRHl3WjJvUDNCdFRHaG1lUXJWRitaMGJQbkFqSFRQTitQ?=
 =?utf-8?B?ZVBBWWJRYUorOWVaQWdDSG1oYnFJTXZvSjNacEJDMXZtY2g4T3ozMGdIMWpa?=
 =?utf-8?B?dW5MeDVoa3FvdC9oVGxmaHhqaU5MVHUraHNtSkhJeHJZK1BidTZpUUl6ekxB?=
 =?utf-8?B?RklJSzRzRE1zL1ozWis0ZnRRQk9LUFVPWmJTM2RpekpkWm5scjBGNnJvcmox?=
 =?utf-8?B?TUk4ZWYwV25mNnlIVEw3ejg0TGgzSmFha29icVN1Sm5DOEJ3TlNGZFJWb3VF?=
 =?utf-8?B?NGl2SUplL2dva0RReGFhRUNVQk9ZSThaajk3VVFzNXZGa3BXZ25PaEppWFZj?=
 =?utf-8?B?WWM5MFg2OHhWWEUzcHFPQWs2WFZoWkxDR0Z4RjZVUkRZd0lFTkpuOUswNTVl?=
 =?utf-8?B?K09BVVgxRm1FWEppZ1JYNmVNNkVBU2t3YWVFcHUwSnRXcFhIMHl4bjJ5dnpV?=
 =?utf-8?B?aXkxMDArblhJRisrTlpobHVqeTdVS3o3Vng1cFJoblZ4TGZ2aGcxMXdDZm82?=
 =?utf-8?B?UThFbG8wM3N2ZWEvaTZjcFk1Ykg5Y3IyRFBaSUQ4T1NmSUs4RlBIM2hFdmkr?=
 =?utf-8?B?eFBiRE93U0tacmw1TFo0WE9SQjBJK01yMzRlTXdoVnpML2ZaeWZZeFEvV1VN?=
 =?utf-8?B?c1VndTBGblQzUWdmdjJ0bld5T0I4V0tYM0ZWRkhFNHA2RWRRWU94M1FGeElt?=
 =?utf-8?B?V21LcDJueHdsTkp5SHpiRDgxR0huekVCd3I3aXQxcDdlWk43Y0JKZmQwNkdK?=
 =?utf-8?B?VkZHN0JTaUIxZSthN3NEQzNON1RmSTZWZDg4c0R2NU9UTVZ6YjJ5N3lKWTNZ?=
 =?utf-8?B?NUx3bFNzRmdOOWhFZkRKTkl1bGlGT1hRTWdpblRHME51T0ViazdBUkgxazhD?=
 =?utf-8?B?L1VwTEpBbDhjVmJPVW9WN0dTY2lCZ3p1bll6cXJUbVpxd1JnZnovOTBDZmdD?=
 =?utf-8?B?STVnMkhJaVFXREs5V1lLRDhpVGR2UVFTTHlCbllXZDJQSFVjWTVGSHBmblF4?=
 =?utf-8?B?SzREODd1Q3RSaU13eE5tbHVCeTMvaFBqc2pyYmJ0Vm05UXhzeEd5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: deuilkNwaOCLwu4h4e2T8ZCwab/UJyuFWt2NB0eSzOuFWf22AVEKxNycHd+kxLsEoTJGpQ5kHnaJLfbYkiBdStZyoY/0eTn+6uDdcjH8LhoonO0BJTy6UcOiXEBPBeID9pqaWYY7EMRqAQHwDtwOydOlBXXul/rhYBxmavL1YmFNZduN8sw5kbEheB6q6OEcYNwV5Y0oJfUl/yQHrxq0ndomaWtIIJ+zOnkmJD90w/mAsMSioDye9q4IXgb3YB44/1FcTaMsyQBI/uzYPCQloatgHqlE7bahaGZCQzFKIC1OYnL0mT09hOColtantP9bqbzgUoSUqMmo879XvrSdYg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f88b3ba-64a8-48de-3279-08df09fd8393
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 20:54:14.8120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p1GzjO7BFyb1XVaW2oO5v5SXd6aAFKd8ALZAUKbcDdHW8qpbUNsnJuXDbLSMHxu/2nLC5wrt47fkATypKMHL7GRjUMtXnLf4v5Kw0JAD7vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8771
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDMs
IDIwMjYgNDoyNCBQTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVs
LmNvbT4NCj5DYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogUmU6
IFtQQVRDSCB2NSAwNS8xOF0gcGxhdGZvcm0veDg2L2ludGVsL3BtdDogRG8gbm90IHJlbWFwIHdo
ZW4NCj51c2luZyBjYWxsYmFja3MNCj4NCj5UaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9u
ISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAzIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPmNvbnNp
ZGVyOg0KPg0KPk5ldyBpc3N1ZXM6DQo+LSBbSGlnaF0gTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNl
IGluIGBwbXRfdGVsZW1fcmVhZDMyKClgIHdoZW4gYWNjZXNzaW5nDQo+dGVsZW1ldHJ5IGVuZHBv
aW50cyB0aGF0IHByb3ZpZGUgYSBjYWxsYmFjay4NCj4tIFtNZWRpdW1dIFBNVCByZWdpb25zIHVz
aW5nIGNhbGxiYWNrcyBicmVhayB0aGUgYHRlbGVtZXRyeV9yZWdpb25gIEFQSQ0KPmNvbnRyYWN0
LCBjYXVzaW5nIEtVbml0IHRlc3QgZmFpbHVyZXMgYW5kIHNpbGVudGx5IGRyb3BwZWQgdGVsZW1l
dHJ5IGRhdGEuDQo+DQo+UHJlLWV4aXN0aW5nIGlzc3VlczoNCj4tIFtIaWdoXSBVc2Vyc3BhY2Ug
bW1hcCB1bmNvbmRpdGlvbmFsbHkgZXhwb3NlcyB0ZWxlbWV0cnkgbWVtb3J5LCBhbGxvd2luZw0K
Pml0IHRvIGJ5cGFzcyB0aGUgYHJlYWRfdGVsZW1gIGNhbGxiYWNrIGFuZCBoYXJkd2FyZSBwcm90
ZWN0aW9ucy4NCj4tLQ0KPg0KPmNvbW1pdCAxMmEzMTI5YmI2NGJjMWI4ZWMxZDJlNDA5Y2YxMWQw
N2I1YzdhMTRhDQo+QXV0aG9yOiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVs
LmNvbT4NCj5TdWJqZWN0OiBwbGF0Zm9ybS94ODYvaW50ZWwvcG10OiBEbyBub3QgcmVtYXAgd2hl
biB1c2luZyBjYWxsYmFja3MNCj4NCj5UaGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBJbnRlbCBQTVQg
ZHJpdmVyIHRvIHNraXAgY3JlYXRpbmcgYSBtZW1vcnkgcmVtYXANCj53aGVuDQo+YSByZWFkX3Rl
bGVtIGNhbGxiYWNrIGlzIHByb3ZpZGVkLiBJdCBhdm9pZHMgcmVkdW5kYW50IG1hcHBpbmdzIGZv
ciBkZXZpY2VzDQo+d2hlcmUgdGhlIHBhcmVudCBkcml2ZXIgbWFuYWdlcyBkYXRhIGFjY2Vzcy4N
Cj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY2xhc3Mu
Yw0KPmIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10L2NsYXNzLmMNCj4+IGluZGV4IDQw
MmQ1MWRmODM0YTYuLjFjN2EzNzJiNGZjNDIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3BsYXRm
b3JtL3g4Ni9pbnRlbC9wbXQvY2xhc3MuYw0KPj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYv
aW50ZWwvcG10L2NsYXNzLmMNCj5bIC4uLiBdDQo+PiBAQCAtNDAzLDE0ICs0MDMsMTkgQEAgc3Rh
dGljIGludCBpbnRlbF9wbXRfZGV2X3JlZ2lzdGVyKHN0cnVjdA0KPmludGVsX3BtdF9lbnRyeSAq
ZW50cnksDQo+PiAgCWlmICghZW50cnktPnNpemUpDQo+PiAgCQlyZXR1cm4gMDsNCj4+DQo+PiAt
CXJlcy5zdGFydCA9IGVudHJ5LT5iYXNlX2FkZHI7DQo+PiAtCXJlcy5lbmQgPSByZXMuc3RhcnQg
KyBlbnRyeS0+c2l6ZSAtIDE7DQo+PiAtCXJlcy5mbGFncyA9IElPUkVTT1VSQ0VfTUVNOw0KPj4g
KwkvKg0KPj4gKwkgKiBUaGUgcmVhZF90ZWxlbSBjYWxsYmFjayBpcyByZXNwb25zaWJsZSBmb3Ig
dGhpcyBtYXBwaW5nLCBhbmQgbWF5DQo+aGF2ZQ0KPj4gKwkgKiBkaWZmZXJlbnQgcmVxdWlyZW1l
bnRzIGZvciB1c2UuIElmIHRoZSBjYWxsYmFjayBpcyBwcmVzZW50IGRvIG5vdA0KPj4gKwkgKiBj
cmVhdGUgdGhlIG1hcC4NCj4+ICsJICovDQo+PiArCWlmICghKGVudHJ5LT5jYiAmJiBlbnRyeS0+
Y2ItPnJlYWRfdGVsZW0pKSB7DQo+PiArCQlzdHJ1Y3QgcmVzb3VyY2UgcmVzID0gREVGSU5FX1JF
U19NRU0oZW50cnktPmJhc2VfYWRkciwNCj5lbnRyeS0+c2l6ZSk7DQo+Pg0KPj4gLQllbnRyeS0+
YmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsICZyZXMpOw0KPj4gLQlpZiAoSVNfRVJS
KGVudHJ5LT5iYXNlKSkgew0KPj4gLQkJcmV0ID0gUFRSX0VSUihlbnRyeS0+YmFzZSk7DQo+PiAt
CQlnb3RvIGZhaWxfaW9yZW1hcDsNCj4+ICsJCWVudHJ5LT5iYXNlID0gZGV2bV9pb3JlbWFwX3Jl
c291cmNlKGRldiwgJnJlcyk7DQo+PiArCQlpZiAoSVNfRVJSKGVudHJ5LT5iYXNlKSkgew0KPj4g
KwkJCXJldCA9IFBUUl9FUlIoZW50cnktPmJhc2UpOw0KPj4gKwkJCWdvdG8gZmFpbF9pb3JlbWFw
Ow0KPj4gKwkJfQ0KPj4gIAl9DQo+DQo+W1NldmVyaXR5OiBIaWdoXQ0KPkRvZXMgc2tpcHBpbmcg
dGhlIG1lbW9yeSBtYXBwaW5nIGhlcmUgY2F1c2UgYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ug
aW4NCj5leHBvcnRlZCBBUElzPyAgV2hlbiBwbXRfdGVsZW1fcmVhZDMyKCkgaXMgY2FsbGVkIG9u
IGEgY2FsbGJhY2stZW5hYmxlZA0KPmVuZHBvaW50LCBpdCB1bmNvbmRpdGlvbmFsbHkgZGVyZWZl
cmVuY2VzIGVwLT5iYXNlIHdpdGhvdXQgY2hlY2tpbmc6DQoNCg0KcG10X3RlbGVtX3JlYWQzMigp
IGNhbm5vdCBiZSB1c2VkIGluIHRoZSBjYWxsYmFjayBzY2VuYXJpbywgc28gdGhpcyB3aWxsIG5v
dCBvY2N1ci4NCg0KPmRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtdC90ZWxlbWV0cnkuYzpw
bXRfdGVsZW1fcmVhZDMyKCkgew0KPiAgICAuLi4NCj4gICAgbWVtY3B5X2Zyb21pbyhkYXRhLCBl
cC0+YmFzZSArIG9mZnNldCwgTlVNX0JZVEVTX0RXT1JEKGNvdW50KSk7DQo+ICAgIC4uLg0KPn0N
Cj4NCj5TaW5jZSB0aGlzIHBhdGNoIGxlYXZlcyBlbnRyeS0+YmFzZSAoYW5kIHN1YnNlcXVlbnRs
eSBlcC0+YmFzZSkgYXMgTlVMTCwNCj53aWxsIHRoaXMgcmVzdWx0IGluIGEga2VybmVsIHBhbmlj
IHdoZW4gY29uc3VtZXJzIHVzZSBwbXRfdGVsZW1fcmVhZDMyKCk/DQo+DQo+W1NldmVyaXR5OiBN
ZWRpdW1dDQo+U2ltaWxhcmx5LCBkb2VzIHNraXBwaW5nIHRoZSBtYXAgYnJlYWsgdGhlIHRlbGVt
ZXRyeV9yZWdpb24gQVBJIGNvbnRyYWN0Pw0KPkluIHBtdF9jb3B5X3JlZ2lvbigpLCB0aGUgcmVn
aW9uIGFkZHJlc3MgaXMgcG9wdWxhdGVkIHVzaW5nIGVwLT5iYXNlOg0KDQp1c2VzIG9mIHRoZSBw
bXRfY29weV9yZWdpb24gY2Fubm90IGJlIGFjY2Vzc2VkIHdpdGggdGhlIGNhbGxiYWNrIHNjZW5h
cmlvLg0KDQpTbyB0aGlzIGlzIG5vdCBhbiBpc3N1ZS4NCg0KDQo+ZHJpdmVycy9wbGF0Zm9ybS94
ODYvaW50ZWwvcG10L3RlbGVtZXRyeS5jOnBtdF9jb3B5X3JlZ2lvbigpIHsNCj4gICAgLi4uDQo+
ICAgIHJlZ2lvbi0+YWRkciA9IGVudHJ5LT5lcC0+YmFzZTsNCj4gICAgcmVnaW9uLT5zaXplID0g
ZW50cnktPnNpemU7DQo+ICAgIC4uLg0KPn0NCj4NCj5UaGlzIHNldHMgcmVnaW9uLT5hZGRyIHRv
IE5VTEwgZm9yIGNhbGxiYWNrLWVuYWJsZWQgZGV2aWNlcy4gRXhpc3RpbmcNCj5jb25zdW1lcnMg
ZXhwZWN0IGEgdmFsaWQgYWRkcmVzcywgYW5kIHRoZSBLVW5pdCB0ZXN0IGZvciBQTVQgcmVnaW9u
cw0KPmV4cGxpY2l0bHkgZmFpbHMgb24gdGhpczoNCj4NCj5kcml2ZXJzL3BsYXRmb3JtL3g4Ni9p
bnRlbC9wbXQvZGlzY292ZXJ5LWt1bml0LmM6dmFsaWRhdGVfcG10X3JlZ2lvbnMoKSB7DQo+ICAg
IC4uLg0KPiAgICBLVU5JVF9BU1NFUlRfTk9UX0VSUl9PUl9OVUxMKHRlc3QsIChfX2ZvcmNlIGNv
bnN0IHZvaWQgKilyZWdpb24tDQo+PmFkZHIpOw0KPiAgICAuLi4NCj59DQo+DQo+Pg0KPj4gIAlz
eXNmc19iaW5fYXR0cl9pbml0KCZlbnRyeS0+cG10X2Jpbl9hdHRyKTsNCj4+ICAJZW50cnktPnBt
dF9iaW5fYXR0ci5hdHRyLm5hbWUgPSBucy0+bmFtZTsNCj4+ICAJZW50cnktPnBtdF9iaW5fYXR0
ci5hdHRyLm1vZGUgPSAwNDQwOw0KPj4gIAllbnRyeS0+cG10X2Jpbl9hdHRyLm1tYXAgPSBpbnRl
bF9wbXRfbW1hcDsNCj4NCj5bU2V2ZXJpdHk6IEhpZ2hdDQo+VGhpcyBpcyBhIHByZS1leGlzdGlu
ZyBpc3N1ZSwgYnV0IGRvZXMgYXNzaWduaW5nIHRoaXMgbW1hcCBoYW5kbGVyDQo+dW5jb25kaXRp
b25hbGx5IGV4cG9zZSB0ZWxlbWV0cnkgbWVtb3J5IGFuZCBieXBhc3MgdGhlIGNhbGxiYWNrcz8N
Cj4NCj5JZiBhIHVzZXJzcGFjZSBwcm9jZXNzIGNhbGxzIG1tYXAgb24gdGhlIFBNVCBzeXNmcyBm
aWxlLCB0aGUNCj5pbnRlbF9wbXRfbW1hcCBoYW5kbGVyIG1hcHMgdGhlIHJhdyBwaHlzaWNhbCBt
ZW1vcnkgZGlyZWN0bHkgaW50bw0KPnVzZXJzcGFjZSB1c2luZyBpb19yZW1hcF9wZm5fcmFuZ2Uo
KS4gIEZvciBlbmRwb2ludHMgdGhhdCBwcm92aWRlIGENCj5yZWFkX3RlbGVtIGNhbGxiYWNrLCB0
aGV5IHJlbHkgb24gc29mdHdhcmUgbWVkaWF0aW9uIHRvIHNhZmVseSBhY2Nlc3MNCj5kYXRhIChs
aWtlIHdha2luZyB0aGUgZGV2aWNlLCBhY3F1aXJpbmcgbG9ja3MsIGV0Yy4pLg0KPg0KPkNvdWxk
IHVzZXJzcGFjZSBjb21wbGV0ZWx5IGNpcmN1bXZlbnQgdGhlc2UgcHJvdGVjdGlvbnMgYW5kIHBv
dGVudGlhbGx5DQo+Y2F1c2UgaGFyZHdhcmUgbG9ja3VwcyBvciBpbmNvcnJlY3QgZGF0YSByZWFk
cyBieSBtYXBwaW5nIHRoZSBwaHlzaWNhbA0KPm1lbW9yeSBkaXJlY3RseT8NCj4NCj4+ICAJZW50
cnktPnBtdF9iaW5fYXR0ci5yZWFkID0gaW50ZWxfcG10X3JlYWQ7DQo+PiAgCWVudHJ5LT5wbXRf
YmluX2F0dHIuc2l6ZSA9IGVudHJ5LT5zaXplOw0KPj4NCj4NCj4tLQ0KPlNhc2hpa28gQUkgcmV2
aWV3IMK3DQo+aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTAzMjAxMDAyLjEw
NjQ4ODktMjAtDQo+bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tP3BhcnQ9NQ0K
