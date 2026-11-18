Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795031257;
	b=m6zLl1aTtrRFhReh4sxxHaPMafjdjQ/mv2CVSc86L8RsxehC+7PTy48P9VqPHyY+F9IY
	 MYMyNLUEtTElDEY5RzicbV99ku0dxvaZ86a/6PHR2/nNM/oDm42jXTs0Ttd2L+59EkTVw
	 2i4uimeM+/BWjgWe+bcELX+vXcimrOanuHafMoLhWSTL+56dluT6GJQzJ+5EuVVQP3AXl
	 IDvngVIyrlaE8ifmZOebu8Na60vdZoJv9XJ4VZk3dMgczMiRC0XCwfjW5jj5b1pbx4WsF
	 6KBpxvUTd4se8Zp0aQ+cOJ/w4BLZWC+n1PazLvkhSteafegHjx3pSkpGdotz7zbDXjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031257;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:Subject:
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
	bh=bzdAjZnAugWbAKLrkuRV+3fpesS+UKLb1qshJJJt2LI=;
	b=0k5iaWj3Szdl/Pkkk/uV7PfcT+0fgMcUA4Q23SPJX1AwfuNuRn1HD3y/suoXgPHVXIER
	 968KS72jRFLpIs5lxrTtPjd5IQjz3a+Wy61XsehF7bEZ0eQ29fFnFVd1CXuDCKti3xPus
	 ob5oD/WgESPMI56x9M6/Xiyp+/95O7Wf19W0tHHkhCDGP6bDxzPq2umfbUAVMUU+gGES4
	 mP1nbhWCjhZehRw8VmZUYk7Owz9HEt/UKPUka+wupUZmsuoqX6S/SANMs4kfztB09p2gX
	 6cRlGG9uDZBjUNafx8QaHuy1vVdE6hwckmy8e87YacinMZMSeAKeJXCczgT5gHZkFDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iqnSaH6n;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DbZdzi7X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F40606A320
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 19:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F40606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iqnSaH6n;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DbZdzi7X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795031257; x=1826567257;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=bzdAjZnAugWbAKLrkuRV+3fpesS+UKLb1qshJJJt2LI=;
  b=iqnSaH6nLzREDz58ICMmooh5SXRgST5w3kGlL98nh6OjT9airEHku4Xk
   Pjd7bFDJ8vlfJeEW+XNmZmY31aOsrVd2vlv+ZpdvaYnDRs0hnRQ83ciyF
   jnZoMsQPcTgSPEtoGF4XbmquovnmBoXu/YWAazj4Cwj9wSspHTROp6Iw0
   CBizR/vpg1rsd/V1rs81UoxPR3s+PYwceRFSdM8KCMs2SCaedz375ZYRE
   LKa0aSNguPEUNFbu3hmV+BBmteFTSAx0boqbXiRwfRRePGfcciV0z8dHl
   yamZ6oZjhn6B/UXr6C8v5Yk5ZF/0lUJfqc66YydNVtZeIAG0Mh+cX9cI0
   w==;
X-CSE-ConnectionGUID: Yo99F9PRRlO8T5VOGYuDFQ==
X-CSE-MsgGUID: o0PTe9SgTbCJgAMyYUUfFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3757582"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3757582"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 11:47:37 -0800
X-CSE-ConnectionGUID: Ve3L/CdhSOyDg3ZPFfVdqA==
X-CSE-MsgGUID: QhQsvQNsQYeKELiVcQFKrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10621167"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 11:47:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 11:47:35 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 11:47:35 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 11:47:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9N64bguGhUQBSwSfWXDHBSYnzR3GZ4zv1AsAzccSKkhtWxq6A2MgGTd5g6b/uBcBNm7PPoP93aH1nBQcWUSZKUTXqGTS2xvAqKEFp6As+esaqINWXpNTtnasYUiSwcYO5tJwQeTOunlNmp4RHXHbvddW3Bsv5LiilhHR+0TFExuiNk10j2+Xw1kDxVWbrXTRThhug2LDurY6riI4YW2D4iVrXN0L7PZapTOfpsK2r2HnIhQKwVIjovLm0QMpayhWYJuvT5HwnMpIJKtKoiVg+L854t6fEwtIy9704xD7hDD0dO2OkXRaYffal0yNq1PIuwSCOCG+Ou0oFDFTWiBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzdAjZnAugWbAKLrkuRV+3fpesS+UKLb1qshJJJt2LI=;
 b=SiuoHEDtWpJioSyyJTD0uuD1Hfky+TwP1AGt9EFzSYRxj/+IInD+9K9/xAnqVkRNFxNIJwQ0aP2ivPU1OZYDYt8MqGHUIfdtPYeKEA6SZcCXocU9xxfcD1t4B/6tRH2AjIqRZchbl7PoTLkw83+6HGV9o8LB4lX/bLzbzhnkKAi+dNLZVNR1n+aaLPMPVqAFQcTnj6HgalnIJw9Ng5n4nkI0m3LaoCgrdduwIiWoGR2UVGUSDi19+3ldWhD0T2UU+IowxW8pLBIvuuz7lUX4p5ZqgoQehaWkev733Qo4gvmAU/me4XBWNveem1/O6VUiKoR+SoymxaPuANA5bcQLXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzdAjZnAugWbAKLrkuRV+3fpesS+UKLb1qshJJJt2LI=;
 b=DbZdzi7Xpw6QPUDH0ij6AuzxJWgfjyol9XcDgECi22BOIn2DDKYKO4KJfqesDaQKwL+YfRhK6SkQYfQKNJ2xdf2AlOtD7dQ3rqz9aXHXurMt7DSmCuI0oiZ9F1HKRn4a39ATUrNLEh1RDUR4JBf3IOsNeglSPVBSpyLCkNu6+IE=
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by CH8PR11MB033160.namprd11.prod.outlook.com
 (2603:10b6:610:709::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 19:44:28 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 19:44:28 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "Jadav,
 Raag" <raag.jadav@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/wedge: Introduce
 xe_wedge_mode_is_no_reset()
Thread-Topic: [PATCH v2 2/2] drm/xe/wedge: Introduce
 xe_wedge_mode_is_no_reset()
Thread-Index: AQHdd3IUsLPpBKSpCEyyjKcNVNjpJ7cz+GSAgABDJwA=
Date: Wed, 18 Nov 2026 19:44:28 +0000
Message-ID: <13ec1cb9db976245c120df4f8002e1bf5466729f.camel@intel.com>
References: <20261118153154.2024753-1-raag.jadav@intel.com>
	 <20261118153154.2024753-3-raag.jadav@intel.com>
	 <sashiko-outbox-221366@kernel.org>
In-Reply-To: <sashiko-outbox-221366@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|CH8PR11MB033160:EE_
x-ms-office365-filtering-correlation-id: 5e185c26-f63d-4760-c47d-08df45ac5b87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|261022075727099003|10067099003|11063799006|56012099006|4143699003|261026140227099003|261028144727099003|261022105027099003|261026121527099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: LOu1Zj91sefvHZ2gFdTta0uybqS7mC1iYoIHtWEw2nQaHtSqgrI+44LALXDXGXTxL4SovlKTMb1oIn22z2txbpdDy0Gy91jM0PtRA6lKfPW4p+MEuKd//phUhTE6jjIbsmzLUEQtI3ybhT+QOpYa4kK8fWc3YJlU1sUT8wBFC3nZzlIGnw3zgcUMTZhya/9xhNtA4tY4RoTmZ5HnObR7DPiQ7QI36toSDrwcW8TMzNw3YNI/GmXKM6UkTBRo2PqbDy2rTwLvM5J2pSQZ0OqnGHNcaXGnQYdt+0FVpI98sglb8mf3aQgl/RzqGBGPAinAb7T9HtVOQCo4Fic307lrp7SadAkDhb7cnS0jlfZd3sNW+W9QbX15l0Dh+hq6Z4cKkGrhgdxQCexOsX/xL78SNvRgCik6Oh5GXJPj2LtZHmUhh86AXoJwn/ZY7o2tYamL6x7npP0CgqYkhbn2+A599EVrmPBRa9kqnEYGnFQQH0s7+Mz6Rj0Yrt3SMEL3ILONch8sKfROz4b8Yt2Hy++6YEv1mg+GmzwPWptIsvx2kKynVPlYlzubxGSj+8CkR4GARLJp0Pi1Gx40Yj5RXncncCXCu0JF+4FlJEkb4bTp7BD5Q8oAJFyZolOVSOU+dReeZp5d10UhOLZKIqvFQUyGN8ehzrGsIjVNs2hAOYIzpEXfV9fgk846Rj68TMHzwfsr7JnnhvV/XiNuP6iJ4XoQhdRL4ul20RlJpRvtOkLsGXo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT6PR11MB072844.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(261022075727099003)(10067099003)(11063799006)(56012099006)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WCtCeGphY2FIdVFiQWJraVovN0xUWmJPcXBhNnFqRDJHa0ZLWVRxblp6dEdD?=
 =?utf-8?B?VFF6RExuK0x2bCtVamtHUUdNbjJpdmEyUUs1UmlWK3FkOXlYckhIYnU0R3hS?=
 =?utf-8?B?MCtNNStDNGQzNVVsUFdqajR6K2FaWFcrV2t4VTluZ08vOXRCemR5WWpIRGR1?=
 =?utf-8?B?aUt0MkttVjYyM05TQUptUm5pM1dKUkR3WmNNVUZDay9OT3RIZjFacWpQL3lD?=
 =?utf-8?B?bmk4amlETU9XUkhHVm9wWEtaK0xtVE1iVFZ2emQ3ZGV3ZTFwNWYxM2RIbE9y?=
 =?utf-8?B?dy9aY2NHQVQ3aXpzNjR4R1ZoNloxNlEzcmowL0VuSUhROFVqZC96L3dMaUVi?=
 =?utf-8?B?MXBuckRrS2JxVDdtdS9rQUFzVi82NlQ5K0xkWDk2cWt0bisvVDVNUHR2TzNJ?=
 =?utf-8?B?M2F1QjFNTDdMY0FiWmdobkk1V2t5eWlQS3JYdlhIMGVsdldMRlpaS1Boa3c0?=
 =?utf-8?B?OTNJL0R1RUIzZTNzVzBoLzcwRTFVeHNCc29vd0RCRG9RYnZ3ajFjb1BQQXIw?=
 =?utf-8?B?TE82R2FsbWh0VVBBUDZ4SHZGcEN4bkJIRVhtd0M3U0R2K1dJUXZjVzlxV0dX?=
 =?utf-8?B?a1R6Nms5akJONHpWWTFKZjd0KzcrWURSdHp6RGNlLzZwQWxTMnNzckZhb215?=
 =?utf-8?B?T0N6TjlRNFdvR3NmclJ1My9tNVNpb0h4UjgrREFIbm0zNUFudU51NS9oclY5?=
 =?utf-8?B?SjFQcUxkcFRycDdZS0h3SzJ2VlRQSGhnN0NJS0VDRDcveDV4Z3Ayc2lQMTRM?=
 =?utf-8?B?ZVpnMVBYYk1qRFpHSGxoU1g5TGREZThHZWx0UkJTZkM1SGJTY2c1RGh3OVF4?=
 =?utf-8?B?QStjVWI1TWhzZE9UWUN0Z2ZIZjVyRG1VRnI3OXBWbGpCd1pnMUxEV1VVSW9T?=
 =?utf-8?B?eTZURy9CN25hNjF1cS9EOUtObXhWcWpOUTFDV3BXR3FYZGxMYml6aUQwaUt3?=
 =?utf-8?B?d2F4ZUxyRExudm83UnNUS1lQS0E2bmlDNm9PVXdDMGxHc3BPOG5EcmdaQ25x?=
 =?utf-8?B?cmZWVEVrME9DWFAxb3FIRjBhR1NtcG5VUmJUTzJmYmIzMURheTZVdzY2Vnc2?=
 =?utf-8?B?R2tBVzlaQ1JTcjNBTEZmWmhCNXdKdHhhMVlab0VtYzdhdEY3UTBLOXo2Mmpv?=
 =?utf-8?B?Y3d0SDl5Z2ZyNThrRmVwL05UZkdHZlhuU0xKYTQyVjZEYklmbFRwdXIyZzZY?=
 =?utf-8?B?UVlaWFdQaFFnMkNSVHhaU0pRU1ZtU3dZWlFKdXFMTkhDQ3JJR0lqQTVnLzVI?=
 =?utf-8?B?aWcrNExWNTdrOTVWR25LUkNhMVE0UURYaktSekEvdndLellROGlab2lmeXdG?=
 =?utf-8?B?bFZwMGFJL3cvbmM0VkxHN2F4UURuK3llaW5nb0lxQWRFZEJwdExqK01UNlBr?=
 =?utf-8?B?eDJUN0p1YS85YWhRNm9XejVxMDNJb3dDQ0REbjJUbmVkNE1GbWE4Y1BxSUdW?=
 =?utf-8?B?cW5PT2c1YnJPTUlVOU9lTnVycVZaSDdxdVdHVkJ0SlF4QTlhdUlIdHZiZ1Zj?=
 =?utf-8?B?aVNPMlJJMURNNFc1N1R1b01SR0FEbVd0dkhlMU1velYyZzlLUjhVWk84RlFZ?=
 =?utf-8?B?TUdkMDBQQ1hpb1YybmpvSi9FRXRueGR3dWVERlVlZmV4dlhLdXlxR1ZCZWRQ?=
 =?utf-8?B?MHNiNHFha3hsdmNsMm5PUmZIa09RenBZT1RxT0ZDNG5WOU8wakZZWFdBWHht?=
 =?utf-8?B?VGt6cStWTDFoU3RRWXRoMzVPL1VzSllKd3hZeERoNnVvemRkenJGTHZiMHdu?=
 =?utf-8?B?OUpiOEU2YnJVSUtsempqdzZPSWZjTnYzTzJDbXRCVHpoZjhtbkRBZGpFWk1t?=
 =?utf-8?B?V0dya1o5SVpxSVZ3Yy9HMnlEeGxoY3lOSzZmaDF2bVRWZnA2bkdzdUFsYVB4?=
 =?utf-8?B?aWp0Y09xRFBnS0UyN0VEUDBJZFhpYTJVTVVoU0ZYUlFHNlVnT0hyQW9iUHlR?=
 =?utf-8?B?TFQrWnl4SjB4K2daZG41UnJ1SUpPYTY5R0ZXcmJLa09nUGs2WVIvR3V1WXRF?=
 =?utf-8?B?VnZvUXRkNDhyLzJuMXpNZzlrMG5jQnFWNjVOd2RnTDRNYkY0U2RHbFphU2kr?=
 =?utf-8?B?WEpCN2JVRngrS2pYdVdkaWxQeTdzbTVQMlBTU0NMM2VhMWMydlIydlhqaTlZ?=
 =?utf-8?B?SGRJVVNCbllvQjE4NlFoVk0yUWl2NnFXVWNsTGtBRExWVWIzeXFsM1IrVXps?=
 =?utf-8?B?c0Y1VWhNdEJhV2xoa2swQUM3NWhWbFFJSlduZGc5UzYwL1BxdjJQRjBUdXBP?=
 =?utf-8?B?Tk83a29ZQkxzV29aSTFwbnpqVTdnUkp5enVqZ2MzU0NWOE9RSlBMUmR1RDRr?=
 =?utf-8?B?ZnRJKzd1Tm9Wc2dBZHUzWnc5ZVZidUl1TnBqalZKaTdhcEVyVjl6REVQWlMx?=
 =?utf-8?Q?vZKJaf92vlYw+cbE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF0070BBE7385B43809C685C8E9FE2FB@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: V2Ta+F8xFppkUX2Pbb2JoFPIuTZ6eMJDCcZIPg8VT3VNcRWDfnv8RPH5fL6NrMUYDDyyjdX8zk/M6pOZ5C9eqzIEl+KJwwmq4XeN/MYxFOez9RHx2ONPDTzwrb0zNv/14htCVDO7V9j1TTehjzLXooLc0YdD9zzeIT85Idj4frImwnBD4nm702yuWcEgZ2Ezv3DuqpliRDe94w+ap4ajeFe49vHdoiV92eBDYWve6Bo/UdCVusflfNvuNF6hjYzmBHgvqWxTpRpUi/knepkk0JSrQOZtVupL5w+ejSOOzge7fPiC2ng+duYdl2r0jw/kGKuhWR7Eb6hDIjSWGhCpfA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e185c26-f63d-4760-c47d-08df45ac5b87
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 19:44:28.1623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X7AxRX8LSMDPNNOWuwrtlTSkPIsE0niL8aLZStIfU2Nzptun226E7+D+rOq4PV6Skm/QqxNOmJxCeHOgcFsjnCeVxXx67PYCedLr+lfpd6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB033160
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTExLTE4IGF0IDE1OjQ0ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAxIHBvdGVudGlhbA0KPiBpc3N1ZSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0g
ZHJtL3hlL3dlZGdlOiB3ZWRnZV92YWxpZGF0ZV9tb2RlKCkgY2hlY2tzIGN1cnJlbnQgbW9kZQ0K
PiBpbnN0ZWFkDQo+IMKgIG9mIGFyZ3VtZW50DQo+IC0tDQo+IA0KPiBjb21taXQgZjAyMmFiZTkw
MGFkNzUzOWY5YTVlMDJhMGY4YzQ0MGQ2NjAzYjMxMg0KPiBBdXRob3I6IFJhYWcgSmFkYXYgPHJh
YWcuamFkYXZAaW50ZWwuY29tPg0KPiANCj4gZHJtL3hlL3dlZGdlOiBJbnRyb2R1Y2UgeGVfd2Vk
Z2VfbW9kZV9pc19ub19yZXNldCgpDQo+IA0KPiBUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGEgaGVs
cGVyIHhlX3dlZGdlX21vZGVfaXNfbm9fcmVzZXQoKSBhbmQNCj4gcmVwbGFjZXMNCj4gb3Blbi1j
b2RlZCBYRV9XRURHRURfTU9ERV9VUE9OX0FOWV9IQU5HX05PX1JFU0VUIGNoZWNrcyBhY3Jvc3Mg
dGhlIHhlDQo+IGRyaXZlci4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV93ZWRnZS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2VkZ2UuYw0KPiA+IGlu
ZGV4IDgyN2ZhZTA1ODk3NmEuLjNiNGM4YmVlNjc5NzIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3dlZGdlLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
d2VkZ2UuYw0KPiANCj4gWyAuLi4gXQ0KPiANCj4gPiBAQCAtMTg0LDcgKzE4NCw3IEBAIHN0YXRp
YyBpbnQgd2VkZ2VfdmFsaWRhdGVfbW9kZShzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4gKnhlLCB1bnNp
Z25lZCBpbnQgbW9kZSkNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKG1vZGUgPiBYRV9XRURHRURf
TU9ERV9VUE9OX0FOWV9IQU5HX05PX1JFU0VUKSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB4ZV9kYmcoeGUsICJ3ZWRnZWRfbW9kZTogaW52YWxpZCB2YWx1ZSAoJXUpXG4i
LA0KPiA+IG1vZGUpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IC1FSU5WQUw7DQo+ID4gLcKgwqDCoMKgwqDCoMKgfSBlbHNlIGlmIChtb2RlID09IFhFX1dFREdF
RF9NT0RFX1VQT05fQU5ZX0hBTkdfTk9fUkVTRVQgJiYNCj4gPiAoSVNfU1JJT1ZfVkYoeGUpIHx8
DQo+ID4gK8KgwqDCoMKgwqDCoMKgfSBlbHNlIGlmICh4ZV93ZWRnZV9tb2RlX2lzX25vX3Jlc2V0
KHhlKSAmJg0KPiA+IChJU19TUklPVl9WRih4ZSkgfHwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKElTX1NSSU9WX1BGKHhlKSAmJg0KPiA+ICFJU19FTkFCTEVEKENP
TkZJR19EUk1fWEVfREVCVUcpKSkpIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHhlX2RiZyh4ZSwgIndlZGdlZF9tb2RlOiAoJXUpICVzIG1vZGUgaXMgbm90DQo+ID4gc3Vw
cG9ydGVkIGZvciAlc1xuIiwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBtb2RlLCB3ZWRnZV9tb2RlX3RvX3N0cmluZyhtb2RlKSwNCj4gDQo+IFtTZXZl
cml0eTogSGlnaF0NCj4gRG9lcyB3ZWRnZV92YWxpZGF0ZV9tb2RlKCkgY2hlY2sgdGhlIGN1cnJl
bnQgeGUtPndlZGdlZC5tb2RlIHZpYQ0KPiB4ZV93ZWRnZV9tb2RlX2lzX25vX3Jlc2V0KHhlKSBp
bnN0ZWFkIG9mIHRoZSBjYW5kaWRhdGUgbW9kZSBhcmd1bWVudD8NCj4gDQo+IEJlY2F1c2UgeGVf
d2VkZ2VfaW5pdCgpIGFuZCB4ZV93ZWRnZV9zZXRfbW9kZSgpIGNhbGwNCj4gd2VkZ2VfdmFsaWRh
dGVfbW9kZSgpDQo+IGJlZm9yZSB1cGRhdGluZyB4ZS0+d2VkZ2VkLm1vZGUsIHNldHRpbmcgd2Vk
Z2VkX21vZGUgdG8NCj4gWEVfV0VER0VEX01PREVfVVBPTl9BTllfSEFOR19OT19SRVNFVCBieXBh
c3NlcyB0aGUgU1ItSU9WIGNoZWNrLsKgIE9uDQo+IGFuDQo+IFNSLUlPViBWRiwgd3JpdGluZyAy
IHRvIHRoZSB3ZWRnZWRfbW9kZSBkZWJ1Z2ZzIGZpbGUgdGhlbiBwcm9jZWVkcw0KPiBpbnRvDQo+
IHdlZGdlX21vZGVfc2V0X3Jlc2V0X3BvbGljeSgpIC0+DQo+IHhlX2d1Y19hZHNfc2NoZWR1bGVy
X3BvbGljeV90b2dnbGVfcmVzZXQoKQ0KPiBhbmQgZGVyZWZlcmVuY2VzIGEgTlVMTCBhZHMtPmJv
IHBvaW50ZXIuDQoNCkNhbiB5b3UgcmV2aWV3IHRoaXMgb25lPyBUaGlzIGxvb2tzIGxpa2UgYSBy
ZWFsIGJ1Zy4uDQoNCi1TdHVhcnQNCg0KPiANCg0K
