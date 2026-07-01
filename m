Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38379361666;
	Wed,  1 Jul 2026 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918046; cv=fail; b=ECZO07keZPIops7/hMGHP6tMILe+UbI+bev7lU87/Jlwtn5ZnNB6ryZnzK1DBwFwvnBfnuGVhnVa4HB0clHIt64pNM1c1fh4BjQy7vB+YLW6lj6BMvr7FQoXGBPK68LR1c+Ok+sUCKKaSDR3aB44SsmoHeep+wQ1boTDQJI/ogY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918046; c=relaxed/simple;
	bh=cruR6/A93lJCBL5cWZyjF0nnhq3pxk+bmTE/u1E4aJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PweoOpX7yVpURMqkqy2YqTYHAdwdNaInvBE0bNTNUETZ6+TtEmmKrtvHSek2hgmQ5Xuv/9idCF/Tz0BRiqlHg5MXDRt5kj2D6GmTHqnlqXqF4cVvYjPY4o/HN0Ir/PvDts1NeGeGKPxw/7Gu2AP2rOjA4oO0JKP8WQ88yH42qxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JnEhQFG+ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JnEhQFG+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kq6Vu5o2SIxGvWXFK0GkU2vGDIlr9v9VGUMfiJUv5kdH6k8jZilvRAE3JOo3OemSZWuZtT06sEnrgMS1W+iLvuJD8NoENLlGhFeSFByu7S6vpxlTvrDptPwBdXC9cG9RkI7GX6a0CHsc7q3r6v9Q6Ld+D61MQQP4rUYAmZm2jE6Lp3bG2pKMj/Mmo5neGg+YXfYZVCMNzsRTpjNuPd7lESgxCIC9X0PSHD2XX+ilro29daZZ4W/tKwhoMOc32n2NzqVMnGd1gK5NRUurwYSJngWNx67kUX2qEjhwxjea62HkMfskPbuh7jCoR/gQeMo+A8mc18erneRdctkGFn/GQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QA0/mrCXytdfCRyBeWMxD2Kn+vllf9cJOGQSPmnF670=;
 b=tuLUul9waEFHFlPKrdFhSsGv6Mi73azzJM0hEDOb0NgmToCDc8VV0H5soDtkxYctwsDYfBdCLnJA52t+vAyQ1zJ+sJkAHUEJKp7CSxFEcR0tOrYPfAnuLcaw5rQzl0hT5/mOLoEg8yrtllyAR2dyLc1nahEp6nY19/V4uw3wRIgj5/Dbrs1RiIIopqmHVvBg6IoufBKWNOCZkrFnJteePckweB4VdsFui3VQs9of3sR3awbqbIarc2eTxVuD6jR2J2DnilJQ8CKnECXfkVE9EPSNFRpwBLVbp0GrvJ5TGRGukdrv0Rd76zlK0Ip+bBQiM/8zIasbAfn/de+7nPUa6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QA0/mrCXytdfCRyBeWMxD2Kn+vllf9cJOGQSPmnF670=;
 b=JnEhQFG+jy82l7vACztvB57WohyPzNMPje39tSojiZyPZ97lpDAdFmibvAxn5pmkx+jKF4NO/iwqP+S02DuYy2gZQM+V307y0mvOdkNg0qhtZAqTCqw4ad+grN7/5UnP1e7MjcDzQS7HrXI3JKyRWRCz9b9BY9zms4yOEW/kkr2wKJNUDewSqLY9CxwsHKli6PKcQzb2MXjrYSV2UuQMEajn4+xZI+7BfhRVYiZZnaD138CHRoRwpvnFGFvnbWibPuw1H9ZVKhH3UKabDn8fBTmTzRXk5xXM9lAvyp1wjDkTSDnR1eYmqrYunqrZUe7jWg9D9Dd0qboJidTeTCBsYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9628.eurprd04.prod.outlook.com (2603:10a6:10:30b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 15:00:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 15:00:42 +0000
Date: Wed, 1 Jul 2026 10:00:31 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Frank.Li@kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: imx8mp-skov: support new 7inch panel
 board
Message-ID: <akUrj3MnTbGQ5X84@SMW015318>
References: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de>
 <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-2-d74f7e3f8293@pengutronix.de>
 <20260701084500.AC7351F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701084500.AC7351F00A3A@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9628:EE_
X-MS-Office365-Filtering-Correlation-Id: be37bb44-a594-4467-3871-08ded7818504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|3023799007|22082099003|56012099006|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o1MU/ZI6/yrILrdr+7/JqFFcWVWqgC3xoz2L9/tR2DOHVRObgmo+t7Jxv38Ui/h2ybFjy0ptsOv88+jtT9CUJUv9OsmaW7JonBEh3CcdtAJUw7S7uRr5SnpMhnfo72DhwJ+52kjC65ZVRSH+wCHduVzu+SeougLiJmyDRabOVcC4Tl54Tj6FaGEl6zxjOL1fdEZYJdOc/4lOsLbQiVLJyVlXmMtb8WVYS5byPhvKy5D1obTRty77bAp6/gjKDC8vkJ0THXOw+gz4GQl+QMXZIvSQgj/vxQvwT+K9k0hhnGPsFjBq0BD1603ahzqlnS8W6vEED5zLpWhCcgj6D6WnrMKXuA5st3MvXTy5DNNK+0thiqXOXddlFlzRpcOkhV2ZI+o9/aPjyQyAlkbWrC00wESxhaTD5sAT/6ceIGMVAcMnVkXDaJ3SZ3eiLuiXZMDL8EDCParDx1NO5tFVVB02uIA/mKIHblUNGVFNKHOgBAfTXUSnO9jRUHitvEn1Xnhdf30c2RtAhaAU7bWEifITnwMLOA+hjcqAUo8yRedYKWthJEwPY7x16EoGjsOIViIfbopJtxX89FcD/OoKEjvh+LJ5eEjxsKCwvfShOt74Ie4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(3023799007)(22082099003)(56012099006)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?DAmJ/nbTqaPPzaYKMD/5hgWEvoUQKeN3qt8ftp26Kbo6cyRdba7THKt78y?=
 =?iso-8859-1?Q?zrTaIeF83dXzb6D0tfWio/5Sh/xBIj22a/uUziiU5ovZ5gANNuBTQf2Aoy?=
 =?iso-8859-1?Q?p0o7v4MdpsOqkidnWRRb/sjQGN68taf/MmO6pJPrhudqit0aA2z/OtJcWT?=
 =?iso-8859-1?Q?ZCi048iEW8wKsmbDno3+WZQ8tAWNuuBU8Ap/iTp62H2BohhspouBPJMwjE?=
 =?iso-8859-1?Q?1MSyQ2l9vG10aPrqsh7E9KSZNMpFWlssgrcQu9JeLF83Wez3U5MXC+r1hq?=
 =?iso-8859-1?Q?w1cTZfVBQ8c0ODPugHvDYRgJJJpQaH6wFYnXJcjYcvpxezCUsfW6GkhjCx?=
 =?iso-8859-1?Q?hChmesYBZMLNn3m0QdG37kJbqTS+DBD2gSYRFp0o4v1WWbRUkFVIwWEmlz?=
 =?iso-8859-1?Q?yuFr+dGqoN/g3Tq5E05XIM5Fc1glgPPA6xP3r3CG69SYjAc+qezhApQnbk?=
 =?iso-8859-1?Q?rhnGaGjjXqCLvN6PDR8x6erH4A3N6qqL1jDQ1rMv1Fj6nDObjuHJfpGvCh?=
 =?iso-8859-1?Q?EOzu0HZlj3dN1lfLihs0BvbmJPPauNtBdebjQk0VxYejzmNEPq3Skc/F4j?=
 =?iso-8859-1?Q?8jEC9+hajNs/QUlFuJecwswu1nm4IRExC476N9cDBaS6CwdjEdrnK3PrI4?=
 =?iso-8859-1?Q?NND4dQQE4H3KhEJRGcqqACYiVkYb18sHyzUAN4tvNiH+7eeW58EC5lLTKK?=
 =?iso-8859-1?Q?/2Jza89XxvlhEKcxrXA2TDb2yEHSYUUERa2cCj0cY0eH/AdAuFcyHwmTzr?=
 =?iso-8859-1?Q?BBrT/xkgNzS1PSTKCAZcu63qPP5jHd5qrhEY9NQ/zwB4hP1sKTTnpjCuV+?=
 =?iso-8859-1?Q?HTXo1PmfNIVlhF4Toiej++/sR6KD/kMMtkmMTuw6JGk0QeJueDri7rVWla?=
 =?iso-8859-1?Q?WXcD2I2jJUeZnbqSlZ/I75O9Nq8qNLTyxbINW4p3tVoV9twPD1ESXwgoVk?=
 =?iso-8859-1?Q?hWKqGMK5MLEUjt4pSogt9hUWHZ5MNiemAtC36Iw/JUDZ7Hv7WIIb2kowAq?=
 =?iso-8859-1?Q?sXuEkuRISb0KTxvjYzgNqzXIlmzq13w1+Z5Kf47JNlFfMsXhR/sT5IByGK?=
 =?iso-8859-1?Q?eNSbtcBSJMI6SrwyQZyGUEMZpZvxpNWXYZMw5ubQqkcb3odfN3ROnqHMl4?=
 =?iso-8859-1?Q?lQbvSHmgsNUaI7jBJhwEG6Ej3TjtahKsRSo51xmrqoh+Ova2bAmQCFPVMU?=
 =?iso-8859-1?Q?1q4x6TPZJ4u1xn2rA7FS+SJXxlmvknZLSONzdms5n57YLCVBFQJPK6lkRB?=
 =?iso-8859-1?Q?J9QXNN+d99a+8s9eSP7BVfUuRfVa4JlHlvDWNx3DxiBMy4gmXlDrIsleRu?=
 =?iso-8859-1?Q?EFG/b6J4vuimHHXl/17ynj7vFkFtj6kv1azb8xBV7GhU7eZujlErsR0SvN?=
 =?iso-8859-1?Q?Nj5Nt6b4NnfMIp4wGPty7RbKZbAysp10jtLoPeU5H3qCZg/d4lqf95cO8F?=
 =?iso-8859-1?Q?koURBr9iJjufcoJ70hZRIeaAizRSorcLWSqiC91HLx29KBp+Ly3UlTXnbk?=
 =?iso-8859-1?Q?4HE+/MMAZ3J0Li0SWtPwCzSwA6jHKy4sLVkDDO2y5WBn8Cgr+5MSjtl0bu?=
 =?iso-8859-1?Q?Jjyb3RGQsBJ252cSaH59uVpF7QNfB3dRs72Ujg93p8X1uUa/ygFGDPtqJ5?=
 =?iso-8859-1?Q?k6MHm/QQbnqhQHSttzXWDwAkvxoBYGChWFrkqlviawnnoiwbxrNJu2x1Ge?=
 =?iso-8859-1?Q?TbiM8mcTIbevy1B8DpvRNma7lI8FsirlOwb0FrfWHEQDOJaLRtyoEQSH3d?=
 =?iso-8859-1?Q?JoiVK0PqXPgpA3Mree1fpvNSpYC98VgsOoxkE0+r3HgSR9izN2vyXIYTg+?=
 =?iso-8859-1?Q?LwI5b3YoVHbk7o558Ko9WA8iysW8DOqi9/okGpjPezFIdxRyN8Gw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be37bb44-a594-4467-3871-08ded7818504
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 15:00:41.8836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZte/EixM/LOuw0j7v40qsLxMGwOXM5sG7K1RFa9nY6EViDZw4yRJNeczpvjFaEAWIy6E0fDVSN+YWek+LXUsZHnICkhBScKrxXNo+kdolGKrJX5RJTeUfH6FhX2eYEQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9628

On Wed, Jul 01, 2026 at 08:45:00AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Low] DT Schema Validation Failure: missing fallback compatible string for touchscreen.
> - [Low] Documentation error in LVDS clock calculation comment.
> - [Low] Makefile Ordering Violation.
> --
>
> commit 3b909b83ea0bf98186df799556b414671ad39311
> Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>
>
> arm64: dts: imx8mp-skov: support new 7inch panel board
>
> This board is similar to the already upstream
> imx8mp-skov-revc-tian-g07017.dts but uses a different 7" panel with a
> different touch controller.
>
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 8ddaab127ab9c..efca29735b2cb 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
>
> [ ... ]
>
> > @@ -435,6 +435,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt070tm041.dtb
>
> [Severity: Low]
> This isn't a bug, but should this new entry be sorted alphabetically?
> Placing jutouch after tian breaks the expected ordering in the Makefile.

Please fix this even Severity is low.

>
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dts
> > new file mode 100644
> > index 0000000000000..56374f1e67663
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dts
>
> [ ... ]
>
> > +&i2c2 {
> > +	clock-frequency = <100000>;
> > +	status = "okay";
> > +
> > +	touchscreen@2a {
> > +		compatible = "eeti,exc81w32";
>
> [Severity: Low]
> Does this compatible string also require the fallback string eeti,exc80h84
> to pass dtbs_check validation? The schema for the eeti,exc3000 touchscreen
> typically expects both strings to be present.
>
> > +		reg = <0x2a>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_touchscreen>;
>
> [ ... ]
>
> > +&lvds_bridge {
> > +	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
> > +				 <&clk IMX8MP_VIDEO_PLL1>;
> > +	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
> > +	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
>
> [Severity: Low]
> This isn't a bug, but is the * 2 multiplier in this comment correct?
>
> With the single-link pixel clock of 51.2 MHz for this panel and the assigned
> rate of 358400000 Hz, the calculation appears to be exactly 51.2 MHz * 7.
> Including the * 2 multiplier would result in 716.8 MHz instead.

Is AI correct?

Frank
>
> > +	assigned-clock-rates = <0>, <358400000>;
> > +	status = "okay";
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de?part=2
