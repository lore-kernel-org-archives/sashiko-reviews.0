Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795458760;
	b=DmvZlkPjkGDAVMv7tHTRIJ6l23gbivPuPHswgTBtAk8Tuaq8IdVQ9p2B0ol4CJr3cRgx
	 CwOQOd/mE4h0RjIITn0P2VgSAwbUHPg7BMT7k0brZHBV40wof1fTOcQQlV4TNxGrjRLU6
	 rHNiZaWpZwVpC7gNjYt7AX5ECthwP4ozGLSxyn7bxCM2WqpdNtOFVAjQapyzzpGoD/BgJ
	 GE4i52G/4PoEJFNqK55wf6GvS+WsUAGJ48I2t4qAZXBniqttl/sZb1L+8dgLq4he8sAFq
	 R9DyJm83OMSuDPHFc1ICacE/hSnXYUnBXz5mA8hYTHlAK+GRwRy5vAjHev6Li64ygiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458760;
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
	bh=G36NFjJsENXzAIA5Ylv5sFPM6qfK3c9kH91DwZhL//Y=;
	b=DERfeH4knkjxz40xZuPUGiOOAW3uCDzFArYjV+ah2ZbeaZX1lwyL45X6iS2MAM0lHXxT
	 4zoJP5z2vnwyrAw7pmjb5l7y5dvVVeSe+XcWsx+WfSUmnHiiuRRSQVqi5G17fDTCV5/oS
	 4i3l7ipgeCO2wrlCs9axTDUHZ4cvaAd3rFbGFLuFG84C/1MjicfE+44+ioZzZRzaDkcRl
	 nR9aIKoph5421SK0c4rf3HDFGaDTSEZL0WWiczwVXwG1j3r/s1m3RatABCZHRt4tt+1c2
	 TBCcQ7kg/AHJiOgY6rbyOHbCm8QShG1IdfQ2vGRWMrFEp4UikkSqCvhgYMYhShhW4TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LXt30eDz;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NRC121UU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E0606A32C
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 18:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14E0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LXt30eDz;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NRC121UU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795458760; x=1826994760;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G36NFjJsENXzAIA5Ylv5sFPM6qfK3c9kH91DwZhL//Y=;
  b=LXt30eDzGuGWGAXfZ900CjVU3WkVzMpQT19m/9prTWjWJ53vckEi4N/s
   OsaDuapOrW1tO3zfTp7pX00edFxi2fO9CqUuVw438qQxTRPB53dhIdaJP
   i+zWERUZgQiR+BCJlOmO95kF3P6KHmrOpjFUUp1L6+i5vShwzSlmN6WFg
   WqsWNi3Ob/3eiz8f7uI/R5NP/8rYwMAj3pSM0iHpjc5xW2EcUBiXDEK4/
   DyFnD3HEnLxB9Sb8s8zgeCphSnSuPaj03r9EYog7XSlhpvitRLOm1X96b
   03FTd847kA0siEXQMknxv0kAVHOakBL2tIA3LQ1ADvUhA10RO3y3HR4ym
   Q==;
X-CSE-ConnectionGUID: TWF/2pWCQmuLCXFCxzMg1g==
X-CSE-MsgGUID: Jyed2w80SIunsqV657yXrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4294578"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4294578"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:32:40 -0800
X-CSE-ConnectionGUID: jte+bKWyRfGN36DZvKfPhw==
X-CSE-MsgGUID: SiWaIEfRQrGoRAkhsguqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11529775"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:32:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 10:32:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 10:32:38 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 10:32:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aywETKEkKYnfO/ZFh0vEITq3gGCJF3hsoMjvcDHno3WZ+ufFk4GWlL24Pjp612FCXxGrDlAIy4UUPjbTLE4p9XqPrTcDIuAvekVSnI5nTq3oMF1ONJnfFnXryV33C0/2+snHjAZCbFrx6/mDiE2L903PxCT9HGVxhDW3NHwB7BTAZRnISb0N0AGa1chBCYyYDHovXbwKjz7n97zjWfo6fxqWQLHrfx9/topmwXu6ywzTfr1F2igZELDz5r+g8mGbem7amCn64anzpHLzVkMrseQPphCqzWw6kHPrESQlZxvlaFmM5ruU4XYwWmGIvZpFa/eEOlCCxoQMUWqG7hYe8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G36NFjJsENXzAIA5Ylv5sFPM6qfK3c9kH91DwZhL//Y=;
 b=Zld11Au5iG4tkUmWFMEa6Ota5MXCOw1lSo0nvxZruFUMQ/TNlN1Xc1LR01GGmDgGH1FZoLk1q0eCPof5Xsi0KyISbwLO2y8LapBwX9C/M/oothVSfFpjy1WBW0X4N4QGYEG8nCZZcBwFcq4jC8/p8GiPzwFKXfuuaWhXlpk+lOgZQ6MPA6dw6JVtXCMTKjVAAb+DQ0bT0S8q3VjcztTGiDNbihQ0Jw8RpOZd1gW4reGTMxvAHQn8eMzFodDGXIrbAWzgBr1M6YfuV9Cvdo/Y0di/QClXYtpl23kHHmHQfZz+D/FO+U1NNL2a8fgQK3jmqSb6NRgl9j2CeB+qbUPRuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G36NFjJsENXzAIA5Ylv5sFPM6qfK3c9kH91DwZhL//Y=;
 b=NRC121UU9EK6LykcTN4Gmny5qxlweLQ+YnXFP77gATJs7Bo0x0BNE1Qt9oblrN3eth8Slu1aLwT65//iOhCxLFu4feenE7JeqWNtFNhcJe+HO6mwP1AcbR2vVKxADa+ZoH4KUfONEebVvoNFH5uI/UYvsNxfdGyL1OOQwnNHOps=
Received: from IA3PR11MB824491.namprd11.prod.outlook.com
 (2603:10b6:208:626::16) by PH3PPF6E8D29981.namprd11.prod.outlook.com
 (2603:10b6:518:1::d2d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 18:32:35 +0000
Received: from IA3PR11MB824491.namprd11.prod.outlook.com
 ([fe80::c2b7:5964:96e1:8ffd]) by IA3PR11MB824491.namprd11.prod.outlook.com
 ([fe80::c2b7:5964:96e1:8ffd%5]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 18:32:34 +0000
From: "Salin, Samuel" <samuel.salin@intel.com>
To: Tian Xun Ng <luckilystar08@gmail.com>, "intel-wired-lan@lists.osuosl.org"
	<intel-wired-lan@lists.osuosl.org>
CC: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Tantilov, Emil S"
	<emil.s.tantilov@intel.com>, "Nguyen, Anthony L"
	<anthony.l.nguyen@intel.com>, "Kitszel, Przemyslaw"
	<przemyslaw.kitszel@intel.com>, "Lobakin, Aleksander"
	<aleksander.lobakin@intel.com>, "Loktionov, Aleksandr"
	<aleksandr.loktionov@intel.com>, "decot@google.com" <decot@google.com>,
	"Olech, Milena" <milena.olech@intel.com>, "Hay, Joshua A"
	<joshua.a.hay@intel.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, Tian Xun Ng
	<tianxun.ng@bytedance.com>
Subject: RE: [PATCH iwl-net v5 3/3] idpf: keep the mailbox up while tearing
 down vports on shutdown
Thread-Topic: [PATCH iwl-net v5 3/3] idpf: keep the mailbox up while tearing
 down vports on shutdown
Thread-Index: AQHdWwxDtYeA7gf+1UyLjXTx75cw+rb89KQAgAAVfgCAPzG1gA==
Date: Mon, 23 Nov 2026 18:32:34 +0000
Message-ID: <IA3PR11MB824491E7FA4697CFB74C5566B69B452@IA3PR11MB824491.namprd11.prod.outlook.com>
References: <20261013121224.84482-1-luckilystar08@gmail.com>
 <20261013121224.84482-4-luckilystar08@gmail.com>
 <sashiko-outbox-171247@kernel.org>
 <20261014133002.99917-1-luckilystar08@gmail.com>
In-Reply-To: <20261014133002.99917-1-luckilystar08@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB824491:EE_|PH3PPF6E8D29981:EE_
x-ms-office365-filtering-correlation-id: cd53f59e-6d00-467f-ea7e-08df499024a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|22082099003|18002099003|261009223027099003|56012099006|4143699003|11063799006|261028144727099003|261102123227099003|261021123027099003|261026121527099003|261022075727099003|261021121427099003|261022105027099003|261026140227099003|38070700021|10067099003;
x-microsoft-antispam-message-info: v2fuJH0IFFyiI/dTXZIIgkgurW1Lw1i/BNj8RAZf1Up22/7xoYVf6AwgvAsVky2hCoq/T8EEIX3lVNRcb63USWaIf/8vBx3M5UqZ3puQczGoAQhSgx6hgUsk25I7kHaxG+tV8LxQ/paHfUGvrsYH4v5FVMXGIUkkiQLDNvaoRx7wWsG3Pq6TrWObsWN6K+N20u7/L5qrD1x8sLxVevl1vAKmbuav851ZuBqJyXpmZlnW9wfT2ryn9jyiygSZhSAvJr8QuP8/SzuamU3xoz2yh/r/Cvm9aE1/wlWmw9Ue5N4GHWUHoexj+D6dEVcz4m+I2IVk7lP6xp/7RzRWTXyvxUlH4sElB/HZ0q2z5TlYeJEjgFELsB6eGJ0WXVkMT36qZ3XGNCSqYZfzgfpI2iyBvsNcBrBuP+QJ8TmuWsCHeUOunJVLvkoQoJM7F1vDnuucLGAb5ksExducfTdXnAi/yIPsc6381M59ibo7/ixD9xYyfUoNgwt0Q62F48LkyIip55SMJRyoCx+hfGQA3Gx3fwVvJ3fJLNlZ34rPjTivykwYxsCGVCV81rsrMvYrQnXEHylAlUdKjVeJB89obP3Cav0jXxQEK5QUGwdvxD7ISwqgtftQlnloy7Q5dIJF7K3nvSsmA4ONpidkSmOck1FSV9fUaXfSdfQeAiliySHwvPoJt55hKkdf9YbbL8SKe5A7IRjvbjRzqqC9FNzxYX8daIgbrxmEYChwSGHr6Sz3PYo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB824491.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(261009223027099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(261102123227099003)(261021123027099003)(261026121527099003)(261022075727099003)(261021121427099003)(261022105027099003)(261026140227099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lgA4SpPg5exNMXZKPhRX3lWUD7K+r0nNUMfkoK3fNBJjllWNNJNXPtBhQr+e?=
 =?us-ascii?Q?czJk2I2PI2HjC09X7yO0puzeEVz9/aZbd1zrsUlG4oF77dEtXF/elAfAzg5Z?=
 =?us-ascii?Q?9uWBsBV/+6Zq5p9YE6jRRmG0Fs4sNBAA3dIr4n7Jo0Yw9DxhR3Xe2pBNFS7b?=
 =?us-ascii?Q?BmqiiRMgGi2NEnczqP1dv50gvHbvUfDQDs4Q+ZiJz26h9fCrKRgofjEinNB9?=
 =?us-ascii?Q?t7riyyqJZtsrxCRtn75Jx9ZMKk0MbcNV4p4dSX/NDEYF2RKZm0SUWiBqbR3I?=
 =?us-ascii?Q?viw/Ej/9yASsI2ZqgUFazx1lcMBanaC61tfX0aTbrAtzJHByUap4K7xnvhfC?=
 =?us-ascii?Q?yHvHBGDM4/tOa3rNsFNqlA/DFA8aJjoSvx4ledPLvtX9b8spfnxZVEU4SRWM?=
 =?us-ascii?Q?/j1RHA9qHf5bgIB376MF5Jl8mZT89CUeEezbclXuXXtfJXy/XFpnJseEBQqa?=
 =?us-ascii?Q?vxWRsXjZ3SPQKldAOQqxz9PnITwovLDp3jBxI+cpc9WESGXGXJ4zC52mqv4w?=
 =?us-ascii?Q?LtLNi7mteGiz36mXeEB9h05rEaAY32Y44K6E7HA13bYGdzzwkKn96VRQ6lYG?=
 =?us-ascii?Q?kv8B5bJyMBRIGKFU0yzIsBjnX0a8p/1iTCmiVSa9A7r0q9lwJiQauUABXU/g?=
 =?us-ascii?Q?UoAjWUOuImhw+mWO/9rFli3O/WCoSwcI7GfGBtS0GkUJ0m4VdMV3K+dSIi5g?=
 =?us-ascii?Q?5DnW6qfMHIR3pdqfyF60aLbjFmC5StIz68DT48bymV2EZ/abxNvTUloOLHdV?=
 =?us-ascii?Q?kwsjgaNSqzkCX2a+3aZ1z5KOSuIxau9W19iIPUR+YKlBFj5w83oBUhywqNRI?=
 =?us-ascii?Q?C6XQRTUoxC96sDqEMRhN93Bp2GPLUaYD3N00XQEz+5ixttpty0kKyK3/PRuw?=
 =?us-ascii?Q?onUVvK5Dw7dsAnUGB/XK8pmZ1cvbH7Jr/FbIU+KiRRuGl60nmIRnCd9irnBe?=
 =?us-ascii?Q?6+GospLg4c0HibHVd050no5BD5/lVYXsfMgvzsjur9y6wOhRNw9YgbXZWvoi?=
 =?us-ascii?Q?9EYmFbESTOnOUVbHKBtxgXcbsgZTmCc4r4C/ho/IlEAQ96Yc7f7v0wyXNu0V?=
 =?us-ascii?Q?kewVCFuvdUGqxmncqipRBcwmUuivXM3n5ZdWO5zh5YcKVJc8PRBJwVOqASgy?=
 =?us-ascii?Q?wl0bqDY27xkx3SspU8PwHUVWOxfLZTJoZhuZ6CRNWc24ALU9hHxEXMtY/wc3?=
 =?us-ascii?Q?0EuGVGhxvrB5LvHt5+qfk6P/TxR64OjQ5PAixSFpNX85EQMHcvcwntx4zWQT?=
 =?us-ascii?Q?CPBxkYHqS5FYd3wKWw6HlYMghSMH1S1IGLdv/8lFp69pTYUghNvZClXmogXu?=
 =?us-ascii?Q?UAy8uZ3/esWxtZqyunGJLSbAQhuUBv49SK1tuhnnsZOC1NJbnslukq8FmOJd?=
 =?us-ascii?Q?HsWex2y1fQ3KKjzS6A51vIhVyxWoMrEiqafTDfD7M11Wx104g/rHGo5Zt6qu?=
 =?us-ascii?Q?h3a+qC7p4yn7p/JttI1nHB/abCrk/dth/QyccvnGiKzczQ5eJ+GKMWfAciwi?=
 =?us-ascii?Q?Kq+zK60j2bzKGieh+GbQAHKA+hRPzKtY0Qy2BQQ2yF9BR7kNvpS+IOitehll?=
 =?us-ascii?Q?+SvYe6p9z5qrK268npTUbnmDeLc/ppUVpDr+40k0xa0rBy+0YTNbZOiAZxdh?=
 =?us-ascii?Q?LebI00FUV1bJtyMsJtLoLPDa2C9ufdptcC45IlTfBFWHvI0OTElR/DAhU2Fg?=
 =?us-ascii?Q?EtGpY/ptD9nWAV5PhLHzmo2FjO+Imb2NdRhXlZZ0ANFCyCVu?=
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
X-Exchange-RoutingPolicyChecked: TEnZwotbYUTxiJqmJNMIm4bz/iTtxWNgBeFo4Fup0dcVLjOaaeunCcwCwW5h4ovePQ0O3GtetD5ZkraPuDcg+06KjtQnByDed0y5qC2JWyZY5BdLTIQ1LyVQJGJTnH+ScLJysL17qTzbqhKAuuuDh4WPGxsd3EUC8zLqzoOD3eNLhStH/gvoblgiQrHRyvoZPjJchYBvzbBn9iUvwPnZmqTo17kvU1piYMoO3R6L9Cm9ql33Ka0wK1O59sSfCb/4F/8rhmYt/ng37Mnpshh+/QUtxzfpNqMJQPKkLeT5Odvsv4DQcJsKXUSI8jzQeLfP+mDVgsyrhL9S3Ds+Aj7xyw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB824491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd53f59e-6d00-467f-ea7e-08df499024a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 18:32:34.8594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GFxlRyBVi16PJKpfExMejqrIoDIhmSA2VxZRmS0rE6Y1IhR5xWjdJ8/RFJLo6Z6vTgWTSHft2itUg/oS6zm3cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6E8D29981
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Tian Xun Ng <luckilystar08@gmail.com>
> Sent: Wednesday, October 14, 2026 6:30 AM
> To: intel-wired-lan@lists.osuosl.org
> Cc: sashiko-reviews@lists.linux.dev; netdev@vger.kernel.org; Tantilov, Em=
il S
> <emil.s.tantilov@intel.com>; Nguyen, Anthony L
> <anthony.l.nguyen@intel.com>; Kitszel, Przemyslaw
> <przemyslaw.kitszel@intel.com>; Lobakin, Aleksander
> <aleksander.lobakin@intel.com>; Loktionov, Aleksandr
> <aleksandr.loktionov@intel.com>; decot@google.com; Olech, Milena
> <milena.olech@intel.com>; Hay, Joshua A <joshua.a.hay@intel.com>;
> andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com;
> kuba@kernel.org; pabeni@redhat.com; Tian Xun Ng
> <tianxun.ng@bytedance.com>
> Subject: Re: [PATCH iwl-net v5 3/3] idpf: keep the mailbox up while teari=
ng
> down vports on shutdown
>=20
> On Wed, Oct 14, 2026 at 12:13 UTC, sashiko-bot@kernel.org wrote:
> > - [High] idpf: NULL pointer dereference in idpf_tx_start during
> > shutdown
>=20
> This path is not changed by the patch. idpf_vport_dealloc() skips
> idpf_vport_stop() and idpf_decfg_netdev() while IDPF_HR_RESET_IN_PROG is
> set with or without it, and idpf_shutdown() has lacked the stale netdev
> cleanup that idpf_remove() does since 4c9106f4906a. It is a separate issu=
e; I
> can look at it in a follow-up.
>=20
> > - [High] idpf: SW marker consumption race causes cascading timeouts
>=20
> The set-then-wait order per Tx queue is the same as in the current code. =
With
> the default split queue model each Tx queue has its own completion queue
> (IDPF_DFLT_SPLITQ_TXQ_PER_GROUP is 1), so markers are not shared. Where
> they are, this patch limits the effect on shutdown to one 500 ms wait per
> queue set. Setting SW_MARKER on all queues before waiting looks like a
> reasonable cleanup on its own.
>=20
> > - [High] idpf: DMA memory corruption on slow CP during shutdown
>=20
> This is the trade-off discussed on v3 and v4. Without the patch, shutdown
> sends none of the teardown messages, so a control plane slower than 500 m=
s
> is no worse off than today, and a responsive one gets the full teardown. =
On
> the tested devices the queue-related messages took at most 240 ms.
>=20
> Thanks,
> Tian Xun

Tested-by: Samuel Salin <Samuel.salin@intel.com>
