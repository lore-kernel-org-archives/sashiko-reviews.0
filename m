Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224493563FA
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556107; cv=fail; b=gNETheefVoHK8p+IHBS46rbhckxLqEb0cAi81oE16aS6vuc7inGyK0qFw0bSIeUPCydrJtIJM1a2dmQNEU1NVGptEs9auSdSzQUi638NoYqHdyTIhQzU823HzrSBdQ9y/UnqzQDGSBwPFhYpqwG2g8TgALRfBOpmF6MkvmurvYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556107; c=relaxed/simple;
	bh=t/fsu0GULB4jI8HBRiGx8DPoUiNc1VeBnvL+tXpY92c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cxaTeqXX/NuULMAfRbSC37mJyA+lksnothuLcY2CFQrlrwE6ay1eqv4N5UIyvTWIrcUYdvQpiGL1dqrJDevhzrm1Sn0Zowc0rA5Wl/l5uwFXNH3fSCSBfJcZ/zckO80B7sWIneOICxheuYk+Ep/R0K9XfuSmERE5snQ/AkCkMWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q3bOyo9n; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q3bOyo9n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrU9W/tXz0epAlR2MAaLx/ZDHROBVeREQRqScK9wQDzNH3UjjscWsHfRb5lPYT+PxtQtgG5OGvV3f4SzWhEG7B6GBqzWAjfAks7AB+Nr4qyZKxql3Dm9u2M7w6tj/OZrOTHYmv/7aczCWVrL93ZTONZ/jmud8XjLnMMNOO9Lr5coJCKkgx4GkKtRPsVRou7dlHeW2OcMXiyBzTT63yeyQJ5grwxPUr4/kkJh3Swr84w3pXlnKcU/YJ/ogxrZHq4jRIG5vYmenbFL3WPlMPkS7tBETrNtYrhLmCeeeyNCa8Vnyl77VP4DotV/ZDCp54EDi0h+QWaU2Nv0SMxBlA+uSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkaBVoUdnpbo0Ttwy3EyzSnUINON0JEMHAE76PtXSCI=;
 b=u3q28Zj2S2VJxe0XRqfhDmloJadzETZDOJriiVbk2UX5wbbHJ0m71/6BTa/wV1RrY67IJMFxsWvdSqLWoS04oeb8mFYKBc2gzgave36OofCbX1oDClGutDQZddf3exqrC0JvtxuGQau2WH4B2IF39PlXaVqd8YLmJAIEAvNlbnfO21vmjmTPjQHWFMEyiT7YpmUUQZ6e/1O8EMYSL1v45Uwt413Hm1yqpIVhMpuQw9ty2L61pppdzykzj0VF2S4lzV831q04cNa67hSEWidk0zK3x6q/4o/pxhkvjT/wvLsrAR8yoHAB683oF8afHV/QDqgbC7r8DamMyvkeRy5sxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkaBVoUdnpbo0Ttwy3EyzSnUINON0JEMHAE76PtXSCI=;
 b=Q3bOyo9nsiwGUlF4oMz899LvRwgJgZAEJWIQnbRqIcHKZj52hIdMiBfZoSidPvRhp1jsXC8Y+n/NP1ZzzWjFCsVhoQxbqjxsgEmRJLWWBSJRvdxBjHmrsdj2sg9QpT/2xfiV4RjCAXj1fbPNzC0dWI4oZ7rA9N1WG7pfTLW7Z2X9qcGNZ4PYFZR0UcWGDDmXhtYD+dHjszaRizjJZs6L8iTpqZ2bK8RX7mmeX38nQTuv3vx494CpU6Q4jiQIcnSpQ4nLOdZTgMm2g/GUtIHkGPox4++CgA4BRPIXh5BXVGguUPwD9BEBPOG8QrinLfObin4LQB+u9tl8nr0u3OyXIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DB9PR04MB9890.eurprd04.prod.outlook.com (2603:10a6:10:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:01:43 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 14:01:43 +0000
Date: Mon, 20 Jul 2026 17:01:39 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 phy-next 2/8] soc: fsl: guts: add a global structure
 to hold state
Message-ID: <20260720140139.dmgysphpse2jf3fi@skbuf>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-3-vladimir.oltean@nxp.com>
 <20260720135049.8AC231F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720135049.8AC231F00A3D@smtp.kernel.org>
X-ClientProxiedBy: VIVP296CA0106.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::14) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DB9PR04MB9890:EE_
X-MS-Office365-Filtering-Correlation-Id: 50694b88-cba5-4e32-ec7b-08dee6676dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|366016|10070799003|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	of6efkCpATJulX40911GiN/S+fiUlMpPrGjZbLOKxhkaPgGOkVf5wzelNU7kbEdmjX/YdlqpHTixGJ+L420Hk28+N3ij7O+tZT1nzIwNS5odwZPJd3MYln/d6h68wJHlJJt+E4rV3eV74n1hz0AtCCA5O/Z58NWBf38yfxzGO5aDwce98cqJ/+ylTpRYuRvXyUIgfEutOxMyEu3/z2FcU88Y6J9bNK8cVz/qMiRgSay08I7OhFhUKMZHU1PL+LeBUO9tFcxMMzUuHF6eReowdilGvSgRGA9B3LiDhM3KpPGN76UrZ9/nqsgLM3uhaCmGRA3xyxSo7oBpWePLxB2IXLkCPQBdTRO6z4z8D1qHcMWL7L9uM1J4dwifde/+0O3ylj3VMpc+rr8OWM7gQ3dQoL4rw+MWQ2P3B62x4HgFX+K1h0JbwkXcWlU4gO1dQuEl6RXRON1zmGMmmyWiZix+mlNsZ+4Y76mPv+wQLMfDHfDmIUrc8q6qUN+07yB+9EUsOIVUBVEBKdD7IODeHtshpDtwb9slEar4nCV2M06Dw8hEA7OWsfZW91T0yxDd53EKJC75/PyxjMHXp6LB67O+6sCHBxoCQc3aGwBXoHuq4mHhGYzV1kXHrgDrdD/FxyyqRwl9tLqKJDaqjkpKCOPGeZxAJAP4YOUEiKrjNkUcvjg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(366016)(10070799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1W0vNe+CZaDag2BhXjSs65srRtjLBU5Qkq2L7y472qBDMbizIKhPtcIlOXW8?=
 =?us-ascii?Q?iCcDytUjlGmx0L9mmX6QaTLuQCSj2/0QbOm46CebyzSZQz4jORGlWEl7Y0QN?=
 =?us-ascii?Q?4sDqqDPg84U8IqMO8v4cJzhNdDPC5eAr9clDUqt0gaph0IG2iyjxDAulT5Y4?=
 =?us-ascii?Q?72jGZXCjXaZvXl/QEqCWMe0QrzS17S4Oi21qx19ulS1qVXG7F+uvDCIiVyXi?=
 =?us-ascii?Q?VtZmwZfHKGgVwaV+JzswjHCYgDNMv0Cl8zODuT/A1pHhE9m+AWIVWPc2jIAv?=
 =?us-ascii?Q?KnU3SfPFMHb6KE6/zHMQADh3Fcw66NveX+3nDpi/tuAa8lzEdQZCgqmS25qB?=
 =?us-ascii?Q?zTn9xgP8vbT7vlnNbXnGMNXg0VHoNfgmFsBdflbxo7qV0H4HqAIOoJjSAwdU?=
 =?us-ascii?Q?8S62vvdHhxAzIOT5AfU9qFrA4EKQMnd7DxTOaYCGNj7W100eITFnNULzKGV0?=
 =?us-ascii?Q?FxIwgiq5a854ikWyUJ4P+fNj4/hKMAYcgMoXSadVj274f/37hAoG0GX2ukIY?=
 =?us-ascii?Q?4bAE4vyKKRcITeJWHcsC4/NaD8fIsh3wGLDtfDaHLrtBXAxkdIYJRvtd9aZg?=
 =?us-ascii?Q?BkO5U+Zrx5u6wN7s3i+0bWu1hZC7ijorGw0S31xyFezGwBsWm0CTiWRYe4hn?=
 =?us-ascii?Q?y/RHBa19n/fTHeTmWifqiQ41VjWY/HbIpFimRGLr4jLLAZJB+fnesS6ZxvvZ?=
 =?us-ascii?Q?Ys6PviPgNi85UZJlB7mx7t1IeYgCuqCJLAyCTvSp6nP/ltfq5HQ9x3kjigBi?=
 =?us-ascii?Q?E+qsypARk6+iyaDHEpzPffKIJ7ScBrgXkCUJMnNDTLMhx8CaIId1+/IRdPKF?=
 =?us-ascii?Q?IOa08bogf/HMuprs/wdRGEL1tYaXjo/qXb6p8NZZc7d43X0u2WNMTdBiQtQp?=
 =?us-ascii?Q?yFVhDqDEcj9WAY6uZ+pYBUQiq+Ghg6Yn2cmidJPKCMxMOQ/J4EnjemAbTQE/?=
 =?us-ascii?Q?AnKE3/Cbxphw+0IpMe7zH88ERio+vnhpbtZgGBbis6dEeU+VEdszTOht7cvv?=
 =?us-ascii?Q?6vkNcSyE30sXSqSKnGW86ejQ182VWdXVFheICXyO7QKoCdmNeCUgLK3veKnZ?=
 =?us-ascii?Q?E9OsvrwldAXjNrwkVu4NiczgTNzA0OgyEWYUfwLgsxybzu4PhSfVWXn1woad?=
 =?us-ascii?Q?IxVLY85hcJHl3UqWuP3BSJb72QFmP7EaTD7lAVSMAqicg7fKKQ4j1ceqQdLL?=
 =?us-ascii?Q?F8d3y6OrRt53jhJXwUd2LtA1s0UBq8Sm8C/hGM5XdrA37SvHDzzKqep3IGN5?=
 =?us-ascii?Q?/Xvt/QiyQoECaxIdLfKSeDEnR7mPrNlX6Rd4ORbDXEQOXfXWVjJ2MBW3/RPI?=
 =?us-ascii?Q?qMv9/J55dBATSEhXFxgViA3k2tdUAsoUSxXFy3sGCPOtUdbOhL/DMmFPwN4t?=
 =?us-ascii?Q?VJv7ZNnmGfoqwFduSXQsbJu05xcvJa7W0c6EDlQ2Yg3+7WW2ov4R3ASEK6Qt?=
 =?us-ascii?Q?7Bgv8dmmkpMJSR83G1w5a2r57NmOEMXsRUGCqfmzbKdnh+3GULH1uHNHbJcl?=
 =?us-ascii?Q?LbJUL05pqfysIgOqTluYj82IlXnGC5Cmfatir6bYoH55G5Lt/CllhJ1bTD+C?=
 =?us-ascii?Q?YW+npFQsweCivPxYOhRHH5JW/2lBZnLA1h2L9eXReFAHmTNdg1lskWmXJMlu?=
 =?us-ascii?Q?+zcmUq6bX3WDBa3Q8xAUwT3dhvefJvVy8amL3Quo/9PneiS5RvrVTx1eItTK?=
 =?us-ascii?Q?MY7bXQSSmZ8EYNF0hXOaGtEdVZrO+5my23NIkIeKGKQGp6s8vdQwMmEH+OxZ?=
 =?us-ascii?Q?wcHUrZ3RTPBliaWTKZ3b2J3UecM0SpxjYksSJGRdCmVFml8eoJIzXvu4GuSe?=
X-MS-Exchange-AntiSpam-MessageData-1: t4AIwepPMC9t9Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50694b88-cba5-4e32-ec7b-08dee6676dae
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:01:43.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJmUxxfAuwt69RJeJ3IoYKRNuJgSYUoW36sfFKgW/xNFw9mu8p63ddYIbhhFleFOaLHC/L7cVJyLSqVKK3o6sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9890

On Mon, Jul 20, 2026 at 01:50:49PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Will jumping to err_nomem cause a NULL pointer dereference?
> 
> If the allocation of soc_dev_attr fails, the code now jumps to the error
> handling path which dereferences soc_dev_attr to free its members:
> 
> > @@ -269,6 +271,8 @@ static int __init fsl_guts_init(void)
> >  	kfree(soc_dev_attr->revision);
> >  	kfree(soc_dev_attr->serial_number);
> 
> Since soc_dev_attr is NULL when this allocation fails, won't evaluating
> soc_dev_attr->revision and other members result in a kernel panic?

yeah.

I tried to be nice and play with the existing "err_nomem" and "err"
error handling labels, but the truth is that a single error cleanup path
is just an antipattern that doesn't scale as code becomes more complex.

Instead of having a single error handling procedure which needs to
carefully fend off from various invalid contexts from all the goto
sites, the standard convention is to have an incremental set of labels
which undo just the setup that was done up to the goto jump site.

I'll refactor fsl_guts_init() to use that convention for v4.
