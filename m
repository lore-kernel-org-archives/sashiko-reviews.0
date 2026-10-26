Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.84.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793045355;
	b=oovp5P8fnO6gCP98hZtTJrqus7z/Of0IIi//eEoP4Kvdtdm/g4jUAeFESQ+4StHQqdJg
	 0QszeHGVbZ37dp+7sja8hWAwBkE2FgCNvPX1C4pNVy9hYayUTfYtYI1VvheWLWJ2OFRlK
	 FRT5MpekoRbcKHLhYWl5SJqs7sDauQ/rKAl6kgsfZQzMVvab2Qb/IPV/3cDZBtqTZRI2o
	 NIVfTo2QsZUgl6xgxMn48l9uANr0emmYtsjtDVBsCRJtp83k/CbvHlM7I0DowCKW2SCzN
	 GlLg5wA468Mqs4wWVk879vnNwan772Gq/A4oyd5mY1CSJCyXQGAFX+uk7IiRCOeRpgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045355;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=j5SYMlWiOg3406pB/aoaJ3uilksdg5FbtY9HYyRsG9E=;
	b=KnKSq2l8JY2XqLsIDwvT8FeEWzer/rHJOZu5eCCqzoLG/CkQsUH3YY4xa/Yv4VfwGBkf
	 nf8Z8ZowomjWi0r1cIXAYw4fbNtmV7cCz/bydiprw45rP07+mvJ+Bir02sM8GiktIUEG/
	 BejBTI0g0hYYhjpuzgRqQPlnaqpAzNiL32THiLlRU7487bDpUyFwqxJXictLMeUk6hhSE
	 OEsD+XEjkL5DtOrw+Fo3knkt7afeq5dK6vMATv9xSs1U6Sy6LU7Tb9LlGvcX0AM4m2PAA
	 H+aUw6O7E90t7YClbHuGpzw9UereknrHHU7MhMWVN2YyQkZ6ft4QexK7Zq12R0YTIcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=foHgGDF9;
	arc=fail smtp.remote-ip=52.101.84.36
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48461606A31D;
	Mon, 26 Oct 2026 20:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48461606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=foHgGDF9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZVUdejTI1QdipqRdVL308uKwpLIWE87CFk9GOOf5uR36FqJfdt2Z/B5Zs16kqwP42zBzMZrFa65ww0LnR5ZuaQFoz8VBB4DvEiQf9QR78iplDv/5pLu7o+qxP4oYxtyb/XakSuLbVdplWrXbGC7mpaEBVR4y/Y3bQq+w6iHi/3+YzuokAi7yvaSoWSQzcRpVHqmwhTwzvcAUdsrBW2TfRHEFP8QN16ZsM22IASfC7m9vuvmdsv0En67erpvaCCuShM3EqBNSHIWbUCBaJxbEQXSK9/sKbgrP5mRKFtj/A69O28jLEqjn8nizo7W/Mys7PHJaazZdkkZM39hWmlffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDVTxPWQVFjPOUJ5dmmR3o6onKt0LIeoCgM7lQLMZZQ=;
 b=EYNsmiwtcsA0g0LKDprj2mFRbaOFLHkfYAxOCint28G3v2ZiY3wBOYyS2fAFpyBjXRyJDqZ/NJOY8gZIuewvDL56PF9UAQrK7BZkA4yGhXDVc2GurSlH5zyW+5lD9m2EQPlifshmiSBX265yF+3ImGnnXIMTUHV4KAvvIEABzd9AkzRhIJlvnKotLMmFXkSToqfPI6D/WlDGFFamA9zzxRzvqcKjv78R+UPyHDCKrHtlfdGQ7Bw6+XmFhCJ3o+eyufLUN7EWbHEKVCqVzDimvx2fdjDll6by3CdHjFpwfQZznNzvv5hCXlEEegacUzx7j/ghS1QM8yUiM6iPMJBURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDVTxPWQVFjPOUJ5dmmR3o6onKt0LIeoCgM7lQLMZZQ=;
 b=foHgGDF9OwwGAamKGuDoOM5Xuvte1ZLH5qc5JfxOF/bqnd6EuPx7jQ64OVXVAL5rpjSaJgBA2UsB9TkAzUhb4Yl9VY2EhYBz4Ge6xX37iASJQ9r95ZBn9zwTJaOZ4WiNQAej35g1Ais9T7jrVEyKUAIrBDbG8a8C2/Viq615BKRN4Uemc8Ma66PtCsbXHSk9d+lMcNUHXOEzuciEH/Cze1IJsMa64cJ5zzhIAhJUGFRDoT3EIwP3DnTJr2nKLfidcNGD3PiaJ+oUPpkr86B5OydKaatHkbYnGSeIcyE6KpPNZmZ7pZ6NWZu8iX8gpt19ejKuO7bTEpNAQF2MYh+LhQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11659.eurprd04.prod.outlook.com (2603:10a6:10:607::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 20:09:12 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 20:09:12 +0000
Date: Mon, 26 Oct 2026 15:09:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-navq: add USB1/USB2 nodes
Message-ID: <at-zX6Go4I415M2z@SMW015318>
References: <20261026182150.11330-1-laurentiumihalcea111@gmail.com>
 <sashiko-outbox-185636@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-185636@kernel.org>
X-ClientProxiedBy: PH8P220CA0035.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB11659:EE_
X-MS-Office365-Filtering-Correlation-Id: 2590a778-69e6-4d0c-c9cb-08df339d0075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|1800799024|22082099003|261026121527099003|18002099003|11063799006|4143699003|56012099006|261009223027099003|261022105027099003|261022075727099003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	k5d6GI0fuwf9ApO//JaXvL+5eZhGZ1TeyeGXDRwaECOb+KogC4NYDGpoG4ryoA3iQXX6MicYTCRU0tpCx3pB+fJLmRh7rCPCkjR5ugKDkG0b3MYcQuSu8cL+j4HLCzlzNrGuHFvaOFbM0NTlrzvymYetIbGiJCeu4EqXNkzxOY4l5GKvIj0aWlpTfUOHbdi0Dm0R2xZx2HZkiWH3uftMxMEH/biR4f1x6bvTO1oVtnLY1H0e/EHNv8FTQ5jumRf1aT1MjKxkRrKS4Gc05/MmdSxtXQBqM/ur1s/w921i/VwSbYV934JD3Iar/ke1Ucotl+w3pTFcNphkfpM5onV/IFSMH+l+h4e750rD/+Ue/e66ecX1YWNuefac37MuBy6c1c9DdwW7aTL9rwBEkdiNM4IiADmQ0TVV2EJfAmOy48AhLxPlfetrOoWMAV8/QWuP1QLICukf5ILbEWrGY7lSiKKIWKTe/xb1Zp7ZOtJ8b7N/7kTC58gRL408/+go2fg3+XjxagN4JgADQ6dLWTNPfZclJWbxNaZEN+QW/Y5ECyz+967pQs/rrnqCEpRwneeOHXc3C/YnWlAyphkxXN5zWeG0bwQvrus+TgkprvuwsFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(1800799024)(22082099003)(261026121527099003)(18002099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022105027099003)(261022075727099003)(10067099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?KTnvms5hv84MIwhTGPiW6bhX50qmbKSP5/S2+QZ39VA2+OyEWiK/6brR4C?=
 =?iso-8859-1?Q?urs6Z6iVKtwvdEKdb9fgQGG/hU2ES8a8IM82rxErWnivjBNFhgNGEW5sOE?=
 =?iso-8859-1?Q?3JznPGY1YTjow53tEJLDc4M8vk3f9SOR+y3yx5O0HGhQBad5odeUQD4vqb?=
 =?iso-8859-1?Q?rH0LjD+ZafDo3hv/w7EmTCqzddaa5Pdo8xGnhM3thQjkpAdLcUTz/5kHeY?=
 =?iso-8859-1?Q?6ebRv8jI6qD6RhYZ3NNo1v/+fxUQVE3jxyPmsCRrfh06RVPlc7dYBDirRI?=
 =?iso-8859-1?Q?pem1B5NDbz2b6o85LgaKNreSUum/pjUzj+4buncpXw6W6yafhP2DehPyzt?=
 =?iso-8859-1?Q?QI3BNsOokw59zyomYKoLt4YvO4QSf/22WXJZl8xH9KVyXbE6nsUHiusD6R?=
 =?iso-8859-1?Q?y4rats8qr4dlWB9zOPX4iFAINk1ofu3RPGEcA29PCVvacyyqaC8Qjibknf?=
 =?iso-8859-1?Q?wsgbT5TyUtNDvIigki8ZdWcVcZGPexkDyCuFfc7u9gPBTVeCV2REWRF3on?=
 =?iso-8859-1?Q?O0hQewYYEP99++iDVNMu3aLfYIyL4KEjuhACcJzpGqSx7qyunnXopQWO/A?=
 =?iso-8859-1?Q?0sDYLxccZjxwBmk9so9Y1NHr0b1Q8LsFW6Smms4Uy8xr3Ho4wawxLsiMyB?=
 =?iso-8859-1?Q?00y5mMjZ+zzG7laHnU75m1A6U6Yt0EMXr7XIIB7WgLWQfiArusuJhNPUsp?=
 =?iso-8859-1?Q?JwcEykcHyKzd5mB5FeBcbIXFv40RrgT3Qr2TO2w0DtdoBS9nf2HDgHgW8a?=
 =?iso-8859-1?Q?9bbe4JkuWGxu0L8D6HyoqKGoQ4zQM9NHz5JsMDd35r5c3amL7U1MaJeJmY?=
 =?iso-8859-1?Q?3uzdVsEJsKfiNABr51u4+yMCe/8vkPRKCOLdivwNNEP4/GvN9hTmD7KQxU?=
 =?iso-8859-1?Q?0Jt0iscgf1Y4/rveqpVYkb18CPtR7PkJAbQdZ2MDdFQAP2MSCfZ/Ok+dAC?=
 =?iso-8859-1?Q?6yz/5JT7BlHSUvVJIvjHb45ECPkvP4rGtPu153jFxrFxlVX6XQpcHc3EFS?=
 =?iso-8859-1?Q?z0qh87qNovtN2fg/+C7tRN2JYItCNT/QD1PLwYiFwqvZUfZb+aWE0SG6hT?=
 =?iso-8859-1?Q?kWZZ2rVuobnB0clPZFXZk0CqGhNAjIWatxvVydOK4DikLAaLxP0iaSkIts?=
 =?iso-8859-1?Q?QlpSq50vikaHWAs1zSJJ/9bX9r6jACDrpMIEQPvdodfwYdkxcum1bN6SQq?=
 =?iso-8859-1?Q?Kf2T0JfeotneyGGsUpBrnOCiuSCaP7bRxECT+agGQbCf9iKnD5w7hApc0c?=
 =?iso-8859-1?Q?J+s5WhG9iDbe6rMxDczPrQk4s0dO56FF6AFKUTDqmtZWoCVNrTeTO45/gA?=
 =?iso-8859-1?Q?M3/Fg3Kmh8ZIXEV9uQNNGskwsgWphEi9FQLplN6rG++T/hqFy/0K91X+HD?=
 =?iso-8859-1?Q?Sv7XckPlQAJZynrWQ9+Q940iy6PL2mvPS7+3EU7Sch8JBeLgi+jVe8PrT6?=
 =?iso-8859-1?Q?cexiF1XskEbsqW2BjzQdcy1mfDkD5sDlABMKhob/pCv6C8XAgpXw2Lm1SZ?=
 =?iso-8859-1?Q?CFjV2/iytl0zNfD3SUL19Z6+noSqNapLNJQ2Ajx3jperZ+dwOiTPGv1dBv?=
 =?iso-8859-1?Q?mZEyauu0e/rus3fOi1zew5Zqy0jn3IZcEhGxG8OSe5rIDj7CQyrLG8iWbS?=
 =?iso-8859-1?Q?9s6YM88lMbK60nQLN8D2BJ2SPqq7OOg78uYNjJX8yD2PujLH33YKID8hQw?=
 =?iso-8859-1?Q?RgxQg6FSN34DK1O1WB/2u7GXFgiFR3N06WPYJ9/420YTZ8IVCpdKNeYyiD?=
 =?iso-8859-1?Q?ELbTa7bsDVfpZq/Hy2o0qXXNUlyZvYCmDoGv108oDf5FMsqE6y4aph42BP?=
 =?iso-8859-1?Q?yCD9Ji0T6+lHEVA7YwiOVgxl8YS0tNUKIVCnFZS6DpkP4qDEvpyq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2590a778-69e6-4d0c-c9cb-08df339d0075
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 20:09:12.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7P05I8QNTbc2CO8pd0cb/62OPVkmCu65Pg5SqjtFseKJgnaq6/PUZ3WcePy+pFam6MTtJ97FDWv+xApW6FGa4niwhoMDE7FxHqfPGo9o4DDLDLXjmoROoK0ck8qatnb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11659

On Mon, Oct 26, 2026 at 06:44:28PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] arm64: dts: imx95-navq: usb2 dr_mode = host breaks usb-role-switch
> --
>
> commit 7aa413a1299c4bee8b5a2613c0acf6256cd30c16
> Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> arm64: dts: imx95-navq: add USB1/USB2 nodes
>
> This commit adds and enables the device tree nodes for the USB1 and USB2
> controllers and their Type-C port controllers on the imx95-navq board.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
> > index 7860c113e9e02..5fe245b623068 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95-navq.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
>
> [ ... ]
>
> > @@ -80,6 +82,72 @@ i2c3_gpio_expander_21: gpio-expander@21 {
>
> [ ... ]
>
> > +	ptn5110_usb2: tcpc@51 {
> > +		compatible = "nxp,ptn5110", "tcpci";
> > +		reg = <0x51>;
> > +		interrupt-parent = <&gpio4>;
> > +		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
> > +		pinctrl-0 = <&pinctrl_typec>;
> > +		pinctrl-names = "default";
> > +
> > +		/* no SINK circuit (EN_SINK1 tied to TP30) */
> > +		connector {
> > +			compatible = "usb-c-connector";
> > +			label = "USB2 2.0 Type C";
> > +			data-role = "dual";
> > +			power-role = "source";
> > +			self-powered;
> > +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> > +
> > +			port {
> > +				typec2_con_hs: endpoint {
> > +					remote-endpoint = <&usb2_data_hs>;
> > +				};
> > +			};
> > +		};
> > +	};
> >  };
>
> [ ... ]
>
> > @@ -198,6 +270,55 @@ pinctrl_usdhc2: usdhc2grp {
> >  	};
> >  };
> >
> > +&usb2 {
> > +	disable-over-current;
> > +	dr_mode = "host";
> > +	usb-role-switch;
> > +
> > +	status = "okay";
> > +
> > +	port {
> > +		usb2_data_hs: endpoint {
> > +			remote-endpoint = <&typec2_con_hs>;
> > +		};
> > +	};
> > +};
>
> [Severity: Medium]
> Should usb2 use dr_mode = "otg" here instead of "host" to match the
> usb-role-switch property and the connector's data-role = "dual" in
> ptn5110_usb2, or should ptn5110_usb2 use data-role = "host" without
> usb-role-switch on usb2?

if use type C port, suppose it should be dual role device.

Frank

>
> When dr_mode is set to "host", ci_hdrc_probe() in drivers/usb/chipidea/core.c
> skips initializing the gadget role and OTG handling:
>
> 	if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_PERIPHERAL) {
> 		ret = ci_hdrc_gadget_init(ci);
> 		...
> 	}
> 	...
> 	if (ci->is_otg && ci->roles[CI_ROLE_GADGET]) {
> 		ret = ci_hdrc_otg_init(ci);
> 		...
> 	}
>
> Because ci->roles[CI_ROLE_GADGET] remains NULL, ci_get_role() never enables
> OTGSC_IDIE:
>
> 	if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET]) {
> 		if (ci->is_otg) {
> 			role = ci_otg_role(ci);
> 			hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
> 		} else {
>
> As a result, id_extcon.enabled and vbus_extcon.enabled remain false. Although
> the Type-C port manager configures ptn5110_usb2 for dual-role data and accepts
> USB PD data role swaps, calls along usb_role_switch_set_role() ->
> ci_usb_role_switch_set() -> ci_irq() -> ci_irq_handler() will have OTGSC_IDIE
> and OTGSC_BSVIE masked out by hw_read_otgsc(), leaving role switching
> non-functional and the controller permanently in host mode.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261026182150.11330-1-laurentiumihalcea111@gmail.com?part=1
