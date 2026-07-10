Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011046.outbound.protection.outlook.com [40.107.130.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00973B3BE5;
	Fri, 10 Jul 2026 21:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718043; cv=fail; b=Ozf1rnSRM7SrWvkN/gWqx6YW5vfN1FbaLRCNa7LXvf13nVtXHjeOE6byGJOYtS8tSw633S76bFZavLF7AvMtxFOm9yn9NGsq3LCwohqMK9o1mwztWtccUU9Z/ef5/kWj29aHc0hQWPnzs1Bskor+XT9jONuqW+ZRi0v7SOhciV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718043; c=relaxed/simple;
	bh=CU2vgnJzKREOoh7lkKFhtErkn4zdQZE1cF3S6aWZ7Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p76D2c4a7EyK8TGxj/4ynQK83vhj9JjzVVg5RX9lqYEnQIbfaN+kUxt/4FUhl/FHB0PqQ906/MfJ/Arw3UfInfU38M6DWgX/7rjTBOuBvQOSTQY6dD5jCqCEWGPKjbthAMf4w3JUqaq5HUPSjJggkL6uvRGk14iD2vhOMmyuSbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qG2K8lVa reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qG2K8lVa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAgbbfU7bvIGsQ1wUnkmpmrK7Or8O4QYWPocv9jllrkJtznZHN1Z6MMkdbt5Mn1gWylt6SM2/vCU9oqHbi/WZ4oZx/r3B8LXZJkxG9iY9dAc4TFUEx3Xf1vngkI7IuD7ebQ/a6eA6+KQoFAyxLCStAQ92XqrNHUzlYsgqA9cpUYCtPxrlAqsa0DoDbI2GGikiTbpNfj3xGWcaIlmSld1VJj744NlRTB6xfMtulyI2r413ab0ajJ/sZF5fThLMvg/y6rLW1sWF+OCb+JaT1lbQ6SnaMvVog25VSu0pTer2zmVjE6sTaXIfoxSOM9aPlIIlEnyc6mUB/frteyMQ0wwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKpF3Qsv0LEMUHmnQ8w6AbGfaJsl3KLhraXtwuNrPW0=;
 b=I6x9xOnYrcwVlTvEKAm/XPEygX5ylbtgB2shOS4CpQGPNASGPFEIKZNJYLE7rMJxnEmWcjNkGxLpArr3Xq9sAZisvg5gOatVw15i9OHiO28/spJwjiNYm0kLJvQ+du90Dzo5yk4bqnxQA68ATIakTE9JnuwscmwsAXNEZtH7NTV96B3gIOXV0zW2EWPenZc3pLXeRPsyIezJgQ/vdfq5u6RNWYA9gCwHCVn76U7PmkTiibBOwOL0vE80y94H1gXiTR5qL6jWD82QrY8BhQ1AMkDPLTtnmpREPoI75M/jBHu85hh338XN/fezrzryxG8QfGxSU6O5s3LwZn81yRgAoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKpF3Qsv0LEMUHmnQ8w6AbGfaJsl3KLhraXtwuNrPW0=;
 b=qG2K8lVasSqlc51jirWwELVTnix5wot+bxnIyI0FElc5wFUuxRKs9czrCQSvZBehNhQuowdK0GXrs4yvV+6Io5TItpfeq+DCzPOxtcFa2VgSmDmVuXohQYS/ycRDpd8wVZY5HucXsFiUPaI2CKKP5XbDBdPGU1f20g3G5BtFFaOom7ujy/kHAcu/bMZRVqtI4E09r/GqPyzWOlWtk/N0K2ThS0UllDnntOFW+iTicEMewe128a46jW6pEwzNwMvzJaO369zwFGLPBzuw+bZbtvuIybcgWEEemlW2T72Y5T+GPg4gyeTSpoOi4BLAfFRFW7L0gBdmOnOb4FxmhEzv2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB10066.eurprd04.prod.outlook.com (2603:10a6:10:4c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 21:13:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Fri, 10 Jul 2026
 21:13:58 +0000
Date: Fri, 10 Jul 2026 16:13:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Esben Haabendal <esben@geanix.com>, conor+dt@kernel.org,
	Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: imx8mq: Add dcss node
Message-ID: <alFgjl9oE2C64K62@SMW015318>
References: <20260710-imx8mq-dcss-device-tree-node-v1-1-fc724dfd574e@geanix.com>
 <20260710095211.6BE9D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710095211.6BE9D1F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8P221CA0057.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB10066:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d1a276-ea93-4e9a-ac88-08dedec82846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|18002099003|4143699003|56012099006|11063799006|6133799003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	hl1rW6laY2WdnHJHRfmnX7P1AuaBZeNPnVtO5xcBH8GQ95r3Kasmfm/c1yxfOSr4deAYpmRRbpmqj8Yvcc6ckc6rMbsnNf4dua73RS12VAY5VPQMAcg8ilsWua87P/Df/ERFkB9v9gwgyGueEk5KUbvy5cMwaFmQTPImxZVMB5Fyf5jjfhATAlhwApf4i8x/hCOqUJb2HwMKmSmNTfNLpmsem4gtTiiMUg5WXFnDrv5+rVs3R3e6dwvNiP57xvFVNNDcvhGk30B0+ru8saybYnvNall6YSMtOBygGAUauURfi8SzfEPdqRrWeL4JXTtCki9WBwQSFu0ZEVdKYOQQrYr5EOcKvd7sulm7ctXm2q3GKWFC8NtVdzMbgD0RGkTMWJCk1GyG9oZcrnWWrruqhNGwioYn+R6jJqnvqKgpHBTEADsZOas0M/uqXfEYOEfan4JufdH/hZ8wuiVmaRi7xOsy2nyQ5au/9H7hHYQ01dqhVaMIlhfKRW+1IylvAcuWvuAvPkXHypfRnVlK5Qz0UdRV6f+y67B47oxIVnvbprsy4zZhzxVpZjhOe9JOolQ/lEO314rdvYulk5hiETVtTx1BcBE+MMTL9dmplZxSjUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(18002099003)(4143699003)(56012099006)(11063799006)(6133799003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?DJ8St8+iCzuZrmnw+W0u4xRpIbFYQx22QL0qEF1H8khYzjxsw3qphyMGux?=
 =?iso-8859-1?Q?Qg+OTRF591UOAJnld5micwyHpPCNjMro99dO2SQ2HtayTxpim4l6ogd4fZ?=
 =?iso-8859-1?Q?3s+lVzPDeA3xmWN4090yjk6H/Cg3ECizIZILUzaFFxuN7krPOrjMoqcdh6?=
 =?iso-8859-1?Q?OnotfLQF6LSG463FP0sg90CjmP5LKDsm6ycHBfwbtwGY+4WQSX+gL9M3cl?=
 =?iso-8859-1?Q?t5pPC6xrNeotOnGVyTDPVhsC93I4xCWLrb84swnuExDAmx8lem2M0/Vmu/?=
 =?iso-8859-1?Q?rnV904p6D+qoOsc8CqkmpQC673SG3DMWsiHIzWGWSJXGpfuoW+vT4Yy1wU?=
 =?iso-8859-1?Q?EEL4jLzxxL9GHfirH53v2MQ1JFFoTltf42TZ0BcXox46oFd87SB5i4Q927?=
 =?iso-8859-1?Q?HIy1NKY2B6e58vk/rON3BwgyWIfrIKINK3hFYNsl1C1FKjp7g5HJd33uUU?=
 =?iso-8859-1?Q?z9VODaO+qkV7CUvtDY4Gk6ma2gmmHlhtWdCzoZWkspfTmIz6Y/MydS4MUS?=
 =?iso-8859-1?Q?Bwfdy1LjgB9T427mHQe9qhlwDdfGw+F1sR8bRDjIhR0hLXefEpKmWwZ8kJ?=
 =?iso-8859-1?Q?55OKPCpUx58Rak7rNKNUrWUflpzmUhJdUjsCglU9XV2E+3EnhEajN1dNHB?=
 =?iso-8859-1?Q?UyeKSVohX6enGzJM6P4yWyiG1W4Iy6GOhlnVT6KafeHQzvgYaVkF5ZZ8wN?=
 =?iso-8859-1?Q?JNDf8Vx4DDsATIqvnxQXYo1/j+OxV2PLpRyUhcd138oDpIrV+iKnmSRiSn?=
 =?iso-8859-1?Q?FhqCLZ3SZDX35VQ4YfNTstc5ssTYqSXfd7N5jv3mYxFLR2VfZgsw6MYkBP?=
 =?iso-8859-1?Q?7sYUanRnimF90nS7a4UEajvycgy0bOJU2le/QoxWYLwxkhnLVNaJFr1D/6?=
 =?iso-8859-1?Q?mBz4HpyjgCGXd+QmWmQaBdZwbRgXFOv16qL/1GmOyxnCUPSe9l/vjgQeH2?=
 =?iso-8859-1?Q?EHICOws7Gb23OBlPA2hHv/v6AMkjKxg1bq2WfiFW/9c01saQ/qGTPQu3ka?=
 =?iso-8859-1?Q?0+w3kIjIlqbPocaJQhfNAdMD/inTn+g3KKu+KT1HI1Q5nAL8/cE97UXR4V?=
 =?iso-8859-1?Q?JLjYoknO0aFlJYfQbDuO2azisgrecWRNDe061diO3f1g4QUZ+Pn6uk0NUj?=
 =?iso-8859-1?Q?jQqlE6VzTdx3t5Q1Cc/NTeGySOUVcqPa+d1z6FvBgc41eOzqpQ6MbYLCBe?=
 =?iso-8859-1?Q?xHGsQrkI/OLNghJ1WSoG7cwzlfXNSTF2jWhU4+zujA1DG3qpl3cgGXNYHH?=
 =?iso-8859-1?Q?aJ0v3DcADxWfIGjXNlZwoqs4r2O2mniHCc3XUcJH3we6T83xCEznd7nZb9?=
 =?iso-8859-1?Q?E+MVW7bJ5nJpCsY63Qrk1V7CbWKVcLGPhfVehcWWmp64447KuM8xgwStCD?=
 =?iso-8859-1?Q?fVACZcDIXR8AiMtC/NwGMcIfI0JcZ9YOIYEfqAaVNBjReqklW5gAPJHlVa?=
 =?iso-8859-1?Q?lY8EhPxCoHoxtuL7Q0RYd/lYlFjmqV5DIZxq1R84aKIWBNq0V8ZxQD32Iv?=
 =?iso-8859-1?Q?LFzCqnOPsauZR+H3RleBBnueux5eS6pFfNZfidWKpy2qEikAwVO3jIZCks?=
 =?iso-8859-1?Q?msXdk/BkKj0JrvmxiiUur9wfUcMaUytRNf8GWA0vxyyWuWpo2LgKIWVN7r?=
 =?iso-8859-1?Q?3H+6GPXr8N+Fd4dbSOeIgpzVv6nvOLDzhUTsnrtvJWTXNmRw/GqbZDiivb?=
 =?iso-8859-1?Q?ue29FDAfznm4K6hSDkcpqEFgYk5tnm8Ur0gcmtYvaYcRGvvpkRRFEBphH9?=
 =?iso-8859-1?Q?lRjS47hzdouNtwnh3YKeo0jDsyVkazUUpRKROFH9jl6f0W+z/9zqPaT+oa?=
 =?iso-8859-1?Q?sb/dU31wKo8MnLxutlARUgQ1jssW8XtaBdcgV9dlby0mm9ml98dV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d1a276-ea93-4e9a-ac88-08dedec82846
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 21:13:58.5410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fc2v631tQxBGirDmtWidpXKjJYUiXWJdPQn2F+7U4Fqf5DY6VLE5heNKuCb9S/kWuDq0/XyZhnSmfs2QfzsPmf6um8KfkNBYA2MW+HV/itwLr/vRaQJee6joEfgnsNPv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10066

On Fri, Jul 10, 2026 at 09:52:10AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The `dcss` device node is missing the `power-domains = <&pgc_disp>;` property, which will cause a bus hang when the driver accesses its registers.
> - [Low] The `dcss` node is placed at the `soc` level, outside of the `aips4` bus node, causing an overlapping `reg` region and violating the hardware bus topology.
> --
>
> --- Patch [1]: [PATCH] arm64: dts: imx8mq: Add dcss node ---
> commit 014c87fe4bc51f0ac006bc4660c8f156f9a40538
> Author: Esben Haabendal <esben@geanix.com>
>
> arm64: dts: imx8mq: Add dcss node
>
> Add DCSS node for i.MX8MQ based on the example in the bindings documentation.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > index e60872aeeb49e..fb99bd3ad7c92 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > @@ -1611,6 +1611,27 @@ irqsteer: interrupt-controller@32e2d000 {
> >  			};
> >  		};
> >
> > +		dcss: display-controller@32e00000 {
>
> [Severity: Low]
> The aips4 bus explicitly claims the 0x32c00000 - 0x33000000 address range:
>
> 		aips4: bus@32c00000 { /* AIPS4 */
> 			compatible = "fsl,aips-bus", "simple-bus";
> 			reg = <0x32c00000 0x400000>;
> 			ranges = <0x32c00000 0x32c00000 0x400000>;
>
> Placing the dcss node at the soc level with address 0x32e00000 creates an
> overlapping reg region and violates the hardware bus topology, which can
> cause structural devicetree warnings about overlapping ranges.
>
> Should this node be placed as a child of the aips4 bus instead?

Make sense, please move it under aips4

Frank
>
> > +			compatible = "nxp,imx8mq-dcss";
> > +			reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
> > +			interrupts = <6>, <8>, <9>;
>
> [Severity: High]
> If power-domains = <&pgc_disp>; is omitted, the generic PM domain framework
> won't track the dependency between this device and the DISP domain.
>
> If no other active devices claim pgc_disp, the PM core may disable the
> domain during late_initcall.
>
> If a board enables this node and the driver subsequently tries to access the
> memory-mapped registers of the unpowered peripheral, it will trigger a
> synchronous external abort and panic the kernel.
>
> Is this node missing the power-domains property?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260710-imx8mq-dcss-device-tree-node-v1-1-fc724dfd574e@geanix.com?part=1
