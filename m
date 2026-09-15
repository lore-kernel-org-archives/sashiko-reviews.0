Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E59F3B3895
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 05:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449724; cv=fail; b=DI+9sk/N7TL26BAZIJl6uGPMJchSoBb97t8YJ1Aq8hKAjc9iNrF+RxZ+GJkVelzK3Ja4v8OkzIs0uyZWQ2DZ5LD6FkoZgJlw8Ji4ZzzlboeooTYBafiWkwudDNbledEE2mLVf9a/MetOzzlicg8eWduH1Tij0LlhFq4oNrSA2D0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449724; c=relaxed/simple;
	bh=2n3JItLxqNoqtxyvc5OoXuVP6Qbyc955YrZdovM3CoQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FiCGFtOybj2HFG8xCq6J0crORgQmHBfYUQrwxyOkwiqsMX5AiEdzVh5ThZzgDxucF0nWjOz98qtuzFVkcUKFlNP2Mt0o1+fJ/f107EQ7aS3vWcwuagk6/tn6axAIzo0LpdKGf4bBsna2qGEOwKtqJVH9k2ubH1ET5kFKNeO3S8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emkH0WV8; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emkH0WV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789449723; x=1820985723;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2n3JItLxqNoqtxyvc5OoXuVP6Qbyc955YrZdovM3CoQ=;
  b=emkH0WV81jjSz8DzMIzFV/eZ6Q3Z+f533IZO+aQVqe6P7Czwx7A59tjp
   X1RbFngISxsNnT1yj0UA0HqKf67NP2fwgm9LUV3w22IPRP/CwV/b2InqN
   Y2LznqqRXFgWomsPisnBTeOiP0zxyM91FEGxsfHGuZ/P/qf0p2jhuX9kO
   F2fR7PEGCLrwgyaG/gl/BDyK9q/YqRsMrp1iAdfKALkvHIN1F2Bgfkwxm
   mFcxeinH52gPml2UlGT8RE5tEB2tspW/nbivEJKZewH/+tLkC3PyJOgvW
   hw9M99GHjJnT7u6jGbbaKaqgubOfzhI/jlVshPjVfPZ3aFU2M5Mvd2zbG
   w==;
X-CSE-ConnectionGUID: ZRwdu3l+RDiSLuhiWVFwhA==
X-CSE-MsgGUID: H0X0nbX3S+6rYrDp/YDzmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89935269"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89935269"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:22:02 -0700
X-CSE-ConnectionGUID: HhNGfEHzRm2LXBLUzjCWrw==
X-CSE-MsgGUID: E3Ig7lFYQzur23HWp2Wt3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276990648"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:22:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:22:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 22:22:02 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:22:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFwBjf1A8Tyu5JbuQqDtctNX7k31iPaZec2iLooqwdICr+RMoFrIO1p0RleIUnk7+h5y6E3tniLXPAXIMq7dz21SPYlQ3mAEjlrA2hohIWLyqgKGOoMTQKRDY0F5CE90tdDhCG6+N2JUqWFllU9u8AL+xI2uJro7wbGwWb+iu5xB6yvUNXezb0Ef4+Qe73Lcn/4N101bRfkThf8JGRee2q3I5eswfnoy0isyuAq1focLQuO7ShsGRaDV/Mwyp/3drRsvWhX4XKeov5Tq42Se7YG6aKm/Nf5NBOrzvA4iLxY2XUrsk1dMxx2ZdYlsQ6zBG9G3lRZuAWMcDGF5hw/pEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2n3JItLxqNoqtxyvc5OoXuVP6Qbyc955YrZdovM3CoQ=;
 b=fzFfdUl30wwGSiSMR38Bc0c//GJZphrNO551u3rMBYHv2j7frttcDZTIsSSu7w18j0s0EBETnnRJtMbiULarEsajlkI08zspLC+LfgnypnOicuyRnf9+wtdn8QYeAsvkD0J0L7iAwWZzpHHQzGDUfZASBmhb3agkNCZwmm3HZ7D1l3cDlscgJTwRxXNgK+X9EKx1n2RMMhdV8u5bY0drbNTSdb697oqNcy/9IrBvLoNlPL+aNoXxRvNFgh05mHJAsOuwTFXJ7w8oxu8guUT9a3QYCC9/pn8xs3BjpXHAgqZ1hwQyz1IsyUmqHW5liQnhb6tUEyPtloSZUO0tmaKRqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS0PR11MB7309.namprd11.prod.outlook.com
 (2603:10b6:8:13e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 05:21:59 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 05:21:53 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Topic: [PATCH 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Index: AQHdQaQqmmHgh2qsdkGrpzOH9J2h47bIyTiAgAZXmJA=
Date: Tue, 15 Sep 2026 05:21:53 +0000
Message-ID: <DS4PPFE901A304FFCEFE30E85594C947AC3E3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
 <20260911041449.3699400-4-suraj.kandpal@intel.com>
 <20260911043019.902A11F000FF@smtp.kernel.org>
In-Reply-To: <20260911043019.902A11F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS0PR11MB7309:EE_
x-ms-office365-filtering-correlation-id: 3b65a5b6-ccc5-46b4-ded1-08df12e940e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|4143699003|6133799003|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: lBruaCqPUYd0shhXkrkzR1OnJbFIRUJ+aVwIB2vgZhtLiw/QqiSBfdd0WmghBLbQb4Eyq2lzq16r5qBT/c0lB7pWhGHUzCxgEhWpoadxvt05PcPIqg248L+AzgLqtPKDTSIdBGhXNt76FGj9oBunmdxOrN75xB2RcSRUbHmoJegcUai5NOcfAdD6HUvg0bLnlsNbIDaflr6MWaNJWe3sghYqPWgmt/yus838cK36CKwli8NA7jBCNhZ/e4iFtvwF6xsPQ0B/XN3Ze0dGZ8LI1cSjViqTQmTeVU0NrU63ONyzjVhuNO+qgTsxlu7sJlUhk/uPPB60noCA3TK5JrjKB30i/BRw2+coyuf4r86ElD/vhHN6+WqY5gHe/YJuVzVzcIJJl7PGKpP/eFqmbHZ5fAm56OehYHUzhPQVPEBU+rWPQYXT05WOuIZjLk6q/iQUbPIxQ+KXpSe0jINqcQyEfiiPmsHHw14onQfYs3awuRV/MACJ9HhrZ5zprLcLH41InpNpFgU15Umz4SGpEi+fU5NvfwjnHSkLRXHTaGOKWyY3Ja4D/Gw/Gveq9mj62w7Eh6JPsDAxyEeomUxDYa44pD/k6LVdDG/GqvUMQuZdNGr5DawiKI9QQs2yQZcu+adcjQ5g0NqikQOc0Qvxb9yp7n5nwjsU9MoWi2Kfq+iT5dY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFE901A304F.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXJZMFI2UGJVeGg3SUFvcXFoSHBHTlcrL0xqekdKUVFrS3dEclBUTzVRb2ll?=
 =?utf-8?B?VVduKzBXTitoVDRrUi9iUitTUFdkQWdTd2g4UHZtaXRzdGxqd3FTYnI0S0hh?=
 =?utf-8?B?QTBQRi9sWjJvQXU4SUFydWRYQU5CRCt5dlduOGJjNkY1d25aSCtrVWlhQmM1?=
 =?utf-8?B?SVl6RmVTS05HdFY1VEcvV2ZUS3pMeFN4OVVKcEVGSUo3RkR3U3Fhb2FJSSto?=
 =?utf-8?B?VEVsT2pyaWRHRjIrN2N1Q2VyMXFnY3NIUllVK3VxdEtJSS9qSUlwdkJTYnVa?=
 =?utf-8?B?QjRudmVzRzh1UmwyVEo5ZDJkZkZyOUpQNG52Nzg2ZGFQN1Q5dGlqbkR1SS9X?=
 =?utf-8?B?VDVzdjM4WVFrMmw5aWJ5WUQvUkVvajZzMlNydE9odXJIaW5JVitCQUxLcjBV?=
 =?utf-8?B?b3dTUE11MDkrTVNqUFNldEFWUkN2bkZMT29Xc085ZUc4T3NzRHg3VlRNM3VB?=
 =?utf-8?B?blkwVVRMcHZnQkErOWNsSWovY0l6cXR0bk40MGtWbVVNZXRjMjFQKy90NzBv?=
 =?utf-8?B?WGQrMzBsanNsb2t2aGdmdGUrcUFMVmFtMXRMUlJRWU5kVEk5ZThVV1FJWS9X?=
 =?utf-8?B?NlJRT3ZBVkNGRUdUbXRyaHVmQlNNU3VFMkJ3d3Z4bHZpRzRyaCtYTFU3SVFW?=
 =?utf-8?B?RVpaTndrTUxNbzBlRzFRS2RyWWdxcDhsRVU2LzJKSVpXZitYMVNoTWp2Z0dr?=
 =?utf-8?B?WmlmUnV5YW5CdytxZnkrcy9lTmM0STFTYU1URjFVTEc2bjNvSjAyZEZDRzFv?=
 =?utf-8?B?Qzl1MkIxemQ3YVJJaHFvSzNCUzQ0eEdyaW5aazM0eC9DbFlCRFdqZXBBakdx?=
 =?utf-8?B?QTJBWCtXOHhnVkZ5RGZSNWlnSGtqZ1MrTVk1SW9OUlI2K2Y1K0Frdld3U3dP?=
 =?utf-8?B?MTM0VjVwMG5yaTRGMmdNRDNVMzA0d0M4dXBWN05mYVh6bWZ1aVJEZWlUeGFx?=
 =?utf-8?B?RUxZTWpvbEd6TmhPYVlpOWtkMERRQmVKbkdia2NWU2crTXZPN2drUThVMjNh?=
 =?utf-8?B?RVNTVDFqL3l2SnNJWXBjOENTdnFMczRIaE9pcU8vQ2g4QlBYVUw1VC9OT0hk?=
 =?utf-8?B?L1ZQaGxRT0w1blhmMGJqclNldzI3UHFBZGxSd1VpbXhHL09TMVorY2p3Nnc4?=
 =?utf-8?B?VEZwMzBVQ1IyNHFnblZXY21zSTZZUFR2VWRiZDlQdmFFVW5GZWhvaTcwRU9y?=
 =?utf-8?B?QnFCTVhRUzdpSjVoeCttTDdvRGQ1U2FkQlNpdUZwNnluSWNkK1oxOE90TGF5?=
 =?utf-8?B?TmxUNUJYZ2F2SjdTRyt2OFl1eTllVDJudmNHWmFyVHpsKzRRZ3BQc29UK3Q0?=
 =?utf-8?B?UDlpeEtBQ2xYZ2hOWFFGT2dtNDNVOVhBdi9tQ1M0dGY3VnUzdDlZRzkwVnFp?=
 =?utf-8?B?dDdHYjJtTHRlRU56cWRGakZoSUhpU1B0ZTRIOWlGT04rS21SdGtZQTJoMW1I?=
 =?utf-8?B?WWtXOGFwNDcxcTVYOGRtNkgyTExzajBveUlIcEVMVEhnVi84TVFGcXM5ZVho?=
 =?utf-8?B?RGZqd2M2VnZNTlJlMC9Jck5XanFRY252T3VHVGl5ZWZyVTFHV2dvVEQ0dnd3?=
 =?utf-8?B?a1c0MnVkM0NIdXVFMFRDQW03M3RsdjBnN3I3VkFod3g4eXdIVm50R3VxMGMx?=
 =?utf-8?B?TmVlaS9ZeEw4d2FnbTkvZVh1amxDTFkrdWFwNG1Wc1pxZzRjZDVmSm1XaHZo?=
 =?utf-8?B?SW5KTWcrSnhvajRJY3FnbFcxRjB2U1I4OHFLcElwZ3RtRUxMTHFaaUp5cGJl?=
 =?utf-8?B?RkRzSHR4U09oWllSd25iRHFkN1NETG1NMVBlblY3TlZOWUNnaXdhWnhqbHJF?=
 =?utf-8?B?eHZ4M2o2TFI3WC9HSFBiTmJHYVpYdEdZSit2SUFDdDJrM01iT0xhUm5IVERu?=
 =?utf-8?B?N1dtbU1ScnBzU3ZWcStxK1NrVURkTDNlUUUwUFJLdDQ1c2loZDRUZCtVVzNH?=
 =?utf-8?B?YnBuWllqcHJEd1JZeG5OOFRjSVo5STBUTEsrZnExMytIcERwZ2o0UGJHdXl4?=
 =?utf-8?B?N0Ntd0VyM3ZYQ0NsQmw1MkxKYlJqY2pRYllsdUgyNGhTWkFzYS85b0pHRmJ4?=
 =?utf-8?B?cEVoQ1d5L0p6YWFYSUt5UitIc1cwU0lwNFVBdE41UmkzNTgxTlhOWnFtaFdP?=
 =?utf-8?B?YmhJZzVta1dHdHh0bWk1QUhCMC8zZGNDZ1RySUZURmpTY2dGR216YytTeUJu?=
 =?utf-8?B?TGgwUlJZSlZwU3VRNDFmd0h5ZGxxVERpL05wN1RFU09ZdmQwRzJPZjVtZHBy?=
 =?utf-8?B?ejRtdThRQ1lkM1loL1QvSWxnRWU5aWFEWW0xU2FvMVVZNUhDRzNrVHo0T2E3?=
 =?utf-8?B?SDBHcEhxR0lKWHRja2JLcHg1OWxyK0s0Q0gweWllOWo0NHFDbkpwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kLbSn1LTtBBCTFo3W+aZb1E/gKggKLKSuLPlwPKnOGMK7oMownwhgVbVPo4633pYpjwZ2vjuCbJlcx/chuOuuR9djPcWnCIw0+pnFaU9AbqvR+LzCy0fgviqb1lfBvHZZ7dc29mPCgN2exf7R1oqvkqximc5ULoh+N3TGCxNGO3oncs+JR0Kklcv1kT4jjYUpqlr1Xc/5MbT88u1yRzqtWKn7X/G0DKJLWvvwxUyspDc6jWLTzz5IKF4G8bgnsHKSgpG69IFxcuhQCXLrQ/J2035yodvFmjouxdzUz2lsFsWhDBFFLo0GF8x1JAwGirWCvlFTKFlVBby8lrGWVQ7uw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b65a5b6-ccc5-46b4-ded1-08df12e940e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 05:21:53.5189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iSmooXC97lWjkhtxXPPiZ0sevboVrzz4gKh/kiY2H8CaUA8oM7vD+a3UoJJAYNolfxqTrDBWY9zZeBOKCvtlQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7309
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW1BBVENIIDAzLzEwXSBkcm0vaTkxNS9kcF9tc3Q6IExpbWl0IE0vTiBy
YXRpbyBmb3IgTVNUDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNo
aWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPiBjb25zaWRlcjoN
Cj4gLSBbTWVkaXVtXSBUaGUgTS9OIHJhdGlvIGNoZWNrIGluIG1zdF9jb25uZWN0b3JfbW9kZV92
YWxpZF9jdHggdXNlcyB0aGUNCj4gbGluayByYXRlIG9mIHRoZSBtYXggYmFuZHdpZHRoIGNvbmZp
Z3VyYXRpb24sIGZhbHNlbHkgcmVqZWN0aW5nIHZhbGlkIGRpc3BsYXkNCj4gbW9kZXMgdGhhdCBj
b3VsZCBiZSBzdXBwb3J0ZWQgYnkgYSBuYXJyb3dlciBidXQgZmFzdGVyIGNvbmZpZ3VyYXRpb24u
DQo+IC0tDQo+IA0KPiBjb21taXQgOTg0MTY5OTZkZDIxZWQ5MTlmNzc5NjYyNTRlYzVjZDRiYWVh
Njc1NA0KPiBBdXRob3I6IEFua2l0IE5hdXRpeWFsIDxhbmtpdC5rLm5hdXRpeWFsQGludGVsLmNv
bT4NCj4gZHJtL2k5MTUvZHBfbXN0OiBMaW1pdCBNL04gcmF0aW8gZm9yIE1TVA0KPiANCj4gVGhp
cyBjb21taXQgYWRkcyBNL04gcmF0aW8gbGltaXRzIGZvciBEaXNwbGF5UG9ydCBNU1QgY29uZmln
dXJhdGlvbnMgYnkNCj4gcHJ1bmluZyBtb2RlcyBpbiBtc3RfY29ubmVjdG9yX21vZGVfdmFsaWRf
Y3R4KCkgdGhhdCBleGNlZWQgaGFyZHdhcmUNCj4gbGltaXRzLiBJdCBtaXJyb3JzIHRoZSBTU1Qg
bW9kZSB2YWxpZGF0aW9uIGxvZ2ljLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYw0KPiA+IGluZGV4IDZhODY5ZDBmNmZmYzAuLjc5NjM3
NGNlYmYwNTEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcF9tc3QuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHBfbXN0LmMNCj4gWyAuLi4gXQ0KPiA+IEBAIC0xNTY0LDYgKzE1NjQsMTEgQEAgbXN0X2Nv
bm5lY3Rvcl9tb2RlX3ZhbGlkX2N0eChzdHJ1Y3QNCj4gZHJtX2Nvbm5lY3RvciAqX2Nvbm5lY3Rv
ciwNCj4gPiAgCQkJCQkgICBtaW5fbGlua19icHBfeDE2LA0KPiA+ICAJCQkJCSAgIGJ3X292ZXJo
ZWFkX2ZsYWdzKTsNCj4gPg0KPiA+ICsJaWYgKCFpbnRlbF9kcF9jYW5fc3VwcG9ydF9tX24oZGlz
cGxheSwgbW9kZS0+Y2xvY2ssIG1heF9saW5rX2Nsb2NrKSkNCj4gew0KPiA+ICsJCSpzdGF0dXMg
PSBNT0RFX0NMT0NLX0hJR0g7DQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4gKwl9DQo+ID4gKw0KPiAN
Cj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IFRoZSBjb21taXQgbWVzc2FnZSBzdGF0ZXMgdGhpcyBj
aGVjayBpcyBhZGRlZCAidXNpbmcgdGhlIGhpZ2hlc3QgbGluayByYXRlDQo+IGF2YWlsYWJsZSIs
IG1pcnJvcmluZyB0aGUgU1NUIG1vZGVfdmFsaWQgY2hlY2suIEhvd2V2ZXIsIG1heF9saW5rX2Ns
b2NrIGhlcmUNCj4gaXMgZGVyaXZlZCBmcm9tIG1heF9id19jb25maWcuDQo+IA0KPiBDb3VsZCB0
aGlzIGZhbHNlbHkgcmVqZWN0IHZhbGlkIGRpc3BsYXkgbW9kZXMgaWYgdGhlIGxpbmsgY2FwYWJp
bGl0aWVzIHJlc3VsdCBpbiBhDQo+IG1heCBiYW5kd2lkdGggY29uZmlndXJhdGlvbiB3aXRoIGEg
bG93ZXIgc3ltYm9sIGNsb2NrIHRoYW4gYW4gYWx0ZXJuYXRpdmUNCj4gY29uZmlndXJhdGlvbj8N
Cj4gDQo+IEZvciBleGFtcGxlLCBpZiBtYXhfYndfY29uZmlnIGZhbGxzIGJhY2sgdG8gUkJSIHgg
NCAoMTYyTUh6KSBidXQgYW4NCj4gYWx0ZXJuYXRpdmUgSEJSIHggMiAoMjcwTUh6KSBjb25maWd1
cmF0aW9uIGlzIGF2YWlsYWJsZSwgYSBtb2RlJ3MgcGl4ZWwgY2xvY2sNCj4gbWlnaHQgZXhjZWVk
IHRoZSBNL04gbGltaXQgZm9yIHRoZSAxNjJNSHogY29uZmlnIGJ1dCBzYWZlbHkgZml0IHdpdGhp
biB0aGUNCj4gYmFuZHdpZHRoIGFuZCBNL04gbGltaXRzIG9mIHRoZSAyNzBNSHogY29uZmlndXJh
dGlvbi4gRG9lcyB0aGlzIGxvZ2ljDQo+IHByZW1hdHVyZWx5IHJlc3RyaWN0IHRob3NlIG1vZGVz
IHRvIHRoZSBNL04gcmF0aW8gb2YgdGhlIG1heCBiYW5kd2lkdGgNCj4gY29uZmlnPw0KPiANCg0K
R29vZCBjYXRjaCwgZml4ZWQgaW4gdjIgLSBpdCBub3cgdXNlcyB0aGUgbWF4IHJhdGUgY29uZmln
LCBsaWtlIHRoZSBTU1QNCiBtb2RlX3ZhbGlkIGRvZXMuDQoNClJlZ2FyZHMsDQpTdXJhaiBLYW5k
cGFsDQoNCj4gPiAgCS8qDQo+ID4gIAkgKiBUT0RPOg0KPiA+ICAJICogLSBBbHNvIGNoZWNrIGlm
IGNvbXByZXNzaW9uIHdvdWxkIGFsbG93IGZvciB0aGUgbW9kZQ0KPiANCj4gLS0NCj4gU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTExMDQx
NDQ5LjM2OTk0MDAtDQo+IDEtc3VyYWoua2FuZHBhbEBpbnRlbC5jb20/cGFydD0zDQo=
