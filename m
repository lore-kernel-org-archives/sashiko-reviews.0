Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788AA1DA60D
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780411134; cv=fail; b=KILt3lLaRCfrscTyNPv6Vhnuk3olW/DmIO5H8SzfijZN8rMy/DJWDDhcBHheb7ZXdRE4gyyHwNnIt10xCIiyLFdDdU/0SO3i++TlkEF9Amc7mfrENQ75Dl0Ta2/QL1N+YJvuO4Iyuoe9Q4RDdhIsOx6pkFrV7XEffj6lvqEcOIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780411134; c=relaxed/simple;
	bh=zHnI7pgis4rtRir5b9dFnaA61d1epTWyRAXGo/TNlp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=APVpnsirYZX8EVbPvvcO73leRpAnTcZlrk0fYr+qr/DFEpwldEOXTVBuPIVHTRU9XsVBYz3Fn3O3M+R9vSy1dlPkpmv63oN4KrgiKmyXvx//kQsT3VmoJV6SQYUtnyxg4mO0eXfN3M27XiSHqzlXCEWauGMRIbUdKiwU63K9k1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WHc9qOoz; arc=fail smtp.client-ip=52.101.65.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WHc9qOoz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKurU1TSaoMQNbW1nR/G+mprzpOaiVb8ekUuQddptQ3vbBc0oyKUh1itnT4ekC3DEQBeXKgvIXvz7/IZDkUK3YMMmHUSp0oj79C6kfwHpnuSZIANvjkhUjPqsbW8muA/DyT57uvo0UIQj87DCeOmKBeVOaF3GaSAPjGx6IPcbGv+Xc5AL2VRh523nWMBe9e5eu5OR6Gh387Ct74RTAUeiAqn+r2L90LH4smwSzOdQUrZmc1C8ksaELbnwJ7gVMxCe2QXPNh3MNvK0snkv2+OOW6zT5KldCRGmRcyPJ+bmctf9IFFBhpcYsv1JSWH4YZ0dFN8yJ7LlRlxy7ayzQzoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfB1uAUNd9Bg+6I2oMavp7SvgAkOVCMt8eqxiwMJ9ds=;
 b=bRwXIN316X58bXC6l2TY2bUyEozcocEMVb04ZiwF+CiawLBwNv/t8NTGdveDgWsFMfUjYwIz7flIPdqaYMIFYvYXJUcttHrPcbRwWcsalg0kkgFW26hwM9b54QO4KSquQW540qxS2Gwas+Cx0HIy1w9aDmbCtC0Sez1sfLcAmKFCJZmEExYYgkj60sTWy0d5SpFTDDNGpCJtSnrnYL7Jdro4f87nWNPECbgSC0EaLmKefgbHavUvyH2bSM5QiN8mnhgxnv7E55pI4O1i9ui1NxB92/kyIP5qa2iCYGjjSnW5ccA/heMxOjiBbRHqV9kQcZAh86vMTW8tQ8v25vB2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfB1uAUNd9Bg+6I2oMavp7SvgAkOVCMt8eqxiwMJ9ds=;
 b=WHc9qOozwJCKXwG23YzsBUoR+tt0Bmbpnpan1eRvw1EBLf8MczysfRBLhcloGpJB/J3lX+/cTpO31cLCfWZxlJDNWtEewEyVd5Bp4dniMZdMhEKmWUboloKB9eY9UIlb8MKRuVY9/QQAOr/6/XXir0x6X0ipqng7g7mb31/ArMC5MwCM+bnzIYuPgaeHNUwBjSYG+boVZhIsHpJ9mVWWHTvyNA/dcDjZ5e368zHFJx+7DgwnuPV1zLdaWg/cH1GdAciE10q3gnmwCNnuHLiQ+xa8ujLuJ827kwehpqpNJSpp8CZljOHJnnbe2OZzIePvWaigvN6Ho8Ga4idup9LoXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DUZPR04MB9967.eurprd04.prod.outlook.com (2603:10a6:10:4dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 14:38:48 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 14:38:48 +0000
Date: Tue, 2 Jun 2026 17:38:45 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org,
	neil.armstrong@linaro.org
Subject: Re: [PATCH v2 phy-next 02/15] phy: lynx-28g: move lane mode helpers
 to new core module
Message-ID: <20260602143845.iwhimj5utn6kidx5@skbuf>
References: <20260529171509.1163787-3-vladimir.oltean@nxp.com>
 <20260529172706.50EC21F00893@smtp.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529172706.50EC21F00893@smtp.kernel.org>
X-ClientProxiedBy: VIZP296CA0006.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::7) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DUZPR04MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6a3877-f79e-42d9-3b2c-08dec0b4a835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|10070799003|56012099006|6133799003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	S2atVSelqN+2oAIw1WsGc6pCv8TDrw/PdBOfQsRw9siJSpAXntjytF7GQVyxJMksxgzKpH9E7fQ0yzXLISO/rfw/OGHezVtPwyX2xiKLs73oPX4l0B0fCZ6suJFKIQWD5hDXYZMYjVJZN01NqE1iRQwfQNcsT+KsZUAIMVtH0OrI3mxtPOBUdN+TkbS5gcYTyii6U20rkF14wR1Tx0ASGioFsQTyqzucbTHZLG2UY5fbX8jjqztms/1lY+ayw2OciAnMdk2mt0si9tug6td8Uk/ShthSglWbqKB66AW4a10fjcwkp5Jx2F220Ru5VsphR1L4n6CN0gBzX6zwXBphUvhEWAafNdMMNEoI7rQhcRvNg4PKocsTuQk6gj5FsEK7qK24Ti0KX1GxYUq1FwYMSGSXErMrqtcQlF/gUkXHbJHZ9qUNVdBRY/TPw9E2iZJqx4Kp56sAHkxTIIbR0TkvxnUk0mAZ5uyUT9sW/PxxG+itsarWYHW4EbDV7i2BEo1JN5uH8Ua9LwhKVK62KuFIs9W7rSwewugQ7k+NVhvzgIhnXaQHK1OjwCjZnUi3Y/FcCeX7gYDWxhiEam1dBTHFGvrqN09nDiVCX3qo3ZL7MSJoNnaj+g6IFsDepeoyZbAGJv6o6ndkHO7Nt3COBvPNoFy5QvCwoE2vWFg6amK3IsetcZYd7dMijdhGgDpsNMiY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(10070799003)(56012099006)(6133799003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2egD+KxiGi3Lgy1SeGSWC8+2oUd5qAcdz04s/q8vWLdCy1EiiAioT09ftV4p?=
 =?us-ascii?Q?EF3HRxbvZN+k45KqxDTThuOnrzeQwhWmey/KOGJqSCgtRsWg+1rDCxVePix/?=
 =?us-ascii?Q?hap8rvDXJ7aXqGmsVWSWE8tbGxzeMWmnvD6FVGuGzfZz7vgiU+1l7eScYNiG?=
 =?us-ascii?Q?olErwG+hOjrFWzlHIlm6hLTv3mEkseWc0OFKTq/ezSFQ2YhdQ2iSXhAV3zQ4?=
 =?us-ascii?Q?enpN02KiRC/5FcdaS+dPuGUhy+hNtpqpzOTDony+0wJdA8VQryz5XI/G2+e+?=
 =?us-ascii?Q?b0n3fkHNNKjUX92rWcPa8v9M0C+p8nHfPjPAjGFc0Clc4GO5bwZ8L74zFdYF?=
 =?us-ascii?Q?OuUc26UL7RJ01ts/ekZ4wbpIQens4LZkWmo/HxIIFTcWO9aMoeLrK/ndXMcR?=
 =?us-ascii?Q?Stv6FnSgncSh0h4ltoVjeIjJMVpyGdJhmHPokmvFrK3HULDHoHTwqpIGAK8G?=
 =?us-ascii?Q?wzmTb70JZHXJAemXzNnriQzKvtgBv7IeB/lewC2YOaGk5SNnVqcRKR8GTcnv?=
 =?us-ascii?Q?sAWx6j0gbYZ3a+W2fWcEG3/9IUc1k8xjV7bqsLEPgkj0uTtl3c6rmu37BNZy?=
 =?us-ascii?Q?e0scZNp2TVvQXC/61c5FrQhNuQjAxKZxW7/o69er0VOZaxFBYmo1BQE56vrA?=
 =?us-ascii?Q?JqxMTP5jBgQTnS+F7FfkfaSD3XL8nFasUabOA5zSyz43cIJR2O5kDrGOi1io?=
 =?us-ascii?Q?8x8BEUEL3wdAbwhodxeibrfpHfFJQPiB/RsPWZ0o23V2guGGnm/f5LUYv7/O?=
 =?us-ascii?Q?ci2zv8F+E+m1n2LaxFc370MUdSgWNch9sqFCrGV94DTfCkjIfhVIWcMrSKJk?=
 =?us-ascii?Q?bz6sJ0+p+HmgkPyWppDiraE17kl4ZPyyXBLjcZ4QxXuMVkuOCqr/Wogux1EI?=
 =?us-ascii?Q?sECyp7DijJxssi1pua2emnyOb607RMrR9ZBX/6ZLAzgngDKnVpX0I9qn3NGZ?=
 =?us-ascii?Q?cL+Zwa3SS7FLHqq82flxmOdKPZOeZk+cNtFKuT81QahdRd6Z2+Pi56qPFDyS?=
 =?us-ascii?Q?CW9cFUdhUxaxNT5t8YHRbpEH22sMc3m3KfbpZAyHwAKKvGuEshFEWNqDHGZ7?=
 =?us-ascii?Q?3fsrVcGq6tSI7CvB7xT6STbBg7Avw8ZRLqS1ArzMPlL0pphnUU+kSV/Kfx+J?=
 =?us-ascii?Q?5pJCMG/28uPBFVgNNahXTYvZo90roEHAlSXRmKn4gH+6fLRSYAqJassdclNI?=
 =?us-ascii?Q?l4TrfbliFUE0uu+FCA3Qh3AgpICPYOBMLEhcMxFyU7aPvLfOlb2QlNdqw6wB?=
 =?us-ascii?Q?wgS3jpoDE4QSy+rbjB6NXOIP05C4qM7s+bK79e1kHU5sc5MfBUJ26WR9UALi?=
 =?us-ascii?Q?7GES0XVEeGcfm8DcTN9FoygpNyRGCdrgMnMazhCjoChDWuGYipMOKWpy5TVm?=
 =?us-ascii?Q?a9//udqQfRJL6HHbp+8rL45+EtTCmdU78KWCd/liAZKGgbK4XdZE9Otc/55Q?=
 =?us-ascii?Q?NpXR5hNi1jOoDYPysot99tQiI7anqtgNuzOW2zG39VnU0tuSOH2t037lljd5?=
 =?us-ascii?Q?w+WEA7TV98oPBtiw9MHL/i5XINGYwJ/7Pi4knUtDz1cpihaFH9TlvK8gVfEN?=
 =?us-ascii?Q?WxRHXngd3kGEyd44VJYe0OE5fYgehnyJ2wFhXX8R+NXVeIiNacUL9UGRWNBC?=
 =?us-ascii?Q?BgYw1yRaw4HjzlwvkXH7VO8ViNVQM/VkrVKHJ1bLG51y349/ZB+QlA8Rtl7t?=
 =?us-ascii?Q?pIcXGTIVqPUdUkIXlmxNNEsk2bR9KZcL67m0H0eWA4WqzKUPBUi1ONVPLUSY?=
 =?us-ascii?Q?Dxnd1r8DHaWWgxiSoDVrjdRqcdWy2BpxavJwIlBU+Bm/Hdx8+SMJjZRL/x9x?=
X-MS-Exchange-AntiSpam-MessageData-1: 7lEcKsm7PxOCM0ExqHWEqWAO34bGH92tnHA=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6a3877-f79e-42d9-3b2c-08dec0b4a835
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 14:38:48.3868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G86nRtnrmByDlD/EwGGmQMTvExb2IN1d+PF5nEu5x0hD5DIENuA1FCy0hTKCNx7pmOK9TnOVpmlD9yZVzgfKNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9967

On Fri, May 29, 2026 at 05:27:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] The enum values for `lynx_lane_mode` are globally exposed without proper namespacing, risking build failures due to collisions.
> - [Low] Invisible Kconfig symbol contains useless 'help' text.
> --
> 
> commit afcf6c44814cd194adbadc7748b22b52095d7d42
> Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> phy: lynx-28g: move lane mode helpers to new core module
> 
> This commit extracts lane mode helpers and shared structures from the
> lynx-28g driver into a new core module. The lane modes are exported to
> a public header to allow coordination with the upcoming lynx-10g driver.
> 
> > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> > index 81f53564ee156..a87429f634ea8 100644
> > --- a/drivers/phy/freescale/Kconfig
> > +++ b/drivers/phy/freescale/Kconfig
> > @@ -51,11 +51,18 @@ config PHY_FSL_SAMSUNG_HDMI_PHY
> >  	  Enable this to add support for the Samsung HDMI PHY in i.MX8MP.
> >  endif
> >  
> > +config PHY_FSL_LYNX_CORE
> > +	tristate
> > +	help
> > +	  Enable this to add common support code for NXP Lynx 10G and Lynx 28G
> > +	  SerDes blocks.
> 
> [Severity: Low]
> This isn't a bug, but does this invisible Kconfig symbol need a help text?
> 
> Since this tristate doesn't have a prompt string, it won't be visible in
> menuconfig, making the help text inaccessible to users.

Will remove help text.

> > diff --git a/include/soc/fsl/phy-fsl-lynx.h b/include/soc/fsl/phy-fsl-lynx.h
> > new file mode 100644
> > index 0000000000000..92e8272d5ae15
> > --- /dev/null
> > +++ b/include/soc/fsl/phy-fsl-lynx.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/* Copyright 2023-2026 NXP */
> > +
> > +#ifndef __PHY_FSL_LYNX_H_
> > +#define __PHY_FSL_LYNX_H_
> > +
> > +enum lynx_lane_mode {
> > +	LANE_MODE_UNKNOWN,
> > +	LANE_MODE_1000BASEX_SGMII,
> > +	LANE_MODE_10GBASER,
> > +	LANE_MODE_USXGMII,
> > +	LANE_MODE_25GBASER,
> > +	LANE_MODE_MAX,
> > +};
> 
> [Severity: Low]
> Since this header is now globally accessible under include/soc/, could these
> generic enum values cause namespace collisions?
> 
> Values like LANE_MODE_UNKNOWN and LANE_MODE_MAX lack a subsystem or
> driver-specific prefix (like LYNX_ or FSL_). If another subsystem defines
> a macro or enum with the same generic name, it might lead to build failures.

In a vacuum this is a valid point, but unless I am being told by a human
to make this refactoring, the risk of namespacing conflicts will have to
be there. The churn resulting from renaming these will be painful for me
to manage and will result in additional patches too. At least we can go
with the lane mode variables named this way and rename them later, if it
ever becomes a practical problem (hopefully I can upstream the rest of
the code by then, so I don't have to resolve merge conflicts in tens of
patches).
