Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC533E63B2
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 20:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788468999; cv=fail; b=ACI8pPnIh9tfTj/r0lXQe98fn+LfpfaMCM+VanbHAxQamDnbqxvmZi8PtY/TXzjZSc9Qe/OakHSYqgBQMmYV3G1OMQgKfRcG3a/oDMRHRln/f7URdVemkXCpl953N1gNv0pIRZN2rgH0ncYKczyeG0vhcHLqKgAqRpRfRAvYRUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788468999; c=relaxed/simple;
	bh=vHZ2Rrq761XkCSFRzoBHBjKrj8X/IsD9QEKxjVygISE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o8jsM+PuNweTWWAyEN3y9HOuP4TwiRIfMbhGQRJCFPDL06SXe1wSqKjCpY77NouExnxnGVhmZnNta9QWjkUK73vmqSWXXVgR3GU6Nnq4AGDo9GfbVAVqfQGbtM3yd9CVTuKZcdQ6t4kt6FSZFxEBuBt9yy95lcSifrAFP61mZkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KapMmcui; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KapMmcui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788468993; x=1820004993;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vHZ2Rrq761XkCSFRzoBHBjKrj8X/IsD9QEKxjVygISE=;
  b=KapMmcuin8PE/qFAbIAWSHSTc40ZBa0thmRxot/RNI0zXbkwi1W8ZC7A
   5Ttj5/kdrGhBJ3Jfa35Q1Z2nE3XMuAWbUEaTfCFNSemepGt9KQupfBcA9
   J2n9BbTuHjT6AaWnOD2vGZhe6FZJJjM2P7uhBSUPDq07uVXLHQzWuKM2l
   GjvfgYSfT8veZ65+aWUe04g75wXX4KXKrho1pEOQiGLBPQDEXD+nSV3fl
   5m6L9S6tMnLY0eh+7F/yUfdUj1tabISlPwYDSM5jOFJrup8zzO3KsZC3H
   BEC+7pgzRfBdePqoyVnTO/G0mD1biY501ZQBpnqj5SmGPqVT/bE6e9E+v
   g==;
X-CSE-ConnectionGUID: QCO7JospSHKGhxJA43sRew==
X-CSE-MsgGUID: TYQ49qQRS8+3bD49ROjJ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100324439"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="100324439"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:55:35 -0700
X-CSE-ConnectionGUID: 0VDxTtxkRomkdkoeSgbrgA==
X-CSE-MsgGUID: lJRJ7N+LQFKGiqTgOxuH2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="271795542"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:55:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 13:55:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 13:55:34 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 13:55:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLrrwDv0b+956sSZNtMVSqJLQ5wflaCFpPV9K0ZqdlWwwITx0K7Oji5G5PtLLwY1XOGpBSQenSF+eIgwEsA0o3P4lFKtEcRA0SL4KSkbYsHZ0iKhy3Lzl2eDkUlYsCubS/IlKzUOLLHnxjRBOaYDtF18p7U4+rmTQaSOzBgIP27ws2UYVWr8op5lt6lpfQBIoLnHG9nmKhknr42QSVAzJLtRWG89fmoFWiaVkLQ2TD80PxCpwggJ31EOPnGCJXQxtOU+okaj7YfbeX7KtD2lZBeGwvOC9DD9/sikBVi3qUh4Rt4UD3I7GhbEtvIJvbQnKS0AeaFSlAZaSWIatJ2d1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHZ2Rrq761XkCSFRzoBHBjKrj8X/IsD9QEKxjVygISE=;
 b=DyXoDpp+DGA/zAtoq495CA4Jwy2IVgjjvq67Tbv/eiDms3G6RVFApgi1eqm0O9bMxBsxVdqo458jGeVcofUWz+IpmY/98QlkdRdj29K/uNVLrOhRqOA24m7SfP4JXxJCgvfOn3ScYzzNThXueC34O0qT3A37IszzrIoWjKVp4NBcWxwGTZXac68xQ3Q959pXJOmTIGD7ehX34jeoxCBaGKscRNCW2pHccNfE50DCAFwZD0uTBao8Aqi4jcwD6qivDVo3Rij/fdeJDBHte+0gBwiL1+zYOYc18xGnUtGjZiD3u2vUFRJT22QK26zaY/5Ycpfq9Le0mV354YoaD82bJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by LV8PR11MB8771.namprd11.prod.outlook.com
 (2603:10b6:408:206::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 20:55:32 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 20:55:32 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 08/18] drm/xe/vsec: Use correct pm state get
Thread-Topic: [PATCH v5 08/18] drm/xe/vsec: Use correct pm state get
Thread-Index: AQHdO+BWzSxKfZ2mlU2zFolKXnKQy7a9TUgAgAAH4/A=
Date: Thu, 3 Sep 2026 20:55:32 +0000
Message-ID: <CH3PR11MB046149F75D5A90D10C1FF2C56AC1B62@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-28-michael.j.ruhl@intel.com>
 <20260903202636.B1C511F000E9@smtp.kernel.org>
In-Reply-To: <20260903202636.B1C511F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|LV8PR11MB8771:EE_
x-ms-office365-filtering-correlation-id: 8e03f427-cd1f-4691-8dac-08df09fdb1d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|22082099003|18002099003|38070700021|11063799006|56012099006|4143699003|10067099003;
x-microsoft-antispam-message-info: DPXLaB71UkqjTlbRz3BvwiGhjYcCPXf4ashfdjh7vSNmSCVl2AzkDxrZjC0D94+GQUtN783+bMC96B7907wo54GHKvdMCxjLj2bRuDIncD+h9NV1yPUVrHeC/PtOEToDzVMASCZJuBqdK+CYSeFDNFjXLWx/g7tFofGnbaFJocR8artaP6B7gvi+8c8QneI2OxRyTguWRDMULASo1oiFW6rReQ8LhQDl+yqdFljXrwlBSbLJo4C6NkI+Ob9ECnsWghTU9fhkLphAYnaiqFN+RTa4s8KTaiEoS4VfXItfk1wR0RBSqIgMupoOyLMqhdW3Cgj+94brr+PbyVaPHHxQpLQ6bc0gpzm5OzA1raK6yYmN7K5CWvBUjo/mZ9ZGKKOYYt/IiKdXr36Mk2MLPOklI69/9mwS3eYUBVGAVkCh5rNgYwKKsrF+0IXLBwl46akc9X1px9jl0hN0RvWpPFKw+YHxTfAqH3B68tITdtUiJueCGFOJPx/6of8TeunFBN+x35aFLIi1uzFYOEcKa8/lDic6sT7upafI5FQEcVl9jwQ0dzrne/wpaoXN658eXJmVj16IsjZcGqWEvyrxft0gc4IOShOco5J0myxMxP2++tzihFjVETZaezy0b+c0qW95QpO2QT6+orLaGN+HxL15jKAFaMoAXGpEM4fPIhfxBts=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWtnSGhQUmg2SXJEZGc0RWtmcFEyVHY1emlESTFzR1kxSmQ2cWYwaUNvM3oz?=
 =?utf-8?B?VlNIWmFCR2hNanprK2ozL2ZjTzU3YlVBV0J3UEM2SFBvN1Jlb0NMakk0NXNO?=
 =?utf-8?B?dGdkbTFQakxVRXdlNVBRdlB5RHFuVDlYVlRBS1B3c080ZmNOYUJzQVM4YUtS?=
 =?utf-8?B?aGFBVU5VT04wb1BZdXJSQlpGTkdQRTVSL1gyS2tGMkw4elVNeXlncmVqYVd5?=
 =?utf-8?B?ZzhsSGxCSjVwU3crZmFjcFdsMlNDYTcva3VrSUVHUk5saWpXdFVUTXRwNGRU?=
 =?utf-8?B?OFZGQ0lxT1Z3YTh5L1lhYnFKR0NVSlFyempXZmZ3TmRPL05Fd2VEci9Wc1Vu?=
 =?utf-8?B?YlB1ekdUOHRtUVdrdFNQU3VndnpCYjh5bmZyMFUvYXVYeHZXcnpMckVMSEVr?=
 =?utf-8?B?d2h3RzJQMkZNYnVHRi9MTm5oZi90WlVBZC9pZUUxS2NvanhJTlM3VnZTTlRQ?=
 =?utf-8?B?UEV3NThENVNmUkZGSGJzdlF1ZmtnUHpVVzMyblY5SndlMUdHV0NPTzdocmt0?=
 =?utf-8?B?Yzc1dEF0cWVBbGRvbjBkSEp2RDhMWjd2Zlc1Z1VNODRjdzU4T0tPY2taQXla?=
 =?utf-8?B?Wm1QdUNDNUpocGVVZ3RGK290bmRpYU5xeU9ac0JCZ1FDVUloMEp6YmF6OGJB?=
 =?utf-8?B?ckx2d3QrN3FzWlU3N2lIVlNEckJSeC8vT3JaRndrcTNkVlRnem1ORGNJMC9a?=
 =?utf-8?B?RkRIcVd0ejdqeUMwdHN2WDdyRjU0MDhZVmZaMmlRMHVSVVVlMko4OWJhV05D?=
 =?utf-8?B?SHZUWS9SVjVaTWFsWXNFdktCY0VBT3RvOHg4ZlJaU01GckhEM1QwNkV0Rjg2?=
 =?utf-8?B?VnAvcGUzam12d0dicTZLdVU1WmVWLzlEOEtnQm9yelZpb0VNbkplM0tsbHdZ?=
 =?utf-8?B?dGYram5vQ01XbjJMdWI3VXJqRG9kYWRmSUx4WVJ5aU5leHl6M3BETWV0ZGtW?=
 =?utf-8?B?bHdxR3JiSnhNelJHVWZTbzUwNEE3RTB2b2xyUVAxWCtlN1ZpR3pFWkd3b2Vw?=
 =?utf-8?B?dGFKZmNzMGRTdnRPbGpWaGh4ZE9vNVFHNnRkaldSVmNSOGs2NjkzVW11eXJa?=
 =?utf-8?B?Vm9lZXFrQitTbWhzMzhGZzVvOGxXNFRnUFI1NlRLcE10TUp5cG9ILzdrRkE4?=
 =?utf-8?B?NSs0U0VuZzQ4Q2xLZUkvQkVGM3k0Vy9uSURPbkNPNm5GOGZ0dWo4OC9mdS9Q?=
 =?utf-8?B?TTdSTDhXZUxZUGZGdVFyL0Zmd2lqT0NkdHhSeUJmMmRDSVJFdG43VHErVUNi?=
 =?utf-8?B?aVdJUW1SZG5vTHdIWk01TG9LSVY2VGluMXAyRG9HcEVGbU95akg2ZHhUbHlz?=
 =?utf-8?B?ZG9xZTZPdVNPV0dDTzB6MmdQR0RocWFnUVNHK04yYm9BOUprRlQyTTFhMlhp?=
 =?utf-8?B?a1Nob0NkY21vMUJOMXprQXNDN1JMQmI3cnRkUkR5Vkc4NEhJNlBIU2c0eGlv?=
 =?utf-8?B?Szl2OGJ3OWJRd2lXYmpUZ3phUXZHT3AxQUk5QUNGRXNzdUpoamdGWU9ZYUY3?=
 =?utf-8?B?QWE4cFZWQS9TNC9wbEl3ZkljQktDTG1pSVBORnYxZ1FxdklNZ0NDMzZrUXhr?=
 =?utf-8?B?N1hLTXo3UE9Dczg0bHNGQ1YrL00xL0FlVFJnaGZhNzFHWlltbzBscUw1ZVcx?=
 =?utf-8?B?QnFmamRHOVN0K3ZzUGZidlBsY0R6QXNPRnduT2NNNnBtVHkwRGNldk9jT0FF?=
 =?utf-8?B?UkhnNmlUV1RWTHlTeWZnQWJYN2xObld5K094UmxOZ0hHSzg3M3lsWCtoZlFa?=
 =?utf-8?B?T2FBeGtDMkwwMkxJdlNxd2hCT3Z5WWpsbStKS0RnTnJScGt0M3V4aFFVaGlv?=
 =?utf-8?B?aEJnOWlMZU5jMVF2ZW9wQ0VVdFd1NzJMMjZVU1dhN1BDQjJodjNvbEI4RlA1?=
 =?utf-8?B?cCtQVytnMjNLRVRXZkZBdURhNFA2cTNaSmErdVlWZlVrTlA2R2VxVVdSWkNP?=
 =?utf-8?B?dzAwaGRyb2dIWlhIa0dJeG9sclhDaHkrS0d0NHpFWkRwaGF0TFBEQzcxVk9m?=
 =?utf-8?B?ZEVuK0N2N21rTnN1KzdKZE5vUFpqSE9EMHFGT3FsWWVjZjlNY2hycksxRTJK?=
 =?utf-8?B?QjRsWXdrbStTb25sRmF1bzNTQWZjMjcyMGdHNDQ3YldVNDcrZFNuNUprMXln?=
 =?utf-8?B?RmxKaGZnNVRLaWZ5NGJ4TStZZENnUUt4cU9sN1ZLcWkrMzZsa3ZBWjlSNUhV?=
 =?utf-8?B?WGM0R0RyRzluMjlTcTBxeXpDdzd0K2d4bHIyQjVQTytYMU85aE92N214a0Jm?=
 =?utf-8?B?a25qSTBmT2VsK1R4NENUQ0FhbHRWOTZWbkxQRkcwclJtSEF1ZXBmVTlNSDda?=
 =?utf-8?B?d0s5QW15L2NHem03dXZiTTFoZHU0aWxQYmRGUXg3RnpSZmtRZUlqQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GgghXjenNATvVAvZ92Dz5YhiWwdEzKvZzDzOIhRSXwMzPg7BoLbgyurhUmRGBrjfTjZjuc+hE7xzCGp4kjk2scFIe24Hluk78ZwM6lWjxtcGEEbb6/tKvC3JQNjZiGdQOL6w2yarPUi2qKNAZ7a3bz67irs/HBrInhBtO8hFpeYyAjpyLUxWIeahmqjRmDgfQwnWdTwuh+71WdXognjgDuaCKV0ckPnv63NL9foyHm3KAoIbGFrAYIJt3iocBIbUgm/Lr0NIjCfEubldmwmrzmQKmmAXOd7x9A8p8HwGI5XtoB2pZ4gFxvEZi6f94SZofU07iww34RWO/DW1vBDELg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e03f427-cd1f-4691-8dac-08df09fdb1d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 20:55:32.4004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7XZN192zeihW+YErVnTRGEekoYkk2+mb1D/rouqlT1PW8y6PqUm/hoq1IMZ6/DnZ4n4ay3Sr6weUzpl1j6tPGPPAz+CRzWCLbwGMJAGSNi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8771
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDMs
IDIwMjYgNDoyNyBQTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVs
LmNvbT4NCj5DYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogUmU6
IFtQQVRDSCB2NSAwOC8xOF0gZHJtL3hlL3ZzZWM6IFVzZSBjb3JyZWN0IHBtIHN0YXRlIGdldA0K
Pg0KPlRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZv
dW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvDQo+Y29uc2lkZXI6DQo+DQo+UHJlLWV4aXN0aW5n
IGlzc3VlczoNCj4tIFtIaWdoXSBNaXNzaW5nIGAucmVhZF9yZWdgIGFuZCBgLndyaXRlX3JlZ2Ag
Y2FsbGJhY2tzIGluIGB4ZV9wbXRfY2JgIGxlYXZlcw0KPlBNVCBjcmFzaGxvZyBjb250cm9sIHJl
Z2lzdGVycyB1bnByb3RlY3RlZCBhZ2FpbnN0IGFjY2Vzc2VzIHdoaWxlIHRoZSBHUFUgaXMgaW4N
Cj5EM2NvbGQuDQo+LS0NCj4NCj5jb21taXQgYThiYjQwNjM4MjY2NDY0OWRkZTk3YWVkNDM1ZjE3
YjZjZmQxNTM2Yg0KPkF1dGhvcjogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBpbnRl
bC5jb20+DQo+DQo+ZHJtL3hlL3ZzZWM6IFVzZSBjb3JyZWN0IHBtIHN0YXRlIGdldA0KPg0KPlRo
aXMgY29tbWl0IHVwZGF0ZXMgdGhlIFBNIHJ1bnRpbWUgY2hlY2tzIGluIHRoZSB0ZWxlbWV0cnkg
cmVhZCBwYXRoIHRvDQo+ZW5zdXJlDQo+dGhlIGRldmljZSBpcyBwcm9wZXJseSBhd2FrZW5lZCB3
aGVuIHJlYWRpbmcgY3Jhc2hsb2cgZGF0YSwgYXMgY3Jhc2hsb2cgbmVlZHMNCj50byBiZSBjb2xs
ZWN0ZWQgYXQgYWxsIHRpbWVzLiBJdCBhbHNvIGFkZHMgYSBjaGVjayBmb3IgdGhlIFdBVENIRVIg
Y2FwYWJpbGl0eQ0KPnR5cGUgZm9yIGNvbXBsZXRlbmVzcy4NCj4NCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMu
Yw0KPj4gaW5kZXggZGQ3NzIzYmE2YzFjMi4uNDY4YTIyMTM3OGZhZiAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV92c2VjLmMNCj4+IEBAIC0xNTgsOSArMTU5LDE4IEBAIGludCB4ZV9wbXRfdGVsZW1fcmVh
ZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMg0KPmd1aWQsIHU2NCAqZGF0YSwgbG9mZl90IHVzZXJf
b2Zmc2UNCj4+DQo+PiAgCXRlbGVtX2FkZHIgKz0gb2Zmc2V0ICsgdXNlcl9vZmZzZXQ7DQo+Pg0K
Pj4gLQkvKiBpbmRpY2F0ZSB0aGF0IHdlIGFyZSBub3QgYXQgYW4gYXBwcm9wcmlhdGUgcG93ZXIg
bGV2ZWwgKi8NCj4+IC0JaWYgKCF4ZV9wbV9ydW50aW1lX2dldF9pZl9hY3RpdmUoeGUpKQ0KPj4g
LQkJcmV0dXJuIC1FTk9EQVRBOw0KPj4gKwkvKiBBbHdheXMgYWxsb3cgY3Jhc2hsb2cuIFRlbGVt
ZXRyeSwgb25seSB3aGVuIHBvd2VyZWQgKi8NCj4+ICsJc3dpdGNoIChjYXBfdHlwZSkgew0KPj4g
KwljYXNlIENSQVNITE9HOg0KPj4gKwkJeGVfcG1fcnVudGltZV9nZXQoeGUpOw0KPj4gKwkJYnJl
YWs7DQo+PiArCWNhc2UgVEVMRU1FVFJZOg0KPj4gKwkJaWYgKCF4ZV9wbV9ydW50aW1lX2dldF9p
Zl9hY3RpdmUoeGUpKQ0KPj4gKwkJCXJldHVybiAtRU5PREFUQTsNCj4+ICsJCWJyZWFrOw0KPj4g
KwljYXNlIFdBVENIRVI6DQo+PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4+ICsJfQ0KPg0KPltTZXZl
cml0eTogSGlnaF0NCj5UaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgc2luY2UgdGhp
cyBwYXRjaCBpcyBhZGRyZXNzaW5nIFBNIHJ1bnRpbWUNCj5wcm90ZWN0aW9uIGZvciB0aGUgY3Jh
c2hsb2cgZGF0YSBwYXRoLCBpdCBzZWVtcyB0aGUgY29udHJvbCByZWdpc3RlcnMgYXJlIHN0aWxs
DQo+bGVmdCBlbnRpcmVseSB1bnByb3RlY3RlZC4NCg0KdGhlIGNvbnRyb2wgcmVnaXN0ZXIgQVBJ
IGlzIG5vdCB1c2VkIGZvciBCTUcuICBTbyB0aGVzZSBjYWxsYmFja3MgdG8gTk9UIG5lZWQgdG8g
YmUNCnBvcHVsYXRlZC4NCg0KDQo+V2hpbGUgeGVfcG10X3RlbGVtX3JlYWQoKSBub3cgaGFuZGxl
cyBQTSBzdGF0ZSBjb3JyZWN0bHkgZm9yIGRhdGEgcmVhZHMsDQo+eGVfcG10X2NiIGxhY2tzIC5y
ZWFkX3JlZyBhbmQgLndyaXRlX3JlZyBjYWxsYmFja3M6DQo+DQo+ZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3ZzZWMuYzoNCj5zdGF0aWMgc3RydWN0IHBtdF9jYWxsYmFja3MgeGVfcG10X2NiID0gew0K
PgkucmVhZF90ZWxlbSA9IHhlX3BtdF90ZWxlbV9yZWFkLA0KPn07DQo+DQo+V2hlbiB1c2Vyc3Bh
Y2UgYWNjZXNzZXMgUE1UIGNyYXNobG9nIGNvbnRyb2wgYXR0cmlidXRlcyAobGlrZSBlbmFibGUs
IGNsZWFyLCBvcg0KPnRyaWdnZXIpIHZpYSBzeXNmcyB3aGlsZSB0aGUgR1BVIGlzIGluIEQzY29s
ZCwgcG10X2NyYXNobG9nX3JlYWRfcmVnKCkgYW5kDQo+cG10X2NyYXNobG9nX3JtdygpIGZhbGwg
YmFjayB0byBkaXJlY3QgTU1JTyBhY2Nlc3M6DQo+DQo+ZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50
ZWwvcG10L2NyYXNobG9nLmM6cG10X2NyYXNobG9nX3JlYWRfcmVnKCkgew0KPgkuLi4NCj4JaWYg
KGVudHJ5LT5wZGF0YS0+Y2IgJiYgZW50cnktPnBkYXRhLT5jYi0+cmVhZF9yZWcpDQo+CQlyZXR1
cm4gZW50cnktPnBkYXRhLT5jYi0+cmVhZF9yZWcoZW50cnktPnBkYXRhLT5jYl9kYXRhLA0KPm9m
ZnNldCwgcmVnKTsNCj4JKnJlZyA9IHJlYWRsKGVudHJ5LT5kaXNjX3RhYmxlICsgb2Zmc2V0KTsN
Cj4JLi4uDQo+fQ0KPg0KPkJlY2F1c2UgdGhlIGNhbGxiYWNrcyBhcmUgTlVMTCwgdGhlIGZhbGxi
YWNrIGFjY2VzcyBoaXRzIHBvd2VyZWQtZG93biBQQ0llDQo+TU1JTw0KPnNwYWNlLiBEb2VzIHRo
aXMgY2F1c2UgUENJZSB1bnN1cHBvcnRlZCByZXF1ZXN0cyAoVVIpIGFuZCBsZWFkIHRvIEFkdmFu
Y2VkDQo+RXJyb3INCj5SZXBvcnRpbmcgKEFFUikgcGFuaWNzLCBzeXN0ZW0gZnJlZXplcywgb3Ig
cmV0dXJuaW5nIGludmFsaWQgZGF0YSB0byB1c2Vyc3BhY2U/DQo+DQo+Q291bGQgLnJlYWRfcmVn
IGFuZCAud3JpdGVfcmVnIGNhbGxiYWNrcyBiZSBhZGRlZCB0byB4ZV9wbXRfY2IgdG8gcHJvdGVj
dCB0aGUNCj5jb250cm9sIHJlZ2lzdGVycyBkdXJpbmcgRDNjb2xkPw0KPg0KPj4NCj4+ICAJbXV0
ZXhfbG9jaygmeGUtPnBtdC5sb2NrKTsNCj4+DQo+DQo+LS0NCj5TYXNoaWtvIEFJIHJldmlldyDC
tw0KPmh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkwMzIwMTAwMi4xMDY0ODg5
LTIwLQ0KPm1pY2hhZWwuai5ydWhsQGludGVsLmNvbT9wYXJ0PTgNCg==
