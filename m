Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.84.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794430816;
	b=KjZUFpNouv+y56GFKcb8Lm+QtzT55jgXafL8XF5YX28zkLaOABVxStSNLVpNfA+cL/4/
	 gb/8JMB6vhaIIOTkTlaTB886dckQqujH0Ahdw+faLQnqWUSO5+p+BbOM4/fv0AG0XJor8
	 Wkshr6Bw8G+cRebtDKxWvEp/wLo8eUlP2mwCgUzNPDVvZIji/15vFXKS+KsSoAVWuFdju
	 MMpoN+ff48wlW89dHAn1AzHX2qwqSq8VG7xO02CTsZJk2Zpf6SX6lAYwa+USPEIT0dTdU
	 emLs8lP+ITi/Q2JpGAEeuUJNG+2EwGLduxWoiMh6f8qo2mSukFC29Q1ZZFK4X7IFWkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430816;
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
	bh=27mlUSvT+QjpiH4Uvpt2/jMMejZOFb0tB/tiL0cfYxE=;
	b=R84ycTpLE7YSRA6DvegQNBs4L4V6dCzm0CxHOKadav/iUeYe6m3B5Oq377aezByI0xsE
	 FmOs2v58hbJn4K+EMSThSukBLLhyWSd+uCnpSFmS8j3PDLMSDE/6CeqgSpWK78m0cuzZW
	 o2ruwc/6tVKWE8YglimUERWf1myNDTpvQWyqFt0KD2ShX7glbAWh/lGHIsob3DjpGEL+h
	 4rZHF9t2ujBpX5p55MKZBBiQifP8rnrD3LMD4N0PnynfLSvhbXmB6dEKgzJjse22WJz/P
	 tDaFp6poM+dC+o3UoSzkDYjqlDj68rKPKNrZ6wg82bQy+GSdnyAtYGlH0IpXyEOYZCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FgRcRiT9;
	arc=fail smtp.remote-ip=52.101.84.33
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97161606A321;
	Wed, 11 Nov 2026 21:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97161606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FgRcRiT9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCyL9rXSVkhTXhlHh9+77MxKS6PvJe2K5A6Ubiy2jkqMC8HJOaFvxtJJYnRBnI8LZ2GpU4Bgtc0V6OAQPcbp9/mPb8huztwdScXveDSxEt6P0T+KL4h2+MJdVLNoPtYoC6L3gmVSreemxrEjsz3oIs3NJocj+CAvW6NZv+6hMOaGQXWJlaTl/5Zzg+W5G1CKhtm3xXx0JGuXO1dwMaD5AvHA9WtYgqj+58bJi/cKNqKp7GwnQpvt+yzIDsg28GqhdgQqv04Cx68dqECEK8VtyI3KbGO8DMNRb5UDbUWVlFRV3/6DIufleyMqTr0yAKfO+BP9N/HT4JFXFBFJALlOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQr71hIPv7FE+tW7ImxldACbZfEONMNu/T8reYdiJFQ=;
 b=qd+YqksxDU4X0EjdKwyKlBulT7SnYWt68s0DjIGZ1QaQ02Jr6hd6GDyqgPt26JqgWKaM8wgEiv+2l2ZfuRGrPnV5c1v0wHEtsxW7s6WV2zLmn7cwXGuJD3dR7fHe0yL8A2nxJiYRHjysnEyd0nFJ34zc9+yBbjAS6PjFTPe+51NwmtoP5GR231bLQch0mGn6WRWsIy0GeoovrxAXQUScFgj2FLqlDllmYveK9WDJsVAyOtoC6F1OPURJqHFSGWaNVCXuLbjfm9qZqaORPbtG5pOrG9m88WUJF6UOtyUlgLQdShQ5+WH8NP549MTNyEZ0rgXj6iu17bNqKkuNT6z/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQr71hIPv7FE+tW7ImxldACbZfEONMNu/T8reYdiJFQ=;
 b=FgRcRiT9UM+pmFXho/YLRmEKhjffo7miALbk2q7OnW8L34xQNx3BIMTS5FkVu1Bj8CP67FD9z8Nq0cd81cUq1nphAOfEUrikq68DsHdzM+DqIGbD7WCh0gSbuvp21Nb5UFSIIObhY1hMc3M9GPwkxxEYxCwCEe1CaSBDW/oRSjdy0ynz4SZKy2tCBxPuxBdTCCn+iBfwKClNgAxVhLnJOXm5D2T3vJj8YTIW1P/AtDYr3KtaXqrdB7Ipa42RMngu61OiODSkUNRQYNffiW3BnlaJMnOO7m9my+8bpYEyi3qQqPqvrAZ/mM4Pk+G6kbutJNluNm4HxWKINSLTjEt6VQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB7090.eurprd04.prod.outlook.com (2603:10a6:208:19e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 21:00:13 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 21:00:12 +0000
Date: Wed, 11 Nov 2026 16:00:06 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: imx93-var-dart-sonata: enable UART
 wakeup
Message-ID: <avTXVpCGD4nNsHwB@lizhi-Precision-Tower-5810>
References: <cover.1793645417.git.stefano.r@variscite.com>
 <b51bef917d08b83bd231a4a228fb2d23c19a858b.1793645417.git.stefano.r@variscite.com>
 <sashiko-outbox-193978@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-193978@kernel.org>
X-ClientProxiedBy: DS7PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: a557bd1a-6fa2-4e42-1284-08df4036c77a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|11063799006|260925021311599003|10067099003|260925022911599003|4143699003|5023799004|56012099006|260925021911599003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261102123227099003|261009221227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	IAQGQN5fhxqxndaqhPzU6YUpX7Tt3M4mMQFLumtzwphpXtggKwWKlb7RTzhd3YsKLmDleXx8kCMzq2M8pE7lxWLNp8Ztp/a6c6zhJgOGGg3mg5UBAow5Qg5KujsnByNfbWEYHZ7suGDJz2uW1Y0gyhve/J5aLMc1jIefllV4Dwzct2D+qelBTwbla8v9jF2ySoPS/l8Eh0SRgS0MpKU5ZSnEJsCNwdc2cZC/fMJgQRQuAlUkon6Kx0SWSNsTlIMBsjb2V+jQE1bxZzNx8FYR7lniH7Auwy/rLmfheZUksDYVriBKtqCz+8miXFyqytE5Ry4YBUnb+ux+Co+s6QtQ/DhABDHAATyQ0py1gMEGW69KkJ1+kyeIs4yoySlLSxnGZHXSVOwYHy7C4i2XIKrQwABYqr/Zzr8I6PfFJTzWKR5e2IC8nwWRO9xW+LcwZP728qIhV7sEUzPFAMjRI4SMhjYoiMbUYpxg0d7uAV7SPZT9VpYSG6F+5HHEEYWO59nyEXaeFZjCCaxPmkaTWYaz8sryS3VxjjKzK2eEIKPTWffN04ahy73XhADeX18GOBJAZz2F6k4F6ceCidLHpb7cu7tBmqHAa9/2hr5MmUxmUt8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(11063799006)(260925021311599003)(10067099003)(260925022911599003)(4143699003)(5023799004)(56012099006)(260925021911599003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009221227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?CvUdIqqhD67tb2FExZ5uJzfaQzKlZQRKhNtP3srdifYkuVyjU23/vE0od4?=
 =?iso-8859-1?Q?RZORPKr6+exUEwCy5qplNbDsZM9zb4uf5LYgTlxaIPtxaB1rFttiPArQLP?=
 =?iso-8859-1?Q?dA3LRKMyf8dqhVPAwq+9v2fmCHvrKOCEV7MUYKrDybqnaaz0E7PshUJMl7?=
 =?iso-8859-1?Q?iyM+3FuYwskJ33MfrARjv2q+m9RSldPHXM8NJgB8OEwkEBMe0TvWjypgWl?=
 =?iso-8859-1?Q?oFlx5vcjBrD9Hgp3BJT6OeZ4yyJBbX4C36ULbZ+fY6s2gAGiEyChpCWALm?=
 =?iso-8859-1?Q?bDKnb4abPGV1xdDMefbSpak4qc2m1775hCMJ//EOCGMvxBIGFp3nV5qlAA?=
 =?iso-8859-1?Q?52Yg7AgjZ/cCzUGMXVxtJuzSy0Wgl0vm4pNuYiGbndLn2xfU0wtvRGVX6b?=
 =?iso-8859-1?Q?nTGcupHWR0OsQ86p0FmhQ63T3guq5c7S1bfSQ5VRI+LlBhyMxej21ucTLx?=
 =?iso-8859-1?Q?sa7dUsB+wb/uqGCRg1iMXdfWZ6NrFTKDLkBxzkDMBGrQJM5izzj3nhqVCk?=
 =?iso-8859-1?Q?OBBu6CXfQThTedECiH4hYaFtOXfaWDLuWtBlhBkdm0ycsQBZDMS0ZzJct4?=
 =?iso-8859-1?Q?TECQOVXWO48m81Znr7dUN0v/xZtq/Nm1QphrZifjovglbnDy2ZsnI6b2wE?=
 =?iso-8859-1?Q?6fmEf80yXJy+684cTCD3d9ENmNyMLKjkA8+QrIOIV5qMuQWhksU6O2zRw0?=
 =?iso-8859-1?Q?os1Idil2caVhyPOIkxcxTXZVR+/4M9Ic0FdYaRx4F4on8R67kbCdDUFMiB?=
 =?iso-8859-1?Q?W16IwLAHdlAH8vykY/Ed/nZTnKRB0HtJVJUwFCzqQhADtccVOaoiy4KqTl?=
 =?iso-8859-1?Q?zEQ3vBL8JH4Ykbi503WLG/9oDvBGQ9L9qV+Lu0uks5qy6bZN7h9cFkwY51?=
 =?iso-8859-1?Q?5XzxGcFU2VsEWiKO3aKovfInfSC2768cNVRCHA99IHwE63EPB3HhYhy3xQ?=
 =?iso-8859-1?Q?HNuyxtYJXr/rJNmsiRA9Y70A8X6Jh9NHN+j0zDBpwIFx1v8zNIKzWYsRsi?=
 =?iso-8859-1?Q?YFYghV32RTJlg/NBPfy0dmb9Nu7KQ0Vmi/4/Qxd4fSKCgfBB0uaB3nFyxq?=
 =?iso-8859-1?Q?3kkIzalcBvKYUyCGbOOj/NQtM/oIuCf6r9cZq2iON9lP7GcZZKokIRM3FH?=
 =?iso-8859-1?Q?Z6Ff1RAV8jCvVGMgoGdOx5QHz3XtRqyCrqUnEF5J/N1tVkkQp05IqLdJLM?=
 =?iso-8859-1?Q?04CnSdNFlIK3YeR74zxocnBN4fSpsHPeQn38MN2tLwNqrz9cGlxaw1CyK7?=
 =?iso-8859-1?Q?3Igud5UsBVChry2aA9WxmlMTxFEFopQ4QYqHjJ3DgfM76rcGnWdKz2enEJ?=
 =?iso-8859-1?Q?eL4GBAH2XIyDOtPqwv17pBe6Eb7KJWpSZj2R8qB4hai+OrKqGDMSuag5EI?=
 =?iso-8859-1?Q?vmcrBHlLJ9o5de1bRiKepQbAJnQPfezZwCLgFSkePHPIHXU38pe13pKJUK?=
 =?iso-8859-1?Q?6VsrUHMcGnu/qQKzrMVGXKBKg4rf8knj3Oz3j92g92RbY6R7YfduR0cS0v?=
 =?iso-8859-1?Q?jK/hJU6Pg3U4ka29qHbnVWWL8eo99GKFPJNsK4N73Xw5MkUu70PpGLK4dp?=
 =?iso-8859-1?Q?qG+H3sjwwEVqP5YiZoRwsXXzKFTigwdW2stHs0yp95fUEvbBu2fEfVe3pj?=
 =?iso-8859-1?Q?ttnmLR+K+LtQUZqhzAV7D+3nUULWlWchjiczjgeFI2lbK+Ijis9KDHzRMR?=
 =?iso-8859-1?Q?0Hd4fgvPI7jl9y6xx5YkCU4VWf2xSGFYotDmB/mAtYzDfhqFUMdYufWTHR?=
 =?iso-8859-1?Q?7S56O6Uvdar7Vkm5Q8yJBVr7P+LPMxjBqz/tLXJZx7T/qMUWDKWqcha+E0?=
 =?iso-8859-1?Q?WsUl5JDyaNHlppmmVJNUQCx8zd0hJygMGZGlyutm1S3LCc1sCjC1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a557bd1a-6fa2-4e42-1284-08df4036c77a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 21:00:12.9612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tlcoC4Zmiq/48ilGOWuvhHZ8XnjDMgEAeMPOAimJeAbHfvGQ0iOSDCIop8yc0DOwyeKziElpINXQixJt30AWksZctppG6mpeskar/Qc59PUBeUueJohgii/lzcKDt8h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7090

On Mon, Nov 02, 2026 at 07:03:54PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] arm64: dts: imx93-var-dart-sonata: invalid wakeup-source on lpuart1
> --
>
> commit 65667fa7cde1bed5fd9129933907d0e5e0428a2f
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> arm64: dts: imx93-var-dart-sonata: enable UART wakeup
>
> This commit adds the wakeup-source property to the lpuart1 node in
> imx93-var-dart-sonata.dts to allow the serial console to wake the system from
> suspend.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
> > index 1ca3ec8330d07..d368a09dc9167 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
> > @@ -385,6 +385,7 @@ can0: can@0 {
> >  &lpuart1 {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_uart1>;
> > +	wakeup-source;
>
> [Severity: Medium]
> Does adding wakeup-source to &lpuart1 pass dtbs_check or take effect at
> runtime?
>
> The lpuart1 node in arch/arm64/boot/dts/freescale/imx91_93_common.dtsi uses
> the "fsl,imx93-lpuart", "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart"
> compatibles, which are matched by
> Documentation/devicetree/bindings/serial/fsl-lpuart.yaml:
>
>   required:
>     - compatible
>     - reg
>     - interrupts
>     - clocks
>     - clock-names
>
>   unevaluatedProperties: false
>
> Neither fsl-lpuart.yaml nor the schemas it references (serial.yaml and
> rs485.yaml) define wakeup-source, so this causes an unevaluated property
> validation failure on serial@44380000.

Please check this, look like correct.

Frank

>
> In addition, neither lpuart_probe() in drivers/tty/serial/fsl_lpuart.c nor
> serial_core_add_one_port() in drivers/tty/serial/serial_core.c reads
> wakeup-source from the controller device node. Instead,
> serial_core_add_one_port() unconditionally marks the child tty device as
> wakeup-capable:
>
>   tty_dev = tty_port_register_device_attr_serdev(port, drv->tty_driver,
>                   uport->line, uport->dev, &uport->port_dev->dev, port,
>                   uport->tty_groups);
>   if (!IS_ERR(tty_dev)) {
>           device_set_wakeup_capable(tty_dev, 1);
>   }
>
> And lpuart_uport_is_active() in drivers/tty/serial/fsl_lpuart.c checks
> wakeup state on that child tty_dev (configured via sysfs) rather than the
> platform device:
>
>   tty = tty_port_tty_get(port);
>   if (tty) {
>           tty_dev = tty->dev;
>           may_wake = tty_dev && device_may_wakeup(tty_dev);
>           tty_kref_put(tty);
>   }
>
> Should fsl-lpuart.yaml and the driver be updated to support wakeup-source
> before adding this property to the devicetree?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1793645417.git.stefano.r@variscite.com?part=1
