Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.26.1.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794488096;
	b=HQp7T06i4794Jy5dHyqvQCNREU1/NG9fcUJiF2rvFuDszmqgQdhqqjxrC19N0hqUyGlx
	 HEKtux97xe9O5ZkRtZh65Rh8A/W4MOdEO6IwMikXiVz75EWRe/0u858531L9YMqZfMrzV
	 +0YBoMuUtF5qbhTKbsABzujscAuojDxytHivM3TK8LFij3t61PsSIJEnihtUJzwNQoYEF
	 dZ/No2D1WwX8f7iY+iX/MG/z2ANaQYGdofEiesh8WMT38GzzbSInKolMDcnFc4glfNMIS
	 szzUke9/DqidAs0bmlvnUOMYDs94rnQUvO6dblRv0YS/PpSgyQ8MXtzZ5V5EYHF57kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488096;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
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
	bh=cT07MwAZ31iG2qQnhnLOufnjI+hhcrZ5UWBkfiIyCaQ=;
	b=btc85u+fdeMCTbFzSOj/dnnlGaWQ/KxyQN90R9Lr1xRUeJ25L+nuJGCptAUdp/2nWo/c
	 h6wBqhNw/WOlZ+PV8ppXiVTDF7UYDLsW7vtkgjN/TOEY32sRBw8TEiYSW2zp8N+tYvXxt
	 oICtsDTEH3GIBJGLG6hP4pl9G44shQ7teF4lupSteCupNl81J0fbbCLnI77U2oy6y4xci
	 n91OD50pUv/QaMrUZbuxXHKMByPUuz2v3upKoyz3d+hkQAoxsaww9biiVrUnzS36ZVlLY
	 wXYHEyweXR8mBl3/uD2BFg3jRZK92xMoXz2cHGWu/vw4pazII29qVI6XmcTUv91V+nQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=IOwZtFt6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.26.1.71
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF463606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 12:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF463606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=IOwZtFt6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794488095; x=1826024095;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cT07MwAZ31iG2qQnhnLOufnjI+hhcrZ5UWBkfiIyCaQ=;
  b=IOwZtFt6iYIw9T8eYB41FI5+UcPrNrfIGjB5OVlpHQOCMmP4X5tvUGH/
   AyJnvuLb4PcPInVdL6c5l018hDRWJWG9PLaDIaZytMiWUL2xgI8Jgkf9g
   iXfSd20sfmgsaFGrjNLPbXDkwjvRSI04FpWwr9wwRwDOJRylA+tL6RnTW
   dhusd36wfqvQljhGF3FXAkqn0A//y+yjb8qv1Gu2F724/gM64SP2iTQXE
   y8oCXmGFCdUVvVRxr6q9oJfzTyYfueRUG7ilUE8m3HMyjxYq3AosIYy93
   wy1FKEWGLtmtKuR4MocvPaxpngZh4XyRaZUwmWg60yNR1rIj7tLG6Kp5s
   w==;
X-CSE-ConnectionGUID: yzKGrteSR5OEhSbPU8kaag==
X-CSE-MsgGUID: I4USynOiR/+QidwktaefZw==
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="33839204"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:54:53 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:22661]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.212:2525] with esmtp (Farcaster)
 id 9f41ed55-50ce-4f24-bf04-8a21de9e5817; Thu, 12 Nov 2026 12:54:52 +0000 (UTC)
X-Farcaster-Flow-ID: 9f41ed55-50ce-4f24-bf04-8a21de9e5817
Received: from EX19EXOUWA002.ant.amazon.com (10.250.64.216) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 12:54:52 +0000
Received: from BYAPR08CU003.outbound.protection.outlook.com (10.250.64.238) by
 EX19EXOUWA002.ant.amazon.com (10.250.64.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56
 via Frontend Transport; Thu, 12 Nov 2026 12:54:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey+e4mr+8iNaDq8CIW8BhZlFakwEYMeGj/p65F+3ouTCLF9olYSjji6VjfuxMxWP1JWQ1OH5DXt90tOnqBwn9CRuUEqSEljPoFqudwYuO+lPJij8QfY3Oo+kg0+4GvuzcIzNkJhmasxbwqPgv8iUguCNwDgslKOt8+qrvw7zeuhfzQElF5xIkIJsPcVMuG0ZquZkH77rXWVXQrvY5QuC8L4Z2B+UQGlBZ5nE2IztWMb9ACx7H+MsbKIuQSpfFjLY1XkhuM6IYBUgT3FztK4ECTC6EIUBx1AJVpwzFsyMIZ+QlLhP2GkfIJN/Ka6XCGYfDIGiHrTQGd9byMfd+PCPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cT07MwAZ31iG2qQnhnLOufnjI+hhcrZ5UWBkfiIyCaQ=;
 b=TCXvtBRSRDapBiE2QNNW3eMIWq1jVzwglAhe7/7aswF72Af7n8mYpFncEP/BLFGVYbzrvImvjIbqDJH4kyN2LzKyF/nojTsY6ArUvN15VuxSdNpOJjBFyk/+GMuMxlpeWbJh1e3+yYms72zMPjWD45kVyiRHc1ktB/fPXj1nXjMmXnKCKypIOSiTTNHKwVd/A4eRHBUfDKkHcFEiC88eOybXPVjy+Z0f80mAOj3sLr0StBDAQZnEORKPeuSOZrck7o5ZL6lefzLFxlvBCvblgJp2c52lxwW2t2d98K5QMl303O9EHbUXAPD0CA6jm8T6kOo1RgGsFWwaGO9r3AwFlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by DSAPR18MB502825.namprd18.prod.outlook.com (2603:10b6:8:519::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 12:54:49 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0592.009; Thu, 12 Nov 2026
 12:54:49 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato
	<pfalcato@suse.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: RE: [PATCH 4/4] uio: implement huge_fault support for physical
 mappings
Thread-Topic: [PATCH 4/4] uio: implement huge_fault support for physical
 mappings
Thread-Index: AQHdcqUAHQJHkOyYG0qEf8E1pCW3YQ==
Date: Thu, 12 Nov 2026 12:54:49 +0000
Message-ID: <BY3PR18MB4722857A1FE8395B9AAD5CEEC6702@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20261111113045.35368-1-farbere@amazon.com>
 <20261111113045.35368-5-farbere@amazon.com>
 <sashiko-outbox-209833@kernel.org>
In-Reply-To: <sashiko-outbox-209833@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|DSAPR18MB502825:EE_
x-ms-office365-filtering-correlation-id: 482e5e5a-16b6-4139-330e-08df40bc2329
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|22082099003|261009223027099003|18002099003|261022075727099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|56012099006|10067099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: Su2tIDbXA0N+ImqNaQPSwAlnPNNkW1rzvPd3ssxfWAfwoDlaWCKEzU3VmzWO6jKrSywrSgSJg32YFEd2tuRlWtk34rEPn2MUli1noorFcXlwBG21Z9yokQo71KRr6WsxCb8uorGupeZwY+j5eapnKPfmnnGwAKPGjUV7cAHo87plpB/lOaJOkDDwHp38xEX7ikuc2pn4/S8qiGyMaAZf/+NhyR/YFVG0r6PgXszhDbEUflXxV+k9ACSURZKP8BPoDwqNZ4Vjnk1eA1zW+b2bi3j3A/nsf2gsdbxym4B+DhBFrO9BNdG1DUD6mGAv41j+fc3FQndyoRoXmbzPXYKrhlwG2idjHJLiXGScncfCaB6D7b4k6lnxcewd3YhuWx+qZqsqQP3F4E5bqEWbDTzIRiV2kXYOk69tOn58seYNmtIiNYyfa/u9pUcOLvehDUXkyjmm8f2tSACkakGCgPGM2tshmsEJHIKbu699FbpI8vJmPMpxz4/YSsbpkNePKEjb9STtrhUEHcB9C+1bQ161xJHCxDLhn7WiEI21Vlp3DnG1Xwfk7UoiHjg4AIcKqE+wEfJ63hbRTGxAQKZo5D9yBweOsrruJ92wiAsmoLpVseUhXKG0OcBkpjySPNf+Ek6Wt9k9k43use9xg+/Z7BhK95IMIHU5EkCNSQb9G5pL0a6uEaK5C8ssBHAcRp0ggUTnseqe6d1qtboxQtwpQLyccA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(22082099003)(261009223027099003)(18002099003)(261022075727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(56012099006)(10067099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzlxQVg2THJMNEhUZGNOSXZDaHdCM0pvSm1Ga284anQ5ZUZrOURkRUVaYkVP?=
 =?utf-8?B?WTR1dkh5aXR0dkRTRFZaR2thZUl5THlyNE9wdUtQRFlGN2tlb09Od1ArWWdM?=
 =?utf-8?B?cjJZZEVHVHRTSmlFcUxiVHg4bGZTZyszY3l2UUc5a0lyRG1UVk4rdG81RmtB?=
 =?utf-8?B?Z3BoZno2WTBxZ1ZiYnZSMmMrWDV3eFRIVG5rUnV1bHlDQmRlMnZJZEhjMzk3?=
 =?utf-8?B?UmlwSk1OekRiUlRNZEFORmFLZUxJMXU1S1JDUzZpMXJHUllSTnlCUE4yc2VE?=
 =?utf-8?B?N00vL1c3WnoxWERLSHRmU2pEYkZZa24yTU1Sc0NPV3BkWGwxV1RyS0R0RHpJ?=
 =?utf-8?B?eVFwK0NZQmgyanM1aVkxWkxZajlPMTBTdE56MHZ3M2NYdTdjOG9LTHkyN1dQ?=
 =?utf-8?B?NjBNV2V6NFAwMVZ3YnRONGJlb1BxQUx4Sy9DTHRpL3dkRkhHY1pDcEVuaDg3?=
 =?utf-8?B?UFFlR0JlaXZiUnF4YVBhYldTUi9TakxLWVI1QzNURDRNWkJCWUtsckF5MUJY?=
 =?utf-8?B?NzNVYmE1UEs4bE9sRnpyL2hSeWFySG9Oc2hGVlhmN2xvVW11bUlmYVNYbjg1?=
 =?utf-8?B?VytMRDZDR2wxdm4vZHEvb3RiMEl2VEhHNkxsUy9YeER6UmN3RmpZd2hYNWtu?=
 =?utf-8?B?NUUxSC9xOU05MXBDNXc4Q3N0VGdjWGlrKzREMUtieUVKR05uZ1RTcXdRdW53?=
 =?utf-8?B?bXo5Vk1GenFMZ0hhWUxNcE1GTWI3S2FRZXVlWC9kM1NaUm9pd0JJS2JlWm5E?=
 =?utf-8?B?RVR4V2xRczJxelhBVEowUUZCOG1yZWM2NXppTnF1UTBLTzhKdDVXZGhQRnZu?=
 =?utf-8?B?ZnA4SlVCQUpwVEE5ZUhlRWpxK1pFRHkrSHpyOGl4KzVxbHMzeWhielhIU0VZ?=
 =?utf-8?B?UWxLN0JJbDBGcVRvNVdFckRDOUV4cXQxb3B6Zk9ObGxzR2pFb1dCOGxZREdj?=
 =?utf-8?B?cG5aQ09La0dxL0MzaEtBT3ZBVzZicGY2dXlmR1JRM0JQcmhwTGdMTVpEanFh?=
 =?utf-8?B?S2ExQWZyNTVPT1Q2dnE4RyttaWQybDlwR0hyMVkxajNYODhmWDlKbitOR0ZH?=
 =?utf-8?B?Vlg3RUlhSldjZVVwQWwwZDBNb2t0dDEwOWlGaEw0Y2RPUjVndGF2TXl6UlZq?=
 =?utf-8?B?cjFwOVR4Q29SMEVNNFcwdnlBQUx0U3h2UDZHZjJZMUxKaGk2bGZ3Qkp0SWov?=
 =?utf-8?B?R3pXQWE0dUlqRlQvMmhOTW4yb0JZbFdsaCtXRThHcUNvb09xOHRaUmZTMmx5?=
 =?utf-8?B?OXlieVpodkJONUlCOTJFdXh4ZVB6eUN4OHRYZFJkTmZtSlhxdmZxbGNwdjZn?=
 =?utf-8?B?Rm5FRVcxUWY3TjBtb2RaSEp0L3ZWMUd5U01rd083cnJFTnhETDhrVHV1ZjVx?=
 =?utf-8?B?THkvT3VvYVFydm9TVEFCQkJ3ZTVoODhqRTFmQ3kyRVc0bmVZSXoxTEFlSE1K?=
 =?utf-8?B?aW8xcStaMjVPdTUvN0loYTh5L3Fya2EwZi9RcWdQc3YwMWZSL3hGMCt4dElG?=
 =?utf-8?B?dC9OcDdNcHpBZWZUN1V2WUVLaDdJU0VBVWYzL1FxVm91S2Z3RzBGVjE0L1Qv?=
 =?utf-8?B?bWlpWlhOeGlFSkpoc054RTkrd1VQZjNLc2FablNkMU5NQUNqZmdYNTJiT3VO?=
 =?utf-8?B?b0trVjh5clFjTHNNeXgyVjZtNk04d3dubEhkMGUzTXJrc3JOcXh0c0JzT3lF?=
 =?utf-8?B?YU81RmFSWFc1UDdpNkJYYTRzL2ZQMC9teHNPZkVKbW55WHZoZCtTUFY5dlp4?=
 =?utf-8?B?L3RNMXJFT1YyZFdHNWVndlE1MndDbmVtRU9UUlhaa3I1OGlvejYzMFdnVHJG?=
 =?utf-8?B?d2lERWRYc2Y0SE9QMUx5bG1VSXUyL29USDNqdVU4NmF4YjNDVlBHeEpaUXRX?=
 =?utf-8?B?L2ZZZDNLMlFQbGRKOERzRFhRbUlDNVFpQzFrRFhSaUtlaGNTQ3hCeEZNSHVW?=
 =?utf-8?B?WHZJeGt6SzVtNHQyKytwTFhIRkszaHBtUXJhbWc5ZmJ2dWVnMGxtV0lJYUk4?=
 =?utf-8?B?NmdzT0U1RndjRkFYTVJMQ2pZeVFLYmQrdm5veVcrc1V4M2FvT2F6bUhoOWky?=
 =?utf-8?B?aS83K2VJM2M3K2U1RUtuOFR2Wkswa1hvdEZpWG9OYnYvcWtDQXM2NHdYZHQ1?=
 =?utf-8?B?bXR2QmZLM3BLa3dXZnhZRjU4YWsyMlBOeHJlWklmb0w0S3BEempqd1RDQlA0?=
 =?utf-8?B?L0FwODBlMG1xb2ZYTnBDWmYyejlvMXVWdDRmQTY5WXBmSk1vQ2Fya3Y3WDhW?=
 =?utf-8?B?TGJmQkFkc2lHK3BXMEx1Z0xWanZyT3pTZk9PZVZrWmhuSzNaazVFT29KS25X?=
 =?utf-8?Q?u4CEI84by/AOwUH8w9?=
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
X-Exchange-RoutingPolicyChecked: qNXCK5NjE8C08VzEZGkEt4q8/YBot75CYA/NSd4h1GG8RUs0BepKqkPwULQepTV9EOlHDtKR8UXXM52AcfqD5SxzG96RZkspaSSvu2nJjLF383sp4p+Hn/eU9T1ZNgAPFRxhV9yMFyD36SiZLNqMaVK7RUT98+xJjCrqRabpJY1oDkuyy9MlnxAm+KJRLSbv8dd1YaIJL5ZbQmncNzqgp1P0dxSeU4+QeB2sRpkCYvYu+HcSIU1HGcHhm52SHCaZx/oeTUvRxRTt564NwonZtp9WB+SZP05qAteFHXrcOcBJoJXIpUIFIEzWZJgXcvNMZEeCVBwg4D5dZCGK4Pw5xA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482e5e5a-16b6-4139-330e-08df40bc2329
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 12:54:49.7558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tkGTrk5VBza0dcPzNOIeHP9U+26Iq5x/qG0Hl4Toiulgy3ZBYKrpT+zW81QqxhN8wV8zYMor9dtv/W+nc2K9jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSAPR18MB502825
X-OriginatorOrg: amazon.com

T24gMTEvMTEvMjYsIFNhc2hpa28gQUkgcmV2aWV3IHdyb3RlOg0KPiBbU2V2ZXJpdHk6IEhpZ2hd
DQo+IENhbiBpbnN0YWxsaW5nIHVpb19waHlzaWNhbF92bV9vcHMgb24gYSBDT1cgbWFwcGluZyB0
cmlnZ2VyIGEga2VybmVsDQo+IEJVR19PTigpIHdoZW4gYSBjb25jdXJyZW50IGZhdWx0IG9ic2Vy
dmVzIGEgdHJhbnNpZW50bHkgY2xlYXJlZCBQVEU/DQpbLi4uXQ0KPiBTaG91bGQgQ09XIG1hcHBp
bmdzIGtlZXAgdXNpbmcgYSB2bV9vcHMgc3RydWN0dXJlIHRoYXQgb25seSBkZWZpbmVzDQo+IC5h
Y2Nlc3MgPSBnZW5lcmljX2FjY2Vzc19waHlzPw0KDQpZZXMsIGFuZCB2MiBkb2VzIHRoYXQuIEkg
cmVwcm9kdWNlZCB0aGUgaW50ZXJsZWF2aW5nIHlvdSBkZXNjcmliZSB3aXRoDQplaWdodCB0aHJl
YWRzIHJhY2luZyBhIHN0b3JlIGFuZCBhIHJlYWQgb3ZlciAyMDAwIHJvdW5kczoNCg0KICBrZXJu
ZWwgQlVHIGF0IG1tL21lbW9yeS5jOjI5ODkhDQogIFJJUDogMDAxMDp2bWZfaW5zZXJ0X3Bmbl9w
cm90KzB4ZmIvMHgxMDANCiAgQ29tbTogcGZubWFwX2Nvdw0KDQphZnRlciB3aGljaCB0aGUgZ3Vl
c3Qgd2VkZ2VzLCBzaW5jZSBCVUcoKSBpbiBhIGZhdWx0IHBhdGggbGVhdmVzDQptbWFwX2xvY2sg
aGVsZC4gL2Rldi9tZW0gaGFkIHRoZSBzYW1lIGJ1Zywgc28gcGF0Y2ggMyBnZXRzIHRoZSBzYW1l
DQp0cmVhdG1lbnQuDQoNCllvdXIgbWlkZGxlIHBhcmFncmFwaCBzYXZlZCBtZSBhIHdyb25nIGZp
eC4gQSBDT1cgdGVzdCByZXR1cm5pbmcNClZNX0ZBVUxUX1NJR0JVUyB3YXMgbXkgZmlyc3QgYXR0
ZW1wdCwgYW5kIGl0IHByb2R1Y2VzIGV4YWN0bHkgdGhlDQpzcHVyaW91cyBTSUdCVVMgeW91IHBy
ZWRpY3QgLSBvbiAvZGV2L21lbSBpdCBmaXJlZCBhdCAyMDAgcm91bmRzIHdpdGgNCmZvdXIgdGhy
ZWFkcywgbW9yZSByZWFkaWx5IHRoYW4gdGhlIEJVR19PTi4gQm90aCBkcml2ZXJzIG5vdyBnaXZl
IENPVw0KbWFwcGluZ3MgYSB2bV9vcGVyYXRpb25zX3N0cnVjdCBkZWZpbmluZyBvbmx5IC5hY2Nl
c3MsIHNvIC5mYXVsdCBhbmQNCi5odWdlX2ZhdWx0IGFyZSBOVUxMIGFuZCBkb19mYXVsdCgpIGtl
ZXBzIGl0cyByZWNoZWNrIHVuZGVyIHRoZSBwYWdlDQp0YWJsZSBsb2NrLiBUSFBlbGlnaWJsZTog
MSBvbiBhIFBNRC1hbGlnbmVkIENPVyBtYXBwaW5nIGlzIGdvbmUgd2l0aCBpdC4NCg0KPiBbU2V2
ZXJpdHk6IE1lZGl1bV0NCj4gQ2FuIGEgcmVtb3RlIHdyaXRlIHRvIGFuIHVudG91Y2hlZCBwYWdl
IGZhaWwgd2l0aCAtRUlOVkFMIGFmdGVyDQo+IHNvZnQtZGlydHkgYml0cyBhcmUgY2xlYXJlZCB2
aWEgL3Byb2MvPHBpZD4vY2xlYXJfcmVmcz8NCg0KRml4ZWQgaW4gcGF0Y2ggMiBmb3IgYm90aCBk
cml2ZXJzOiB2bWZfaW5zZXJ0X3Bmbl9vcmRlcigpIG5vdyBwYXNzZXMgdGhlDQpmYXVsdCdzIHdy
aXRlIGZsYWcgb24gdGhlIG9yZGVyLTAgcGF0aCB0b28uIEkgY291bGQgbm90IHJlcHJvZHVjZSB0
aGUNCi1FSU5WQUwgaXRzZWxmIC0gc2VlIG15IHJlcGx5IG9uIDMvNC4NCg0KVGhhbmtzLA0KRWxp
YXYNCg==
