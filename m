Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794327574;
	b=Tn54rgoc/B8Bc767Gur9iz4z1Hu8BMpTnC2/g8LlF96FWXb0N/srKRpMJJqG15v3XzE+
	 7AGn84MHqlbpz5iGHPewPLI8ek7HvvY5hAmILujG8KjEcfgBVd1VlNSWbaOFeFx1Nc5z/
	 l/ID7RVbRlROx1mD2WkzZj2sMoc2jAx1ICxjMvZ9S8RXGHqy0hFjaIWJ1GySoXrOORdnw
	 Ce152ny/zW2y+GHTUiRpCAGy3PCZyP1tvE3U22U0W2lgPbq8L+6Mx6cx0XreYGwySVf+p
	 VQg3r7tF6PnAUEbrG0hGebQf4lbma5/Jv75QyMd6sAHk89vffxlTGHr7VZgqK6++oFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327574;
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
	bh=fARA0BNy0WDNjnP0PdfaeVGpX4pT/Aw3xSeVpjYbGLY=;
	b=bfASfYilsCi+/P9RnGn/GZCIgV9fnh5bSTteO8YTzkmiEkbRWgF9A5s9nugzrmcksYtw
	 2BjMlBvKBHwszruQ7KT8tGRdzFgr0hoJWlc132r8rj+fGNKzCLrZUIIiHLBvcEMZ5jcUK
	 U/GQVxqGS6HHN0ZO2Mq+wmpfueeC1goaFBr1jS9iMtQVnIEwsLSko3nEhD6jHLU0gY3eH
	 cNCRMWcmpriizoWjRnOR1lssahNGe/RPtLM9lbLBIv0VdS0w3MUvYzAzgf0QCckEnE/ip
	 SZpz/FnChLOP980FQhJyG3twQWAAG4byrDdTDfyMG0vHtlqd2kPOZb7uwxISgGlQbsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nRVGODaU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E711606A32E
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 16:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E711606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nRVGODaU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794327573; x=1825863573;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=fARA0BNy0WDNjnP0PdfaeVGpX4pT/Aw3xSeVpjYbGLY=;
  b=nRVGODaUVQuNlmnu4hLJ+0QVH/3yl0Z+s4p1lMiGTXy/ZqjYRGY4fErP
   Sg4GuwhYeL4GnNxC8sWnIrFRpgxLbRtItT0xpHM61ZZYdFwxPRaCstTeo
   HTRl6R0WaplOHbIJzzadAx0DVXXMII/XBK3qGO4Y+xfjZLLYBeoACZk4f
   /35npMUiIWGJ/IZW2HUrU/PrSYzZEYOwXQ+Q1vM+isbrEBmWyCJmWsnrS
   Ynt7VU9owkdvkUtTqfq7gi5c0ovvE7p/P00R8tlAwlAtmp2ti26uvlYyz
   AC3ZJj4kPIQVP1Ueknmsl+dcRoM0ulq+UyXzdNk7O3QE7/n/7Spgl+3bt
   Q==;
X-CSE-ConnectionGUID: /CXTQ22oRMmg09g99C8YJA==
X-CSE-MsgGUID: OVxkZNBFQuyUq8n5myKFkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3076121"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3076121"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:19:32 -0800
X-CSE-ConnectionGUID: kg/ruHopTVekCbL1sQ1diQ==
X-CSE-MsgGUID: JaCI2+F0S3q122k97fW89Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8493352"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:19:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 08:19:31 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 08:19:31 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 08:19:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaTn3ypYKbSSJesunIQciAguzyAfKw+S4suY97bLeN3DDi+Bc/VVblHhAZQ95Ts1Ne4k983IRmhhMtBYpY22pvj7iSuB9DNxA0qDAZQNGhVF8eyQ919aoX2ze5QZFGHguIwM6PM0yLwYgzraQacm7fYvAgatn6DnrmmQtDR8hhPvUYiDBvjz9m4BlRWdr+V+lhijrdLg88K/iCoGqqQyDabo0gg16am/MHpQQpNgoOZ9sm4XMmh5iPdWS2JQ1BjXw3k+by4tQGZMD6quRJ5qlYschhdVnopAYPep/JFPMspnv5C32S0sNKT/r4Czvv8rUxPCAcHwuGLYjY8CvY+L0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fARA0BNy0WDNjnP0PdfaeVGpX4pT/Aw3xSeVpjYbGLY=;
 b=CciKBtn2mzMk49SP5q5tpmB7reNn4KfTqn062/aMXlvvR0BQB+gXS/QhsxzHfMdnoo1NdlyOp8RHy9Ru3KEjkgFPohoc2T0XMfhZzbfuMVOBE49nWQktm5UXGp6qvMStO/V2appi2WoG5xAs13L7hgRE7Tt/0sV/OELABS3C4IPIFmr8V6sNlZ9yRDqFojW2pj+CA1oMZagIele41vTvIlQJ+3ePMI0VbwB5mFJQmg0F1qoB2ZfLDD3fywdmfJMkj2ZRWbJJKY8bVDM8f+0PVVC6+yVrmmznbb5tzKPVMjuG9GlhcTNgK8bQPdLZsorilcxm3MUThDFdEQdp6c1W3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by PH7PR11MB6499.namprd11.prod.outlook.com
 (2603:10b6:510:1f0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 16:19:16 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 16:19:16 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v13 14/16] drm/xe/vsec: Update PMT internal access
Thread-Topic: [PATCH v13 14/16] drm/xe/vsec: Update PMT internal access
Thread-Index: AQHdaxeBNX53v1NrwkyS6+lhEldtcLcbXq4AgAwpMSA=
Date: Tue, 10 Nov 2026 16:19:16 +0000
Message-ID: <CH3PR11MB04614935076D34C9CE3F505130C1722@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-32-michael.j.ruhl@intel.com>
 <sashiko-outbox-194292@kernel.org>
In-Reply-To: <sashiko-outbox-194292@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|PH7PR11MB6499:EE_
x-ms-office365-filtering-correlation-id: c1b5ac3e-f363-4885-dc9f-08df3f465e10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|261026121527099003|11063799006|261028144727099003|5023799004|4143699003|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|10067099003|261022115727099003|261009223027099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: PLfRjlvjEtlYbBD9zS035CpEK9PogsRmO+v2+VbD1LNbW3ub6ShIRir2dUAxJzknwAgdj5tOkEBinuEKiNHo96Tzlz2X1m23clx8P7aA2kZEsL884PF/Wz8oRPNlWS8ibTU6ZJwDaFsf0yBQgkSvqmCQdj6WIqhfW4Z0u/7W8wBTv3Zf6lkyCACUcwDrxx/uqfQCBTgi28OVuvDEktqPiRYRVv3BsY0vCLvv9RPn35vtudjJSO62HnpOqI5DM7riZiKbT7W1PdTLFCnS8u+1r5pRZ0irht/Z0s5f/1q/FIpMeII0KDR/OvDeaFkstIeQhNn5OE9bBgXgd6nRAQ4vKpyigLa1NjnJpUh5SzfgUxzSnMmOitXafkQNDYL1K3dIbB9uVFbuGnd9yY1Y6U9Zt5IrkvxyKU1c5ksAz7CmOBWZkP35syKZtGHLGB3mxD88Nut8L0DWRm/eFaxaHlMlOUAe/oO+UqpfSbu/Cb7bLy6IF+O7V5X+O6/ymB/sw6LZs7d7aFTjs5TkQVLlY9HjoSD024R0dXkV9y93q02gCP6KwGStkpSipQYiUpWQg2IEwsU3K/IZGrzLj3I8SnEo8KTSYQvaIZpadfmyquY6BHVaqPuRG9Y1wY1UEykRh9zsidt+WYOQa0UV0Z5pqfqVmaKRbzgBY3G3r5s2SaZNMt0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(261026121527099003)(11063799006)(261028144727099003)(5023799004)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(261022115727099003)(261009223027099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnpReGxmVWI0b09iWlJ6bFdxSE04bUpDQ2RLL212aTUreTltaUd1My85UWlK?=
 =?utf-8?B?RjVXZU1zWDYwK0dDWnpYb2JFdTFwRnVxL3hNTUVhMXRNdHJYc3FPSm92Q2xJ?=
 =?utf-8?B?Ui9rUHJvYndwK1lEYmRkOHRwdW1URnZlZlBTUVJEVGpEQzlIZEoxaFhnNHhi?=
 =?utf-8?B?YU9HUGdrR3NQZkVNSnYrS1gvdGJCeEFsbkZkaDhjMVNuMGVweFhPaDgrUkty?=
 =?utf-8?B?WWxRbFo0OUxoU1JQOE8wNG9ELy82MUl2OVBacnEvcjV5ZWJXb3JscFRmdmcy?=
 =?utf-8?B?NDJNbWdFSVlQdGt5ZnpDNTJqWFk5b3RTeU8rNmJuemdHa2htVkM1SzBqMXBT?=
 =?utf-8?B?TGN4S2FEbEhodkZXT0U0Y3NhTzQxTnF6VmhFWXJ6ODVpMkhNS3dPWmJlbXhz?=
 =?utf-8?B?MEY2bnU3Kzk0Z0VnOTBhUURCSGMxV3NYL1BuNEVoZVdJYnphQUFwM2pkSm9n?=
 =?utf-8?B?L3VORVBHMlBxS1JwdzNYMG0rOTFNWXlOOHNhN1NCZjB0Y0RLOW9sYkx3d2NO?=
 =?utf-8?B?czhoNWlCVDQwZ0Q0TzkxMjI1c3BGMnNTNXo3QzRNZTM3OGJ5Sjc4UVQ3Um5O?=
 =?utf-8?B?WFJmWllRUGxpOE9udDJRRWROWllqZ1JtWi8wa1MyMWJoTG9nUzFLWVZpUGxw?=
 =?utf-8?B?OHIxd1R1TWdEQm9BUy9Sdmo2RnFHM3ZPbHA0Z0pOakxzTGYxUFFnZnlpWlhp?=
 =?utf-8?B?cjloL3U4U25nYzBFUjE1Q3RrUExhUDR1cXBkVzJ4SnJIUHU4TENabXdTU2NN?=
 =?utf-8?B?UGFXZG5uZ2d5V29IRE56aXBQbmJ6andvb0U2WEFkN2liZmRNZHU4Nzc1dmJN?=
 =?utf-8?B?N053K0x0cnlMOEJ5cGlUOUM4dFY3YTVqczFwckk3WFhxK2JlL2xQT0p3dlVJ?=
 =?utf-8?B?R3hEdkF4cW9abHdYS2wreERUYTc4ZGt3c2dTUThQazJSSGRieGtrR1VMNEgy?=
 =?utf-8?B?SXRjR1JmSkFPM2E2V25INU1TVktIN3BZSERvVm1GRUVVUUZ2VEZDRldDVkxx?=
 =?utf-8?B?eXJnSFpXWjVZQnpVVjM3L2tYYTErRnpJazd0SWV4RFUvMzJNV092b0Q5UTJK?=
 =?utf-8?B?aEpNNHBPVXQzOEd2eUtOWWJvQ2ZKeGpCclBTUnoydWdERmxRYitEOS9MeWJV?=
 =?utf-8?B?UEg4Ny9aYURjbXlyc1JJdEpyeTd3MlpLbi9HcG9BcHZDZkloVlJBcVdiMEkz?=
 =?utf-8?B?VnhLTVRhVVdwVW1vdGVBSzVqbkxySDN2R3o1d051U1hVSzg5U2NlZzMyNVVC?=
 =?utf-8?B?MFVQaG9saC9UWDBmcVQ1a3l5RGhJLy93UVVRcDFTZVQvVVJkMnlVWnpxc0ha?=
 =?utf-8?B?SHFBZU1IZncvbnZnZE9MdW84TE5LVGVjVGU3YllkTXl5emZ3Q1FucWZmcWhs?=
 =?utf-8?B?dW5qQnNqa0FqcHE3UGJhL2tXYXJOaFE1cHZORXNZdXIra012MlZ2enE5eVVL?=
 =?utf-8?B?dVk4enkvZEZ5eWtEUjVOTlp2MkM0UHJSYWJCdUdjN1YyMkE0NFZzNlZkT1lw?=
 =?utf-8?B?dkdyYzcweGZzOEpuVmtkZCtHMllHaU1rb0RNbkFhQkxnMTVZZ2FkWjdldzl3?=
 =?utf-8?B?MXcxcko4bDV5d2E1M2E5MTJmcklXckZNazd2UE9saWMzZHYrRHp6b2NtSHAr?=
 =?utf-8?B?cVlTWmsydTNreTNoMWwyTHoxUWlTLzVzQmx1dnJzb01XaXdrc0M3Z2hxanUv?=
 =?utf-8?B?TTl4NUc1WWNqTnI3d2hVK3VRZmhWb3ZWaGk3ZTBuRXRUSHFZQ3puMUlqSzQ3?=
 =?utf-8?B?Tk5GZzJ0dEcvYlJ6STAzR2dQY3gvdHAyMEt5ZncrbENzSFlIQlhSMm1lcVI2?=
 =?utf-8?B?SHNqelpUOCszZitpeUE3SG01am9scUZxTUpVSjVyelgrRWNhcGl3UnpnTm8z?=
 =?utf-8?B?d2tNZThweVdRTGZ6Zm1VNnJmc0xnVElyUDNoQ2QvRWU4eW1rWGxEaU9ndWxR?=
 =?utf-8?B?RXd5K3hFTzVBckRNNFNSUHFDbW92ZEZjdThOa0ptK01yaEpLS3NSRXNYQ0RF?=
 =?utf-8?B?aEp2T29aOXkyc2hoOW5vUTNZUkJjWExaeXZ0Z1pMekxoSWtmNGxxMUs2Z0hi?=
 =?utf-8?B?WDlaNHlITWJBbllidlVjRS9KSHdqUnJFTEo4MmlqTmlSalJlaXVJeHF1S0M4?=
 =?utf-8?B?cXg4UTZ1elk3WEZGRDd2MVg2RjhKOEpDcnUxRm9Bclk0VDdmYnZpbnFpN09H?=
 =?utf-8?B?VXkvSi9naUQyL2RxWFVwTlB5VVFuNHpPOE9DUjJqTEtUZXFOYVpDdlNhVmMw?=
 =?utf-8?B?bmhHZVhWcHRnb2RaSExoQm5nUmVaWmZNb0JnZlBXMWhNU3owbXo5ZDJVeWVk?=
 =?utf-8?B?cFF3VUg2amhCV21MREpKTzh4OTdBNXExc2tPL1hwdXR3K25LTm5Jdz09?=
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
X-Exchange-RoutingPolicyChecked: b7pX0oUCBYKU64vu1ayjRGSfadsnOhTakX8LR6xly5mDB6Q/ET/stK2bQsisTFDOwDnl+P/zbv92IxKSXGLNvTtakryoyrl1FgRgAcoq/vC6qCR9nHI7v++ia4pAHaJJsTqjHmjdwryshd8hPdESPVXZF9vUADgIvkx0tDrc83wed3IZzAvs1wK1gaT9xo1PMGbwlI2EBT320q1qDMQtOMv04/KVyOuuZOP2vlJGFJP1L6ctlR9cEEJ29PquUwAE51UL5mGBicKWZ56n0WLCa7jNyC24xWrT/3HhuJ906oFF2ETCUd2U2G2KLycdEclQ/VJtGC2jCLMwegcWNslX+g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b5ac3e-f363-4885-dc9f-08df3f465e10
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 16:19:16.7863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Je6AZwzkdjNJM5OtNMcJVC7o/f3Q7e0FZ1qTZiZO5C85tJO2VJsRbY6XlkCl7gecJQ0gF5LGfroZFZBLnchUOQK9P5RbUCTQkl/Db5XPEFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
X-OriginatorOrg: intel.com

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPlNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMiwg
MjAyNiA1OjM1IFBNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogUmU6IFtQQVRD
SCB2MTMgMTQvMTZdIGRybS94ZS92c2VjOiBVcGRhdGUgUE1UIGludGVybmFsIGFjY2Vzcw0KPg0K
PlRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvDQo+Y29uc2lkZXI6DQo+LSBbTWVkaXVtXSBkcm0veGUv
dnNlYzogbWlzc2luZyB3YWl0X2Zvcl9mdygpIGFuZCBpbnZhbGlkIGNhY2hpbmcgaW4NCj54ZV92
c2VjX2dldF9ndWlkKCkNCj4tLQ0KPg0KPmNvbW1pdCBmZjFmMDYwYTYwYTBhNGJmNWMzZjc4MTg5
OTJmODM0N2ZiODRiY2EyDQo+QXV0aG9yOiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhs
QGludGVsLmNvbT4NCj4NCj5kcm0veGUvdnNlYzogVXBkYXRlIFBNVCBpbnRlcm5hbCBhY2Nlc3MN
Cj4NCj5UaGlzIGNvbW1pdCB1cGRhdGVzIHJlYWRfcmVzaWRlbmN5X2NvdW50ZXIoKSwgeGVfaHdt
b25fZW5lcmd5X2dldCgpLCBhbmQNCj54ZV9nZXRfcGNvZGVfdmVyc2lvbigpIHRvIHJldHJpZXZl
IHRoZSBkZXZpY2Utc3BlY2lmaWMgUE1UIHRlbGVtZXRyeSBHVUlEIHZpYQ0KPnhlX3ZzZWNfZ2V0
X2d1aWQoKSBpbnN0ZWFkIG9mIHJlYWRpbmcgQk1HX1BVTklUX1RFTEVNRVRSWV9HVUlEIGRpcmVj
dGx5Lg0KPg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY29kZS5jDQo+
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGUuYw0KPj4gaW5kZXggOGM5MDFlNTRmMzg0Ny4u
ZmE5ZjQ1ZDU2NWNiOSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY29k
ZS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGUuYw0KPj4gQEAgLTM2NSwx
MSArMzY1LDE3IEBADQo+QUxMT1dfRVJST1JfSU5KRUNUSU9OKHhlX3Bjb2RlX3Byb2JlX2Vhcmx5
LCBFUlJOTyk7IC8qIFNlZQ0KPnhlX3BjaV9wcm9iZSAqLw0KPj4gIGludCB4ZV9nZXRfcGNvZGVf
dmVyc2lvbihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX3Bjb2RlX3ZlcnNpb24NCj4q
dmVyc2lvbikNCj4+ICB7DQo+PiAgCWludCByZXQgPSAwOw0KPj4gKwl1MzIgZ3VpZDsNCj4+DQo+
PiAgCWd1YXJkKHhlX3BtX3J1bnRpbWUpKHhlKTsNCj4+DQo+PiAtCXJldCA9IHhlX3BtdF90ZWxl
bV9yZWFkKHhlLT5kcm0uZGV2LA0KPj4gLQkJCQl4ZV9tbWlvX3JlYWQzMih4ZV9yb290X3RpbGVf
bW1pbyh4ZSksDQo+Qk1HX1BVTklUX1RFTEVNRVRSWV9HVUlEKSwNCj4+ICsJcmV0ID0geGVfdnNl
Y19nZXRfZ3VpZCh4ZSwgJmd1aWQpOw0KPj4gKwlpZiAocmV0KSB7DQo+PiArCQl4ZV93YXJuKHhl
LCAiUE1UIGRldmljZSBpcyBub3QgYXZhaWxhYmxlOiAlZFxuIiwgcmV0KTsNCj4+ICsJCXJldHVy
biByZXQ7DQo+PiArCX0NCj4+ICsNCj4+ICsJcmV0ID0geGVfcG10X3RlbGVtX3JlYWQoeGUtPmRy
bS5kZXYsIGd1aWQsDQo+PiAgCQkJCSh1NjQgKil2ZXJzaW9uLCBQVU5JVF9WRVJTSU9OX09GRlNF
VCwNCj5zaXplb2YoKnZlcnNpb24pKTsNCj4NCj5bU2V2ZXJpdHk6IE1lZGl1bV0NCj5PbiBYRV9D
UkVTQ0VOVElTTEFORCwgY2FuIGNhbGxpbmcgeGVfdnNlY19nZXRfZ3VpZCgpIGJlZm9yZQ0KPnhl
X3BtdF90ZWxlbV9yZWFkKCkNCj5hY2Nlc3MgdGhlIENSSSBQTVQgZGlzY292ZXJ5IHdpbmRvdyBi
ZWZvcmUgT09CTVNNIGZpcm13YXJlIGlzIHJlYWR5IGFuZA0KPmNvcnJ1cHQgcHVuaXRfZ3VpZF9j
YWNoZT8NCj4NCj5JbiB4ZV9kZWJ1Z2ZzX3JlZ2lzdGVyKCksIHBjb2RlX2luZm8gaXMgcmVnaXN0
ZXJlZCBvbiBib3RoIFhFX0JBVFRMRU1BR0UNCj5hbmQNCj5YRV9DUkVTQ0VOVElTTEFORCwgYW5k
IHJlYWRpbmcgaXQgaW52b2tlczoNCj4NCj4gIHBjb2RlX2luZm8oKSAtPiB4ZV9nZXRfcGNvZGVf
dmVyc2lvbigpIC0+IHhlX3ZzZWNfZ2V0X2d1aWQoKQ0KPg0KPlVubGlrZSB4ZV9wbXRfdGVsZW1f
cmVhZCgpLCB4ZV9wbXRfcmVhZF9yZWcoKSwgYW5kIHhlX3BtdF93cml0ZV9yZWcoKSwNCj54ZV92
c2VjX2dldF9ndWlkKCkgaW4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYyBkb2VzIG5vdCBj
YWxsDQo+d2FpdF9mb3JfZncoKQ0KPmJlZm9yZSBwcm9ncmFtbWluZyB0aGUgU29DIHJlbWFwcGVy
IGFuZCByZWFkaW5nDQo+Q1JJX1BVTklUX1RFTEVNRVRSWV9HVUlEOg0KDQpQQ09ERSBHVUlEIGlz
IG5vdCBzdWJqZWN0IHRvIHRoZSBzYW1lIGRlbGF5IGFzIE9PQk1TTS4gIEFjY2Vzc2luZyB0aGUg
cmVnaXN0ZXINCmRvZXMgbm90IHJlcXVpcmUgdGhlIHdhaXRfZm9yX2Z3IHN0YXRlIHRvIGJlIHRy
dWUuDQoNCg0KPmRyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmM6eGVfdnNlY19nZXRfZ3VpZCgp
IHsNCj4JLi4uDQo+CWNhc2UgWEVfQ1JFU0NFTlRJU0xBTkQ6DQo+CQl4ZS0+c29jX3JlbWFwcGVy
LnNldF90ZWxlbV9yZWdpb24oeGUsDQo+Q1JJX0lEWF9URUxFTV9ESVNDT1ZFUlkpOw0KPgkJKmd1
aWQgPSB4ZV9tbWlvX3JlYWQzMihtbWlvLA0KPkNSSV9QVU5JVF9URUxFTUVUUllfR1VJRCk7DQo+
CQlicmVhazsNCj4JLi4uDQo+CS8qIHRoZSBHVUlEIGlzIHN0YXRpYywgcmVhZCBvbmNlIGFuZCBj
YWNoZSBmb3IgYWxsIHJlcXVlc3RzICovDQo+CWlmICgqZ3VpZCkNCj4JCXhlLT5wbXQucHVuaXRf
Z3VpZF9jYWNoZSA9ICpndWlkOw0KPn0NCj4NCj5JZiBwY29kZV9pbmZvIChvciByZWFkX3Jlc2lk
ZW5jeV9jb3VudGVyKCkpIGlzIHJlYWQgd2hpbGUgbGF0ZS1ib3VuZCBPT0JNU00NCj5maXJtd2Fy
ZSBpcyBub3QgeWV0IHJlYWR5IChmb3IgZXhhbXBsZSBkdXJpbmcgaW5pdGlhbCBwcm9iZSB3aGls
ZQ0KPmNyaV9sYXRlX2JpbmRfcHJvYmVfd29yayBpcyBwb2xsaW5nLCBvciBhZnRlciBydW50aW1l
IHJlc3VtZSBmcm9tIEQzY29sZCksDQo+cmVhZGluZyBDUklfUFVOSVRfVEVMRU1FVFJZX0dVSUQg
YmVmb3JlIHdhaXRfZm9yX2Z3KCkgaGFzIHR3byBmYWlsdXJlDQo+bW9kZXM6DQo+DQo+MS4gSWYg
dGhlIHByZW1hdHVyZSByZWFkIHJldHVybnMgMCwgeGVfdnNlY19nZXRfZ3VpZCgpIHN0aWxsIHJl
dHVybnMgMCB3aXRoDQo+ICAgKmd1aWQgPT0gMCwgYW5kIHhlX3BtdF90ZWxlbV9yZWFkKCkgdGhl
biBmYWlscyBpbW1lZGlhdGVseSBpbg0KPiAgIHhlX2d1aWRfZGVjb2RlKCkgd2l0aCAtRU5PREVW
IGJlZm9yZSByZWFjaGluZyBpdHMgb3duIHdhaXRfZm9yX2Z3KCkgY2hlY2s6DQo+DQo+ZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3ZzZWMuYzp4ZV9wbXRfdGVsZW1fcmVhZCgpIHsNCj4JLi4uDQo+CXJl
dCA9IHhlX2d1aWRfZGVjb2RlKGd1aWQsICZtZW1fcmVnaW9uLCAmb2Zmc2V0KTsNCj4JaWYgKHJl
dCkNCj4JCWdvdG8gZGV2X2V4aXQ7DQo+CS4uLg0KPglpZiAoIXdhaXRfZm9yX2Z3KHhlKSkgew0K
PgkJcmV0ID0gLUVOT0RBVEE7DQo+CQlnb3RvIHJ1bnRpbWVfZXhpdDsNCj4JfQ0KPn0NCj4NCj4y
LiBJZiB0aGUgcHJlbWF0dXJlIHJlYWQgcmV0dXJucyBhIG5vbi16ZXJvIHVuaW5pdGlhbGl6ZWQg
b3IgYWxsLW9uZXMgdmFsdWUNCj4gICAoc3VjaCBhcyAweGZmZmZmZmZmKSwgeGVfdnNlY19nZXRf
Z3VpZCgpIGNhY2hlcyBpdCBpbg0KPiAgIHhlLT5wbXQucHVuaXRfZ3VpZF9jYWNoZSBwZXJtYW5l
bnRseSwgY2F1c2luZyBhbGwgc3Vic2VxdWVudCBjYWxscyB0bw0KPiAgIHhlX3ZzZWNfZ2V0X2d1
aWQoKSwgeGVfZ2V0X3Bjb2RlX3ZlcnNpb24oKSwgYW5kIHJlYWRfcmVzaWRlbmN5X2NvdW50ZXIo
KQ0KPnRvDQo+ICAgZmFpbCBldmVuIGFmdGVyIE9PQk1TTSBmaXJtd2FyZSBiZWNvbWVzIHJlYWR5
Lg0KPg0KPlNob3VsZCB4ZV92c2VjX2dldF9ndWlkKCkgY2FsbCB3YWl0X2Zvcl9mdyh4ZSkgYmVm
b3JlIHJlYWRpbmcgdGhlIEdVSUQgKGFuZA0KPnZhbGlkYXRlIHRoZSBHVUlEIGJlZm9yZSBjYWNo
aW5nIGl0KT8NCj4NCj4tLQ0KPlNhc2hpa28gQUkgcmV2aWV3IMK3DQo+aHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYxMTAyMjIxMzE0LjExOTAyOC0xOC0NCj5taWNoYWVsLmoucnVo
bEBpbnRlbC5jb20/cGFydD0xNA0K
