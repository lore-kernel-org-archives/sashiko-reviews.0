Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.66.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795450553;
	b=AzyaFb4EOf7u+0lE4IBv2h9G1hFA38c11bcArwNhsE16iqgICV/8riN/e8bz61tDM9/6
	 r0GTGEMVaR13eQocYjvg4s7OaRRivxWtJQ5QMJeyuYlAVTF/gCNMFAtTtoOtueG7r1cy/
	 GmuHK3z0GSFhiM1XmsK2DhIjFFKutsR4uqCbNWzV3HLmB9q821vx+eFE9k2Djs/5pVMX1
	 2GpfnzUW8eIEn4BRBpJEzG48qm3m738Ffsn4oT1gZ8uHuzflWccCt+RH4h+vKDz4dEsEs
	 wbQTngeHoxAy75QfddUP1iXjRpK6L7KRc4RA14p1LhtmrK+tXu9Cvc85I/n4+/AFW9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450553;
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
	bh=Di0ZUWdTm4WyU8WUrOU/nKA5izKxnJX+0wz0RZFcGig=;
	b=sGUEvGj5/oEmKL0IdwtLSGpoJ0mrx51XD9JHq70qGbKsDVJQCfbE17PM09dpa43A0c15
	 Gj8odMuwh6rxdpLosN5+pVb3/3mdIupbbf8Z2tp7Oqrr8fADyGM6cQTvh6MEob9zMEwEV
	 /BCpFSSusIQZzjBq3UvI2rLg3W37m3crSV3npIge43dR99KxKMQA9WkglV5H710jC+pqV
	 psGwayaUzJ7VQ0THjqL6L5mExddvS3VAG+42fTUTWKyXdGkyzh7eESvmM6+RseMUOF/Vt
	 jbimm1GofOfV+nZ/VxnoeEQIRKPF6lYLsfq14VPKGKE5X/Sjp+zXi3c8HiC53QyariA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gS+xW9Iy;
	arc=fail smtp.remote-ip=52.101.66.10
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0726606A321;
	Mon, 23 Nov 2026 16:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0726606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gS+xW9Iy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6niRYKVdHZhuUlILUsqkQkp4/4e6tBWdGGfOyapQ9g8Am26Ps6xQV4O2VhMIlnaKiunW3QeBzGLA5tLzibXhXm+wpi/B53deZftKUek7jAn+c2Dwu6HMZ36oALhLihiEoaKtABN1NgHOEyMUgYpQ/YhOJx9nXWIJvKWcIois1kVsZB0Q9zHSiQJYMWx8hOMXYIJzuV+GafVrpQzYWeMPSh4J5mqFDNXzNx/VLSpxMdDOfPYmzzXDTFLbyLrF55+ExJ5HfdOZaZo/7NOHP6jzYDpJScn7fmQy91zlBammWCGo4YLZyty1if+4wi5nJj+RGkezXf7EqzoUKFH+sDs7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSfiXA0+vJz4XuZbXnQ3aNLS4xdz/xC4y3anU2N0Vco=;
 b=MRlXqGdnsfz/VMBmwcCrv5Ai3QJ0iu50iLAfjM2aU8CrDW4/IIYV1yJzPRtNWOhrtUXDWm3kf6yswYf9u9tmWELZIL56C9Hs0pkcc2fLr0V7nwzF9loNpRjcJD9xHQ8cDe2PhhFp7JCiPHZ3QMLJ15x+8VmWkj0kA6zQTrXwGIIzxHdu0c5C7wUb2UA9vD/E5l1DeBh9G24kqgD2ReEM/jsgRouP/iCtc0PyNn9vtRDYh4rnIB7MBQKdmAJseV5TQV2hu+m6VCGRXV62UUcfI9B8i+MROojBba8MO8wF2B3YDedBYGNy8QICQeHMZn5knaPmJo7ItRA7emh1Ne55tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSfiXA0+vJz4XuZbXnQ3aNLS4xdz/xC4y3anU2N0Vco=;
 b=gS+xW9IyDVSntGy6KdTmPc0yiVkgJShFCIEdDaUmbchFz0tuqn81JqsorK8aX4HH5HwjLZ6DTUkWeL7MRhwTTN6pvO5az+kr290CA7qcurO8AubLp7+WJrx1NZ+5mTVcm3ScogrG402AVCUoeEjVuzu1d61Lqj9uw0XOeeqWhprwWbEDfln3l3PtgMMV00OufGUX4q841FyDZfXR97fxbF/dCTNIiZxzAXvi95J5mzY4uNUrnFkOHu47paCtEKMTiJ8vEOdyVQtKyaXIr7IK9QbO1YZtzdulGSfHp4ajI/tiw1ru6CEDHfCulUba/Jzuelhhy5r+vnfjYHilCFJubA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8841.eurprd04.prod.outlook.com (2603:10a6:20b:408::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 16:15:49 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 16:15:49 +0000
Date: Mon, 23 Nov 2026 10:15:40 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Freimut Diener <f.diener@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Describe PCAL6524 supply
Message-ID: <awRmrCk8tOd_F8MG@SMW015318>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
 <20261123-imx93-frdm-fixes-v2-2-dd97c7fca4b1@pengutronix.de>
 <sashiko-outbox-229145@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-229145@kernel.org>
X-ClientProxiedBy: PH8PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:510:23c::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9f4990-5f25-4034-de42-08df497d0977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|366016|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261022113327099003|261022075727099003|11063799006|261021123027099003|4143699003|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TMKB8bikmPS02znd59RnDwfNjJiotz/U8XbvTfZWViBbte9izY5wnaeMx4N3uIyBmo/h5h/or3TK5KRL2/rkLTKDv4T1Yb5r7EBvl6FAFYV6Yg2wGYb2dEFZDPYaEM98DYkuZRSeadNZmiXB6QqIfzR8AU82O1vu6aNp/B8s0M5DsELxkk+VVR91rBkQMFuErrFvo0QZxGFDVXWRCJSVfk/oxX4EmqFRhIC/bhJtPPxIykPjNbZ2KgddsgYJiheDnP1MMzfznt89kLLHpy5Rm48WhDLnIhz4wsJepFzdx456du1qTibN2WhJpa+BrACqYESoPUIb0AMiuFO0/ijAADDaL21PDeRy0ykDBXX+au0GN8T/E2ewuz2ksVojgbVxDVe+kDLPUHPoHhAdMvjFW45DBcKP+sDIljL4STsMx2s/UElJaOkN6z6ygBaCnRizGd1Czy7EZATaGqAAE4/jKVUL0Vmr5jtsnjleO2Ddw//3TxEUIeBzR8JWmwRct7YaK4jennxK+uzJccNQaB19wXpjAcgOP4KBrgWXcubEPNIhGaAbHkKZOhRCwo8rVZC8JX8nxz2RRFwgy3dyaH5wSb5nY8o64BDbf/ipWGHPwIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(366016)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022113327099003)(261022075727099003)(11063799006)(261021123027099003)(4143699003)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?L3tyWiciV0KLA56Fb0YTYm5StUjvIikEIVvOO+ND6FkMJRoEFFUESptKI5?=
 =?iso-8859-1?Q?W6yzhhOBZtFn4LvmGm1jO0sKBcP6MdwUBgi3auCs/mQyf55iaHIN1VLshF?=
 =?iso-8859-1?Q?8Ogod6xJzlwXa5SzvJ8N4o8BSQsbJtr/plM2CZAw2Pe5JpbTQjSqLLmu+g?=
 =?iso-8859-1?Q?6OuRglCl5lkwONrdFoLpAPs08P9zDnThS7VXCX9rlAtTDtSWZcVyH311+r?=
 =?iso-8859-1?Q?SDMloEWzMi+LsinUBZlb1rd5Ie2DWNdZ6Cn0DJYdZcV0xdG+QakXMDFZIh?=
 =?iso-8859-1?Q?7+YhuMhzkeFrBnZIvZS6FJIqlFWcqM9HhxI+AtNtT3YlJgT00ViPKMFUCL?=
 =?iso-8859-1?Q?Q+SVKFEAL/zbD/ST4PlKOqw4YVuGAQyLtmwGWnAQ4mwFqUWalY90NuERHl?=
 =?iso-8859-1?Q?fUFp4NZ0m73p+G/wT/PaNw9jkAkDFz4CqtbTQ+jWUgsc5ORFPqQzaO2scD?=
 =?iso-8859-1?Q?pMWAWxR/YP9u1QQw6kaJMlZMPd1DLLvvEvGOnzLnp37yLWjKWSgMt5WnFz?=
 =?iso-8859-1?Q?s26Cz9JaaoD/7I/F3YnTB2xkmBOisEmWa4y8gDgtQRBb/A9XkAAwrspe/f?=
 =?iso-8859-1?Q?Mq+227wxrWsvDJegkDh6W/lI9FJflcd6OHlYyW1TUzSUPrZaXRmFPXJf/Q?=
 =?iso-8859-1?Q?GrWfEVZ9czAN42n5sWlwjcOfISpJfIFdj3visuxJqiQWS5xzCIZ49/weed?=
 =?iso-8859-1?Q?H7rRG/ze+qB0iRZP6g3vaSyn271Az7wXWU5BLijexy7atC9V/6sWigmvRm?=
 =?iso-8859-1?Q?811KqUIuHpRLK6MLyI1V15TRPNnJLdFoHMTl1g9Vj2ZtCIE2S8k6EEU5lv?=
 =?iso-8859-1?Q?6Ci2Qc8wg8LCKnEBhZpLfg0+s14+xeSjuXxXImZA1rB+H+2j8tFlEJmAci?=
 =?iso-8859-1?Q?gQ+Nca5ZS8YghPM8iJn0yguFmu9+YiGOHmGwVfH3Gcb7OfpD4zO9cTkFpe?=
 =?iso-8859-1?Q?IwiSXJCl362EmU1+9zWZy0r+KtStwiseU0VApP4vo1yoVd3dwR5zoFhvaz?=
 =?iso-8859-1?Q?fmtWTOZGmCYHaoROCrqo7377asVFRHgNmvWPFKjkGCmx63HBk6NpEPW97P?=
 =?iso-8859-1?Q?/YUjY9pKk3s2WIBRz3HVYleCNXmFZsOBjiJSrrQxTTdIdnSs6H10tvI3ft?=
 =?iso-8859-1?Q?/tQQwBB4jZHawUaEX9+GJUtu5Xd7tclBEDGAZb4+k/CIIO2HvJ1A9rPrG/?=
 =?iso-8859-1?Q?3K6xOWAW2AhyhIeQqiZA6iqwC/GhVIVj33zw8tnhry406lUJRQCKw96/ua?=
 =?iso-8859-1?Q?BTerdFKsb8ffKmfFX9XkUFerMF048AuM+c4/B474FAagrn3gf8RKzXxOHc?=
 =?iso-8859-1?Q?g4qDHjWREP0nANxNpv1Rc2sRG6MXnnjsIcRGiPCsgSLOCkFgS5S+pQAK52?=
 =?iso-8859-1?Q?7xHfXRq4f7FP3weYvNs0q74LBrzpOAHm+2s7k357YHe6Lgjihi2ETRgmBg?=
 =?iso-8859-1?Q?5W/BefP8yahlJoFyZBLrgR4WxXTv9yYekS53TaEZypMvyZ4UIXRURsU8gL?=
 =?iso-8859-1?Q?3axh6PU2z5vyUAC7LTA9pq2otlued6ug6t3kKs6KpdLsfllryxDov3bhSi?=
 =?iso-8859-1?Q?9p5P270DX9DH4Bh4JBLHy2cIXvDVMpPFbQlwmcwFhI4EHPDUvLbaVntsJd?=
 =?iso-8859-1?Q?gcyn2NQKoiy+Maem+aoW84H2cu+tA4uaH+dkMjPpt8dXb+BZavohlYmYIy?=
 =?iso-8859-1?Q?+5yFUxJLdxvWTl0DveZa1khvm7PcCddvBTSIeY6ehRuoF77NEOCjnTfVnh?=
 =?iso-8859-1?Q?TboOHhewPfQegQLacjiSC3Wr/1QxpYWjoz7LvlbHpMD2Hxfo7Pw1hgQhIj?=
 =?iso-8859-1?Q?y+MPUOlXc97uNrMgzYRD+lY/kE53aS6eYmcvs9ByUnaAM489CVGB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9f4990-5f25-4034-de42-08df497d0977
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 16:15:49.0464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ib0XTlpJU88D0nJSn3or1uFpTT8A8Ab32bysDOZqZfYcG1QC4tBRwzWHCo568lG5qDm7wui3BSEq5JoAbB2ggDwRECE2FCeLNPhb4h1eCnjmHTUUS236ZTBkyJOCUgrg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8841

On Mon, Nov 23, 2026 at 11:31:56AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: dts: imx93-11x11-frdm-common: fake fixed regulator for
>   pcal6524 vcc-supply
> --
>
> commit e42789fdf3e25ebbcd3c5baf782ad166ded4e5f4
> Author: Freimut Diener <f.diener@pengutronix.de>
>
> arm64: dts: freescale: imx93-11x11-frdm-common: Describe PCAL6524 supply
>
> This commit adds a fixed 3.3 V regulator node as a proxy for PMIC BUCK4
> and wires it to the PCAL6524 GPIO expander's vcc-supply to avoid a circular
> probe dependency between the PMIC and its interrupt parent.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> > index b3dfe516b1d55..e81b2342c50dc 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> > @@ -49,6 +49,19 @@ button-k3 {
> >  		};
> >  	};
> >
> > +	/*
> > +	 * PCAL6524 is powered by PMIC BUCK4, but the PMIC uses PCAL6524
> > +	 * as its interrupt controller. Model the supply with a fixed
> > +	 * regulator to avoid a circular device dependency.
> > +	 */
> > +	reg_pcal6524_vcc: regulator-pcal6524-vcc {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VDD_3V3_PCAL6524";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-always-on;
> > +	};
> > +
> >  	reg_usdhc2_vmmc: regulator-usdhc2 {
> >  		compatible = "regulator-fixed";
> >  		off-on-delay-us = <12000>;
> > @@ -207,8 +220,7 @@ pcal6524: gpio@22 {
> >  		gpio-controller;
> >  		pinctrl-0 = <&pinctrl_pcal6524>;
> >  		pinctrl-names = "default";
> > -		/* does not boot with supplier set, because it is the bucks interrupt parent */
> > -		/* vcc-supply = <&buck4>; */
> > +		vcc-supply = <&reg_pcal6524_vcc>;
> >  	};
>
> [Severity: Medium]
> Should reg_pcal6524_vcc be added to the Devicetree when no separate
> fixed regulator exists on the board?
>
> Devicetree describes the physical hardware topology rather than encoding
> workarounds for Linux driver probe ordering or dummy-regulator log
> messages.  Modeling BUCK4 as a standalone always-on regulator-fixed node
> misrepresents the board's power tree in the DT ABI and instantiates a
> redundant platform device duplicating the regulator core's dummy
> regulator.
>
> In Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml, vcc-supply
> is optional, and other i.MX91/i.MX93 boards with the same PCA9451A and
> PCAL6524 topology (such as imx93-11x11-evk-common.dtsi and
> imx91-11x11-frdm.dts) omit vcc-supply on pcal6524 until the cyclic
> dependency between PMIC IRQ resolution and expander supply lookup is
> handled in the kernel drivers.

Look like you just need remove vcc-supply property.

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de?part=2
>
