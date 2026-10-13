Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF0653FD51
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 21:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926341; cv=fail; b=FRQrXuRWzb25bWebhOJYgC3Z80cQ8Ln6lJkKnfQOLw3OYhGN+J60XP/Y+atKahLJaFqaOCeEk396bpfehtUYH7qIAzxyA1Gbm+0HBbBOX9RjJ3hrIod9+9fA4oQLxShyX01eX29vPhdjQ3SYXlOTZ818CQBOO2er0gQLTfP+/HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926341; c=relaxed/simple;
	bh=0kBpUjBqSIvTpMhRTZ8srpmDUqM8OFCxMcgouJFPA6I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tuq8sNTc+hh1DodR2V2JNuK1LPHzaqgKMyiT2H6AIOE87eKSy8rA2Or1h3ZV0GzyWzvXkQc2Mabd5VEU3xYWm7NdSW80O183KAxNpKGiiTdZ8cBD5bA6PlnXnbypTtllXzxHFT7H2gN5t90yKkv77aAAW1Bsat44iuNgLgwp/iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tf+tE688; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tf+tE688"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791926339; x=1823462339;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0kBpUjBqSIvTpMhRTZ8srpmDUqM8OFCxMcgouJFPA6I=;
  b=Tf+tE688nPweDiWGt9XH2dGv0/GrvxFohCmN4YYC/OQAS9ZZUHGKyJ9x
   0UxadMhEUGrE36B2gWz29N8itxV1Lq49n1rnuiCmYofi25CxYHUdxo+v+
   magDBtkMYWeKYbl4tYFTbiXGPyyvwsZy+jGkho9fk278TJNCk4+pn4C+z
   7Mw0znDUxutKT5DGQr+VPpFUNkbpVJ/MI7iNHjgjPCXzWzSeIAqhDIdtu
   DNr8Pwh9Jop2yfen8+BHc33WpNmmkcFqOaIwGPF33FtiC5jqUeHVV8LZS
   YavqKgN+TvhjnPgVWiFzwsulDIewM10JUVin7ww0Dh4PS0ZeGJiwvYAlv
   A==;
X-CSE-ConnectionGUID: K6wjQTs5RI6W0tuy92VhNg==
X-CSE-MsgGUID: zfBq5N0CT0678DBMut+x7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="675235"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="675235"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 14:18:58 -0700
X-CSE-ConnectionGUID: MysOEYBUS42YrcNwxVuoVA==
X-CSE-MsgGUID: 0cKExBnAS422cA+ejAd6og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1463920"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 14:18:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 14:18:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 14:18:57 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 14:18:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxh+FixekyeBlxwjYi1QMPWXcP31iXDrBjbU6sNCdKLQnjhheWtIgmuG17B+ItNgKueyLTPi3STfj0rbFKmCQowp9SC1KI/1BR3iQRCZwqS8wh+t5Du/ApRGcPJCkp538id20ZK6HXliiQoent+SYtVxzXiwROgdTGADHpSABIe5JrI2SOJLxKcmr/meFxaR77TGSyo8swPmMY4pOewmUDu9yEylG97MsJ6dDjS/EQSMya4jCGA3oJWvlCuQJcRClGj1vzjUBJNOi/EM7RL+r6Lw+sr6zCsKgHolzNiZxT+OXCbRbpRBDETZEXazZUlrOOBEbDvVrizf83qndLmGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kBpUjBqSIvTpMhRTZ8srpmDUqM8OFCxMcgouJFPA6I=;
 b=LFcZH3kuYf/VGdM99J4wjyzwgNlKGgkOJIYdPAB0cMn5kVG4HMYPdpK+kEW3u8/9tjdmAjJ65VyLgJVM+Sk4AO2bzB464rB8hETL3VvDw5y22UB4e75unAV3pTjHI8GMA8bVVodFca9bVi3uqJUskFm37V4iqrCXHCyVb794YytWVFKoeHmwpN2/OW1MgZSV28+kCRXDwa42dvmh9dbnDjRFfTPfAMCjErptCsn10os+SstepClbXxpaDuSeftNqWVF7nzKVj7PAzybYIIZ1ICMg+YTWP5p0K7A1rZziGXTcNhL0BZkD3TzhuoZuJ/nWjRTLPqLVhmSMdonhN4+jZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by DSVPR11MB9718.namprd11.prod.outlook.com (2603:10b6:8:34d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Tue, 13 Oct
 2026 21:18:50 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 21:18:43 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v10 3/3] drm/xe/guc: Add dump_cache to optimize GuC CT/Log
 compression flow
Thread-Topic: [PATCH v10 3/3] drm/xe/guc: Add dump_cache to optimize GuC
 CT/Log compression flow
Thread-Index: AQHdVbtgahmdFU4+I0i1KI1pj09x/bbwzu2AgAsZUYCAAB0igA==
Date: Tue, 13 Oct 2026 21:18:43 +0000
Message-ID: <c07dd84dd81bf3a645fd2a6ef860bef944d1ca7e.camel@intel.com>
References: <20261006175129.3366784-5-alan.previn.teres.alexis@intel.com>
	 <20261006175129.3366784-8-alan.previn.teres.alexis@intel.com>
	 <sashiko-outbox-162316@kernel.org> <as6HwRY4HvjFPB7N@intel.com>
In-Reply-To: <as6HwRY4HvjFPB7N@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|DSVPR11MB9718:EE_
x-ms-office365-filtering-correlation-id: 45ac002c-cc51-4088-e48a-08df296f8f45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|18002099003|10067099003|11063799006|4143699003|38070700021|56012099006;
x-microsoft-antispam-message-info: Yil/03/wWMIFT4raGQgB3SrxFmOCZ/DV6lsnrVcOO1Nb7xYYA0F7SMChhG0MwJCLAIuWm45RZEITH8ceD/gxFMVXtTVLO30+nTul3896dodgwh7oukCxLgoEv4+H1MPdgwgSYdIlgvverFVQdQKmIdgm1uYCGvYXGU5+u79fjR6e3Y/a7K4Eb3vOUrAZPw6l050Za4CcuYdG4GpjwSbWMNlaekF+NJy8qZNjy1wonH5ALkBP/N1muIJ7wvkQMlIk/FygJ7h5DH+aTsFUA4J9fcZvYimB8oU4Nk9SgNo76+IE/VofvU3Yj8/O4H33jw8ouY2DNmIOs3NogqYj7G0mJ41467yzczO71kcItERsQGI1DZgW6NztjxrgIASm7u1xyBpIF/+lIOs1vbT3Zqor5uKdhQ4Drror0zXKNOVoD5lAJH6u/50BKDq8e0PI5YR0PA0iEs0yodT5/9sgzVdXNHapMGlTElgUE47ayCxNoIUJyC/3G5kDx79KZN+v3nSkCa3t8PZUIzfxHg3kIogsI2KvHHECmcRcoPVcdrAT2ASSSfc7fUbvkr8X6W2Ii0aTZlSAzueNqPlL5p71Puv0IIItRD1yq6zX0+pbeeiasC3zS/CnXpcQ1W4Co4ecbERSmj6aTt64YGcbs3Sw9TLKs4HXht5p762RtlgJcOJgiT90r2gMwenWwgPQTSreowvHU6mE6aKveBvghv1kMmU7aU6NmcilMDdwgOAQ6R0v6LA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR11MB9883.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVovMW0reGZRTEU3RlBOcmtESExLWFU5V2hQNTJHcG5KY0ZGRG5ZWDQ0WkVF?=
 =?utf-8?B?V20vWUdXVnhtN1BjTkVLRlZ1Ym9lNDkzSTlCRkp1dEJxZlJNclh2RGtXN0wv?=
 =?utf-8?B?bEhKSjBucG12NWE5QmFobzNnOUlsNEZydHZRLzBWZG5wSjI2UzBSc0JJU2lH?=
 =?utf-8?B?aTVCaEZIZEpkTUI5b2hPcGhiOUk2YjFEZnFodlc4QWlmc2tBWEFFMWh6WGVX?=
 =?utf-8?B?TzhabEdoYlBiMGRBUWhWWHdmL3o3SVYzMU0vOE1DRFlHeHhLM09aeDRMT2tC?=
 =?utf-8?B?MDBnV3pVaGJQMEdOWkxtVXZOSjM1RVNLU2o4WlhaR05DV3Ric3RrS015Z1hQ?=
 =?utf-8?B?S2pabVZVNzZENFkzeC9TTGpHYVU5YWNJdStRcEUyZVlGdWNOUStSWFBpN3NN?=
 =?utf-8?B?YVpzVWdxRUNiYnNIV0lySEVDeTJ1N0tMd09ubWtjUmYwLzAyR1BHcUZzRXJI?=
 =?utf-8?B?cXVlYWJFRzJBS0xMWkgrVkxIRzBqaXNObUZBRW5nQnJRTWt0d1ZCY3RYM1Ja?=
 =?utf-8?B?QlJKTFVVSnBRY0x3SGplcGVyTXFiU3I1RC9Ma1h0U0VOdVhreUpuRWdaUmQ3?=
 =?utf-8?B?blRQZzJWUGc5aTJnNnAvdWIvUGM0K1NiVHRObmgxc014YTE4dkdlUzZoYUVK?=
 =?utf-8?B?UTZ2S3ptOFVib2FuNWRONUVlNmhHVVJjTWdUbWlBOGY1eXNVUlhMZkVsQzJw?=
 =?utf-8?B?U0lXcURjWXJyWFpmb09GaWt0SjNBUFZ5YVdlejJpUWkwMjJuOVlIMmZYTGRy?=
 =?utf-8?B?NXY0Rk1ndXFsTC9HSk5WbnZCT2xTdkJpcXV0Q3ZQN2Z2ZzR6Yk4wN1g5VWt2?=
 =?utf-8?B?YUdkUlYyd1YxSVZhRGtJeC9UMmtycU1CZVFNaEkyZFkwSFJkRTRZbzI5TnV0?=
 =?utf-8?B?Y0xGVWh1MFJTZ2wwUnFVRVhoWGlGbDRGWW1GbC81QkN2QXZUVnhMbmJpTFVX?=
 =?utf-8?B?VjlETnBOaGpCRGlmakk5cFVCaEpmd2ZvNGRmVmtLeG91bGpSbWxaT2VrSmZu?=
 =?utf-8?B?N2NHNzhBN1pSTGt4OTY5NUd6d1RDcXVGK2Z5MG1Dd1QrVWRvZUxZZ1RqVkd4?=
 =?utf-8?B?M2JYYTVpREhGVUYzcDF4d0ZRejBCRmFKVXhHSzdKNllRcG1mNldNbmMxWnhi?=
 =?utf-8?B?Q0dDM3VNb2NaWTZLK1RQZ2NaSjFBQXhMS1M4WHFrWGQyU20xRHI2bXJ2dEFn?=
 =?utf-8?B?dWpxa2d0ZkpRUkY1Rk1lTmNzV0tOTGVPbnFZN0sxRm1YL3hMS3pDQVJKWk16?=
 =?utf-8?B?YWcrbUMxeDh2dGt2QmFwYWZnYUpMRzJURVZJb3E2QzZqbjhZRFQrd1JHZllo?=
 =?utf-8?B?QnZ6cDA2eElmb0ViMGJZcU1xdkpyVmJBYkV0TGE1NGtlYWNnaHNva1VCVFMr?=
 =?utf-8?B?UlpicHZ2Y0kwL3JldFUwOHVRbm9TVnJuVGllckFHb093R20zT0h0ZkEzQW5Z?=
 =?utf-8?B?b250SVN0ejBMbktRd1UrU1hrOGU5T3hMSjViUElITndEcFFlODhMUmwrVjd3?=
 =?utf-8?B?VCtXV3c3K2VhNDdwUjNjTFEydzNXaU5Pc3FIZ1RXaXNBMEFHRElpbk8yTmZE?=
 =?utf-8?B?R0k2bmFpQjY1eUd6Yzg1cnNUelhoQXVNNzVjNnZ6QTdOVjdMSktTMnBBYWtX?=
 =?utf-8?B?V1JrbDg3WGVhNmRJaVN0QzN5Mk1qMEpkQUVtTi81WGNjOVFNVG9uVk5QUFVj?=
 =?utf-8?B?L2oxbXFMNzBPUXRZQ0liaGFaUmdac0d6U2NFekkzaW1ob3NoNVpwcU1iVzJt?=
 =?utf-8?B?ZlBmbG5Ea3FPVStPc0F1aXR6TlpkSXMvcGVNWWtkK1lyNnRhcnhNUTdFckZ4?=
 =?utf-8?B?RmMwa1R0bUl5bVA1WVVBRG9iVTVqQXVFKysxNVhlYTZ1TlNwOU1XTmdDUDRV?=
 =?utf-8?B?WnhJQjcxaUFHZHE4QnhrbTNMYkRuNGhESDJ1WkpEYk5IdU5sSkY5azNVVzdT?=
 =?utf-8?B?NXVLSHJ1aHEySEFuVGkzbGh4bmo0YW0wSE0rSTM1RG9PMjQxMUVlZGJCRXp3?=
 =?utf-8?B?b1NSRTd1eXhBc0NYU3EweTUwbXpWUVUxNmRrQmZZYW0rL09JMUU2NmxqOGdi?=
 =?utf-8?B?NjJvZFh5VDdzc2NaUk5SVVk4WmVSMHB0Vk84V053S29qVjl4VEd0T080azJu?=
 =?utf-8?B?eUx0TDQ0dUV0c1F6cnhQN2ZxcHQ1WFg5d2kxZHdEMUV4cTZJUnh2NjZvdk5o?=
 =?utf-8?B?WkIwMXNibk5WK2xsTkRDWFFqTCtVbWU2VjduTU5aVjh4RzBxT21wQlAzTSt0?=
 =?utf-8?B?UTUwODZuSE91eTE2VHk2R3l0Wi9VVVk2TityRkliNU9rSzg1dWJsVUNkcGJp?=
 =?utf-8?B?SWtGWEFjYTNtNFBLYUczblVkMnZHUGx4dW5GUUlDR0dWS215U0w1RmJvQUxo?=
 =?utf-8?Q?Eoa1t/eYbxdwHJw39euBT4uNuNQxvdNuw4Nu6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B73BD76B4D9CE14B8CCA1827C6D36D62@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SYFtGp6qtKSiXUFOMl43HuETnUSymJfWaRW+98IENZTZIYsbAOOTZl5x3KtZzwkp//PEknxXzWcrlhTRSK/vriR4TvFngNsPenVXSvB0R5paUupVlp/nBbVSneS4RGX4lIxPajV2Dal+WbiycIVzDOI16DfhpuWIyjA8KsQELgLnd+8yzLgUwWGVRulRK46IXEhxk7k81Nn2On27GtqUdugUaVXNepxeALQbZkiqRdeJOvTgzaoJvUxul/tkem0ibXWFmxyRDJIR2JsEd9jRQ+H/IJ505X+O18KC7BUVcqJvkgsIiO3+F7e3EH/EWSUpj8BjA8aiRR21eHd2rze92w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ac002c-cc51-4088-e48a-08df296f8f45
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 21:18:43.1342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OuAW5e62l+z1qBQ2Zeev9EHM0J8LCv2OtTbAdBei9+06tCjXSJRnaadmHQi6X/jHX9l19U5OacG9kW+WeHPsR+EmVblYhp76JbZI6yTVjUVDx2uz+mePB1lEH7ic+aXT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9718
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTEwLTEzIGF0IDE1OjM0IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFR1ZSwgT2N0IDA2LCAyMDI2IGF0IDA2OjA0OjU3UE0gKzAwMDAsIHNhc2hpa28tYm90QGtl
cm5lbC5vcmcgd3JvdGU6DQo+ID4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2Fz
aGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+
ID4gLSBbSGlnaF0gbG9ja2luZzogU2xlZXBpbmcgaW4gYXRvbWljIGNvbnRleHQgd2hlbiBmcmVl
aW5nIHZtYWxsb2MnZCBkdW1wIGNhY2hlIHVuZGVyIHNwaW5sb2NrDQo+IA0KPiBwZXJoYXBzIHdv
cnRoIHNwbGl0dGluZyB0aGlzIHNlcmllcyBhbmQgcmVzZW5kaW5nIHBhdGNoZXMgMSBhbmQgMiBm
b3IgbWVyZ2luZw0KPiB0aGVtPyB3aGlsZSByZWZhY3RvcmluZyB0aGlzIG9uZT8NCj4gDQoNCmFs
YW46IGRlcGVuZGluZyBvbiB0aGUgZGlyZWN0aW9uLCB3ZSBtaWdodCBuZWVkIGEgZml4dXAgb24g
cGF0Y2gyLiBhcG9sb2dpZXMgZm9yIHRoZSBkZWxheS4uLiB3aWxsIGZpeCB0aGlzIEFTQVAuDQo=
