Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795287559;
	b=uRCqTagh/IzVRzrhafOMmm6sXkoPgcfK80QurlmMcISteC1IdcXabBAcPN2a2o8mY3fY
	 KOqK5PFlV39pB1OK8l4gnzLkErJfiXTfnjN5pqRK3cDYp2Fg1Cpq7B+cgx94Et6cULFd0
	 HdRWOp6kU298gwxoDc0s/S8B/7zG+zTkdM87XA5Tn2O3kA3LmljejJZbIApLKFFz0i8nJ
	 MZnYXmpxHLkb81a1dtgjTYPbs11jH166zfK/Hy/pTtvhms0TSai/BdsOKeh56aKwAMNbA
	 KFaNQFlN2T+j5/ngirFtOvoWwPL0oV9lhyUFZwGXP2GAtmtrVV9ORM0vxPj7RGwPg2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287559;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=r8KO5uEM6NSEE08ePHuODzY9DcEgcEIDvnjXuyyLL04=;
	b=IbFMYTxNDLBdbOZTez1QmJzhruBDk1dnQqKHrGccQFds1hrEx+nH7k6JK7y+adkIPCgF
	 uNaHUqR+7UCdKTupa2vVMMJK2c3y9IjKfOsk0WAUcU7Xb9HMJE8xO15v8z6J+2eB1x7Np
	 Eca7bk9qByhlWI/5k+5R/c0g/mfAQfktBecpPM7f8wj2RhYOIZQJ27cvXLF6AUUeJW7q+
	 vkpFnlQ7Q5vK6J+FFSOTM4xQWHruCzu0qREYmB9OlyXOTuJotwv5jxss6ZSebbETj+7O5
	 Qwa+s3Npd0kd+R0yg+FZwcf50JbuZvfyhOjYl7CVY+O5v4ImWY55odnzOUSIvLIK3sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N+EPTKY6;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="gwX0XZ/s";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7F1606A320
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 18:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7F1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N+EPTKY6;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gwX0XZ/s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795287560; x=1826823560;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=r8KO5uEM6NSEE08ePHuODzY9DcEgcEIDvnjXuyyLL04=;
  b=N+EPTKY6KDhlzub7+H5ppNABsCVjvCjpJQcZDYWFLiFvGCot4FxzUmFf
   9t01IdtA82r3bC9cglJG2L/guENXlQk1+vV/MOI1XW/X85GUkfheBMbQM
   8dmagDWjUF5DS2sbKLlFccDsSJyrmBeaH6By+GEXXg9dFLeEwIsWB8FCh
   PYwZQNsmnkePuRnnID/ksikMhQiCEBMRdWOQ0bUK58KToXA3NB+9Wpp8P
   2wCJtAGUUUptzegEG3fLfcdzR+jbiECVMyQgaAg/gpJAVz3Gb7yFfsAcd
   K3gNcTq8z08eEBE4qGvJ0Fx0fZkv75uUlkAwAugtaU1oHr0ZMciS85WnT
   Q==;
X-CSE-ConnectionGUID: uwXBitISTNWEhZyaraJXxg==
X-CSE-MsgGUID: ++cOWhSYS0WQ4FtASq663Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4184217"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4184217"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 10:59:19 -0800
X-CSE-ConnectionGUID: s7DJ2roBR/6wSfu7z5wUvw==
X-CSE-MsgGUID: 00kjS7vKSuKR0qNh1KyCrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10738312"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 10:59:18 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 10:59:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sat, 21 Nov 2026 10:59:17 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 10:59:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orqTVMD5sN4SJtP7VH8SHI8ZZKqUSmdcanGG3ZCVUGATg9chTs8kCjeIIawr3geZJ0DBIb07HOasJ2+XWFn2qYymJQXG2iA5osF01lPn1oi0EbEVwjduaJZmzL/G9H84XHfNCogWh3+xO3oailYvLkabJQVntRu6ztXvjAFyaD6ACdNKI8AFI3uSlON4wUW0kCTzf9OrEVXSGHqBKrclrfuv6KxmteMLTST55ebxps8FugoFP2/UWW8wx9BLfGJ3PpyOJ5eI/WNkuVeS2SunWCEIlfZ9hMibfxn+mWRGtxMCuBARvI+gALFTF+qfSMFqTILgJTsOw2PXQty1GnNtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8KO5uEM6NSEE08ePHuODzY9DcEgcEIDvnjXuyyLL04=;
 b=qb+LXqC4cPtqk2NkNsm4Fb47KlSRIRWNWJ91540VGwgUwo2x1PimYv1SsCNsU0VryjN8Syz8DvBH/YkQ/8sS4RCXbF+XY7FtGhLuMm4BZ5pLqh0aUSLcK0qz6IoztaN7yLmpzrB7SBu33hkj7/5JSyLYY7MKElpRFj+ZqIjWs+3QGMKerVpt8l6/1nM86SYQeAImgbw4egPSTqItxsCsZxr2Jbox4XQAK96BvcX4h9aCQ5qzLlAVpSLAN3JZSvvIOhPR0Y1w1Wl6j4Dx2ZyD81jIL0yYGHr/JaaWVkwWUFzVwN2TZxAafSn5QdLfxWmZM8T+Vzt0dJa12yRcTUXSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8KO5uEM6NSEE08ePHuODzY9DcEgcEIDvnjXuyyLL04=;
 b=gwX0XZ/s3Xw8u2JBDyJnUQWL7LcS16a0Aot9r9346BaEZsXo2eUtzY/xBFw4OoF8t8TzXCV6V+yWmvDucfbf/i3/Pw0PzkQdNnbpT7LlryKl23nt9YIsH39TUfqGKKfQIIvBnYCXtYFzRtXPxwyzmJ+PRMA7+wmpPWTCSI18hzM=
Received: from DS6PR11MB595933.namprd11.prod.outlook.com (2603:10b6:8:4c1::14)
 by DS7PR11MB6245.namprd11.prod.outlook.com (2603:10b6:8:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sat, 21 Nov
 2026 18:59:14 +0000
Received: from DS6PR11MB595933.namprd11.prod.outlook.com
 ([fe80::d008:121e:7706:5f0d]) by DS6PR11MB595933.namprd11.prod.outlook.com
 ([fe80::d008:121e:7706:5f0d%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 18:59:14 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 17/17] drm/xe: Don't error on failed media defeature
Thread-Topic: [PATCH 17/17] drm/xe: Don't error on failed media defeature
Thread-Index: AQHdeeVpME5IvwFd40Ke8y6PLimpPbc42pkAgAAGaQA=
Date: Sat, 21 Nov 2026 18:59:14 +0000
Message-ID: <7b3124994ec2a66fce78df5489aa66dfdf633914.camel@intel.com>
References: <20261121182317.48981-19-stuart.summers@intel.com>
	 <20261121182317.48981-36-stuart.summers@intel.com>
	 <sashiko-outbox-227263@kernel.org>
In-Reply-To: <sashiko-outbox-227263@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS6PR11MB595933:EE_|DS7PR11MB6245:EE_
x-ms-office365-filtering-correlation-id: e870c91a-e097-440f-107e-08df48018967
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261026121527099003|261026140227099003|261028144727099003|261022105027099003|38070700021|11063799006|4143699003|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|22082099003|18002099003|261009223027099003;
x-microsoft-antispam-message-info: sKNVlTuUYOg7hdwIn2ztIpQox05qbFTskS42jSTs4qfixkZHNF65B8lScllgeaW8appijk63QrVyuWssae5Bm494qwPium9AHY7wLSJiCsexEx7oC9OS9lsTU0QH91b/TwEleSfyaEhzxwCjw2ITOkBZfo3Xti6sKPGd8BP3oKsNBZkdYiFIAsXXvCXnHc0tYIaK+bkELF+DGbTtqff8AIbuznd3sm4ky1v0ggotcG7Ar+ji8PKH25bEgCpcO4hXIkMAI/DWDWwJ0o4cDk8veiI29AjwfaYbWXERtHkAfr1TLIa92EDXfV2CgLMC6S1rfQp44HBloX7EJZkwhSeZvtK3qdyyO7ppOWIe6rAd8a+PvDjoo0fnUgBaq2mueHBztI8TzJ9puLX/UoucTkmDFyM9Yqyj3LigyWWJ8QfQPG/YMmwxnGwjHFXEZ2ktRA3tLSq70pHM7QXNEluzhP9TGOtqDq9NY4QmpCR8UBq8mMjrIFtzSRPCWqy82kRPdxcOPSbxan15HQo42KHnPHuPUJBL1b61Kr6LqTJoa5xVvOR8MpAHl2nRd3LLUfa24Aecn/tetd7WX780Gi3lVlBD/8Xy5A4Nvdfmh+y9Qy79sO/DC/ugKsNuyoMTT1ywSIu07SygKLxr5EtqtwtAYIcTM+ONevZCeeK/tBEbQ8HPiK1fwoCfnW2qF+tyPlkQjeJ8OPL8XC/WwqUwN6UytWHnRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB595933.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1VXUFltd1Q2RG5tZFkxY2hlbFY4WWpGejdkUjRCS1ZvdzdBMlhSNExaQ0pr?=
 =?utf-8?B?V2JKakh4K3NEUC80R0g0b0txdmp1cTZRUFRRNTl1UDhNRVA5a1hCU29PaHRR?=
 =?utf-8?B?akt2dDQvbkVEWHp1N0VoNzRCb3c3K1d2UVlJU21pNHpXK0w5ZmtCOTJYL1U1?=
 =?utf-8?B?RUVZUndVVEV6RG5TamRYdGY2SkNQakxZSkhEdGw2WkdjRU8yUCtSNE53amRI?=
 =?utf-8?B?ZWMzZGltYUNGVVkrKzV5Z1RTRlFlczJyMWxBRFQwVmp2c0VIYXV6eVk0UFpm?=
 =?utf-8?B?Q1RGVXBvdGlMeUUydUxTVnhvVnZNOW41YU1LUi9XcWI1WXdFaXNkcUVTY2Zv?=
 =?utf-8?B?cmFQWG9CY2prYlhScFZYM0phUVZpSU5iTkFsdE1XSVRpUWVDdWplRlc5ZjRN?=
 =?utf-8?B?RWZPZXlDeDg1Z3B6NVFtOU1kK0YxQUdMaFY4NmlGQjdTQmpnOU1LeDVZdmFI?=
 =?utf-8?B?ZEUrOVFveDBDQ2RLRTkzUGl0WWJzamlRQ1lYZTJUYi8zcXhYbmdkK0FyRmJU?=
 =?utf-8?B?cjB4MWh0T0J5SFhScEw1V3BNQlVQcGtZRkFHakdtU3daUzRZSWljV1pCeFNZ?=
 =?utf-8?B?U2dGQ2xDRys5cmRqd0ZCdVZZOG9aZ0xQZWZJVG1GSzUrbFhMdlZHdDIyVG5y?=
 =?utf-8?B?TDB0YlU3M2ZXcGtjc2p5VjdWcFpUczgvb013ZFNpZE0rTWozRDdCaWh1bWUr?=
 =?utf-8?B?M2xEVzFPeGw1TUw4OWZCOGttVG9ndHYzTjJ0YTlaa1NpQnVPdnJpZi9kM0RJ?=
 =?utf-8?B?ajRGM1VSWUdrNjRqL0tRc3ZNZFVLelRDK00vVjJMMWQ5NzRBRkRUNzhUczVY?=
 =?utf-8?B?WlIwMVA5L2tiOVIxTG1DM1N5dEc1VkkrQ1B4eFJMdUNIcUsrNmtCNzY1emFZ?=
 =?utf-8?B?UHVxb0ZEZ05WZDlTM1dzWFpiUElGcm1rQ01URCtaRzI3UGNLYTJOK2VKZmF6?=
 =?utf-8?B?d3VXNjdHSHByY1ZHZXN6NEdOSEVwOUFOWFY0QnBRdXdrTWVaK0IvTTJRd0Jv?=
 =?utf-8?B?d3N6alpLcHhzZHNJZ3Q1SkJaN20rUTVZWG5KY0dCUUw4OVNTTlEvSzJhdDEv?=
 =?utf-8?B?azg3d0JXU0lnQ0c3cGthMUpHazVtSFo2MFBIQ3YwSi9LMTJFcjJSaVVVUUJJ?=
 =?utf-8?B?K3Jkc1FybG55U0wrVDFaR1VmWjUrMmowOUNTZWdsK2tHa3ZSK3UrUUF3Zlo2?=
 =?utf-8?B?N2I4ejQyRHZKMUp6eEY5YXpJUDB0bnB2U0tDL2tXV3NqY0dHbFpXZk9WMjkz?=
 =?utf-8?B?cFVQcmFXWG52VVJpd28rTlZ0U3lwdDN2bndEVzltemh6cGFhbFhRbkg5cXdP?=
 =?utf-8?B?VWZra0RYOW5LN3RocENFTG9YL3MvY0RURjdrbnZvVmJZOW84T09VOFhEbkxs?=
 =?utf-8?B?eHBteW5xVVBNVmxPSWdKcXIvTkdvN3FVZnV4eGROOTlRbSt3eTVuVERKMSti?=
 =?utf-8?B?QlBObXB5WjV1dmE3QTZpZURESFpmSUU4dmJvOXFneGJxTFdKY29CVGZRWUxp?=
 =?utf-8?B?ak9aRVZ6emZzejVaY1NmdnhKNkp5dzlsdWxYQkNncmFlb3FkZmZyODNTbG5S?=
 =?utf-8?B?Wk14RUFHLzNVMWZOaE1WYldFVWErVFZreE0rU2JNTkpqUzBpVTZSNGxueWd6?=
 =?utf-8?B?ZGprbTNoUjh5QUJ1MWdnT1M5UXZQS1oyYjlUMWJCbVVDcS9Xd0MyU01uRS9Q?=
 =?utf-8?B?MHVUWEM3RGFXZlJhZ2JVSUphOWRoWEk1aGxTU2h1TXFtZVF2NkU5VGJvRnZE?=
 =?utf-8?B?YklPMEZNWDVkQjhLT1NvNmhuRFlNVnhFWHB1Z3RpeGE3dzM4TGw1RzdKYmlJ?=
 =?utf-8?B?SkN4TnF2VEErUWdtNEJCRmFnNURNVUNwcjJoenErK1JPN2M3MkdydlYrdXds?=
 =?utf-8?B?eXZjbXVqbGNOQ21ZVmNOT2I3R2lzWEViTGN4Q1hVbHpXV1lCbklHQWNrMVMv?=
 =?utf-8?B?YzBuZjRjV0ZvWllMZW1yNnBSRWg4dTViT241S0R4QjVIeU9kcVpGZ0ViNHdC?=
 =?utf-8?B?YTdleU53Q2JRU0VKb2xJdDJmbVcweU43T3RlWDE1ZW1JNityMU4rU2xRcGVL?=
 =?utf-8?B?UjUzK05IVFQySVNTdVFFV2FJRnlPNnVWTTA5QTBkTEFOTnI5enluazdYYVd2?=
 =?utf-8?B?MFp1R296Wnp2WHdtTFAxdVdmRUFSa0pocXM0Y0s2a3MybDBDY2tmK0N0OXRM?=
 =?utf-8?B?RjFnOTFvaWE0TTFiRG9qTldkNmp5M2V3UG00WTJSeGl1OXRkYlIvSEY1Ny9z?=
 =?utf-8?B?Q2VxTCtqaVV3T3dMNldtVy9LRVNLQTl3THk0T2dYbmNsaDBmek45Y1gvcERF?=
 =?utf-8?B?V3Y3ZDIxQVNvU3FzZEZFOUJWYngyZjMzbGRrU29nVUV4dmZQc2IzWXZmTU9O?=
 =?utf-8?Q?3impyxZTeHNyyQzU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BCDE44F72C6A344821ABBF85179E394@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: Tb/WL5ncWxY/fRaaSRniQIEFOW536DgiDaGUcA6iqhvrDuPKzEI3h3T5xyAamlFaDPq5Z/amoZ+EWi2qDLAYHOOZZXgjV1heWV5q7d/RUSC9GHJ18zAgochmQSDGgSsNuDjSXZ4FNuvOz7ZO8wc1H7mLHkg5IE+RKsbRrngTB+7VMl0dNLaxN3hspVyKYVATwPHAp+CEgtxjePMkuF7DJV9ACl/qmb5qQcGpKh6zKemFtse/WW+ZAO2gxy0oz0ajjWbQASoCx7V0dGkOB9GaXDmv3OqrPTU9u8LPFaHemk4ntSHHyPp8fb9DALDx55zc+tySYP2IsOmHSUR/s3EzCg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB595933.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e870c91a-e097-440f-107e-08df48018967
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2026 18:59:14.7022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJskrf2OjSKi4dDtMValTXu8YItGzaDke3KFFIQGhe/2YrlTpxFwQcKQuZODNlc+I9CDkK3KN0Ys1f7tFWYPdgfxESpByOz6W2wMF8al9ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6245
X-OriginatorOrg: intel.com

T24gU2F0LCAyMDI2LTExLTIxIGF0IDE4OjM2ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2
aWV3IGZvdW5kIDIgcG90ZW50aWFsCj4gaXNzdWVzIHRvIGNvbnNpZGVyOgo+IC0gW0hpZ2hdIGRy
bS94ZTogc3lzY3RybF9yZWNlaXZlX2ZyYW1lcygpIGRyb3BzIGVycm9ycyB3aGVuCj4gwqAgcHJp
bnRfb25fZXJyb3IgaXMgZmFsc2UKPiAtIFtMb3ddIGRybS94ZTogbWlzc2luZyBAcHJpbnRfb25f
ZXJyb3Iga2VybmVsLWRvYyBpbgo+IMKgIHhlX3N5c2N0cmxfc2VuZF9jb21tYW5kKCkKPiAtLQo+
IAo+IGNvbW1pdCBkMTQwNzg3ZGZiOTliY2ZmMjkzNDEyNzk1NmQ3NTk2MDNiZDMwOTZjCj4gQXV0
aG9yOiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgo+IAo+IGRybS94
ZTogRG9uJ3QgZXJyb3Igb24gZmFpbGVkIG1lZGlhIGRlZmVhdHVyZQo+IAo+IFRoaXMgY29tbWl0
IGFkZHMgYSBwcmludF9vbl9lcnJvciBwYXJhbWV0ZXIgdG8KPiB4ZV9zeXNjdHJsX3NlbmRfY29t
bWFuZCgpCj4gYW5kIGRvd25ncmFkZXMgdGhlIG1lZGlhIGRlZmVhdHVyZSBmYWlsdXJlIG1lc3Nh
Z2UgZnJvbSB4ZV9lcnIoKSB0bwo+IHhlX2luZm8oKS4KPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybF9tYWlsYm94LmMKPiA+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3N5c2N0cmxfbWFpbGJveC5jCj4gPiBpbmRleCAyYWY3M2M2MmQzMmRiLi4wZGE3ODMx
YzcxNTdhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5c2N0cmxfbWFp
bGJveC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybF9tYWlsYm94LmMK
PiA+IEBAIC0yMTYsNyArMjE2LDggQEAgc3RhdGljIGludCBzeXNjdHJsX3Byb2Nlc3NfZnJhbWUo
c3RydWN0Cj4gPiB4ZV9zeXNjdHJsICpzYywKPiA+IMKgc3RhdGljIGludCBzeXNjdHJsX3JlY2Vp
dmVfZnJhbWVzKHN0cnVjdCB4ZV9zeXNjdHJsICpzYywKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1
Y3QKPiA+IHhlX3N5c2N0cmxfbWFpbGJveF9tc2dfaGRyICpyZXEsCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9p
ZCAqZGF0YV9vdXQsIHNpemVfdAo+ID4gZGF0YV9vdXRfbGVuLAo+ID4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90
ICpyZGF0YV9sZW4sIHVuc2lnbmVkIGludAo+ID4gdGltZW91dF9tcykKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNp
emVfdCAqcmRhdGFfbGVuLCB1bnNpZ25lZCBpbnQKPiA+IHRpbWVvdXRfbXMsCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBib29sIHByaW50X29uX2Vycm9yKQo+ID4gwqB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IHhlX3N5c2N0cmxfbWFpbGJveF9tc2dfaGRyICpoZHI7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IHhlX2RldmljZSAqeGUgPSBzY190b194ZShzYyk7Cj4gPiBAQCAtMjQ4LDE2ICsyNDksMTcg
QEAgc3RhdGljIGludCBzeXNjdHJsX3JlY2VpdmVfZnJhbWVzKHN0cnVjdAo+ID4geGVfc3lzY3Ry
bCAqc2MsCj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoGhkciA9IChzdHJ1Y3QgeGVfc3lzY3Ry
bF9tYWlsYm94X21zZ19oZHIgKilidWZmZXI7Cj4gPiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgaWYg
KCFYRV9TWVNDVFJMX0hEUl9JU19SRVNQT05TRShoZHIpIHx8Cj4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqAgWEVfU1lTQ1RSTF9IRFJfR1JPVVBfSUQoaGRyKSAhPQo+ID4gWEVfU1lTQ1RSTF9IRFJf
R1JPVVBfSUQocmVxKSB8fAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgIFhFX1NZU0NUUkxfSERS
X0NPTU1BTkQoaGRyKSAhPQo+ID4gWEVfU1lTQ1RSTF9IRFJfQ09NTUFORChyZXEpKSB7Cj4gPiAr
wqDCoMKgwqDCoMKgwqBpZiAoKCFYRV9TWVNDVFJMX0hEUl9JU19SRVNQT05TRShoZHIpIHx8Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYRV9TWVNDVFJMX0hEUl9HUk9VUF9JRChoZHIpICE9
Cj4gPiBYRV9TWVNDVFJMX0hEUl9HUk9VUF9JRChyZXEpIHx8Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBYRV9TWVNDVFJMX0hEUl9DT01NQU5EKGhkcikgIT0KPiA+IFhFX1NZU0NUUkxfSERS
X0NPTU1BTkQocmVxKSkgJiYKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmludF9vbl9lcnJv
cikgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9sb2dfZXJyKHhlLCBT
WVNDVFJMLCAtRVBST1RPLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAiUmVzcG9uc2UgaGVhZGVyIG1pc21hdGNoOiAlI3ggIT0KPiA+ICUj
eFxuIiwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaGRyLT5kYXRhLCByZXEtPmRhdGEpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gLUVQUk9UTzsKPiA+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiDCoAo+ID4g
LcKgwqDCoMKgwqDCoMKgaWYgKFhFX1NZU0NUUkxfSERSX1JFU1VMVChoZHIpICE9IDApIHsKPiA+
ICvCoMKgwqDCoMKgwqDCoGlmIChYRV9TWVNDVFJMX0hEUl9SRVNVTFQoaGRyKSAhPSAwICYmIHBy
aW50X29uX2Vycm9yKSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2xv
Z19lcnIoeGUsIFNZU0NUUkwsIC1FSU8sICJGaXJtd2FyZSBlcnJvcjoKPiA+ICUjMDR4ICUjeC4l
I3hcbiIsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFhFX1NZU0NUUkxfSERSX1JFU1VMVChoZHIpLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYRV9TWVNDVFJMX0hEUl9HUk9VUF9J
RChyZXEpLAo+ID4gWEVfU1lTQ1RSTF9IRFJfQ09NTUFORChyZXEpKTsKPiAKPiBbU2V2ZXJpdHk6
IEhpZ2hdCj4gRG9lcyBnYXRpbmcgdGhlc2UgY29uZGl0aW9ucyBvbiBwcmludF9vbl9lcnJvciBj
YXVzZQo+IHN5c2N0cmxfcmVjZWl2ZV9mcmFtZXMoKSB0byBkcm9wIC1FUFJPVE8gYW5kIC1FSU8g
YW5kIHJldHVybiAwIHdoZW4KPiBwcmludF9vbl9lcnJvciBpcyBmYWxzZT8KPiAKPiBXaGVuIHN5
c2N0cmxfbWVkaWFfZGVmZWF0dXJlKCkgcGFzc2VzIGZhbHNlIGFuZCB0aGUgZmlybXdhcmUgcmVq
ZWN0cwo+IFhFX1NZU0NUUkxfQ01EX01FRElBX0RFRkVBVFVSRSwgdGhlIGNhbGwgc3VjY2VlZHMg
aW5zdGVhZCBvZiBmYWlsaW5nOgo+IHhlX3N5c2N0cmxfbWVkaWFfZGVmZWF0dXJlKCkgbGVhdmVz
IHhlLT5zYy5oYXNfbWVkaWFfZmVhdHVyZV9kaXNhYmxlCj4gc2V0LAo+IGFuZCB4ZV9zeXNjdHJs
X21lZGlhX3Byb2JlKCkgcmV0dXJucyBlYXJseSB3aXRob3V0IGNhbGxpbmcKPiBzeXNjdHJsX21l
ZGlhX2Ryb3AoKS4KClRoaXMgd2FzIGludGVudGlvbmFsLi4uIEFnYWluLCBubyBwbGFuIHRvIG1l
cmdlIHRoaXMuCgotU3R1YXJ0Cgo+IAo+IFsgLi4uIF0KPiAKPiA+IEBAIC0zNDksNyArMzUzLDgg
QEAgdm9pZCB4ZV9zeXNjdHJsX2NyZWF0ZV9jb21tYW5kKHN0cnVjdAo+ID4geGVfc3lzY3RybF9t
YWlsYm94X2NvbW1hbmQgKmNvbW1hbmQsIHU4IGdyCj4gPiDCoCAqLwo+ID4gwqBpbnQgeGVfc3lz
Y3RybF9zZW5kX2NvbW1hbmQoc3RydWN0IHhlX3N5c2N0cmwgKnNjLAo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZV9zeXNj
dHJsX21haWxib3hfY29tbWFuZCAqY21kLAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90ICpyZGF0YV9sZW4pCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplX3QgKnJk
YXRhX2xlbiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJvb2wgcHJpbnRfb25fZXJyb3IpCj4gCj4gW1NldmVyaXR5OiBMb3ddCj4gVGhl
IGtlcm5lbC1kb2MgY29tbWVudCBhYm92ZSB4ZV9zeXNjdHJsX3NlbmRfY29tbWFuZCgpIGlzIG1p
c3NpbmcgYQo+IGRlc2NyaXB0aW9uIGZvciBAcHJpbnRfb25fZXJyb3IuCj4gCgo=
