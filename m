Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEB134EF0C
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422259; cv=fail; b=Cgj3XPbEm54EcM3soyw3uJ6Dv33cc3EE2A71l1dE6ZjlcDnaawtZtyMvPZPb+ohSsFbRi5VMWbtCwKzUmofXWOQjB73EFhpzIMIIDd3GuHpHtRaHmZ2Mew0rIWuf747t1nIcoQj0R//behATsmd31tADrBASYD34MI8q7EQmREU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422259; c=relaxed/simple;
	bh=uZaeYbh1g07UPkVLL20/XrCgkBSWKXtPJBvMmVIEaik=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fQitzheRFBujuYJIfXyqORPvsThjhdeGon5VU7IQXFUEieHYmAqXmyV5KIP+4BtKQ0fR0cVvgjEXxTo1RkSlX6pduZ3iAYf7fDMR8zo8o78RJBXgita7daAgiu5nps/NBLg+X7hZctWmjRDSJlvS/2jVLVfPisZO3pdCDeMpHCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yfl1Bs+U; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yfl1Bs+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788422257; x=1819958257;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uZaeYbh1g07UPkVLL20/XrCgkBSWKXtPJBvMmVIEaik=;
  b=Yfl1Bs+Uh8XoXn4H9z6qgyg4tmW5AuR3K7l2Io+FThiIsMaXatltjWeX
   JgxOyB0EVSMiVAO6eT4AeF6jDJ/vnSgjozbHcacr7KxqR2EHRkGvEK1Dp
   xcQCqKRgLBDA4GXP+e+ByIAEkmfRomdJBUcasApzi9FV9tIaLjnkBYXdx
   UmU89yVX+NZBH3T6uBSojftpSYds6gjimohkv8WYREbEjvbpAfmQklVOG
   mL33q29VQocoTKhq/HGBlug7jy25XSgj6nCRFh3wRE5s1bmUqdliHhR/R
   I9CPgGkVpkuTbZzNJ4r2tlTr51a/BIrEF34Vj6PpkgCdHZ0X4kz8FwH1z
   w==;
X-CSE-ConnectionGUID: gteWuSfbSa6WG7CtNOTqUQ==
X-CSE-MsgGUID: Y04Dbx6xRPSxdsY0sGUwsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92764427"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92764427"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:57:36 -0700
X-CSE-ConnectionGUID: 1SvrcSaMThSKWg1vTcRT/w==
X-CSE-MsgGUID: LA+cI8sXSL2f9qCg1uvyXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273802144"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:57:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 00:57:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 00:57:35 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 00:57:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Or83Dm7/QypKJkNogAr+JQa7UHbkPuw8fANmC1eWN4rStK3SnNhK294xzM9LwTaDprGXAfwB2XXadV/iR6lFYMttnHPLCfgGXyWhoevSR75FaWFGfytNhbxg5sigfBP2DsvFwXUOBOMvy6Y1qhl39/flIkHrmKArUcXGGLsosxesOvsuf0ORky0gup7Icz/yvQfQ4vh/+mUfvKu3rtrkXE9n4Udj5Fw6jRgfF9EsA9pYcYQvVfvxjbWEEJterUnZNX2dSGG5g825akVzL/6udJgk+F4dqXe4sDiUvC+/H8QyR5l1l+w0kds1YHq+yhGilirvh2WZ0OeV3ixqh0O6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdGEo8QC6CzL9dETjACHMRuC2/6/3Tk0bs7jRmNJsyA=;
 b=oHh/Wt7AwSaMpbAymcMckyrNhz3QGDCF2Re3LNa5s0yRDGYdJPu4JARiYQ0/MpVdi75GO/M5sV4y5ISssu1tKHT5o7s7BIqhDOR7KWT8fhgUvl3CabqMqyfhw5o+UsyK9f7tWymHqwBMQnezRgJR+5eWwC0+bSrviHMIbFez00EZ90UQDLB+1QoTrJdH9fcPcFjRNs4f33Rs/7KUkEcN+BNu9ICyD9J0UUxad6VErApUCSbnr08y9wEiIDJBrQLF1hMg9rzRzf6fEpyFyYpJZtaJAL2FVbKOR+RFWf0otNdW+BTi3ZqKsMJ4m+yR1ln42v1NWI9w5Ohxl3FXB8+cNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by PH7PR11MB6473.namprd11.prod.outlook.com (2603:10b6:510:1f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:57:30 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 07:57:30 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V20 09/15] drm/xe/vram: Add VRAM page offline fault
 handler
Thread-Topic: [PATCH V20 09/15] drm/xe/vram: Add VRAM page offline fault
 handler
Thread-Index: AQHdOusTh9iPSUbVPE6omdI6PTbKq7a7eYwAgABvVoCAAFjggIAAO4YA
Date: Thu, 3 Sep 2026 07:57:30 +0000
Message-ID: <DS0PR11MB87187C643C7FAAC2239C1C0581B62@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-26-tejas.upadhyay@intel.com>
 <20260902162540.841011F000E9@smtp.kernel.org>
 <apiraQytMqBPagvH@gsse-cloud1.jf.intel.com>
 <apj199Z8fF8NU3t/@gsse-cloud1.jf.intel.com>
In-Reply-To: <apj199Z8fF8NU3t/@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|PH7PR11MB6473:EE_
x-ms-office365-filtering-correlation-id: 1ac4e661-14f6-493b-e29c-08df09910155
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|10070799003|366016|376014|6133799003|18002099003|22082099003|38070700021|10067099003|5023799004|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: 7IfUTLtHpAbkMUCpejkeV18KH/ActNQZ+thj4DUB4oowFYLI2yOqzE7B8wpJVXd1ocCWyFDTnktbmuONE0wKefJQy3oLS+mZoh3939XsdbbXiwtfo3PPjxBXhVglASQvFrTNg86Uk3YIJRFHxY0ZELYoFdtkzo6cPyMqbDYv1pMA7rD88eaOPEa1NvT+xVgIL7f1EIuN+pitxN+s7d26ewCyBzdsPQEeqswswIDP+rNjk5H6/lSfmdY+Xa5ZkkqWWxiHBuydsVa16Zs/V+0QyvEsQ7eSQh0/w0gg3S8bDUttJvoPCOWhX6XpFjUW24pAgC1NZRm3QdmI6QGhDiRyd4ij/nBXLi8gtSz4BJFMLyk7+yqWo9pXpm/IWqs68Jq4nVr8t8bhoF5/u2QDtWBdIUyHp737kY+NsOIp8/fBz22zl5DdItCW9HSvMitLHbY6DT+A5bus1oQ/0viRU/CKLkNpR2sCrJSoy2DS5eYN+CfZ58H/hookrXL79qsG2i96dVldDoyN5fWQJaZDn4z1eIJIF3fpLH8VoeGjspFgzAU9Vsplj5IjyJd1IX1VInq1Sm9hBTGIh5hvoT4Fm+r8fhpafHxocWXQJYgpzh4Z9mXfTdEu/E940NiZ1fK+jJo33Hey1VAKFid4/+lzAYQQrGtmkmgrGcus83/DejHmU00=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(366016)(376014)(6133799003)(18002099003)(22082099003)(38070700021)(10067099003)(5023799004)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cQv5Hh2BdKUoKP+cZ/kOWjgoa/0TQWdOQEHb1xiy3id6Q2wCz+Z4tSeopsqS?=
 =?us-ascii?Q?Q02Lw592UTF7QJlKzeb96pbnUQR/NIM7Ihdzc32/7RZ5jBbQATwyL3ro1Iv4?=
 =?us-ascii?Q?tbJdh2C++9Ok5XDrR2/ya2BzB5p1bnXFvdYIIKFtvo2KTuiX/Vs8rIOLK9sg?=
 =?us-ascii?Q?1vFKpSAa35FwlH8MORNOuEjNqQ19Jeen6QjAbiK8/LWCxH3Wb5ti2awTn02W?=
 =?us-ascii?Q?goiJJ76+RKi+DCWlhvVwioh1FLe5Ydhwfq0GsNaht/gc/basqBTr3e7k97oK?=
 =?us-ascii?Q?o7J1ebMOhDMlBiZo26AoMAha48ox7WUEhPLAEGXh9wBd7vEB6DIU/5pRd7Ld?=
 =?us-ascii?Q?mROX1z0pwdnh80GXBbjNrjeMKmBCizBoDt838beov0+rfYIgUTH3sNoublqc?=
 =?us-ascii?Q?Zn2/q1F36G8H7A1X2Yg68XdYxlnDfZx6hEBl51PO/ttG5zPoA1futtrCrPLP?=
 =?us-ascii?Q?bRvgA+aFW7UBlM2mm03XjI/nkZ4Tbn3n5pFCNXn/ns8kdLrxYEGkujqZ6vPv?=
 =?us-ascii?Q?+jFtAT3Wtqiw6cvMmUNP07fsvlFItWsM6y+czCqyBaloYe/S5CVvONKY+5Qo?=
 =?us-ascii?Q?h3D8ksGLIE8kgr8r2JbgMS7Kw83XfaTuPBcU1HC6Fw4CkYNfQniKxtFovGoE?=
 =?us-ascii?Q?6RPiAG1bAioLxfx/fdJunhHz78EBPXzpCt8aqZcVk7R0jCtp6SCVRkPuY3TZ?=
 =?us-ascii?Q?FDRju3GXa5hMDiOPFTuokBvQAAS0VGH0mDtHdawu+053h7yMLcn97djo+aoe?=
 =?us-ascii?Q?8EY6nQnIeuBr2tFf7j9dJh3kZ3+WCeO6/ESjEO+TthCFSerY3Vwl7c/Y2csG?=
 =?us-ascii?Q?A4bZueVR0fTNM2F7suwqzPqXqqSopCMAL/dgdCMbJqZG6psveY+mlkC1b9gA?=
 =?us-ascii?Q?yDKa9yfnhX7XQXmOb+Ts+d73YeNpbu4TarLb4HnyzNuZxbgRLdlqaK/FZd8Q?=
 =?us-ascii?Q?CfsHNUuNBdXaSw1f5kX2oVk2dotrzS/N+GKD/l6gFbpK6BDu556ZkXIQVA5a?=
 =?us-ascii?Q?kt4lm2HSTDAAPU7uMNhnKFmQ60aWuD6fimcSb8c/JMS7QjpIIukZIOp7oIVd?=
 =?us-ascii?Q?dE8ckZr8tHWClkR5+2mJVMWoAUTrAExlyJPyCsJ7DuvoIPPjjopwsvybu9QO?=
 =?us-ascii?Q?+bYE4uxL72te5J89V6Jo2o9klgCJbyNNO2PpYBtiIe8sKWuzqgUz/irsiD0+?=
 =?us-ascii?Q?aoNPqLVFLJq++BOe7MK6RMj0mI0zues5fXpqrGu5+7pPj8ZlcYvwmiaxlb6X?=
 =?us-ascii?Q?wdPgbDetKOFAbLJKU8w0R2QdsEcbRwtlXy/RABQQS3UjsLlO7AaMWXNiYxzX?=
 =?us-ascii?Q?zr5v+bDk8PqvguMOiqf2g597Kqb/oCeS27AMXsLa6koz19Kf1AQZ/fljxuYJ?=
 =?us-ascii?Q?5q/UJJ6t9A56+uG9LGgbsNfcLQGns3jsgW+db/gF3itSPiwY7bPLgBpLKRb2?=
 =?us-ascii?Q?FzoGgheNz8QqEgFwCmTB63Eu88acFDNr6fQXy2wIGM0ZiwLQ148tY/Xs4BaF?=
 =?us-ascii?Q?BWHRgq7s+XnEhFtfB3Y8iOIK/uk7r03gYSjN7U1ai4Aej5tleyLq5NrMCUPG?=
 =?us-ascii?Q?qpa+84fl5nt5ZMeGkctysjtaDbQwi48ovz8AN8TXPJMdzjqZKnGq1eNcYHmC?=
 =?us-ascii?Q?Jttj0wdr8+gU/smR/gVXL6B+YVvPze2clh1jrPHJdcXaWMrgXfj/EJQhWMzC?=
 =?us-ascii?Q?yXAj9AQ2OwH1eoL+CDjaOb+uNDatIZR8OHMYmxd4Lz+p+92nlpH5ipOdstLy?=
 =?us-ascii?Q?Ti9vNCA7+csT5Q9+oejDP1XFxjZnITnPzu5zGVISpGbWqhSJprbCEb+d6isg?=
x-ms-exchange-antispam-messagedata-1: 5TaQUpbcN9YbeQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XLoLKNzBFVJaH8dYl0oYHdf4E2RKR6iFUHdBKRtdy0KQiQbYlIGASJbr3/9eivA/jc3p8+h+to+xv3vluxLXna5+qkssQkZIV2s6IMPTAX/MLVMrD3ac8ONo7DD2SJabZuW5oloqgPvXTsheA2NLNTVdisQnI0BGVOm//NNY21Ym6JmmUDzefWjQHhlBHRFZ0Vo9hI3PXr+MUDbByegp9LL5o8Tkd0UZVrRphqT+DjL38sNA96dph3oeP02Pmeh0mChSMaYUAufKTEX5YtPKoSqia3p4/pe6SA+xup+MwVyeOvMqVSSWiciD+oear/LHC8GjQ4xQP6T+U+CuvEB5dA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac4e661-14f6-493b-e29c-08df09910155
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 07:57:30.7106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKf9VSbP8sH/bQWy2JmZbS2/IZKhsKJz50R9CzCkrleJEZ0SjoEvyQbnjm5185uyf61B/kWA+eSjGfyFoUZMuLWWJJ6GGi5nRYcaIsf2coM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6473
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: 03 September 2026 09:52
> To: sashiko-reviews@lists.linux.dev
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [PATCH V20 09/15] drm/xe/vram: Add VRAM page offline fault
> handler
>=20
> On Wed, Sep 02, 2026 at 04:04:09PM -0700, Matthew Brost wrote:
>=20
> One mistake in a suggestion. Inline below.
>=20
> > On Wed, Sep 02, 2026 at 04:25:40PM +0000, sashiko-bot@kernel.org
> wrote:
> > > Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider:
> > > - [High] Lockless read of `res->bo` in `xe_ttm_vram_block_owner_get` =
leads
> to a Use-After-Free when racing with a TTM ghost object transfer.
> > > - [High] Race condition when offlining a free VRAM page allows the fa=
ulty
> page to be allocated and never purged.
> > > - [High] Forcefully unpinning BOs in `xe_ttm_vram_purge_page` violate=
s
> pin counting semantics and creates TOCTOU vulnerabilities.
> > > - [High] `xe_ttm_vram_addr_to_region` ignores the `kernel_vram` regio=
n,
> causing hardware faults in critical kernel memory to be silently ignored.
> > > - [Medium] A race condition between two-phase page reservation and
> synchronous BO eviction falsely marks successfully offlined pages as fail=
ed.
> > > --
> > >
> > > commit 23a2bf9a5461265765230ffd0e7a9d24c27ca918
> > > Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Subject: drm/xe/vram: Add VRAM page offline fault handler
> > >
> > > This commit introduces a hardware VRAM page offline fault handler
> > > for the xe driver. It adds functionality to purge the buffer object
> > > containing the faulty address, ban the associated VM or exec queue,
> > > and reserve the hardware page in the buddy allocator to prevent futur=
e
> use.
> > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > index d97739a84a2d1..0ab92bc3c6998 100644
> > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > [ ... ]
> > > > @@ -580,3 +618,295 @@ u64 xe_ttm_vram_get_avail(struct
> > > > ttm_resource_manager *man)
> > > [ ... ]
> > > > +static int xe_ttm_vram_purge_page(struct xe_device *xe, struct
> > > > +xe_bo *bo) {
> > > [ ... ]
> > > > +	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> > > > +	ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO
> mappings */
> > > > +	if (xe_bo_is_pinned(bo))
> > > > +		xe_bo_unpin(bo);
> > >
> > > [Severity: High]
> > > Does this forcefully break the pin counting contract by unpinning a
> > > BO on behalf of an unknown owner?
> > >
> > > In xe_ttm_vram_purge_page(), this unconditionally unpins the BO if
> > > it is pinned, stealing a pin reference belonging to another
> > > subsystem (such as the display controller). When the true owner
> > > later unpins the BO, could this trigger an underflow crash?
> > >
> > > > +	ret =3D xe_ttm_bo_purge(&bo->ttm, &ctx);
> > > > +	xe_bo_unlock(bo);
> > > > +
> > > > +out:
> > > [ ... ]
> > > > +static struct xe_bo *xe_ttm_vram_block_owner_get(struct
> > > > +gpu_buddy_block *block) {
> > > > +	struct ttm_resource *res =3D block->private;
> > > > +	struct ttm_buffer_object *tbo;
> > > > +	struct xe_bo *bo;
> > > > +
> > > > +	if (!res)
> > > > +		return NULL;
> > > > +
> > > > +	/*
> > > > +	 * res->bo is updated under bdev->lru_lock by ttm_resource_set_bo=
().
> > > > +	 * Racing with a ghost transfer here is benign: we either see the=
 old
> > > > +	 * owner (whose purge is a no-op and the retry path recovers) or =
the
> > > > +	 * ghost (rejected below).
> > > > +	 *
> > > > +	 * A ghost is a bare ttm_transfer_obj, not an xe_bo, so ttm_to_xe=
_bo()
> > > > +	 * on one would be out of bounds. xe_bo_is_xe_bo() rejects it sin=
ce
> > > > +	 * only our own BOs carry xe_ttm_bo_destroy().
> > > > +	 */
> > > > +	tbo =3D READ_ONCE(res->bo);
> > > > +	if (!tbo || !xe_bo_is_xe_bo(tbo))
> > > > +		return NULL;
> > > > +
> > > > +	bo =3D ttm_to_xe_bo(tbo);
> > >
> > > [Severity: High]
> > > Is it safe to read res->bo locklessly and pass it to xe_bo_is_xe_bo()=
?
> > >
> > > In xe_ttm_vram_block_owner_get(), tbo is read locklessly. A
> > > concurrent accelerated move or pipelined gutting can transfer the
> > > resource to a TTM ghost object under bdev->lru_lock. This drops the
> > > last reference to the original BO, freeing it via kfree().
> > >
> > > If the thread is preempted and resumes after the original BO is
> > > freed, passing the stale tbo pointer to xe_bo_is_xe_bo(tbo) will
> > > dereference
> > > tbo->destroy on freed memory, causing a use-after-free regression.
> > >
> >
> > This one is correct and this memory unsafe here.
> >
> > Luckily, this fix is easy...
> >
> > This one will need to be fixed, snippet below:
> >
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index 6a954018012a..ff937ab3837a 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -733,7 +733,8 @@ static bool
> xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
> >   * blocks will hit xe_ttm_vram_mgr_del() on their own and the pending
> >   * reservation is retried from there.
> >   */
> > -static struct xe_bo *xe_ttm_vram_block_owner_get(struct
> > gpu_buddy_block *block)
> > +static struct xe_bo *xe_ttm_vram_block_owner_get(struct xe_device *xe,
> > +                                                struct
> > +gpu_buddy_block *block)
> >  {
> >         struct ttm_resource *res =3D block->private;
> >         struct ttm_buffer_object *tbo; @@ -742,6 +743,8 @@ static
> > struct xe_bo *xe_ttm_vram_block_owner_get(struct gpu_buddy_block
> *block)
> >         if (!res)
> >                 return NULL;
> >
> > +       guard(spinlock)(&xe->ttm.lru_lock);
> > +

Sure

> >         /*
> >          * res->bo is updated under bdev->lru_lock by ttm_resource_set_=
bo().
> >          * Racing with a ghost transfer here is benign: we either see
> > the old @@ -788,7 +791,7 @@ static int
> xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
> >                 nentry->addr =3D addr;
> >
> >                 if (block) {
> > -                       pbo =3D xe_ttm_vram_block_owner_get(block);
> > +                       pbo =3D xe_ttm_vram_block_owner_get(xe, block);
> >
> >                         /*
> >                          * Critical kernel BO? Best-effort check
> > without resv lock;
> >
> >
> > > > +
> > > > +	/* The BO may already be in teardown with a zero refcount */
> > > > +	return xe_bo_get_unless_zero(bo) ? bo : NULL; }
> > > > +
> > > > +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, =
u64
> addr,
> > > > +					    struct xe_ttm_vram_mgr
> *vram_mgr, struct gpu_buddy *mm)
> > > > +{
> > > [ ... ]
> > > > +		if (block) {
> > > > +			pbo =3D xe_ttm_vram_block_owner_get(block);
> > > > +
> > > > +			/*
> > > > +			 * Critical kernel BO? Best-effort check without resv
> lock;
> > > > +			 * worst case a concurrent pin causes reset path
> unnecessarily.
> > > > +			 */
> > > > +			if (pbo && ((pbo->ttm.type =3D=3D ttm_bo_type_kernel
> &&
> > > > +				     !(pbo->flags &
> XE_BO_FLAG_PINNED_LATE_RESTORE)) ||
> > > > +				    (xe_bo_is_user(pbo) &&
> xe_bo_is_pinned(pbo)))) {
> > >
> > > [Severity: High]
> > > Does this lockless pin check create a time-of-check to time-of-use ra=
ce
> condition?
> > >
> > > In xe_ttm_vram_reserve_page_at_addr(), xe_bo_is_pinned(pbo) is
> > > checked without holding the appropriate locks. A user BO could be
> > > pinned right after this check (e.g., for display scanout), and then
> > > forcefully unpinned and purged.
> > >
> > > The display hardware could then continue scanning out the old
> > > physical address, potentially leaking data of whatever new BO is allo=
cated
> there.
> > >
> >
> > We should probably file a Jira for this, as I agree this possible with
> > the right race + NIC trying to pin the BO, but unsure how to handle
> > one properly.

Sure=20

> >
> > > > +				kfree(nentry);
> > > > +				pbo_to_put =3D pbo;
> > > > +				drm_err(&xe->drm,
> > > > +					"%s: addr: 0x%llx is critical kernel bo,
> requesting SBR\n",
> > > > +					__func__, addr);
> > > > +				break;
> > > > +			}
> > > > +		}
> > > > +		/* Queue both free and occupied (to-be-purged) pages */
> > > > +		++vram_mgr->n_queued_pages;
> > > > +		list_add_rcu(&nentry->queued_link, &vram_mgr-
> >queued_pages);
> > > > +	}
> > > > +
> > > > +	/* Deferred put outside lock to avoid recursive deadlock */
> > >
> > > [Severity: High]
> > > Can a concurrent allocation claim a faulty free page when the lock is
> dropped?
> > >
> > > In xe_ttm_vram_reserve_page_at_addr(), when a hardware fault occurs
> > > at a free address, gpu_buddy_allocated_addr_to_block() returns NULL,
> > > meaning pbo is NULL. The page is queued and vram_mgr->lock is dropped
> to prevent deadlocks.
> > >
> > > During this lockless window, a concurrent TTM allocation can claim
> > > this exact free buddy block. When the fault handler later
> > > re-acquires the lock and attempts xe_ttm_vram_buddy_alloc(), it will
> > > fail, returning 0 without purging (since pbo was NULL). This leaves
> > > the newly allocated BO using a faulty hardware page, which will cause
> persistent hardware errors.
> > >
> >
> > This also looks right. So I think:
> >
> > @@ -804,10 +807,17 @@ static int
> xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
> >                                         __func__, addr);
> >                                 break;
> >                         }
> > +
> > +                       /* Queue both free and occupied (to-be-purged) =
pages */
> > +                       ++vram_mgr->n_queued_pages;
> > +                       list_add_rcu(&nentry->queued_link, &vram_mgr-
> >queued_pages);
> > +               } else {
> > +                       /* Immediately offline */
> > +                       return xe_ttm_vram_buddy_alloc(vram_mgr, addr, =
addr + size,
> > +                                                      size, size, &nen=
try->blocks,
> > +                                                      GPU_BUDDY_RANGE_=
ALLOCATION,
> > +                                                      NULL,
> > + &nentry->used_visible_size);
>=20
> I missed adjusting n_offlined_pages and adding nentry to offlined_pages h=
ere.
>=20
> So I think check the return of xe_ttm_vram_buddy_alloc, then adjust
> n_offlined_pages + add nentry to offlined_pages.

Sure=20
>=20
> Matt
>=20
> >                 }
> > -               /* Queue both free and occupied (to-be-purged) pages */
> > -               ++vram_mgr->n_queued_pages;
> > -               list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pa=
ges);
> >         }
> >
> >
> > > > +	if (pbo_to_put) {
> > > > +		xe_bo_put(pbo_to_put);
> > > > +		/* Hint System controller driver for reset with -EIO  */
> > > > +		return -EIO;
> > > > +	}
> > > > +
> > > > +	if (pbo) {
> > > > +		/*
> > > > +		 * Purge BO containing address - reference held from above.
> > > > +		 * This does not necessarily free the blocks synchronously: if
> > > > +		 * the BO is not idle, ttm_bo_pipeline_gutting() hands the
> > > > +		 * resource to a ghost object and it is released only once the
> > > > +		 * move fences signal. The reservation below then fails and is
> > > > +		 * retried from xe_ttm_vram_mgr_del().
> > > > +		 */
> > > > +		ret =3D xe_ttm_vram_purge_page(xe, pbo);
> > > > +		xe_bo_put(pbo);
> > > > +		if (ret)
> > > > +			drm_warn(&xe->drm, "Purge failed at addr:0x%llx,
> ret:%d\n", addr, ret);
> > > > +	}
> > > > +
> > > > +	scoped_guard(mutex, &vram_mgr->lock) {
> > > > +		ret =3D xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
> > > > +					      size, size, &nentry->blocks,
> > > > +
> GPU_BUDDY_RANGE_ALLOCATION,
> > > > +					      NULL, &nentry->used_visible_size);
> > > > +		if (ret) {
> > > > +			nentry->status =3D XE_PAGE_RESERVE_FAIL;
> > > > +			drm_dbg(&xe->drm,
> > > > +				"Page at addr:0x%llx still busy (%d), deferring
> reservation\n",
> > > > +				addr, ret);
> > > > +			return 0;
> > > > +		}
> > >
> > > [Severity: Medium]
> > > Does this unconditionally attempt buddy allocation without checking
> > > if the retry path already succeeded?
> > >
> > > In xe_ttm_vram_reserve_page_at_addr(), if xe_ttm_vram_purge_page()
> > > frees the BO's VRAM resource synchronously, it invokes
> > > xe_ttm_vram_mgr_del() which triggers
> > > xe_ttm_vram_retry_queued_pages(). The retry logic will successfully
> allocate the buddy block.
> > >
> > > When the original thread re-acquires the lock here and blindly calls
> > > xe_ttm_vram_buddy_alloc(), it will fail with -ENOSPC because the
> > > block is already reserved. The page's status is then falsely marked
> > > as XE_PAGE_RESERVE_FAIL, leading to misleading internal state.
> > >
> > > > +
> > > > +		list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages,
> > > > +queued_link) {
> > > [ ... ]
> > > > +static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct
> > > > +xe_device *xe, u64 addr) {
> > > > +	struct xe_tile *tile;
> > > > +	u8 id;
> > > > +
> > > > +	for_each_tile(tile, xe, id) {
> > > > +		struct xe_vram_region *vr =3D tile->mem.vram;
> > > > +
> > > > +		if (!vr)
> > > > +			continue;
> > >
> > > [Severity: High]
> > > Does this skip checking the kernel-dedicated VRAM region?
> > >
> > > In xe_ttm_vram_addr_to_region(), the address lookup loop only checks
> > > tile->mem.vram and neglects tile->mem.kernel_vram. If a hardware
> > > tile->fault occurs
> > > within kernel_vram, the address mapping fails and returns
> > > ERR_PTR(-EOPNOTSUPP). This causes faults in kernel memory to be
> > > silently ignored instead of triggering a system reset.
> > >
> >
> > tile->mem.kernel_vram =3D tile->mem.vram in the current code but for
> > completeness, this likely right too. I'd check the kernel_vram if
> > tile->mem.kernel_vram !=3D tile->mem.vram.

We have no use of kernel_vram on drm-tip right now. First use may be in EXI=
, so as discussed let defer this change for later.

Tejas
> >
> > Matt
> >
> > > > +
> > > > +		if (addr >=3D vr->dpa_base && addr < (vr->dpa_base + vr-
> >usable_size))
> > > > +			return vr;
> > > [ ... ]
> > >
> > > --
> > > Sashiko AI review *
> > > https://sashiko.dev/#/patchset/20260902145343.465686-17-
> tejas.upadhy
> > > ay@intel.com?part=3D9
