Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9666577E36
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 20:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157030; cv=fail; b=YTUhYan4NMhqSICS2JaTo04P39/vUU/vkEwtaTjdZV2cn3hEajP31IBbzfUKC//KBzaHwVzxOrgCImFCyYfQcBucFIeGTi2dFZnCKGuAowu7/KzG04pzXt/WkpiKaBXZg/PdTcV+9F9Gaj+J9PJm6ds4ixyInISiLSzJx0d0Wow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157030; c=relaxed/simple;
	bh=a1iL+zKyla/Kcp7zMwWiK1LNQPCcweI3J4mzjvFucmA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YJtKmMi+MyzRpmyMw5oeaQacFKaTWp+ye3+0ftZpwQvPFx6x6cQn96FZCiQjcSkobC5Q+8pnmSEVAbgIseDDGdW20ZAZJp5wtCrox618rpiuBfgKODWAiqmC3I6fR+idGm/7KaKm+z9q0QdojwmmsHCHkaZFsjsrFZdTrIixwRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5Zk+2PP; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5Zk+2PP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789157022; x=1820693022;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a1iL+zKyla/Kcp7zMwWiK1LNQPCcweI3J4mzjvFucmA=;
  b=N5Zk+2PPX+N8qvBPt/1Ax43A9VIfea46+2T4VjEaS6yubZrr255kmT4/
   ET4cWGwU1EOMW3/xYOz2p5mRWzOKMqSvZxVNdX1nKFvKO1U38fH1EEVQf
   sdu/2Ova/H62hxVLFurSmVvXOyPbf0NOznOH+dDIrqljuGJLiMZuLr/Sv
   BO3cmodOqsYrgbfGoR6QhthfysqSb3gaPa4EzkpvMhXHeynkVga0JLlP0
   u2nPMQP6cZ3GZfzI2ajnUKMAp3iEFdfykAphzzjbvaETEhXSuP/zQ5rHE
   bxHSFfClDMb7xOKMAo7D/NIAAk4fiSDsT9f88DHlBPfFfE1+cQlMndcB+
   w==;
X-CSE-ConnectionGUID: AgnTLkndRCiVhBap0EPrSw==
X-CSE-MsgGUID: u9r0qewVTZi/mzxtpbit9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="77188435"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="77188435"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:03:39 -0700
X-CSE-ConnectionGUID: l+6S0Ps/QbWU2tcZy0Gg3A==
X-CSE-MsgGUID: dUuhGir7SYW12GGkFB29NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="276167619"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:03:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 13:03:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 13:03:38 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 13:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXB/NUQvTWw87mC/bDxIZQ3GJo8L7lL7QmUzNWPL6a7Zi0qU4AJlnI36QfKOMu5ISR3fh5LqpIiMBPWU2RPJc8bu52u+yhOkbEAkg+ybmtK2+of9sI4xb+OFBvDCX/6CDYJbFioQ6lEdM2hD7VCUEkOgBAyfCXyfTVW1g7Lhbsr63kZcohOCBRKee/jF6yDycHPp+iz0Fm21Gn5yqK6j5bnmWcom9ZLFeVfDsRyZgrxdHr4QzXvr6Db8Qw9BtOdXhb23/nBIJiHhyBlG6zo/xTJs4ihUUqbnctsjE8Ci6NdX3BP7pJUySJR9tHFUJII1/xtLTAidIy7KmqhSTFyFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1iL+zKyla/Kcp7zMwWiK1LNQPCcweI3J4mzjvFucmA=;
 b=k2pit9uvt6HDJTSRv0fQ4T4sEJ3aBrBm47nluqKh5xMQuFwilv+FBquIaemYibqh2f0xKUUEKPxmAPlMzYQAR7O1tMcP9FyARVAU+xUn3/w9SEM34mEiISTt7GJtxmI+FPB+4a7fPEQx5F1LL6kqDerz8+Qyhrdywt6AERyZ4xQqUXIrBmRhw+QB1qh/9Kzae/7KrgXKNASk6WvKfgZwO9hKM43wMFaqiVoySpV/vgeEEHxvD5wAY+xFdetPwNPI8BQGNF1OC03hhwpFs/J6Y8583yG9O+w6+1v2oNkoaVhhQnxtnGUNhltluVT6HD9NMW8BgnNuFchKj++Nz4H++g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DS4PR11MB570107.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 20:03:35 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 20:03:35 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v7 13/20] drm/xe/vsec: Add base_offset to allow for more
 flexibilty
Thread-Topic: [PATCH v7 13/20] drm/xe/vsec: Add base_offset to allow for more
 flexibilty
Thread-Index: AQHdQHPI7dqC+8IAQk2jIEqvciKV4rbGaHUAgANnlqA=
Date: Fri, 11 Sep 2026 20:03:35 +0000
Message-ID: <CH3PR11MB046149039101C345C8301BF4CFC1BE2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
 <20260909154739.1515514-35-michael.j.ruhl@intel.com>
 <20260909160258.DE3701F00A3A@smtp.kernel.org>
In-Reply-To: <20260909160258.DE3701F00A3A@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DS4PR11MB570107:EE_
x-ms-office365-filtering-correlation-id: 6637f196-3ab4-4b44-1d7f-08df103fc31e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|6133799003|4143699003|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: tzPMa+spXMfKU2C7hKFvC7/SRoBgMlmEdmtAT5Eu453mDLySlXmb9J8guNqOa2z6oB6LfffAn+PDlOfc5t/BWmmMRRPXj737dMhDGkvoFZKbQpl9oOENhoym4vObZevuyytkmRNh3jN6IoRz5NFz1X8X5vwKMRvSqwZhQXfzn5shjt8MGKcDKes5VgnCu9dqXFZZfvO4QJN+vlKxbiKMbq0rwpm4U9ANGs94+IhaeDf1pRv/gMDOUScYUe6Yak/ivQFbIrVjFTfG+reOtgtopwuOW3xVH2hMexwWzxc/mYLhx2fjZApmPT21JtyrbHXda1fKIoERy/SKVUtnnJCB3Swr7w0oWXhULr2ZpheMQjZu03UnFLpqKXcUzYcuxCYukvw2T8z61vrPo6NIX0+HJ6LCvPdofLcFu1yzWk6yJLAE9rK1K+RitMtwK+mKHcw9h7In9L2kovg7XukuvlTUIbeuN+JG7a3ZTfXqBAEDMgWcZTa0zjfrjPMvjqdRCenGLa14DOK1QsGwBUXTngQdENP4EuNYEX/0PV7jgdntglcHLfTwFcLx4MAxsJoEEN6rRGq9CVvYZnH/vcanZKfe0210JoT3hGR4iaJhzDM4hS2RzX1ehH5O2O1RI76UqYBxQ8cQIVlwOeWeah0jbYTY1RXbDBG0NyurtR4uZBjmsVQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(6133799003)(4143699003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDFScVg4SE9FdnNXOFhZT3lITzdQak1Wdk5FeHlmQ0p0OXFiQ3RtOXRsS21D?=
 =?utf-8?B?YXlsUWtRbytYQ1FwQjNMcUZIR3RkbjBpRFZ6SE9LVXpFUS9weWNUUGZDMHIw?=
 =?utf-8?B?WnRNUnRlQlJZbHdGRUdIUG5LOVBleC9WR3ZGbzZRZlV4cUhFSnZoR0xvNnl2?=
 =?utf-8?B?UW5wY1REZGRyRUxWMkpmV1RBd1FtS3JKM2xLREc4MlVLMEdzTUN3aGZtQ0c2?=
 =?utf-8?B?dy81MlBhVHhmYUpMTVY0REhSdXFZNlRwVnF0MnkrNVNBRmlMVEVEcmZDUksz?=
 =?utf-8?B?Zy9uUjBWSjY1T290YmQ0TDI3eDNaVGc5bCtKaVJ3RDROTUhueVpQNlM5bEk2?=
 =?utf-8?B?SGczQUdwSjNyaWowVVAxRFdFTk9PK0kzcVBJamUwN0VWNnVCMnExT0pDb0xv?=
 =?utf-8?B?TVJvelZFekxTY1BYVDFOU3hXb2ZmUkRVbHN0VmJObTVJL3BITlNMWXg2YzAx?=
 =?utf-8?B?VE5KamlJWTc5M2h4NzR3UGhIdDZaY29hQjZyd1MzL2Z5UjY4T2JpT0p6czhp?=
 =?utf-8?B?cnZyNFF4a2ZFelhHRHYwQUZGOStZdEYyRHk1UXNhUEduRkZVYVhwZHFIQmx2?=
 =?utf-8?B?M2JBcVZLQnpHUXVjOVVISWpKclFQbW5rMWU1V1JvU0QveU5PRHdWMFlwaVdG?=
 =?utf-8?B?eFVWdTIxT01CM1hPWmphNi9MejEzUjU3QWkwQXdhaWxLTmc5dXBkbmMvZmZm?=
 =?utf-8?B?a1Juei9sWFhDYzJWSzJOQmUwMHNQWTBYdXhWVjltZEVpQ1NVN1hsajNBUU9E?=
 =?utf-8?B?cDdSWnNGT2RrU3VGTVZiVWhjS2huQzlyRlc1b25LeWdFSlNIL3QrTUlmVHk3?=
 =?utf-8?B?SUI1SjJWZldXNjdQOTRSUjBvUkkxSEhZT0x5Nm12VnhsejgvNENZNjE4NDB4?=
 =?utf-8?B?SXJMcnJCNml5VmNhU2RxNGlVSkpERkZxRCtXcTB6Tyt1VWx1VGg2S3FVK3BR?=
 =?utf-8?B?REtENkdUS1VzOGs4WnhXNFd1YTRCVHJGYThUdGpmQmpqclQwdEYyd2lHT1c2?=
 =?utf-8?B?UzV2elFhSHVjNlBabHZtcU43MWRTUUp3Y1A5emovZlpmc1ZpUGNLTmlzTEh5?=
 =?utf-8?B?YmNVUnRFczNZWjZDQ1ZLeENUZk9PQ3oxTmZsaDd3eXhudFN3R0hIdG9BbFl3?=
 =?utf-8?B?eDg5QmFFZmwvQkM2S0l3T1NTNFMwV0EzWW04MTJ5TEUzazlPMXJKemljQWpM?=
 =?utf-8?B?RlI1QzNwZ1hyNFFGRm1YTDEyY1hsTXRiSDI5UzQrOWtnYmRRV0hTeWNGclEx?=
 =?utf-8?B?RHJmTFhhaFBVM1E0azN5d3U3SmRCWjhvQ01reEJwKzNST1lZbmlCb0ZUaDRP?=
 =?utf-8?B?SWltaDNyN0tXZ3RrV1NGVDVoVlYrWUJWUFFwNDhkTVMwbDNmV3piaGFqYTdn?=
 =?utf-8?B?Zm5lUjM3M0lISmpuTGJMWlZRR1dRREpXRjEwWXhqOE5tV3E2UmdVNE1SdFpx?=
 =?utf-8?B?YnZJMlJ3ZHJiV0NJZWYvbWE5MFdMQkNIcTlCVlZwbkl6VHcxR2ZUU011RHdF?=
 =?utf-8?B?MjdmcFMxOE1tSThyU3BvRno3Z0VFc3JEbzQ2ZzVLcDZDZ1ZwOWVvVlcyNENk?=
 =?utf-8?B?Vkd4cmdBdHc2UTNydnFISC8zd2Fwaml4S0NsQ2RkWUxiU2ZSY1U3UktGcjEy?=
 =?utf-8?B?R3NCYkVpRWM3ZkRXbzRDZHROSFJpQ2Z5ZjBOZXZqdnNOaWlaeldIWFl0cWJK?=
 =?utf-8?B?S1NvVG9SNlBUUCtvdFJNeDczS0F5NW5MWVdIamtqOXBSdFVmcU16TEV2UE9X?=
 =?utf-8?B?MGRCUi91T0Vxb1U0NkFZTkJMdkR0QnduS1E1RUllTkVZd0dMbUtTR2x4NC9D?=
 =?utf-8?B?cy9jT0wvNjk3QmJhQktHamxkUmZFQm9LaEFMUWNoOXpLcnc4dVU0bExQdTM2?=
 =?utf-8?B?USt5bHErdWxZa0YwR1lSQnZqSENVaEQrbTNlTGNBSDZHbm9VM0hxV3NkS1Rn?=
 =?utf-8?B?WnpockxwMDkxSDl1VHUxOU9uMlAxaXlpbGQrMi9jMkRPZ2FpTmZVdGRsRDh1?=
 =?utf-8?B?Y28rdXVlRXAzUVVrb2VvNDgralRzTTFyRjlYa2FYbHBadG42L3dsa1lEN0l2?=
 =?utf-8?B?MlM4cnVqQjhDN1RiY2twOTlmTnN4c1dPbDlPakJPRmJ5WW1BZjdpKzRvYVRi?=
 =?utf-8?B?ZWxYbHdQYjF5eXF2SGthRm01cXVldVVQZzZJRWU2WnF3ZjhNWmxScDNvZG9Q?=
 =?utf-8?B?b1RnWjZCS3ZFWlRwYlVKbVo3dHJFZlFoNzhFeEdJQmxMSG53aEppUUltRHQ1?=
 =?utf-8?B?VmhqS3gwOC94Ly9WK3Z3aU9YTzhlb0hINzhzYjN3TklhM2lHT3hTRWNpY1FZ?=
 =?utf-8?B?RU51cEdTTlBJRURRYlI5UDZ4dVpiUlQwY08wRjFacTZta1NKd1hxUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jaR1XkwZbpu/SpeT9tyYGVn3B3e/donn09ki55H3LFUkjP3y/rqVTDD6cMu6KEQlXlAZmFmAKOoy6KEUosKDACEQeKofhgj5AnrbLtAr6CvIbPAERad5Q3BuVf/75NKSStebVSdcmwHethBxionmvoWrgKR+/H25ja77OwXKfp70vX0A0FGP2vv1jyz1lW3IaVALkUJdttOWh/ojnCBEesUZ9Mm+0LyINYH1AgMuCbo8njv882C3/bm5ljZ7Vmphy4fs2oWP1KT2sCrA8l/P0DpK4pPNfeXOeIPKa4OWjJvhpeGHI71Klno0xikS7b/xzFZKSYdSMISirUHt9WYBDQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6637f196-3ab4-4b44-1d7f-08df103fc31e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 20:03:35.2213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/+Dcqw3aCUjpqcbBo5JOD+4Y3axoGMghVoBYV9nb1DFpIjihyr00htMihPYkexmDn66x90J12AQ8H7pV90052QF9+Pgcot/s0c1bAEivqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB570107
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IHNhc2hpa28tYm90QGtlcm5l
bC5vcmcgPHNhc2hpa28tYm90QGtlcm5lbC5vcmc+DQo+U2VudDogV2VkbmVzZGF5LCBTZXB0ZW1i
ZXIgOSwgMjAyNiAxMjowMyBQTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhs
QGludGVsLmNvbT4NCj5DYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVj
dDogUmU6IFtQQVRDSCB2NyAxMy8yMF0gZHJtL3hlL3ZzZWM6IEFkZCBiYXNlX29mZnNldCB0byBh
bGxvdyBmb3IgbW9yZQ0KPmZsZXhpYmlsdHkNCj4NCj5UaGFuayB5b3UgZm9yIHlvdXIgY29udHJp
YnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0K
PmNvbnNpZGVyOg0KPi0gW0hpZ2hdIFRpbWUtb2YtY2hlY2sgdG8gdGltZS1vZi11c2UgKFRPQ1RP
VSkgcmFjZSBjb25kaXRpb24gaW4NCj54ZV9wbXRfdGVsZW1fcmVhZCB3aGVuIGNhbGN1bGF0aW5n
IHRlbGVtX2FkZHIuDQo+LS0NCj4NCj5jb21taXQgN2U1ZGMwNGEwZmNkNjM0YTYyNjg0NjA3ZWUy
OGU0Y2IxMmU5OWViMg0KPkF1dGhvcjogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBp
bnRlbC5jb20+DQo+DQo+ZHJtL3hlL3ZzZWM6IEFkZCBiYXNlX29mZnNldCB0byBhbGxvdyBmb3Ig
bW9yZSBmbGV4aWJpbHR5DQo+DQo+VGhpcyBjb21taXQgaW50cm9kdWNlcyBhIGJhc2Vfb2Zmc2V0
IGZvciBwbXRfdGVsZW1fcmVhZCgpIHRvIHN1cHBvcnQgb3RoZXINCj5kZXZpY2VzIHRoYXQgcmVx
dWlyZSBhIG5vbi1maXhlZCBvZmZzZXQuIEl0IGFkZHMgYSBjaGVjayB0byB2ZXJpZnkgdGhhdCB0
aGUNCj5vZmZzZXQgaGFzIGJlZW4gc2V0IGJlZm9yZSBhbGxvd2luZyBkZXZpY2UgYWNjZXNzLg0K
Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiBpbmRleCBjYTg0MTQ0NDFhNjkyLi44NTY5NzM0NzNm
ZDc1IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPlsgLi4uIF0NCj4+IEBAIC0xNzMsMTQg
KzE3MywxNSBAQCBzdGF0aWMgaW50IHhlX2d1aWRfZGVjb2RlKHUzMiBndWlkLCBpbnQgKmluZGV4
LA0KPnUzMiAqb2Zmc2V0KQ0KPj4gICAqIFJldHVybjoNCj4+ICAgKiAqIC1FTk9ERVYgZGV2aWNl
IGlzIG5vdCBhdmFpbGFibGUgKGhvdHBsdWcpDQo+PiAgICogKiAtRUlOVkFMIGZvciBWRiBhbmQg
UE1UIFdBVENIRVIgcmVxdWVzdHMNCj4+ICsgKiAqIC1FQUdBSU4gYmFzZV9vZmZzZXQgaGFzIG5v
dCBiZWVuIHNldCwgc28gaW5pdCBwYXRoIGhhcyBub3QgeWV0IGJlZW4NCj5kb25lLg0KPj4gICAq
ICogY291bnQgICBudW1iZXIgb2YgYnl0ZXMgcmVhZCBvbiBzdWNjZXNzDQo+PiAgICovDQo+PiAg
aW50IHhlX3BtdF90ZWxlbV9yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyIGd1aWQsIHU2NCAq
ZGF0YSwgbG9mZl90DQo+dXNlcl9vZmZzZXQsDQo+PiAgCQkgICAgICB1MzIgY291bnQpDQo+PiAg
ew0KPj4gIAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGtkZXZfdG9feGVfZGV2aWNlKGRldik7DQo+
PiAgCXUzMiBjYXBfdHlwZSA9IEZJRUxEX0dFVChHVUlEX0NBUF9UWVBFLCBndWlkKTsNCj4+ICsJ
dm9pZCBfX2lvbWVtICp0ZWxlbV9hZGRyID0geGUtPm1taW8ucmVncyArIHhlLT5wbXQuYmFzZV9v
ZmZzZXQ7DQo+DQo+W1NldmVyaXR5OiBIaWdoXQ0KPkNhbiB0aGlzIGNhdXNlIGFuIG91dC1vZi1i
b3VuZHMgTU1JTyByZWFkIGR1ZSB0byBhIHRpbWUtb2YtY2hlY2sgdG8NCj50aW1lLW9mLXVzZSAo
VE9DVE9VKSByYWNlPw0KPg0KPklmIGFuIHVucHJpdmlsZWdlZCB1c2VyIHJlYWRzIHRoZSBod21v
biBzeXNmcyBmaWxlcyAoZS5nLiwgZW5lcmd5MV9pbnB1dCkNCj5kdXJpbmcgZHJpdmVyIGxvYWQs
IHhlX3BtdF90ZWxlbV9yZWFkKCkgY2FuIGJlIGludm9rZWQgY29uY3VycmVudGx5IHdpdGgNCj54
ZV9kZXZpY2VfcHJvYmUoKSBiZWZvcmUgeGVfdnNlY19pbml0KCkgc2V0cyBiYXNlX29mZnNldC4N
Cj4NCj5BdCB0aGlzIHBvaW50LCB4ZS0+cG10LmJhc2Vfb2Zmc2V0IGlzIDAsIHNvIHRlbGVtX2Fk
ZHIgaXMgZXZhbHVhdGVkIGFzDQo+eGUtPm1taW8ucmVncy4NCj4NCj4+ICAJdTMyIG1lbV9yZWdp
b247DQo+PiAgCXUzMiBvZmZzZXQ7DQo+PiAgCWludCByZXQgPSAwOw0KPj4gQEAgLTE5NCw2ICsx
OTUsMTEgQEAgaW50IHhlX3BtdF90ZWxlbV9yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyDQo+
Z3VpZCwgdTY0ICpkYXRhLCBsb2ZmX3QgdXNlcl9vZmZzZQ0KPj4gIAkJZ290byBkZXZfZXhpdDsN
Cj4+ICAJfQ0KPj4NCj4+ICsJaWYgKCF4ZS0+cG10LmJhc2Vfb2Zmc2V0KSB7DQo+PiArCQlyZXQg
PSAtRUFHQUlOOw0KPj4gKwkJZ290byBkZXZfZXhpdDsNCj4+ICsJfQ0KPg0KPltTZXZlcml0eTog
SGlnaF0NCj5CZWNhdXNlIGRybV9kZXZfZW50ZXIoKSAoY2FsbGVkIGp1c3QgYmVmb3JlIHRoaXMg
aW4gdGhlIGZ1bmN0aW9uKSBhY3RzIGFzIGENCj5jb21waWxlciBhbmQgbWVtb3J5IGJhcnJpZXIs
IGlmIHhlX3ZzZWNfaW5pdCgpIGV4ZWN1dGVzIGNvbmN1cnJlbnRseSBhbmQNCj5zZXRzIGJhc2Vf
b2Zmc2V0Og0KPg0KPkNQVTENCj54ZV92c2VjX2luaXQoKQ0KPiAgIHhlLT5wbXQuYmFzZV9vZmZz
ZXQgPSBCTUdfVEVMRU1FVFJZX09GRlNFVDsNCj4NCj5DUFUyDQo+eGVfcG10X3RlbGVtX3JlYWQo
KQ0KPiAgIC8vIGNhbGN1bGF0ZWQgdGVsZW1fYWRkciBlYXJsaWVyIHdpdGggYmFzZV9vZmZzZXQg
PT0gMA0KPiAgIGlmICgheGUtPnBtdC5iYXNlX29mZnNldCkgLy8gTm93IHJlYWRzIEJNR19URUxF
TUVUUllfT0ZGU0VULCBwYXNzZXMNCg0KaW5pdCBoYXBwZW5zIGR1cmluZyBwcm9iZQ0KDQp0ZWxl
bSByZWFkIHdpbGwgbmV2ZXIgaGFwcGVuIHVudGlsIGFmdGVyIGluaXQgaXMgY29tcGxldGVkLg0K
DQpTbyB0aGlzIHJhY2UgY2Fubm90IGhhcHBlbi4NCg0KbQ0KDQoNCj5XaWxsIHRoZSBmdW5jdGlv
biB0aGVuIHByb2NlZWQgdG8gdXNlIHRoZSBzdGFsZSB0ZWxlbV9hZGRyIChkZXJpdmVkIGZyb20g
MCkNCj5pbnN0ZWFkIG9mIHRoZSBwcm9wZXIgb2Zmc2V0LCByZXN1bHRpbmcgaW4gcmVhZGluZyBm
cm9tIHRoZSB3cm9uZyBoYXJkd2FyZQ0KPnJlZ2lzdGVycyB3aGVuIG1lbWNweV9mcm9taW8oKSBp
cyBsYXRlciBjYWxsZWQ/DQo+DQo+U2hvdWxkIHRlbGVtX2FkZHIgYmUgY29tcHV0ZWQgYWZ0ZXIg
dGhpcyB2YWxpZGF0aW9uIGNoZWNrIHRvIGVuc3VyZSB0aGUNCj5jb3JyZWN0IG9mZnNldCBpcyB1
c2VkPw0KPg0KPi0tDQo+U2FzaGlrbyBBSSByZXZpZXcgwrcNCj5odHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA5MDkxNTQ3MzkuMTUxNTUxNC0yMi0NCj5taWNoYWVsLmoucnVobEBp
bnRlbC5jb20/cGFydD0xMw0K
