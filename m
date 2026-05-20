Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4315137DE8A;
	Wed, 20 May 2026 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779302229; cv=fail; b=GxLNn9Jb5k8EBagaKoMqzz64Q6YSYNUI97yPcpZzsNLi53UoKt0XH1HgWThPThDRnvKcfThCW/e8i9CmqtWvXj1iG7qEzIKvdukh5Lwg+ArAB3gGa9+VizjyEySD8RokfpJu1STSOp/uGcw2uiYBpEPyQ77RCrTXJbmLwlQQQsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779302229; c=relaxed/simple;
	bh=pq6S6wOaIH4gDL1zcV8e1TbcReU31Sfs91il9aj/3lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cFekfhwpYOonhbCuc+8Py4d5+ESF6olX9WrA5fZpENbKsmZKXVoEzPjAFYseeeE7YC4G7Ftaahclt4noxedgN8BNNdDxAj6lsbbEf+2tR5GeKitmYd/zuEXJ/Nad/5x2nbgTWzWi7hTSY0LgfzOf9YtKVBDjcmOxMB2l5t3z7Rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GoOxpvDZ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GoOxpvDZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leCKBAkD/iFQ+7v7qit5rO3MXJO+ak5y5g3OeZQkQ/wIlBil549QA834OZo+hkN2YDPhIz+lufUpWJaW6xQUtD2fSgTm7QtTY9GQOZf3q9R8odCR06PnbP6UXOuAnNQ1JWRJid1+REym1X/CdxPCh3AgYUv17GtaZ5D7SSW8w5m/1aWn6j5tIPBcTia8yTdsoTs/QopoO5/aoHTsaY4YSrbjl+VdvNyfcuDJOHinFh48nrIBxPtq3+v9AxT9k5eoMgtN0AX3MDWlJ+oS0bDovFvdx9dW8etN4iMelxR+d3eQM0SnHipHz6CUmckZzenWERL3pZCeMMQP2a/RwwwG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IMX6c8dJSkEcmBok5f8xSux72we50Qc4er9R+Vv9vE=;
 b=Eon1Czwl3xf8SZru1uREOqPhEkfy0FAumSv1rtgfDfvym4QbDo8yyUNl1tc4QRpyMB6peO+FG/03xNZ9RlOyqNSzusXGP5qvO2vfJYFCGRWfRxlWPgKTfLWT3BXLo1F9tf6Q/AERTsYxJh4LIWuJpWy3oXYYRlbJvSKg05JTTXrZAb1HLOd20l69/qSr6e+pStzjBMKbbClinFXi9DZGMe2VcEsJrnwnWa6SWH3pLO3pH64vijRD+4/346wMVZ6FMy8cfB6QhWWqGKQx29Kfn1F3gS2XNnd1zH0MGxI0chuq6FvGhlonD6HaoX7U+HISLQnwkNvp5FO4e4rVJ9LvBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IMX6c8dJSkEcmBok5f8xSux72we50Qc4er9R+Vv9vE=;
 b=GoOxpvDZOJXbkV1b9WNr6OGoCexiNF42Z0T2ERH4MghBxdSWgGImrWJumY25baa+I/D+fQ16LNJhtKU7YTjLviufLNwPKhv+y+gUtuli83Yx0UkA2BJbJc00B2ON1RKn4gDINi7K3fZs+Fs/7DXKhktjSziKiGYDmESaE93HeMT6ldBIo5oH8cCAo2QUET/3kpQR4Svrrvlqp/qFXN7Kf0e6w7jTswDN8k4eH90ezBcLSwOQlPWjt/qs0xldMTHZ4roEr/9HD5PhLu5/nzTvtuWLs6XLm5nsknNuEYjezQE6m1i1zyzQ5mOWK9voYB0srQMNHq8AR2uwGdsH2223ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMBPR04MB12312.eurprd04.prod.outlook.com (2603:10a6:20b:723::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Wed, 20 May
 2026 18:37:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 18:37:05 +0000
Date: Wed, 20 May 2026 14:36:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Franz Schnyder <fra.schnyder@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: freescale: imx95-aquila: Add Clover
 carrier board
Message-ID: <ag3_S6vQ_8mmVfKD@lizhi-Precision-Tower-5810>
References: <20260520-add-aquila-imx95-v2-3-06424a51e33a@toradex.com>
 <20260520121639.97C711F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520121639.97C711F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN1PR12CA0066.namprd12.prod.outlook.com
 (2603:10b6:802:20::37) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMBPR04MB12312:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa59e4e-5d0c-44d7-bf5a-08deb69ecaa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|52116014|1800799024|11063799006|22082099003|56012099003|6133799003|18002099003|38350700014|4143699003;
X-Microsoft-Antispam-Message-Info:
	wIu6zYby0WSjA3FgiT1hawgxkywrhBbi4wvTs0wjwNgyl2Aw+Io2bxuMl5z/+SkIr5clRlCZnd/gBeEa1cwTju2bu40MYc57TwlER/C9fMIczXXOHAyYQlM/szU7Br+Da9JPewWuzezWt4FQmFPWrkSewBezwVwFRZpji9cjlaREz3BX0Ubfjf1C3jALGASo3NL6s0D7T3OIOVRsOz+tAmEHTxvTVZ1VAiDjufUjOwUzWxxjNLsV7mTPDDmqHbq9ZBqVC3crIFyF7f0sKO8VoUw8MUfOcDTle2YLLHhjIqjtw5oIMfGZ2RmZ7Zqn1zSdkzb8/jplvp+8Gey4THiq/521iBhwuALkyVBKwWcAAy1GwO3ZjQ2A10dsxzoFMdnGubxQR0E7gtzE69ABL0Axm0L4/hIwpAp35HWTWXZ9oXSkp9jBwjE8KAODFRkT58kHvv0k00plK4gC41Dy0JyJzrc7Bbyagk7+6DcpCqIrRHwLlthB2V++L9I/5Hm6tneWfBny/OuG6YbEbgVd+w18UzSQxWOtrrg0sLS+Fk+YqffcuMC6XwflFt7EApx9CW6T/1ZzLQ1XbPP2o68Coq9J/WnyMMcwlggUOS4Y2afCBK4AAcb3Kub0AY2oNOI5EZGYdVBuil8CPTkSfniid9VHd4OO0auZaWeuhMXyZjVFhDt1OMZ7YTdXP823NBnmHs7F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(1800799024)(11063799006)(22082099003)(56012099003)(6133799003)(18002099003)(38350700014)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?l0lbZNOkMqrqhCH16rvQeKo0TxAhHwBTm1ro11hLfWG/1q1Ce8toOCc2wG?=
 =?iso-8859-1?Q?+fwozucUc8MXxUdA2gvng2+F4I7zdzDquL4vEUVYETwn3NyAl/rAsq651k?=
 =?iso-8859-1?Q?FC4WSZe4kHZyJcr4sQOk9IMx/I8/9IEFeqAPCnjd+PIXtHYbXhC2c6RJ4I?=
 =?iso-8859-1?Q?piopbaLfwI6X5LsLAodX3doUjg3EkXAtt3zvhQ56eYZ3pwJ59D8QncpJ23?=
 =?iso-8859-1?Q?92bNzCa80EmeXSTerIjgU2LN/AhW7ITKANlsRwy6apZAirRDnJR0fvlYpf?=
 =?iso-8859-1?Q?QOer8unWja7f1bFyrQqZZR1CEnHE29Qi0SiB8ge5ybp0CY3DMSjJ5Dq96G?=
 =?iso-8859-1?Q?J/gNIZwdVTOCFUHf+RYxOA5pjYb6+l2W1Ew2h88l2RgCUO83SiKr2E2PhD?=
 =?iso-8859-1?Q?QabN2nem2qxVXRhtTFYMQ6zIu5rsn9QrO+a8+uu26KArqrC766pXPGtC21?=
 =?iso-8859-1?Q?Ga8yZ0cljtzNJFvXXPo70+jKuq763RA7BMcxwzoWh2wIe2V6lQffg+5W5n?=
 =?iso-8859-1?Q?98w85qI5gidDvbqpuEuOChr/OcOAqtU9MTrRsAK3EHAPAuFtFNPkdQHeWA?=
 =?iso-8859-1?Q?VfgtrEM1aJVVo22FMbcoxNgGW4TbFfe87ofbM+5soBuPgZP6J5gBqDS+QZ?=
 =?iso-8859-1?Q?WiF/N6LXi8JvtNYQ/+lSF5J/B560RcXLJA1NscmxQPTPPQK8+p/DTwDYdF?=
 =?iso-8859-1?Q?QZl9WEHuep0yp2/T9cP1sigjLxW3K8HAgc0Qc8m4Va/TD61epvHSC+seQw?=
 =?iso-8859-1?Q?lYXR5fcV0uA81qzymdujkXVAaPDO5neuK9AgZ6onOoMEy11LFHpfYPbxPh?=
 =?iso-8859-1?Q?lya946tEEyD1rGHcwNs7EkTztVMk7cc9rJd2xJThDNtSN3IOGIqGoISfdT?=
 =?iso-8859-1?Q?ocBluNvTQYjS46AEWIJw15WuvB5FS0FroOWFPtpbUPpOI/02JB+vhmQ5I7?=
 =?iso-8859-1?Q?IoTv2Pd77hbhL+FI2AtfP7IzBciYQJ+Jm1VDAcleavu94DJPgKeZoUKuCM?=
 =?iso-8859-1?Q?UAu+ymyCqkdogEn0AHxIRDC5XgWG6GY1zFNz9PDgym8b7KsNhruL98RL1t?=
 =?iso-8859-1?Q?FQ5Zu4Fp76uDibRbh/1M9FZEyaU82FcUj26yEJAVonhVYYvqAm00O9FWX8?=
 =?iso-8859-1?Q?CvczCQAll3wqIw4n3D20rxIF+8FPSDNz0NRSqKslTalmi1x/D0TvwxveuS?=
 =?iso-8859-1?Q?kPCfmS6EfacWsZRpvYAzIzQ2pFyk4bAGa8J69okm+Wb9TQ42gH2EQJ/9vd?=
 =?iso-8859-1?Q?l/lgjxU4C74Gw3oulFzWBge0lg4QKDEj74/UIcQ62kgsOITPH9UvIbbdfD?=
 =?iso-8859-1?Q?94q0GUoSoh7MkVN9f9JAFBybgXCQPmQSbj0BaIOjzvJc7NPWVkTvvsSp3n?=
 =?iso-8859-1?Q?V5rwOX6W7W1g2N1Dxe6qhFCVNdtSFycNPgNkYJHA2e+USFEZYugWcH5RZb?=
 =?iso-8859-1?Q?qLcYp6FcosCdMPYBEGKj/u0K5RrLAMep3SiP4/KqCamJgX0iToylYCUOmd?=
 =?iso-8859-1?Q?8NzXF1aUVN9f3IMqnH13csM9UFQ9r7nHRniBtxQjR7uff245wedJ1WxkHK?=
 =?iso-8859-1?Q?EJEzrl49TykLWgXNnxkrBrJHPh8t3tqe6mPHyNKPFo5dmKRoEMIjIMQV9m?=
 =?iso-8859-1?Q?7NDr71Wsp9YP72aSaaCOxAwrtD3GYNU3FTZlX3NBQtk5yZ907LMGAoFKyY?=
 =?iso-8859-1?Q?Q1SReVs/nWC/kaHET0itRGgClHvjPaOHzyokw+qw9PMz/6CU/vQix5i4By?=
 =?iso-8859-1?Q?+OhR/024zpcvSaRsxD/dus/C/z4ulLjl3SnZPUZMhZWN/3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa59e4e-5d0c-44d7-bf5a-08deb69ecaa7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:37:05.5621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0dZPjL3ypvUnRO6vhiejN1WH9ZEdvNA10RfyQ2qjjmpuAW4NcmEaxXEj1GOsz8J3+mngGPqaYHgW5F6ndK5Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12312

On Wed, May 20, 2026 at 12:16:38PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The flexspi1 flash node incorrectly uses Cadence QSPI specific properties (cdns,*) with an NXP FlexSPI controller.
> --
>
> commit 58fa26ce8327e303e6d4b9e4915178ba8d66e5b7
> Author: Antoine Gouby <antoine.gouby@toradex.com>
>
> arm64: dts: freescale: imx95-aquila: Add Clover carrier board
>
> This commit adds device tree support for the Aquila i.MX95 SoM mated with
> the Clover carrier board. It configures basic interfaces including DP,
> Ethernet, CAN, and the FlexSPI controller.
>
> Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
> Link: https://www.toradex.com/products/carrier-board/clover
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
> > new file mode 100644
> > index 0000000000000..021d437763412
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
>
> [ ... ]
>
> > +/* Aquila QSPI_1 */
> > +&flexspi1 {
> > +	pinctrl-0 = <&pinctrl_flexspi1_4bit>,
> > +		    <&pinctrl_qspi_cs1>;
> > +
> > +	status = "okay";
> > +
> > +	flash@0 {
> > +		compatible = "jedec,spi-nor";
> > +		reg = <0x0>;
> > +		spi-max-frequency = <66000000>;
> > +		spi-rx-bus-width = <4>;
> > +		spi-tx-bus-width = <4>;
> > +		cdns,read-delay = <0>;
> > +		cdns,tchsh-ns = <3>;
> > +		cdns,tsd2d-ns = <10>;
> > +		cdns,tshsl-ns = <30>;
> > +		cdns,tslch-ns = <8>;
>
> [Severity: Low]
> Are these cdns,* properties intended for the NXP FlexSPI controller?

It makes sense. Can you remove it even AI mark it as low

Frank

>
> The imx95 SoC utilizes the NXP FlexSPI controller, but these cdns properties
> are specific to the Cadence QSPI driver. The NXP FlexSPI driver does not
> parse or support any cdns,* properties, so these timing configurations will
> be silently ignored by the kernel.
>
> > +	};
> > +};
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com?part=3
