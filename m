Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795579678;
	b=mAXx1ZHSMrddFtS8T+bFxvO/ZIQtU+e5cOCgXBK8PFPZxDXhBYUYFvaKoFYyxff3K/Qr
	 PM0r4J9zNCKLISiLMUnu9IJkkzwK65sg1BPwrgptmfmQkVqriABHzR2BIYPRabcixsWTc
	 ZpHVs72lOcJcXM/YFg9N73il54k1Qm3OM+mDfvBMbo9h3azMkbxKIbt6PpZ34dJKBuS17
	 c8LnqJhy9uQLkfGh3YVDjc1Y7rcce7ZWrYzP4CJM6D4H0TxLSbYo9yM5kkWDNceNDKitp
	 8r1bANzqy1KJo6IMDcz6fJAIJG0wr2bL8ay1I5436vt7Dbkn0W32xtk95CgUII8nsBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579678;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=XQd4bs17KGuKlZjTkx/bPO5ZZkUhpyBhQQWpwbW/XKc=;
	b=qFziDmrMXJ65QXKHKWQtXxBrkaVKpkCs2cDN1i2amUuVZ7c6DNXqZ5ZqK9ibsFqVKidk
	 MyRsZxXMSWWjKvzJHam4N5a+exN63Ts8mZP9QR5nLBZN+7KjUgcnbY/Hw7NCzoAlj3bFC
	 8JoPtNzoJEBAiyNFn9CpQG7/MYu4gu1FlxibRzQ26eqZaRxh4pxzWw3eqa4nhTtlEK+LR
	 dC0f801njH68TZZQyylkH8iCvIhP41GV9KIImVmVg1S4VbsCuE/v84aBk4yznuVa0rFb5
	 1G/iA+imTrPkpx32o5/1+iP5oiSC64iPWBnnOADc959kocv5CSo+kW7Hyl0Y5fV6UMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cUyBbHBS;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=loRr8W1R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264A6606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 04:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 264A6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cUyBbHBS;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=loRr8W1R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795579677; x=1827115677;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XQd4bs17KGuKlZjTkx/bPO5ZZkUhpyBhQQWpwbW/XKc=;
  b=cUyBbHBS5Ou4lq/9izBDlbRjGjDz2XZA+ZwbylmU8ckgm980hJJGjjgH
   9TJEfTxt1Y1aArPi2Wq4+kXH7w6Q01V3EFwUed4WdpxG2rfueYQR2MOyP
   YLRHdD4EhDFZ8guMRvsNQHgsm4jWJQY2ARA7uxJvj0wD4Fg/P095SNPQW
   sJC+wRHi4uTQa5THxkOSNNHMOBqZKwqEiAzz0p5aIp6pxTnbA33OwTB1j
   lZPSJLFer5iZQro8R9Qb2gkl+WJnAtMZ16+rJLwRlhg4r4yOEvanIlTJm
   RQr6rDrTmp+4whIiGtb2Mboh7hR+ExpmECv68r7pOIKp9L99M35j5/DfG
   w==;
X-CSE-ConnectionGUID: 4ReP4EhZSBK27VInospDqg==
X-CSE-MsgGUID: /zsyOGBqRB+9ts1ZQCPTMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4345385"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4345385"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 20:07:55 -0800
X-CSE-ConnectionGUID: ubUNsTm4SpeE6ZNm+ZVIdQ==
X-CSE-MsgGUID: GqXkgJqfRtewqg/Ay4+k2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11959463"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 20:07:55 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 20:07:55 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 20:07:55 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 20:07:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLyK3v41OHmmGE7S/ALgNpktSIJf5DqF75R+XF2z2yrnLGJ0qyR70RHr2GE4zPEu5ZshNZueAbPKtnGewqsceRiBZfDEEAUYeIE3KIk5S3UvoyqMCjM91knxpwSVXm9NkahG62gQ+iEaoAyALIA1WyYl05B1M2TRrv9jNxeNUeI2N+8UTIrlTxAi/UNhdI4olcnFd6HA2uTC3FeAdehJMalT6iZNqMNb6qBiN5/h4ND2Oikkm6s4lfQCrS3S4PMhceCBH1EEHTToCapqQgvLpqG3gFXVmeMhAh2zSTz+hMuEo4yHy8mItTb6DGqMl+6jrWARXefVir8G0kooRscgDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQd4bs17KGuKlZjTkx/bPO5ZZkUhpyBhQQWpwbW/XKc=;
 b=hPA0S3u9qZ/RiZ7Chl2KMDw8LItsO6LbzwFdbNksBkANa6dXRpC41/4a/nYU8cVkycspKOAFyau7XfoijKjuFZihcpul6TCTqol61AQOd9mlRdPBniQ9uD8/tFPYm5HBevP7lwwBG9FgIO5jNOiWlyy4P+jGmhjS5YAyklEe2zc44mEmCzDYLZzcfJfKXR/38/dO9tRpN8jm8OL5dkqWakhk36yFl/uHlidFuvpkiu5/xN86c6gWTBhHLjfybWfUKBUGhIfeNEVX3CQE/H4kxleybLSbLhKXWA6wyVRkYEz9w9kj8s7VXYIfzom3bNOjEkZeqCtwX+7gLucA0hju5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQd4bs17KGuKlZjTkx/bPO5ZZkUhpyBhQQWpwbW/XKc=;
 b=loRr8W1RYrg9ASXJiLZdT5Yl5Fyp3gUVVwFD94+5ouAQ0B6NmqSPGEUqnX4G05Pw/0PV0HKjNKk9cSrn2d11fXiCKKj+JtGYLTtvb3RkY8Pc0xi4hLbXUfqsWsiGsyaCq3pbZSkm+Tae2tgX4GVxetAkckv9RvXZBUxR4qYfeU0=
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 by CH3PR11MB677380.namprd11.prod.outlook.com (2603:10b6:610:363::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 04:07:49 +0000
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e]) by SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e%6]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 04:07:49 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCHv2] drm/i915/pps: reconcile a BIOS-enabled VDD without
 leaking its wakeref
Thread-Topic: [PATCHv2] drm/i915/pps: reconcile a BIOS-enabled VDD without
 leaking its wakeref
Thread-Index: AQHdOSy2eI/CIYu/akKiw4slTh9BHba37CwAgIbGL6A=
Date: Wed, 25 Nov 2026 04:07:49 +0000
Message-ID: <SJ0PR11MB50394C648E6976E3A19F8006BA432@SJ0PR11MB5039.namprd11.prod.outlook.com>
References: <20260831044036.1236136-1-arun.r.murthy@intel.com>
 <20260831093854.1427305-1-arun.r.murthy@intel.com>
 <20260831095825.26C9A1F000E9@smtp.kernel.org>
In-Reply-To: <20260831095825.26C9A1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5039:EE_|CH3PR11MB677380:EE_
x-ms-office365-filtering-correlation-id: 36276acb-320c-4307-9d99-08df4aa9ab37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|10067099003|4143699003|261028144727099003|261021121427099003|56012099006|11063799006|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|261026121527099003|18002099003|22082099003|6133799003|13003099007|3023799007;
x-microsoft-antispam-message-info: 63NeXtDia0qIGdcHBXhVAJ7bemamCZu2UPJnFQ3v3lnaJ7s6MRdP5EGkDP7RFioQbcV82uQxeQUAH4V4mn4I/QRjRSTjiXgQfLmvtGo3jJUswUwF5QsGqciwm3HZTroFlrk8WVVPw/LSVxbn40Hw22X1lFsip7z9LijRXjZAU7qG7N/dn0E3Ml8YhU66DPHJFafM6H+wIFo+QpTYv0Onf/CssG+0+Rf29+edwshN5QWGGIetoXzmnkihdbn2/3K91Oh5/gFwYzHsOXIHsg/QDAOlwhRjFQC8ZNcksKtL1CqHd8lvtHw9RH5/dtF/pxOL8MIGAFztpcHC9mHuwJmNLLM9uFCl7rrCOr8q45DL6ipp07otiEWR9XO0INKnUzY5RJWwvq3LrE7/Mr1nfXvfr5Mg9Hy4lnzdNKaD5Qvnev9Lnb7sxycnRUzn75oVFKhpvw0XbvFvseaScn23JTvCn2lHjA3ukLefbQOXmrF/vAVROAMJzLSc1OLCx1CyGRmHwQq8eS4XlCMzOkCXc0BIjgJeUgKoyjCGcubyhUDYGe4iiixU23esv1fV6n7icxCYfFMGBdINOTrVo91aWsRSuavi1zO1kv1x99nFz7a1Vd2Apua8B5E+SHc60hnofbxChrvLNjr+bqHEW8CStBQ3lg6fxXTxRx8wCqt6rVvq48g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(4143699003)(261028144727099003)(261021121427099003)(56012099006)(11063799006)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261026121527099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVRPTThXMGJEU3BZVUoycG9NejJzL1JLWkUwVjBQQUdyMXBPMXJ0SXlaaUUz?=
 =?utf-8?B?R3VHSkg0Y2pEd05RY0o2OXdmT0hIUmFJb1VuMDZ3bitQRXJDZ2hQUUhncHZX?=
 =?utf-8?B?NjlZVmRHeGdWOVQ1U2VoRXFWdnQwWUNOQU8wSDRudnV5Q1NUZEdielMwcnFv?=
 =?utf-8?B?cGUrMCtkYUd1VzM1VXRIb05pVzY1bjM5ZU9RQ1pMc2o5SVU2aFc0TElVVVNs?=
 =?utf-8?B?aGxEWHhyTTQxaGZIVUN4akR2ZHBFUTdQcThiSGJHd3pubFN0ZWdnbmUwNDRn?=
 =?utf-8?B?V0t2SllJOFQxTHo0anp3RndUUFR5bkNudk1Cc1JsZ0tGZ0ZPd3VFNlpkR2g4?=
 =?utf-8?B?bHpBdzYxK0RKY0p6amtCaHpiMGp6YXVoYkE0NXhsanVCUmVPMEpjOFBvUVFB?=
 =?utf-8?B?YWROUlRQWEVnTC9JWW8yRUdhaC9uWGp6bTVlUW1TZ081Nm9oRENrQUxzRkNm?=
 =?utf-8?B?anNHVG9waE9TOGVHMmZMdlUxOEpxSlBKcDRlODY1VHhOQ254WkFiZWNraWgv?=
 =?utf-8?B?TTRXZStQbzhObnE0cUFaYTdUcHRJcld1SHk1S0pDaFRUSkowVCt6ZFVad0Rj?=
 =?utf-8?B?K0JFYVF0TnN4WSs5MXRYZjAwb2tTVExERWxrb1VKVFdQa0VucnlaRzN6OU9N?=
 =?utf-8?B?YTNpOUlDOEp2ODNDRkhQOHRsdTdSRU03a09IbzNjSldicW5iOW12M05pbEsy?=
 =?utf-8?B?YTdTbkpOK2ZFNzJFQ0JpSjUyMmc5RVBmVXZ6OXFZSS9CVjVHdmZsREZlM1pu?=
 =?utf-8?B?OFFqVzYxODJqajZLdE1VaFMrRDFEK1lTV2I4Q2pYTnplS2hGNEx0QkZVOS9T?=
 =?utf-8?B?SDlLMFNxT1BHdmI2TDhMMHZ2WFNUeXNMMFRucmhuRWEvaWU5YWJzNGRuREhD?=
 =?utf-8?B?dmZiRmxzMnE5RUFxZW8raXluKzV6YjhuVU1kT21sQzRxb3lkSnYyV2pWSFVO?=
 =?utf-8?B?ZkZySEs3YWdDRDFHY0xWUkIxUVRzNlEvUnhhTFprNGIvMW9icXdCUmZjamN3?=
 =?utf-8?B?czZSVm10dFJueXdMNGRyWTFmT0dPMEpyaWZ3YWhFVzh6Yk9xTUpSRlB1SlBa?=
 =?utf-8?B?UU9JZytMWmpSMzMvRnNJZlcrUUxTNDJDUkJkU1lOalc2dG9aN3lVL1kvWnlZ?=
 =?utf-8?B?Vmh0b3E3TWRIdzQ0TUJpNW5WN284WEozdXp5VmVhT3VuT0s4NDhKQThPRHUv?=
 =?utf-8?B?UnRWSG9NOTJCYmJFV2hmZDBhcG11c1RQdzZ4UFNNUlhkYmhKeHUwWnlsbnY3?=
 =?utf-8?B?cHZUMHZUM0w1NmhYeGsya3hsVXF6aGx3RjJ1b0w3eDkvb25WMS8wZ1pLSkZu?=
 =?utf-8?B?Z3JXWWVOeEtHaGtJdEI2UnIwK3hHRGlQOGxqV09ROHhhMEMzNWZXMklydUg1?=
 =?utf-8?B?Q0pWeDBJK2FSRDg0aWhvWnNMWWU5UFBPb1R0YlpLUm5TMjkwenI0TFBQTHY2?=
 =?utf-8?B?aGpSbW01VXNWQUFKbWxMZnAzQjJRbjIvc1lvT0JyWkUxeWc2UThPMUs4eXV4?=
 =?utf-8?B?UU90cXhEVE10ZTFMVUk0V2hlVUxSOW5odW92UjNpeWM4QmtSdGE0Si90by8x?=
 =?utf-8?B?VTdqZW5jTGE2aXUzbHNxWjZXeEVVT051all4SFFRL3grTUN0UnBYQXR4YkhF?=
 =?utf-8?B?RFd4K2tFSVYydWtYb2VqYWF4ZzMyaFVrYWJhMW13OEcybVJDRktDcXpUYXZW?=
 =?utf-8?B?NFFRYUlPdGxLaDIzL1Ewa3YyTzlwOTlEMVRTTFptYVlZRUtOdVJNQjhLSjdp?=
 =?utf-8?B?dDZSOVh3TTVYbmJYSElURHIzbitIMSs3cFZRSXFhQytrSlZZTTF2OWdhRk1F?=
 =?utf-8?B?SW56Zk5Xa3cyVm9FVjVBRmtmUHFMa3QzWmhlK3JNcnU5THkwRmdoUWsybWFE?=
 =?utf-8?B?ZHRLSzQ3MTZTa1h1dXd5M1NWaHhyRDhmUEJ0eEVDcEtjM3VMYVlmLzJnWGxX?=
 =?utf-8?B?T21iaVlXYlFlMjk0UTg4SENlbHNhbnhybm1kSDNRZFJZVWZ1WjUzaFdPMFdB?=
 =?utf-8?B?QzBpWldrN3hJclcvcXlMVS91dW9Bc2NKdzlVSW90TmZJdGNFeElheUdEcnZ2?=
 =?utf-8?B?TzdBNW1Pcmd0N1M0SEYvSWhyYlM1aUZxT2dlRFdxR3k3MnhPdVBTSWFyd0F4?=
 =?utf-8?B?SkhWYjF5TVBVL04rcE5MOWdtaklTZmNMWllHYXl5ME1wc1RjM2ExOFZ6Y2t0?=
 =?utf-8?B?cHRLMURmckhRRGwxZ2FwbjNVOGxoZHBQcVh3dWxEcUFmaE9DSDJ4NXlYS2U4?=
 =?utf-8?B?RnFDMzVVRld1Z2ljcDU0bUxlUnhyZmxpNVI4MUx4TUwrdUtsMHFSc0tMZEJx?=
 =?utf-8?B?SFI2VGRHQUh5VStBNEx0cGY4ZDVVdVhzOWpnajRtYlBiNXpLbU1adz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IMymBylCs4D7EMnPenm/INw3MW2GSdSuEhV3XMHMPm1h4q3PU/lsCA5QxhfrLYY7wTh30EXxtbPLA68gAH202ZP0BQzuHRlZOdSsSssQQ8/4fG3lmyqU2P+ZRJT2bAQJeo1Ng1Q0vKWTPp1yE0iVoa6KrPDs7rgWlTF0uBXZhlcUjsG093qyywmPpq3N5NsRgOb5VWmMma0GJBPfzXwEpb8iMXeMoIxWteOLKWYDdPR0n5jfj8sv9xAQU1+kkt4+xeM4zae+oWmHixci1wJA/BzOJbn6qh6Y0arzOjtwHfuq243CYA3DYcBSlqc/eKPbWqvpvxzic4WGRz9lhEQvkg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36276acb-320c-4307-9d99-08df4aa9ab37
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 04:07:49.1759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zG8IQQUxMWKTmRrgUFU1zs+KqShUnUxPJ6fL4lTv2RaaxcoRGVSnfnBrKJRRgUBTwxVbEuaA1PnfJ7nDq8QWIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB677380
X-OriginatorOrg: intel.com

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHNhc2hpa28tYm90QGtlcm5l
bC5vcmcgPHNhc2hpa28tYm90QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDMx
LCAyMDI2IDM6MjggUE0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVs
LmNvbT4NCj4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSHYyXSBkcm0vaTkxNS9wcHM6IHJlY29uY2lsZSBhIEJJT1MtZW5hYmxlZCBWREQg
d2l0aG91dA0KPiBsZWFraW5nIGl0cyB3YWtlcmVmDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIg
Y29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShz
KSB0bw0KPiBjb25zaWRlcjoNCj4gDQo+IFByZS1leGlzdGluZyBpc3N1ZXM6DQo+IC0gW0hpZ2hd
IEVhcmx5IHJldHVybiBpbiBpbnRlbF9wcHNfdmRkX29mZl9zeW5jX3VubG9ja2VkKCkgc2tpcHMg
d2FrZXJlZg0KPiBjbGVhbnVwIGFuZCBwZXJtYW5lbnRseSBsZWFrcyB2ZGRfd2FrZXJlZiBpZiB0
aGUgaGFyZHdhcmUgVkREIGJpdCBpcyByZXNldA0KPiBleHRlcm5hbGx5Lg0KPiAtLQ0KPiANCkFz
IFNhc2hpa28gaXRzZWxmIGhhcyB0YWdnZWQgYXMgaXQgcHJlLWV4aXN0aW5nIGlzc3VlLCB3aWxs
IGJlIHRha2VuIHNlcGFyYXRlbHkuIFRoaXMgcGF0Y2ggZm9jdXNlcyBvbiBmaXhpbmcgOiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vd29ya19pdGVtcy84
NDc3DQoNClRoYW5rcyBhbmQgUmVnYXJkcywNCkFydW4gUiBNdXJ0aHkNCi0tLS0tLS0tLS0tLS0t
LS0tLS0tDQoNCj4gY29tbWl0IDc0YzE1ZTBlYTI0ODY5OWRmY2JhNGMzYTAwMDk2NzZiNzcwYzgy
NDENCj4gQXV0aG9yOiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4g
U3ViamVjdDogZHJtL2k5MTUvcHBzOiByZWNvbmNpbGUgYSBCSU9TLWVuYWJsZWQgVkREIHdpdGhv
dXQgbGVha2luZyBpdHMNCj4gd2FrZXJlZg0KPiANCj4gV2hlbiB0aGUgQklPUyBsZWF2ZXMgdGhl
IGVEUCBWREQgZm9yY2UgYml0IGVuYWJsZWQgYXQgYm9vdCwgcHBzX3ZkZF9pbml0KCkNCj4gYWRv
cHRzIHRoYXQgc3RhdGUgYnkgdGFraW5nIGFuIEFVWCBwb3dlci1kb21haW4gcmVmZXJlbmNlIGlu
dG8gdmRkX3dha2VyZWYuDQo+IFRoaXMgY29tbWl0IGV4cGxpY2l0bHkgdHJhY2tzIHRoaXMgaGFu
ZG92ZXIgdG8gcHJldmVudCBibGluZGx5IHJldXNpbmcgb3IgbGVha2luZw0KPiB0aGUgd2FrZXJl
ZiB3aGVuIHRoZSBIVyBmb3JjZSBiaXQgaXMgcmVzZXQgdW5kZXIgdGhlIGRyaXZlci4NCj4gDQo+
IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8t
L3dvcmtfaXRlbXMvODQ3Nw0KPiANCj4gWyAuLi4gXQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bwcy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX3Bwcy5jDQo+ID4gaW5kZXggZDRjOThiMTUwZmEyYi4uNDE1Mjg4
MDc3NDM5NSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3Bwcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9w
cHMuYw0KPiA+IEBAIC03NTgsOSArNzU4LDIyIEBAIGJvb2wgaW50ZWxfcHBzX3ZkZF9vbl91bmxv
Y2tlZChzdHJ1Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwKQ0KPiA+ICAJaWYgKGVkcF9oYXZlX3Bh
bmVsX3ZkZChpbnRlbF9kcCkpDQo+ID4gIAkJcmV0dXJuIG5lZWRfdG9fZGlzYWJsZTsNCj4gPg0K
PiA+IC0JZHJtX1dBUk5fT04oZGlzcGxheS0+ZHJtLCBpbnRlbF9kcC0+cHBzLnZkZF93YWtlcmVm
KTsNCj4gPiAtCWludGVsX2RwLT5wcHMudmRkX3dha2VyZWYgPSBpbnRlbF9kaXNwbGF5X3Bvd2Vy
X2dldChkaXNwbGF5LA0KPiA+IC0NCj4gaW50ZWxfYXV4X3Bvd2VyX2RvbWFpbihkaWdfcG9ydCkp
Ow0KPiA+ICsJLyoNCj4gPiArCSAqIHBwc192ZGRfaW5pdCgpIG1heSBoYXZlIHRha2VuIGEgcmVm
ZXJlbmNlIGF0IHRoZSBCSU9TLT5kcml2ZXINCj4gaGFuZG92ZXINCj4gPiArCSAqIGZvciBhbiBh
bHJlYWR5LW9uIFZERCB3aG9zZSBIVyBmb3JjZSBiaXQgd2FzIHNpbmNlIHJlc2V0IHVuZGVyIHVz
DQo+IChEQw0KPiA+ICsJICogc3RhdGVzLCBETUMsIEJJT1MpLiBPbmx5IGluIHRoYXQgYm9vdC9y
ZXN1bWUgaGFuZG92ZXIgY2FzZSByZXVzZQ0KPiB0aGUNCj4gPiArCSAqIGhlbGQgcmVmZXJlbmNl
IGluc3RlYWQgb2Ygb3ZlcndyaXRpbmcgYW5kIGxlYWtpbmcgaXQuIEF0IHJ1bnRpbWUgYQ0KPiA+
ICsJICogaGVsZCB3YWtlcmVmIGhlcmUgaXMgYSByZWFsIGltYmFsYW5jZSwgc28ga2VlcCBhc3Nl
cnRpbmcgaXQgYW5kDQo+IGRlcGVuZA0KPiA+ICsJICogb24gdGhlIEhXIHJlYWQuDQo+ID4gKwkg
Ki8NCj4gPiArCWlmIChpbnRlbF9kcC0+cHBzLnZkZF93YWtlcmVmX2Jvb3QpIHsNCj4gPiArCQlp
bnRlbF9kcC0+cHBzLnZkZF93YWtlcmVmX2Jvb3QgPSBmYWxzZTsNCj4gPiArCX0gZWxzZSB7DQo+
ID4gKwkJZHJtX1dBUk5fT04oZGlzcGxheS0+ZHJtLCBpbnRlbF9kcC0+cHBzLnZkZF93YWtlcmVm
KTsNCj4gPiArCQlpbnRlbF9kcC0+cHBzLnZkZF93YWtlcmVmID0NCj4gPiArCQkJaW50ZWxfZGlz
cGxheV9wb3dlcl9nZXQoZGlzcGxheSwNCj4gPiArDQo+IAlpbnRlbF9hdXhfcG93ZXJfZG9tYWlu
KGRpZ19wb3J0KSk7DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IFRoaXMgaXMgYSBwcmUtZXhp
c3RpbmcgaXNzdWUsIGJ1dCBkb2VzIHRoaXMgb3ZlcndyaXRlIGFuZCBwZXJtYW5lbnRseSBsZWFr
IHRoZQ0KPiBydW50aW1lIHZkZF93YWtlcmVmIGlmIHRoZSBoYXJkd2FyZSBWREQgYml0IGlzIHJl
c2V0IGV4dGVybmFsbHk/DQo+IA0KPiBBcyB0aGUgY29tbWl0IG1lc3NhZ2UgYWNrbm93bGVkZ2Vz
LCB0aGUgaGFyZHdhcmUgVkREIGJpdCBjYW4gYmUgY2xlYXJlZA0KPiBleHRlcm5hbGx5IGJ5IERN
QywgREMgc3RhdGVzLCBvciBCSU9TIGluZGVwZW5kZW50bHkgb2YgdGhlIGRyaXZlci4NCj4gDQo+
IElmIHRoaXMgaGFwcGVucyB3aGlsZSBhIHJ1bnRpbWUgd2FrZXJlZiBpcyBoZWxkLCBhbmQgdGhl
IGRlbGF5ZWQgVkREIG9mZiB0aW1lcg0KPiBleHBpcmVzLCBpbnRlbF9wcHNfdmRkX29mZl9zeW5j
X3VubG9ja2VkKCkgYXBwZWFycyB0byByZXR1cm4gZWFybHkgd2l0aG91dA0KPiBkcm9wcGluZyB0
aGUgd2FrZXJlZjoNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHBz
LmM6aW50ZWxfcHBzX3ZkZF9vZmZfc3luY191bmxvY2tlZCgpIHsNCj4gICAgIC4uLg0KPiAgICAg
aWYgKCFlZHBfaGF2ZV9wYW5lbF92ZGQoaW50ZWxfZHApKQ0KPiAgICAgICAgIHJldHVybjsNCj4g
ICAgIC4uLg0KPiB9DQo+IA0KPiBJZiBpbnRlbF9wcHNfdmRkX29uX3VubG9ja2VkKCkgaXMgc3Vi
c2VxdWVudGx5IGNhbGxlZCwgaXQgdHJpZ2dlcnMgdGhpcw0KPiBXQVJOX09OIGFuZCBvdmVyd3Jp
dGVzIHRoZSBub24tTlVMTCB3YWtlcmVmIHBvaW50ZXIgd2l0aCBhIG5ldyBhbGxvY2F0aW9uLg0K
PiBUaGlzIG1ha2VzIHRoZSBvcmlnaW5hbCBsZWFrZWQgd2FrZXJlZiB1bnJlY292ZXJhYmxlLg0K
PiANCj4gSXMgdGhlcmUgYSB3YXkgdG8gc2FmZWx5IGNsZWFuIHVwIHRoZSBleGlzdGluZyBydW50
aW1lIHdha2VyZWYgYmVmb3JlIGFsbG9jYXRpbmcNCj4gYSBuZXcgb25lPw0KPiANCj4gPiArCX0N
Cj4gPg0KPiA+ICAJcHBfc3RhdF9yZWcgPSBfcHBfc3RhdF9yZWcoaW50ZWxfZHApOw0KPiA+ICAJ
cHBfY3RybF9yZWcgPSBfcHBfY3RybF9yZWcoaW50ZWxfZHApOw0KPiANCj4gLS0NCj4gU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODMxMDkz
ODU0LjE0MjczMDUtDQo+IDEtYXJ1bi5yLm11cnRoeUBpbnRlbC5jb20/cGFydD0xDQo=
