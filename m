Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794846936;
	b=yEkZsC38xg6aZxQOYyGDvqI0cotYuiea/m91SohghopU4+fY30SFVWCOfrNO+e31P7Cx
	 g6WjK7pIrop/asCfp1V/xh3WJh70ls4d9D1EN8LO9M9QsLYPdjwIF978hqIFTHPyQUlDC
	 MLMsAtU3GqKJbsseF7F9x8snQ8uxbycBMZmZ/YX1ion9X+2pm1nObEu7jHCsvs6HK+uLE
	 Bi8cA48jAPLRd3SJsJPjGch8zQsMjNPaHZuwOPPK1RCsvOzLbYQLHQ/qtO57N96IySQ8v
	 aWuFH23iq48kzz9aU/zfM5BXEOM+u1jdiQ/KHvK+imEHCfZbv+mIEs1gHLIn9+Rf2Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846936;
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
	bh=XvkTjpnoYVYE6mDrlCO/6iS/wb1YuKyOon3hoG2K8XY=;
	b=FOFaRAJmIAXnGdWcqAmNmwjyc5OCkVf26acJajgPZ1d1uo6b/nQsrI29V7W7gqYMH6Bj
	 i+LtZ8A+e0/fwgHrQei2OBU8ELF1yi6+cKMqzDEDZ5I/0mni9zpNFdlX/Rf4z0G9DU7Rx
	 fOXMt8zpwSxwJMBdUBSOeHZYv0HQ+eTSdTskFHPmVtGfTUYGomeH3KVH/tcBJy9IIcTAd
	 FvkP/5qPLtI9hzoVqydHTKe9jiyUrNqLEfAjTp/1I6mpDdynWCmovvGS7a1J2fMxGmu16
	 FJo21NKqZPCVaoStEAgme5RvWF2HmF4nQl6FxjQrOXbeji0zv8TLNs3gE7wZSOmJHlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FLZujsGu;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=S4qjH81o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6492606A323
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 16:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6492606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FLZujsGu;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=S4qjH81o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794846936; x=1826382936;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XvkTjpnoYVYE6mDrlCO/6iS/wb1YuKyOon3hoG2K8XY=;
  b=FLZujsGuIaFI1oWZ5oN/8xI8wsxq/n2QKhvf9mTr1xnbAyf0lohW8oIM
   9ZPrONjoRQubaT08xBzi5LrL3++4Byti7fjc7sARI9PSe4GTX0uVF5X2m
   10jngbkVAUerBcilAx0vZ/GcIkWPF6JZI1o3tFQ3BcOb8xsj8IqXJKjiz
   ncL6qZwSJgyAx3XHagb/YyrajGUysaFh++liWqnehniAu1sm/XqQevooG
   ej2j2vA0KeVFHo8nUVxsrbSzKKaib4YSqYZHh0+VakpgdXO1NiRVi16eH
   fXkcV6agK/4YMnmElqSgePR+5d7LSENm5tFvlu0rAg0lUKEC2S5qSKzjw
   A==;
X-CSE-ConnectionGUID: +7JA8vI5SMyur+CTkqsLpQ==
X-CSE-MsgGUID: fdYEaQc8RaOMlg0fdsMC6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3696513"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3696513"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 08:35:35 -0800
X-CSE-ConnectionGUID: Fzzu8gaSS1C9B7ufOUVbxw==
X-CSE-MsgGUID: uCOPdMLoT2yOi6WcwoF9/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9715714"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 08:35:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 08:35:34 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 08:35:34 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 08:35:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTFRoKu8C2ro9VZfjDzBsFZPkfoqnsEzZcIeDUzlsWlbMRTHSMoxJ9F6EnyUhvvwNcAf+Sq14QP2Wa4ija6VP4AJUk1orWNdXAhqyDjHxQcjBZk38zMRETI1MaWV3qD7rGnskDI/6tEJlcuaIVSJaVhdxQSxtRj+TJgic+Dldy7c1mzgy7LSLFqWecFLTtIQGok/6D67soS8QRa2+DJbkdR0k+1jG/fb995pp8sc8gubRfqo57UsyJASYjqcUC17ZPB8M9acV5MkseBdUFO1drNZfNP5iVLwakzBpdfytltgmeAouxUGi1E756kKm8hSpkFAxKbWcEX2wU9I3meVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvkTjpnoYVYE6mDrlCO/6iS/wb1YuKyOon3hoG2K8XY=;
 b=RXvf6pKLJbYyGJqmvQ2Dgh7LKrwIwWyl5WxJTsQ0P+9WCbytFLSeL+S/kD6U0qnRwj3YGbMNKO7+vSkrgJ/iW8FgBCBIQiabM6mBWntJnVxcqWda/uayPb5V2H6UM37q/8WPebJAcUWH2/8Qa3Jl+e1CZ8J181xYa+kOlUSMKgL+Y8MyLU00SDzjKu3nLDIt+95qe1Ys2mWuWUDcI+5I2cAfonhtM31ip/2l2lrIXDRHrVyn837NN4snSxiJ+3C08jqdviI6NV1l1GX1mPnYDzilTE2cRehqfzlo6chE2FTzk59g3I0oO4MsDUgvhEIcwjem9i0k2q3JPx0W0foB3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvkTjpnoYVYE6mDrlCO/6iS/wb1YuKyOon3hoG2K8XY=;
 b=S4qjH81otfCly2DJ0gdev0ntsmPqYQFj49kZJcGztameCOUR50nX/ccmh7Cci6BqfxhAd3Yv4t3HKQQOaEnZPMxplZvZgEECyhqxCggEmuCvSjNfI0+Dby5C6+dB9aUXECRWFgePPeGAghGRKpjyggqBkZm+F2NWt5CK2FN2EZQ=
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by CY8PR11MB7946.namprd11.prod.outlook.com
 (2603:10b6:930:7e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 16:35:32 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 16:35:30 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v16 13/17] drm/xe/vsec: Support late bind fw information
Thread-Topic: [PATCH v16 13/17] drm/xe/vsec: Support late bind fw information
Thread-Index: AQHdddxd6p1eNlD/8UiHAfVtujb/Crcw1a4AgAANR6A=
Date: Mon, 16 Nov 2026 16:35:30 +0000
Message-ID: <CH3PR11MB04614940D6437A14195827EDC4C17C2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261116150649.368686-19-michael.j.ruhl@intel.com>
 <20261116150649.368686-32-michael.j.ruhl@intel.com>
 <sashiko-outbox-217312@kernel.org>
In-Reply-To: <sashiko-outbox-217312@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|CY8PR11MB7946:EE_
x-ms-office365-filtering-correlation-id: b67a91ce-b989-4680-4e19-08df43ffa124
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026135527099003|261026140227099003|261026130827099003|261026121527099003|261021121427099003|261021135927099003|261021130227099003|261021133027099003|261022113327099003|261022105027099003|261022075727099003|261022115727099003|261021123027099003|38070700021;
x-microsoft-antispam-message-info: vClTJFqZ0e7PLdEw8RYaMmvz98Rs6PZwCNWgbklOzVEzn1BJPORZNvVJXFM1oU6uFWBhDaFRKWQz5ZVvIXe8/cyEjBeZD7oemi37h55hOZPo0ixFRp98h+IhhINGPzYLoMgOGAWbOTb/PyMrsmmGoYBBV8Q0WZlUpD71GfqsaP1JtqH6DK/AXX1LfqCmpoKo1gLocANlp7x1wigomADvWZR3a95O+WVh3+9PDI+8b8Xm3pt16b71rqVieh/ddI8SDZyQN7hpXsiv2jGZfocecjYPoavKE2BW3xSyrziB1g5UHms/xqvy7SZgaLmkDnxuZKFtgQxnseUzhP6F3LcHprHOxp8oXIBmPf5XHiTrTcNNDuBczs+P96ldSoEc+zTv2Zri5mX2jkXudQxlJ3iqfz40sHzuV/uGTjex1Pay7X1zVCwyIIX56G2cz97p43GQmguBorKhYhUYJdWlOSFHFzak5J3oUkm3ajcz/LR9NHs/pNs6rtUGCbjn6TGZLD4/A59ZRwwV74xz7N2L2gKCo3dE0QQovNhzy1ZPN3jVrZcUKmtPiE/d88CB7inwhGbU3YWbxFpOQGn4v1OivBwdZN6Xf9rBTIs6IJwnSmdh46J6Y4KZ93jQs9INZ/4bSb8s0eBsJIHusjQ3tCExT6ozUitQuJZUSx6Wfui/K8ULUik=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026135527099003)(261026140227099003)(261026130827099003)(261026121527099003)(261021121427099003)(261021135927099003)(261021130227099003)(261021133027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261022115727099003)(261021123027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWFlVmhxQ1RxWGE2Q29pMERSNGxTRHZ2dzJXdWVyQWRhK0M2Wjc5OWtxZ3VJ?=
 =?utf-8?B?VU9iZ1BHejlUK2V6T1FYd2VvVWQxZGEydUNmdjNveWtsMm5zSUNCTlR2Rncz?=
 =?utf-8?B?NFdzbWRUUVJGN29QZ1dqR2dLQ0hEcXUzbUhKNXZnOVVoSGx0VmVpOWY5RFRy?=
 =?utf-8?B?Tzh1UHYxMjVIdmZoWkxJeFcvYVBHczZTRmQxMEE5Z2JJejVtUjM0UjlUVExJ?=
 =?utf-8?B?WFg1bXkyUWp3RTVMejdpNFQ3OFlHQU5CQTloTHV3T3NkbzNrcEpRN2lmaFFz?=
 =?utf-8?B?SGsvS3ZqMzJqUmNtZGF0NEhtOTRZV2RzT2NNVEN6VVdTQVI4REo0czRuTmdl?=
 =?utf-8?B?c21aNzc4NG8wYkxLaHJnUmU0a0JpQnN2dHY0VjlqK2lEWHBZQkVtY3lTa29K?=
 =?utf-8?B?cFRlblNDMnZyOERodzFBbU1KSDJzaGlHQ0duTlhYM3RaNko2WFM5ejZFMDd1?=
 =?utf-8?B?Mk5lL203ZnRHMi9RanJuUmljdklWZ09JZ0pYelZDRWtwUHRrWUNzQThVSmtx?=
 =?utf-8?B?QmVRQkZ5cGl4Y1NycUlBU3d5NUN3c0ZyaDJMNGh5YzcxSEVON0xMQm8rNmF6?=
 =?utf-8?B?a1o5bko1MHFCT1Z5aGRwLzNuUlpXUUUvdDAxQW55WHduSlRZZlZjTTZ2T0dI?=
 =?utf-8?B?cHF4WFJrdFJaNGtUc1B4bElXVll1TlpPZGZ6ZjIwRENuUWFaeEcrRVN4SUpC?=
 =?utf-8?B?cDltUEQ4OUdudWtlRS9wcFJtVldsaTVIalZ0bU04YTl4bng4NkROL2VQdytF?=
 =?utf-8?B?eUpTOW0vRFlkcFZsbklFRm5QV0U2amNiQ3NHTEM2aVZ0MjAwb1lpc0lYdjc1?=
 =?utf-8?B?N2hGZXpKakNOcVNISWJzSDRYWjlzai9NdFRoTzBvMmdVUDVmYUZkS29MRGs0?=
 =?utf-8?B?TTRJZWpZbDZUcHF4bGYzTXJzUGpGMUdZWllYMjQ2SWhzc1RkdUlHMFREZFZv?=
 =?utf-8?B?RjhJTkI2OHA0SGtwU0EzdklWZnBsaFhzRkZMQW1hcXRJY1VEa1MvZUFhS21z?=
 =?utf-8?B?U0dDY2tuS3A2OExCNmxDZHo5L0FxWlBZVTVPZmlzaG5yendQUzlHMjAzUUcz?=
 =?utf-8?B?bEthU0Q5eTdnT3RaRU94V0NtVzNJZUQ3c1J6bTNFR2NuV20vcXhBSm1sWkdm?=
 =?utf-8?B?OHpVRzNkaEowTVVsdW5ETjlpUllvNFEva29xWGh6elZZNlJzbnl1NTliaisr?=
 =?utf-8?B?RzJ6VnpmOEhKZTRHeVllS3N0TGU4bldGdXBUSU05dnNLTjF0MUY5VDc2R0pn?=
 =?utf-8?B?dnk4MlBIZWhZbEdEVTloZWRnQmdZR3FYZktheWI4OTVzRldPUHl5bDZndlcz?=
 =?utf-8?B?cmJBSE5EczZyLzFFek9BblBLV2h4NmhNK1B0VG9IRkIxWGZ4MXdQNnVuVzFy?=
 =?utf-8?B?dDJnTGxQZzFGTitTVXlPTGRCR0huckZVNVhZd09XVzRGVWRncnZHV2N5MWxS?=
 =?utf-8?B?K2N4ZGlGVm1QSXpwblk0MFY1OXFuWHJRakpadzhyaHR0TjgyWm8vRitGdW1v?=
 =?utf-8?B?ZWVUNDl1MkY3Wnh2NmpVbGRTYSs5TFRCZE9iY0FVcUJRNXJOL3ZnSkhRQlVy?=
 =?utf-8?B?cUFHMWUrWG5mSWpiU2MvKzU1ZmFqUXg4VkRKQ28zcHFHcDQ0NHRnd0p3WTJQ?=
 =?utf-8?B?SkVVRHpOTFZwYlJoZFBSQVJLa0JMMmtQVlhvS2dUYnA3WGt1RmRiQ0dWenpp?=
 =?utf-8?B?bUhTdzliNmF6cmFpVWZYeXdiTWIvVmdxUFdKcnptQmFTa0ZtV3lTZWsreGtJ?=
 =?utf-8?B?YkU2RDc2UXc5MkVuYnBvSCtlZkJzQ3RCb21HSENHMzZ5a3F3NEdINTNLNE90?=
 =?utf-8?B?NHUvck1nSCtSZUpRV01FSHAxaUtwY1JROGxpbDZYaHVYRkl1bUdSeUxSSjgy?=
 =?utf-8?B?Z2RzZlNua0V3dVI3S01od05IaUlMNS9qNVdycTNicWZROXdsYVkyeEJSdndF?=
 =?utf-8?B?RFBnaVlLdEZJaFAxNnA2QmY4V2U1RG9QSml4Wjdmbk90czRHOGFSN2lhZkE5?=
 =?utf-8?B?cmI0UG9CMy84K2x3eWZaWVE2NDJodjF5aWxFNlh2T3JkRnVUTVhlblV6QTBv?=
 =?utf-8?B?UjQ4L1VCK0hTSktER2VEanpHaStvYllaaVZTcENMRmpMaWllNWVacTlVUDJW?=
 =?utf-8?B?dFpTRUJtdFhnd1hmK1JHN3F1NDNRckx3Qi9qRkR1VGswR3gzbFJ6WHY5OTA0?=
 =?utf-8?B?SGJZMitnYi9TdEkxNHpEVlpjbTZDNUE3QmFBc2hSMlZXQUlPZ2pzVWs0a0ZR?=
 =?utf-8?B?T0grYjBrSGkwTFFFeHQ1NVpEV2hOa1hoSkZhZmdnVXhaTm54d0VITE9UekV4?=
 =?utf-8?B?OVFwQUJjbXpta0FZcjNWaFI0dFFGYUZWTGkrVjZyaFJPbXNVWHFzQT09?=
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
X-Exchange-RoutingPolicyChecked: aUDTlIG4C4r/sqAySO4zUGnr5GaWEXZ186yg44o7Z6BGhMpCEChVn9fv+gPLBrNSe6P/drFXh5I3PzvDQqlPvf6+krL68t+L/MjBeqmiBDwZs+8GsRhC3d8KjOb6vR3sZKIVVa3wj4kADpF7ArAqWouFVPkNLp7QiYdiIwfI3HRVt+PWmf4oxyOOtS4xVzEt20JfmZHTXcdcVFgO9tGP6rzDOf53JMLS9Ja4BFbH1X/OQNrQ/tEIVGtKbgholGV6f14oiKt6K9fbQabxnueUugyDpnX3T7deGznK3NANGS0ixgaH0pnYL0Kg5ckq9YuBXtUpSITf6y5QqP0DhK6G9Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67a91ce-b989-4680-4e19-08df43ffa124
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 16:35:30.8969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zn0HKQRYQvdGnq0M4qV6N2Vj+wFxiCR+piSjeuIbxN8Wdq48kSx4PZAfJbZP6f2MNU8ROHO14rxT5fEivfl5jz4lA2Z2ivgMCsyq+s2hc3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7946
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBNb25kYXksIE5vdmVtYmVyIDE2LCAy
MDI2IDEwOjQwIEFNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogUmU6IFtQQVRD
SCB2MTYgMTMvMTddIGRybS94ZS92c2VjOiBTdXBwb3J0IGxhdGUgYmluZCBmdyBpbmZvcm1hdGlv
bg0KPg0KPlRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIDIgcG90ZW50aWFsDQo+aXNzdWVzIHRvIGNvbnNpZGVyOg0KPi0gW01lZGl1bV0gZHJt
L3hlL3ZzZWM6IGxvY2sgaW52ZXJzaW9uIGhvbGRpbmcgcG10LmxvY2sgaW4NCj4gIGNyaV9sYXRl
X2JpbmRfcHJvYmUoKQ0KPi0gW01lZGl1bV0gZHJtL3hlL3ZzZWM6IG1pc3NpbmcgcG10LmxvY2sg
ZHVyaW5nIENSSSBkaXNjb3ZlcnkgaW4NCj4gIHhlX3ZzZWNfaW5pdCgpDQo+LS0NCj4NCj5jb21t
aXQgMzI4NzRjNmRmOGZmMmI5M2ViMTZlNTQ0NTIwZjY0MjExNDYwZDMyOA0KPkF1dGhvcjogTWlj
aGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQo+DQo+ZHJtL3hlL3ZzZWM6
IFN1cHBvcnQgbGF0ZSBiaW5kIGZ3IGluZm9ybWF0aW9uDQo+DQo+VGhpcyBjb21taXQgYWRkcyBk
ZWxheWVkLXdvcmsgcG9sbGluZyBhbmQgc3luY2hyb25vdXMgcmVhZGluZXNzIHdhaXRzIHNvDQo+
Q3Jlc2NlbnQgSXNsYW5kIFBNVCByZWdpc3RyYXRpb24gYW5kIHRlbGVtZXRyeSBvciBjcmFzaGxv
ZyBhY2Nlc3NlcyB3YWl0DQo+Zm9yIHRoZSBPT0JNU00gZmlybXdhcmUgdG8gZmluaXNoIGluaXRp
YWxpemluZy4NCj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4gaW5kZXggNGNhNDFhNWVmNTAyNy4u
ZmUzZDgzMzhjZmM5OCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2Vj
LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4NCj5bIC4uLiBdDQo+
DQo+PiBAQCAtNDc2LDYgKzU0OSwyOCBAQCBzdGF0aWMgZW51bSB4ZV92c2VjIGdldF9wbGF0Zm9y
bV9pbmZvKHN0cnVjdA0KPnhlX2RldmljZSAqeGUpDQo+PiAgCXJldHVybiB2c2VjX3BsYXRmb3Jt
c1t4ZS0+aW5mby5wbGF0Zm9ybV07DQo+PiAgfQ0KPj4NCj4+ICtzdGF0aWMgdm9pZCBjcmlfbGF0
ZV9iaW5kX3Byb2JlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPj4gK3sNCj4+ICsJc3RydWN0IGlu
dGVsX3ZzZWNfcGxhdGZvcm1faW5mbyAqaW5mbzsNCj4+ICsJc3RydWN0IGRldmljZSAqZGV2ID0g
eGUtPmRybS5kZXY7DQo+PiArCWVudW0geGVfdnNlYyBwbGF0Zm9ybTsNCj4+ICsNCj4+ICsJcGxh
dGZvcm0gPSBnZXRfcGxhdGZvcm1faW5mbyh4ZSk7DQo+PiArCWlmIChwbGF0Zm9ybSAhPSBYRV9W
U0VDX0NSSSkNCj4+ICsJCXJldHVybjsNCj4+ICsNCj4+ICsJaW5mbyA9ICZ4ZV92c2VjX2luZm9b
cGxhdGZvcm1dOw0KPj4gKwlpZiAoIWluZm8tPmhlYWRlcnMpDQo+PiArCQlyZXR1cm47DQo+PiAr
DQo+PiArCWd1YXJkKG11dGV4KSgmeGUtPnBtdC5sb2NrKTsNCj4+ICsNCj4+ICsJaW5mby0+cHJp
dl9kYXRhID0gJnhlX2NyaV9wbXRfY2I7DQo+PiArCXhlLT5zb2NfcmVtYXBwZXIuc2V0X3RlbGVt
X3JlZ2lvbih4ZSwgQ1JJX0lEWF9URUxFTV9ESVNDT1ZFUlkpOw0KPj4gKw0KPj4gKwlpbnRlbF92
c2VjX3JlZ2lzdGVyKGRldiwgaW5mbyk7DQo+PiArfQ0KPg0KPltTZXZlcml0eTogTWVkaXVtXQ0K
PkRvZXMgaG9sZGluZyB4ZS0+cG10LmxvY2sgYWNyb3NzIGludGVsX3ZzZWNfcmVnaXN0ZXIoKSBp
bnRyb2R1Y2UgYSBjaXJjdWxhcg0KPmxvY2tpbmcgZGVwZW5kZW5jeSBhbmQgcG90ZW50aWFsIEFC
QkEgZGVhZGxvY2sgd2l0aCBQTVQgc3lzZnMgYXR0cmlidXRlcz8NCg0KVGhlIGNhbGxiYWNrcyBj
YW5ub3QgYmUgdXNlZCBmcm9tIHRoZSBwcm9iZSBwYXRoLg0KDQpBIHN1Z2dlc3RlZCBmaXggZm9y
IHRoaXMgaXMgdG8ga2VlcCB0aGUgcHJvYmUgc3RhdGUgaW4gdGhlIGludGVsX3BtdF9lbnRyeSBz
dHJ1Y3QsIGFuZCBkaXNhbGxvdyBjYWxsYmFjaw0KYWNjZXNzLg0KDQpTaW5jZSB0aGUgc29jLXJl
bWFwcGVyIGluZGV4IGlzIHNldCBmb3IgZGlzY292ZXJ5LCB1c2luZyB0aGUgcmVhZGwoKS9tZW1j
cHlfaW9yZWFkKCkgQVBJcyBpcyB0aGUgY29ycmVjdA0KdXNhZ2UuDQoNCj5pbnRlbF92c2VjX3Jl
Z2lzdGVyKCkgYWRkcyB0aGUgYXV4aWxpYXJ5IGRldmljZSB1bmRlciBkZXZpY2VfbG9jaygmYXV4
ZGV2LQ0KPj5kZXYpDQo+YW5kIHN5bmNocm9ub3VzbHkgcnVucyBwbXRfdGVsZW1fcHJvYmUoKSwg
d2hpY2ggYWNxdWlyZXMgZXBfbG9jayBhbmQNCj5jcmVhdGVzDQo+c3lzZnMgYXR0cmlidXRlcyBm
b3IgZWFjaCBkaXNjb3ZlcnkgZW50cnkuICBSZWFkaW5nIHRob3NlIGF0dHJpYnV0ZXMgZW50ZXJz
DQo+aW50ZWxfcG10X3JlYWQoKSAtPiB4ZV9wbXRfdGVsZW1fcmVhZCgpIHVuZGVyIHRoZSBrZXJu
ZnMgYWN0aXZlIHJlZmVyZW5jZQ0KPihrbi0+ZGVwX21hcCkgYW5kIHRha2VzIHhlLT5wbXQubG9j
aywgd2hpbGUgdW5iaW5kaW5nIG9yIHJvbGxpbmcgYmFjayBvbiBhDQo+bGF0ZXIgZW50cnkncyBw
cm9iZSBmYWlsdXJlIGRyYWlucyBrbi0+ZGVwX21hcCB1bmRlciAmYXV4ZGV2LT5kZXYubXV0ZXgg
YW5kDQo+ZXBfbG9jazoNCj4NCj5DUFUwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BV
MQ0KPi0tLS0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLS0tDQo+bG9jaygmeGUtPnBt
dC5sb2NrKQ0KPiAgbG9jaygmYXV4ZGV2LT5kZXYubXV0ZXgpDQo+ICAgIGxvY2soJmVwX2xvY2sp
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2soa24tPmRlcF9tYXApDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9jaygmeGUtPnBtdC5sb2NrKQ0K
PiAgICAgIGxvY2soa24tPmRlcF9tYXApDQo+DQo+ICoqKiBERUFETE9DSyAqKioNCj4NCj5DUFUw
OiBjcmlfbGF0ZV9iaW5kX3Byb2JlKCkgLT4gaW50ZWxfdnNlY19yZWdpc3RlcigpIC0+IC4uLiAt
Pg0KPiAgICAgIHBtdF90ZWxlbV9wcm9iZSgpIC0+IHBtdF90ZWxlbV9yZW1vdmUoKSAtPiBzeXNm
c19yZW1vdmVfYmluX2ZpbGUoKQ0KPkNQVTE6IGtlcm5mc19mb3BfcmVhZF9pdGVyKCkgLT4gaW50
ZWxfcG10X3JlYWQoKSAtPiB4ZV9wbXRfdGVsZW1fcmVhZCgpDQo+DQo+Pg0KPj4gIC8qKg0KPj4g
ICAqIHhlX3ZzZWNfaW5pdCAtIEluaXRpYWxpemUgcmVzb3VyY2VzIGFuZCBhZGQgaW50ZWxfdnNl
YyBhdXhpbGlhcnkNCj4+ICAgKiBpbnRlcmZhY2UNCj4+IEBAIC01MDMsMTIgKzU5OCwyNCBAQCB2
b2lkIHhlX3ZzZWNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4+DQo+PiAgCWNhc2UgWEVf
VlNFQ19DUkk6DQo+PiAgCQl4ZS0+cG10LmJhc2Vfb2Zmc2V0ID0gQ1JJX1BNVF9PRkZTRVQ7DQo+
PiArDQo+PiArCQl4ZS0+cG10LnJldHJ5X2NvdW50ID0gMDsNCj4+ICsJCUlOSVRfREVMQVlFRF9X
T1JLKCZ4ZS0+cG10LndvcmssDQo+Y3JpX2xhdGVfYmluZF9wcm9iZV93b3JrKTsNCj4+ICsNCj4+
ICsJCXhlX3BtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKHhlKTsNCj4+ICsJCWlmICgheGVfc3lzY3Ry
bF9pc19vb2Jtc21fZndfcmVhZHkoeGUpKSB7DQo+PiArCQkJcXVldWVfZGVsYXllZF93b3JrKHN5
c3RlbV9mcmVlemFibGVfd3EsICZ4ZS0NCj4+cG10LndvcmssDQo+PiArDQo+bXNlY3NfdG9famlm
ZmllcyhWU0VDX0xBVEVfQklORF9ERUxBWV9NU0VDKSk7DQo+PiArCQkJcmV0dXJuOw0KPj4gKwkJ
fQ0KPj4gKw0KPj4gIAkJaW5mby0+cHJpdl9kYXRhID0gJnhlX2NyaV9wbXRfY2I7DQo+PiAgCQl4
ZS0+c29jX3JlbWFwcGVyLnNldF90ZWxlbV9yZWdpb24oeGUsDQo+Q1JJX0lEWF9URUxFTV9ESVND
T1ZFUlkpOw0KPj4gIAkJYnJlYWs7DQo+Pg0KPj4gIAlkZWZhdWx0Og0KPj4gLQkJYnJlYWs7DQo+
PiArCQlkcm1fZXJyKCZ4ZS0+ZHJtLCAiVW5zdXBwb3J0ZWQgcGxhdGZvcm06ICV1XG4iLCBwbGF0
Zm9ybSk7DQo+PiArCQlyZXR1cm47DQo+PiAgCX0NCj4+DQo+PiAgCS8qDQo+PiBAQCAtNTE2LDUg
KzYyMywyMiBAQCB2b2lkIHhlX3ZzZWNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4+ICAJ
ICogcmVzb3VyY2VzLg0KPj4gIAkgKi8NCj4+ICAJaW50ZWxfdnNlY19yZWdpc3RlcihkZXYsIGlu
Zm8pOw0KPg0KPltTZXZlcml0eTogTWVkaXVtXQ0KPkNhbiBhIGNvbmN1cnJlbnQgdGVsZW1ldHJ5
IHJlYWQgY29ycnVwdCB0aGUgU29DIHJlbWFwcGVyIGluZGV4IHdoaWxlDQo+aW50ZWxfdnNlY19y
ZWdpc3RlcigpIGlzIHN0aWxsIHJlYWRpbmcgQ3Jlc2NlbnQgSXNsYW5kIGRpc2NvdmVyeSBoZWFk
ZXJzPw0KDQpUaGlzIHBhdGggd2lsbCBub3QgaGF2ZSBhbnkgY29uY3VycmVudCBhY2Nlc3M7IGl0
IGlzIHBoeXNpY2FsbHkgc2VyaWFsaXplZC4gIERlYnVnZnMgYW5kIEhXTU9OIGFjY2VzcyBoYXZl
IGJlZW4gbW92ZWQgdG8gYWZ0ZXINCnRoaXMgaW5pdCB0byByZXNvbHZlIHRoaXMgaXNzdWUuICBU
aGUgbG9jayBjb3VsZCBiZSB0YWtlbiBoZXJlLCBidXQgaXQgaXMgbm90IG5lY2Vzc2FyeS4NCg0K
Rm9yIHRoZSBsYXRlLWJpbmRpbmcgcGF0aCwgdGhlIGxvY2sgaXMgcmVxdWlyZWQgYmVjYXVzZSB0
aGUgcHJvYmUgcGF0aCBpcyBubyBsb25nZXIgc2VyaWFsaXplZC4NCg0KPldoZW4gT09CTVNNIGZp
cm13YXJlIGlzIGFscmVhZHkgcmVhZHkgaW4geGVfdnNlY19pbml0KCksDQo+Q1JJX0lEWF9URUxF
TV9ESVNDT1ZFUlkNCj5pcyBwcm9ncmFtbWVkIGFuZCBpbnRlbF92c2VjX3JlZ2lzdGVyKCkgaXMg
Y2FsbGVkIHdpdGhvdXQgc2VyaWFsaXphdGlvbg0KPmFnYWluc3QgeGVfcG10X3RlbGVtX3JlYWQo
KS4gIEJlY2F1c2UgaW50ZWxfdnNlY19yZWdpc3RlcigpIHJlZ2lzdGVycyB0aHJlZQ0KPmNyaV90
ZWxlbWV0cnkgZW50cmllcyBmb2xsb3dlZCBieSB0d28gY3JpX2NyYXNobG9nIGVudHJpZXMsIGEg
cmVhZGVyIGNhbg0KPm9wZW4gdGhlIGZpcnN0IHRlbGVtZXRyeSBzeXNmcyBmaWxlIGFzIHNvb24g
YXMgZW50cnkgMCBpcyBjcmVhdGVkIGFuZA0KPnN3aXRjaCB0aGUgcmVtYXBwZXIgaW5kZXggYXdh
eSBmcm9tIENSSV9JRFhfVEVMRU1fRElTQ09WRVJZIHdoaWxlIHRoZQ0KPnJlbWFpbmluZyBoZWFk
ZXJzIGFyZSBzdGlsbCBiZWluZyByZWFkIGZyb20gQ1JJX1BNVF9PRkZTRVQ6DQo+DQo+Q1BVMCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDUFUxDQo+eGVfdnNlY19pbml0KCkNCj4g
IHNldF90ZWxlbV9yZWdpb24oLi4uLA0KPiAgICBDUklfSURYX1RFTEVNX0RJU0NPVkVSWSkNCj4g
IGludGVsX3ZzZWNfcmVnaXN0ZXIoKQ0KPiAgICBwbXRfdGVsZW1fcHJvYmUoKQ0KPiAgICAgIGlu
dGVsX3BtdF9kZXZfY3JlYXRlKGVudHJ5IDApDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB4ZV9wbXRfdGVsZW1fcmVhZCgpDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGxvY2soJnhlLT5wbXQubG9jaykNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc2V0X3RlbGVtX3JlZ2lvbiguLi4sIG1lbV9yZWdpb24pDQo+
ICAgICAgaW50ZWxfcG10X2Rldl9jcmVhdGUoZW50cnkgMSkNCj4gICAgICAgIHBtdF9nZXRfaGVh
ZGVycygpDQo+ICAgICAgICAgIHJlYWRsKGRpc2NfdmFkZHIpICA8LS0gcmVhZHMgd3JvbmcgcmVt
YXBwZXIgcmVnaW9uDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1l
bWNweV9mcm9taW8oLi4uKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzZXRfdGVsZW1fcmVnaW9uKC4uLiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBDUklfSURYX1RFTEVNX0RJU0NPVkVSWSkNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5sb2NrKCZ4ZS0+cG10LmxvY2spDQo+DQo+LS0NCj5TYXNo
aWtvIEFJIHJldmlldyDCtw0KPmh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEx
NjE1MDY0OS4zNjg2ODYtMTktDQo+bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tP3BhcnQ9MTMNCg==
