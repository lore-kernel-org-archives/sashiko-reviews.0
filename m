Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.159.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792681623;
	b=QYJd3Ii1rbNPqFbJrKdYswMYZMVAtf7h1b8Aj1NnNSfHbwXYxi7ndH7UhBkXivk7RIs3
	 N8llqjUELKsrQGgpQ7SiypHrOYH53XDM7gJrtsG4/STl7lmP9j0MSXZ1pIPuE+lNF4ilQ
	 wPLw+LEz73PytrYj+Wva4j+zsE0fIQnvmRviXL0loCXdMMg01r26BnaFlGUJC+Ie/rSVN
	 IHv1hNYUBUO/ie2VTzg87tbIAKMzDbtZQ1wy06Q/dPJlySsD+30d4eFDDWXZhdFsVlLOR
	 luQOyGoamFuoLycj96/eRiOlUXi0b3SwTbzbk4QJM7qF2HhvSj4aTgpRYvRyJE5q7wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681623;
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
	bh=gtdaMGwQx2oylKbPT4vD88Q90VMr1emYZVd12h8dLgA=;
	b=lc39qX/76Loj47qjcmV0HcYltrkpZlIowYl6SL9yu1RFtK1QLVCXp/IakpSulz/hBZed
	 sKo27D/iW+bHymF77pWDL3dQJBbeCzBQ2TcR0NwAmCZ5CXsMD1liuI7F6Y1BQ1RAb4Xol
	 EYYUZdC/sjKjwnviS02ysAKCzpJRiK/FxW5S9KMB6Qphbd86LTwys9n74PTvfvHJ3sd6Q
	 uB00x8/qNfUV0t8pBA0mV3FLv5GMTTSQE4rlYrWkT42HnJk8wJtrc58HjLrkHsHb6ysWv
	 DcfHqhjMYodM4MxvFcu8MXO1BSv/Vt6y/4GK4JfwRLbygWPLRUXtzfCp0rWbmHDv5Jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=usk40kLP;
	arc=fail smtp.remote-ip=40.107.159.27
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078AF60A4AF5;
	Thu, 22 Oct 2026 15:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 078AF60A4AF5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=usk40kLP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUPF3lNiW2jMr1x8+NTJRuqSBE3px56ZMQ0qVCNj8lfhDMBPsP/d6x4Qgn+oPHVDtU4sethMQ6VSvwUk0V860++jljDq6lVT4p6PZgnjWM5VqJhamqMdHPtE5OGFd4j4MkgjEzMvHxGOoaXiN8IWlxf4Uabaykpxky2YxwXlHFrH3o3Jpmi9qBwj9X/zKWML8Olt3M+aLMqAtdEuNw0o7Iq4woSsTV6dldpPzRsb29EvCZiQrk4Zms2yqMUP9Qq/GnHywsAumzhUrkI4UDaTpeWSQ3irnqvdkzSTOBc9fAwrOvJKcUEwde7ccPtyPRHK8buumOJFP3AbLqh2aNepxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ogMuLJcyv1316ylpAyz0ppuB5mK0UlabHTvlVh4XBE=;
 b=puZXUqrc3DhvPmt3w3ShmcNlrke3UDPOqw9TnDZvfpYT7eYnffohN5RFAK0RaRmH1+iEvJj9CvKCb0LUxv0jLCId7cV84iiygekmzV7QMefl3NF7lbdNruAqncWjqakOSSSupUKuBc6NZN8YOiP9aOUbThLPJJxQ13JWp4D7GJZFVi0K3Ik5Be5Y5VU0hTVeByJpWFlinB6ejazCPm3P+vPSd16xt2i3EtYBqzU1MYLO+h2Go6Q8aGkKTPKQRYMfO12QagIa8Eh8vxcQukm/O2I6D560G/+kKXoiC2VbYQo7NnvnLFKh1paGLObKXSnzaG1StRkJS/EWYK8Yi3DxTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ogMuLJcyv1316ylpAyz0ppuB5mK0UlabHTvlVh4XBE=;
 b=usk40kLPLhs8viKA5o9EVusPtKvp4KjsKBSttpr90//7akk9LeXWCAgOzf8whjGlX/50MXMRkagR8hX9r2pFs4FTPMLBNkRxSxa1BGiYNoEzkGj3ltXPnugFiktDjywSIJUGFDX1DXhPiAc7Re1PI3BuZeQoTq+/DSjcuoJHUKA7TevKSoltwkSI/lIFyS2HZl4FiVEELerq4KkrFNrZ5Il56P/eMdzfIq59mb7ZaWF4KcqGFEAzbmqpIr8uwf3PBTnNGkdU1Daq65RU+CatQ1jCXzx6yEtHHoJ0RPCrCroFFIdG+MpYknTW9CwhPZ7dh+K14xTH0L8hEMThKT/m9A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB11376.eurprd04.prod.outlook.com (2603:10a6:150:29f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 15:07:00 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 15:06:59 +0000
Date: Thu, 22 Oct 2026 10:06:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v3] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
Message-ID: <atomiojI98tsqnJg@SMW015318>
References: <20261022-verdin-imx8mp-m7-v3-1-af284e28531d@toradex.com>
 <sashiko-outbox-181644@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-181644@kernel.org>
X-ClientProxiedBy: PH7PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:510:174::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB11376:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b81dc32-d1ae-485e-aaba-08df304e1ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|366016|18002099003|22082099003|4143699003|11063799006|261009223027099003|261021123027099003|261021121427099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	wQXbi2otXJkZZv4wkonpmH05snZAKJX74iIvvb89rNrDUqvOhiAQuBWvAgxsx/wheGUJpL1ObDxRW4o+Rx9iDxdANrQhe8qFcY4lr2h6cyns8swrMlh4N4coFqMsqD/0GheJFfgbrRz90A5zaULApSjkn84PJr6GthCAWk85p5CsUdOzf+GRrpz2YyKiOtuSghCZFPKem/4q3jWcIAvmORHV89yol9ZjROqJM1lm/0ZowXwp/jksFVsg3aMS3g7WlyzTE2X11S+KYfdm5qZfHP23pEkqLth36j2+2AP9O8AVe6/GT8+YPDmMLpMdWuKbJKlPAUsoqDw035A2Zy3rCygIqvghqDszptH7/M1YGAqjFeRiu/6Xdb75iaMGdUaEJhAVQP0eGBVHH0w/7GkjnRZCyLVtXD4cISuJBEEFw+blkN7aap6NX6fHCVCp9P+SZy2xGjVrGsdL5SUbbEvzyP2UWRWn7RHgOwM7s03de0HkN9HKv8VAlXI/NJ8eh50OYGqW+7ZLoGo4xPh19woi2rXdU+/09pPveRUCI5QUIUStwDhn9qm1lG74uCu2Ah1beMx/b/oedFg4j+i47muGt5YBh0arLlo+TLlfJmit+Io=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?trJcJy4BOjikJ2ONHLO1hDGPPFNXcZ0Rhzqloj+HqPgQaojYZ4PaLiaZq2?=
 =?iso-8859-1?Q?UONuum0NKLqViZrg6rCgyp2/pOxO6i8Xap7Hafs3qxN4C9Qm3jVZs1X5nB?=
 =?iso-8859-1?Q?YIWREWx0G3k4UOLT80RcZoHIs9MxHmRyhcZHsQ65i6O+c/5FzPX1MglNCt?=
 =?iso-8859-1?Q?aRV6oTZ38aypMMYB93LbayKbaOlUkvzIHivSFEBtunpril23i1cCeC4Nej?=
 =?iso-8859-1?Q?TmmiszV+90KKZ55nW6Q+wnmWID9D60ajCRtSV9NbMH7OhOmGq0L2UaNy/a?=
 =?iso-8859-1?Q?GYEBQ4lI8sK1JwevOLZEKn+nPhCiJhILl+F7t8E7KR+qMUXh9gfwXHFxT2?=
 =?iso-8859-1?Q?cYwXtZU8JrPPP7C4+haDqsi9YxuiyKkQ7Q9rN/Y4lLykpI+4VMYyq8Xf3+?=
 =?iso-8859-1?Q?Kw4v9axye9SSnxr5DGk7u8n6ET6GwUI6Oygr7PpuVl0YcBLkTFfCjK2IDc?=
 =?iso-8859-1?Q?BFHCeWt3wD82WVxvIAl8UX8DIOTsr/SiEvuOnW1zCezqTdCIBfMnwKsVGg?=
 =?iso-8859-1?Q?TQfm5NcXqrRd7k36qh/LTc98jOZfcK+B2avPfZlhaaqGuO6EzvvIzQiyTM?=
 =?iso-8859-1?Q?Pz/U5xxGGVRSse2ZRJuMkM904fVllTrSdsoWDo6721z50kmRvR5YCFEXa2?=
 =?iso-8859-1?Q?sS+FnidJAZktg2QeUczG6PK9UaZ1nA9xZWHd9nQKOL2IyToR1XGum1N0aM?=
 =?iso-8859-1?Q?9gLCv+dSsMPgn0DZJERN4tVsJLp8LiWdu7ds4AwePACWRaQ8I3jGBIvLfw?=
 =?iso-8859-1?Q?WMd0B34gZr5hywrIb9b1vZ62yt7denLNCe/w4hA1Xlh+EhczZVRI1iy/Yp?=
 =?iso-8859-1?Q?Y0NpZLcYbVxH5zwrRbo5+ZInu0+xvhBFkTfRM15rQd0RsV31lDuaspU3GZ?=
 =?iso-8859-1?Q?d/y8/YDBoWWUXhUvNIU/LIdAlzfQrww4YzNAWravQrIPr04LPgA7R8N8TK?=
 =?iso-8859-1?Q?TgBUTWSCyfOdbOkgdJhV40ZniMFmTE2RUj6Vjyvcjz/pA7SIlnobs8xvZP?=
 =?iso-8859-1?Q?Bb3UZprQwPGIMdLUnmn44hIqFFFKxmCG0MGyZP3daFQjXzG/HSTq+R2qEb?=
 =?iso-8859-1?Q?YXqQFbybZ/UdNugtXDy9fhhXXExumn8U9NAtdk7wH2fwd9xzxXD8loZLrE?=
 =?iso-8859-1?Q?vi3p4Ue5NRcVCh6vsB5UCgQ/R8BS6lHetdSUcg4+v05jseVSV5OVLgdhE1?=
 =?iso-8859-1?Q?7M5JlVrQyKArE6Ns1mERMiRKFIghDh5xRd1w11qgC96TiH2DflyLogsRRt?=
 =?iso-8859-1?Q?ROMSU/Qg1+CN7z4x9gxKnHHT4ai6Auj+YxKJlRlITwvhlzNnIq2D/A0TLH?=
 =?iso-8859-1?Q?J6In4khWPp+QBOuBrNKdmRArnDd8SamBOocFTX75gbFmcF/vX0Zeh51szG?=
 =?iso-8859-1?Q?+9FpwXYn+jcbMKVfORMPyvjJm567cJFmCRpwKl80fEa24giNMLXaqv3tJE?=
 =?iso-8859-1?Q?nd6PvpxXU1/of5U2DNZc3zcJXyfZjVXo1/w9jbZhcPWyjK4DcCb++xmFgy?=
 =?iso-8859-1?Q?hSaciUxmrcgRvWlSEs0KKEQ0WdM3HA0tqXrsLkV10wCmHYrb5aGHVwCYrN?=
 =?iso-8859-1?Q?ivedfJ8TYqgF0o72b0RLDJl+Y7+tHuF/uJtvZlMLNBjpHHHlGF5PNHPPb+?=
 =?iso-8859-1?Q?yq8r9p5Q/3UGtBRJNBTQ2M9TZWGOhtWPrt2HTKBsA/i3/c+QC/agvFiTdr?=
 =?iso-8859-1?Q?TeVKYQERPJiZpbog9zGj0Cuj1KwGmxRilXMUoEduE+Kj4DgGufykU2kQfb?=
 =?iso-8859-1?Q?mWqHz4NX/yPQTBvX7kYJRLXKPKbf9XCN7SzJNLNJJdWFzd1aOi9Qhs65nM?=
 =?iso-8859-1?Q?pMy/z7Ofu1L4HU6oRsH89+Yel7tR53nrvdyRi5j/3sZXCH4hvfiD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b81dc32-d1ae-485e-aaba-08df304e1ec2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 15:06:59.3839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rv/1uGLj8e7Ij+M2/1hLRfrLuRdHSzLBpiiWIej9prrN7UKv7GshuKBz7cj7yFgx8uH32uxVZTrKzf9vaYs4v6krHMUqJ2tQdFsaTpY7ZJbKopjY3PsjsRWSrA4BxImO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11376

On Thu, Oct 22, 2026 at 02:34:25PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] arm64: dts: imx8mp-verdin: unregistered IMX8MP_CLK_M7_DIV clock in imx8mp-cm7
> --
>
> commit 37e821a019361403bc773ac48a7bf68be6a133ac
> Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 remoteproc
>
> This commit adds the Cortex-M7 remoteproc node and its associated
> reserved-memory regions to the Verdin iMX8M Plus device tree.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > index 9fee2cf9ef546..45a4713c260f4 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > @@ -77,6 +77,18 @@ key-wakeup {
> >  		};
> >  	};
> >
> > +	imx8mp-cm7 {
> > +		compatible = "fsl,imx8mp-cm7";
> > +		clocks = <&clk IMX8MP_CLK_M7_DIV>;
>
> [Severity: High]
> Should this clock specifier be IMX8MP_CLK_M7_CORE instead of
> IMX8MP_CLK_M7_DIV?

look like make sense.

Frank

>
> In drivers/clk/imx/clk-imx8mp.c, commit 8c83a8ff4dd9 ("clk: imx8mp: use
> imx8m_clk_hw_composite_core to simplify code") replaced
> hws[IMX8MP_CLK_M7_DIV] in imx8mp_clocks_probe() with
> hws[IMX8MP_CLK_M7_CORE] without keeping an alias at IMX8MP_CLK_M7_DIV:
>
> 	hws[IMX8MP_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mp_a53_sels, ccm_base + 0x8000);
> 	hws[IMX8MP_CLK_A53_SRC] = hws[IMX8MP_CLK_A53_DIV];
> 	hws[IMX8MP_CLK_A53_CG] = hws[IMX8MP_CLK_A53_DIV];
> 	hws[IMX8MP_CLK_M7_CORE] = imx8m_clk_hw_composite_core("m7_core", imx8mp_m7_sels, ccm_base + 0x8080);
>
> Because clk_hw_data is zero-allocated, hws[IMX8MP_CLK_M7_DIV] remains
> NULL. When imx_rproc_probe() in drivers/remoteproc/imx_rproc.c requests
> the clock for "fsl,imx8mp-cm7" (which sets IMX_RPROC_NEED_CLKS in
> imx_rproc_cfg_imx8mn):
>
> 	if (dcfg->flags & IMX_RPROC_NEED_CLKS) {
> 		priv->clk = devm_clk_get_enabled(dev, NULL);
> 		if (IS_ERR(priv->clk))
> 			return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to enable clock\n");
> 	}
>
> of_clk_hw_onecell_get() returns NULL for hw_data->hws[IMX8MP_CLK_M7_DIV],
> causing devm_clk_get_enabled() to return NULL without an error. As a
> result, m7_core is never prepared or enabled by imx_rproc_probe(), and
> clk_disable_unused() can gate it off at late boot when the Cortex-M7 was
> not pre-booted by the bootloader, leaving the core unclocked when
> imx_rproc accesses TCM or starts the remote processor.
>
> Other i.MX8MP Cortex-M7 device tree descriptions such as
> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso
> use IMX8MP_CLK_M7_CORE:
>
> 	imx8mp-cm7 {
> 		compatible = "fsl,imx8mp-cm7-mmio";
> 		clocks = <&clk IMX8MP_CLK_M7_CORE>;
>
> > +		mbox-names = "tx", "rx", "rxdb";
> > +		mboxes = <&mu 0 1
> > +			  &mu 1 1
> > +			  &mu 3 1>;
> > +		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
> > +				<&rsc_table>;
> > +		syscon = <&src>;
> > +	};
> > +
> >  	sound_hdmi: sound-hdmi {
> >  		compatible = "fsl,imx-audio-hdmi";
> >  		model = "audio-hdmi";
>
> [ ... ]
>
> >
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261022-verdin-imx8mp-m7-v3-1-af284e28531d@toradex.com?part=1
