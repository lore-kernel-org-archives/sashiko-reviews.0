Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011050.outbound.protection.outlook.com [52.101.65.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDA83B893B;
	Thu, 14 May 2026 05:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735258; cv=fail; b=QuOdi7KJsCQd0RTUyJdZE/UyBiUWJt8vuOdVzpssVfw79QV3xKInzKzhVtJojWqdZKzy9+aWavFn+kF5SUpLwj3IywmVafNklubOpK1Dr2pHAKGkzO95CZmDqcidh3UBA49Lp93V9Yaf5wwObgq42z8OTTFy8OU9m6aBveGKLkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735258; c=relaxed/simple;
	bh=0jFhEnp8ASEyBEsXX2LZ3o9gety326SYUDkwIlAt1ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HouPnwccE4F5fF/w49JvGUR9Tmh2VhMisa90YuZvOeQoj3DJ9tZ/IHNcN85juiTZL2FAzYr04yFVXeJqt/79nS4UieePBIorrcBLhFetKmviOgQYf0Oymmj1mD6XeF88ifDdIrgsCJ/TAHMFrLynRq8cklRbR8xAVjbeKQDgo8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oMIsvu6L reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oMIsvu6L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFQuM7U7FR2v4lltOznZGmvpj40qHMV4iRsOOkGTmpa4Gtt1wuFYYoNcuIigaScSjfAgFNR5Vwktor7JnnVSQAfSQVs7xHGe31NcnMjm39mdw9fyRvK5vPFNUY8jqvK/p/9mWVtL4dfRTa3hQ0YbVfS/gjIwysK9U9wpaLt0kfCHD+Jb1Z4xMqe/tXzccFyvY3CxUoEpy130oK10/3JoOxJsprzFC2kK1X5huj5J6zRUiX2fSOFGpi+gy+wFbXzW8ST5RcarSUFWgwGc6LOOHmefMuS1HF8ffyFl7mkl+9AZlMWdNpCyf6/p8v5ESf1VkwZ13h2bB67soHiUDg4Yvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOuveasz9DDqnel+NLkGLwgX1AN+cFpE3Qt0SJrVG2w=;
 b=P+WB+NTnGkgDyxe1SrlwqlFNclTB1PQtx/qTW0cNqrXq/9p1qkblpD5MRm+Gceg/hqGJafSueBN2twvgoGYO4f0TTTKcayFp/7It5WjNfyIoKxnjB2TAqMeNUZbo0o2ico2BrYde2iYLXawoQ6bcXh0+3d08pSBL2iv4R9KqGPZWO1uduf5FDSPK1VJqTsfcdDy0kjQU3fi997HDhxDIWG59cRLJs6yh0yjK98A0exux7ut9IWn9VcEPrT7Mun+yeCwAsorMOfp9lMkq5FcDsmuoKSobLJoIGBk2dvlnMMcFy8MT3fo34XV+7/LFwb6d+6+AYjPBR6TfPpVxFnMP0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOuveasz9DDqnel+NLkGLwgX1AN+cFpE3Qt0SJrVG2w=;
 b=oMIsvu6LAQJ/OIS6kw62st2rJcarmLBb+p9G86K3Zq7PoxZK5hIZKykEvHhjxGRtvy9bJWoXrk8NODDISht+lftXNVOpo7cXwNzLwkx768RrHrq1FcHJs9JXqry82v5Kvwr2TAtZTwDpU79JMyzFwht6GKzEokr6y5T0VM+4BLJrEpG9z8Z133QkX40awZP4Msy7iHbAH66AdoBmf72knK52xjJsvMTj9uegcP7Ubti79h9jIxgUvq4F7J8VY7Ta4R3V/54JjoxSYcXWAo8Bq96Cd0G2UdDYOTpK/rrN2N/1Y7ud9230tB004lcGLiPV0sBgjLIgWvYd6I/kf1kMQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by GV2PR04MB11836.eurprd04.prod.outlook.com (2603:10a6:150:2fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 05:07:30 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 05:07:29 +0000
Date: Thu, 14 May 2026 13:08:58 +0800
From: Liu Ying <victor.liu@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev,
	krzk+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl:
 Allow LVDS Display Bridge child node
Message-ID: <agVY6tynKIsaJ03D@raspi>
References: <20260513-imx93-ldb-v1-1-d11c5c3cc197@nxp.com>
 <20260514035156.A6874C2BCC7@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514035156.A6874C2BCC7@smtp.kernel.org>
X-ClientProxiedBy: MA5P287CA0328.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::15) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|GV2PR04MB11836:EE_
X-MS-Office365-Filtering-Correlation-Id: bfde819f-5aa1-49b8-1f5d-08deb176b2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|11063799003|3023799003|18002099003|56012099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	X0S2vljDXLwRNSw/UJBLoMBXlXXZerM4k0HJ06sHooZcTvDtGGY9VKLq8jwEQYlDTMsSikB3KGpZ0R6NqdCc81nH5g9JX/cNZrq735E1utki/PdjvnJf/WdShnnWFnkC6rmtvxXQDHVI9aIjmqo+3DvMFNkpHeJciOA2GUps1MkCaCbVvj1uD4yXuKTpcLg2ks2166IuXPHEa8uhiE+Kcy99+2xMXn4FQPxX3COS+2vSikXmpGd5V3wbbWVQkOS5vvE+BAMjR61IVifZKU5zCULFPLkOHSM3jbu5XIE9qgtqwhMAaZRw4oSzFLUVvcUDzplt388OCiZ2ZNH/KSOzloeh93LBneCqwd4z4wLl5RjnHdxGH5ldwgSE4rCKaZbe4xY8YIufNBsFzW5rrLmlbPaWzp+AM0bpnYd2GWVISkEe9lepeJL0hEUTa19ctQ1iOYrZN6L5BlKyPl/9X603biHSoJNG76nTNeqWNzU1r7YofDEWdZnGmOfHdkVVdtTgR88VS0IlbtZ/h0Z3VR8JxnTrmBp2Ex+MtgHQvROwfCZcpnRG0HdvCEVyvN6dsCgaA/8BppKTaGI7yCw5N/VLnhD3U9cPB9+8QSpwlsQ2lM+1E6KoPyyipEvAwsWv38OPRU/2Dk6OEFtSiTCmsLh81w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(11063799003)(3023799003)(18002099003)(56012099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?peQjghdm5NiMTlxDR9EGII5sU3YZNP4A2PPjPiSYOcHG9CyBWTaGLv5Nyi?=
 =?iso-8859-1?Q?fqQOLQ9qLm0RS2EYsLDFFTva257zRccHsX9FWT2BkjlU4JS/tAxuUQzNu+?=
 =?iso-8859-1?Q?UjryF9M8yUUmvBQe6XElHb6O/fC7miloC9rsjqlnanCZN2zcROIQQrHesn?=
 =?iso-8859-1?Q?irvgsLJ0+9xGaFPENg6jY1t3zXWcCiOdhCjBrAshmyiBx29NPj7+Gr1yvk?=
 =?iso-8859-1?Q?sKZYoGFskMwPF6KEfodlewqfpSN4AN9qIVHOyq3CEXs2Sqe37401QtVb8x?=
 =?iso-8859-1?Q?rT3IhM/epJZTdgbwKCxM8hmyxJmgTVQpy0kb79vQTOpOYHHlO9A6AWMnfy?=
 =?iso-8859-1?Q?bY+pNXFjZwLNCpxEt7yQ5N4dMkdG2tTI2ou5LwsJJ9vVNrUIFj5bniiq3j?=
 =?iso-8859-1?Q?61WSKTnCEODyxZ3ZJRW0OqNoT3zOVV6BxxN2gPhuqSHom+4pKFxZ2g+J/r?=
 =?iso-8859-1?Q?HfdHsg0s80eQpUhCqjINK+1zG//n5laHyHls92CzpFuhClWa1HAU5tk30h?=
 =?iso-8859-1?Q?1EUPPDNv84qqyl8x5T5Y2rrG69kQDlRdeyQVMLhRXYDv3i7Xu5nuwH4QkI?=
 =?iso-8859-1?Q?mwM2Sde5aJhIk1qWEnRv7CYOscpMZWFPhkJ2oAAfZESSuDGDCEJ96OI7LX?=
 =?iso-8859-1?Q?6B134CHLjxzbw76tx0M6eFve6sYbUbCpkNDlso9HNuz2GBDYMs4/DtVtmU?=
 =?iso-8859-1?Q?GWi+H1kC8ztkVdTGCtYa6UKJldA6/7BFx/dUR/ujTVgVf7XZu2COvnNcX4?=
 =?iso-8859-1?Q?beDS0IGq7plHM3X18l0rZJ41BF3Qqww3B8mDm+prfTKVTuKlaW7Wi/DuoU?=
 =?iso-8859-1?Q?8XjJCsrPv2Esq7EK+q6ZyhFJxcFMAGMxlTkZxh5cUjyHR1eK0kFURbcFjQ?=
 =?iso-8859-1?Q?ZyBBvUdMKp4z5zl4F2USLptejuFVJ3AOVMHzInCDB5xMEvgp09LmYnoY0i?=
 =?iso-8859-1?Q?KzpGPr9T5H7iwda+iIsky/fuBP6VwfDrAc7esMDhuJYvpkXg9iKiGlk53w?=
 =?iso-8859-1?Q?0uR2cmSS4+X3DPIP/OMDYJI7z8I+yySxkF24alb7qEKV9urB9EyG318CwL?=
 =?iso-8859-1?Q?VPnO0VVM8IcSHurDhvghma4d8so7unf5gAgZKJmwdiaPDnnZ21/rEcLebs?=
 =?iso-8859-1?Q?qyNsBplrfE/JYTfxJpnYxuBtaWUXHK/+ZKfsyOfj2B1H7l3WKMctqrD0gf?=
 =?iso-8859-1?Q?VZbTMSGhajNUccS5tvXDw9oNIRN/JfAZk8PhEQqmlaxjPWw2ggEMHp7rbz?=
 =?iso-8859-1?Q?YC1eCHNQFLqnFQQP4EmwtTLRpPWUd8lBsOUtUNs957GQ4cU0qkxhZDe3kZ?=
 =?iso-8859-1?Q?SrlARazDwGK3plQw/IJUdcznXYYjpheyfLe35XvXj9fRL05QzbU4v8HkzK?=
 =?iso-8859-1?Q?oomWoA7yDz1jhBDAZTldB4mHoEtKmM6bxvgYfXybds7SLjU7fbesKfpRQW?=
 =?iso-8859-1?Q?MlzvqpvmMkmUm1PRmjnONg+MpN/w6xYNflRICfqAeGHDVPrilbO/uqWRNr?=
 =?iso-8859-1?Q?dyMfGlBYQZUwtye4IQpmLWbsUwQCDJ5WESfjarkfvVXmGJWoe/zOJyOxk3?=
 =?iso-8859-1?Q?+0gkPZ4FrOoEEIseun67CZ9Q7mmo1wsAvmHpfV3C3QbmTwb5AQSoYYaL/b?=
 =?iso-8859-1?Q?xHhKO30I8lDY2GZ9bmdWSSkCmvs/nOfdviFbsRvJsz8QgevyDNtBMM9zMl?=
 =?iso-8859-1?Q?n04RWxkSwUyhLkza70lfkOAWKNgQaDCuId3XNwBQ5+f5lVGNLTpqZnWbWm?=
 =?iso-8859-1?Q?4uecdpGElhYUvYrm0XPD9o/cjJteGTqsn+KzSthnmpl9ols9jvqAAY/Ier?=
 =?iso-8859-1?Q?RhhSg+DlaA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfde819f-5aa1-49b8-1f5d-08deb176b2ba
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 05:07:29.8057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/fLjkjPxu6c8t3RK0hblSh3wBW0atmh1n+DxknUlwQpcB+NWPSaURb5eyI571cPk/OfCMJID6cGsvgxv6NPUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11836

On Thu, May 14, 2026 at 03:51:55AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `bridge@20` child node is allowed unconditionally for all hardware variants in the binding, even though the i.MX91 hardware lacks an LVDS Display Bridge (LDB).
> --
> 
> commit 1215972eab31b33c83565fc6226eed3ff41fba34
> Author: Liu Ying <victor.liu@nxp.com>
> 
> dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl: Allow LVDS Display Bridge child node
> 
> This commit allows the LVDS Display Bridge child node in the i.MX93 media
> blk-ctrl binding and adds it to the example. The LDB_CTRL and LVDS registers
> control video output through the LVDS interface.
> 
> > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > index d828c2e82965c..ab563b457e07a 100644
> > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> 
> [ ... ]
> 
> > @@ -92,6 +98,11 @@ properties:
> >        - compatible
> >        - ports
> >  
> > +  bridge@20:
> > +    type: object
> > +    $ref: /schemas/display/bridge/fsl,ldb.yaml#
> > +    unevaluatedProperties: false
> > +
> >  allOf:
> >    - if:
> >        properties:
> 
> Since this binding is shared between fsl,imx91-media-blk-ctrl and
> fsl,imx93-media-blk-ctrl, does adding bridge@20 to the top-level properties
> unconditionally allow it for both variants?
> 
> If the i.MX91 hardware lacks the LVDS Display Bridge, should this child node
> be explicitly disallowed by adding bridge@20: false to the allOf conditional
> block for the i.MX91 compatible string?

Yes, this should be disallowed for i.MX91.

> 
> Without this restriction, device trees incorrectly instantiating the LDB on
> i.MX91 hardware might silently pass schema validation.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260513-imx93-ldb-v1-0-d11c5c3cc197@nxp.com?part=1

-- 
Regards,
Liu Ying
