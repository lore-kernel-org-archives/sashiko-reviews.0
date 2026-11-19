Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795130515;
	b=IHJLF4wOFhFrdog6L2gahGAh/Lu9HxDlc8dD8L14bMvhZd2KUV9WOsPJVRGS8Tt/VyTt
	 G7dbNOmKuUBvMcYQ97tNDhHbz1akcwwwQCtDUG47VAyVrxkh+1amZoAoYoSIC8AwlV9Dc
	 gUlnX18MAlpWv8MEN2je/RnRCJ6CK+bqXjQ13wnRNdmgUYqfI4pl7A/CjbfVW3YBPJcPe
	 d9odAe/YKyhPIHlnB9TC0e7JjaGCo5KtFDT0lGCsHx/mosF3nLu61L2jFjVDbtbMGmcTD
	 mtJns31zO2WArDqBoxVvJnuWIRQ/FO0qnhX+G7atBSdag+R08jh08KrOYDJ3QQtwU5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130515;
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
	bh=ibvODTFm0nlLACwmJCshQP7aKtafBRr6JRvvK0VpeUE=;
	b=gAFoymNZysnzVQsrl6sjp8L/54GKeT9ANIBU59KUeoKOXnZdrQYlBBMiRBPmzA94Bz6h
	 0N/WnRb5i9JP3R+ZhZP7r6IPlS1Jc5XBmJyw9yKJ1WptTKoH8arypMCkq3QD2Zeqp+9q4
	 Gp7se/AIgSVN5HYSSadHXbn+tmPV+sZyz4Vxorn1KNohJdiCPRvHxbUyQHU/8jw/MWAB8
	 97ADy2uHY32MF59hjWPzuq3HuAhpM3UCcJiwby2sIudA28T4ne0/P4gGcVOJRP2EMQ5Ib
	 HhVKHcB7ZXH6I+3ALK2Z4sRQrC7fzJDMkV6EflUt4MoMSLfDN56fJcIIwzDYZW0IZcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lz0hlu38;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jv8NZ9Xb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C455F606A320
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 23:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C455F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lz0hlu38;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jv8NZ9Xb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795130515; x=1826666515;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ibvODTFm0nlLACwmJCshQP7aKtafBRr6JRvvK0VpeUE=;
  b=Lz0hlu38ZeE84vEDudy8mCZGKcAQfiPX1wizX4+R4BajgiChJePLNS5w
   Nd+nE4jvtIMBOsVwPlMu2AKUwpE18FnaSisp9kdrpRNHAc2nnkEYwgW6e
   ZIesPQ1+T0/3k1eRD5Dpum8wxl+gAFNBfIUF6MUx5VAk+dqXp6iAVGX37
   b/cm31etkuti7A/pvS/zQ5DNEUzgmC7wEHk8EKUP3BZXsFyeFhr80OFhq
   H2yjswQHifPxQK49ZJQg/2Pvi68Q8erjieFK2vJAeRDV4stZI7pCHYp5h
   VQgEC1c38EbBtDkgUw2ChdoVsVNt75tPsboNo3wcBmmleTtw4WAwSkZdU
   Q==;
X-CSE-ConnectionGUID: 6NeSyPnrSpmrZ7l7CqFq0A==
X-CSE-MsgGUID: p3cwL7qST2ezOu9RSq6sOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4008933"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4008933"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:21:54 -0800
X-CSE-ConnectionGUID: 26cdKbcxR7WeG9Z7h8W8zw==
X-CSE-MsgGUID: CHoIRXYFSbSptgxce2lWeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12263569"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:21:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:21:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 15:21:53 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:21:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSbrUULA9NyX2rIkyN9CKtAxQg/YyUnRHZBnw+R519pv9+zH4bBkWkQSe/UnzyBbILllTcf45Nh/u6bH//njpEc427rmCts+O6BUri5vnhEnJ0gFFPU601XlLMkT2yQ+jaawb+MIMpVFTQSsvPLjXL91E536UyclcLJ/XuQGKwULsMGr5pKW9ElFw9mOwZPInFGu7mCU7Wr8yygxMwf5YZjNGupx+UFKPam5aDdBVxtIzzGLmOgI/VHwwFDT2OrYlwctVDFDP1fNxj6VRqs+78LVp5OSrNF4EOzVDN6C+jEwDLsddMgpJe7xoeAfRCpys+FrHqQYMeqM9YTxdENlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibvODTFm0nlLACwmJCshQP7aKtafBRr6JRvvK0VpeUE=;
 b=Dl8VudF4mzVvx0UJ0rHkeMi0t8tu2eDD1as7Cqlu+Xz+vkrMBmZgLmQMVhjmtnkuHpmOcMwihQtA5RfNH8nHcBNJ8nxqquMqhXRJ7iodKzcADZh7Yc/RilxZCbMWXId4wOQRdP7SD1QEgMruPPP0do/AWLmuxj3m2N3ixFxzWgUa019XF7eC1GSjaHcLvn4uCf6FhrzuOczpAukVJf/ggJVC5VIS9azOje7kAxVZx4rYTuqlRPTJpmsNSj8HJrpzsrmq8RXI6CKgWq7/LmTHVC95Nrmd8bCJRHQuz66bTh17uBIyFzw9CQeRxAh/rIWFwN5DouwTKOkPf+yJaCRHzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibvODTFm0nlLACwmJCshQP7aKtafBRr6JRvvK0VpeUE=;
 b=jv8NZ9Xb0lkThtljlqRWJwIbD0cwIgIX3Q0IeRwLzHlHSO3AC6E/WYNBuvPk8QP9LSDWvj26sHOpqt8utl428Pi/MOcO/UI4LTWy2WBFdcLb7kC31EriCrMaTVbq10XXPpujP/dqnvtdeLq566GNpBns44nBCqAApRLJI8Jlcfo=
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by SJ1PR11MB6081.namprd11.prod.outlook.com
 (2603:10b6:a03:48c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 23:21:50 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 23:21:50 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/11] drm/xe: Stop assuming the root tile has a primary
 GT
Thread-Topic: [PATCH 05/11] drm/xe: Stop assuming the root tile has a primary
 GT
Thread-Index: AQHdcWlQuhOdoD7lmECjK746lpk7IbcoLosAgA3oI4A=
Date: Thu, 19 Nov 2026 23:21:50 +0000
Message-ID: <5ad4b8155be167b117c7ae89dae46630fc1e404e.camel@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
	 <20261110231442.218721-18-stuart.summers@intel.com>
	 <sashiko-outbox-208142@kernel.org>
In-Reply-To: <sashiko-outbox-208142@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|SJ1PR11MB6081:EE_
x-ms-office365-filtering-correlation-id: 45b08c24-62cd-4d55-a613-08df4693e3bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261022075727099003|38070700021|4143699003|10067099003|56012099006|11063799006|261028144727099003|261026121527099003|261022105027099003|261026140227099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: SnioGoPh2nHjNwzVVR7G3mhHjXs46Dfi+De5zz7PDcs3VwgP2XZ0BdMQgJMEw1fgY7meqg1l0LvRlv5W+X9RHD9e0svJkeixUJkzJj9ro8QGakiVYtizbXSyYMnvp8h61/lt5ZVKugddU4NacblhPDTt8stYMr3o+CNZuvs2OFRZ7J/6dPdt3B1alcJDZLIBWNj4XXykxEYQZDHQuUdnEMs1/HfpPfKcXA+B6NhJeKr0KYtKAYmNCk6RtTo5AqOD71ygQm9UeYLtvH7IAvHbmyDCwPg17U3KSOGu2iXvftYD2yQoVM8+13b2xui0vmIf3pCNmV6g8Iw3T0TYC0uyxFIgl+gzzZFjq/gbkl64BNkiIZOCg5NiOLe3fPhSZ4lpXsdY51axltVjHyJBNBxBiyg0YqoPN5ggXLtI6Nl+3VBqNzibLqwrhsRegUqzayhvFYXiXugCs5/KaL5az3+3G2Sw8euf9Ih+VCWdIpmcQXS2wHB3GTH8TizeOd8XWhjJOlgvHkcqLExkg8SnOI+0MDLdTmRmZSoApsLan/msrpyC1MG8gg1o22xRQX5YTNxnC+iIssowX7rYod/dW2JrVDn2bbMXG53ZzqPeUtactBlP/TKfH3uDx4M0MjaKENDVi7crH4mKcXIEXMuXEirpn3EHPcNqJfWOmiB+p8DzXW0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT6PR11MB072844.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261022075727099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(261022105027099003)(261026140227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWp0VVQ2WmtVWGhQUmZuU0JMVzRDQ05ZQjhZd0dBM2k3cGJMMmpzcXo3NWZG?=
 =?utf-8?B?Rk51MjRodVFLZ0tzZ0ZMeWdyMDdRYk1aeE1lOFArT09sMDR5WldLRmN4Z1ZF?=
 =?utf-8?B?U0hyVHlrcHUvV1ZPNk5GN3pYa3I3K3FZamhYV1c5RUI2czhQdHlkMjBtbVNB?=
 =?utf-8?B?Z3cwVU1TbFc1WURENDREVHpjUmJFZkZTb1l2dG1tWmpGRy94dndVSjd2ci9a?=
 =?utf-8?B?RkdZaEdYYVpDT2NTQ094dHdYRkNqaldNWkVPbStpQS9yRUxHeGVONXNQVTl6?=
 =?utf-8?B?ZS95UnRCOGNWeFpkaUdDVFd5NTdWQ2tSdVZJMDE3eVBsTitTajdReU4wTXl6?=
 =?utf-8?B?RldjdFFEVHlwZWlpWmlETDQ4U1RpalA2cGJ1T0U0bDhiUGRXRW02MENiTmFT?=
 =?utf-8?B?T1RlWGN4S3dRNGhzUjZ5R05TaExYRFUxWUttdFVoaFd2ZU1xd2hBM3BQRHFj?=
 =?utf-8?B?VkpaMFN2RGR1NnphTzdRU3BNelZMbHhxS1RicEsvU3pPNFlIR0llQW5Eamw5?=
 =?utf-8?B?Q2hpdSsrd3M1ejAyci9MTURpUXBrM3N5YUkrVEQvR2kwQWloSjJta3ZDdHZH?=
 =?utf-8?B?WTV3S2NTSk5CdnFjQXBJcnhkUmkyOHVYYTdOY3piVUs2MGlUaWw2eXZaRW5n?=
 =?utf-8?B?WVNpU29EcGRIeHlGai9seDZhV0tEaDgrVzRhNm1nWUhPY2ppeDhuTERDdnFC?=
 =?utf-8?B?U1hwMDliWXVlYU1LUHBGaTd6aVUxQXFrUEczTVBFeFVyZUF6ZE4vbWJ2QVYz?=
 =?utf-8?B?Y21kNXRjN2czaDhYNFg4UEQrWU4rUHcrU3A2RjUrYUJ4eGlkOExEcnVNZ2hW?=
 =?utf-8?B?bDlNSFZla3RvL3diVVZYZTJPM2d1Y1krWWprSHZybko2bU8zd0ZQS2lBbU9w?=
 =?utf-8?B?MnliVUtvK3c4cktDb1h5akRYbnBOTnY2TkxjOUJ6UU1sMWcxTTlpMTh2Z2FC?=
 =?utf-8?B?Z09XdjdlL3VNWktvbHo3K2hhdkVKWUx2ZGJQU3pualJxSHZib1hKSDlFTE5M?=
 =?utf-8?B?bGRpcEkvV2drL2pOK0p4bHo0V0hBUDdZd0dDbVhYVU1FYlI5TnZIVDRIWUJh?=
 =?utf-8?B?R05IZ2NHNXQwTDRuNVJpckQ0NGdYQWtxN0Q4cEplTWJ1eVBpdzZOT2plWEto?=
 =?utf-8?B?bDdUS1Q5TkYxK1dTbVdOSkQvejRkMzhzU1N0VGkzRlJ5VnVxc3Q3aitDei96?=
 =?utf-8?B?allRcE1VdmIyWkx0NFQ0aXFNN1B0VmdkNC81Wk1wVnZBM1N6VklsS3FJWHNx?=
 =?utf-8?B?V0swUnExSXhlZ2xmNlZKZW1DYUtYVXF5TkNXbXRlOW1lelNoaGNzcnF6MCtU?=
 =?utf-8?B?eUV6by9MNVZrakNaMW9mZmR0NGV3L3RNazlVbmtrODd0QnZpcWQyYWNVSzhH?=
 =?utf-8?B?cnlWdThCTGYrbXVpS2FKNEpDbXZOZG9zZVpxVHhpY1pLbWFMTjVET3VzdjI4?=
 =?utf-8?B?ZnFocVdpdkxRTnQwYmg0bGlxci9Kbjl5dlN4NDBOVkhoZ1lYVHFqdk5aREFr?=
 =?utf-8?B?dkdxT0lhRGNIYnp4dHNHZlhMTmRWdjZSK1MwTVR4OE9XdWJDTTg2cFpUclZZ?=
 =?utf-8?B?anZZanhla0dVZGJ1OUpwM1pBSFpvWVNXbDhWejhVcXEzNW9uWU9ITlJkamcw?=
 =?utf-8?B?V3U1NHFNZHpTcUd4dmc3M1Rub1MyRHRWa3l5UDU0RFFJb2NtMWgwWVh1WEdR?=
 =?utf-8?B?VFgxYXNMajNuMHVwaTkwR0xDaGxLRTV5Z203ZVUzaE5uS3BkSjBGN0NEcUFn?=
 =?utf-8?B?aUFibGx2ZXJXOVEwa2Y4UmdzVTRxNHY1TENjRzg2WEN4SDFNYUVBMzNzSE9l?=
 =?utf-8?B?MEU1MVJNMUZGa1pmYzZaSlorQ3Zhblk1S2JoNHExdjVDVHRDWVBnWElrTmtn?=
 =?utf-8?B?eHNsWXhoRG1yV1Z2QkJQWmx2YmV0MWZGa3ErWXY2MGlhN1VNN1Z0WHpITmdB?=
 =?utf-8?B?L2Q1eDFBc1lwMHB2L2xqL3pGaFlUbGtBQmJkcEJuQmtHZ3lxM2xUVnhSQTBt?=
 =?utf-8?B?a3lHakExanZyTitmcGlaa1YxMXFnNy9Ca0xNdVNvSkxrQzFtM2hWaXhYU2I5?=
 =?utf-8?B?dFk1VmlZQVB1UHJ0SkVWN1JocDJ4SCs4VDBMVzZLeGJwd09WOTFHZ28rSTZU?=
 =?utf-8?B?U2UvTCtUb2QvNllYUXI1eG4yL0pDTmpJR1JBVy9wY3gxb2VLak5YekJNdVpk?=
 =?utf-8?B?QVV2VnQwaU5memhGMGFDeVl2OFBIdTU4Y3BPNFVXY05mbHJNaEJYbUdTNE1P?=
 =?utf-8?B?eEhlMFYwcGphc3UxVDcrbHZtdHI1aGlMRm1xaHVxVXZhM0FRUkhGd2FGSWpn?=
 =?utf-8?B?S3pZSXhSYzB5WHdlZHBYV1ErODNOV3dTTjcwYWxHQ2pUbk80LzdubnRXVjgz?=
 =?utf-8?Q?WdtPRtGF9HPlKqhE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CD6905D06F1554CACB29348CB43948A@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: U+v+zaG6BL43Tz3PRWdayRs9h3sIeIinSoDqM9wKLje7QAnDJO/pmzTVAq5hO3jRuUWtwL+3+lmnVjW2U0Lim98+/negpyXGQ0yPcjWVkfStI/tPAvChrNQtGpfy0jzyGagtWDCw3jJdg2016RpS4IF9WCzsvQpXLXmnVC2ig58aYVWCWQ3a8xF34ijNecqXnfEBtVofpVqDYwmFH7XFty0/6Og54CKgcVoks+XQEJ7WWs0WOmSCTr/VQ7j5Y7Z8dt5388vRSTgoE20xuSx03Ug6w1HnXbYI0RhEbu1DjBFLy9t39Blbd5jqP+8++VZidIvUIsva96gNVXfD9ntWiw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b08c24-62cd-4d55-a613-08df4693e3bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 23:21:50.4629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+W6vH4e0H4nO+XKELYaTETpjzlwcqgPFliQVVAcOgtFaFmWBkNeVvMlet52e8PxI30QIYlCEstxs+GiJRXorgWieos9zkTZf9UwNRkpbm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTExLTExIGF0IDAyOjU5ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCBubyBuZXcNCj4gaXNzdWVzDQo+IGluIHRoaXMgcGF0Y2gsIGJ1dCBub3RpY2Vk
IDEgcmVsYXRlZCBwcmUtZXhpc3RpbmcgaXNzdWUgaXQgZG9lcyBub3QNCj4gaW50cm9kdWNlOg0K
PiAtIFtNZWRpdW1dIGRybS94ZS9vYTogaW5jb3JyZWN0IEdSQVBISUNTX1ZFUiBjaGVjayBpbg0K
PiDCoCB4ZV9vYV9lbmFibGVfbWV0cmljX3NldCgpIFsxXQ0KPiAtLQ0KPiANCj4gY29tbWl0IDYw
YzRiMzQ5NGJlY2NkNWFjMDc1OTA1MDMzOThlNGRkYTUyOWEzODQNCj4gQXV0aG9yOiBTdHVhcnQg
U3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiANCj4gZHJtL3hlOiBTdG9wIGFz
c3VtaW5nIHRoZSByb290IHRpbGUgaGFzIGEgcHJpbWFyeSBHVA0KPiANCj4gVGhpcyBjb21taXQg
aW50cm9kdWNlcyB4ZV9kZXZpY2VfYW55X2d0KCkgYW5kIHhlX29hX2ZpcnN0X3VuaXQoKSBzbw0K
PiB0aGF0DQo+IGRldmljZS1sZXZlbCBjb25zdW1lcnMgYW5kIE9BIHN0cmVhbSBvcGVuIGRvIG5v
dCBhc3N1bWUgdGhlIHJvb3QgdGlsZQ0KPiBoYXMNCj4gYSBwcmltYXJ5IEdULg0KPiANCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX29hLmMNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9vYS5jDQo+ID4gaW5kZXggODM4ODAyNDgyYWRhZi4uMDViZWIxNTZjOTQxYSAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfb2EuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jDQo+ID4gQEAgLTIwNDEsNiArMjA0MSwyMyBAQCBzdGF0
aWMgaW50IHhlX29hX2Fzc2lnbl9od2Uoc3RydWN0IHhlX29hDQo+ID4gKm9hLCBzdHJ1Y3QgeGVf
b2Ffb3Blbl9wYXJhbSAqcGFyYW0pDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7DQo+
ID4gwqB9DQo+ID4gwqANCj4gPiArLyoNCj4gPiArICogT0EgdW5pdCBJRHMgYXJlIGhhbmRlZCBv
dXQgaW4gR1QgaXRlcmF0aW9uIG9yZGVyLCBzbyB0aGUgZmlyc3QNCj4gPiB1bml0IG9mIHRoZQ0K
PiA+ICsgKiBmaXJzdCBHVCB0aGF0IGhhcyBvbmUgaXMgT0EgdW5pdCAwLiBUaGUgcHJpbWFyeSBH
VCBtYXkgYmUNCj4gPiBhYnNlbnQsIGluIHdoaWNoDQo+ID4gKyAqIGNhc2UgdW5pdCAwIGxpdmVz
IG9uIHRoZSBtZWRpYSBHVC4NCj4gPiArICovDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgeGVfb2FfdW5p
dCAqeGVfb2FfZmlyc3RfdW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiArew0KPiA+ICvC
oMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndCAqZ3Q7DQo+ID4gK8KgwqDCoMKgwqDCoMKgdTggaWQ7
DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoGZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpDQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChndC0+b2EubnVtX29hX3VuaXRzKQ0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
ICZndC0+b2Eub2FfdW5pdFswXTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIE5V
TEw7DQo+ID4gK30NCj4gPiArDQo+ID4gwqAvKioNCj4gPiDCoCAqIHhlX29hX3N0cmVhbV9vcGVu
X2lvY3RsIC0gT3BlbnMgYW4gT0Egc3RyZWFtDQo+ID4gwqAgKiBAZGV2OiBAZHJtX2RldmljZQ0K
PiA+IEBAIC0yMDczLDggKzIwOTAsMTEgQEAgaW50IHhlX29hX3N0cmVhbV9vcGVuX2lvY3RsKHN0
cnVjdA0KPiA+IGRybV9kZXZpY2UgKmRldiwgdTY0IGRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZg0K
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsNCj4gPiDCoA0K
PiA+IMKgwqDCoMKgwqDCoMKgwqAvKiBJZiBub3QgcHJvdmlkZWQsIE9BIHVuaXQgZGVmYXVsdHMg
dG8gT0EgdW5pdCAwIGFzIHBlcg0KPiA+IHVhcGkgKi8NCj4gPiAtwqDCoMKgwqDCoMKgwqBpZiAo
IXBhcmFtLm9hX3VuaXQpDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBhcmFt
Lm9hX3VuaXQgPSAmeGVfcm9vdF9tbWlvX2d0KG9hLT54ZSktDQo+ID4gPm9hLm9hX3VuaXRbMF07
DQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFwYXJhbS5vYV91bml0KSB7DQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBhcmFtLm9hX3VuaXQgPSB4ZV9vYV9maXJzdF91bml0KG9h
LT54ZSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChYRV9JT0NUTF9E
QkcoeGUsICFwYXJhbS5vYV91bml0KSkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PREVWOw0KPiA+ICvCoMKgwqDCoMKgwqDCoH0N
Cj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBUaGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVj
ZWQgYnkgdGhpcyBwYXRjaCwgYnV0IHNob3VsZA0KDQpHaXZlbiB0aGlzIGlzIHByZWV4aXN0aW5n
LCBJJ20gbm90IHBsYW5uaW5nIG9uIGFkZHJlc3NpbmcgaW4gdGhpcw0Kc2VyaWVzLiBJJ2xsIHRh
a2UgYSBsb29rIGFzIGEgZm9sbG93dXAuDQoNClRoYW5rcywNClN0dWFydA0KDQo+IHhlX29hX2Vu
YWJsZV9tZXRyaWNfc2V0KCkgYW5kIHhlX29hX2Rpc2FibGVfbWV0cmljX3NldCgpIGNoZWNrDQo+
IE1FRElBX1ZFUigpDQo+IGluc3RlYWQgb2YgR1JBUEhJQ1NfVkVSKCkgWzFdIHdoZW4gcHJvZ3Jh
bW1pbmcNCj4gT0FNX0NPTVBSRVNTSU9OX1QzX0NPTlRST0w/DQo+IA0KPiBkcml2ZXJzL2dwdS9k
cm0veGUveGVfb2EuYzp4ZV9vYV9lbmFibGVfbWV0cmljX3NldCgpIHsNCj4gwqDCoMKgIC4uLg0K
PiDCoMKgwqDCoMKgwqDCoMKgaWYgKChzdHJlYW0tPm9hX3VuaXQtPnR5cGUgPT0gRFJNX1hFX09B
X1VOSVRfVFlQRV9PQU0gfHwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cmVhbS0+b2Ff
dW5pdC0+dHlwZSA9PSBEUk1fWEVfT0FfVU5JVF9UWVBFX09BTV9TQUcpICYmDQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgR1JBUEhJQ1NfVkVSKHN0cmVhbS0+b2EtPnhlKSA+PSAzMCkNCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9tbWlvX3JtdzMyKG1taW8sIE9BTV9DT01Q
UkVTU0lPTl9UM19DT05UUk9MLCAwLA0KPiBPQU1fTEFUX01FQVNVUkVfRU5BQkxFKTsNCj4gwqDC
oMKgIC4uLg0KPiB9DQo+IA0KPiBPQU0gdW5pdHMgYmVsb25nIHRvIHRoZSBtZWRpYSBJUCBibG9j
aywgc28gY2hlY2tpbmcgR1JBUEhJQ1NfVkVSKCkNCj4gc2tpcHMNCj4gZW5hYmxpbmcgbGF0ZW5j
eSBtZWFzdXJlbWVudCB3aGVuIHRoZSBncmFwaGljcyBJUCBpcyBhYnNlbnQgb3Igb2xkZXINCj4g
dGhhbg0KPiB2ZXJzaW9uIDMwIHdoaWxlIG1lZGlhIElQIGlzID49IDMwLCBhbmQgaXNzdWVzIHVu
c3VwcG9ydGVkIE1NSU8NCj4gd3JpdGVzIHRvDQo+IE9BTV9DT01QUkVTU0lPTl9UM19DT05UUk9M
IHdoZW4gZ3JhcGhpY3MgSVAgaXMgPj0gMzAgYnV0IG1lZGlhIElQIGlzDQo+IDwgMzAuDQo+IA0K
PiBbMV0NCj4gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL2J1Zy9saW51eC0yMzIyNGVmMS1hOTQwLTQ0
MDgtOTY5Ny0wYzM1YzY2ZjYwNDYNCj4gDQoNCg==
