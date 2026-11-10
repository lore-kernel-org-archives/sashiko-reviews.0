Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794327230;
	b=jfHcirRXn9Lb/wqnJLcCs8qW15b5tWqcFZ1y9Cr4lzM4smDDdC8k2wEDdc/kIUActYK0
	 /Z8p0BqkzXm/hE4Avb3vUlq6/I60LP0eLHSuZm7vab6+7R3pNqLTmrxeZNwiD8fZAqSaG
	 KHXuAhZTPPA6PtnJaG6qDfxVDbZCH22oZYJSi5jsbCX54D+UrVjubvNX6rj8Eyktf2rnz
	 HEke31LhvIEKfPT4RQy/16Gr68NYe6KCrN38u71agdXKisLd99pjT1ejFsbMgtp4uawJq
	 P+aQmTWzSuPB7ve+1Dw+K7B3imDSftfuM6c0gYLmhUrZZAYCpg/7uyJZrnEDT0IjZoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327230;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
	bh=B/ppmHiqsNvy4CItj8zCcdokL6NfcQfU/S8sdKRBd8A=;
	b=Z5J3EOHM3Rg3fNPGKiK0WKVT8qpj7RO8dMGQRh/qkZznhnQoUVDPusFmFIY0dfkAoj4x
	 Aumg1Ja6nYQLva9sh4rTfWg2XoR4Gdaek3j6nOIeFEMXMPa2pw3yNSIzYJ1zC/hGDHmc2
	 kcMA6lYmpNwWpTZYHzZ4xrumHthn0MfDky1wb6fQCiHDVAXTF5K1UV1UL1TV2y2XtfXsn
	 6bmV7yXY8YmglHhu0YY7K7mDYrI62Wo07BHH2435HSEvnBSRZw1LoeJo+zFXUU8mIVmYV
	 26hr+Jpon1Ciib6F/5D4W9aN/T56Ef6UC02kkOcgJG+aaDntZ5tIZXeKnS/PVDZVKTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g75pG8m9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68FB606A323
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 16:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E68FB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g75pG8m9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794327228; x=1825863228;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HorxHeNsYrVimfhNEqNIRD2x1GCLjrYMS5t6mJWLIfk=;
  b=g75pG8m9WTv9qBO98Vx4JtmpATRr7BbicNC1XmzD1U6wFpiZPdXa/Ow5
   2ZS8HQH7rTWUgaJ/xYz8S3oF3RcWuk7rN9IKLBHT5mWkVqn4D3ajDG07j
   kzRKlDnuf71e/IH3R6pI9TZuiFJds012CORXPwmPgIktbTXOVp980Nkl4
   Hbg0xP4t5WHx/bXeG0YaneRJ+kCa89M7Qy8IMpZvuMXaDf7bZ4UCiGzya
   OxDatfBxKDvIGcQqg5HioPVGC6U74L2VktIGH04Wbw1wfZI7pVaNAWOud
   KYk8mf/WYRqrp1Hg3oT4SYmtLYMXqRYMlCkISRmg27n9vf186qwzfULJu
   g==;
X-CSE-ConnectionGUID: VQVq0OG2TiaQsV2pIE1liQ==
X-CSE-MsgGUID: fh2N79qeRWOB8djPGLeGjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2985211"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2985211"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:13:43 -0800
X-CSE-ConnectionGUID: wHLzyjhYQZCxICZng+PB/g==
X-CSE-MsgGUID: fslH87LVQNCU/esDmPhjiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8059722"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:13:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 08:13:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 08:13:42 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 08:13:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKqYeyX11nTc+zJsF3OGtbbPxlzu77Vtb65jk7yEDK1dxxCh8kSbwK+U24bE9TrR4mVrWuCvm2NeFq0Bn+RzUdN6iNxJRM+Mo4/eI2ySx3vDqKMinUC20NVaQLR0eJBoGkOsUyj5DxaEv0ycNAsFt1KEnk6utlNKz/z74d9O8ERyfEcvafL1/PxdvO2E4X/apIxMnEjOD0UCrA1N818PgA5Sh6iixmW+j4y1UNroAQXQqBgVNH7CBo4fFMetcpNyFOgQlDcRCSzZE0oG2TIjOW5Pl+hMBorBMYLYtCWPWg1zCMuL1ZVTv6LSxRgTbLDW5sfC8YZ0mizF25BYPfz5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/ppmHiqsNvy4CItj8zCcdokL6NfcQfU/S8sdKRBd8A=;
 b=IDiItcd8orE1AkWZV+7U5h4oQaTRp04EH/ypn7juuYMCvQudYSu5wNYSlu55gHbNSt8vABlHBkHRyEM6KG8ZtIlCB02PNIQYxNIdnKFzGpyIJLlHGxvC+uB4nKTHq3Voca7diKquht8fw439DeQphlBKvka6zLXJ8pj6YI4LS60mb3/8SmAKbRI8fB+v+Eu69WrTAu2zqffUkNzcdPHvA5cQWxWSlU54i2q+W1UHv+II5W4526sfw1HZHPvrbTV4DZLnHWlt0P2Shng+JWbyNVKdIPupArlMkmOkHYgTZOoiF1d3CYz2w/fjTxBwyS7DkDFbTDlSWM9VsfOYdpRB9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SA1PR11MB9681.namprd11.prod.outlook.com
 (2603:10b6:806:4df::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 16:13:33 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 16:13:33 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v13 12/16] drm/xe/vsec: Support late bind fw information
Thread-Topic: [PATCH v13 12/16] drm/xe/vsec: Support late bind fw information
Thread-Index: AQHdaxeHmU+gE2X0uEq48BYdKNYRvrcbYb+AgAwE1vA=
Date: Tue, 10 Nov 2026 16:13:33 +0000
Message-ID: <CH3PR11MB046149EF5A455ACC6B30948A06C1722@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-30-michael.j.ruhl@intel.com>
 <sashiko-outbox-194300@kernel.org>
In-Reply-To: <sashiko-outbox-194300@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SA1PR11MB9681:EE_
x-ms-office365-filtering-correlation-id: ac81b4cb-c8ed-47bb-ffb3-08df3f459150
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006|10067099003|261026140227099003|261102123227099003|261009223027099003|261026135527099003|261026121527099003|261026130827099003|261022113327099003|261021123027099003|261021133027099003|261022075727099003|261021135927099003|261021121427099003|261022105027099003|261021130227099003|261022115727099003|261028144727099003|38070700021;
x-microsoft-antispam-message-info: rHOhiiTQuyjjWfQsAg3tlMfI+1SXhu/yUJrqPp5BW6WdMtYZtv6/XU87oBU7qDDA8NuKy+06Kwk7w4JoIBFezbsE1in+WybnR4q5+iJVuDH5QeGnJeSXFx2yqSURQqwean4HouuqBTs3cv24d8hehLiWIE8VVN4WyrGT9zT2wAoPIdeNWJutjIZylE6SkUxl0/Jtp/9vbq3vnVjuuVfDc1ZplwPAYYnqgaaoUNEdmEKIJdr8gIwaKvaO6xTLZrvWp+77QCOiT52uKJ3XiPKi9jjgRXc8qmz/ITG+hJzlbQpZpl/3Z9GkGYw4RBn3yxPX7PrwSpdxIMe4AggUC2zyhv9Zjq3PSN1Zqj8PpQ9Z2o2PtrHeVEg9H8fMqj91lqP+q8d1M3/cWqv/NLM9G43IqAExVe2SunWuYDIatYGyIyPMSLwMGKOaJIxM9hwXhQrvM0LVtj3EsuLFC0nYOVhAhHvMx6eacaWQLnwPkT9H4wtdpkHBsdqlvSRX6Mca2otMMTVBTUAP5/HTG1ycQLlhrrzwe8sQhOehI6ruQe2I9cH6FvnQu9qDE26bboS3B6HNYPRwvqA2/0P0mBwNdwlLiC0c8K0oyie/qtfXEsGBhrw4zb2l6MV+Uz9005L3NH0B9KpSei9aKYGnri8n+IPKupfMynr4SJJZEK7ubDk9AI4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261102123227099003)(261009223027099003)(261026135527099003)(261026121527099003)(261026130827099003)(261022113327099003)(261021123027099003)(261021133027099003)(261022075727099003)(261021135927099003)(261021121427099003)(261022105027099003)(261021130227099003)(261022115727099003)(261028144727099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1jPtpJEKYaw31v/RX+J7vN98TM76cztKV5K3Ekw3FpF/71GCDeydfHh6btfZ?=
 =?us-ascii?Q?UIKEDjEs5KEWNl1uKoVmkywUSAIN1eGq4ZCdJaZbXCLxFuqbPTBO3o0utq2k?=
 =?us-ascii?Q?Jd6Qp+Deh1Yduab/IbadT8iCl6QWDbVm8mCwvGncxOr4fl5wQH8QYAprU3xZ?=
 =?us-ascii?Q?YSw4l0+CLAYWk1SPjCvco+TKthtF9MTA0Bvrmrj2JXMx6JJ/BefdEyjnsXeL?=
 =?us-ascii?Q?G35ephJdOEEzq+fASlYKBMpL57fzZA1q4qii/IBMJar3B72VINLIaabNFLta?=
 =?us-ascii?Q?XYsOw6BfD+P2ilFRL61547hJWpAv/fU9S/wva0W+bSDXFUna/bnrlOe1bZWJ?=
 =?us-ascii?Q?t8B9TWwwF93+2t0MOcxCeuebyO8N1QB0ZHka3Ym6zThU4c3Sq8ZjNGAS3vAx?=
 =?us-ascii?Q?Y2LJSfj+2yBm7I0NyIDExw5HLRRJddyE9OHFDxdtmwDq7mXsPjMRykPsoEhQ?=
 =?us-ascii?Q?b952IllnOpBCXDQdJUygb3RnKMk2oGi3tSW1dorUIS3g/Ew4fG3Kqbwmp1rr?=
 =?us-ascii?Q?rPkeUmX+8gHUDLkCvF2VC0FAlTL5tUa2tKpLRt0BH2QkZGsHR9K2IKOa6Vpp?=
 =?us-ascii?Q?rm6DKY8hbRwyJxgPFf4PRaCCl7jyGRy1SV8IKbOU8i57TX+HZzULrtUBL44k?=
 =?us-ascii?Q?xG5NJBOhXtPXziXh6/mSAVxmJqmrVhbjNaeoDO/lplW7e+54wKAhSxQU388w?=
 =?us-ascii?Q?ZkyHMh1wOfPAKcJT5hOkfVhnzfLkOSO7Jdn2GQQkGFroq/sVt84JK4VGgvGH?=
 =?us-ascii?Q?R6xXCH32R+U09MGFGA0dTBXPb5UC53MYBd3k3Zke2Q+T+uHiya0T1vgVsjiH?=
 =?us-ascii?Q?g+paJZSz4RoJBUwTS+WNnACuX0iQT38qqj9GqZOsVMV93fokjOXro972gFNY?=
 =?us-ascii?Q?n6ZoeEkA2qYKwU5rBiL5s3GyxPUTYmMYot12vExRu+qJ0QGR7Ny1hu5sc/Ae?=
 =?us-ascii?Q?TvHUjlcqxgJn/sx+5PmY/lcfYdJ19j0dB0k7gI4ZwPas2z6KnsMJc+3BvDm1?=
 =?us-ascii?Q?/dDJizLxL3t9WrzMbs1O8GxJHFhgXNGKxTwpWcITPlQfBTEJAIQX04674S3c?=
 =?us-ascii?Q?STIsac+6kUefP3PJaIIGA9SVO5JQJ7i0erkHFiwqh9DHCwPJ1Z2u0Xty5CVl?=
 =?us-ascii?Q?IrKeaObTSs6PfmtzIMTwqMBDKQ/npkw7D3l7PNEIhWWSkV9GciiAxQza0eRM?=
 =?us-ascii?Q?+z7gdGNKWr/ChbgIPzCs5umYYjeeTsM+lHsmXWmwes9xRqHazfeKnh1mV1K7?=
 =?us-ascii?Q?xHy2OgVUcqhCHGmPepcnUCu2jDpnTd+MlyAzmtsAsHbg8a2curC3ZOKYwEgS?=
 =?us-ascii?Q?zM9NsRez1emuHUi0M5OzMmusZAyYPHcAP6ulNuqFaLTjc2Vja+MnOAIGmFfp?=
 =?us-ascii?Q?rnwN2g0JRSwyfBjmFTiWLW6tNcr7Iq2/T8/G26GC45sJCqAE6xVQM5mdzHWn?=
 =?us-ascii?Q?EMOYL4K7BBwdci7IGdIe8GrDopkON4DRy7HojcYh5GYDQP7UWaiuH22PYLCr?=
 =?us-ascii?Q?fdRP0oQwuhgGCNkGxvXg55YSbYXuD/v+MjByxiHfurvL0ENXsWDsc57+a0wS?=
 =?us-ascii?Q?QPlDLoYi0Z30LbnkwYeSpVa7CIct8Yc6x7orwEYX1bNeelFS46vL0SYkXqEp?=
 =?us-ascii?Q?EpUs9Yup99pxlbLBBUrOgIvTEYIQQIpXez+1Yjl4k1ae5gU+sRPwavtwL0t3?=
 =?us-ascii?Q?jtbU/M2pyYUIG0yv1b8GgE8IJGzUUYar4C7UquMnxozVZdHlRJvf7ZTQN13j?=
 =?us-ascii?Q?idRz0woCGg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iCBjIGxa+/IaqvYJP52Z54bop/LX0/FyyPLsz41ediQOb3CbW2Fum6xHWVvJXFD8cJL8Bm5ttei4OhtoK5GFe0KdFXPyNOFNGq5NfZPA6tbigkyuBaaepmDUR3++db7kV3cmDrBTDBIYzcobG1vj3aHwwoRJACbGkRBAR25RRARkcBR/DNdX+3cycnPHOkf+3EOuanzsX56O/vjf2d7kLlcL5Cwafz8DgvBYb4LvfYEKreRhoWV79ag595V8gk+HsXdXVNB6UkR022ITPEOpVegkLRFz8Cg9yuZATtNNcXr1kSR2X1ymLdTUS20CyFieWWRUDaTBf6bcDv0DugPpNg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac81b4cb-c8ed-47bb-ffb3-08df3f459150
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 16:13:33.3149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XOt5uQEaC/wamQDJ5I9e4vGeVb8CsGI3ckl9MvxKRKYbbFx/kgbl9aeVUV8TAgRey51y5l557pzt674kZjex1VzCMhcTqV13M4mIFWPcSD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9681
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
>Sent: Monday, November 2, 2026 5:46 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-xe@lists.freedesktop=
.org
>Subject: Re: [PATCH v13 12/16] drm/xe/vsec: Support late bind fw informati=
on
>
>Thank you for your contribution! Sashiko AI review found 6 potential issue=
(s) to
>consider:
>- [High] drm/xe/vsec: devres race and leak in cri_late_bind_probe_work() o=
n
>remove
>- [High] drm/xe/vsec: cri_late_bind_probe_work() accesses MMIO during
>system suspend
>- [Medium] drm/xe/vsec: lock inversion holding pmt.lock in
>cri_late_bind_probe()
>- [Medium] drm/xe/vsec: 20s uninterruptible msleep() in wait_for_fw() unde=
r
>SRCU
>- [Medium] drm/xe/vsec: inconsistent locking and CRI_IDX_TELEM_DISCOVERY
>race on probe
>- [Low] drm/xe/vsec: missing kernel-doc Return description for xe_vsec_ini=
t()
>--
>
>commit de390f347a84cad7bb93f5a65e0c5583258f4dc3
>Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
>drm/xe/vsec: Support late bind fw information
>
>This commit updates the Xe PMT probe and access paths to check for
>Crescent Island late-bind firmware readiness, scheduling delayed work
>when firmware is not yet initialized at probe time and waiting for
>firmware readiness before PMT telemetry or register access.
>
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index 0f6e3be520c09..5384fef5e5ac5 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>
>[ ... ]
>
>> @@ -281,6 +291,48 @@ static int xe_guid_decode(u32 guid, int *index, u32
>*offset)
>>  	return -ENODEV;
>>  }
>>
>> +static void cri_late_bind_probe_work(struct work_struct *work)
>> +{
>> +	struct xe_device *xe =3D container_of(work, struct xe_device,
>pmt.work.work);
>> +
>> +	if (xe_sysctrl_is_oobmsm_fw_ready(xe)) {
>> +		cri_late_bind_probe(xe);
>> +		xe_pm_runtime_put(xe);
>> +		return;
>> +	}
>> +
>> +	xe->pmt.retry_count++;
>> +
>> +	/* wait up to 20 seconds */
>> +	if (xe->pmt.retry_count =3D=3D VSEC_LATE_BIND_RETRY) {
>> +		drm_warn(&xe->drm, "PMT probe: Late Binding failed to
>complete\n");
>> +		xe_pm_runtime_put(xe);
>> +		return;
>> +	}
>> +
>> +	if (!schedule_delayed_work(&xe->pmt.work,
>msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
>> +		xe_pm_runtime_put(xe);
>> +}
>
>[Severity: High]
>As reported by Sashiko on v5 [1], can cri_late_bind_probe_work() wake up
>during system suspend (such as S2idle, S3, or hibernation) and perform
>MMIO accesses on a powered-down PCI device?
>
>In xe_vsec_init(), when xe_sysctrl_is_oobmsm_fw_ready() is false, the
>driver takes a runtime PM reference via xe_pm_runtime_get_noresume() and
>queues xe->pmt.work onto system_percpu_wq via schedule_delayed_work(),
>re-arming every 100ms for up to 20 seconds.
>
>While the runtime PM reference prevents runtime suspend, it does not
>prevent system suspend (xe_pci_suspend() -> xe_pm_suspend()) because
>DPM_FLAG_NO_DIRECT_COMPLETE is set on discrete graphics devices. Unlike
>xe->late_bind, which xe_pm_suspend() flushes via
>xe_late_bind_wait_for_worker_completion(), neither xe_pm_suspend() nor
>xe_pci_suspend() cancels or flushes xe->pmt.work before disabling the
>PCI device and placing it into PCI_D3cold.
>
>Since system_percpu_wq is not freezable, won't cri_late_bind_probe_work()
>continue running while the device is in D3cold and touch MMIO in
>xe_sysctrl_is_oobmsm_fw_ready(), xe->soc_remapper.set_telem_region(), and
>intel_vsec_register()?

Changed to use the system freezable work queue.

>> +static bool wait_for_fw(struct xe_device *xe)
>> +{
>> +	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
>> +
>> +	if (xe->info.platform !=3D XE_CRESCENTISLAND)
>> +		return true;
>> +
>> +	while (retries--) {
>> +		if (xe_sysctrl_is_oobmsm_fw_ready(xe))
>> +			return true;
>> +
>> +		msleep(VSEC_LATE_BIND_DELAY_MSEC);
>> +	}
>> +
>> +	drm_warn(&xe->drm, "Late Binding failed to complete\n");
>> +
>> +	return false;
>> +}
>> +
>>  /**
>>   * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a
>buffer
>>   * @dev: valid Xe device
>> @@ -343,6 +395,11 @@ int xe_pmt_telem_read(struct device *dev, u32
>guid, u64 *data, loff_t user_offse
>>  		goto dev_exit;
>>  	}
>>
>> +	if (!wait_for_fw(xe)) {
>> +		ret =3D -ENODATA;
>> +		goto runtime_exit;
>> +	}
>
>[Severity: Medium]
>As reported by Sashiko on v2 [2], does calling wait_for_fw() inside
>xe_pmt_telem_read(), xe_pmt_read_reg(), and xe_pmt_write_reg() stall
>device unplug and leave userspace tasks in uninterruptible sleep for up
>to 20 seconds?
>
>Each of those functions enters the DRM SRCU read-side critical section
>via drm_dev_enter(&xe->drm, &idx) before calling wait_for_fw(). When
>xe_sysctrl_is_oobmsm_fw_ready() returns false on Crescent Island (for
>instance while firmware is reloading after D3cold exit, or if late
>binding failed while xe->pmt.base_offset remains set), wait_for_fw()
>loops up to 200 times calling msleep(100) without checking for pending
>signals, task freezing, or device unplug.
>
>Holding the drm_dev_enter() SRCU lock across 20 seconds of msleep() will
>block drm_dev_unplug() in synchronize_srcu() for up to 20 seconds during
>hot-unplug or driver unbind. In addition, sleeping in TASK_UNINTERRUPTIBLE
>for 20 seconds makes userspace readers of PMT sysfs or debugfs files (such
>as pcode_info) unkillable and can cause try_to_freeze_tasks() to time out
>and abort system suspend.

added a check for signal_pending();


>>  	scoped_guard(mutex, &xe->pmt.lock) {
>>  		/* set SoC re-mapper index register based on GUID memory
>region */
>>  		xe->soc_remapper.set_telem_region(xe, mem_region);
>> @@ -350,6 +407,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,
>u64 *data, loff_t user_offse
>>  		memcpy_fromio(data, telem_addr, count);
>>  	}
>>
>> +runtime_exit:
>>  	xe_pm_runtime_put(xe);
>>
>>  dev_exit:
>> @@ -397,6 +455,10 @@ static int xe_pmt_read_reg(struct device *dev, u32
>guid, u32 *reg, u32 offset)
>>  	disc_addr +=3D inst + offset;
>>
>>  	xe_pm_runtime_get(xe);
>> +	if (!wait_for_fw(xe)) {
>> +		ret =3D -ENODATA;
>> +		goto runtime_exit;
>> +	}
>
>[ ... ]
>
>> @@ -477,12 +545,46 @@ static enum xe_vsec get_platform_info(struct
>xe_device *xe)
>>  	return vsec_platforms[xe->info.platform];
>>  }
>>
>> +static void cri_late_bind_probe(struct xe_device *xe)
>> +{
>> +	struct intel_vsec_platform_info *info;
>> +	struct device *dev =3D xe->drm.dev;
>> +	enum xe_vsec platform;
>> +
>> +	platform =3D get_platform_info(xe);
>> +	if (platform !=3D XE_VSEC_CRI)
>> +		return;
>> +
>> +	info =3D &xe_vsec_info[platform];
>> +	if (!info->headers)
>> +		return;
>> +
>> +	guard(mutex)(&xe->pmt.lock);
>> +
>> +	info->priv_data =3D &xe_cri_pmt_cb;
>> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>> +
>> +	intel_vsec_register(dev, info);
>> +}
>
>[Severity: Medium]
>As reported by Sashiko on v11 [3], can holding xe->pmt.lock across
>intel_vsec_register() in cri_late_bind_probe() cause a lock inversion
>with the driver core and kernfs locks?
>
>In cri_late_bind_probe(), xe->pmt.lock is held while calling
>intel_vsec_register() -> intel_vsec_add_aux() -> auxiliary_device_add().
>That path acquires device_lock(&auxdev->dev) and synchronously runs
>pmt_telem_probe() (acquiring ep_lock) and pmt_crashlog_probe(), which
>register sysfs attributes for each discovery entry:
>
>  xe->pmt.lock -> &auxdev->dev.mutex -> ep_lock
>
>Conversely, when userspace accesses PMT sysfs attributes via
>intel_pmt_read(), clear_show(), or trigger_store(), kernfs holds an
>active reference (kn->dep_map) and calls xe_pmt_telem_read(),
>xe_pmt_read_reg(), or xe_pmt_write_reg(), which acquires xe->pmt.lock:
>
>  kn->dep_map -> xe->pmt.lock

user space cannot access the sysfs file until probe is complete.

However, the probe path should NOT use the callbacks because this issue wil=
l
occur.

This issue is being addressed with a different patch set.

>If a multi-entry probe fails mid-way on the abort_probe or
>fail_add_endpoint error path while cri_late_bind_probe() holds
>xe->pmt.lock (or when pmt_telem_remove() / pmt_crashlog_remove() later
>runs under &auxdev->dev.mutex and ep_lock), intel_pmt_dev_destroy()
>removes the sysfs attributes and waits in kernfs_drain() on kn->dep_map,
>inverting the lock order against any concurrent sysfs reader waiting on
>xe->pmt.lock.


>
>[Severity: Medium]
>Also, why does cri_late_bind_probe() duplicate the CRI setup from
>xe_vsec_init() with different locking, and can xe_pmt_telem_read()
>corrupt CRI discovery reads by changing the SoC remapper index?

vsec_init is serialized, and does not need to be locked.  late_bind occurs
after probe completes and contends for access so the lock must be held.

>On Crescent Island, discovery headers and telemetry data share the same
>MMIO window at CRI_PMT_OFFSET indexed by
>xe->soc_remapper.set_telem_region(). In xe_vsec_init(),
>CRI_IDX_TELEM_DISCOVERY
>is set and intel_vsec_register() is called without holding xe->pmt.lock.
>Once pmt_telem_probe() registers the first telemetry endpoint, a
>concurrent xe_pmt_telem_read() (from udev or debugfs) can acquire
>xe->pmt.lock and change the remapper index to mem_region while subsequent
>telemetry entries and cri_crashlog discovery headers are still being read
>from CRI_PMT_OFFSET.
>
>Furthermore, because xe_pmt_telem_read() leaves the remapper index set to
>mem_region instead of restoring CRI_IDX_TELEM_DISCOVERY, if the
>intel_pmt_telemetry or intel_pmt_crashlog auxiliary drivers bind after any
>xe_pmt_telem_read() call (for example when loaded as modules), won't their
>discovery reads at CRI_PMT_OFFSET read telemetry data instead of discovery
>headers?

Resetting the index to the discovery index for each CRI access.

>> +
>> +static void vsec_disable_late_bind_work(void *arg)
>> +{
>> +	struct xe_device *xe =3D arg;
>> +
>> +	/*
>> +	 * If the queued work is canceled, the runtime reference needs to be
>> +	 * released here.
>> +	 */
>> +	if (disable_delayed_work_sync(&xe->pmt.work))
>> +		xe_pm_runtime_put(xe);
>> +}
>> +
>>  /**
>>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>>   * interface
>>   * @xe: valid xe instance
>>   */
>> -void xe_vsec_init(struct xe_device *xe)
>> +int xe_vsec_init(struct xe_device *xe)
>
>[Severity: Low]
>Since xe_vsec_init() now returns an int and drivers/gpu/drm/xe/xe_vsec.c
>is included in Documentation/gpu/xe/xe_vsec.rst, should a Return: section
>be added to the xe_vsec_init() kernel-doc comment (and -ENODATA added to
>the Return: list of xe_pmt_read_reg()) to avoid kernel-doc warnings?

fixed

>>  {
>>  	struct intel_vsec_platform_info *info;
>>  	struct device *dev =3D xe->drm.dev;
>> @@ -490,11 +592,11 @@ void xe_vsec_init(struct xe_device *xe)
>>
>>  	platform =3D get_platform_info(xe);
>>  	if (platform =3D=3D XE_VSEC_UNKNOWN)
>> -		return;
>> +		return 0;
>>
>>  	info =3D &xe_vsec_info[platform];
>>  	if (!info->headers)
>> -		return;
>> +		return 0;
>>
>>  	switch (platform) {
>>  	case XE_VSEC_BMG:
>> @@ -504,12 +606,26 @@ void xe_vsec_init(struct xe_device *xe)
>>
>>  	case XE_VSEC_CRI:
>>  		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
>> +
>> +		xe->pmt.retry_count =3D 0;
>> +		INIT_DELAYED_WORK(&xe->pmt.work,
>cri_late_bind_probe_work);
>> +
>> +		xe_pm_runtime_get_noresume(xe);
>> +		if (!xe_sysctrl_is_oobmsm_fw_ready(xe)) {
>> +			schedule_delayed_work(&xe->pmt.work,
>> +
>msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
>> +			return devm_add_action_or_reset(xe->drm.dev,
>> +
>	vsec_disable_late_bind_work,
>> +							xe);
>> +		}
>
>[Severity: High]
>As reported by Sashiko on v2 [2], can cancelling xe->pmt.work via a devm
>action race with devres_release_all() and leak the PMT auxiliary devices
>and their MMIO resources on driver unbind or probe failure?
>
>When xe_pci_remove() runs (or if xe_device_probe() fails after
>xe_vsec_init(), or during xe_pci_error_slot_reset()), xe_device_remove()
>and xe_pm_fini() run before devres_release_all(dev) without stopping
>xe->pmt.work.
>
>Inside devres_release_all(dev), remove_nodes() splices all currently
>registered devres entries (including vsec_disable_late_bind_work) from
>dev->devres_head onto a local todo list before release_nodes() executes
>any callbacks:
>
>  devres_release_all(dev)
>    remove_nodes(dev, ..., &todo)  /* moves dev->devres_head to todo */
>    release_nodes(dev, &todo)
>      ...
>      vsec_disable_late_bind_work(xe)
>        disable_delayed_work_sync(&xe->pmt.work)
>
>If cri_late_bind_probe_work() is already running on another CPU when
>remove_nodes() drains dev->devres_head (while release_nodes() is running
>earlier actions or waiting in disable_delayed_work_sync()) and sees
>xe_sysctrl_is_oobmsm_fw_ready(xe) =3D=3D true, it calls:
>
>  cri_late_bind_probe(xe)
>    intel_vsec_register(dev, info)
>      intel_vsec_add_aux(dev, ...)
>        devm_add_action_or_reset(parent, intel_vsec_remove_aux, auxdev)
>
>Because dev->devres_head was already moved to todo, the newly appended
>intel_vsec_remove_aux devres actions are left on dev->devres_head and
>never executed. Doesn't this leave the intel_vsec.telemetry and
>intel_vsec.crashlog auxiliary devices and their resource reservations
>registered on the unbound device (causing subsequent driver re-probes to
>fail with -EBUSY and exposing dangling sysfs callbacks after xe_device is
>freed), as well as calling xe_pm_runtime_put() after xe_pm_fini()?

I think that this race is possible...are there suggestions on how to elimin=
ate the
possibility?

M

>[1]
>https://lore.kernel.org/r/20260903202808.A8A5A1F000E9@smtp.kernel.org
>[2]
>https://lore.kernel.org/r/20260812195421.15EE31F000E9@smtp.kernel.org
>[3] https://lore.kernel.org/r/20260923181115.2514193-39-
>michael.j.ruhl@intel.com
>
>--
>Sashiko AI review *
>https://sashiko.dev/#/patchset/20261102221314.119028-18-
>michael.j.ruhl@intel.com?part=3D12
