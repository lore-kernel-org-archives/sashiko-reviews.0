Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793831265;
	b=1j/6NrER5KgwMiMJFpwkBjnPjlQlsZIOQNZe548uDzemGA8g+QegWS2mrOMKg5fdKRaA
	 oTgvNZqZ1eT5DHRkAtkanfnwJ1T/OBQcmXFEKJ81r4E0tvLRjQxuOyi5Ngcdo9C0nIDGH
	 HlBl+eG4sp27f9IV/Kn3IT0+KWGKs2w3hXbUoN1d3AP5SeX4hEFHOWQwATS1Or8bRlYsW
	 t2eNCFoICWSdB4gUynut5nnVwJyslcdKBqQfEu9Bk+/Srr+NzT/KtGva7v1HhD9bgrztm
	 +HO6O0D/l5E/sgOiBAuOQjn7w9PS3MKjXWMdKwu5yty/MFk5RrcF9gj9C6t6GlMAwFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831265;
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
	bh=luGW6CA/hTUzzOdIO3vCtefJ/vAItJ15cdm2GaL0qvs=;
	b=nn41SbKwMCtg4YEDBt/lqcje5gK0qks7nbCOIeGg1hqxAFXw9WnvJULzAgKx+93gvBRk
	 LzidKS/X41ai/Ur99x9gPZHgaQuoNhvktakT73dwAGC/mBhOwkp3umeiOqZMUBJZB8DTH
	 Zwps/N+rhb29vnebPfGjo9yuLSqy1GGPHA/+Wa5UaWQC6EOqwznErcORWWd4N2rY41pDV
	 1PlzUQYaAtREaxn1uEl2QSNc1/y9UT5DlpI0v+jj5UfT3xWdc1F9Cmme2ckJI94gi9BGQ
	 MmxTNc64cx1wYVOJwJoGrnOFXv+bV3jLDvQcYNeMbQQYbNUko8qxra/X0l7hgdmn90Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="kWD/PjlW";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F3B606AC00
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 22:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09F3B606AC00
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kWD/PjlW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793831266; x=1825367266;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=luGW6CA/hTUzzOdIO3vCtefJ/vAItJ15cdm2GaL0qvs=;
  b=kWD/PjlW+gMmqfab+YW/UJA4mmOfw61Alg4NDqIh1zznsbcLFRi+/lIu
   DqwZkLBli0Q4eg1vy4z1Z8zUBvarfig6d+/hqkqAuUuY5eE0o1Fq2mrKm
   R6X2WCPkfLiok32D/7CB7CZaDy2prYpQsh4HIq9rtS3vXeVxYF4eoMssL
   pCs6+HLmtFgxdPQ6x4IVVw0NZ8TX1KeB3ghAFTPjVtmAkPsmFvDlv6tnr
   Ror44gwPAvVVhkVM99V8CQYzFgOKzMbafmFrP9zQ45xjwnoDJpSqlF0vg
   sEL0rT6WOUXE2AHcRXMWlU9rs7Z4fdYeYGNwMMeMEm4jr9Tw3w2P6Wfkx
   w==;
X-CSE-ConnectionGUID: rIcMSwE8SrmfSmEn3pKxDA==
X-CSE-MsgGUID: W9VMMkHuRPuWhVpJ8IB5Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2491451"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2491451"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 14:27:45 -0800
X-CSE-ConnectionGUID: XwBySTnQTuqPZFBXZl0N9g==
X-CSE-MsgGUID: 5snT7RjQRx+T7B2JspHUag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6897003"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 14:27:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 14:27:44 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 14:27:44 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 14:27:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JudAwS3QkfDE4rrTopJC6bADbtgY+euDoF88huic5edYx7B9n4IpcLnODKPTlKB46mARcSClpxLFs44U0ixGAl9cmeVrMisiPbyDFIR0rarOR0tAT4JoxG3uEykr7TMbys/mNUc0+q2sGFWv61QRS2PGG5T/AQWepv45EfaRzjUFcjxDBCNhjLXXMQU7gSGaZTSomJ9Lc652eaSLeLRp9UaY1IWlG1hglvF/axN1Ho/Qax2eE2hVajPe3/ybRR4erbIFTET9RWYJa+fMNxNsorcGwCprHgtG7Qk5wQVA5xKp8mu98EvmN3+cQ5SzHnOI8NM4WujhK9Cw+5oXBle4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luGW6CA/hTUzzOdIO3vCtefJ/vAItJ15cdm2GaL0qvs=;
 b=ITFsJYAN3zkODV4ACm8XAHhmHeofs8GlAGn1Qu/4FqQpGgoKvwBog+dt+NLTd2wpRKNl7T0IYGwSeTTCfNW2S4D3aHhUQlsnwfAvZSoqWXBxQ0d8Q7I347KgMbk01OnAJiAb1AcMPyAfKl/lIM/4pPNGKrn1MAvU4Xvk1N+JvneXXXUjpYlKDklRBqp8iH4sznlnu+4AN2N5GdWFSZLKLcJjMuYjePXsP1/1Dd85AqlNdxi8eDWwrrFOSjo77JaZliJm6tERSs4aNMwT0vdu8YL3Vn4/inFDGut6uenNGIwGquhE5zVeMH8fYzhTu/Hw/8wqwSR+IGiAhzx1X3G6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DM3PPF4C5964328.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f1e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 22:27:36 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 22:27:36 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v13 01/16] drm/xe/vsec: Do not register BMG PMT for VF
Thread-Topic: [PATCH v13 01/16] drm/xe/vsec: Do not register BMG PMT for VF
Thread-Index: AQHdaxd0exRgh2KR9UKn5tpMFpxXA7cbW32AgAMkjuA=
Date: Wed, 4 Nov 2026 22:27:36 +0000
Message-ID: <CH3PR11MB046149AF2140506F06AA8D28BDC1682@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-19-michael.j.ruhl@intel.com>
 <sashiko-outbox-194278@kernel.org>
In-Reply-To: <sashiko-outbox-194278@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DM3PPF4C5964328:EE_
x-ms-office365-filtering-correlation-id: 124cbe3d-8486-4209-f20d-08df3ac2d3e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|261022105027099003|4143699003|11063799006|56012099006|261021121427099003|261009223027099003|261028144727099003|261102123227099003|261022075727099003|261022115727099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: i1KBOCedy8mDSwHHgHXLotRtMlRRBEVACRDCtcUaBUB7UOa+hJ4jS/LizFng3gmSxvLRzjsadSrHham30VCM8RMThhAn0y9dexvpOoa+IDA0hpzD1SA02vKZHs97m4NK8jVSKLSMNWYfsoYQ2dgEe2aM5NABRTzcmKX32OLGV6ojUUsuBjMk+RnHzAqU7UQwRbzIzW631FjEziSymufdbAmP/At7snzjzwVieGqD7b08X0XcoGGsspjH745aBoRPr8NfE66sqmTSFZmxoDtd39SNFWt4Cg0CGeCF4aTnIeyVQBPKO0oUgcWUKCRDypMgMcl5/v5Kb9MQ5YIWZFIGo7tf6eMFNVxn8hQmcavipiLITpMxEBa3cpWKrURtHhOVAsr12TNM+w8edwTOhD2ZR+wj8LulqOxXIUD74MofiDiJUYtplXXyrAsvUNHYDVzv+Auvp8NIC2NgBX/9EYGn2nw8by3/GNlcUyhgoItqJqVwI8LH5Oh0a4d7+oqV5RKLJWKpyZUXShKfXeiy70Cjt/mGyoswfaJYRDY5n+J0UVp/olxjDJzIwpsvQCkbFv1lJsbC9++YWp0CuyWztR3InEbBThUzorn03V0+KbpsEffWpCdgEAgF7HYW2R9NleMInWYw3OFM2mSQ+nYZ/usPp2t7BUKqDdryP1HBuHkutCo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(261022105027099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261028144727099003)(261102123227099003)(261022075727099003)(261022115727099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blIxcTdkVngzSEFlZlFqWVN0bWFVNnJHRnpXakhndDlJTWp6ZGdGTC9EbzZl?=
 =?utf-8?B?QmNDcXZObklNWDZCbjRtR21XOTZac2RubzNFNzRrL3I5ZEcvTC9mRVd6QStu?=
 =?utf-8?B?V3poNWc4N0hwQWpCRDZ5eDlGaVFwdjBxWlRlc1pmZ3EwWmVWZG9xZTk3OTNZ?=
 =?utf-8?B?SW0xRXVkcUhXd0hTV01nWEt2MVl2Y08vS0xNaWIxS3dBSXh1R0k1TFJhOFFG?=
 =?utf-8?B?SExmSFhLZGdJaGpWK3duVVBOekxMT1FhL0NuK01pR2VZQ25ZNWpqSmRNZkNY?=
 =?utf-8?B?aXd0Q0lISEE2dVRsKzNYeG5tVnViM2QyU1puUmdTUm9hQkU4VWw4cTdDWlp1?=
 =?utf-8?B?aGFjekY2WUpyN3h1S013Ym5ZMUFMT0JQMm1oUmd2WEtabmhaOWdzaUY2WnB4?=
 =?utf-8?B?NE9IUEJLSTIxRGVMaHNIRGRLMzNPWXRhcW9FZHFxSmNyUW51Z0JwMkxqNGI4?=
 =?utf-8?B?c3B6b0d3ZndkNXdiejZ1cDdIMlNFdEFmd2MvM1o1eGpqSGVZSEhYa3NlR1RE?=
 =?utf-8?B?Z0x5V3dxR2doc0I5RmFmRmx1eUg1VDJmS0F5NEx1TGk4SG1kNVIvYm81clFM?=
 =?utf-8?B?ZVk3YTBmUkp0VFlOZDJRcmFkNm9NcWs0eTZFTlMydmMwWElvQ3dUc0JkVk41?=
 =?utf-8?B?bDZaTWxiSEpLZkxoc2tvRXBkSDd5QTJtclBCMzFsRmVVR2pObElTbk5QajQ1?=
 =?utf-8?B?SnRSRHNLMStJcVZvaEwvUlBuMlB2cWZaK3JBVjNwejY4WlVldGRSQnIzS0tV?=
 =?utf-8?B?TnhibXh2TDd4SWJMZ3ZvZjlrZXRHWVI4aWJURmJnUE5YQWhnWnBSNFdiUVhZ?=
 =?utf-8?B?MmkwYVgzalpKdG5pTlVIRVdHajZyZ3RiaU55QmY3Y3RWbktWQ09mdG9PakRq?=
 =?utf-8?B?OEtDaTdNQ1RDaU9FbkpITzJIWSs2Mk5pRVBsK0hkM1RIQ2JEZFNVRVRXTk1p?=
 =?utf-8?B?a0ZLdGpOTk9mQ1lZN0Urc05HMG94YW5VaVh5L2R5YmdZd3d3NXYzZXdzdkNO?=
 =?utf-8?B?bDEyS1pPVndPM1FPT3hHVFloRWJzSVowQW9pa04wdW90WEhVSG5iSllNWDlt?=
 =?utf-8?B?bHQ2NFhNeUJDN1ZRUncvS3A4aEROVlBLUTlicU1zRDJXQWIxbitSY0l4U3ZO?=
 =?utf-8?B?K0YzUmlvQ3J4ZXpvMUpTVnRXTHlTeml4ZmM5eFo3ZjVQeHdUY3RYSDZWMkkv?=
 =?utf-8?B?UnN0REhBVUEwS3BjcXBkWllqZzFrZk9lNnBsZE5pL1YrYUo4UUU1ZTRnRTFX?=
 =?utf-8?B?cHJYQnZUcEJxdnNPajFZR2dHcmhJMjk1THZPL3d6SWQ3M1JTM0xuTWUycXJh?=
 =?utf-8?B?V3ZKalVSME85T05MbVRqaHRHSGJpMXM3eTRQMkwzOEZoTFRDUWN0dmhya2Rt?=
 =?utf-8?B?c3BvMzQ0TVU0MnFSd2F3VVFLNUZVZmhsWkMzNm84eXdERkZGL2FXV2w0a3Zi?=
 =?utf-8?B?UDdDYWNmRjNDR0t6YnBqRllhWWVYQlFxcWMwTFlWbTZ6U1dQa1VQSUcvVlhl?=
 =?utf-8?B?REZtYm1YU3pPZ09NS2o4aFlHMUxKaDQxanp6UG8xckRKRks1aTNUK3lka1VF?=
 =?utf-8?B?K0F2RHhsWGJJK2dpSWNWdVZNZnhPbXhPZUN0NnRQeEppM2NSM2JSTUQyMHdo?=
 =?utf-8?B?enB4UzBDWUNYU1ZBc2w5TGdYNm95U3RVTXVpdVZkWXVuTlU1S3Q0WkRRZGZF?=
 =?utf-8?B?NVlSWlhBWHVyLzdWNmlveEZzY2NOWGVSYUJEei9Ma2RnZFFmR1F5UStRcUpJ?=
 =?utf-8?B?RytHUHEwNEppUW9PdWpJUWk1N0ZjWm1DaUxDSlRPWm9ranNBalZCalF4eTBu?=
 =?utf-8?B?b2VlN1pKc3RvemM4VjNQQVNXbEZuaXpaVysyRmxQZ1Z3UlNSaHpVQXluTTJl?=
 =?utf-8?B?cHFvcHJKbmtVVHMycms0YmwycHh3a3ZxUjlHZGRMcHF4OXB1clRUcXZ6d3Iv?=
 =?utf-8?B?eXU5dUlkanR3MVdraUFlMEdyRUF1akNaeDVNYnpIRW9VUno3R1BhMGtsNWhi?=
 =?utf-8?B?bkk4OXA1T2lmWkhRZ21SYXNmZmd5R0hGVnJKQXVIcm1DdDFqQ0Q2azBBVGZi?=
 =?utf-8?B?WGlNcVBEVmhMK1hiK3JKZ2hFbmxFWlNKRm15a25mbUlnb3NJNnBZWmVIWkVG?=
 =?utf-8?B?N3g2VWY0MXpMU3EwNzFuK1c1Q00zTi9IU0FIMnAvSU9ua1YwUVBEc2UyNGFV?=
 =?utf-8?B?OHVqYmNwLzZ3Y2RVQXlCanRLanVsdmFjbUE2WDRLNGg2YU9hY2V5SWVFL3lS?=
 =?utf-8?B?QnVud1BweDViMmZzSmxTclZESzhnNVcyb3BYZS96akZGU0ozS2tXeGJkNkhN?=
 =?utf-8?B?MVMrY2g4UEV4K3lPZXI3RDJLOGRtU2RUaW1PY2RFbUdTd0V2Q2crUT09?=
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
X-Exchange-RoutingPolicyChecked: SrHiMqzvtvC9HFH7C208fUTlZP51an7J04fXPyqAn5LMFWtb49X1jdOinpAl2lhSPTdKcKRtGYLfWTsRZ/yBgmlLnn0h1ru+LFkyHXJfO6YLKYTVKBg5O1RyT8HKobcJBXjo9PLGWWChHnwzpDpKMgYKyTx5+IKh5nUU3jhnxrMVb/m9AKfxcMrymfGay83qGK9CAcM6g5AqC05zue5/JvFmftKcXCkZopWSDj2v2Qbgkb+du0WjpE8oTsNcDiepe2HNyznLPEhaUKY0BixqF/MBEnZWhDxnuqWZy2BMhSYqYVXsTQsVO7nqexbwnqJmQIpZZjOIux5+P4YDlgsy2g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124cbe3d-8486-4209-f20d-08df3ac2d3e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 22:27:36.3157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CWk5Q+aLoCc/T3aO2PF9EU4SRSKelhr6/06BDEJABN32sYVmUMURz/FBwI9YgwfBK7GjCsuArsDGUBTkDiZT4AXFeaGJ51DmDJZILGC2Quc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4C5964328
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBNb25kYXksIE5vdmVtYmVyIDIsIDIw
MjYgNToyNCBQTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNv
bT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0gg
djEzIDAxLzE2XSBkcm0veGUvdnNlYzogRG8gbm90IHJlZ2lzdGVyIEJNRyBQTVQgZm9yIFZGDQo+
DQo+VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91
bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj5jb25zaWRlcjoNCj4tIFtIaWdoXSBkcm0veGUv
dnNlYzogTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIHhlX3BtdF90ZWxlbV9yZWFkKCkgaW4N
Cj5zdXJ2aXZhYmlsaXR5IG1vZGUNCj4tLQ0KPg0KPmNvbW1pdCBjZTk3MzU5ZDk1M2QzNWZmZmYx
NjU2NWRhYTM0NTU3YjUyMzZlMjI3DQo+QXV0aG9yOiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwu
ai5ydWhsQGludGVsLmNvbT4NCj4NCj5kcm0veGUvdnNlYzogRG8gbm90IHJlZ2lzdGVyIEJNRyBQ
TVQgZm9yIFZGDQo+DQo+VGhpcyBjb21taXQgc2tpcHMgVlNFQyBQTVQgcmVnaXN0cmF0aW9uIG9u
IEJhdHRsZW1hZ2UgU1ItSU9WIFZGIGRldmljZXMsDQo+YWRkcyBhIFZGIGFzc2VydGlvbiB0byB4
ZV9wbXRfdGVsZW1fcmVhZCgpLCBhbmQgcmVtb3ZlcyB0aGUgTlVMTCBjaGVjayBvbg0KPnhlLT5z
b2NfcmVtYXBwZXIuc2V0X3RlbGVtX3JlZ2lvbi4NCj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdnNlYy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4g
aW5kZXggYTliYWYwYmZlNTcyYy4uMTc4ZjIyZGI0MDQ2MSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92
c2VjLmMNCj4+IEBAIC0xNDksNiArMTQ5LDggQEAgaW50IHhlX3BtdF90ZWxlbV9yZWFkKHN0cnVj
dCBkZXZpY2UgKmRldiwgdTMyIGd1aWQsDQo+dTY0ICpkYXRhLCBsb2ZmX3QgdXNlcl9vZmZzZQ0K
Pj4gIAl1MzIgb2Zmc2V0Ow0KPj4gIAlpbnQgcmV0Ow0KPj4NCj4+ICsJeGVfYXNzZXJ0KHhlLCAh
SVNfU1JJT1ZfVkYoeGUpKTsNCj4+ICsNCj4+ICAJcmV0ID0geGVfZ3VpZF9kZWNvZGUoZ3VpZCwg
Jm1lbV9yZWdpb24sICZvZmZzZXQpOw0KPj4gIAlpZiAocmV0KQ0KPj4gIAkJcmV0dXJuIHJldDsN
Cj4+IEBAIC0xNTcsOSArMTU5LDYgQEAgaW50IHhlX3BtdF90ZWxlbV9yZWFkKHN0cnVjdCBkZXZp
Y2UgKmRldiwgdTMyIGd1aWQsDQo+dTY0ICpkYXRhLCBsb2ZmX3QgdXNlcl9vZmZzZQ0KPj4NCj4+
ICAJZ3VhcmQobXV0ZXgpKCZ4ZS0+cG10LmxvY2spOw0KPj4NCj4+IC0JaWYgKCF4ZS0+c29jX3Jl
bWFwcGVyLnNldF90ZWxlbV9yZWdpb24pDQo+PiAtCQlyZXR1cm4gLUVOT0RFVjsNCj4+IC0NCj4N
Cj5bU2V2ZXJpdHk6IEhpZ2hdDQo+Q2FuIHJlbW92aW5nIHRoZSB4ZS0+c29jX3JlbWFwcGVyLnNl
dF90ZWxlbV9yZWdpb24gY2hlY2sgaGVyZSBjYXVzZSBhIE5VTEwNCj5mdW5jdGlvbiBwb2ludGVy
IGRlcmVmZXJlbmNlIGluIHhlX3BtdF90ZWxlbV9yZWFkKCkgd2hlbiBhIEJhdHRsZW1hZ2UgUEYN
Cj5lbnRlcnMgYm9vdCBzdXJ2aXZhYmlsaXR5IG1vZGU/DQo+DQo+V2hlbiBib290IHN1cnZpdmFi
aWxpdHkgbW9kZSBpcyBlbmFibGVkIGR1cmluZyB4ZV9kZXZpY2VfcHJvYmVfZWFybHkoKSwNCj5l
bmFibGVfYm9vdF9zdXJ2aXZhYmlsaXR5X21vZGUoKSBpbml0aWFsaXplcyBWU0VDIGFuZCByZWdp
c3RlcnMgdGhlIFBNVA0KPmNhbGxiYWNrczoNCg0KWWVzLiAgVGhpcyBjb3VsZCBjYXVzZSBhbiBp
c3N1ZS4NCg0KVGhlIGNoYW5nZSBpbjoNCg0KZHJtL3hlL3ZzZWM6IFN1cHBvcnQgc3Vydml2YWJp
bGl0eSBtb2RlIGZvciBDUkkNCg0KZml4ZXMgdGhpcyBpc3N1ZS4gDQoNClByb2JhYmx5IHNob3Vs
ZCBtb3ZlIHRoZSBjaGFuZ2UgdG8gdGhpcyBwYXRjaC4NCg0KVGhpcyBpcyBhICJwcmVleGlzdGlu
ZyIgaXNzdWUuICBTaW5jZSB0aGUgcmVtYXBwZXIgaW5pdCBpcyBub3QgY2FsbGVkLCBiZWNhdXNl
IG9mIHRoZXNlIGNoZWNrcyB0aGUgc3Vydml2YWJpbGl0eSBtb2RlDQpmb3IgUE1UIGNhbm5vdCBi
ZSB1c2VkLi4uDQoNCkFkZGluZyB0aGUgX2luaXQgYWxsb3cgcmVtb3ZhbCBvZiB0aGVzZSBjaGVj
a3MsIGFuZCBtYWtlcyB0aGUgY2hhbmdlICJjb3JyZWN0Ii4NCg0KbQ0KDQo+ZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZS5jOmVuYWJsZV9ib290X3N1cnZpdmFiaWxpdHlf
bW9kZSgNCj4pIHsNCj4JLi4uDQo+CXhlX2hlY2lfZ3NjX2luaXQoeGUpOw0KPg0KPgl4ZV92c2Vj
X2luaXQoeGUpOw0KPgkuLi4NCj59DQo+DQo+VGhlbiBfX3hlX3BjaV9wcm9iZSgpIHJldHVybnMg
ZWFybHkgYmVmb3JlIGNhbGxpbmcgeGVfZGV2aWNlX3Byb2JlKCk6DQo+DQo+ZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3BjaS5jOl9feGVfcGNpX3Byb2JlKCkgew0KPgkuLi4NCj4JZXJyID0geGVfZGV2
aWNlX3Byb2JlX2Vhcmx5KHhlKTsNCj4JaWYgKHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9pc19ib290
X2VuYWJsZWQoeGUpKQ0KPgkJcmV0dXJuIDA7DQo+CS4uLg0KPgllcnIgPSB4ZV9kZXZpY2VfcHJv
YmUoeGUpOw0KPn0NCj4NCj5CZWNhdXNlIHhlX3NvY19yZW1hcHBlcl9pbml0KHhlKSBpcyBvbmx5
IGNhbGxlZCBpbnNpZGUgeGVfZGV2aWNlX3Byb2JlKCksDQo+eGUtPnNvY19yZW1hcHBlci5zZXRf
dGVsZW1fcmVnaW9uIHJlbWFpbnMgTlVMTCBpbiBib290IHN1cnZpdmFiaWxpdHkgbW9kZS4NCj5N
ZWFud2hpbGUsIGxvY2FsX3BjaV9wcm9iZSgpIGhvbGRzIGEgcnVudGltZSBQTSByZWZlcmVuY2Us
IHNvDQo+eGVfcG1fcnVudGltZV9nZXRfaWZfYWN0aXZlKHhlKSByZXR1cm5zIHRydWUuIElmIHVz
ZXJzcGFjZSByZWFkcyB0aGUNCj5leHBvc2VkIFBNVCB0ZWxlbWV0cnkgb3IgY3Jhc2hsb2cgc3lz
ZnMgYXR0cmlidXRlcywgeGVfcG10X3RlbGVtX3JlYWQoKQ0KPndpbGwgY2FsbCB4ZS0+c29jX3Jl
bWFwcGVyLnNldF90ZWxlbV9yZWdpb24oeGUsIG1lbV9yZWdpb24pIHdoZW4gaXQgaXMNCj5OVUxM
Lg0KPg0KPkl0IGxvb2tzIGxpa2UgYSBsYXRlciBwYXRjaCBpbiB0aGUgc2VyaWVzLCBjb21taXQg
NmUxMjZjYWFhYzdiDQo+KCJkcm0veGUvdnNlYzogU3VwcG9ydCBzdXJ2aXZhYmlsaXR5IG1vZGUg
Zm9yIENSSSIpLCBhZGRzIGEgY2FsbCB0bw0KPnhlX3NvY19yZW1hcHBlcl9pbml0KHhlKSBpbiBl
bmFibGVfYm9vdF9zdXJ2aXZhYmlsaXR5X21vZGUoKSwgYnV0IGF0IHRoaXMNCj5wb2ludCBpbiB0
aGUgc2VyaWVzIChhbmQgaWYgdGhhdCBjaGFuZ2UgaXMgbm90IGJhY2twb3J0ZWQgdG9nZXRoZXIg
d2l0aA0KPnRoaXMgb25lKSwgcmVhZGluZyBQTVQgc3lzZnMgZmlsZXMgaW4gYm9vdCBzdXJ2aXZh
YmlsaXR5IG1vZGUgd2lsbCBjcmFzaC4NCj4NCj4tLQ0KPlNhc2hpa28gQUkgcmV2aWV3IMK3DQo+
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTAyMjIxMzE0LjExOTAyOC0xOC0N
Cj5taWNoYWVsLmoucnVobEBpbnRlbC5jb20/cGFydD0xDQo=
