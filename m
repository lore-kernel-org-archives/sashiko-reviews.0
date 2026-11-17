Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794950086;
	b=U2xsc1tEauORfCH87PXQTm/SK3qNvPEsTwOYWPDJ25bC4qjKFfSNpMO5xD9/R6P8dwvE
	 jXmBMsosjuH/waOr7LDsyPscFsfhhCL9wpuASyb0BsUOb7sk9uIZ52llT5XgXC0l4ruaQ
	 mWuCEL0nbzKGwmnUVCrSrAbmjCyE0N7Y7LUIrUEQ7aXlNYPdtCSMTcc/bOprlXtHonJV5
	 dE6xb+TGLGyKvTNQc2HAIi5MkQKgA7GahJx0SGrqll+d+cJpyggWuh3YXNyQ+3rghz0eM
	 zTbOBVpuTjNxq5Nc0JRKyl+7EbhhPMt/nImFHbcFHPjzIAvixWVUL7mVQ11jokVGv+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950086;
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
	bh=7LScTPY5tMow/JAiqR4hVmtt5DZGWdsMfEKRP3yBlOM=;
	b=QZXm90DzmzmSx93vOAYBwYtIbp9HGzeo65MYzPUsdh1zeeFnPvBDd907RfBBpT8W2+TS
	 /pJjGwMvXBt9IrsMeamlHlfX01p/p0zWDqTPkRDOsdTe86lpWwKGxhYAj1K+3sPLXWbF7
	 ZxNMplQXi/io2sDahEbopQIVh6b1V++n8mwWwmKKEWjvXWUB9IZ/53Fdr6pzNLbYWrpEe
	 sYngVi2TnI9PradXBlLM9m5WwMeXrWrcP69EwRJkLkDjevtEoY5RLJKllg2qXizgS7Wak
	 FV/f5cqA4UnlFfkTHA8MBAKVgV6GY3xVCPUf/h5DmHiZ5bdFBIafYhlO9o7ewWFRZbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mPaTYp+e;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=IoMrUPXW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3A4606A32A
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 21:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B3A4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mPaTYp+e;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=IoMrUPXW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794950084; x=1826486084;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qBRgVY65Y3Mxd8P/WVzROGlNdSpoSVLRNwAH2w3pYMY=;
  b=mPaTYp+e5D4B4QANtD9D1VdPpSfSshGr293YAWddlOreP0I0vB6xDZty
   RaHr3VWkD9RwLRHbfYKp+WGrw9TXLkEp3K3AiYtDHU3eGAcZ+RzY/XSjz
   +5EwrVSFqMS2qx2KNmchhjQOPiI0k+ZE1EVr9imCDIrMYC9iYCaTDBtc3
   ySpADpJGq6A8pM2DE7qjbxmtz0AG9wz3jviQXQ3376gG7na0mg0hImr/Y
   5y21upn2/2BcAHaNp3oREm7H0Ewi9M2FYa9yabyex1GogqQkdlX/GWf2N
   M4cW1E8Pfd4kRxJ/io1slSc0h3skMorf+G2EnB+hcyDyaSSyAxp+OjSYH
   Q==;
X-CSE-ConnectionGUID: GTruGhyCReWoUdQVpIaPkg==
X-CSE-MsgGUID: CBWGuHhYSIuGaougmy+MYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3630038"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3630038"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 13:14:44 -0800
X-CSE-ConnectionGUID: SRoJwRqeSfCwQklqvi6HVg==
X-CSE-MsgGUID: U01bC4fhSrCvyvA1+hDd5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10078848"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 13:14:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 13:14:42 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 13:14:42 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 13:14:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRjcj2d55hnSQJXd8BnS4VO9WvS6aiOPSvQSD8rzdI5X1DJvo0s7mQZim4qs7fhGQ5xTmjoKhUWDGbC7VdYpDBqC8w33olnbEFsTY9FWVtJ4/EC4X2970Hics9zjuYuzO+ELesxNQydagFCpmowSbXtc3nHUbwmlcy6DI9Y6qYu95uoGHWtn59UOnva2y99PsseysUhDERngZMRbUEwI/2iwXvZwBZ2BQjmefBVHLngkN+/h9vhTd4DNrAWGu7UtsHcS6rbvCrqGu0q1anxJwupPKHKypnNcIuSqaElS5fiMcTL+M3U0S72FZoqmNtCh5ay7G5p2pTBrwX98TpxqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LScTPY5tMow/JAiqR4hVmtt5DZGWdsMfEKRP3yBlOM=;
 b=PrwCEa/81VHANs3Zfaj69TUpBYocAKo0+tdsSOWNmCzSe6tX9RfZCEmV0yKBKZZKRjt9T3+RmXpQboDvu5AMiEP5vPBf5h+C2boNY+qiPLtbT8JzkdEpc3jiBdsnvrUH7w39pY2qL2T4VhXeLZwOsgLkT+IeJU1VqvOT7jPvocyEzkuht6oEtwuYO6K4lGu6HUTbSFe49bHKBYhHS2Sq1t0AwUWtHvN3m747hHL4YU0gJvdyrC5sW1Gco/DW1q9d24KyOizn/UNtzFCUtcMN1WPVhjl32M6RP1yKx4kE8WM6glBY/OvU18oK8+jM+UqPFDAy5Bv3mw5CgLZew7rw1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LScTPY5tMow/JAiqR4hVmtt5DZGWdsMfEKRP3yBlOM=;
 b=IoMrUPXWIamv2lPAVIS7wk6kzzFIxUehvu+UNPzPFI9abmxQPHb+gdwUerNlZxoPeZIrSNtJeyVaCaC+y7L3t2m5Ly1lTngOO3Srrf6Ur65y/BHSWpb1smUKssNZmggjECRwWFoyD+jg7Cq2vYkk37owgoj7Ob8RL8HrHVPyIH0=
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by DS7PR11MB7806.namprd11.prod.outlook.com (2603:10b6:8:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 21:14:39 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 21:14:38 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Charles, Daniel" <daniel.charles@intel.com>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 2/3] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
Thread-Topic: [PATCH v4 2/3] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
Thread-Index: AQHdXaluV8WgdKZjk0irk4kfszJejrcAnlqAgDJAkiA=
Date: Tue, 17 Nov 2026 21:14:38 +0000
Message-ID: <CH0PR11MB5395BFB1E16608BB023635D4E57B2@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20261016195904.1377149-1-daniel.charles@intel.com>
 <20261016195904.1377149-3-daniel.charles@intel.com>
 <sashiko-outbox-174913@kernel.org>
In-Reply-To: <sashiko-outbox-174913@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|DS7PR11MB7806:EE_
x-ms-office365-filtering-correlation-id: 70bba772-5d4a-440c-293b-08df44efca12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|6133799003|22082099003|261009223027099003|11063799006|4143699003|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022075727099003|261022105027099003|261021135927099003|38070700021|10067099003;
x-microsoft-antispam-message-info: TD0SeKdKMN72rnrnAuQt/uJ/BG2G0ZX+O1lEaOk6Hb1+Gh6evqy7LFqPy3AP61xNVrLZJEDcwSu/dDQR8xCgKID0o67DWh0Mj5lf5P/U3MCA8XoXEI01cxpE/1EkVZphRoVu70QsoF+k9vvecajx061xCXadUzxEhvxPCSvZyLVICloZraj07zxG83sJoHLdB7lQwUd0d6PvZjJXNvGM1RoRT91/DfK9XPkvIBuJmt1qKsBdZYymtST36Ye6rnlfYMP2o4duTkjv3IuJXV3kV+FIEXwvjBbNQ4DvnrfTT2NtLkxRJvEsb8VMdyr4zSp8WdNougpj2X/bokxkrlR0/M7aNh0seP+fej65eX0O49c1qJAwbpOepGFIdrXcUnY6Uepn4YyRvfPrq0j7ZAymt4WB6EUlF2W29GQLb225Qg4J29Q7Jw/24Iem/bwcs9F5VL7m1K2GUB87b+bYiEKXAP/DrX5eWbCNgfpbevbxqOpXcsaFgDphv9GgwkCMM0IEGe8RcU5dqam81xzv2X6gyctyNdJBvkoc1NPZuRLb5w1ldPTj3F6ApeV0sAK6qO+/e6HuO52SrpnNxC7g8nE8Yf4NmMVN6ynNEFQDbQxQUoM1UYsxCpd2wy/77oan1Wp9+LAjrXDNZJeNbpvjxr2vaHCHwkC2snSbCZbCNuugW34=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5395.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(6133799003)(22082099003)(261009223027099003)(11063799006)(4143699003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021135927099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?17wTU6xVLu15RKiYY1DqilPgVQVgclzrXO8WIuM86nTS4ASUF6YUrU4j4TaY?=
 =?us-ascii?Q?ADMSaFxn9QpyA0pRHLbsXMODz8xlXCC3oiXQQezlXDuEhu/9JmgZPMpBLMcX?=
 =?us-ascii?Q?r6+dR3HgBxDr/OtmhMz9CLKGmaEmPPAB6B2453/LChD5IlPjp8K18x8m8ge9?=
 =?us-ascii?Q?vI7hYB637y6tEjRfkoWr2K/V/DF4G70tC2Jw+WxM8wC8A0dQIt5F4kwbOkNz?=
 =?us-ascii?Q?MsXZ4pjG1BgwLwZinp+CL+uVMLflTcCMa+ohE4kyyxZqg9LRXPIyO08TeapE?=
 =?us-ascii?Q?WI3S2a6F6U2wuZynAc6mtZwKc1VgdQewmQdo3dpXveDOF1ZGHftp7KlaW7s8?=
 =?us-ascii?Q?OKXAzv72B4mKb5Fx3BZerxua0vSXb4yVnwPlXCL7l6GkFB/889gNIt4jVqN0?=
 =?us-ascii?Q?BCl3fiW+6InXvvU9vCFCUPJ0GxDImAvGBF7k25+Vifg5v++sycpVMP0pu1QD?=
 =?us-ascii?Q?S+WoM+LuQBEPLNR/X2kVItA95rOWOR57TI6ytNzzNyfrO/ZNVAaUBFEoFsUQ?=
 =?us-ascii?Q?xmwG808OM0yPYCE9ZDyAT0CW01p5PYAjDxjK15z+ynqXMyD3rinkB2kjZgLU?=
 =?us-ascii?Q?2wiSsMVncz+kFET9ErjW46XZX7383glWqdaZLKfrsYN99ROLaD8gh59SmCt8?=
 =?us-ascii?Q?ODx7VnukRkhPOtQIjHNpSN+tzC9fEg7NCwQMwNBSONnRhg0JAYE8GAw9a+RA?=
 =?us-ascii?Q?I8lLzpQ2hmehWcHEcnaX3YTCiJ2D95O7zWkwygUacqH4tprtqb/biTeTZN8E?=
 =?us-ascii?Q?A7KWJdOUgw6tfVgKySKV+4khl4f6yfmlYLdzGbvZnLbMVG4cewYTxIiEYfYE?=
 =?us-ascii?Q?ojUGzuK5UblYuFcERLz1leUhxmqXEn/OPXBV5o8dq0oWmd/zO+p4T1f15kXa?=
 =?us-ascii?Q?O0ap44pUpa+vsfewqrs1F17RTGTlX/8tekWopAYswATACmT5y/NoSXxiZ196?=
 =?us-ascii?Q?ClEIuTEra+/nH1wDsRfZtYHDcpeOCyoG1I7pM9Ib14b8ZmU7G+eNJVOc2evC?=
 =?us-ascii?Q?4MZs9c1uc04D5+qps50oj+3y2VmVlgZybVK8vWkDVcpds+VuVNk5T2fVI1ap?=
 =?us-ascii?Q?TONeKA/pHGKuWDXcVMVzzmpQTxausGwez9t8m0fQqBFbMfyqLYDK1l0IhIMS?=
 =?us-ascii?Q?0q8dQfydYgo5wpErl52AVNlVDAZSgTW7+A432GPu9tU6i5oIf9pkjYwZ29La?=
 =?us-ascii?Q?yCE2VoHft+r1c+zbR1joCOULVUo+jRlz2O47C4f3SqVGL2vVeyHNhddAXcIu?=
 =?us-ascii?Q?JJILTn8nUpd/ugQ6G2T3VibxTiW0uc3A6QMRHRt+0jAu8oi8rAR/5gTUfvQ0?=
 =?us-ascii?Q?FlzAAvdmY+ZPSC6SICYIgRq+DVMbb8mUxAwEAllnGGMfShQo+DS72CW4d4uL?=
 =?us-ascii?Q?FlLTL6bIQt4uUlCvoDUTDYS1TF16buDCLigxJx2uTWbv9h0dI4AamUynJ4yC?=
 =?us-ascii?Q?hRDdMDQV7NhCgTABuCX4jFz+UKyLlahqQddISxuqA0stZBUWxu+D7nUKSU+T?=
 =?us-ascii?Q?mdHSvLhX4mgnRUbt01PO9cIV6rUfQAopmVH6Dm8Xux2fZswpC2gVeBJGQKTU?=
 =?us-ascii?Q?aA0GMWdyRyinZ2YaNoVtPmRRfBYgPZJ0VxSq4h1Tf1myyR5R9eqXa9U7jQLn?=
 =?us-ascii?Q?cLmFB3tohNAeRduJFDad4bzIDm/yEeyNWoRhV/b7My2hSOKAbVhD8TYs8PB3?=
 =?us-ascii?Q?v/h9vA41CkHAbrw6UngUF1TYDPp14zQW8F2JiYiMB3kYgcNYtypM115gJv7L?=
 =?us-ascii?Q?N/dlP+G5LA=3D=3D?=
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
X-Exchange-RoutingPolicyChecked: pDOjyPsVrLQpSUhsHWdferSD6+fzFSw/Z0A8ZYHrVATjMFvdM/DUvP7Bn3TxbcEkngk7xyB8WYy1TCzwbXnu+CevPQ8LhsAkcy/bQSs+NtV781w2nuT7Tj9Si51FbL7MzD3b+j8Wedzil2tgqrjnh4IhmsWAJwqGL3kDdCwQih88nTNW7lzmDdHdc8iSzIeeSs9s3ueo3fZRr9UgrqMQCxH/+70ys/KPPtUxZzwyFBWC9Zr3klmxHaGHVt2XO3nEUfKuJ0/59kR0k0k3vCQc3YZjq3OiAncMtE5k2hV9pIP8wvqyz647R5S9yqihXAgYsrVDL+a4Rx1CKo68la4MyA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bba772-5d4a-440c-293b-08df44efca12
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 21:14:38.7584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Oa9+V6Vz/3Ozb76TnKKmfe3BiRnvFu/Drt3cSV6Tjl6/JZu7PM4Hw2RtKRsvq547xJtEdhi+7PXfwgBAHCYicJrFtzrCBO7a1anpbL4UKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7806
X-OriginatorOrg: intel.com

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of sashik=
o-bot@kernel.org
Sent: Friday, October 16, 2026 1:28 PM
To: Charles, Daniel <daniel.charles@intel.com>; intel-xe@lists.freedesktop.=
org
Subject: Re: [PATCH v4 2/3] drm/xe: Disable scheduling early on FD close to=
 avoid CAT error cascade
>=20
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] drm/xe: missing killed check in guc_exec_queue_run_job() after e=
arly disable
> - [High] drm/xe: __guc_exec_queue_process_msg_kill() disables live multi-=
queue primary
> - [High] drm/xe: missing ct.wq wakeup in handle_sched_done() for killed q=
ueues
> - [High] drm/xe: guc_exec_queue_kill() called on zero-refcount queue in p=
ause_abort
> --
>=20
> commit f3abc41f0625f68bc7ba67b2b80c949770c16076
> Author: Matthew Brost <matthew.brost@intel.com>
>=20
> drm/xe: Disable scheduling early on FD close to avoid CAT error cascade
>=20
> This commit adds a STATIC_MSG_KILL scheduler message sent from
> guc_exec_queue_kill() to disable GuC context scheduling ahead of the
> serialized TDR cleanup path when an exec queue is killed.
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe=
_guc_submit.c
> > index 924024f6d0b24..1fbc8cd767675 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2058,12 +2058,45 @@ static void __guc_exec_queue_process_msg_cgp_sy=
nc(struct xe_sched_msg *msg,
> >  		guc_exec_queue_send_cgp_sync(q, 0);
> >  }
> > =20
> > +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg=
,
> > +					      bool bound)
> > +{
> > +	struct xe_exec_queue *q =3D msg->private_data;
> > +	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q=
);
>=20
> [Severity: High]
> What happens in __guc_exec_queue_process_msg_kill() when a single seconda=
ry
> queue in an active multi-queue group is killed via
> xe_exec_queue_destroy_ioctl() or the error path of
> xe_exec_queue_create_ioctl() while the primary queue remains active?
>=20
> In xe_exec_queue_destroy_ioctl():
>=20
> drivers/gpu/drm/xe/xe_exec_queue.c:xe_exec_queue_destroy_ioctl() {
> 	...
> 	xe_exec_queue_kill(q);
>=20
> 	trace_xe_exec_queue_close(q);
> 	xe_exec_queue_put(q);
> 	...
> }
>=20
> guc_exec_queue_kill() queues the KILL message before xe_exec_queue_put(q)=
 is
> called (and in preempt-fence mode, q->lr.pfence also holds a reference on=
 q
> until preempt_fence_work_func() runs). When __guc_exec_queue_process_msg_=
kill()
> processes that secondary queue's message while kref_read(&q->refcount) is
> non-zero, it resolves primary =3D xe_exec_queue_multi_queue_primary(q) an=
d calls
> disable_scheduling(primary, true) on the live, non-killed primary queue:
>=20
> drivers/gpu/drm/xe/xe_guc_submit.c:disable_scheduling() {
> 	...
> 	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
> 		set_min_preemption_timeout(guc, q);
> 	clear_exec_queue_enabled(q);
> 	set_exec_queue_pending_disable(q);
> 	...
> }
>=20
> Doesn't this overwrite the live primary context's preemption timeout to 1=
us,
> disable GuC scheduling for the entire active multi-queue group, and leave
> EXEC_QUEUE_STATE_PENDING_DISABLE set on the non-killed primary queue? If
> subsequent jobs run or the primary queue is resumed while that disable is=
 in
> flight, guc_exec_queue_run_job() and enable_scheduling() will hit
> xe_gt_assert() on exec_queue_pending_disable(primary), or submit_exec_que=
ue()
> will see !exec_queue_enabled(primary) and send a concurrent
> GUC_CONTEXT_ENABLE while GUC_CONTEXT_DISABLE is still pending.

GuC state changes are serialized by the scheduled work queue, so this concu=
rrency
issue cannot happen.

>=20
> > +	struct xe_guc *guc =3D exec_queue_to_guc(primary);
> > +	int ret;
> > +
> > +	/* At zero references, the queued CLEANUP message handles disabling. =
*/
> > +	if (!kref_read(&q->refcount) || !bound || exec_queue_wedged(q))
> > +		return;
> > +
> > +	ret =3D wait_event_timeout(guc->ct.wq,
> > +				 (!exec_queue_pending_enable(primary) &&
> > +				  !exec_queue_pending_disable(primary)) ||
> > +				 xe_guc_read_stopped(guc) ||
> > +				 vf_recovery(guc), HZ * 5);
> > +	if (!ret && !vf_recovery(guc)) {
> > +		xe_gt_warn(primary->gt, "Pending enable/disable failed to respond on=
 kill, guc_id=3D%d\n",
> > +			   primary->guc->id);
> > +		xe_gt_reset_async(primary->gt);
> > +		xe_sched_tdr_queue_imm(&q->guc->sched);
> > +		return;
> > +	}
> > +
> > +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
> > +		return;
> > +
> > +	if (exec_queue_enabled(primary))
> > +		disable_scheduling(primary, true);
> > +}
>=20
> [Severity: High]
> Can calling disable_scheduling(primary, true) here before TDR stops the
> scheduler trip the state assertion in guc_exec_queue_run_job()?

Can stopping the scheduler before stopping the scheduler cause
guc_exec_queue_run_job() to trip the state assertion?

No.  No it cannot.

>=20
> Prior to this change, EXEC_QUEUE_STATE_PENDING_DISABLE was only set when =
a
> queue was either suspended, banned (with scheduler submission stopped), o=
r
> destroyed at zero refcount, and guc_exec_queue_run_job() asserts this
> invariant:
>=20
> drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_run_job() {
> 	...
> 	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pen=
ding_disable(q)) ||
> 		     exec_queue_banned(q) || exec_queue_suspended(q));
> 	...
> }
>=20
> Because guc_exec_queue_kill() only sets EXEC_QUEUE_STATE_KILLED (not BANN=
ED or
> SUSPENDED) and does not stop drm_sched_run_job_work (which is only stoppe=
d
> later when guc_exec_queue_timedout_job() runs on gt->ordered_wq), if anot=
her
> job is queued on q->entity and guc_exec_queue_run_job() executes on submi=
t_wq
> after __guc_exec_queue_process_msg_kill() sets
> EXEC_QUEUE_STATE_PENDING_DISABLE and before the GuC SCHED_DONE G2H clears=
 it
> or TDR bans the queue, won't guc_exec_queue_run_job() trigger this
> xe_gt_assert()?

This patch causes guc_exec_queue_kill to stop the scheduler, and by extensi=
on
drm_sched_run_job_work, so this cannot happen.

>=20
> [Severity: High]
> Also, when disable_scheduling(primary, true) is called from
> __guc_exec_queue_process_msg_kill(), what wakes guc->ct.wq when the GuC
> replies with XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE?
>=20
> In handle_sched_done(), when runnable_state =3D=3D 0 and !was_pending, th=
e wakeup
> of guc->ct.wq is gated on exec_queue_banned(q) (and placed before
> clear_exec_queue_pending_disable(q)):
>=20
> drivers/gpu/drm/xe/xe_guc_submit.c:handle_sched_done() {
> 	...
> 		if (!was_pending) {
> 			if (exec_queue_banned(q)) {
> 				smp_wmb();
> 				wake_up_all(&guc->ct.wq);
> 			}
> 			if (exec_queue_destroyed(q)) {
> 				clear_exec_queue_pending_disable(q);
> 				deregister_exec_queue(guc, q);
> 			} else {
> 				clear_exec_queue_pending_disable(q);
> 			}
> 		}
> 	...
> }
>=20
> Because a killed queue only has EXEC_QUEUE_STATE_KILLED set and
> exec_queue_banned(primary) is false, handle_sched_done() clears
> EXEC_QUEUE_STATE_PENDING_DISABLE without waking guc->ct.wq (and the follo=
w-up
> commit "drm/xe: Synchronously wait for queue kill on FD close" only wakes
> kill_wq via guc_wake_kill_waiters(), not guc->ct.wq).

+		 * @submission_state.kill_wq: wait queue for exec queue kill_sync
+		 * waiters, kept separate from &xe_guc_ct.wq so that waking them
+		 * from the G2H handler does not wake every CT waiter.

Also, in guc_exec_queue_kill():

         * Do not signal the suspend fence here, the queue may still be run=
ning
         * on the hardware. Only wake any suspend waiter so it observes the
         * killed state instead of waiting out the full timeout, suspend_pe=
nding
         * stays set until the queue is torn down.

It looks like this is intentional to prevent every CT waiter from waking up=
.

>=20
> Won't any waiter sleeping on guc->ct.wq for !exec_queue_pending_disable()
> stall for the 5-second timeout and trigger a spurious xe_gt_reset_async()=
? In
> particular:

AFAICT, no.  Only the ones that were killed would be waiting there.

... But they were killed, so they shouldn't be waiting any more anyways?

>=20
> 1. __guc_exec_queue_process_msg_kill() or guc_exec_queue_timedout_job() o=
n a
>    secondary queue in the same multi-queue group waiting on guc->ct.wq fo=
r
>    !exec_queue_pending_disable(primary).
> 2. disable_scheduling_deregister() during CLEANUP when a queue is killed =
and
>    put (e.g. via xe_exec_queue_destroy_ioctl(), xe_vm_close_and_put(), or
>    xe_file_close() in this commit) while KILL's disable_scheduling() is i=
n
>    flight. If disable_scheduling_deregister() times out waiting on guc->c=
t.wq,
>    it calls xe_gt_reset_async() and returns early before calling
>    set_exec_queue_destroyed(q), which causes guc_exec_queue_stop() during=
 reset
>    to skip guc_exec_queue_destroy_async(q) and leak the exec queue and gu=
c_id.
> 3. Similarly, if primary had an in-flight suspend on non-VF when KILL ran=
,
>    __guc_exec_queue_process_msg_kill() waits on guc->ct.wq while
>    suspend_fence_signal() -> suspend_wait_wake() only wakes
>    q->guc->suspend_wait.
>=20
> In addition, in guc_exec_queue_timedout_job():
>=20
> drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_timedout_job() {
> 	...
> 	if (!xe_device_is_in_reset(xe) && !wedged &&
> 	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))=
) {
> 		...
> 		if (xe_uc_fw_is_running(&guc->fw)) {
> 			ret =3D wait_event_timeout(guc->ct.wq,
> 						 (!exec_queue_pending_enable(primary) &&
> 						  !exec_queue_pending_disable(primary)) ||
> 						 xe_guc_read_stopped(guc) ||
> 						 vf_recovery(guc), HZ * 5);
> 			...
> 			disable_scheduling(primary, skip_timeout_check);
> 		}
> 	...
> }
>=20
> If TDR enters this block because KILL set exec_queue_pending_disable(prim=
ary)
> (while exec_queue_enabled(primary) is already cleared), won't TDR wait fo=
r
> pending_disable(primary) to clear and then unconditionally call
> disable_scheduling(primary, skip_timeout_check) a second time on the
> already-disabled context?

Only if xe_uc_fw_is_running, which I think it's not if the scheduler is dis=
abled?

>=20
> [ ... ]
>=20
> > @@ -2224,8 +2260,21 @@ static int guc_exec_queue_init(struct xe_exec_qu=
eue *q)
> >  	return err;
> >  }
> > =20
> > +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> > +				       struct xe_sched_msg *msg,
> > +				       u32 opcode);
> > +
> > +#define STATIC_MSG_CLEANUP	0
> > +#define STATIC_MSG_SUSPEND	1
> > +#define STATIC_MSG_RESUME	2
> > +#define STATIC_MSG_CGP_SYNC	3
> > +#define STATIC_MSG_KILL		4
> >  static void guc_exec_queue_kill(struct xe_exec_queue *q)
> >  {
> > +	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_KILL;
> > +
> > +	xe_gt_assert(q->gt, kref_read(&q->refcount));
>=20
> [Severity: High]
> Can this xe_gt_assert(q->gt, kref_read(&q->refcount)) fire when
> guc_exec_queue_kill() is called from xe_guc_submit_pause_abort()?
>=20
> When the final reference to an exec queue is dropped via xe_exec_queue_pu=
t(),
> q->refcount becomes 0 and guc_exec_queue_destroy() queues STATIC_MSG_CLEA=
NUP,
> but q remains in guc->submission_state.exec_queue_lookup until the async
> destroy_async worker runs guc_exec_queue_fini() -> release_guc_id(guc, q)=
.
>=20
> In xe_guc_submit_pause_abort() (called from xe_guc_submit_wedge(),
> vf_post_migration_abort(), and guc_submit_fini()):
>=20
> drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_pause_abort() {
> 	...
> 	mutex_lock(&guc->submission_state.lock);
> 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> 		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
>=20
> 		/* Prevent redundant attempts to stop parallel queues */
> 		if (q->guc->id !=3D index)
> 			continue;
>=20
> 		xe_sched_submission_start(sched);
> 		guc_exec_queue_kill(q);
> 	}
> 	mutex_unlock(&guc->submission_state.lock);
> }
>=20
> And in guc_submit_fini(), the final reference on wedged queues in
> exec_queue_lookup is explicitly dropped right before calling
> xe_guc_submit_pause_abort():
>=20
> drivers/gpu/drm/xe/xe_guc_submit.c:guc_submit_fini() {
> 	...
> 	mutex_lock(&guc->submission_state.lock);
> 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> 		if (exec_queue_wedged(q)) {
> 			mutex_unlock(&guc->submission_state.lock);
> 			xe_exec_queue_put(q);
> 			mutex_lock(&guc->submission_state.lock);
> 		}
> 	}
> 	mutex_unlock(&guc->submission_state.lock);
> 	...
> 	xe_guc_submit_pause_abort(guc);
> }
>=20
> If xe_guc_submit_pause_abort() encounters a queue in exec_queue_lookup wh=
ose
> refcount has already reached 0, won't it trigger the new xe_gt_assert() i=
n
> guc_exec_queue_kill()? Furthermore, if EXEC_QUEUE_STATE_WEDGED is not set=
 on q
> (such as in the reset/abort branch of xe_guc_submit_wedge() or
> vf_post_migration_abort()) and guc_exec_queue_destroy_async() is already
> scheduled, queuing STATIC_MSG_KILL acquires a runtime PM reference via
> MSG_PM_REF that can be leaked when guc_exec_queue_fini() -> xe_sched_fini=
()
> cancels work_process_msg without draining sched->msgs.

I think this was already technically possible in the original arrangement o=
f the code.
The fact that it hasn't caused problems yet indicates to me this is likely =
a false positive,
but I recognize that's not a sufficient reason to ignore a potential issue,=
 so let me dig deeper:

In guc_submit_fini(), xe_exec_queue_put() is only called if the queue is we=
dged.  And the
queue wedged state is only ever set by xe_guc_submit_wedge, which itself on=
ly sets this
state if the refcount is at least one, additionally incrementing the refcou=
nt.  This means that
in guc_submit_fini(), xe_exec_queue_put() can only be called if the refcoun=
t is at least 2, so
decrementing it cannot set it to zero here.

As for the other issue about guc_exec_queue_destroy_async already being sch=
eduled: this
cannot happen because the guc exec queue is only destroyed when the refcoun=
t becomes zero.
This currently only ever happens after xe_exec_queue_kill() has been called=
, meaning the
destroy before kill issue is impossible due to scheduled work queue seriali=
zation.

>=20
> > +
> >  	trace_xe_exec_queue_kill(q);
> >  	set_exec_queue_killed(q);
>=20
> [ ... ]
>=20
> >  	if (!exec_queue_wedged(q)) {
> >  		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> > =20
> >  		xe_sched_msg_lock(sched);
> >  		guc_exec_queue_try_add_msg(q, msg, KILL);
> >  		xe_sched_msg_unlock(sched);
> >  	}
> > =20
> >  	xe_guc_exec_queue_trigger_cleanup(q);
> >  }
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review * https://sashiko.dev/#/patchset/20261016195904.1377149=
-1-daniel.charles@intel.com?part=3D2
>=20

This is my best attempt at addressing these revision notes.
Charles, are these notes accurate?
-Jonathan Cavitt
