Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA1239A04F
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 05:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788240182; cv=fail; b=IXUmkv7iJrEzqjxD7qDwCwU3Oc4Y/U6/GwZHH5kfL89CXJ0jE8FG7Og/CCKOUYt7ZYezu9FcEmdgRgdvl2sPVwrfb1eNqLbVoEnQAaFfJFmhnN6Ga8Kzc6tKRw9hBgFYNteAyiVWVxrHd+p8+MHvU/f5ae2RgtR9OYqcFJYeVtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788240182; c=relaxed/simple;
	bh=MTnMNEPlAG/XMJttrK1WvuUaiJ4E4bBxtQ+qxdbL0rA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LyuBNgJOovvfNgDYuNJbiMu/B6MPlvkizVL3v9v99qTzjNTvJtseT77lXxGoJq4pgGPDMh38g6N4QNXQ+EKf9ga+obEKNJAc87JQAxugRarqPDy3RKHxiV9Vrfg9QVjLlo5/Ri0370mh+deWsxTX8Jbu8doGLDWQ7Pj3Vx3deQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfLe5hOV; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfLe5hOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788240180; x=1819776180;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MTnMNEPlAG/XMJttrK1WvuUaiJ4E4bBxtQ+qxdbL0rA=;
  b=IfLe5hOVNBrXTJXrvU6iREOOTsy7LQB/mtoHXY9MTyHSGUwgAWGdZXld
   A8wAGC+EEf9Vm6or2mhYWda64V8IgvOTfsMx5cL9M6ETN00bWevUej1w/
   VuAohPkQa/15tPGOPD7fB54IIpByOTA2LwDGc6LPTG963ZgZ066Bw7Ig2
   5gsVWlDMhy0gjqsRFFXwc++d4cL7p6vMbwM+xNRmvkac/BQcx3etZLwAU
   qW+g6S1eNBxVdIullICyNKA9JgLby8d3u5Y/+VsQcotG76F4SochkwUCf
   ke63WqdNylxDjcbprCwJ8h7M+CusQI89Xm2gZo849Yjji3pQl90RmB5wE
   w==;
X-CSE-ConnectionGUID: FhQooB/XRNG7mwgS3/rOeg==
X-CSE-MsgGUID: SEdGNvbbTs6Nb8pPQ+2wdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92471088"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="92471088"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 22:22:59 -0700
X-CSE-ConnectionGUID: bPw0M0JiRyOKKbNBBxvajQ==
X-CSE-MsgGUID: faUVLif8QiWPT1PNiK8R8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="272776623"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 22:22:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 22:22:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 22:22:58 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 22:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReVLBXMCY370/CfD16QtNMj57ArhGXSlgaz3azdlleFvRtRPOnkBv7sntwihAFIjMLrG5fspumQIP2vdH3GgpK1AxIvJlTU5t8HbjbrARxd63LxXAyghcgxqY/N8kFmu48b3RKI2Y3X2EjzUc4nGQkqtuhurJktz+LXPWoKhipqMB0vnzvbAvG29uHXbCJlsZDoZtzn+yKN4iZCsPIHvBiuwOjwdWjkqCKaUpR9ijRMmVRob/ez2pRzalB/bLheNmMmXh0edvc4R95QxyyuMOzzXGkOuRWad2gO30dsrwzKWmh5/RfmhV0WP9yEebpDe4f5VkSzRs2z+PES1sXPktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTnMNEPlAG/XMJttrK1WvuUaiJ4E4bBxtQ+qxdbL0rA=;
 b=AyjfQU8pGbp1mcjzXotVcWq2V6Q2zIqyr5r1Ao2KeDs5OpTS6FNnjZvpgOSLGc5jTtjJeHMYjGNSBvrCwh9pQQWfPSu1eoFEnEl+yeMx1bG1k3iVGd5JISQ07fFLA16q7BwZb9j3wto1Lc5ms5c3bHOlsemi9W1SJGfiDKQ9FIA3o2Xuho5nv2HvVhaQlIEpgSFCnpDnpDAwdY3p7q63TjHUAMU1kaHM43Q+Tzisk6WW0s7F6absS0NesillFl0KPmrRvz47UipXbHlwsLIQcTgTBLRbEWqqiROfnygvG4UqpNR3f+eBcvEgKDLkubAmIVkbTtAz1W25tar1ZT1MsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DM4PR11MB7376.namprd11.prod.outlook.com (2603:10b6:8:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 05:22:49 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 05:22:49 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V19 11/15] drm/xe/ras: Cache disable_vram_page_offline
 policy at init
Thread-Topic: [PATCH V19 11/15] drm/xe/ras: Cache disable_vram_page_offline
 policy at init
Thread-Index: AQHdORUIakLxismuWUmfY51+56j0yLa33L8AgAFUzxA=
Date: Tue, 1 Sep 2026 05:22:48 +0000
Message-ID: <DS0PR11MB871844479E6984601A679D5C81A82@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-28-tejas.upadhyay@intel.com>
 <20260831090232.AB1711F000E9@smtp.kernel.org>
In-Reply-To: <20260831090232.AB1711F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DM4PR11MB7376:EE_
x-ms-office365-filtering-correlation-id: 7e537c93-148f-41fc-41cc-08df07e91021
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|6133799003|18002099003|22082099003|56012099006|38070700021|10067099003|11063799006|4143699003;
x-microsoft-antispam-message-info: z8EhJLjQaJ27tIZ1BQcFWeFXfs48St8UHYJLQTAvpDpnjAlf4/3oAiT9OimOIAwd3CYUvfwQCMHx+J/NOgAqpeRiuoSx9Sh6EVKbCiHXAwS35yJovOXBKThFI0y4OgRoJnrPh1OvJiMI6KLJCK11a/jhfpSrPU2edI/UTzHzwRIMtdFZVzmffYGfhYzqomiMbNmRTDCixvsHFqGIO3YUbAXNa2qXtbk+tA/RGzr2CEfLt2SyGUa1w0NZyHcmmwr6kU2BFEzEVdl/8/sGEfY1G4Jq5UTRlQ7Kig3GQx8h9Q+izlj7/dKo9wa3C0uMXDPZI8X/bBCj0lNjQvYWM+E0Pn8JsRHuKbSSkpewiGXr3xCkXk3A9vQZy5Z6bZJFG8pxI9g94J/BwpYTL1rXjLisg5mOuk8CS6B/wap+PN4JLalhgGDGhipg4IKIfLwYJXD0wJOJA0dn/Fg248kkM6JiuXI/Lbq4hnroBoJhAMlUHNf43UnbJ7oW9olLzIacYpR4Olzrj4ZS5iIrM0UtHz1tarLPE/FmpLwcZtHwpvzh+Z4IIXYfk0reY8tz3a30KfNcUG4p7Vl6adSfdkH8+cO53fS7WMeA2OD52lhdmKprLNi+gVgPJEQPcTycc3s9Hkc7rMB/U0bIhv1xuBptYYDu4sWWQ9w7XqBJyMis4yntn9k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(38070700021)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0dUNHlWKzcwNVd6Q3FzVDJUMHc2SXZFNmhkTS9IOWZZMkZzZzlEaUJLY1Fy?=
 =?utf-8?B?U0thQUNOY1VKdXBVei9XTUpySnRBdHFXaHByemJ6UGFkYWJ0RlZINWN1cElv?=
 =?utf-8?B?QVJKS1dKeU1Ha1VFTFdnRDFURTlEMWJVQ09YWEs3cXNNSDlLR2d4RjJZVnZ4?=
 =?utf-8?B?S25VbCsrRjBZaEFKd2U0cUpmdDk1WmJwQmg5dVB4YzE5K2FGSXAvYkoxUkhr?=
 =?utf-8?B?TVJMaUFJS25Bb1BjU2FuMjdmdkxlQU1iN2tuR25wTkxXN2Njdk82Z1FBbnB2?=
 =?utf-8?B?blRRc3FYVkMxR0lOMUFEa2VMQmRCaWVlc3pwSE9EbTJPQ0NGOGtCQ09BTmNa?=
 =?utf-8?B?L1pMRkhrcGxqOTN4dStxdlRZWUcvRGdNWWZTUkJ3eFU4ZS9nbGhzaXM4YTdY?=
 =?utf-8?B?Rm9yTEJCTUNNV0ZrK0tTRHc2YWNoWHBlU3FGdFpHeml6M3ZkdEJxdnh6UUdl?=
 =?utf-8?B?VGRIZnRIaG1oeC9wcmhybGc4QlkwaDJKMmNYRUUwak5SOEJMS1NiV3ppREVu?=
 =?utf-8?B?TU1CSk10c3A3V2Rld2w0MHZzZWFsd25HbnMrdjRtMFA3Y2ZsaWo0Y1hkeDhZ?=
 =?utf-8?B?eEVXTEVCZWc1bTFHek1zbnJrWUZta0ZCdEF2YkRyUFppbytESzVrRGJSV1dJ?=
 =?utf-8?B?dkVhczZQMGt6QVZvWnFHWEErNExTYkdFa2VpRDRqUGFsMm1SNUNrR1FkWGx4?=
 =?utf-8?B?THNXVHJoTXVNSWpjTTR5SmJIRHpQMkxvRkY5TWtmY1A3Q1JLeWU3ZFhmMUlr?=
 =?utf-8?B?V3YwU0M2aXR6Y1dnU3JDeHNJb1IrempJdHM2UEFBeWVJTmwwdVNBV3JQbHVa?=
 =?utf-8?B?SDJ6T2dGemhydksrR2s2bmNWemprMGdraXAzR25sT1V5MHJEa1BmbU4zdzBS?=
 =?utf-8?B?aHFuK2tWUUFlZVlraFVjZy9HMXE4T2o3dGdVczJLSnppT0pIMytLcjJDRVdO?=
 =?utf-8?B?NjBkY0VkL0tTRjUrQStBZml4cUVLTEE5K3NPeVdnRmJsLzErWjA2WjFYd1hh?=
 =?utf-8?B?ODZ1c0thUGh0dVZta2N2SDU4SnpkRU84clhDMm5GcUh2THdWQnlXR3VyejVq?=
 =?utf-8?B?SWlCYUhsOWpRbHFoWit2Ky9Qcnh0bnczeWxMQlU1UXhsdUVnSVBEZC9sM3RL?=
 =?utf-8?B?Qjh2UVJna0Q4SlhENTV1M0dua2RScnFWejZpVlZzS1F4Y0xkUGlxNko5MzRq?=
 =?utf-8?B?czgvNTZ6RVF3ZFBxdFlCZmNCaUlLdFRTWisxRVhWZFI1eUk0UURXNVF5d2hP?=
 =?utf-8?B?TllYNzN3amwvYk9VcnJrbDhBaFFuS2VRU1J6L1JPbGN5NWNaYVB3K2lZeTN4?=
 =?utf-8?B?b0lxYzRldW50UGdYeHVHUlN0SkNYNWE2T1I0WVdST244UCt4d0JVT1c3dXhn?=
 =?utf-8?B?My8ydjdoTkJWNHZkTnR6UGNaU1kvd1IvZFp5RllES3diOC8zZmoxTG5sSmNo?=
 =?utf-8?B?SFdwL1JLU2FQL1hURWdEWTVBcmtkYTlaNWIyZEpzZXpubHZaK3F5aXJtd0ly?=
 =?utf-8?B?WW5nYkZ6QnZsRk5Xa3NPQUZBeUlCaDh5b1ZSMXIzUHBNTDZEZGhKTmJyaWJj?=
 =?utf-8?B?Nmw3SlNWb1pSUVRSTXlSeHB4OGtEWXdNaDJzaU1YWVloUCtIOXh1Q2Z3d2d0?=
 =?utf-8?B?andqTUhnL3kvbVMxcHVteHVsZmdXKzRLS1krTzV1VW83N1QvRGpsL1AxR3hV?=
 =?utf-8?B?dDdpazcxd1h3RXppUUJaRktQdWY1TXU4bWtOUWNUUFNMVEQ2RVBjUkRwQTlG?=
 =?utf-8?B?di9rSUtLK0REOUd2U0JUTVI1NlhnZWVHcW02ck1Xak5La1ZEZHh1WlQwZHQx?=
 =?utf-8?B?cWpmU1d2aFc0Slp3ZDEyVFMvNy8vVEpnTzlQRU0rQis4aHFYcytWUEhQZS8y?=
 =?utf-8?B?alZjUUFZVEprbG9jbWZBZlhFYnYyZ2NLeU1tOWxlbDFzMmlHd01ZNmllV1RC?=
 =?utf-8?B?U1JKaGxabFJOaWMzMkxTVnUxRTExT2NITUZTSml3em9ubVpZc3JMTm92cEts?=
 =?utf-8?B?WUtNTU0yU2xXTTlIN014cCtSS05CMUVpQytVRUJyTTdHSVZjbE9hRktxUWdG?=
 =?utf-8?B?WVE0OFEwclhrMG5Ic0Y1WFVTM0FGNGJPcFh0V3hxdWtycVJ5QlNQQkxxbnJQ?=
 =?utf-8?B?dGJBM2s3anh5dkIxTVllRHNwMWRER0tnQzV4TCs3d0tlVnliK1ZKMmJEekRW?=
 =?utf-8?B?TDQ0cmxYOUxJTkZCaXdLNUdSeTNTcGVFUDFmSmtadDN3OThPTTlkR2huMGxo?=
 =?utf-8?B?ZjhVTnZPSzcyeC9RTXk5TWtJNHdmT1ovbTZ0K0tqaVhROGFaejJicVNXMUFj?=
 =?utf-8?B?MjFpbEpqMlFDWHNQZGFCdjNLb09TZHdFZUw2SkVqeUdwVjAyck5iUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SWJACrEBlO7iYNu+eCTa8qDf/AG5xICJ0evIavI8YYD6XV8BDfwO9Zp9M3TQ5AvzTlw3zORpNT1gRptNFUv0qO7Y1JshYkfevgxbFDgBqHeQZabbqF3LqtaRH7XG1jAKW6ICMgGBfU1l2y3B9NvRwzdvDhrVDom2zmX1mW6YkHH8MyjFsBIniE/P5WCL4ICWqrQBMO4dUtqfBKtEPoz76yonkm54fx2EOgOrcWPMczdBTR3zx39h2Zz0Vs6lCmI7ieQgggYgagrKhMa+cItzFsXGvSvXXZkTKCXbM7jz+lIRUhxydJ1otN8cU3i+vxX0Ei2FPmpohh5CHyh63hgWOQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e537c93-148f-41fc-41cc-08df07e91021
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 05:22:48.8817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BQP5IvAjIUWwnKeJPbAR/IaBjaig5GeZ074WsKWP6zUTJCwjpuNs32/mtGKcQVr6++qgujBx4qzxrBv9HdG3MQvqtG4vETnAw/KMetfeuTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7376
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMzEgQXVndXN0IDIwMjYg
MTQ6MzMNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0K
PiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggVjE5IDExLzE1XSBkcm0veGUvcmFzOiBDYWNoZSBkaXNhYmxlX3ZyYW1fcGFnZV9vZmZsaW5l
DQo+IHBvbGljeSBhdCBpbml0DQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9u
ISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKQ0KPiB0byBjb25z
aWRlcjoNCj4gLSBbTWVkaXVtXSBJbmNvbnNpc3RlbnQgZGVmYXVsdCB2YWx1ZSBmb3IgZGlzYWJs
ZV92cmFtX3BhZ2Vfb2ZmbGluZSB3aGVuDQo+IGNvbmZpZ2ZzIGlzIGRpc2FibGVkLg0KPiAtLQ0K
PiANCj4gY29tbWl0IGZjNGVhNDdiOTFlNDVjNzU3YWFkZTdkYTZiMzU3NWQ5NzJmMGJjNWYNCj4g
QXV0aG9yOiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiANCj4g
ZHJtL3hlL3JhczogQ2FjaGUgZGlzYWJsZV92cmFtX3BhZ2Vfb2ZmbGluZSBwb2xpY3kgYXQgaW5p
dA0KPiANCj4gVGhpcyBjb21taXQgY2FjaGVzIHRoZSBjb25maWdmcyBhdHRyaWJ1dGUgZGlzYWJs
ZV92cmFtX3BhZ2Vfb2ZmbGluZSBpbiB0aGUNCj4geGVfZHJtX3JhcyBzdHJ1Y3R1cmUgYXQgaW5p
dGlhbGl6YXRpb24uIFRoaXMgYXZvaWRzIHJlcGVhdGVkIGNvbmZpZ2ZzIGxvb2t1cHMNCj4gZHVy
aW5nIHBhZ2UgZmF1bHRzLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jhcy5jDQo+ID4gaW5kZXggZDI1ZDI1
Zjc3NTMxMC4uZjExYTc0Mzk5MDA0NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcmFzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmFzLmMNCj4gWyAu
Li4gXQ0KPiA+IEBAIC04MDQsNiArODA1LDE0IEBAIHZvaWQgeGVfcmFzX2luaXQoc3RydWN0IHhl
X2RldmljZSAqeGUpICB7DQo+ID4gIAlpbnQgcmV0Ow0KPiA+DQo+ID4gKwkvKg0KPiA+ICsJICog
VE9ETzogUmVwbGFjZSBwbGF0Zm9ybSBjaGVjayB3aXRoIHhlLQ0KPiA+aW5mby5oYXNfZGlzYWJs
ZV92cmFtX3BhZ2Vfb2ZmbGluZQ0KPiA+ICsJICogb25jZSB0aGUgZmVhdHVyZSBmbGFnIGlzIHBs
dW1iZWQgdGhyb3VnaCBkZXZpY2UgaW5mby4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKHhlLT5pbmZv
LnBsYXRmb3JtID09IFhFX0NSRVNDRU5USVNMQU5EKQ0KPiA+ICsJCXhlLT5yYXMuZGlzYWJsZV92
cmFtX3BhZ2Vfb2ZmbGluZSA9DQo+ID4gKw0KPiA+ICt4ZV9jb25maWdmc19nZXRfZGlzYWJsZV92
cmFtX3BhZ2Vfb2ZmbGluZSh0b19wY2lfZGV2KHhlLT5kcm0uZGV2KSk7DQo+IA0KPiBbU2V2ZXJp
dHk6IE1lZGl1bV0NCj4gV2lsbCB0aGlzIHNpbGVudGx5IGRpc2FibGUgVlJBTSBwYWdlIG9mZmxp
bmluZyB3aGVuIGNvbmZpZ2ZzIGlzIGRpc2FibGVkIGluIHRoZQ0KPiBrZXJuZWwgY29uZmlndXJh
dGlvbj8NCj4gDQo+IFdoZW4gdGhlIGtlcm5lbCBpcyBidWlsdCB3aXRob3V0IGNvbmZpZ2ZzLA0K
PiB4ZV9jb25maWdmc19nZXRfZGlzYWJsZV92cmFtX3BhZ2Vfb2ZmbGluZSgpIGlzIHByb3ZpZGVk
IGJ5IGEgc3R1YiBpbg0KPiBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuaCB0aGF0IHJl
dHVybnMgdHJ1ZS4NCj4gDQo+IFRoZSBpbnRlbmRlZCBkZWZhdWx0IGJlaGF2aW9yIHdoZW4gY29u
ZmlnZnMgaXMgZW5hYmxlZCBidXQgdGhlIGF0dHJpYnV0ZSBpcyBub3QNCj4gc2V0IGFwcGVhcnMg
dG8gYmUgZmFsc2UgKGFsbG93aW5nIG9mZmxpbmluZyksIGFzIGRlZmluZWQgYnkgZGV2aWNlX2Rl
ZmF1bHRzIGluDQo+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jLiBCeSBjYWxsaW5n
IHRoZSBzdHViIGFuZCBjYWNoaW5nIGl0cyByZXR1cm4NCj4gdmFsdWUgaGVyZSwga2VybmVscyBi
dWlsdCB3aXRob3V0IGNvbmZpZ2ZzIHdpbGwgc2lsZW50bHkgaGF2ZSB0aGlzIGhhcmR3YXJlDQo+
IHJlbGlhYmlsaXR5IGZlYXR1cmUgZGlzYWJsZWQgYnkgZGVmYXVsdC4NCj4gDQo+IFNob3VsZCB0
aGUgc3R1YiBpbiBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuaCBiZSB1cGRhdGVkIHRv
IHJldHVybg0KPiBmYWxzZSB0byBtYXRjaCB0aGUgZXhwZWN0ZWQgZGVmYXVsdCBiZWhhdmlvcj8N
Cg0KQWxyZWFkeSBjb3ZlcmluZyBpdCBhcyBwYXJ0IG9mIGFub3RoZXIgcGF0Y2guIFdpbGwgYmUg
dGFrZW4gY2FyZS4NCg0KVGVqYXMNCj4gDQo+ID4gKw0KPiA+ICAJeGVfZHJtX3Jhc19pbml0KHhl
KTsNCj4gDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3DQo+IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MDgzMTA2NDk0Mi4zMTU3MjAtMTctDQo+IHRlamFzLnVwYWRoeWF5
QGludGVsLmNvbT9wYXJ0PTExDQo=
