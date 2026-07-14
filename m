Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010030.outbound.protection.outlook.com [52.101.69.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB1C2641EE;
	Tue, 14 Jul 2026 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038429; cv=fail; b=kp4Ic7LuAlz/07LDh8e+A4++rnqT08EXq2A6XUXey7tGS2/q5zd5TbA/WopX1ppfKuESmBvNXEA7WEKgC9B/KWKCyrwKO7cC7p/xkbXIKonr3JmquMnZYnxPGXKXLcWembN7Hq/sTFO7CBxbgIOLfTiw7yxPi2HJApEe6mYhJJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038429; c=relaxed/simple;
	bh=B+5/ombiYWwpg6JPQBDT9VS32ywx3Xur1s/mxXc0heo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ltVwzhj9rp2c1srqZvEjTOHbfrZgQ5tXWhU6lIIcy6Qke7meov4zdUhiJW+fdWNjhGx8mE1AVbTSIt57uFJEMZZzI/PKALAIo+6ccvoAUyY/kkCFGEhB4IgAjN1giUo3IE5hRMr8jAaBuRXawbGX47+zIQF4GZ8/TAWfttnKc1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VwdXi+Tb reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VwdXi+Tb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zl2DJTXH9jheUUC20KXQM7m5jMSX5X3QM1tKcWjCRgyW+fDPswK8gvpk5SEAlcsv7MRYtgeEbaxgkY+5cmxPlKkHSd2LaOFAkNxmVh6j8k4xLxQcLFMK7Y2S+bq9ZhctEqcJfPAp3/dMO3gdxeRDTwOOAilMFqs4QdY071sDeVe/ny4nwcFcpdJwGovwX80HDcYZ8wO70JEDOHzTxsr0hvDCe/h004+cfE/FDINpC4gilmLo16hA5nNBF9lIrefEiiiZcs+ZHY/OWav3HbC4cvWhro38/ePHth8IdTnnaBpvI7nY+nCKbc/WaJOBWK+zuSmI9wBdRDUc9jjZ3RlngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cv+2gO/sWr2SSP/5ngULFZCNelF3wV41uhMduWL9jyU=;
 b=wjakgB4p+ai6Z/29RRCfCUoiscYOBLsl5tnCS+30GgefoT9TZ2+2Z1bnXQON8KZFzrmaCO6UWfe0fckan5d177WPmVhxzln+bdW8oESf2H8NLLvJqcuYVlgTbZvMaub6hAMUOFiU6yV3C2QAG/2uHjtoQ2GYqOrHTMvklJbdnSPEQr/mqDy6CbvYepReIFuPer2DLS5H4/G6JpPG0FoaVjNJAsJQu/ojEqkUAgKzpldr6Ad/9AC+qfwwaAb6WC9CM+gBcPHmUD2Iob8a+ufd1GAOnORPy7EP+wOFXABtTogKEB4RXImbBw1H+ilccLtRvwpsa6D12rCmJMd/rmDBQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cv+2gO/sWr2SSP/5ngULFZCNelF3wV41uhMduWL9jyU=;
 b=VwdXi+Tb7G9hew/iccLl2jKWETSwLhHPbfZAYDnpHEtHax58ugIlM1wt17ymurFRm7Rl61RbemMGpl2h9Ory6ftdhYW9xy5dicYXvZQEIlWYh1ABnX9Cn0/ASrKDImxdorX8Hn5pbV/XoV67HxwOioT28Zss2ws18uV4LvNJ4zbiwGscinzhtIouvrnR844hHJxX5710CVrvsfTMG2abjKb3JyMXKsWBBeeSLgU9M79cHr96nL1mJjxY5y/4oBoXvXAmSO8fmlSOP+xNPFV1wHlwdXeIWlvsHbpORPUziLjhrJo/YSpj7MqZYVw6IKKJNHb7YPEZl0Nwti5e3EcQlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9348.eurprd04.prod.outlook.com (2603:10a6:10:358::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 14:13:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 14:13:42 +0000
Date: Tue, 14 Jul 2026 09:13:32 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org,
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v7 1/1] arm64: dts: add tqma9596la-mba95xxca
Message-ID: <alZEDOB4J6imYwVh@SMW015318>
References: <20260707062506.949806-1-alexander.stein@ew.tq-group.com>
 <20260707065956.124121F000E9@smtp.kernel.org>
 <alUO-oOtWBescUK6@SMW015318>
 <1965063.tdWV9SEqCh@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1965063.tdWV9SEqCh@steina-w>
X-ClientProxiedBy: SA0PR11CA0044.namprd11.prod.outlook.com
 (2603:10b6:806:d0::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9348:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d3df81-0d8e-41e0-3395-08dee1b21c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ys87vBEseh1f7wZ17qo+U/K0p+zy+oUfmSP4d6IGtqU8srpWWTvNgN+W4+QVbAM3sb6krvT3zxV1aEaDt76XHb/yZXo7iX9aA/xhN9zo8lYlz7CW2UpioqFVv+aLIDvVAdUODTS9zBMFG4PGBf9810bVhJmnXsi3jOm6G8oK7VgILxIZAxwK5UnRdYUFCsCzyPHEZOs4g95o5foEKMzUXvswRBVGpo/HWOoEHKf4aCJt5LhQmUIYVZ5ZZoDrHI5RJT+OfeHG8mM21RvMV0Zgp+Y8kOZaIL/21FLALJV3rwVu+tcKa062ThamzBYeJSx8Bt+EGVEpZH74e/1sJggPsorFqv843rIn9FnrCBmtvc35Hs/E6VSMORdnbhBCApoeMKoQXiZf2UWEjey67iCK0L8IFU6/whrt0Tb/CdHfpUYHmRPtSrLfTSCeQQmT9p7N4H2u/7mUfZOYJzfye1x8brnRLMku2bK0II8UI99vs6z/K8asv1hL6wZmlhd2sqEzBgYMo3hfIAh6gseXrk3CfdOFXZ6qGqUaN7NWvHAAFfzqDSBUarwqvOItQZxl1sVGqFg3ujGDyavnm85KHK1pkWDfQMjl1J1+mcjvSzJwwC8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?LEz4UN/u0yx8I+4BpZPfP5w73mmlx8yuXXMNbq7ckxzbXufQT1mkKpdMBw?=
 =?iso-8859-1?Q?NxFe2dA3JefhNMgaTszntkInFYvPIlYvuql3UEP9NQpV4BhgptdN+d9AM9?=
 =?iso-8859-1?Q?SZQCOHpbjJE7xQpkUVztF3UCpMmimLQgpxUFiyCMZO9t5zQXZ8p+w45qs8?=
 =?iso-8859-1?Q?dT0K7kFxxSF56F7BXx5eKnH05TMgPAjIyqI/+brWrbTydEYP5sV4VFgElg?=
 =?iso-8859-1?Q?isXL/VswDDv3vGtile9H/7Hh9BvjE1blzqrqFgUVcV9KQn4zQdelISLoOi?=
 =?iso-8859-1?Q?G+dmBnk6NevJLjQgEuMIkVIzQNdGN6tdvipdFM66JALLv8RD4lVEVvS+YV?=
 =?iso-8859-1?Q?pJ1Liz+Q+bMsD2qQWSzwap7UlW3o4zXmLoRb+roRNFwuIsgsLNSyPTzNZw?=
 =?iso-8859-1?Q?ZCVIkfKTuWlZp6204YSObJPV9ddFrVBpOzcJ9WO/TlMTloE+Sotw90JZo0?=
 =?iso-8859-1?Q?Qaxlwnko+Hp1mrnhoegMnbKs917scDBHwEpc/dfAYB4W0PtDv6fCbQxG0V?=
 =?iso-8859-1?Q?S+qU7FStqRZRjNNsxgNWtuNiEDVgWoX/YHN+5MN95sy5jTJccmtd9bo7ph?=
 =?iso-8859-1?Q?Bbd52TjCSIxzQS192CL1NcDECaL2YVr1SnjURsMUncsbu69i/P4t3KkX54?=
 =?iso-8859-1?Q?/POwY7QQH6ZfTBEFE8aN5KsoBdkWlCKKrKOv0hAgYKCxVuT+Mb1B/hQ3Sp?=
 =?iso-8859-1?Q?NVSXVLpCfZkvggCSxJ/wlAxe04cOr6Ce7fZgJAVNhnxftnK4fVxhTuMoq5?=
 =?iso-8859-1?Q?tlvKKEW2Xp0V9KFeuu3OSMYkEDHuVQdf07ziEk/jPKE21t+FaRAmOGrONF?=
 =?iso-8859-1?Q?m6OKea0mvMMO+IMYrEzfkz4p+3+oTzsuXjZxM3QjmqW2VfyT3IP+95jzbX?=
 =?iso-8859-1?Q?HukjI1ZgYWmKKXRgf9OK1wpMtM5kFouhJsgOE0/2ZSPtT8ooy1pOsgni7C?=
 =?iso-8859-1?Q?PcEZ4scK0mZyKbSoGEW1RBzfUjDoiXNfuRYgbrUBMI8Q3tuA/YkME26nfN?=
 =?iso-8859-1?Q?MmCbPI70U9u1Ws8XzjC7fvjApqPUrzS5iKNgj2fq2QXJPJyoXaQQH6FAXR?=
 =?iso-8859-1?Q?jQVklTrFlDn/Jlg+ZyZ+rmjdHZ1fzgFOxQVX23m0O6GXZpdyc24H9tz2iN?=
 =?iso-8859-1?Q?5P8vc/PGlFYi7grbKImHdjE1ZxoeAlAg80qWqhcrII9aI/W5mgjAJ/nEIY?=
 =?iso-8859-1?Q?3N78O4zzoHRYpJ9bJdOL89c4obigOyaynhd9hV+Ftgba690R3p/Xt01QuY?=
 =?iso-8859-1?Q?UZiLgheVi9cnrxV7Nw6NVmqrBi7w8F9Wg2AEiepWVO5+2vY8j5an69Pg3W?=
 =?iso-8859-1?Q?ZWcaBdsqRREguunhAWUSoovQchWpdf5wOu+o9oyu1wO/L2RZgG5MUzhPx4?=
 =?iso-8859-1?Q?aU3UEd3DhknUaiZ2nrkhUs2t3hbnPmZNgQYE9AjHexhvDGRKusR9OnPB3k?=
 =?iso-8859-1?Q?t9JJZreGdaLWakBqaPQUavLoft7NrD6EY6AIH5qKYbAU8ZFGfmj+1a7vsZ?=
 =?iso-8859-1?Q?oJlARgVcH8B+rUEueG4S9OspCseYgG9S2KIZM4EVDIDIhoE60uaWYNB744?=
 =?iso-8859-1?Q?sKg91TFtqKxJth5bBz10+KnxgBoKJ9aHWo6cC5J3X3wYzJp8wKyoAMNjRa?=
 =?iso-8859-1?Q?TNsuB6WhmbOw5vjPsRSLES5m3TcrJVtDT0gKz/vex3ZxXJw7bheQpyP9Tn?=
 =?iso-8859-1?Q?F9vQCguVbffMaZmu3aIC+nASPkYusdBA/tFVwsMqt4csvk36ggPVqFBYxw?=
 =?iso-8859-1?Q?C3xjKxDxxPJMj0vBzVDrZL1dAt9b0IrGx93JdYWQW5UGZu7ruXYUrfMMKs?=
 =?iso-8859-1?Q?kUuQn2QP3dmLGUSU7aUkvgitFoQRo+8jw2eg98LJevjgwp/eSbAn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d3df81-0d8e-41e0-3395-08dee1b21c0e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:13:42.7439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvwSBvBJH1s8LIr2Osn0vNwVpk+YggieKt1Kx8sAvXXwM9moYYfxjZvjzhg3RPdlHr6F2xKk+liQRM85MiulwMWReHtfkVCKcpCpwp360ZOXbdnBKisL9bAbB9PGRliY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9348

On Tue, Jul 14, 2026 at 02:22:54PM +0200, Alexander Stein wrote:
> Hi Frank,
>
> Am Montag, 13. Juli 2026, 18:14:50 CEST schrieb Frank Li:
> > On Tue, Jul 07, 2026 at 06:59:55AM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > - [High] Conflicting GPIO assignments for M.2 Key-E SDIO Reset between the `wifi-connector` device node and a leftover `gpio-hog`.
> > > - [High] The fan supply regulator `reg_pwm_fan` is never enabled, leaving the fan unpowered.
> > > --
> > >
> > > --- Patch [1]: [PATCH v7 1/1] arm64: dts: add tqma9596la-mba95xxca ---
> > > commit c06cc8eb19eb4a69fc0547caa6773b503beae3a7
> > > Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > >
> > > arm64: dts: add tqma9596la-mba95xxca
> > >
> > > This patch adds support for the TQMa95xxLA modules on the MBa95xxCA carrier
> > > board. It introduces a common device tree include for the module and a specific
> > > device tree for the carrier board.
> > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > > > new file mode 100644
> > > > index 0000000000000..db2fd6991d112
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > > [ ... ]
> > > > +	wifi-connector {
> > > > +		compatible = "pcie-m2-e-connector";
> > > > +		vpcie3v3-supply = <&reg_v3v3_mb>;
> > > > +		vpcie1v8-supply = <&reg_v1v8_mb>;
> > > > +		i2c-parent = <&lpi2c2>;
> > > > +		w-disable1-gpios = <&expander2 9 GPIO_ACTIVE_LOW>;
> > > > +		w-disable2-gpios = <&expander2 10 GPIO_ACTIVE_LOW>;
> > > > +		/* UART_WAKE is connected to SM */
> > > > +		/* SDIO_WAKE is connected to SM */
> > > > +		sdio-reset-gpios = <&expander3 2 GPIO_ACTIVE_LOW>;
> > > > +	};
> > >
> > > [Severity: High]
> > > Does this sdio-reset-gpios assignment conflict with the gpio-hog on the same
> > > line?
> > >
> > > The wifi-connector node requests expander3 line 2 here, but later in the file,
> > > m2-keye-sdio-rst-hog hogs the exact same GPIO line. Won't this conflict cause
> > > the wifi-connector driver to fail probing with -EBUSY?
> >
> > suppose needn't gpio hog for expander3 2 ?
> > can you double check it?
>
> Well pwrseq-pcie-m2.c doesn't support "sdio-reset-gpios" yet, so there is no -EBUSY.
> But I'm okay with remove the hog which seems appropriate.
>
> > >
> > > [ ... ]
> > > > +	fan_controller: fan-controller@2f {
> > > > +		compatible = "microchip,emc2301", "microchip,emc2305";
> > > > +		reg = <0x2f>;
> > > > +		#address-cells = <1>;
> > > > +		#size-cells = <0>;
> > > > +		#pwm-cells = <3>;
> > > > +		status = "okay";
> > > > +
> > > > +		fan: fan@0 {
> > > > +			reg = <0x0>;
> > > > +			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED 1>;
> > > > +			#cooling-cells = <2>;
> > > > +			fan-supply = <&reg_pwm_fan>;
> > > > +		};
> > > > +	};
> > >
> > > [Severity: High]
> > > Will the reg_pwm_fan regulator ever be enabled?
> > >
> > > The emc2305 driver does not parse or request the fan-supply property from
> > > child nodes. Since reg_pwm_fan is not marked regulator-always-on earlier in
> > > this file, does this leave the fan unpowered?
> >
> > look like make sense, but dts itself should be correct. You'd better update
> > driver also.
>
> I'ts on my TODO, but I won't manage to add it for the time being. How do you
> want to procede? I'd rather remove the fan-supply and disable the reg_pwm_fan
> for the time being.

leave reg_pwm_fan always on and add comments, after fan support it, we
can remove always on

Frank

>
> Best regards,
> Alexander
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/


