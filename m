Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C7E384CCD
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596796; cv=fail; b=MuUjOPetE1S9j6fyqvbv4/H+W3/UQPurNgUr5ZZ18XB2UH37qk//irLh2HR4Z+yfutKi7R0QxeZll8vuEJ25wDOgBM9NeL6AUM4LK7sfZcicGX1OLA691hnG6o5L36Z55PVrOpO5mvuIWnhuvsE0JP95NAMrQ4rcGElx5i75RLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596796; c=relaxed/simple;
	bh=HGpdnpGa0tX2BuxGFhMiCeo9jbJWPd5gSbO5NJuOVPE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=euPYFNGhgWIE0vOcf6rEPsBtOoaCtS/C5yIgKxoZXH2jmrpgSxVS4L1PFemD94OhdZPVPVIb9Ehpq5ycsrk8u6cnWY8ckbBpTc5vci1Hvo+37y961ux9+zbFrLWY4QLr4363JzMveXaRbdflxwNvT9tWyEFpe/aWuCI5FimdX0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSurZevy; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSurZevy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787596794; x=1819132794;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HGpdnpGa0tX2BuxGFhMiCeo9jbJWPd5gSbO5NJuOVPE=;
  b=SSurZevyZRmKYbVBPN4Trqeq3BLvc0Q29vVoUHmL+gwZkftqmek8J7Ec
   ExjkQ6l+ii1QQc+YyovrRRpXwvaQHLPWokAZ/OegET2Ar5cmffdXwPti7
   lXifh5j5PbPdHzbmX1o6l4p39rfOqRhbmfy99sziGUutgwDrt6mSS3OLm
   cdlnBX3fm2A1NnrYK/jyS2ocS88vxR9eDZGOQzbkXMMFGM7uaEjwo2aYa
   3THuLSszprK1nNZzZxM6zF/PyIRiLcPm4HOmRBQ5VKF4UAbJ9JpGYQUEO
   uA8o/+lfXZb57MIR6RzmVGvt1LwBDpmudfD6/mskX+mUQe7Xr0tuVN03C
   A==;
X-CSE-ConnectionGUID: a363mOH9RAmMifmlO3k7+A==
X-CSE-MsgGUID: QTyOUR+pR1e6ArnASrohOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88183537"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="88183537"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:39:53 -0700
X-CSE-ConnectionGUID: ylEJb57FRImLSQcSbACLWw==
X-CSE-MsgGUID: bn6fMmYmRdKDSV01BDOsQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="263796904"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:39:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:39:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 11:39:52 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:39:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdlY4kmNgSIsImT/CEthNXfXKn0J7+qHWYRkxpKiZw1EewMiP9x7Ux0VdpN+klkBtWg0sW+UAWPpeF7MfF7HJ/ic5uXX7q0JYfkPYi5mbufBowjUStEgyhX/Ie01jIuxfmSC2TKNQ/UnduDAIGFcGeh166y269lVsD13L0av6s9wrRzNnRFG8PFBogaktvrE2TTq8G0GFZI4Zpn3eqRuSGWtESg0D4EIE2a1mwNFNZFVx+1YKvJAeUL+iFd0Nd1pHG/s7IkouYohrTI/21vV9zP710XRvN3V6BagxdnSLoDNuSuzMQsSqzjBJx+Fnbf9hLVitgpCLUESML0plbEfsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGpdnpGa0tX2BuxGFhMiCeo9jbJWPd5gSbO5NJuOVPE=;
 b=Z9CgMvBfmCMDoHHIoNFC92N0Rf5ZItEDoAd2lFzCbYCZO/ZavfQ31kwJ8/oTTdaK6krX0FBcMk1r79MeiZiKZB+AuRABwnsTWvi3BiLXRzlSi3sW8XDV45ExE4OrR9LlZbx4qgz0Dyl8uRy8KrzwC2xVlfcQMfccOYIvkhMCnQ8VTO8SFhIbXAeIvzy8MPyIyHvIR1vZ+nE6y3qPfKi2gaC1bGyh2/lE4yrDbFpz4k/x88M6NZ8+wRyKk/jdpTvdwxidp/f+h30OSYtsWwURJj1JTVdaOVb0SNAzziMnRJjB3811+2i+AM+ujXLhD1s6LzEBn4WnWcAq8jEi7gHqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DS7PR11MB5992.namprd11.prod.outlook.com
 (2603:10b6:8:73::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 18:39:50 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 18:39:50 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access
 callbacks
Thread-Topic: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access
 callbacks
Thread-Index: AQHdM+USZkUGPnycIUeg6ZOSVYCMw7atZZeAgAAhIaA=
Date: Mon, 24 Aug 2026 18:39:50 +0000
Message-ID: <CH3PR11MB046149EB1038D5E45686A5E5F2C1A02@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-14-michael.j.ruhl@intel.com>
 <20260824163620.1EAEE1F00A3A@smtp.kernel.org>
In-Reply-To: <20260824163620.1EAEE1F00A3A@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DS7PR11MB5992:EE_
x-ms-office365-filtering-correlation-id: f673c7ae-1353-4aa3-5875-08df020f14c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|3023799007|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: H4eQfXbsYb50J2OzftblPKm/H0iloiCjoOknz3SIoJiq3LztSgTwLa6x3obWLhaIQ1PpvahhJdrq5UXPss4cM90EHcMa2vEZk7HXRxhc/jVQ0LZJntIYscYRb7RJdC+MRJDe0caW+aHkDyikjadjY5iy239s5dvB6c5uXSksLm0YWP3pHwB242atdipVux24XQmogb8z3DaXZxZ3PMt8l4QQza8nU4nRHx41ukosloW7AgYpIctz4KEVPJHUCe5DITuHajT6Liy0Tk2CUSa8e5XcA9D80x9VlDKsgjGlPyt9jzAacoX7FB5mFYCd3wa8RS0Bn/fXCBXMVuLtkzGyTtLV8kOcy/yXIE1ce5CIKr8id/65DevFF4/gVcmHQ5fdHn/B0vufXBM8y1GMHIY4ys/cpN7qOwz2P7JitltWe0zL77v5Bw0ghu0mRc1Qh1F0NQrxVxA3Cas+Ju9fAJZLaF63zIKz7VYfDdMGKThSMPJ+ekPh3l9x6WJn+dv8fZfJgCAi/7tTSG5yKZ6xwU1edPMKx6wYedO2gBo4txTyn1kuTaB8LFIanjs8R4UjuhaRZduWOmfAFk7MD0CNBxEsmHbR4xRZfAJoAIn/MVQ/MdW1D3yFhX/lQOLPum/J2BpyKzuuaE2rcK7RlEo3MvzI9aBjVbrpASxOcOYGhHF/ccw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2R4Qk5iTWJMeFYvcjZ6M1NobmlOcFM5NFAwc1RMTForUWtYSTRqNXphRVpa?=
 =?utf-8?B?Y2pTRzR5NmdxaG52UmI3OFhsemcrdlJ4cWxPQUxTUHFjYkIrVGtlYmpkZWxT?=
 =?utf-8?B?WDZOVlVGRUUzSnRhZEFwR08rWWowa0Q0bnFjWTJkQlZMc244K3dWVE9pVzBI?=
 =?utf-8?B?L1B4MTdjOUpIVHQ2N3lsM25oSXJXTis4NDRTdGJpY001eWo0VUhyYnlWaWg4?=
 =?utf-8?B?RGhYWlRpbGVubGppc25aK2M1aWlkSktiRTZpd1l4L2I5Uk5NbGJxS1huZ0Fy?=
 =?utf-8?B?N25IdlJLSFF1YWNOMnpQV3BIWGdzTWUvbU9NNFFXSitxSDhxdlFtY1RBL2pD?=
 =?utf-8?B?NmJNMENodVVzRmV4d2cwNml6d2lvT2dGbnY1dUNjRHE3Q0FDODVrWGs4b2lG?=
 =?utf-8?B?WTRub2sxZjRzS002VnQ3RVp3c0dvMnlwbisrNS8rOHVyOUlpV0Z0cm5JTWpO?=
 =?utf-8?B?OWVHQ2pGOStDeWNkRWlvQVB2Y0JSaE1TNUxEWXkxbmR6Y2Z2ZW03cnZsTFRN?=
 =?utf-8?B?MmMxZ1RFa2tQd0RxcG9wSVBOSjFPZDQvazNNamRiYmF6MnZqL25FKzZhTTUy?=
 =?utf-8?B?V1dCTFJtay9TRzMyL2I4dWRaYXZqVS9PNGp2SVJ3NGdnUHRxTzgxbGVNMnZ0?=
 =?utf-8?B?NHlZc29QcmhXbEVnWDNwYVFKL2FHc3M5WTZobTZ2alp2TExYOFRjVGVKYzZP?=
 =?utf-8?B?Uk9hRHgxODJNdTZRdG9LZ3hjN09CZVNpZ2l1bUI1MTFUOXlzSmN2Y2hobERF?=
 =?utf-8?B?MGE1WE8xVTkrOTlaVk1hQ0o3b0NGcE56SVkrWjgzOTFsMzZIL01wY1dhMUp6?=
 =?utf-8?B?ZkplN3NUNEJmcmxiUmJUcWFwZWprb1FQSXVrWjhBYlJzM1k5ay9Ba3YrYUNO?=
 =?utf-8?B?M3d5azB0cGltTUR3eitLV1BpRzJCVjZIVFFReUxHNzVOR0twUldoR05TRGIx?=
 =?utf-8?B?MVdVYVU0ZE8wREZsRUlYRktWczBGc0dobU9KSjA1YkpBVU44Z3ZmSUI3bHRT?=
 =?utf-8?B?L0pPTFNBWXV5ZVk0ZW9zR3loZmRjUTBDdzlvUXV6dldvbWNZOStFenFvTEEy?=
 =?utf-8?B?MTVYN3A2YWd1SlVWZDcySFB6U1gyUDdHWGZiWVpjb0NDVVdlWDRHRVByOFJK?=
 =?utf-8?B?YXFhRkxmZDZ6Rk9rY3MzZXpGd2dXSzk1djhGb2pVOEVyTjFsWHg1aythRzJZ?=
 =?utf-8?B?WHRFbldVbER3VkFJMVBmN0lGckllc1dMSStnZ0xHcTQ1czRCRU9sRlFkR2Rk?=
 =?utf-8?B?WmpMejJuS05PK1VQc2lLYU9ybERaU0JCcDM3bGpiVVMrKzNPVEkyOTFKZFov?=
 =?utf-8?B?aGpNZGJOUExvZEpxZ3pVNFN5a21ITzJaekdlVjRVSS9KYmhVcFN6aWx1Ry9z?=
 =?utf-8?B?TFlWdWtra29wR2V1anNlR1F5bk1Qb3k0bEdVV2wzWmRqNW0zUGladGZaSUhz?=
 =?utf-8?B?WlhtRkR4VmxDZDZwaDkyU2VLTFNXWVhpbTBlcExWNkxkekZhWDBqL0hDUE1v?=
 =?utf-8?B?YjRrOXN0djhrb0FaeGtJd1V1MHNTRnNCengrWDF0MXIzays2dFpoVHo0dFQ2?=
 =?utf-8?B?QXNNM3B2N3BGV3FDSUlsbE4vNVlQM2tsQmw2SHFydUdqMU9xbHhrWGh1T05U?=
 =?utf-8?B?MitsQmxRMTgvVGhyRHRyUERad3l0SjlkUEh4aDJnYXlSUllVbFE2V2dxNThR?=
 =?utf-8?B?N3JJNlNvbm5qYjRTaHVlcXhibWlPa0wyakJuWENmSDVrNFo3dFhwaS9TTEor?=
 =?utf-8?B?VXFUZWtGS1l4emUwYWEwYmN0UE5DUjByd3I2Q2Q2RkNOUXYxc2RabisyR0J0?=
 =?utf-8?B?RmdZc1JtcmhBSjE1UkN4cEw2UjNqSkJmdThrOGtLd0FJNjJMd0pYcVpSaG91?=
 =?utf-8?B?K05HMHIxWVVjNGtndmpPN0tlUk05Tms5cXZrYU9oc1JRZUcyazlEV2tldkdq?=
 =?utf-8?B?N0o1aUcrUXhSdm5pY2NDUzBSZzBQSXNYMnZKaFhWZVNnZkFiRVdRTjVXekQ1?=
 =?utf-8?B?TC9NbWFjcHdnZm5vdWsxU3JyWWVOMWprQU9UUExOUTBEckphWjN6eFFqdUJv?=
 =?utf-8?B?QzhFRUxiaFNONFdMZndpd0lrNlJUMm9hWkV1RS9Kdi9HbWYzUzRTRG1mY2pz?=
 =?utf-8?B?VlJNd2RQeVZNMG1CNENkbmRYcmYwMHRVaUVVb29QRVRhZFBrdkVNSXFWVTZV?=
 =?utf-8?B?RlRrMGtUVkxGVVoyZm9BcXBEeCtuWG5pQzN5SDB6YTdsNHdBayt4endBbVcr?=
 =?utf-8?B?VDN6WjJWa2l5a3RrVjBPdG1sSzZrSTZtQ0REK1J6TCtTb2FWdGpadnViYlFw?=
 =?utf-8?B?UExickY5ZGRWZkNVZnJkUmg1M1dGRG5QSnNFRUViRXFOTGoyY3c5QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zcZuBdip70ztrjqBUMCHsyMUt5hLU3yq/yub9Z6/KHrEo0PPH/JlOwunV0sMnGtNwmbeTiumZv4fIVNEMhUJ2dBJVcrGkcvnaRC7AGOFDuFjXFU9dI0F2lPlgIjnzp39QDny2lRvSFaryRE7nkL7iZuYiB1dDGZt+7p3AMD8Cfp5KkILAcMt4BiWtoDriF6gAB0n/tkMJsSCWZSYDKhIzghau4RuTXBtqINqGCsYKMdADuQBqafEvCQ8n3Iw+6/iJPcA5Tjps+l7J6mtSngV50WC1O5P2RcR8Mx5BSrN/EqvJ3kxBeMR969N+rifTpnYZ0hixCjSXhcTRvo8iL1UEQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f673c7ae-1353-4aa3-5875-08df020f14c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 18:39:50.5536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Lel1CqbCXVTs+pvgz6JrOTuViLjRpOdozGinYH6YlT3Xao7OEKWQpxaKP6mUc9Bwr5wPOWrTJrEADJx3/YPZw6vzdtFDwC38bo/TR5bvYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5992
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IHNhc2hpa28tYm90QGtlcm5l
bC5vcmcgPHNhc2hpa28tYm90QGtlcm5lbC5vcmc+DQo+U2VudDogTW9uZGF5LCBBdWd1c3QgMjQs
IDIwMjYgMTI6MzYgUE0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRl
bC5jb20+DQo+Q2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjMgMDIvMTBdIHBsYXRmb3JtL3g4Ni9pbnRlbC9wbXQ6IEFkZCByZWdpc3RlciBh
Y2Nlc3MNCj5jYWxsYmFja3MNCj4NCj5UaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBT
YXNoaWtvIEFJIHJldmlldyBmb3VuZCAyIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPmNvbnNpZGVy
Og0KPi0gW01lZGl1bV0gSGFyZHdhcmUgYWNjZXNzIGVycm9ycyBmcm9tIGByZWFkX3JlZ2AgYW5k
IGB3cml0ZV9yZWdgIGNhbGxiYWNrcw0KPmFyZSBpZ25vcmVkIGFuZCBub3QgcHJvcGFnYXRlZCB0
byBzeXNmcyBjYWxsZXJzLg0KPi0gW01lZGl1bV0gVW5yYXRlbGltaXRlZCBwcl9lcnIoKSBpbiBz
eXNmcyByZWFkL3dyaXRlIHBhdGhzIGFsbG93cyBrZXJuZWwgbG9nDQo+Zmxvb2RpbmcuDQo+LS0N
Cj4NCj4tLS0gUGF0Y2ggWzJdOiBbUEFUQ0ggdjMgMDIvMTBdIHBsYXRmb3JtL3g4Ni9pbnRlbC9w
bXQ6IEFkZCByZWdpc3RlciBhY2Nlc3MNCj5jYWxsYmFja3MgLS0tDQo+Tm90ZTogVGhlIGZvcm1h
dCBvZiB0aGlzIHJldmlldyBpcyBhbHRlcmVkIGFuZCBkb2VzIG5vdCBpbmNsdWRlIGRpcmVjdCBx
dW90ZXMNCj5vZiB0aGUgcGF0Y2ggY29kZSBkdWUgdG8gcmVjaXRhdGlvbiByZXN0cmljdGlvbnMu
DQo+DQo+Y29tbWl0IDZkZGE0ZjdlNzZiMzY5NGE2ZmI3YmYyMWFjMWQwMGVmNzVjZmYzZmYNCj5B
dXRob3I6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KPlN1Ympl
Y3Q6IHBsYXRmb3JtL3g4Ni9pbnRlbC9wbXQ6IEFkZCByZWdpc3RlciBhY2Nlc3MgY2FsbGJhY2tz
DQo+DQo+VGhpcyBjb21taXQgYXVnbWVudHMgdGhlIFBNVCBjYWxsYmFjayBpbmZyYXN0cnVjdHVy
ZSB0byBhbGxvdyBkcml2ZXJzIHRvDQo+Y3VzdG9taXplIHJlYWQgYW5kIHdyaXRlIGFjY2VzcyB0
byBjb250cm9sIHBhdGhzIGZvciBQTVQgdXNhZ2UuIEl0IGlzIGludGVuZGVkDQo+Zm9yIGhhcmR3
YXJlIGxhY2tpbmcgZGlyZWN0IE1NSU8gYWNjZXNzLg0KPg0KPkluIGRyaXZlcnMvcGxhdGZvcm0v
eDg2L2ludGVsL3BtdC9jcmFzaGxvZy5jLCB0aGUgbW9kaWZpZWQNCj5wbXRfY3Jhc2hsb2dfcm13
KCkNCj5hbmQgcG10X2NyYXNobG9nX3JjKCkgZnVuY3Rpb25zIGNoZWNrIGZvciBlcnJvcnMgZnJv
bSB0aGUgbmV3IHJlYWRfcmVnIGFuZA0KPndyaXRlX3JlZyBjYWxsYmFja3MsIGJ1dCB0aGV5IGRv
IG5vdCBwcm9wYWdhdGUgdGhlc2UgZXJyb3IgY29kZXMgYmFjayB1cCB0aGUNCj5jYWxsIHN0YWNr
Lg0KPg0KPltTZXZlcml0eTogTWVkaXVtXQ0KPklzIGl0IGV4cGVjdGVkIHRoYXQgaGFyZHdhcmUg
YWNjZXNzIGZhaWx1cmVzIGFyZSBzaWxlbnRseSBzd2FsbG93ZWQgaGVyZT8NCj4NCj5XaGVuIHJl
YWRfcmVnIG9yIHdyaXRlX3JlZyBmYWlscyBpbiBwbXRfY3Jhc2hsb2dfcm13KCksIHRoZSBmdW5j
dGlvbiByZXR1cm5zDQo+dm9pZCwgYW5kIHdoZW4gcmVhZF9yZWcgZmFpbHMgaW4gcG10X2NyYXNo
bG9nX3JjKCksIGl0IHJldHVybnMgZmFsc2UuIEJlY2F1c2UNCj50aGVzZSBlcnJvcnMgYXJlIG5v
dCBwcm9wYWdhdGVkLCBzeXNmcyBzdG9yZSBvcGVyYXRpb25zIHdpbGwgZmFsc2VseSByZXBvcnQN
Cj5zdWNjZXNzIHRvIHVzZXJzcGFjZSBieSByZXR1cm5pbmcgdGhlIHdyaXR0ZW4gYnl0ZSBjb3Vu
dC4gU2ltaWxhcmx5LCBzeXNmcw0KPnJlYWRzIHdpbGwgcHJlc2VudCBoYXJkd2FyZSBlcnJvcnMg
YXMgYSB2YWxpZCBmYWxzZSBzdGF0ZS4gV2lsbCB0aGlzIGJyZWFrDQo+bW9uaXRvcmluZyBhbmQg
bWFuYWdlbWVudCB0b29scyB0aGF0IHJlbHkgb24gYWNjdXJhdGUgcmV0dXJuIGNvZGVzPw0KDQpZ
ZXMuICBUaGlzIGlzIGEgYmVzdCBlZmZvcnQgb3BlcmF0aW9uLiAgSWYgdGhlIEhXIGFjY2VzcyBm
YWlsdXJlcywgaXQgaXMgdXAgdG8gdGhlIHVzZXIgdG8NCmludGVycHJldCB0aGUgZGF0YS4NCg0K
PkFkZGl0aW9uYWxseSwgdGhlIGVycm9yIGhhbmRsaW5nIHBhdGhzIGluIHRoZXNlIHNhbWUgZnVu
Y3Rpb25zIGludHJvZHVjZQ0KPmxvZ2dpbmcgc3RhdGVtZW50cy4NCj4NCj5bU2V2ZXJpdHk6IE1l
ZGl1bV0NCj5Db3VsZCB0aGUgdW5yYXRlbGltaXRlZCBwcl9lcnIoKSBjYWxscyBpbiB0aGVzZSBm
dW5jdGlvbnMgY2F1c2Uga2VybmVsIGxvZw0KPmZsb29kaW5nPw0KPg0KPklmIHRoZSBoYXJkd2Fy
ZSBpcyBpbiBhIHN0YXRlIHdoZXJlIHJlYWRfcmVnIG9yIHdyaXRlX3JlZyBjb25zaXN0ZW50bHkg
ZmFpbHMsDQo+YW4gdW5wcml2aWxlZ2VkIHVzZXIgcmVhZGluZyBhIHdvcmxkLXJlYWRhYmxlIHN5
c2ZzIGF0dHJpYnV0ZSBpbiBhIHRpZ2h0IGxvb3ANCj53aWxsIHJlcGVhdGVkbHkgdHJpZ2dlciBw
bXRfY3Jhc2hsb2dfcmMoKS4gV291bGQgaXQgYmUgc2FmZXIgdG8gdXNlIHJhdGVsaW1pdGVkDQo+
bG9nZ2luZyBoZXJlIHRvIHByZXZlbnQgcG90ZW50aWFsIHN5c2xvZyBJL08gb3ZlcmhlYWQgYW5k
IHRoZSBkcm9wcGluZyBvZg0KPm90aGVyIGltcG9ydGFudCBsb2dzPw0KDQpUaGlzIG1ha2VzIHNl
bnNlLiAgSSB3aWxsIHVwZGF0ZS4NCg0KbQ0KDQo+DQo+LS0NCj5TYXNoaWtvIEFJIHJldmlldyDC
tw0KPmh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgyNDE2MjMxNy4yNDUwMzgw
LTEyLQ0KPm1pY2hhZWwuai5ydWhsQGludGVsLmNvbT9wYXJ0PTINCg==
