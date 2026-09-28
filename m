Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BD24EBAF7
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616482; cv=fail; b=RXSyQSpEOf2EqOJobbxF9vIxizeXDrcdr6tuum/1N5TS1zilXROtpc3wOQJK0ihEBa5ZNQ53a2GvqL31BUc7Ab6DttFIZiiFgXmEHBo3JXhFZpb3mls2V4iOnJWHQIhgIxKfjbYcYFxsfu6Q02bAdt79ZjKFAIATxCNvTU/mJnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616482; c=relaxed/simple;
	bh=xE7+ZKYyknXC8X3qJzaSITbBokjVy5bcDZTb5gNYwgM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c7E1SmGTEJcP1j0dCwnBbpIkxtOs66dTNzrocUPylYUlEtzyAwumviOJG5sWYpnRiF2Dl1OYlrdAklmJGgpAw6I+T9GXaBORU74dJkI3pYBwwoGX5lHm+iyb9tiCsUHZhFF1eSyuIWr7XuaeuCz9EcWIZpbKe3Xe+lVtZrnxURY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gv67TX/x; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gv67TX/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790616481; x=1822152481;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xE7+ZKYyknXC8X3qJzaSITbBokjVy5bcDZTb5gNYwgM=;
  b=Gv67TX/xpH1fulm5rnYUf4w0GQa+ylzmVW6fRF8dfM+sz/w5jT2oHJ8I
   By6TbldKUqydTZOW13LZOQwO2LpTLcoJbG4P90IdUsCVEIHPzN5un/EMx
   QJnMqY4lrfkpDh05+RFPZ7yPd15RIr0bln0vIMq8/Z1Za3FTQpq3XWNl0
   cmS2awNdDpmg+gF51XYSxwu4e6DLsVrE/FfeKynUTwYsxFzXYPtONr5OW
   0+c/LHnn0rPmTCL9OE/i1wgijybgcnjYhk5zB5CqG9G+HcoltUSF9kjwk
   nA+ouoT7bI2ZkYPTMeXNeA/3HqQRN1DhNBCtesktQTjnCLG83rpPsgj2Z
   g==;
X-CSE-ConnectionGUID: vqN9kMzKRF6kcqm1iLLCgg==
X-CSE-MsgGUID: Azp91p0uRxGCdj17DLg7nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91342808"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="91342808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 10:28:00 -0700
X-CSE-ConnectionGUID: zcV8ZIrVQLG5McE3u1v+VQ==
X-CSE-MsgGUID: FKraSDhsR7KJ1C28tXCtmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="283202809"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 10:27:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 10:27:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 10:27:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 10:27:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYQVgKvrn2je2/R56OSpcb73y92nDRg/TI1D3JmLbFJgycukxxPD8cNBVqSnbJoikw+ecwEkNvhYLFY7esz2cQzE5f2IcuNsfo1juUTY/HH/JNxuzLy/3MB2ZBBeWTzFgPzBby3Llvtk5xBNMXygS3KLGto3uso7Ibv4UdpM/HjmjZxqWnjWmUAZLJo5XYUcbw7OEB+T7cS/m6SG2W6wtPiB2YLmdXbLLevqAFiRa7MhI0q8NKqHKNvprWRZNWbBVCByjt2pJRTmdlEGvJszs0WPCG7w5vld6qkV9kAB6qYyxCXJB+YrGpAt7iD8XjQDzj/+RiU9yb6gzzxjIY3cnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xE7+ZKYyknXC8X3qJzaSITbBokjVy5bcDZTb5gNYwgM=;
 b=in/XRa4bhETyIF1yjZUpIaLcquKQve0nXgLc600oBJFhFXr/pnmbQ/LQRD7+fQBc+0dNFsR9qAdX4UT6YIKJcASwIPgPHK8199dMo6inw4wxwhd9cLEd9vSC68bdDV5K1SevBl+JEYzZMumNl4XoSTd+p2RHyqeFDEHCK3N0iOTTLIPVB7Idu6UjOQrBnN2ekAvlapZNwnl/i8LdKAcvOs432ySr007hx9ML9gGYj9IPsa3kEP6T6hT+OTc5HcBcMGUVGdtiCzbGPe4/g2HBqNjKbwALoP1YPaXJc2JdtIoeGm7n2iTjQ8Dz2CkFF4JskidiYjMe2vZ351hoa1k4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SA1PR11MB887662.namprd11.prod.outlook.com (2603:10b6:806:520::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 17:27:57 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%3]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:27:57 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Implement print vfunc for page fault info logging
Thread-Topic: [PATCH] drm/xe: Implement print vfunc for page fault info
 logging
Thread-Index: AQHdTUWEaBCdP9zIhUqMNXQJPL/aobbf838AgAAsewCABCBY8A==
Date: Mon, 28 Sep 2026 17:27:57 +0000
Message-ID: <SA1PR11MB88393679DD40FE6B1BB636F7AA8D2@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260925232757.3456172-2-brian3.nguyen@intel.com>
 <20260925233853.399E01F000FF@smtp.kernel.org>
 <arcrXAJy/bzijpdp@gsse-cloud1.jf.intel.com>
In-Reply-To: <arcrXAJy/bzijpdp@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SA1PR11MB887662:EE_
x-ms-office365-filtering-correlation-id: 1521dcc1-460c-4f36-3ee5-08df1d85d65a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|11063799006|3023799007|22082099003|18002099003|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: 9Wu5FOj+BKVLG8WnuTxuu4t1hhrS8VtnwSCtZ1T85piP3VeG+eKMOcUo+aJMSJ3czm8gRvoO7BacQh0JWps9JOBCTpgz7jNbnes9QjHX4DURLpA6YKKoz7IMqaRYnYvtKQrf7uv7gpKSgRFwr5R02Xz3kssNNUBe8RWcBxfS8WS18N0ffgKZ2DCeprOuRQrolF1zK98q2Leo/XMmfqna+IFWR9PaTZWudZKGoY81Hu2nGVznPnorJUcGEcWpjKweuK2wj4tsL8xGQR1ZtT1sUjsfLAk7jjjnC0yrms5ofn5Nrg6eVqtEjaP4vEfpsEin2KAlKlKQS22hxwHj99wuIke8VpqQrwN5Ti6ZAGtatjR0stvflcwNP6fKPgLYzTHzZ9FzH2k1ZZF1CBhF+4huyQ5TTrDkGZwZVX3bY/SuzwOYl2xZUNZqoY2KOhdAayGfDsB8nuYLkBGUFMgFnb0KeAI96C7u0XrNmQ/f0QEIoIlQSwWMFGWpEtllyc1yr/DLhBTI7QSIIFa+cZrnmsM/gyqr/C7OYQF+KekLy4fhwpWLPG3toA38qS11b26lIozaZwyQidSOksFQQMGiylYaJitrAfrFBPo8urGpz9bo4blKsBcUHc6le+BsbTnhOKBwySFb7wm5dyEeiK9DWNUjVaW58KyQBTn4OyGyO1goiIo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8839.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(11063799006)(3023799007)(22082099003)(18002099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHZMMFk2ZG96ajY4Yis0KzJiWk16ZFBZTEMrRlExREZrOTVDcWFhWVl6blha?=
 =?utf-8?B?ZGF6NG9nTytod1J0UEJqcUJaaFJsMnRwLytzYzRUS080UzlobVlZc3JvR2F1?=
 =?utf-8?B?dkV0ai9LVHVBTUw1cnJmOU5odnM2NVcvWTNSZXVjNGthaUdXa2FGUXY1cDA2?=
 =?utf-8?B?dGtGQ3V3aHpPYlM5ZnBqMXNEWUtBM05CQkdjRFYvbzRyWTVORGVBVXd3WXRu?=
 =?utf-8?B?bHZGb0pTVExNb1ZTQ242MnZiZG90SWlUSm42NXA0SHVTOWpMZ2lweEtFQ3Bx?=
 =?utf-8?B?V0lFVkluMzVSSXM0VkN0RGN0eHUrMjlqOWdoSjQxTnAzQnNZQzUvY2xaSVRk?=
 =?utf-8?B?RVNta0crUzRsSWs2SmZCWHNSOUh5Q0hBalNtMXJRSHNtVTlhWjZIYlRrRWdH?=
 =?utf-8?B?VTBxeTRBaHFvNmRZRjZPb1RpYmlWMTQ3TzBPajZVRzE0QVlFUXVUWTd5U3JF?=
 =?utf-8?B?YjlUWngrT1ZXMHRiTlhRZG1wU083WkhUd1ZrVWFQck1LeWQ2cmhjZE5XU2tI?=
 =?utf-8?B?OHV1b1NSWDk4WjZxWVZ5Y1VzcnlJbzJpK0hUNnEvRFN6eldIcWU2cERmY0Y0?=
 =?utf-8?B?Q3F5dG1HdnZxZVhTczZrb3daV2JsdzlmOTVpWFBVMUhRbGlqMDFVcHdsOVhq?=
 =?utf-8?B?REdHTWhiQk5SSndGUXJQaHNiRmVLZ1ZiVG9NOE1zZG9UM01QRjdKL1hIZTFK?=
 =?utf-8?B?aVcxMFptWm1MUktobURFL2dzd1dpcGM0cm11d08vUkJVYnd2R2NmeEFYYVI4?=
 =?utf-8?B?MXFPWDJuVDZnK3lmeHc3T2F2MllPTE02OVJIbEVSdFVSNFgxY2h0SjZzUXhU?=
 =?utf-8?B?RzFiZkZBbGFTdTFWaVhUSWg2UmJXQXFLNm5wMzRMYk5VdGdJUmIvVlgzUmJq?=
 =?utf-8?B?NjdUN1FwY0ZaVTZ1b0p3eG9JdGkxOWphb3lyWmd2R0ptd2xmbGtQRmpyeGxz?=
 =?utf-8?B?b05pYWQzOHhvQXRQbGU2Mm1FYlFpVmFRZDNTQ1ovY0pLQ1NLWHdGNkUxQWg2?=
 =?utf-8?B?N0w3QWdDcWlYTkpoNzhDcnBvZ3duVWhscnM0N3VZSW1tdGhUODQ0cnd2L01V?=
 =?utf-8?B?cHAzU0ZkT2FvbGJQSlp4TzA0N00vK3hna0tlM2xlWjBoUU8xSnlBdlk2bWhl?=
 =?utf-8?B?b0t0SjdCRk9KaW1XTk90WGdiS3JwV1l5NDhGOUlmbk9XUmJoZlpuQllSVlph?=
 =?utf-8?B?dU1ZL0Rhd0dDT0FaNUpZdUJEakJZQTcyRFN4dnJuekpWZFRnVlRqTlpUUzB1?=
 =?utf-8?B?R0s2Y1pjYy9iMXR0YTE3RWM4c0VNaHZXMTNheWZkcUNxR2dldjMydURTRTNw?=
 =?utf-8?B?c1UvOWxnR2RyV241alFnNVZIandDWFVOUFQveU1QUmJSVy95aUNtQUE2dUF3?=
 =?utf-8?B?Umc5ak9FV0FWTytXTDdLcnRDUzdQd1ZlOCs1cjFFaUw2NWZ3bXg2THQvZjQ2?=
 =?utf-8?B?VVhNT0tmK3V5SCtocEJpZmxnR0dTRDRmUTB2VDBtZWVCOVJiclEwb2dhNC9U?=
 =?utf-8?B?TlhCZDFmbjJsQjNkY2FLU0g1VnFjc0VOL3BMTExlS2dTYlI0MUUzTU94Q28v?=
 =?utf-8?B?dzZPRmhnSWZsVzFUeVhTeWRleW9LQXVmbGtuVE51OGM2eE9CZ0FMb0hLM2Mr?=
 =?utf-8?B?RkZDeGU2ejhuTzBVaWJTbVFYM3VsK1JVZys3eG9ieGtGMHhBcnF1VjhkYmZE?=
 =?utf-8?B?UVk0S0JIaENGY1ppNTVDaFoxM3VmMndNNkFyMmFpZS9qZytzSERGdjM5UTFs?=
 =?utf-8?B?N1dyUDQ5eUp6Z21GQndWY2g5V2Z6bUVrcmpZVVFpa3ZkVzFtQU1hQ3JPdnhi?=
 =?utf-8?B?TUU0eGFDd25GVGViKzhFbFcyMXppZHBvRVhjelY1MzBCUWI1UDVVcmhKNTFJ?=
 =?utf-8?B?ZTRBclc2ZDUvVkJvK2wzRzk4TkpjM0kvVDVOK2tOSDk2dHBhRXBIZGRQcTRI?=
 =?utf-8?B?b3Qvb09rQTlXSWVVMHJrbUJLdWRsZEduZlEzZEFVVjQ1QWpHTGFDNG1aUTI1?=
 =?utf-8?B?ZWZxU1g3byttblNoMmR0amhxOW5zTW9JSU5RZHl4ajd5aVdUYzFINkQ1Z3ov?=
 =?utf-8?B?S3FpdUdJVFNJZWRiV2s4ZE5NQmR3a2lJRWhzbTNkUHphaE41VHRSckd3N1Zo?=
 =?utf-8?B?TDkzdjkxZHJOS09JWFU2OEY3cG9iYVRJZmNobTdSWnFsdnhTZFV3ZmdIK283?=
 =?utf-8?B?R25PeFJlZ2JMTWNDYVczNDZOU05STUxSKzdBRjhXZ2hlY2dTOGhiVkJRMG1j?=
 =?utf-8?B?bkE1bU5zSmFhbk9kNU9iZldBY1d0SVYrWEhOd1JmY2ZaRVlsejZBY0NzSjI5?=
 =?utf-8?B?bkRDcTQzbDR5RHRoUWp2dmdxQ1JQcmNBVTB5M0hzb0ZaaTM5dEpsZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pzOkSNK9djQBMccUUzouVZwwuq4ahkvAiHmSvqzXrN5G3TBgsngDJSW0kVgkXQx202u01imcWadlW1L1DVKaQcLyf13Oi8knIynKmBxafn3cUi71ubGyhRdDWBoiUAyGm+lofSwEc88JFd6nx8PYrdWm59knmI2kLQEdE2kSrkPUGGGwhOtz0sfuJDVlYNvrYNXwqHq7Es3yVarePuhYvd+cFJOyvfbdUW0NGxOiA2/CTlwUhl3f39+REHAlsqC/dWkPh8CTTatEGKvikwZt3SYQkl7tu7ZSZIWvfxaeKtYGnw6Y4srYMpf0y43tkc8c2yM4oB3gAjS9n/qM9G+72Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1521dcc1-460c-4f36-3ee5-08df1d85d65a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 17:27:57.3852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H85j/h446zessyLNUzi2JBqY806V3n4x9VorL7FfbWVsTttT7hjIBVcMs3n7JvHO+3uctQDbaHFnnrWUQiDaoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB887662
X-OriginatorOrg: intel.com

T24gRnJpZGF5LCBTZXB0ZW1iZXIgMjUsIDIwMjYgNzoxOCBQTSwgTWF0dGhldyBCcm9zdCB3cm90
ZToNCj4gT24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgMTE6Mzg6NTJQTSArMDAwMCwgc2FzaGlrby1i
b3RAa2VybmVsLm9yZyB3cm90ZToNCj4gPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9u
ISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRl
cjoNCj4gPiAtIFtMb3ddIHhlOiBsb2cgaW50ZXJsZWF2aW5nIGFuZCByZWR1bmRhbnQgcHJlZml4
ZXMgZHVlIHRvIHNwbGl0IHByaW50IGNhbGxzDQo+ID4gLS0NCj4gPg0KPiA+IGNvbW1pdCAxMTRj
ZDdmZDczMWY5ZWU2N2Q4YzM2MDgxYWUxYjBmNDRkOWJlNTYyDQo+ID4gQXV0aG9yOiBCcmlhbiBO
Z3V5ZW4gPGJyaWFuMy5uZ3V5ZW5AaW50ZWwuY29tPg0KPiA+DQo+ID4gZHJtL3hlOiBJbXBsZW1l
bnQgcHJpbnQgdmZ1bmMgZm9yIHBhZ2UgZmF1bHQgaW5mbyBsb2dnaW5nDQo+ID4NCj4gPiBUaGlz
IGNvbW1pdCBhZGRzIGEgcHJpbnQgdmZ1bmMgdG8geGVfcGFnZWZhdWx0X29wcyB0byBsZXQgcHJv
ZHVjZXINCj4gPiBiYWNrZW5kcyBsb2cgc3BlY2lmaWMgcmVsZXZhbnQgZGVidWcgaW5mby4gVGhp
cyBrZWVwcyB0aGUgY29uc3VtZXINCj4gPiBsYXllciBmcmVlIG9mIGJhY2tlbmQtc3BlY2lmaWMg
Zm9ybWF0dGluZyBsb2dpYywgd2l0aCBjb25zdW1lci1zcGVjaWZpYw0KPiA+IHByaW50cyBoYW5k
bGVkIHNlcGFyYXRlbHkuDQo+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcGFnZWZhdWx0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmMNCj4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHQuYw0KPiA+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jDQo+ID4gPiBAQCAtNjA3LDM1ICs2MDYs
OSBAQCBzdGF0aWMgY29uc3QgY2hhciAqeGVfcGFnZWZhdWx0X2Vycm9yX3RvX3N0cihlbnVtIHhl
X3BhZ2VmYXVsdF9lcnJvciBlcnJvcikNCj4gPiA+DQo+ID4gPiAgc3RhdGljIHZvaWQgeGVfcGFn
ZWZhdWx0X3ByaW50KHN0cnVjdCB4ZV9wYWdlZmF1bHQgKnBmKQ0KPiA+ID4gIHsNCj4gPg0KPiA+
IFsgLi4uIF0NCj4gPg0KPiA+ID4gLQkJICAgRklFTERfR0VUKFhFX1BBR0VGQVVMVF9FTkdJTkVf
SU5TVEFOQ0VfTUFTSywNCj4gPiA+IC0JCQkgICAgIHBmLT5jb25zdW1lci5lbmdpbmVfY2xhc3Nf
aW5zdGFuY2UpLA0KPiA+ID4gLQkJICAgRklFTERfR0VUKFhFX1BBR0VGQVVMVF9TUkNJRF9NQVNL
LA0KPiA+ID4gLQkJCSAgICAgcGYtPmNvbnN1bWVyLmlkKSwNCj4gPiA+ICsJeGVfZ3RfYXNzZXJ0
KHBmLT5ndCwgcGYtPnByb2R1Y2VyLm9wcy0+cHJpbnQpOw0KPiA+ID4gKwlwZi0+cHJvZHVjZXIu
b3BzLT5wcmludChwZik7DQo+ID4gPiArCXhlX2d0X2luZm8ocGYtPmd0LCAiXHRFcnJvcjogJXNc
biIsDQo+ID4gPiAgCQkgICB4ZV9wYWdlZmF1bHRfZXJyb3JfdG9fc3RyKHhlX3BhZ2VmYXVsdF9n
ZXRfZXJyb3IocGYpKSk7DQo+ID4gPiAgfQ0KPiA+DQo+ID4gW1NldmVyaXR5OiBMb3ddDQo+ID4g
RG9lcyB0aGlzIHNwbGl0IHByaW50IGNhbGwgY2F1c2UgbG9nIGludGVybGVhdmluZyBhbmQgcmVk
dW5kYW50IHByZWZpeGVzPw0KPiA+DQo+ID4gQmVjYXVzZSB0aGUgZXJyb3Igc3RyaW5nIGlzIG5v
dyBsb2dnZWQgd2l0aCBhIHNlcGFyYXRlIGNhbGwgdG8geGVfZ3RfaW5mbygpDQo+ID4gaW4geGVf
cGFnZWZhdWx0X3ByaW50KCksIGl0IHdpbGwgYmUgcHJpbnRlZCBhcyBhbiBpc29sYXRlZCBsb2cg
ZW50cnkgd2l0aA0KPiA+IGl0cyBvd24gcHJlZml4LCByYXRoZXIgdGhhbiBmb3JtaW5nIGEgY29u
dGludW91cyBhdG9taWMgYmxvY2sgd2l0aCB0aGUgZmF1bHQNCj4gPiBkZXRhaWxzIGZyb20gdGhl
IHByb2R1Y2VyIHByaW50IHZmdW5jLg0KPiA+DQo+ID4gVGhpcyBkaXNydXB0cyB0aGUgZm9ybWF0
dGluZyBvZiB0aGUgcGFnZSBmYXVsdCBkZWJ1ZyBpbmZvLCBpbnRyb2R1Y2luZw0KPiA+IHJlZHVu
ZGFudCBsb2dnaW5nIHByZWZpeGVzIGluIHRoZSBtaWRkbGUgb2Ygd2hhdCB1c2VkIHRvIGJlIGEg
c2luZ2xlDQo+ID4gY29udGludW91cyBtdWx0aWxpbmUgbG9nIGJsb2NrLiBJdCBhbHNvIGNyZWF0
ZXMgYSByaXNrIG9mIGNvbmN1cnJlbnQga2VybmVsDQo+ID4gbWVzc2FnZXMgaW50ZXJsZWF2aW5n
IHdpdGggdGhlIG91dHB1dC4NCj4gPg0KPiANCj4gVGhpcyBpcyB2YWxpZCB0b28uIFNvIGVpdGhl
ciBtYWtlIHByaW50IGFjY2VwdCB0aGUgb3V0cHV0IG9mDQo+IHhlX3BhZ2VmYXVsdF9lcnJvcl90
b19zdHIgYXMgYW4gYXJndW1lbnQgYW5kIHByaW50IHRoZSBlbnRpcmUgdGhpbmcgaW4NCj4gb25l
IHNob3QuDQo+IA0KDQpXaWxsIGRvLiBJJ2xsIHRha2UgYSBzdHJpbmcgYXMgYW4gYWRkaXRpb25h
bCBpbnB1dCBmb3IgdGhlIHZmdW5jOg0KCXZvaWQgKCpwcmludCkoc3RydWN0IHhlX3BhZ2VmYXVs
dCAqcGYsIGNvbnN0IGNoYXIgKmVycl9zdHIpOw0KDQpCcmlhbg0KDQo+IE1hdHQNCj4gDQo+ID4g
LS0NCj4gPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA5MjUyMzI3NTcuMzQ1NjE3Mi0yLWJyaWFuMy5uZ3V5ZW5AaW50ZWwuY29tP3BhcnQ9
MQ0K
