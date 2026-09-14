Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CF3340281
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 21:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420623; cv=fail; b=MdMIw8OgIFmyJQ1weveW3KlxeOY7gkIkjXqHu+G/o8L9Ue8NVwP3Zws97Q7r0rIYd9BKd4ImM3zVTQ2qq7eyLtxTTSnkVyMNrKX02QOl61SfL/0P7mHTbvlxnynJQrMcryjdyAZCF2+Vc9uZTg0YtuPQy/R/4zXobrYD03+cobE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420623; c=relaxed/simple;
	bh=x8xXHpuRzBZUi0eGF9JV7b0+h0KNdfmHIyI9u85MqYw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NzwxJOH8GVys98z+kKNychw+9jS70p3jr6jf3w8YjK8Q0WbRfyHqT8yLnpkVOO/VkGzYPwe8sEUGaeKnT+HS9suYvqiS+B/v4UMdoZduXNtoF1SRxisEn18wd/SXtQr7+/Gla5RiSvB7l/3MnV/WTbnKCudYpgk0KXdGu9yPZZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PT5HQPVP; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PT5HQPVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789420622; x=1820956622;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x8xXHpuRzBZUi0eGF9JV7b0+h0KNdfmHIyI9u85MqYw=;
  b=PT5HQPVPlEp7YPvynh0zYIQnQTkqkUU97ZJq/k7aic22MYQzVqWBTqKX
   P+wvvKgUpSX4AuYDAT0Ya0EH7eH3v5uNtCKAH5hbOBgXmez4FlCo8cTL+
   qMUjqQlisjMs65iqu3rdyw0Z3P21/zJzZG5c4nGuj+hE7UQspUdO4nf3N
   BruGYlNyh5zXyAFx0LFL9B7oMPSRbbmUjDRM7KnyzA9fmI0iQt2Loea6r
   eRoD6l+7NVvpUsTxpZFZkNzHjdGRL55p/qGXn0mfOJZswoAvm3KXqG+Px
   KJv5A0mkrJjmuVsJYxzqPQ9QmaaMpulLKl+kjoemZAvwCBpc7e+CxmlSy
   Q==;
X-CSE-ConnectionGUID: VYppvof3RPadY7+YsjCTrw==
X-CSE-MsgGUID: GPtzlF6+QrKxHUW76+4ELg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100933842"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100933842"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:17:01 -0700
X-CSE-ConnectionGUID: FWtHc0tfSOGYIfPN141vcg==
X-CSE-MsgGUID: JSzEEZtdRpSp0X3fBBco5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="302641513"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:17:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:17:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 14:17:01 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:16:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVqt/EiJpeAj3K9ud2rJnWM4wEfIdQn2m16ybY5dswL7nTWOUVD6qE34/1foGstzY2FndnFy2sTZ8za0Z1K5DgjpHGiBjE3+zTKfCNFL5Q3Eu1RG/FeMrqlTM9s3mvj88ln9xyFUMdyvNODSoLmdZe5apTl6F99QZkHVUkp0GmW+Awdfle/O374Aqmc6QWiSohM9kbTfdjkMbBdnXx7GXCEzEVBar5mCFSqUyZZKq7sdJUd7wnkYWGt5aDis01+qw0yBb6iGJelXOb7OENEHKO+0BrTKUnaIWi5og9HniwNBxoUgefaC9pRGZaZ5MbKIbAkN0TtDQHmv6SmPMP9Ifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mI9AU4g8zwI8i6XUGdpWObXTxVXHMiUnVe0Qj5o0G0M=;
 b=Qxo+YMYc+4raDjxztFGlbaQQza10KYTwsbd1jNMm3uwOA6bdyXVSoL0LXCHAoH5ktP9GVkGx4wyeuE2Q6pU9ICJVwVTavmRKeUchYF8sTrSXm1eL/GQo+ZZg54Zpzf76Zg+4FgxpFzeck8UICi9ieSlk/l/KPP3p5UYVVh09RldaKdMXSJ1vRe7P6H6H1lWSsN1hGMP4UwfX5QlCFFWFi+ZmrUgk858x7ZQQUHgByf7Nf+VoRsybl7vtEM8ANAbGbw62spsZAMvEIh0GBrUQmepw2M4ddfur//kq5HOfVJNnwSuqcYIeve/Tes6rD6WewNII9g9HbmkiV+nHP5/SCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by PH0PR11MB7635.namprd11.prod.outlook.com
 (2603:10b6:510:28e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 21:16:56 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:16:56 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v8 05/20] platform/x86/intel/pmt: Do not remap when using
 callbacks
Thread-Topic: [PATCH v8 05/20] platform/x86/intel/pmt: Do not remap when using
 callbacks
Thread-Index: AQHdQinaM5YIARaYZUSgD8+O7V43+7bJ00EAgARuWgCAAFZ8YA==
Date: Mon, 14 Sep 2026 21:16:56 +0000
Message-ID: <CH3PR11MB04614995E902A465623F5148DEC1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-27-michael.j.ruhl@intel.com>
 <20260911202614.E8FCE1F000FF@smtp.kernel.org> <aqgbdgS-YL3tW91L@intel.com>
In-Reply-To: <aqgbdgS-YL3tW91L@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|PH0PR11MB7635:EE_
x-ms-office365-filtering-correlation-id: 85801ecb-b9e4-438f-0ee5-08df12a581eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|3023799007|38070700021|4143699003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: DR73Ebuvl4fsErwTpaTYvNhp/yh9bDd5jJnHG1DwHXXOmMqkFcoybE0NaVFnSqiWav3KbrbVjpypOFUYdznFcN/jw8Wn22yGKQtbUQncBXj0tsZ33LF6AjCGG895VSxD5n4nBr3xrMvU5Qe6HSRGAGMkzQ/s4pVzi0hjNjVsYOafVvfMEPqnzXjEgtft4bqwt5HuJvKmNB/crHla6JjeVtVxJQTX+OxhSQgcSc8NnO5Iy3Yi2DTR/8V+6rUl9jqCeuIFsv33+wBfMOkLoZ+4qm3sTtd4Hou9c6F6kEbXnVfSBX98o+7JFjT669+Q61W29To4ryZnOv/lVf+4vhXnDQFmAtmZgtxkzP2NSd8KArE2wUvrlsVNNPNphPxdEUNryPDwu5LQYsdR2ncmQMlyMV5XS9HyiUhmUK1pXGORgQtuLhkdPQJZhSv7bQCb8WFfguMp/8gbhzJZJ3/uvmBXUzNU2B32sUyh3rNRREaeLHYK1P886NdQAsijeSXiuCYkomLLtE7P3MKR/PWl7a4A4+jTQmqZshFZFIP/EAYDPBxiHKJnXI++OxTpX36gFF4mPFYmUIeXIhkB52xpJYX2uQ40HtWu+tZ2eqowbZEJkEuLF7cia67rr3fmMAk39kbVuxwdwshd3MC6ia5OHwaJoDXBpRo0xNwHq+SajKlzDoA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(3023799007)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8aFsfTRLgvJn1ewXA9OkDzuXD1NmlOJxCsZ8s1k/iEs70LuGTyyOA8mBEs6D?=
 =?us-ascii?Q?K9y6XU5yoUCGxGWceXv2A85seOT9Qi9r0PxKbuGDAw39DzLESAu5pSee8rYK?=
 =?us-ascii?Q?fKqgU/p7PPokfa03rXYZMaY6GTrrMhClURECcND44nC7+gH4WRMt7i0IItP+?=
 =?us-ascii?Q?2mA/t16Vy4E7DdXPKk24sy7iQVKMdhrYeDAuY9fOz5sbh33eRdb9Z+5jKSI/?=
 =?us-ascii?Q?iyD6D9iilfPDVlFFxaDmwmJ4JndqQcKH2b1QepXYEYw30OpLeOwm2wfVq0Hz?=
 =?us-ascii?Q?LTfa7bps9Rpv3hMCk9AN3TwM5eaFWctibfcsQFhyEWaokM39glht09D4Zojr?=
 =?us-ascii?Q?v4mCj4eQwQs7CZ9pgAuUksu+w7Pv45tcYfWJR/8R0STSWuU0ff5MvBvItISs?=
 =?us-ascii?Q?+it0ExI6IuQsXog7wPvCUqsVwPBjW0jRqi2EMp4U8c7IVsZokCznn0oMFsrU?=
 =?us-ascii?Q?RvAuy5uYawk7gh21ZdE+rTTQp5cn1siQrTfgDzBod1TFCDKBqCGeo9bcEocM?=
 =?us-ascii?Q?7dlEazZEWYx9tJZzRTK+M8nvGOmDGB8cWo3tAMxTdnCq241jB9gFtdxh7xJX?=
 =?us-ascii?Q?zqhz4tM9+j7LKPlQ3cXfLFxo1Ka/EljiBP3oDv99aCobx9qHkosMuDhpszyh?=
 =?us-ascii?Q?Zew0xzeVq03KMTsZRtngQknpTGvKPhPjxlVanY3m/ywJjykTd24zgF2bJUDA?=
 =?us-ascii?Q?Uv9kil5lBFSmmkO0XuRfyA9vgRwxK4NGPCgq2zddCtSaObILiI1YpKeNhpuk?=
 =?us-ascii?Q?PHP6XwZJtPbe8YL7gj2Kn2AUhRI338FNdJv6h56zVG9f/MzuI8Ja22zbDJaq?=
 =?us-ascii?Q?19Uq8CUXil6xxWGFSJrVvfnCEVqGabsVrkqxJJD6EEjQaagFXrC8uTdVnjYD?=
 =?us-ascii?Q?CBzjA/rDUGmvaLmuFb7ZG6F91CdRboXpor3G9tZ9R7nQER/epDmPMLK0zSEr?=
 =?us-ascii?Q?RgzZM9vdPR7u4epy54IHXBRjEOA3rJoFTOKS0AZhkgvosFZY5iCTjrL4oyOw?=
 =?us-ascii?Q?Wa0So3l0Z0lnj48qCBBrhxB9tyqbanX0qrm2ScaaGhVjP/sFngZ8CrToAurq?=
 =?us-ascii?Q?VqmDBk9zprslFahNhy7dPWn2Bz5Yxf2CyUeF9xis9ACpFOXC9+VLVoDYgIr5?=
 =?us-ascii?Q?jnode0OGwUbV2OeqbX3b7F8BhBbqS8JZskDUf+vLUIZz7UwrM0qaCyny3RfU?=
 =?us-ascii?Q?jQv7ImfQZBcMtdYmCx1SFB8Mgj+Y7BKCiPdcZPWDLd1fgmthYzOMzuX9OtTE?=
 =?us-ascii?Q?LFibCUHB1WJhdBvomNL9zRi8cQZbuDu9tKOHwfUdCkqBJ6QhoQDrPc9z2gcF?=
 =?us-ascii?Q?mGMAcdjAL1dL5Dxm1WsvNgZKeqBmGSmWghDyULFVU1OyaENWDKVPhOVIAPe6?=
 =?us-ascii?Q?p906062+YxTOj4vbWz0mDcSyVRt70k3EU8roHYJuK+XHZKWDV5jwIJx85SHm?=
 =?us-ascii?Q?qNrUKqGfd69Vl4Lv/u1ZLC+SyiISGB/XqFCQS+78h3/u9tw81SH/0rLWbcZw?=
 =?us-ascii?Q?uEhdhlwitX6U7fI1vzs2yPKNO55a+Wa6X9O+uFrkNddz67T1UsfNWFxesGBS?=
 =?us-ascii?Q?fNrSdSCi/PCwcrKhfDLU3GH29DBdOA+DV3/jp4lw8L3kuJ65DhjrgiziYPg/?=
 =?us-ascii?Q?IZfxr2zj0P5pqyuWDv0GuoOUH0+E8RDvHi715+71lMa9E00YxSxeN2jnZaJM?=
 =?us-ascii?Q?jJ5aFJj4CkUFJtU6AEq6pmHTaV52yE9N1JMBrOnxY1z0qv5/EfpY01pHbD5O?=
 =?us-ascii?Q?cVrIkTkvOQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: X8hi7tREowEWzseTC6gjBFOvzWksYtRnamjviJeKgPms0dObzg5rJD27ki4pyi1kBqReay0q1ey3c+PgHyRT0rPK0zGzxBk66xxtCxmHdw1aCTgwyxAXrWMXXLTOvg3jAiHSI6c7KJ9g+Oy+bDcrKD6/auX7QAhhXaE5/9VD/XdBNtpCUkcOJe+/6rVv4o6UunBNlJWWU21mGP4qpnf3akeEoVykMjagN5uavjMyuUvHUfIhTDKBs8ndkK593rhykjuQ198PxKQnEslBBL/bOWmNQJcjxsXrfSy0yMXFVuvZwH/8PsUfNSVSnqeEUJ1COUbs8l9LOk6GRY78EUowcg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85801ecb-b9e4-438f-0ee5-08df12a581eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 21:16:56.8406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f0mAsMWz23RyieED9WfsNnk+h6BvfTNiO5Hfz41s3XxYApkOZnE6itXN1mb97ouA61QMhZIp4aZeh8j1X5udt98qIUV2QCaDQhNl2AHqghE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7635
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Monday, September 14, 2026 12:06 PM
>To: sashiko-reviews@lists.linux.dev
>Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-xe@lists.freedesktop=
.org
>Subject: Re: [PATCH v8 05/20] platform/x86/intel/pmt: Do not remap when
>using callbacks
>
>On Fri, Sep 11, 2026 at 08:26:14PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s)
>to consider:
>>
>> New issues:
>> - [High] `pmt_telem_read32()` does not check for the `read_telem` callba=
ck
>and unconditionally dereferences `ep->base`, which the target patch now
>leaves as NULL for callback-driven devices.
>
>I believe we need to address this...

Ok.  I did address the mmap issue in another patch set.  Can I do the same =
here, or do I need to
fix this as part of this patch set?

M

>>
>> Pre-existing issues:
>> - [High] The sysfs `mmap` interface (`intel_pmt_mmap`) unconditionally m=
aps
>physical memory directly to userspace, completely bypassing the `read_tele=
m`
>callback required for safe hardware access and power management.
>> --
>>
>> commit a61b8465842029c0f2ced5b0fa7ec2cd402fcbfa
>> Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
>>
>> platform/x86/intel/pmt: Do not remap when using callbacks
>>
>> A callback indicates that the parent driver is responsible for accessing
>> the data area.  Creating a PMT memory remap is redundant.
>>
>> If a read_telem callback has been provided, do not create a remap.
>>
>> > diff --git a/drivers/platform/x86/intel/pmt/class.c
>b/drivers/platform/x86/intel/pmt/class.c
>> > index 402d51df834a6..1c7a372b4fc42 100644
>> > --- a/drivers/platform/x86/intel/pmt/class.c
>> > +++ b/drivers/platform/x86/intel/pmt/class.c
>> [ ... ]
>> > @@ -403,14 +403,19 @@ static int intel_pmt_dev_register(struct
>intel_pmt_entry *entry,
>> >  	if (!entry->size)
>> >  		return 0;
>> >
>> > -	res.start =3D entry->base_addr;
>> > -	res.end =3D res.start + entry->size - 1;
>> > -	res.flags =3D IORESOURCE_MEM;
>> > +	/*
>> > +	 * The read_telem callback is responsible for this mapping, and may
>have
>> > +	 * different requirements for use. If the callback is present do not
>> > +	 * create the map.
>> > +	 */
>> > +	if (!(entry->cb && entry->cb->read_telem)) {
>> > +		struct resource res =3D DEFINE_RES_MEM(entry->base_addr,
>entry->size);
>> >
>> > -	entry->base =3D devm_ioremap_resource(dev, &res);
>> > -	if (IS_ERR(entry->base)) {
>> > -		ret =3D PTR_ERR(entry->base);
>> > -		goto fail_ioremap;
>> > +		entry->base =3D devm_ioremap_resource(dev, &res);
>> > +		if (IS_ERR(entry->base)) {
>> > +			ret =3D PTR_ERR(entry->base);
>> > +			goto fail_ioremap;
>> > +		}
>> >  	}
>>
>> [Severity: High]
>> Since this change leaves entry->base as NULL when a callback is present,
>> will calling the exported pmt_telem_read32() API on a callback-driven
>> endpoint result in a NULL pointer dereference?
>>
>> In drivers/platform/x86/intel/pmt/telemetry.c:pmt_telem_read32():
>>     ...
>>     memcpy_fromio(data, ep->base + offset, NUM_BYTES_DWORD(count));
>>     ...
>>
>> The function unconditionally dereferences ep->base without checking if a
>> read_telem callback should be used instead.
>>
>>
>> >
>> >  	sysfs_bin_attr_init(&entry->pmt_bin_attr);
>>
>> [Severity: High]
>> This is a pre-existing issue, but does unconditionally exposing the mmap
>> handler to userspace allow users to circumvent the hardware state
>management
>> that the read_telem callback is meant to provide?
>>
>> In drivers/platform/x86/intel/pmt/class.c:intel_pmt_dev_register():
>>     ...
>>     entry->pmt_bin_attr.mmap =3D intel_pmt_mmap;
>>     ...
>>
>> Because intel_pmt_mmap() maps physical memory directly to userspace:
>>
>> In drivers/platform/x86/intel/pmt/class.c:intel_pmt_mmap():
>>     ...
>>     if (io_remap_pfn_range(vma, vma->vm_start, pfn,
>>         vsize, vma->vm_page_prot))
>>     ...
>>
>> A user can read from the mapped memory region directly. Could this bypas=
s
>> locking and power management (like pm_runtime_get_sync), leading to
>hangs
>> or Machine Check Exceptions if userspace accesses PCIe MMIO space while
>the
>> device is in D3?
>>
>> --
>> Sashiko AI review *
>https://sashiko.dev/#/patchset/20260911201148.1610547-22-
>michael.j.ruhl@intel.com?part=3D5
