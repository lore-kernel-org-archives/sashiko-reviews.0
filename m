Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794479036;
	b=bZP/CIkWWkLHy0WzpI0sqI/P1Frskt1bYHjODGP4XlAe9qbgRQbBMZ4A8iAQHnsrmNiK
	 u3/fjjYLXWg5rMvw/LfII0UGbtB2t1pazVMGdQMyOZAGA2qoLooX/YmZ252XJHWHYtdhw
	 +jKiaaCyLdKfE5xXG23/F+2syf74rTCpaoPFkDbFt9gBysvNaBNDLR+XtarzWPFU33PtD
	 X6SySujPNqRHLvbZlIJzc8DGAFMhHI0GqiEzHME4O/m2myU6MFCH2wg2vpz9IQIOFvzuq
	 V1HkDYDtDcMxMdWEaF9BEwpvfWA+CRgzlfI+U2E65YkvZ8P/qaXK9dW5vz5wOq9jybg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479036;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:Subject:
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
	bh=A/7+ix34RHRVT+/rHs68F/3FFYvydr1wMuGRTpG7noE=;
	b=JZaQErz1ZZ4ya3KPusLaxgJ1blacD3KaExkOf2H9zhZM5hHGGqULyyKXi/pWim+D4s0j
	 uoFreA76TZdu0eaQ+oT5ATW4Hmv35hmAU7aQhog4b6jIsNOLmbKcwYbT9Ao50Y/cqPYd0
	 k3nBQRG8f7R68/CGdC7OFxvX0sIAjqLqBWEWqLzhbAoGL3tSBL99eVPu8zDI0MC79k4sb
	 XKzKrcxrBqPCpDSGAbXSbBBRSgue8G+iyD8tfQiqsbuoGa9tu1tCrVt0SxBcBqH2u/NEk
	 i2G3Yin/LQ0NLz6lNAp2jkRqBfRucfUD3pwawMvTYLx62BPpe2omtgxFLH7l/kcqfHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="ef9Rc/Km";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=IEBIUCML;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E384F606A321
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 10:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E384F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ef9Rc/Km;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=IEBIUCML
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794479035; x=1826015035;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=A/7+ix34RHRVT+/rHs68F/3FFYvydr1wMuGRTpG7noE=;
  b=ef9Rc/KmKHVpN886zbuAGyjGbhnMA+GovsxZNWYWKaSed6mXw83xTHiB
   MHYYNsV2juC14cTjuCQzrL4yTfNLDV+oS5EUri3rmZjxkx7sn3WfqSC/l
   +HlbMs0YJjamEV0neSs5m2W47+0eByyPIcKY9ypSfwbiUkLuNgyAZlB5k
   +PmCDu3afGQcRRT9J+0IQin88OE2qUURb33oLcm4Brfz9mL0vKGWduPJk
   3oh+nn8SsSz5S017i/hiKXrnS8g8m2h4Ly4ZhCHfCI2wHE5KpgPftUzn9
   FdH+tTkEbPbXWQYIhgdPwdu7W8FDwHRaHAKNTldWFue9TLXbzY9SLHMoJ
   Q==;
X-CSE-ConnectionGUID: GyO+7X4RRU2u22P6aVOd2Q==
X-CSE-MsgGUID: 89FNrvEHQSuPk/UYPpFAlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3169125"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3169125"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 02:23:54 -0800
X-CSE-ConnectionGUID: p5UnSVzIRyuKssRuQec0MA==
X-CSE-MsgGUID: rY0T/N7QRz+uFVzMEA/pvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10390170"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 02:23:54 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 02:23:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 02:23:53 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 02:23:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9E2h/1Y0OqozOg7iaYU5vXMRyKQlbTBkjubj5ODMHdez7JrPkSHSMB+UHiWIp3CpaQ3WoyPdZcxrvmp/j0yLOaqtlabne1ez5Xr3co3D81pxR2zA+X4Fj1XeZCK9Qrh7HTFsQf4vURWWdba477x2jbQvDrAKQ1ZqUp4bpqk6+gislhPuZewskuE0gRNBR3mJRK1/Qj30N9qyHHKsmkl2kX6mJAhNICuEuNv9fAb/eN4sAj8rsb0recGpA46htvA75taLgrlgiux+6yS7fdc/2FdrwS/5i+ZjrX2pdTVJCDEuZAyhMXWtqMGo02TWHI9l22rmqzafOxQ0pDH8o0XQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/7+ix34RHRVT+/rHs68F/3FFYvydr1wMuGRTpG7noE=;
 b=ocyXA2ftNSi/Dt1CoIvNJ4Av6M2hsgckfieoVAj2F/GZfd0eo3J5/JgvMgAPuV6zHoZVhG+cHNnFrYoypd6qIPBoO3loYMv3zQLF3EmpgHj/XXX1uXNtr301U+BeECmO082b5jHGoXkugX6/FXiuqWYuwLKXRexpHS1QWCb9sTVCXqXPK0FUXI5hlprkdnKIX95dPUu7w6Y8NxSJQQW7nq07my1iTiyLecFpAoJP44VBVDibPCW/b42SJvL+tIOu/+kZyFKVDkAv3JzPI5399a5gslDAI+Ngc7nXhIXnclYGf/6qIYcGLRzAkxRXKCfzQ2liCzBk3wsMkTy2MY6LjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/7+ix34RHRVT+/rHs68F/3FFYvydr1wMuGRTpG7noE=;
 b=IEBIUCMLBNaPzBIe6g4Wy+kLqHutoGDMTqetJ3h1nj1CN9YkQ3YFELGo+bpFjIens4UiILJUYcQ3db3wC7esjXT8cqRZt3XR+waezszm7HnGSFtK681EQU/xiwvsUYFKTES9nN4DLxPTkDBgbg4ZGpFUMPYvq1mstZYqsfRSzsk=
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by LV0PR11MB124863.namprd11.prod.outlook.com (2603:10b6:408:3fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 10:23:51 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%3]) with mapi id 15.21.0592.010; Thu, 12 Nov 2026
 10:23:50 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "Bard
 Liao" <yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: RE: [PATCH v2 5/5] soundwire: stream: Fix bandwidth leak in
 multi-link aggregation failure
Thread-Topic: [PATCH v2 5/5] soundwire: stream: Fix bandwidth leak in
 multi-link aggregation failure
Thread-Index: AQHdcnZ3/zsXTt8rREueZVG30jQAZ7cqDGYAgAAoqtA=
Date: Thu, 12 Nov 2026 10:23:50 +0000
Message-ID: <SJ2PR11MB842468781767052BF0B7821EFF702@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20261112072105.1296515-1-yung-chuan.liao@linux.intel.com>
 <20261112072105.1296515-6-yung-chuan.liao@linux.intel.com>
 <sashiko-outbox-210619@kernel.org>
In-Reply-To: <sashiko-outbox-210619@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|LV0PR11MB124863:EE_
x-ms-office365-filtering-correlation-id: 243255c7-c88d-4129-fa01-08df40a70b66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223327099003|261009223027099003|261009221227099003|261009220027099003|261009221727099003|3023799007|11063799006|4143699003|56012099006|10067099003|261028144727099003|261026140227099003|261026135527099003|261021135927099003|261021133027099003|261102123227099003|261022075727099003|261022113327099003|261026121527099003|261021121427099003|261022105027099003|261022115727099003|261021130227099003|261021123027099003|261026130827099003|38070700021;
x-microsoft-antispam-message-info: GiWJeGaupU/yscXggw98Pxr8J16y7sSJXWC3nd7bSWLeOV9FJ+PUB1DlTUYISgXPBGH599MIOf/YYKLlnTn9bUccQoTfhRqXovggGOaw52q/mUipIfbnQkCDDT3NPC6fQ6cZe93F3bare3+i5PU9Q2eBminmqw9qMvqmjWr5NFtwK3rSG8ri0HQLjSnAOtt9tTeLWk9fT2xMba9WuIEX66uLdnjUUA1aGbhD3Xskh6jPsf91F5viod8bJtcu1G127NyRXJCEGV6wU6gKLrKkPqpnb3rTSgqtWNsknbj/S5u0VExwHC7JG1mTIdR5MQCli13ESt9lmg+kAXvlCtxUTqWBps27zV8gNbiYknhZ+LudzjOUTs/hOvHjHS8Q5SwdUEtG+ZmvEKFYno+2Adc7Z2MZH76i92SUUOjSW/k+BpzGNf+9SN27T5azVJ5VHcwfEsLZdZeVgW96Opb8RdW/fQdCwscDwdr5WEW8WvX1PBr68fc086gTgBqNNSruVz3ayV+lUUntC1lNTTdtAzmoct+Ro8MaGrzPH5VrW8LAkCDxNZUMjm5dSGrjKDqiE6JWab/GK/GqsX6lOLyOStUcPOJR8+u3LhpMwmW4MS/TSAgIDvPpuFpPArndRXGilPfPJhmUMxUTYjGh4GYzaQd8id1uhdI+vS+cfv0bpdNIrXw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223327099003)(261009223027099003)(261009221227099003)(261009220027099003)(261009221727099003)(3023799007)(11063799006)(4143699003)(56012099006)(10067099003)(261028144727099003)(261026140227099003)(261026135527099003)(261021135927099003)(261021133027099003)(261102123227099003)(261022075727099003)(261022113327099003)(261026121527099003)(261021121427099003)(261022105027099003)(261022115727099003)(261021130227099003)(261021123027099003)(261026130827099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVdrZGs4SGxhZGsyK0hnTDFoZ1l0SUp3aFZCZDc5eXc5aFVlWmZZOWhXcUtp?=
 =?utf-8?B?Z1RtbnRNYTRLTHV3dlNINXdtdDM3alZwaGdPMHY1Yk5xMFNxQ0hYSWFIUU5Q?=
 =?utf-8?B?L1B5THNMeEF1dkJUNmZJQkNzUGtlRWZlVXBieHVoZCtVbktBYllJR2hROU91?=
 =?utf-8?B?YTBtT1REUld0L3A5RlJoNXprTXp1YklPMUNWQ1RGWnhSYmMyYVNiRE1qSTJz?=
 =?utf-8?B?dTh4bVJjSGY2UFdRMTFLK1dQb0I4SDU1bFZ0OXJFRTgvL2ZXMzluTm1ZVEpR?=
 =?utf-8?B?WmV5a1p1RUZRYUxBNVFjaG9EdkdNazRpZS9wZ3pLMVNiUUk4MmZScDQyZXMx?=
 =?utf-8?B?Rmo3QjF1RlY1SldudUtxL05NMDNJZzBmQ2ZCV21vaU1tRDFhbisvUGVNYnJT?=
 =?utf-8?B?dk1hamJEbVB5WFc5N0xHbkI3Qy9OaWtKTnpWamsveTMwZjlEckZrMGR3UjYv?=
 =?utf-8?B?QmhtYXl2cjRpUmJvNU1oRDVCZ1Z5SGlKQjJNTEhLYXorYnNWN2tOTHZ4cFV5?=
 =?utf-8?B?NjFVOHBjYjdZSjFGaFVkU3RWajQ0OGpCdWFQR1BZbVArT1F4cG1pdkdtRTdv?=
 =?utf-8?B?c1BiU0xyTktMaGhKZnRUSE82cFR0TFdzNTg0T1o4MDArc29JUFBqYVlUMDBX?=
 =?utf-8?B?Mnh4dzA3QkZ6UVZqbm9mZVl0RXhvM2VDb21rU0hLQUtqV1dJaWE3aFJ5c25v?=
 =?utf-8?B?TG5zQkZkbUtPeDhlUUFMMGs2dzQ4ZVhuMEJFd1czQkhRSUd3cWU5S2JabVNX?=
 =?utf-8?B?bmFrdThTeXJJN2NPVkVBWHRQNWFLQXZwVUxoRUJic3FLSThNRXg2UWNNNkNS?=
 =?utf-8?B?SDY4dHFFakgwYnJZalExeWw1K09Wb0dlbG5oU04rSkFKNEdpNXNoYjFPbHo5?=
 =?utf-8?B?elF3ejk0Um0wNEJScE8xQmd5bzhsM2ZzcmhTbkJiSnU1dXRpVjRKdFcrMERn?=
 =?utf-8?B?TVhMYmprdTRHTFFMYW9TQU85RUxhZTBNdWd3WDlNZkRIVjVHdzgzNjAvK2dS?=
 =?utf-8?B?WU9jQXlENjF1N3NwYWl2T21JeW90L3A0MjUyTENHZU1LMUFxUUMrcndNUkdP?=
 =?utf-8?B?RlFwTjN0Ui9xa3J6czRWTFN4L0ZLZExlRlZnZHNrN1VIemJvekFkeEVvL3Fu?=
 =?utf-8?B?VmhhYmpMWTZsa1dST0wzT1Q5YUxscTB0azlpc0FaRmx1TEE5bEZEN05rbXFS?=
 =?utf-8?B?SU1OekcxNjR1TkNEWGJKTFpIUEhKNDcyK09iRDBoZ2FkZVRaem8xK041WlVt?=
 =?utf-8?B?Z2xBOFJVeW5xUCtzckdNYjZHSkxNUVRwSjQ5aVp2N1BmRVNGU1VIdERWcHQz?=
 =?utf-8?B?MFR3cXhqS3dtbVFybmFtMnAwanZPRlBURUVDelpvQnQ5WklvZ1BVUzNBNTNV?=
 =?utf-8?B?OEFXVXYwY3VBMHQxR2ZqOWZ6QmxGZi9HRWYyMkM1dUdrdktMTDlpeDNVN0xC?=
 =?utf-8?B?RWxhVUs1TlJtdGtuM1JiZ1BoMXlyVThYTmMyZ0xLU1RuK3JobUdzNS9KU29k?=
 =?utf-8?B?TzVpeCtPa3ZnaXpObnJHdzUxWnlpT05pd1FMUkhrR3d2bHR3OFhMaGNMWUJT?=
 =?utf-8?B?dU84UjVHalJWbVpzS1RjUit1N3RURC9CcmV2Zjc2RHgxeFB4RS8wYzNoSE02?=
 =?utf-8?B?TXhNcEFXeGxXV3RkM3NBZTlQMkJ5OVMya3hEUStnVnk2MTdYa0tmeGYwRG9z?=
 =?utf-8?B?Y01IRlJzaTNKOXU0elQrc1cxcVhIajNUZ3ZYcEFpWFd1S3plUHBMeWxKcVVX?=
 =?utf-8?B?RitTL3M0UGlEaVpNeG05L3ZIQXlNbmY1UW9CcUFQbCt4ekZzR3FLMk1mUngr?=
 =?utf-8?B?VERZazB2QWdxZWVsWjBPSmpndEROTHBKZTA0bG9DRnNMSHhmZXpQL21jaXVZ?=
 =?utf-8?B?R3duOWdvNzRReGNBNXhGMkRKN3NkWGwvOVJ1Uk5hOE9IOWF1bnQxUzZiUTNr?=
 =?utf-8?B?NDdzamxGTDJBR3JWZVVydmFzZ1dPZm9GRGh2Ynp2YlNJVXlmMGIrb0ZIYjUv?=
 =?utf-8?B?Q1A0TGFsUVhQWHh2QmVWanRyV3FHbXVab1dNRllFTXlnamZvZDB6d0kwMWF6?=
 =?utf-8?B?SGJvVU1KK01keklWOTRQaEpWck8wWWJkc0JiYURmVDFQbTQ4N3QyVkxJTmhN?=
 =?utf-8?B?aTJnRDY4YWUxdmJadzhCWFJlaVdaNDk0K0hzd1FHY0t4QnRnKzRDQzQ0VzQ0?=
 =?utf-8?B?SEZJZnNYckVTdm92bHhMKzdTUXYvUUt2cEt0SUM2cmFJVlNDaWs3TW1rZTNV?=
 =?utf-8?B?NjVseS9kWkZEejJWclhMbEZTM1dFY1BUZE9oaFJwSnJLMnFQZlZsMjZIRDFx?=
 =?utf-8?Q?XYskYXk7rM6laf2LK3?=
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
X-Exchange-RoutingPolicyChecked: E11PtZtKJZQhGx5DtFiQeFDrdqlrN2DG/REDHEmsik4kSKE1ettDUqXrNHOci0Xm94KRLvByoRGIaxpe+vqqW/fju1k9Upbn8e9SsR8s2hDjg5M0in88BY/dena8H1/9YeB2VUmBC2cUE1aecOiGZNn5DZ+Iskxz+n1W3VQTWkzIzjZU9A8/DlBhD0bhZZNF5SzwttH5D8yPTOjloyby2LYyiUM1nkJ4bYPZkw8tE0T20uOBdGo7rLyfENVUDoZHgjNsEALlmu+VmcL3TvcZoGbNjElEPwHFewWiTZTT0R6rzW0zylXQGNNGwTcyjNFG3eV9WAIWMnYTjfgUga2i0A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 243255c7-c88d-4129-fa01-08df40a70b66
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 10:23:50.4404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LfLyP5S6YWpZPxxYtVl4tyH/Te3aW9sidA18seggM65ir0kdzD7ikKPt7oM8tXqeII1eGWT5duE3dJjAb9octA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB124863
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE5vdmVt
YmVyIDEyLCAyMDI2IDM6MzcgUE0NCj4gVG86IEJhcmQgTGlhbyA8eXVuZy1jaHVhbi5saWFvQGxp
bnV4LmludGVsLmNvbT47IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyIDUvNV0gc291bmR3aXJlOiBzdHJlYW06IEZpeCBiYW5kd2lkdGggbGVhayBp
biBtdWx0aS1saW5rDQo+IGFnZ3JlZ2F0aW9uIGZhaWx1cmUNCj4gDQo+IFRoYW5rIHlvdSBmb3Ig
eW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDIgcG90ZW50aWFsDQo+
IGlzc3VlcyB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0gc291bmR3aXJlOiBpbmNvbXBsZXRlIHBv
cnQgbGFuZSBhbmQgdHJhbnNwb3J0IHJvbGxiYWNrIGluDQo+ICAgX3Nkd19wcmVwYXJlX3N0cmVh
bSgpDQo+IC0gW0hpZ2hdIHNvdW5kd2lyZTogc3RyZWFtOiBiYW5rIHN0YXRlIGRlc3luYyBpbiBf
c2R3X3ByZXBhcmVfc3RyZWFtKCkNCj4gICByb2xsYmFjaw0KPiAtLQ0KPiANCj4gY29tbWl0IGY3
NzQxNWRlYWRmNTI4NWQ4MmRhMjMxZDU4YjM2NTJhMmZmMjgwY2UNCj4gQXV0aG9yOiBEYXZpZCBM
aW4gPGRhdmlkLmxpbkBpbnRlbC5jb20+DQo+IA0KPiBzb3VuZHdpcmU6IHN0cmVhbTogRml4IGJh
bmR3aWR0aCBsZWFrIGluIG11bHRpLWxpbmsgYWdncmVnYXRpb24gZmFpbHVyZQ0KPiANCj4gVGhp
cyBjb21taXQgc25hcHNob3RzIGJ1cy0+cGFyYW1zIGludG8gbV9ydC0+cGFyYW1zX2JhY2t1cCBm
b3IgZWFjaCBtYXN0ZXINCj4gYmVmb3JlIHN0cmVhbSBwcmVwYXJhdGlvbiBhbmQgcmVzdG9yZXMg
dGhlbSBvbiBmYWlsdXJlLCB3aGlsZSBjbGVhcmluZw0KPiBwb3J0IGxhbmUgYXNzaWdubWVudHMg
aW4gc2R3X2NvbXB1dGVfYnVzX3BhcmFtcygpIHdoZW4gcHJlcGFyaW5nIG9uIGxhbmUgMC4NCj4g
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc291bmR3aXJlL2dlbmVyaWNfYmFuZHdpZHRoX2Fs
bG9jYXRpb24uYw0KPiBiL2RyaXZlcnMvc291bmR3aXJlL2dlbmVyaWNfYmFuZHdpZHRoX2FsbG9j
YXRpb24uYw0KPiA+IGluZGV4IDliYWNkZTJjNjdhMTEuLjIxNGExYmU2YzMzZTAgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9zb3VuZHdpcmUvZ2VuZXJpY19iYW5kd2lkdGhfYWxsb2NhdGlvbi5j
DQo+ID4gKysrIGIvZHJpdmVycy9zb3VuZHdpcmUvZ2VuZXJpY19iYW5kd2lkdGhfYWxsb2NhdGlv
bi5jDQo+ID4gQEAgLTY1Niw2ICs2NTYsMjAgQEAgc3RhdGljIGludCBzZHdfY29tcHV0ZV9idXNf
cGFyYW1zKHN0cnVjdCBzZHdfYnVzDQo+ICpidXMsDQo+ID4gIAkJbGlzdF9mb3JfZWFjaF9lbnRy
eShtX3BfcnQsICZtX3J0LT5wb3J0X2xpc3QsIHBvcnRfbm9kZSkgew0KPiA+ICAJCQltX3BfcnQt
PmxhbmUgPSBtX2xhbmU7DQo+ID4gIAkJfQ0KPiA+ICsJfSBlbHNlIGlmIChwcmVwYXJlKSB7DQo+
ID4gKwkJLyogQ2xlYXIgc3RhbGUgbGFuZSBhc3NpZ25tZW50cyB3aGVuIHByZXBhcmluZyBvbiBs
YW5lIDAuICovDQo+ID4gKwkJbGlzdF9mb3JfZWFjaF9lbnRyeShtX3J0LCAmYnVzLT5tX3J0X2xp
c3QsIGJ1c19ub2RlKSB7DQo+ID4gKwkJCWlmIChtX3J0LT5zdHJlYW0gIT0gc3RyZWFtKQ0KPiA+
ICsJCQkJY29udGludWU7DQo+ID4gKw0KPiA+ICsJCQlsaXN0X2Zvcl9lYWNoX2VudHJ5KG1fcF9y
dCwgJm1fcnQtPnBvcnRfbGlzdCwNCj4gcG9ydF9ub2RlKQ0KPiA+ICsJCQkJbV9wX3J0LT5sYW5l
ID0gMDsNCj4gPiArDQo+ID4gKwkJCWxpc3RfZm9yX2VhY2hfZW50cnkoc19ydCwgJm1fcnQtPnNs
YXZlX3J0X2xpc3QsDQo+IG1fcnRfbm9kZSkNCj4gPiArCQkJCWxpc3RfZm9yX2VhY2hfZW50cnko
c19wX3J0LCAmc19ydC0+cG9ydF9saXN0LA0KPiBwb3J0X25vZGUpDQo+ID4gKwkJCQkJc19wX3J0
LT5sYW5lID0gMDsNCj4gPiArCQkJYnJlYWs7DQo+ID4gKwkJfQ0KPiA+ICAJfQ0KPiANCj4gW1Nl
dmVyaXR5OiBIaWdoXQ0KPiBEb2VzIGNsZWFyaW5nIG1fcF9ydC0+bGFuZSBhbmQgc19wX3J0LT5s
YW5lIG9ubHkgZm9yIHRoZSBzdHJlYW0gY3VycmVudGx5DQo+IGJlaW5nIHByZXBhcmVkIGxlYXZl
IHN0YWxlIG5vbi16ZXJvIGxhbmVzIG9uIGEgcm9sbGVkLWJhY2sgc3RyZWFtIHdoZW4NCj4gYW5v
dGhlciBzdHJlYW0gb24gdGhlIHNhbWUgYnVzIGlzIGxhdGVyIHByZXBhcmVkIG9yIGRlcHJlcGFy
ZWQ/DQo+IA0KPiBXaGVuIF9zZHdfcHJlcGFyZV9zdHJlYW0oKSBmYWlscyBvbiBhIGxhdGVyIGxp
bmsgYWZ0ZXIgYnVzLT5jb21wdXRlX3BhcmFtcygpDQo+IGhhcyBzZWxlY3RlZCBtX2xhbmUgPiAw
IGFuZCByZWNvbXB1dGVkIHBvcnQgdHJhbnNwb3J0IHBhcmFtZXRlcnMgb24gYW4NCj4gZWFybGll
ciBsaW5rLCByZXN0b3JlX3BhcmFtcyByZXZlcnRzIGJ1cy0+cGFyYW1zIChpbmNsdWRpbmcNCj4g
bGFuZV91c2VkX2JhbmR3aWR0aFtdIGFuZCBjdXJyX2RyX2ZyZXEpIHdoaWxlIHRoZSBmYWlsZWQg
c3RyZWFtIHJlbWFpbnMgaW4NCj4gU0RXX1NUUkVBTV9DT05GSUdVUkVEIHdpdGggaXRzIG5vbi16
ZXJvIGxhbmUgYXNzaWdubWVudHMuICBJZiBhIHNlY29uZA0KPiBzdHJlYW0gb24gdGhhdCBidXMg
aXMgdGhlbiBwcmVwYXJlZCBvciBkZXByZXBhcmVkIGJlZm9yZSB0aGUgZmFpbGVkIHN0cmVhbQ0K
PiBpcyByZS1wcmVwYXJlZCBvbiBsYW5lIDAsIHNkd19jb21wdXRlX2dyb3VwX3BhcmFtcygpIGV4
Y2x1ZGVzIHRoZQ0KPiBTRFdfU1RSRUFNX0NPTkZJR1VSRUQgc3RyZWFtIGZyb20gcGF5bG9hZF9i
dyBhbmQgaHdpZHRoLCBidXQNCj4gX3Nkd19jb21wdXRlX3BvcnRfcGFyYW1zKCkgc3RpbGwgaW5j
bHVkZXMgaXQ6DQo+IA0KPiBkcml2ZXJzL3NvdW5kd2lyZS9nZW5lcmljX2JhbmR3aWR0aF9hbGxv
Y2F0aW9uLmM6X3Nkd19jb21wdXRlX3BvcnRfcGFyYW1zDQo+ICgpIHsNCj4gICAgIC4uLg0KPiAJ
CQkJaWYgKCEocHJlcGFyZSAmJiBtX3J0LT5zdHJlYW0gPT0gc3RyZWFtKSAmJg0KPiAJCQkJICAg
IChtX3J0LT5zdHJlYW0tPnN0YXRlID4NCj4gU0RXX1NUUkVBTV9ESVNBQkxFRCB8fA0KPiAJCQkJ
ICAgICBtX3J0LT5zdHJlYW0tPnN0YXRlIDwNCj4gU0RXX1NUUkVBTV9DT05GSUdVUkVEKSkNCj4g
CQkJCQljb250aW51ZTsNCj4gCQkJCXNkd19jb21wdXRlX21hc3Rlcl9wb3J0cyhtX3J0LCAmcGFy
YW1zW2ldLA0KPiAmcG9ydF9ibywgaHN0b3ApOw0KPiAgICAgLi4uDQo+IH0NCj4gDQo+IFdoZW4g
YW4gYWN0aXZlIHN0cmVhbSB1c2VzIHRoYXQgc2FtZSBub24temVybyBsYW5lIGFuZCBzYW1wbGUg
cmF0ZSwNCj4gc2R3X2NvbXB1dGVfbWFzdGVyX3BvcnRzKCkgbWF0Y2hlcyB0aGUgZmFpbGVkIHN0
cmVhbSdzIHN0YWxlIHBfcnQtPmxhbmUgYW5kDQo+IGFkdmFuY2VzIHBvcnRfYm8gd2l0aG91dCBh
bGxvY2F0ZWQgaHdpZHRoLCBzaGlmdGluZyBhY3RpdmUgc3RyZWFtcycgdHJhbnNwb3J0DQo+IGJs
b2NrIG9mZnNldHMgb3V0IG9mIGJvdW5kcy4NCg0KSSB3aWxsIGZpeCB0aGlzIGluIHYzLiBUaGUg
bGFuZXMgb2YgdGhlIHN0cmVhbSB3aWxsIGJlIHJlc2V0IHRvIDAgaW4gdGhlDQpyb2xsYmFjayBw
YXRoLCBzbyB0aGV5IG1hdGNoIHRoZSByZXN0b3JlZCBsYW5lX3VzZWRfYmFuZHdpZHRoIGFuZCBh
cmUgbm8NCmxvbmdlciBwaWNrZWQgdXAgYnkgdGhlIHBvcnQgY29tcHV0YXRpb24gb2Ygb3RoZXIg
c3RyZWFtcyBvbiB0aGUgc2FtZSBidXMuDQpUaGUgcmVzZXQgd2lsbCBiZSBza2lwcGVkIHdoZW4g
dXBkYXRlX3BhcmFtcyBpcyBmYWxzZSwgc2luY2UgdGhlIGxhbmVzIGFyZQ0Kc3RpbGwgdmFsaWQg
aW4gdGhhdCBjYXNlLg0KDQo+IA0KPiBJbiBhZGRpdGlvbiwgYnVzLT5jb21wdXRlX3BhcmFtcygp
IG9uIHRoZSBwcmVjZWRpbmcgbGluayBoYXMgYWxyZWFkeSB1cGRhdGVkDQo+IG1zdHJfcHJvcC0+
ZGVmYXVsdF9jb2wgYW5kIHJlY29tcHV0ZWQgcF9ydC0+dHJhbnNwb3J0X3BhcmFtcyBhbmQNCj4g
cF9ydC0+cG9ydF9wYXJhbXMgYWNyb3NzIGV4aXN0aW5nIHN0cmVhbXMgb24gdGhhdCBidXM7IGlm
IGFuIGFscmVhZHkNCj4gUFJFUEFSRUQgb3IgRElTQUJMRUQgc3RyZWFtIG9uIHRoYXQgbGluayBp
cyBsYXRlciBlbmFibGVkIG9yIGRpc2FibGVkLA0KPiBzZHdfcHJvZ3JhbV9wYXJhbXMoYnVzLCBm
YWxzZSkgcHJvZ3JhbXMgdGhvc2UgdW4tcmV2ZXJ0ZWQgdHJhbnNwb3J0DQo+IHBhcmFtZXRlcnMg
aW50byBoYXJkd2FyZSB3aXRob3V0IHJlY29tcHV0aW5nIHRoZW0gZm9yIHRoZSByZXN0b3JlZA0K
PiBidXMtPnBhcmFtcy4NCg0KVGhpcyBpcyBhbiBleGlzdGluZyBpc3N1ZSBhbmQgbm90IGludHJv
ZHVjZWQgYnkgdGhpcyBwYXRjaC4NCg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb3Vu
ZHdpcmUvc3RyZWFtLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9zdHJlYW0uYw0KPiA+IGluZGV4IDA2
ZjA1MWYwM2EyMTguLjdjNzQ4YmE4NDc2NzIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9zb3Vu
ZHdpcmUvc3RyZWFtLmMNCj4gPiArKysgYi9kcml2ZXJzL3NvdW5kd2lyZS9zdHJlYW0uYw0KPiA+
IEBAIC0xNDc5LDE5ICsxNDc5LDIyIEBAIHN0YXRpYyBpbnQgX3Nkd19wcmVwYXJlX3N0cmVhbShz
dHJ1Y3QNCj4gc2R3X3N0cmVhbV9ydW50aW1lICpzdHJlYW0sDQo+ID4gIAlzdHJ1Y3Qgc2R3X21h
c3Rlcl9ydW50aW1lICptX3J0Ow0KPiA+ICAJc3RydWN0IHNkd19idXMgKmJ1czsNCj4gPiAgCXN0
cnVjdCBzZHdfbWFzdGVyX3Byb3AgKnByb3A7DQo+ID4gLQlzdHJ1Y3Qgc2R3X2J1c19wYXJhbXMg
cGFyYW1zOw0KPiA+ICAJaW50IHJldDsNCj4gPg0KPiA+ICsJLyogUHJlLXBhc3M6IHNuYXBzaG90
IG9yaWdpbmFsIGJ1cyBwYXJhbWV0ZXJzIGZvciBhbGwgbWFzdGVycyAqLw0KPiA+ICsJbGlzdF9m
b3JfZWFjaF9lbnRyeShtX3J0LCAmc3RyZWFtLT5tYXN0ZXJfbGlzdCwgc3RyZWFtX25vZGUpDQo+
ID4gKwkJbV9ydC0+cGFyYW1zX2JhY2t1cCA9IG1fcnQtPmJ1cy0+cGFyYW1zOw0KPiA+ICsNCj4g
PiAgCS8qIFByZXBhcmUgIE1hc3RlcihzKSBhbmQgU2xhdmUocykgcG9ydChzKSBhc3NvY2lhdGVk
IHdpdGggc3RyZWFtICovDQo+ID4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KG1fcnQsICZzdHJlYW0t
Pm1hc3Rlcl9saXN0LCBzdHJlYW1fbm9kZSkgew0KPiA+ICAJCWJ1cyA9IG1fcnQtPmJ1czsNCj4g
PiAgCQlwcm9wID0gJmJ1cy0+cHJvcDsNCj4gPiAtCQltZW1jcHkoJnBhcmFtcywgJmJ1cy0+cGFy
YW1zLCBzaXplb2YocGFyYW1zKSk7DQo+ID4NCj4gPiAgCQkvKiBUT0RPOiBTdXBwb3J0IEFzeW5j
aHJvbm91cyBtb2RlICovDQo+ID4gIAkJaWYgKChwcm9wLT5tYXhfY2xrX2ZyZXEgJSBzdHJlYW0t
PnBhcmFtcy5yYXRlKSAhPSAwKSB7DQo+ID4gIAkJCWRldl9lcnIoYnVzLT5kZXYsICJBc3luYyBt
b2RlIG5vdCBzdXBwb3J0ZWRcbiIpOw0KPiA+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArCQkJ
cmV0ID0gLUVJTlZBTDsNCj4gPiArCQkJZ290byByZXN0b3JlX3BhcmFtczsNCj4gPiAgCQl9DQo+
ID4NCj4gPiAgCQlpZiAodXBkYXRlX3BhcmFtcykgew0KPiA+IEBAIC0xNTQyLDcgKzE1NDUsMTMg
QEAgc3RhdGljIGludCBfc2R3X3ByZXBhcmVfc3RyZWFtKHN0cnVjdA0KPiBzZHdfc3RyZWFtX3J1
bnRpbWUgKnN0cmVhbSwNCj4gPiAgCXJldHVybiByZXQ7DQo+ID4NCj4gPiAgcmVzdG9yZV9wYXJh
bXM6DQo+ID4gLQltZW1jcHkoJmJ1cy0+cGFyYW1zLCAmcGFyYW1zLCBzaXplb2YocGFyYW1zKSk7
DQo+ID4gKwkvKg0KPiA+ICsJICogUmV2ZXJ0IGFsbCBtYXN0ZXJzIHRvIHRoZWlyIHNuYXBzaG90
dGVkIG9yaWdpbmFsIHBhcmFtZXRlcnMuDQo+ID4gKwkgKiBBbnkgbWFzdGVyIHRoYXQgd2FzIG5v
dCBtb2RpZmllZCB3aWxsIHNhZmVseSByZXZlcnQgdG8gaXRzIG93biBvcmlnaW5hbA0KPiBzdGF0
ZS4NCj4gPiArCSAqLw0KPiA+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShtX3J0LCAmc3RyZWFtLT5t
YXN0ZXJfbGlzdCwgc3RyZWFtX25vZGUpDQo+ID4gKwkJbV9ydC0+YnVzLT5wYXJhbXMgPSBtX3J0
LT5wYXJhbXNfYmFja3VwOw0KPiA+ICsNCj4gPiAgCXJldHVybiByZXQ7DQo+ID4gIH0NCj4gDQo+
IFtTZXZlcml0eTogSGlnaF0NCj4gQ2FuIHJlc3RvcmluZyBtX3J0LT5wYXJhbXNfYmFja3VwIGFj
cm9zcyBhbGwgbWFzdGVycyBkZXN5bmNocm9uaXplDQo+IGJ1cy0+cGFyYW1zLmN1cnJfYmFuayBh
bmQgYnVzLT5wYXJhbXMubmV4dF9iYW5rIGZyb20gaGFyZHdhcmUgd2hlbg0KPiBfc2R3X3ByZXBh
cmVfc3RyZWFtKCkgZmFpbHMgZHVyaW5nIG9yIGFmdGVyIGRvX2Jhbmtfc3dpdGNoKCk/DQoNCkkg
d2lsbCBwcmVzZXJ2ZSBjdXJyX2JhbmsgYW5kIG5leHRfYmFuayB3aGVuIHJlc3RvcmluZyB0aGUg
c25hcHNob3QgaW4gdjMsDQpzbyB0aGV5IHN0YXkgY29uc2lzdGVudCB3aXRoIHRoZSBoYXJkd2Fy
ZSBpZiB0aGUgZmFpbHVyZSBoYXBwZW5zIGFmdGVyIHRoZQ0KYmFuayBzd2l0Y2guDQoNCj4gDQo+
IG1fcnQtPnBhcmFtc19iYWNrdXAgc25hcHNob3RzIGN1cnJfYmFuayBhbmQgbmV4dF9iYW5rIGJl
Zm9yZQ0KPiBkb19iYW5rX3N3aXRjaCgpIHN3aXRjaGVzIHRoZSBhY3RpdmUgcmVnaXN0ZXIgYmFu
ayBpbiBoYXJkd2FyZSBhbmQgaW52ZXJ0cw0KPiB0aG9zZSBmaWVsZHMuICBJZiBzZHdfcHJlcF9k
ZXByZXBfcG9ydHMobV9ydCwgdHJ1ZSkgc3Vic2VxdWVudGx5IGZhaWxzIG9uDQo+IGFueSBtYXN0
ZXIgKG9yIGlmIGRvX2Jhbmtfc3dpdGNoKCkgZmFpbHMgYWZ0ZXIgYW4gZWFybGllciBtYXN0ZXIg
aW4NCj4gc3RyZWFtLT5tYXN0ZXJfbGlzdCBoYXMgYWxyZWFkeSBzd2l0Y2hlZCBiYW5rcyksIGp1
bXBpbmcgdG8gcmVzdG9yZV9wYXJhbXMNCj4gb3ZlcndyaXRlcyBjdXJyX2JhbmsgYW5kIG5leHRf
YmFuayBvbiBldmVyeSBtYXN0ZXIgd2l0aCB0aGVpciBwcmUtc3dpdGNoDQo+IHZhbHVlcyBhbmQg
bGVhdmVzIHBvcnRzIHByZXBhcmVkIG9uIGVhcmxpZXIgbWFzdGVycyBpbiB0aGUgbG9vcCB3aXRo
b3V0DQo+IGRlcHJlcGFyaW5nIHRoZW0uICBMYXRlciBzdHJlYW0gb3BlcmF0aW9ucyBvbiB0aG9z
ZSBidXNlcyB3aWxsIHRoZW4gcHJvZ3JhbQ0KPiBiYW5rZWQgcmVnaXN0ZXJzIGludG8gdGhlIGN1
cnJlbnRseSBhY3RpdmUgaGFyZHdhcmUgYmFuayBhbmQgYXR0ZW1wdCB0bw0KPiBzd2l0Y2ggdG8g
dGhlIGJhbmsgYWxyZWFkeSBpbiB1c2UuDQoNClRoZSBwb3J0cyB0aGF0IHdlcmUgYWxyZWFkeSBw
cmVwYXJlZCBvbiBlYXJsaWVyIG1hc3RlcnMgYXJlIG5vdCBkZXByZXBhcmVkDQp3aGVuIHNkd19w
cmVwX2RlcHJlcF9wb3J0cygpIGZhaWxzLiBUaGlzIGlzIHRoZSBleGlzdGluZyBiZWhhdmlvciBv
Zg0KX3Nkd19wcmVwYXJlX3N0cmVhbSgpLCB3aGljaCBvbmx5IHJlc3RvcmVzIGJ1cy0+cGFyYW1z
IGluIHRoZSBlcnJvciBwYXRoLA0KYW5kIGl0IGlzIG5vdCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0
Y2guDQoNCj4gDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MTExMjA3MjEwNS4xMjk2NTE1LTEtDQo+IHl1bmctY2h1YW4ubGlh
b0BsaW51eC5pbnRlbC5jb20/cGFydD01DQoNCg==
