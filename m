Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF6D399D00;
	Wed, 15 Jul 2026 15:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128357; cv=fail; b=P7jt063sFH4n8hMF4r6KDE/PZmYbwcxupetgzy5bOxrngIt3Z9vbZVVsRl5hw7FJkCkm/69EBwteuKwVSQUUiKToL0ZL3DMW1ULYa4c79LOvfRlI7xGjsw8jmc+mTdQR6mkCUByo4c8KnoSN40/Rcj5glOpYMBVfG+eDn1EFEh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128357; c=relaxed/simple;
	bh=O+HwTirrTWZmmi1cVys/XbldishrMgDjAVzI5GUwr18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nvILstYd6xx1Spm5f/E0uocAH+2ax7OMvVRBAfAnp99qWyzCysp8jTqfrn/LV1y9j/XAmyQOoGVvunzqBDY/2u9JYwlleuk4haJoOj149ZO1zQZEZpHnOidzIQC3GQXCgJARN1ffhNjg/UGDs7LjiCC2D6EQnIXOuguIcmP2mcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d9Fzc+1F reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d9Fzc+1F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omsj5le7P7vzUjlzvB9j76izVpQgiBFdFskLGlqZ2IAc+iwI9EhfdQpHrElIaZNZDHWJhIKG9BhAnr+YLlphetlhCZWQwp48dPwoXZjuysD1tS3aZqUpsbZ8RPaeCQB9Hxh9kK/YbwnSNiDf96DAZTbxX9wEwQuc1Y430dLZaPNo6WtCvhBj7CA+7hrVRBW8yXU62eJgU4mXVCUueR1BHjMjq/iA3Ck1xhhw9vg5qb3HUWaThFVoOAt52FsEx8LeKtJK33BWzbztCL64zyjhj7NsNj6XvNr30Byytr98CJccn+DBby2yfXg1uXxHgSGh9xHQ65bNG1o3OBJ6Z/SB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IHLsGQvh8Cd5FLgL+C62iOf4oAAU6nEUSBTs7+YPZE=;
 b=gMFUyi6L6XC0Q89gbQlWDH4PhKHVfkUP7juwIf21afyfed9Qhbj54wyvDMjWn49wFQS7VJ3nEvGFdfn9E55JIU5dB31CBK+ddBRXBd8VpLa4nNravYFBINSlw1Kj0BwpUqqWJzibhyySY3VAmzQlx0JZK056tFGmseQStmJCfWkJIvMpR2nkrpe3UqEQmYmLofX/E2w8uH6zr+ShawyidIcg3lMtjgvCN4tpAE+6Eg92HRhnzyv/vTFfBMfS2IQNAnvb5ZKvpbOyWB61kPN179YT8bQjjdv/wo/x+r/EuZDRFueKbxBSRhOeB0OPlWKCG6b5vFhdQE03NpNA1kkinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IHLsGQvh8Cd5FLgL+C62iOf4oAAU6nEUSBTs7+YPZE=;
 b=d9Fzc+1FDbxu35Svx2mrn3musKLaUNGXP58lC/yPtaRyjzJw+pfKF9Y6wY+jgbYlQHyR7tOakjiORfiH4dIS8TNdRlD20+LUw9un5t8khCFmoxnrTEvjvAZDwZYV3x2UpRkJFAT0fubGKYud6AWyQ3rFFtoCWejcVhWnnKEApHl03aqFAnwUe+8oda1IwEW68mUTzEPm0plUmroUvFXQ6Ba7AGGt5L8TagQxYaGIi9w0B9HhkpJ0tWcWDGopmNtaYO5QW7S0vpufZdMjfVnYnqgpbH7cNpPbvGr3mAGYIsR28Jmm55Lf7x0sRD/Z1ja+8duAkiLn1jHgyopForikbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7840.eurprd04.prod.outlook.com (2603:10a6:102:ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 15:12:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 15:12:32 +0000
Date: Wed, 15 Jul 2026 10:12:24 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, conor+dt@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] arm64: dts: imx8ulp: Add I3C2 controller node
Message-ID: <alejWK9E1v8EE9kl@SMW015318>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
 <20260715-imx8ulp-dts-v1-2-19651358b599@nxp.com>
 <20260715124208.2B48C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715124208.2B48C1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA1P222CA0151.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: 929b5a1f-dfd7-46bd-9cb6-08dee2837e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|366016|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AQKbkNzo/Zb1zxQ9j/ZW0Gr10JunGZ9G14kIQxpD5OrGA9JiiH1h5Sn+nlA+rz17L2kQB6VMJv6D1V0OivhlhwLD2KIn8brBWRivatjuvl+gkhaVwUxgpfz+AtJiXtnhJj7/fD8gFTI83XU6KD6oe28SnM0cFFZfANSinhhI1oOlWE6NpE4nzkIySvAT5Qj81wo+Zq3/Nn6J0PFx3JBQokkPNksYS15kZkafE0F9YZmhBM70iI8hrGziqDDXiiL3y7MxOqeNIVbJvxNn1divfnUYPoOQrqA7a14VPtP1y1Z/trkI1atjXOaXkG31Wv8RuBRYUNYmtDKR2s8JbyOVbyPkJKnnXgBcRVVyo5Y7mVevkOdQgWP43PVu+RIFdzI86Oyr9FRrVe5ZPbUlvO1JbQ4EPpTVRkuGLG5zvkysE6g+sOGGYKAUTqZhX7b1hXLfuB64yy2A+IgWFluuO6k9z/ftcT2dtHwYs+JW0OayhjJyWCYwL6o5VM+nVGvD5hlo7GDrEuexqMOG+uhbQW8DQcGtAL6lgLo3ChgxbMmF1SBBVGRV/b/kh+sIIm7EYKSh6bl9+EaHhZIPm8rWk4t4abvhX5mH+NdWC1EClaJt684=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?SCMcJJEThAD18xObxKrrg8b38qL+ffQDOKjalrf9PMJxotsYUNrXkqC5cA?=
 =?iso-8859-1?Q?2gMG5uVMNjKUtEpjak3DpT1xlmp4Ph5J7EyHUPNp6E9QaHPM8MAqxD1/Nz?=
 =?iso-8859-1?Q?GotVBHTIUcS422xHvFJPm3W6t5riH/Ulzk+rEtY2Tb84QHUTsxFJRKg9XV?=
 =?iso-8859-1?Q?2WR4f+cYfcxC54v1iNT6141rLZI38dIJbg7w/xmWRt469xV04as1OHffvp?=
 =?iso-8859-1?Q?LkNiPeFPocYQxXR0wOrcoZFnByXQzbgZNEegCMg95qSnUhiekW9SwpOK4V?=
 =?iso-8859-1?Q?zvvyoRjSq/G8di9aCWbWUxOQG8CwYYfuyftxjLBohTmV9kCRoXzq4b7I3K?=
 =?iso-8859-1?Q?fQwKPk190AKQttewqUPNJ3JjvIEuVsdFsN73PkCEW1NB5Sh5Mu7wFcMuaS?=
 =?iso-8859-1?Q?QV+plqrqYcwUZAnPDb7iDN9v6wh0pRNKtjICCOUthlF8+Rkkg6yc0s8yZs?=
 =?iso-8859-1?Q?rTp2yWUTjZdgrSeDniOke81b32wseM2FII8GpsYfx9tN9uRSEILcckgQe9?=
 =?iso-8859-1?Q?/ol+/DPf2BZt5FMz1SncmQuAKyawM1DU2Rasx6NEfOra6w+IynLk7bCtpP?=
 =?iso-8859-1?Q?LLeXGprWQZAWJTMQVD8gV3eU2LWNVSA7AG9ZGXdWhw6bXX+nQQvEijGNOJ?=
 =?iso-8859-1?Q?/bn+jwEe4CSOKRoUXx3LNaW8Dkkpl5lHpUxHnanDrgVgZ1ZMVtzqBw8rSF?=
 =?iso-8859-1?Q?82VPUAwLtfijHxZzZenYOYAsM33FF4SQihw6W1QqtmekdJSlzaUNX3hkzc?=
 =?iso-8859-1?Q?72EbySXsCy6kcXSjJP0WdD/uOvqOLeOv9qrbpu/rBe/0zPfB1B/fqsL8fq?=
 =?iso-8859-1?Q?fWtsiBMhFZLdL2xHANxNpBeLpcORk1cOTN7NrAXc3vfxdlEEgoeiq8sHg+?=
 =?iso-8859-1?Q?9MSZ19vRMFKEaYqa1XcVsEOoe9RVZas20Toadv013TltgF5WjlCPOtfaI8?=
 =?iso-8859-1?Q?mDavGvQU4J1+MzJ6ULqCEE+/wMQHQNgVW4ZNWmVvElGoMMoqzd9YkKnyi/?=
 =?iso-8859-1?Q?C+Xks0RmwQH5lywAhpkCaYNec55VOoywWj/a0sZu5g5g7codSMfEsGnrU8?=
 =?iso-8859-1?Q?WykGNVnkpL14xZ9X3xo+1gCjIDLT62FnoMYVuqdksC612CwEoTY4Zr8NtT?=
 =?iso-8859-1?Q?ZDKbQsUawEuqrEqydF/gU1G4XDtBw+KqTKMWhM3xEK/9agzLu7LAkaY8WF?=
 =?iso-8859-1?Q?x9ZtT5kYxKUcM9yHjjU7ywKqP3GMVX8evVyGtdNbO+BP0fRcodDXszAsvG?=
 =?iso-8859-1?Q?hZnl0lCI2SjoiXXwVGbKWqz54NKesms5ZKX4nZjVTmH+o/UhhSeSiGco0D?=
 =?iso-8859-1?Q?j0+O8zN0O2Cr7bXY+RL0AjP1gu7pj/UTe5BG+lh0N2XoYGdcj5z67DeZAd?=
 =?iso-8859-1?Q?NQtDWGLSUgLx9YTCTyAtfFsqvfD99yGofLYVyGiSy2OaMAXKtoZnVUcpn5?=
 =?iso-8859-1?Q?Gujj406/0pGo4cVuaQS9mPDUeyT6mEtMsHBBQpGrnAlphgQm2e4DtXLzMl?=
 =?iso-8859-1?Q?S+TPoAX05GzHrzXcQfAA9kT654kGAe9dNJ/SgbO0pyyO9MUD1Mritbio4r?=
 =?iso-8859-1?Q?Yd82XA/22MSJGY8QpQE9lEehGanDcegxmgTfZKxgO4SCxn9FwrK16XdNYT?=
 =?iso-8859-1?Q?qzQf4Z570UAXQ7Eb1NGrdsyOo63a/jzL0jWeRohXTbFUJUbNhcWORsAUhu?=
 =?iso-8859-1?Q?jh5iVuhSG6sJJu3dAoZ6z6wHjWDTUWr9a5mNArArnrd4BFnulzoTqwDoa8?=
 =?iso-8859-1?Q?vkd2q7a8/R7+5qdA9x8n6wx638n11VwjKSQr3Sffli2A7EUfPi22+WsUux?=
 =?iso-8859-1?Q?SAf44Kg+fQrWfNGr61GSBKFonUERD4VDiBey5eDT/Bs6CYfPtVkH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929b5a1f-dfd7-46bd-9cb6-08dee2837e3a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:12:32.2518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bk/Z1uFB+173e/1ge4TqOjonBBFvpPDI/KbjptGsBg+us0i+Kb277Way/7wSMgYQSccPUutejHVjoSibvrG+hnOapGwhw12rE3qcgwWT/iNqNK1jx4pviQm8ytyIMZOl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7840

On Wed, Jul 15, 2026 at 12:42:07PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The device tree assigns a dummy clock for 'slow_clk', contradicting the commit message which states it is configured to use the 24 MHz PCC3-gated clock.
> --
>
> --- Patch [2]: [PATCH 2/9] arm64: dts: imx8ulp: Add I3C2 controller node ---
> commit 56028cef3837517bbf3f1ac9d58c6983788955ee
> Author: Peng Fan <peng.fan@nxp.com>
>
> arm64: dts: imx8ulp: Add I3C2 controller node
>
> This commit adds the I3C2 node to the imx8ulp device tree using the
> Silvaco I3C master IP. It also configures the controller's interrupts
> and clock sources.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > index 5438958176985..c82c3388cbe79 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> [ ... ]
> > @@ -361,6 +361,22 @@ tpm5: tpm@29340000 {
> [ ... ]
> > +			i3c2: i3c@29360000 {
> > +				compatible = "silvaco,i3c-master-v1";
> > +				reg = <0x29360000 0x10000>;
> > +				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells = <3>;
> > +				#size-cells = <0>;
> > +				clocks = <&pcc3 IMX8ULP_CLK_I3C2>,
> > +					 <&pcc3 IMX8ULP_CLK_I3C2>,
> > +					 <&cgc1 IMX8ULP_CLK_DUMMY>;
> > +				clock-names = "pclk", "fast_clk", "slow_clk";
>
> [Severity: Medium]
> Does this clock assignment match the intention described in the commit message?
>
> The commit message states that the PCC3-gated clock is configured "for pclk,
> fast_clk and slow_clk". However, the device tree node assigns the dummy clock
> (&cgc1 IMX8ULP_CLK_DUMMY) for slow_clk instead.
>
> Should slow_clk be using &pcc3 IMX8ULP_CLK_I3C2 as described, or should the
> commit message be updated to reflect the use of the dummy clock?

Make sense, update commit messge or set slow_clk to &pcc3 IMX8ULP_CLK_I3C2

Frank
>
> > +				assigned-clocks = <&pcc3 IMX8ULP_CLK_I3C2>;
> > +				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_SOSC_DIV2>;
> > +				assigned-clock-rates = <24000000>;
> > +				status = "disabled";
> > +			};
> [ ... ]
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com?part=2
