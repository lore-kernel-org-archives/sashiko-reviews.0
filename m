Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666212E7375
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 06:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791180792; cv=fail; b=tTgmx6nhkIPCdfkQFb/xyruDHsd84NBq9ZglFWAkk96rNlUaEZwEr80b5SVtpiI4Ko6kri6YdoGd9ILScIoLqnvxLtB/AorPqHx1cBmKXuNzggbMJ5pbuu38R4u2Z5mcKztwVHYrEREV1DJU8FeBvEmGWV846vYSb1vPwaRd0yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791180792; c=relaxed/simple;
	bh=Y1H9GTV9Lretrnr7mfV7jC1btPDff8yNHSMWkD8tRyU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NPDNAAvYZYCUqFyGsMDdxdDhw3vV31wFKkMDyM8jSXjGagty3Lg3n8CPuWH0ND8GNx/fJhFlaPVWWb2gRirQ2oQnH8y35Pz35Hacy4cR17LerywrQrJKLVaIX2ij73fuMcnpuUjPP5M2twsNl+i2M9SsaflLy81xUWo+qn4DpsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9iuSnxF; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9iuSnxF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791180789; x=1822716789;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Y1H9GTV9Lretrnr7mfV7jC1btPDff8yNHSMWkD8tRyU=;
  b=I9iuSnxFBsneEbS5cNUKgKJbfg10uoxlQk8Szi4vkGlp+83iTyO2y7jG
   quUbAC7EP/BLm3Nwa+gMtPFF06mfuDrOB/ggnKxUdP2eCfQ3WRSzb6ilv
   dWsDcIIn6Njs15REVREUg26BTMmi+Td+qVcXfdGo5/aHoDue4RO6YGLhw
   hPyUtUtMp9snEyc9JH80d2y5i/nITLLtFpDXDPDA96GIuDGb2hsT0zuN3
   QKtCDsigbgP1kjh5NK657r8ypL/EzsameFSbW8UCy9WlVpOI6vpBxtkfp
   CXilPsZ8Ay6b5hQ8lzMoS21qoEpuLdjSLne4goPLw/kU7bsClVYrmleS/
   w==;
X-CSE-ConnectionGUID: VM/P8fG8S4ana2jl5pyEog==
X-CSE-MsgGUID: oeeQDUMmTu2JrCh9u18EEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109332081"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="109332081"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 23:13:09 -0700
X-CSE-ConnectionGUID: AwH0v3dBSGSiZpkfuGdoiw==
X-CSE-MsgGUID: pIrWcaz7Q3OVCkNMEppf+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="280010933"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 23:13:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:13:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 4 Oct 2026 23:13:08 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:13:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suR6NY6QPltYEKaXdaltoi/26bri0fGSoblnIwiqKu3ZfM2uSgWjiOR2UCa+Jvw7KOLfsSyaXChpp59izoMLiCGXio2WcM+Wy65klTwgx6PRB1RRLt3YG7TyXeoi82YpiPE901ab3MH1iIBoeWLrjCVEuEOKWjygfgA8RvzfXsQrQ9oPwRTuE68tsSrOYLgYCh1Bo/+KZlqdRZlUlYMfsuE0XZW/VanzZYtfIquLQrergMUpetnncfklWBQXEqFHCEBzx2hIPSaB1bMrXshasVDCfwwarH6KnnJkQNuB/UIqpq8YH75ctbbkbHZK4VAJbBO7hErN7qZR63EFwnYQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1H9GTV9Lretrnr7mfV7jC1btPDff8yNHSMWkD8tRyU=;
 b=hb1c0CO7bW8KNpWS4PjyL7q92HOpZsCmo1Jbb/OSg2/9LVOuffntC3d1lC8OSOHYVjw1UzHVM9RalpN3A7WpMcpp+mf/x179LRQSaCGkUUALsTjRgAt6zytfgCn/lLC8kNV1cZkYFlRKAVq4EAy+rpT9AI7Q6ZS8dXkKf1aYimfHkokHkTz8S+VwbovFHAvbDoWQWP4043W8DPiWFWGvczYGfaWwgv56yBoDMedUkvg1t/QQdbEqW/oVcYNcDk3lAA3v13o+CnUfF+w4oS1rnlgQX3/yBLP5poZPiT4AcolxGN9GBJlpoDUKN56tZUi25LlQOdz1ure4SpY/US6Urw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DS0PR11MB8762.namprd11.prod.outlook.com (2603:10b6:8:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Mon, 5 Oct
 2026 06:13:04 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 06:13:04 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/xe: Keep VRAM fault injection within the usable
 range
Thread-Topic: [PATCH 4/4] drm/xe: Keep VRAM fault injection within the usable
 range
Thread-Index: AQHdUYmozQxrPa/7DEKKIX4BZTgDO7bodIUAgAYJDGA=
Date: Mon, 5 Oct 2026 06:13:03 +0000
Message-ID: <DS0PR11MB8718F96A9D08D9412F93915081962@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
 <20261001094518.1493651-10-tejas.upadhyay@intel.com>
 <20261001100116.82D1E1F00898@smtp.kernel.org>
In-Reply-To: <20261001100116.82D1E1F00898@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DS0PR11MB8762:EE_
x-ms-office365-filtering-correlation-id: 7ddb78b9-9feb-4e2b-1462-08df22a7b786
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|6133799003|3023799007|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: /cOfU0Mk/7PkjKZ1H6q0brS3fjwjt7QsUxNfVp0m3V2dvgCXCNxjZQLcvghiU/bfED4bsIO9QYJa5zBWVKoY9WY5uhbq+4UrRj5Pd+Jhdqbma+T1jbvH961/qGNb+JI9E8Ilwgnq0Q2aIIa8K/gvSFpEkD0OLHPAEMyp8fKzcRiBB+58ijyzCyqqNdTq7WYPXF6yH2ClFiPdu/j30nxYNejeIfEQtvZmQCFV4j5uDl9javF3rG/z7yOZP6xvja5ZTt2b/8dBUDdkuygm2Gd3TR0gKEYwflMA4ReIZFZoIxgRAQLt4ADMZRTq/lVgXkzNyI3MlLGdN3F/R2SFr2vUMwb1q5dXAFEwHhOSJ0Xkamaxe5R5l47In7IELyeuxab21MtYmNmbg3KcOiXQM46EVAvk0fsU4dk3YHIRu5eu+wtizmuHRq4HD7OybPflafWAiTNlKE09HFjWFCRjM2VP0JT3QbpMtmKWSm2aKPYZObhA/POz6/sRFW5FgHlPd2FozKXqckhmmaNLnl67fUi+GYH9S1CgrFw/V6sY19wTiAX/3xKv82Hl9QEPAKGYqFdXHs+1MQiCjjQwP9mRIcjD9IP/wKQUm4KEfASJIdrkOXaUc57DTjOmGIQ64esbxQlL9ZBtiefSVkMKajgdkRdqrurRA7qkU41mS4NvM5TQaqA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODllR3Q1Q0pQL2FDNzNyN1dnQ2hHeEt5akd6LzhVV2I3ZWxNK2EwaktkaTYr?=
 =?utf-8?B?U3o2bG5FeFhMUTdJb2FpRGxaNDlUVnBSVVc2THcrVElDVXVIK2dJN0lDT1Ex?=
 =?utf-8?B?RGhvTzliUEU5Ymk4Q2ttekIzSThhNUQyM0UzbDJtQ1I0RUlWaktob2RCQnph?=
 =?utf-8?B?djZjNEVWWk95eXEvbStwRXg0RnFweEhXcHVEdEQvSFB3bTJ4bXlmakNmU25Y?=
 =?utf-8?B?aXl0TzBIaVhNUkN0ZlVHYS9vNEMrZTZUVm5MSC9Qd0t3MlBIeXRUa3R4c1l1?=
 =?utf-8?B?ZEpGQk1CM2V1c1cwTW9lbVVYZGxaWCtyZTE2YzlydTlPV09KZWFkRDZnNXUx?=
 =?utf-8?B?MXU3TUlEMFZlZm1NYncwQWJwT1M0Y2NNWkxteEl3RjZwZmF1MGNwbnB2VmtE?=
 =?utf-8?B?bHFqc0NPVkxTbGFsMWlaMEhqeWdZWDJ6bDE0ZmVodGM4SnNYRWlRek5Sb2cz?=
 =?utf-8?B?bXlsVzFaandZbnkrQytaakFtbzYwYk5uT2t4TEYza3BLem5ySHZBeTZYQ0ky?=
 =?utf-8?B?cXA3RkNpSUQxVmRuYkkvY2djWnhwRnFtdjFXeWExTktVb3pXd2lkelRjVkpu?=
 =?utf-8?B?MVpXd3B4U2VPUUhrS3lXc2RFUGVhMUV1WkRRV0VPL2dvTjlOVU93TTdIelN6?=
 =?utf-8?B?a3hheE1EbHZBNE1oQVcyMmJhUHZ1VVBiak1Hc243VnpsU1pMOG0wZ3R1TEpM?=
 =?utf-8?B?N1B1YVhrdGsxR3JnVmk5cFVwTHZ0VytQMDhvVVlHbXFCSE80TkNIYWJ4ZS9Z?=
 =?utf-8?B?L2R1S0RYc2F5TXdmTlUwbjI2SXBZK3FTM2NsVEgxU3NzSnYralZ3U3dkQkJt?=
 =?utf-8?B?UEZrSldGamc2YlE2K0tuV3d0ckxjd044ZzdLcURKZHFLZFBzYWNkMTJjMDJv?=
 =?utf-8?B?SXF2aVZvRlV4ZUtHMmkxNE1JV3E2WHp5WnRvK1pwcjREV3F0eUVIVVZqVkl3?=
 =?utf-8?B?Y29LZlIwM0FqWi9ienZPNjlXYzFjcjlQZDhmQ3JDSjRjclVqR0lRTmlGb3NR?=
 =?utf-8?B?Y0VBUVY0YzlhTGpXeTNRRDZrY2NmeCtoN0JoUHR1WUR4eUJBc21VZXBOZ2xY?=
 =?utf-8?B?VE1wRFJPL2xlRVBqM1hhZ0tySjMxemRYT0hvNkVjOGZuOVRPQ09McDZoNExT?=
 =?utf-8?B?YzZLaWE4cFlwSW1yaVR3U0RHZzlSVjRHNm5QeThWQXNCVkQyMDE3Q2N3QlJ1?=
 =?utf-8?B?WjgwRWYvV3BCV0VWdERXNW52VmIwQ0xwS1l1dVQ1M09EZ3JMMUVYWXhYQkpC?=
 =?utf-8?B?TUltdVlXQjJHOVluNVZmZkJjWXJVQXEzUjE0ME41SmJkaHBJMlFzOUVpdGRQ?=
 =?utf-8?B?bzJwQ3pxQ3hQaVROWGIzdXMwVWNMV1Y1L21NVVlYRjhHbC9YOHNYL29VTERa?=
 =?utf-8?B?WjhPdnAxVjNnRy9lVzljUG9nOVJ3blhQUGVLeHN6WnFDMXVpQmhiMFFxRmw3?=
 =?utf-8?B?Y2FPRWxTZGNwQnBKN3ZrQzFYRjJzVGJyZElaUkUwZDdvd2QxZnFPMXJDRHpu?=
 =?utf-8?B?RmNYVmNhRHhmcm9kS1ppYm8zSlN2NE9EdDRpS0lvSUFzcUFkaXUwWFhoVE9Z?=
 =?utf-8?B?T2xGUEVrVHc4elpNSGNBanNQWi8rbjh5R3FtTyttM1Fha2RLS1pIb0wvU2Vt?=
 =?utf-8?B?Z25GV250N05yKzg1OHVOL2dHT25xNWNjb3Q3UW1URjZDYTB1VUFPcnR4MHpx?=
 =?utf-8?B?YWVUeWdBZzVoWitXVERTWWlnWU82ZXhJOGJUbGM4R3ZTN1JvRlZzS09ZTU5z?=
 =?utf-8?B?VnV1WEpWaDYxeHhPSFh1SnBBcTVqbzkvcWY3cTQ1WGFJUjFFUnJPTThnYnJZ?=
 =?utf-8?B?SHVHcG5uUjNkYlJCb3pNMHprOGhxUjVyUmE2MitLdkkzNXdHcklRSklaMjQ5?=
 =?utf-8?B?S0tEdzZHSE5oU2wybFl1bjlVTnhzSjhyZThvNm5CazIwS3pVOHpxZ2huM3Jo?=
 =?utf-8?B?d0FHNWhLUk1GaVFvZ2o1N0NFSHEvV2QrcDVjYXp0dlpYMWY3TTVEQ0ZkdHg2?=
 =?utf-8?B?L1NOT1JadjdsRm1CUUV6cGZmaHFpWXdBUWVUekZYZGVwcGVlRWJlYVhOd2NL?=
 =?utf-8?B?YUZaVjUwcnhyMW9yZVpIaUc5azl5MFlPd2lwQWtVcUp1b0pjalg2dGtpUHAr?=
 =?utf-8?B?d3Vqbm0yanVmeE10UzRCUHlOaVN2QytxNWZLc01MbEVaNEYvR0YzU0ZZQTRZ?=
 =?utf-8?B?OWpzbkdVNVhURVZuVGNkbWI0NFl3NHZoM2ovN0pCUWw3d0h6NlN1SXRpcVpV?=
 =?utf-8?B?eE1WVXdmdUtOV2tKNld5dW1VL1NYYVh3VnQyamQwSFZzc2Q4Ni80LzJjMG9L?=
 =?utf-8?B?SEZhYmg3Zmx2QnJ4UStXbjRqMFNTSHR4ZWZpNElFQ3RyczFOdmlJQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vJEQSnDJXCmb5ucIlB1eRAzL1lMgTe9GTyJWgCsbqLPn+dfyeaDr0ztyqCTlizPlR6NDuqy7ST3xBhiwaPJsC69oVhP7/wFVrSlsPHkHl0K9VDMinAO6TjLqiv7f4ofI2qGCvD8fO1ioRlX3NLCRjaSCUCdEBfI6uW7LVw6OH+nn950aneQDA351qjboM+a0dIinBQYZHObCskIBroriAArZCOieKnxe3ja5CRjP5mGUc5glIi6azferO/iWZsfzXOkrQMqrnuI3QRtunn+o4t+gVIlTXZqaaumhqxO0/F5phhWGSsUQNSC18+uQwT0dKNwVZJ6PBC+y38CSsME63w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddb78b9-9feb-4e2b-1462-08df22a7b786
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 06:13:04.3623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BFWEJ62hKgGuoUnHnwzGQLNUXy56HwqZEos4f9uZPhf7fv9texhhd/RxIOe0g1/ruhKFtfdRFj71tclZgf2XsCDDzqxXnMyuC3Z9NuBlqcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8762
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMDEgT2N0b2JlciAyMDI2
IDE1OjMxDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4N
Cj4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDQvNF0gZHJtL3hlOiBLZWVwIFZSQU0gZmF1bHQgaW5qZWN0aW9uIHdpdGhpbiB0aGUgdXNh
YmxlDQo+IHJhbmdlDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNo
aWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKQ0KPiB0byBjb25zaWRlcjoN
Cj4gLSBbTWVkaXVtXSB4ZTogdW5hbGlnbmVkIFZSQU0gZmF1bHQgaW5qZWN0aW9uIGFkZHJlc3Mg
b24gUEFHRV9TSVpFID4gNEsNCj4gLS0NCj4gDQo+IGNvbW1pdCBlYzBjMzljNTY3ZjQxYjFjOTg0
N2E0ZjcyNzBhMmU5MjZmN2E1ZjliDQo+IEF1dGhvcjogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVw
YWRoeWF5QGludGVsLmNvbT4NCj4gU3ViamVjdDogZHJtL3hlOiBLZWVwIFZSQU0gZmF1bHQgaW5q
ZWN0aW9uIHdpdGhpbiB0aGUgdXNhYmxlIHJhbmdlDQo+IA0KPiBUaGlzIGNvbW1pdCBjaGFuZ2Vz
IHRoZSBmYXVsdCBpbmplY3Rpb24gcHJvYmUgaW4geGVfdHRtX3ZyYW1faW5qZWN0X2ZhdWx0KCkg
dG8NCj4gc3RhcnQgYXQgdnItPnVzYWJsZV9zaXplIHJhdGhlciB0aGFuIHZyLT5hY3R1YWxfcGh5
c2ljYWxfc2l6ZS4gVGhpcyBrZWVwcyB0aGUNCj4gaW5qZWN0ZWQgZmF1bHRzIHdpdGhpbiB0aGUg
YnVkZHktbWFuYWdlZCBWUkFNIHJhbmdlIGluc3RlYWQgb2YgaGl0dGluZyB0aGUNCj4gQ0NTL0dT
TS9EU00gaW5mcmFzdHJ1Y3R1cmUgem9uZS4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3IuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3R0bV92cmFtX21nci5jDQo+ID4gaW5kZXggNzIxMWFiNWY2NmU5Yi4uZWMxNWVhYjFhMmVkYiAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmMNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmMNCj4gPiBAQCAtOTg4
LDExICs5ODgsMTIgQEAgaW50IHhlX3R0bV92cmFtX2luamVjdF9mYXVsdChzdHJ1Y3QgeGVfZGV2
aWNlDQo+ICp4ZSkNCj4gPiAgCXN0cnVjdCBncHVfYnVkZHkgKm1tID0gJnZyYW1fbWdyLT5tbTsN
Cj4gPiAgCXU2NCBhZGRyOw0KPiA+DQo+ID4gLQlpZiAodnItPmFjdHVhbF9waHlzaWNhbF9zaXpl
IDwgUEFHRV9TSVpFKQ0KPiA+ICsJLyogU3RheSB3aXRoaW4gdGhlIGJ1ZGR5LW1hbmFnZWQgcmFu
Z2U7IENDUy9HU00vRFNNIHNpdCBiZXlvbmQNCj4gdXNhYmxlX3NpemUgKi8NCj4gPiArCWlmICh2
ci0+dXNhYmxlX3NpemUgPCBQQUdFX1NJWkUpDQo+ID4gIAkJcmV0dXJuIC1FTk9TUEM7DQo+ID4N
Cj4gPiAtCWFkZHIgPSB2ci0+YWN0dWFsX3BoeXNpY2FsX3NpemUgLSBQQUdFX1NJWkU7DQo+ID4g
LQl3aGlsZSAoYWRkciA8IHZyLT5hY3R1YWxfcGh5c2ljYWxfc2l6ZSkgew0KPiA+ICsJYWRkciA9
IHZyLT51c2FibGVfc2l6ZSAtIFBBR0VfU0laRTsNCj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0K
PiBXaWxsIHRoaXMgcmVzdWx0IGluIGFuIHVuYWxpZ25lZCBWUkFNIGZhdWx0IGluamVjdGlvbiBh
ZGRyZXNzIG9uIHN5c3RlbXMgd2hlcmUNCj4gUEFHRV9TSVpFID4gNEsgKGUuZy4sIEFSTTY0KT8N
Cj4gDQo+IFNpbmNlIHZyLT51c2FibGVfc2l6ZSBpcyBvbmx5IGd1YXJhbnRlZWQgdG8gYmUgNEsg
YWxpZ25lZCAodmlhDQo+IHJvdW5kX2Rvd24ob2Zmc2V0LCBTWl80SykgaW4gZ2V0X2ZsYXRfY2Nz
X29mZnNldCgpKSwgc3VidHJhY3RpbmcgYSBsYXJnZXINCj4gUEFHRV9TSVpFIGhlcmUgd291bGQg
cHJvZHVjZSBhbiBhZGRyZXNzIHRoYXQgaXMgbm90IFBBR0VfU0laRSBhbGlnbmVkLg0KPiANCj4g
SWYgdGhpcyB1bmFsaWduZWQgYWRkcmVzcyBpcyBzdWJzZXF1ZW50bHkgcGFzc2VkIHRvDQo+IHhl
X3R0bV92cmFtX2hhbmRsZV9hZGRyX2ZhdWx0KCksIHdpbGwgaXQgdHJpZ2dlciBhIFdBUk5fT05f
T05DRSBhbmQgZmFpbA0KPiB0aGUgZmF1bHQgaW5qZWN0aW9uIHRlc3Qgd2l0aCAtRUlOVkFMLCBl
ZmZlY3RpdmVseSBicmVha2luZyB0aGUgZGVidWdmcyBpbnRlcmZhY2UNCj4gb24gdGhlc2UgYXJj
aGl0ZWN0dXJlcz8NCg0KVGhlcmUgaXMgZ2F0aW5nIGF0IG11bHRpcGxlIHBsYWNlcyBhbmQgZXZl
biBpdCBpcyBmb3JlY2xvc2VkIGJ5IHRoZSBkcml2ZXIncyBvd24gS2NvbmZpZyBnYXRlIGNvbmZp
ZyBEUk1fWEUNCiAgICAuLi4NCiAgICBkZXBlbmRzIG9uIFBBR0VfU0laRV80S0IgfHwgQ09NUElM
RV9URVNUIHx8IEJST0tFTg0KDQpUZWphcw0KPiANCj4gPiArCXdoaWxlIChhZGRyIDwgdnItPnVz
YWJsZV9zaXplKSB7DQo+ID4gIAkJc3RydWN0IGdwdV9idWRkeV9ibG9jayAqYmxvY2s7DQo+ID4g
IAkJYm9vbCBmb3VuZCA9IGZhbHNlOw0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcN
Cj4gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDAxMDk0NTE4LjE0OTM2NTEt
Ni0NCj4gdGVqYXMudXBhZGh5YXlAaW50ZWwuY29tP3BhcnQ9NA0K
