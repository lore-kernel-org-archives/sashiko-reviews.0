Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795116412;
	b=aER9PulwvYuw+ccryWOy7EhK9ZgdY777dupexwf2LchnHYMVpCe1ysyhU9stxnIidND4
	 czdgJfygOTkhK06mq8B2j44r8jU6WWqu4vmLFJHrAWy/VTjlIKUDdSRELsbMNNHQsETIr
	 1kMTcuE+81M1RPovsTku79zBRWMM9txhe5/QAWFL20mNKr+uOQTv7MH7seS7WNH6sGdST
	 fECIafT+pnCqCRtHTu0JuaPiAW7JlFTHHRYhK68nVA9Yl1CoJ3E9COEd8OhUtNeW8SfpO
	 MkjGltYiOBlxqfW22+wUXxf8pAhIFb9Jmo/l5Egro8FvRfvWnQrk4B6cwPeYkcgjnYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116412;
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
	bh=DgpsGhjQJX3Oe3J9Tba4ALmP5nv9V+ke500H/+RlTxk=;
	b=prD2jwc0TaHE7yEfkjouDHP9MgyTiyj3w0ajfCH8IFEf//XmYO3z6g9cB6JQRuB4KFkw
	 iCjXu2MbpnFSP57fOm6ockBDKiD4hWxBfeHrBj3eCiHK8jkiSH2IxuOtPVLJw91zLROBL
	 pID05P/dcsVzAze6rFxG48sgZK2kXz46UF1ViZ6lwbg3C46eubcMVaZWOxNFhX2ko0Kqu
	 SnH9/hpKxU8kC76FHcbMkcFCMNq5OP9p5s2cyeQU3d92dClhjG3f3JpsofIH40YjgYTAD
	 OK4o9jUrDw1W+AAXq+KiZQuz9NIEK/mnzaPEPPUbupYw4mOAZEdVRR+pGB7brA3Zl3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QpaX9bgn;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=V8zz3NsB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A899606A32A
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 19:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A899606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QpaX9bgn;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=V8zz3NsB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795116412; x=1826652412;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nUhjUJ6nu2cmSoY+bIJvYLrxTctsKdkZT8qXc4fFE2U=;
  b=QpaX9bgn7Knnf428mgfAscTWU/UvVMN8xb3mJoCUztPlYIIZ6i19jrBP
   ycqiMq+vVkagVunt8LDsUdvh2MkP3XVEOJakf4XAfRtptFCSrnOUdSYlr
   3eb43Gd+DeNXzL4uwzGFiEuUyM6V6H5+MUv6yeiazX4DSqnkjQBKQjV5u
   as+uXFEo/zevy8WNwiKKPeLs7yLKfS2LwKk+MveGCn0hzl9ttidhd+Vxd
   AywllTUlKFe+qpZRFrCN+nEEOrlZSXWVo62pPrP84xEcC1BYk8Ek5Kudb
   sGRVJi9XawEAXbzYNoos1m0l9vEk0lWTIARM4mIOZv9a4mvBtuis/+2yC
   A==;
X-CSE-ConnectionGUID: JLyNxSawSM+Gd4mvShL6Pw==
X-CSE-MsgGUID: mXZZPifQSU6jbUM8Pe7paQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3829098"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3829098"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 11:26:52 -0800
X-CSE-ConnectionGUID: 2wnrlAnYR7S4rlvdzo1MIQ==
X-CSE-MsgGUID: +MXvPYyZTguzEDqboPIRIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10770778"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 11:26:51 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 11:26:50 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 11:26:50 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 11:26:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGEMYoCnCo+kDw38VDap3LoW4VZvpojGDY8o/5k4jvkZfOc3kdV3ne8N1eeuPuh7xfXay2WQ3WN8eJBGO2Sfzk+vuv7jv3bGK9GSJ2ko7Wrxaynwwkyuyumkfwhvv7wau651nfo8Njhf1edpL1nD9QSFIGUccpQtw4IykEn1+FGMZJdhQq2/lg8k40WNYolbIeloPDw44ax/xOwWSSGZUhaKd3r7jtV5OFg6Dag8WF9qcT1DufkV2V0nGqSxwJnVpojp6INHoZNlI/DP4Irq7xVZ7PEyZcsdfMS9YDK5TyhISnukdoHoEbg/P1jN6qxQx+o8YC6LAIzPP5XsLjWQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgpsGhjQJX3Oe3J9Tba4ALmP5nv9V+ke500H/+RlTxk=;
 b=SqDf/ZjWXYvq50ADEeWBuDiXIjkAvvWi9sE2AKVxaFfksVX6zwAvC9V6kCGltTbHSx1lJ0dtDFJOBI5EE85T631GeJw5f7zFYUo76/lf6NBccZ/WsvIVYG8Cv+O1NMDki+O7sqko8F4qW9umjHPff2atKnv/Rsdl9xTHe+ZEYj1JlCGsUbev0wjxzCV5mnVLr1kQBptILqgFt99odXrcN/B6M0vjIV7fHMk1/xIru1cVP9GatCZVcdEoHP0N0yAZE1rRNJbTuD3jUAdtuwj1hLsTr2tjluklNELBQlSz4c977RX6Oo/zqGXj8SQ1ZKEh/SN3OLMNoTX7YHYe6/kUig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgpsGhjQJX3Oe3J9Tba4ALmP5nv9V+ke500H/+RlTxk=;
 b=V8zz3NsBhFHVy4Y6c8BFU4FJtqSkl9mePmi/i5NALoRjDW6hrHntCXTxpsFnIPJDux8bEb0uXWQwFxeM3rZCCsI4yASYXSXxcIlDmfe/P3l7PVOk4609Hn2jMaQl7CQHDBe6wGHOBtnGYRRBwUFw5PNrag7vBib/t//mj+7acTU=
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by PH7PR11MB7075.namprd11.prod.outlook.com (2603:10b6:510:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 19:26:47 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 19:26:47 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Charles, Daniel" <daniel.charles@intel.com>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v6 3/4] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
Thread-Topic: [PATCH v6 3/4] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
Thread-Index: AQHdeE6dUz/VeneTO0WOL5/mZiluk7c1tDwAgAAJw9A=
Date: Thu, 19 Nov 2026 19:26:47 +0000
Message-ID: <CH0PR11MB539510FF7827FE111C0C2869E5792@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20261119174621.1311154-1-daniel.charles@intel.com>
 <20261119174621.1311154-4-daniel.charles@intel.com>
 <sashiko-outbox-223764@kernel.org>
In-Reply-To: <sashiko-outbox-223764@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|PH7PR11MB7075:EE_
x-ms-office365-filtering-correlation-id: cef714ae-7aff-45ad-d22e-08df46730dc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|261022075727099003|4143699003|11063799006|261009223027099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|56012099006|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: e6vLPkC6Ep13Vt/dNEsryMyDkU8MUr2ZznehsZRda66BI5DFX7Pwoc769UTw3UUmuuwZ0Ov2I+OTH6a/9IKyZxCNzvlOXpv/hPGNJN7KPgl3UFKyck1BLnIMMARcqNHzDC0rSS/t4ZcwBykdzQUEbnG/ArBFsU3BlWjSB3mtEbAuV/nKN/R15HLw330WrXGfG4x3DHbqjhc4o9EjSBlRuOkmiGK2C/+OnmSXM6RkEqZ8Di8oVH4y6ZS1gJcKI/Mtm2HmKGbLqT/ZoYhGyAmEjPeAdnFwrVYzUABLt8aGwTgg42uXMRQHVf0SQ16OQn47StDmXXhk42x/Ak+3QGhWwLQObrva5hXHsJLzTCZ+AAqQ6qRd9vumywtKL13Zd8fGGCVcxMuHPc7aY5KN+ZbZ/SSMeuxOWZbqPjD0PWprC6CausCktuXZU0rta7bJ9nYz3eUgY94BenJd6klYS++V1FCQBqXDGw6Ad/8fbi/l27r5dfTXY/rrXR3C5vcXdzDNPHCD6YGcBdYUcjp7Uj8oi+f4cmaQnmwPWMwxzIUOh4X1q07XzUOeNWZ9SekvIO9ci6vDfhkiKiVgMrnUdOF5YCk9ryF1Pjun8gwwN6KEt9+OTp2S5/0WAAEPyQ//qKwXI3ByHGCyfo5ZHdIFnH7EnetlwIxpXb8JU1Gsp//iKuA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5395.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(261022075727099003)(4143699003)(11063799006)(261009223027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E9F0BE9RRPInA3W1VvQFDsE0cS91PChuJJpLgej7i6XSLVgAutADfNYOIR0g?=
 =?us-ascii?Q?+2f/krRoGmAlwP7n6M52Onkg1lxfYaHaB3KFFSsXEBrgdjmhrrM2y6Xo364O?=
 =?us-ascii?Q?8EsqDCIw11X3J4vKU24WBpzSCDEqIrlbdzVOv/l7+mrjjoASV2We2drapNbT?=
 =?us-ascii?Q?8kEjfINoWRJ+fKAqSUve8lKWKiZAB7do5X9b/AvO1f5uKfgHZE4Tl8LsVPvk?=
 =?us-ascii?Q?/o4kzClLxeDE2A81KsvBWwYcD/wy0mYffaBcfF8c355xIAAKgfTy7LMlNjRN?=
 =?us-ascii?Q?zGe7hBeTGvNXYp7QGtZsCMFk5sDWwHIC5UG+SeX//qcPbXVJie5S57GqOgSN?=
 =?us-ascii?Q?dD2nEgRKNmdvhUH+hmIvVnVyZ/wp3hKyi+SGXlvuVJb9lvqo6UKoctUw5pUN?=
 =?us-ascii?Q?3nYrE6U7ydp2IU0C2XFuENvs16J8WNZS0qN+tvckSyzALMpe81eqzrog5cLc?=
 =?us-ascii?Q?D+lEX39XfsPLqC7kNZIiR65oKtw4CLP3GjN7vCWRhcpc/dI7DATr8jfdUBMd?=
 =?us-ascii?Q?gDHgDDEZt2uAbVqd6k79MRqdX2B7HVrEjsUyAloFwsrnkibwiRRayv7fUhzl?=
 =?us-ascii?Q?lMKa7Mrg9TqZ5U4T1rqVrNqPBwjsFXa9KY6+ifzfkWP+RwKeV8IfHa2t1rBC?=
 =?us-ascii?Q?NZXK2w/lKcSERWq3O9aVVey8y51xHP0yA+aaHgz77g75BM/QJkKld42SLyXH?=
 =?us-ascii?Q?IrYdrKRZ70gWiQG4o6W5qSDPUwTUwrGwNtfOu/MHkvdVoZgAa5T1eJNFhjIp?=
 =?us-ascii?Q?DIRFuR9TPds9bTUYY9EYYlwosVccm1k3/MKuFHA9JcEpx3Sg3XIx6gbWfs03?=
 =?us-ascii?Q?JSYk/qAj9w9C0E9FhaEaQSI3b5MKUS8TpnNYldTlG8iZ/+HkstD3XZH6TBzT?=
 =?us-ascii?Q?YADcGNZIHDIt/fmpoa6qHj/xNotIA08TMffnjs6POgnc7NG/03rF9/CGgIuS?=
 =?us-ascii?Q?VtEVti8jKFbKhiWqfwId/3a889pdG7to8dUvzod9cqbro1LPrUEdwmziC1vu?=
 =?us-ascii?Q?JC/nAQ0J+v/+50Qb5OfwGMLyoNIAufkDoWFSD/FvIK+nUlTLU7xqHpqI7xKS?=
 =?us-ascii?Q?eGpflg2tyWXm75X1f9KYifFBgRj3KPzIoIQ/BDKnRwIL7+m1fektT6X7lmNk?=
 =?us-ascii?Q?muSIR8IyX9cSS08MHgb5e3F3H1Xh6+Qo3q5M9wXM/dlRpInr0YpCUuM0Pfd1?=
 =?us-ascii?Q?Ym0Rp/58f0E9/FI9AzaDr2lyBulm3sGDi2agEny1SW2jCp3/EAQ3qz4lvmPL?=
 =?us-ascii?Q?zuqyJBeahdUTsKRNVsVeeQioIS7QFW2Eye8fERsB5N0rrYJTVQUCjoNm/Kqe?=
 =?us-ascii?Q?c2R10ZxYOggftpQhQjzOifA1aQwgl1pPibaglRjUx3lXseiMHXOQYdarIepw?=
 =?us-ascii?Q?+XuHmY40EoGPkNI42rsrlf/ddbmndTyPI2AniDp9OzYwbU3H6pUhQw/iUYsh?=
 =?us-ascii?Q?kh/+J358nCztaTwfPdKQDLv/+DIjOuuRsDWA3BLCOUc6dTZkwEYekGIVqg6X?=
 =?us-ascii?Q?ds2gFGUO8RrrHOhEw61KFGRvr7CO+UyJSuM/8hVd804tRjmYMiBltGLSzCwU?=
 =?us-ascii?Q?Ju0Gotqo89i/p78FDRo3h9cxqumLk3y3J18mpUzpKSKURZ8saJUYx4BjkA4g?=
 =?us-ascii?Q?TU2TX4+PB3Q44mUahyE7MQ4Be782sEWqTJOI6UgFt2rhKGhLTRdwHtR9qkDy?=
 =?us-ascii?Q?KqZor+zHYCxQwk9ag3hx8hvQUooC2dBas4hV28rKyMTumRiXfV0UdqLvYEhk?=
 =?us-ascii?Q?28SNgQ0T9w=3D=3D?=
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
X-Exchange-RoutingPolicyChecked: jQur+x6Gz6Lwx5rN1YleW5uXU7bkemsT6DqtDdr+qgfI0PoMD/3Ij2sb1bBTorSwsA0N8iGjlD35PiCQRonnTV+6Yb4B/TJzL7nX7IEL1RiyAYaRUAu/80iXBcWHHkCPaKu6A7RdNQz4p8qXcbeD9YrKSne9vxmYc7yILPgZTv0SujH26EgwSmNLG76++yuZYXxT6QiaLqzzC0J0N1FBkpG1bgPQG7XmQswcECbUr0fiLOaqcI805BfjDOyfqQRreGDfxhlFhCSVnZclyFEz/xNZ1xyFvHKi0U3yA+O0iJuuwGAwbsPTlLsOK1HNMtFVAK7O+/8EqTVgPhaeBT6uhQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef714ae-7aff-45ad-d22e-08df46730dc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 19:26:47.5535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KJHhqEMYwraR6b/59H8wQwko1dzAyBOvcUZZTWadSVJkfxt3DnZcBeXRU96H0Cld93sAHPDFj6Aq6zes6Dgc1/1AXx0Om+pTpW9Yu3vOxZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7075
X-OriginatorOrg: intel.com

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of sashik=
o-bot@kernel.org
Sent: Thursday, November 19, 2026 10:19 AM
To: Charles, Daniel <daniel.charles@intel.com>; intel-xe@lists.freedesktop.=
org
Subject: Re: [PATCH v6 3/4] drm/xe: Disable scheduling early on FD close to=
 avoid CAT error cascade
>=20
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] drm/xe: guc_exec_queue_kill() on zero-ref queue in pause_abort
> - [High] drm/xe: async kill disable_scheduling() races with
>   suspend_pending
> - [High] drm/xe: primary kill disables multi-queue group without group
>   cleanup
> --
>=20
> commit 99b38ad21631b92773b295aba24f48100578bda0
> Author: Matthew Brost <matthew.brost@intel.com>
>=20
> drm/xe: Disable scheduling early on FD close to avoid CAT error cascade
>=20
> This commit adds a static KILL scheduler message queued from
> guc_exec_queue_kill() to disable GuC context scheduling immediately
> outside of the serialized TDR path.
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe=
_guc_submit.c
> > index 4087a38ad3d66..671852b562105 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>=20
> [ ... ]
>=20
> > @@ -2087,12 +2093,44 @@ static void __guc_exec_queue_process_msg_cgp_sy=
nc(struct xe_sched_msg *msg,
> >  		guc_exec_queue_send_cgp_sync(q, 0);
> >  }
> > =20
> > +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg=
,
> > +					      bool bound)
> > +{
> > +	struct xe_exec_queue *q =3D msg->private_data;
> > +	struct xe_guc *guc =3D exec_queue_to_guc(q);
> > +	int ret;
> > +
> > +	/* At zero references, the queued CLEANUP message handles disabling. =
*/
> > +	if (!kref_read(&q->refcount) || !bound || exec_queue_wedged(q))
> > +		return;
> > +
> > +	ret =3D wait_event_timeout(q->guc->state_wq,
> > +				 (!exec_queue_pending_enable(q) &&
> > +				  !exec_queue_pending_disable(q)) ||
> > +				 xe_guc_read_stopped(guc) ||
> > +				 vf_recovery(guc), HZ * 5);
> > +	if (!ret && !vf_recovery(guc)) {
> > +		xe_gt_warn(q->gt, "Pending enable/disable failed to respond on kill,=
 guc_id=3D%d\n",
> > +			   q->guc->id);
> > +		xe_gt_reset_async(q->gt);
> > +		xe_sched_tdr_queue_imm(&q->guc->sched);
> > +		return;
> > +	}
> > +
> > +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
> > +		return;
> > +
> > +	if (exec_queue_enabled(q))
> > +		disable_scheduling(q, true);
> > +}
>=20
> [Severity: High]
> Can returning immediately after disable_scheduling() here race with a
> queued SUSPEND message and the incoming SCHED_DONE G2H?
>=20
> guc_exec_queue_suspend() checks exec_queue_killed_or_banned_or_wedged()
> before __guc_exec_queue_suspend() takes sched->msg_lock, and
> guc_exec_queue_kill() sets EXEC_QUEUE_STATE_KILLED before taking
> sched->msg_lock, so STATIC_MSG_SUSPEND can be queued right behind
> STATIC_MSG_KILL:
>=20
> CPU0                              work_process_msg                  ct->g=
2h_wq
> guc_exec_queue_suspend()
>   !killed_or_banned_or_wedged()
>   (passes)
> CPU1: guc_exec_queue_kill()
>   set_exec_queue_killed()
>   try_add_msg(KILL)
> __guc_exec_queue_suspend()
>   suspend_pending =3D true
>   try_add_msg(SUSPEND)
>                                   __guc_exec_queue_process_msg_kill()
>                                     disable_scheduling(q, true)
>                                       clear_exec_queue_enabled()
>                                       set_exec_queue_pending_disable()
>                                   __guc_exec_queue_process_msg_suspend()
>                                     else if (q->guc->suspend_pending)
>                                       set_exec_queue_suspended(q)
>                                                                     handl=
e_sched_done()
>                                                                       sus=
pend_pending &&
>                                                                       exe=
c_queue_suspended()
>                                       suspend_fence_signal(q)         sus=
pend_fence_signal(q)
>                                                                         <=
-- trips assert
>=20
> Because __guc_exec_queue_process_msg_kill() does not wait for its
> PENDING_DISABLE to finish, __guc_exec_queue_process_msg_suspend() runs
> while KILL's disable is still in flight, enters the unlocked
> "else if (q->guc->suspend_pending)" branch, signals the suspend fence
> before GuC has actually preempted the context, and races with
> handle_sched_done() on q->guc->suspend_pending (tripping
> xe_gt_assert(guc_to_gt(guc), q->guc->suspend_pending) in
> suspend_fence_signal()).  Also, setting EXEC_QUEUE_STATE_SUSPENDED while
> KILL's PENDING_DISABLE is in flight causes
> guc_exec_queue_revert_pending_state_change() during VF migration recovery
> to misattribute the pending disable to SUSPEND and set
> q->guc->needs_suspend =3D true after suspend_pending was already cleared.

The scheduled work queue is serialized, so this cannot occur.

>=20
> [ ... ]
>=20
> > @@ -2262,8 +2303,21 @@ static void guc_exec_queue_reinit_kernel(struct =
xe_exec_queue *q)
> >  	xe_sched_reinit(&q->guc->sched);
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
> Can xe_guc_submit_pause_abort() hit this assertion and leak a runtime PM
> reference when a queue in exec_queue_lookup already has a zero refcount?
>=20
> When the last reference to an exec queue is dropped,
> guc_exec_queue_destroy() only queues STATIC_MSG_CLEANUP; the queue remain=
s
> in guc->submission_state.exec_queue_lookup until the async destroy worker
> runs guc_exec_queue_fini() -> release_guc_id().  Unlike
> xe_guc_submit_wedge(), xe_guc_submit_pause_abort() iterates
> exec_queue_lookup and calls guc_exec_queue_kill(q) without checking
> kref_read(&q->refcount) (for example in guc_submit_fini() right after
> dropping the wedge reference, or during vf_post_migration_abort() and
> xe_guc_flr_prepare()):
>=20
> drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_pause_abort() {
> 	...
> 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> 		...
> 		xe_sched_submission_start(sched);
> 		guc_exec_queue_kill(q);
> 	}
> }
>=20
> Besides tripping the new assertion, queuing STATIC_MSG_KILL on a non-wedg=
ed
> zero-refcount queue takes a runtime PM reference via MSG_PM_REF in
> guc_exec_queue_add_msg().  If the already-in-flight CLEANUP / destroy_asy=
nc
> path reaches guc_exec_queue_fini() -> xe_sched_fini() and cancels
> work_process_msg before STATIC_MSG_KILL is processed, that runtime PM
> reference is never released.

In guc_submit_fini(), xe_exec_queue_put() is only called if the queue is we=
dged.  And the
queue wedged state is only ever set by xe_guc_submit_wedge, which itself on=
ly sets this
state if the refcount is at least one, additionally incrementing the refcou=
nt.  This means that
in guc_submit_fini(), xe_exec_queue_put() can only be called if the refcoun=
t is at least 2, so
decrementing it cannot set it to zero here.

>=20
> >  	trace_xe_exec_queue_kill(q);
> >  	set_exec_queue_killed(q);
> >  	/*
> > @@ -2273,6 +2327,27 @@ static void guc_exec_queue_kill(struct xe_exec_q=
ueue *q)
> >  	 * stays set until the queue is torn down.
> >  	 */
> >  	suspend_wait_wake(q);
> > +
> > +	/*
> > +	 * We eagerly send a message to ourselves to disable scheduling, as t=
he
> > +	 * TDR is serialized (i.e., only one exec queue is processed at a tim=
e).
> > +	 * If an FD is closed with many exec queues, the TDR can be slower th=
an
> > +	 * the GuC scheduling contexts with invalid page tables, creating a
> > +	 * cascade of CAT errors and engine resets, which is quite slow. Avoi=
d
> > +	 * this by immediately disabling scheduling outside of the TDR.
> > +	 *
> > +	 * Only the primary's own KILL may do this for a multi-queue group.
> > +	 * Group jobs share its ordered submit workqueue and the killed prima=
ry
> > +	 * prevents later member jobs from submitting to GuC.
> > +	 */
> > +	if (!xe_exec_queue_is_multi_queue_secondary(q) && !exec_queue_wedged(=
q)) {
> > +		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> > +
> > +		xe_sched_msg_lock(sched);
> > +		guc_exec_queue_try_add_msg(q, msg, KILL);
> > +		xe_sched_msg_unlock(sched);
> > +	}
> > +
> >  	xe_guc_exec_queue_trigger_cleanup(q);
> >  }
>=20
> [Severity: High]
> If a multi-queue primary queue is killed while secondary queues still hav=
e
> in-flight jobs, does disabling scheduling on the primary without triggeri=
ng
> group cleanup leave the secondary jobs stranded?

I'm 99% certain that xe_guc_exec_queue_trigger_cleanup is what
cleans up the secondary queues in that case.  Or, more specifically,
the guc_exec_queue_timedout_job() that it triggers cleans up
the secondary queues and cancels in-flight jobs.

-Jonathan Cavitt

>=20
> Every secondary queue holds a kref on the primary queue until the
> secondary is finalized, so when the primary is killed (e.g. userspace
> destroys the primary queue first, or VRAM page-offline kills bo->q),
> kref_read(&primary->refcount) is non-zero and
> __guc_exec_queue_process_msg_kill() disables the shared GuC context for t=
he
> whole group.  However, guc_exec_queue_kill() only calls
> xe_guc_exec_queue_trigger_cleanup(primary) rather than
> xe_guc_exec_queue_group_trigger_cleanup(primary).  When the primary has n=
o
> pending jobs of its own, primary's TDR never runs to set group->banned or
> schedule TDR on the secondaries: LR secondary jobs stall forever, and
> non-LR secondary jobs eventually hit guc_exec_queue_timedout_job() with
> skip_timeout_check =3D=3D false, logging a false GPU hang, capturing a
> devcoredump, and triggering a full GT reset via xe_gt_reset_async() for
> any secondary job that had not started yet.
>=20
> --=20
> Sashiko AI review * https://sashiko.dev/#/patchset/20261119174621.1311154=
-1-daniel.charles@intel.com?part=3D3
>=20
