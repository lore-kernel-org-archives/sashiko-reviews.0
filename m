Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.70.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794846550;
	b=BOokIXNErHHLVpgAomTw/OtrJYNi566Qo17EUKbJTFigAJVcIIIX973WI2Yco5dZDS0k
	 AtuZVnzB0pjs987edQgKR5Q9K6YHeuAghlcNjVt/hf/ZqAfETv4VsXx1AFO2IZSU55Htu
	 LvjayKqXOPObqfpLNQGl2eE0GKkqzAWK+pWkbv6EDeurCMHIrR4iSIgXk6azHTFN4MYaQ
	 WjKRfZwXe8aBiJpBAmeNc+B3xMDvwW0+6nBuKlNeFmBW0qFtA30nMPPF3VAdA4grXdPWx
	 GX4p01Tf9NV6N8T49SqlbmODTiVzlGy1l/C8/Eh4CK9+8W4ap+d56tH6Y3HHaOoXhsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846550;
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
	bh=FhVYPkokfPYi+DXxnNjrVzJBgOe6IHd+yK+ed21j+es=;
	b=lBB9iWXOXNpRZr4gdKYcJj6TxwtDTdsnOJkCJelJOfukbEfLbaGvhCpDIWZXSjqnP19l
	 ey3zO/fH/ui5J4ryAmLSCh2k/URzmoBlkXrDoWo2EhVK62fHhnONluxa/nnz+oH6BSouu
	 i21ChiHMmJ4lKsZ21L0R1CD4vvff59gXgb8U42uRxdeuQT2Dd9S6kTDXwzs7eaXOS2uHZ
	 5KVt5iPqi1ayPwzDpsmPKXroA20li/ETnhalXWKZyn3m48Hqic0wY8TXxJ71AGXJLxeRw
	 cKm3uEfo1dIOExENcmcgmqEQiM4Qye6fYcXtcfvDgSPmIHGDINgEi3Os9mH4cbt/Kow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pkF9u4FZ;
	arc=fail smtp.remote-ip=52.101.70.29
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011029.outbound.protection.outlook.com [52.101.70.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EF1606A881;
	Mon, 16 Nov 2026 16:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60EF1606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pkF9u4FZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVeRNR45UROZRhaT2AhX+wHvOdSswEw9J6lIjiO5nx4tHEYUrH55CpgiWD7ggMWr3LoGv72yFssFSU93bl/x0eLvzNbC9Ie2EPZqDQqCLfhIE9szNqZVnpZo+hCCKuciem/+dTTgFv08GRSZJDkkodLK9+wqS/UsAn0EZMOHzsgyt5Vll9fXjufTmt7oOtqRlUvyBoTwPZDJ21KA3G7dQHu1L+6/HqdTNvOgZdWsVQxSnzOqYfTJ4MQDNieaYJ0fQgJ7OYrXEcE6EL/d9mOFUoLy+pAgXe0/7sZqzAt+gDAR7e1wLaf4cQT5Gje4Pdvt+CHJkPIMDNuAWJvx0HWGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDkOpNv+LYpWuGzOZaoAM1aEw7nBWz6K7YjEJ+8kAMk=;
 b=d3fTMMNm8kiMQo1/0CP4DWTHHxI8qMve6P8I7+qCHEpHLb3EbAiV8UHwHoE0WqGxCzbk5KhxT3megZtCODPSJ4bTtih2lvY7AhTYijtH3eeEeToecxDPYFrZRt0Dqupma8GDcbO+0zV19kBNzWvQXFKeiq+zCNFWGmCKbAAzm0lip/QaXxIVvNdA5KQBkIzuY6ignd2OqLwud/m+7nECGpm7K6AiWgF3q8x5wpemuNRpbS639lxux/QVosJ+/uPjp3UsyS7uDPDlYzaVcaZi/rsxC/PeQTUjvuEazatd1OGdCAjdbTgthV4o8PGdBU6NNZIrg3pxsn3GIC5+JUpuPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDkOpNv+LYpWuGzOZaoAM1aEw7nBWz6K7YjEJ+8kAMk=;
 b=pkF9u4FZJqlOg0PJS5YhtN5wdbRO6/Dj4+ughF7xg5euytupuUORCTeULMpRzn/NBmf0zEaVyzGq8UPMX028cXJPLefHxAsc/w02YWRMhjiosmeLcwuB41VIKrXuhnxovXRBcK2wdMDEV0CogZlr3wQbCetKwoTvq5btGNfttdvotk96PnRPnpyEPEfameSoCZTbPmP7beF86yMthRp48iUXmtVYxM7Y3dMCKj8p1QmT8FiZm16G4upV0qw7iiHajeTi2w1y8PhYINGCmjcBRzzOChbcdZ9ID4frJ14GLtYNE/Iyiq9em50P2Cmmm7dA40Q+R5ezf0+yP9jMnoJu9w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB11015.eurprd04.prod.outlook.com (2603:10a6:150:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 16:29:04 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 16:29:04 +0000
Date: Mon, 16 Nov 2026 10:28:53 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Junyi Zhao <junyi.zhao@amlogic.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org, neil.armstrong@linaro.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v4 2/2] i3c: master: svc: Add amlogic a9 support
Message-ID: <avsvRS6ADfbzQkpn@SMW015318>
References: <20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com>
 <20261116-a9_i3c-v4-2-3d3222b7128d@amlogic.com>
 <sashiko-outbox-216859@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-216859@kernel.org>
X-ClientProxiedBy: PH8PR22CA0011.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::22) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB11015:EE_
X-MS-Office365-Filtering-Correlation-Id: 483a1e10-d01d-4fca-0715-08df43febab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|7416014|376014|22082099003|18002099003|6133799003|261009223027099003|11063799006|4143699003|56012099006|261028144727099003|261102123227099003|261026135527099003|261026121527099003|261026130827099003|261021123027099003|261026140227099003|261022115727099003|261022105027099003|261021133027099003|261021121427099003|261021130227099003|261022075727099003|261021135927099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	KuxhcsWgcJXAjAKWoplZVAPU0Lh9g/oMCqixV/TfolkTiqdii5YQKzYde0Yif4tiSqM/BgHZ5liLNOriluO2PHbfhsZwulKANPf+dCdXv94BxbRXu8zdRig6NCwI3aX0nWslofHqh1Ixn/fiEvewBW5MG4YsTCDqawzH6QkdzrT99ghkC74AvS93ffQiDWVIKEjO1Z7IVJXnVn5yjH2VUhYwQeIHRalW6IdTXAb8X4Uz8mGG/ps+Tz9zfDeWCtwteL0hC8CRty9UBAHhtEGm1DxghPFOXk2Er8Yvr4uOR50IQ5mTkOlD3XYy1Mt2n5JUiXVofzRjVfvXUsvy0hvfKDiYExXKZrYppQy066+nRPa/ClymlhZv0WHolyk5sojB0Wl3PTL7b2ua3+ob3wf/ggbge4vz0Psq4BhE7S4gQMJP0lFQO/FD2GeFlW2tb0nWv4BlyjxfI7QJqfndy0Rp0C0JbC2ejGxzsEuhY/WbUAQaw7eVUU2Ge0APn6lPHEK1kFEaSZweqDK/PDe1j6oHWDo9hJOsP03SYtHR/dtSWHFg+zt2af8tFJt+pwwgum6jUyk8rdHTqpvcxNqWGlfz4FE8DiXAOJ0owTNF+UGCejc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261102123227099003)(261026135527099003)(261026121527099003)(261026130827099003)(261021123027099003)(261026140227099003)(261022115727099003)(261022105027099003)(261021133027099003)(261021121427099003)(261021130227099003)(261022075727099003)(261021135927099003)(261022113327099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?HUESEz4mC6Pi5i659XypAGxoN0H0H1tVU5Ofm51TstJEYalNQthnxETHv9?=
 =?iso-8859-1?Q?8ybndCV5d82YwokqypvoVtvZU5Sh8gz72QbySchXAWtrPfzs51WlTtVzu3?=
 =?iso-8859-1?Q?zyh8XWaMT2DhPD7EkrvQ/si6gL2zeu72y1QZx57ywAtDMXUhwvzabONm1t?=
 =?iso-8859-1?Q?IYCMIdZSt2/1LD9vsXK2ljc3KsEce+GN0XV5Vi2RtoChON1Cq9i8Ob/qUU?=
 =?iso-8859-1?Q?zLq/QiC6K5epxQiAsqvX546151dMd6sXKpkrCVDMP1IJ0B+uuP0JMSt3Xk?=
 =?iso-8859-1?Q?6E7PsIeaCHPXXvLec+VucHhokKVWLzhhSkmNDM9u8b7V0k/KQPudqS9He0?=
 =?iso-8859-1?Q?rH7LTeGYEJpeHanZVRja7ZZG+nHQNwfJYUNEDh6jgBvyk92E3063zjeUsb?=
 =?iso-8859-1?Q?qteIkJUq6D/An6aVTprPUBk1l8IkIykMOEJXgZxwK/6ZTplcMhQAOMQlh0?=
 =?iso-8859-1?Q?y+YW3sIeCP5wyBBKPx7Qt2flt2gyMuyFy2NjioC6DqkQs8lHqcFpgg9KLQ?=
 =?iso-8859-1?Q?dG1T+GIQqpkSAckosPOBlib9wHAFe6QwmatxhV/TG2dUU4KsIOJ77uHlX2?=
 =?iso-8859-1?Q?mVisMNJnIYSUjM/GdhE+qkgas1u/wJIFyFVVfSsclbmcp7+I3TpeDorCcH?=
 =?iso-8859-1?Q?6iloytZ6zAc4biDYvP1IiqC8UWFTC2e44ED/L+Ko9wVz+/47XYpTdwNK4e?=
 =?iso-8859-1?Q?BFndOZK9BTdpBi8G7N/Kk25KRyo5wv3gXSWfEL3ErKnUPZhkX4rKUfCTSR?=
 =?iso-8859-1?Q?ncWFwDb9pdGjTVjDVvLJvAPdangaXPWB8Yl7Yth5l27c798yuFJUX5n6tL?=
 =?iso-8859-1?Q?6qG54cKJU9iuF6KH08cPg3UWWxNFuhgrIbGgMyU5EYEBZUVDsMd8PrCbQ4?=
 =?iso-8859-1?Q?Hiu6kDv2U1mdmpQYybrRXNfDeZaJuOj60KNjZxfUTqLEoBjHr8oFKuCnKJ?=
 =?iso-8859-1?Q?M1f8uDLH41ErCFjFK2RU9JeDWrF6LduvpLDpL51HkQ6ot/dFS2/0D64wBj?=
 =?iso-8859-1?Q?mHLoETLQs4ch7Oi9RxdTT79fwuFdqY93rCfWbeD6GQkCLn+8FdC7wlYYDQ?=
 =?iso-8859-1?Q?1qQ/LQr1fzwhEAqLy7j0ehscMAYXoZhSmxfNFmPN6lm8IvrxIoGHsk3Nqr?=
 =?iso-8859-1?Q?xHPkHMGT3YV5EDH/eBlHK+BfDJYNX/wlbZcURXdtLtWJYDn2WdVPBIZmIZ?=
 =?iso-8859-1?Q?9zH/LPFvcGrRWbq1RTlICNLLFQDT83znldE3qw8hYEP/B1jVjABMNBKxC4?=
 =?iso-8859-1?Q?FvMZFdfZRRuKtQStD08XqmI0XNgy67W1oMXUcjpKNh6YX97euKEKl9Pdti?=
 =?iso-8859-1?Q?Vux/PqDrs4M0yISJbbLYQDcD3mVUV2Gd9PSMmd6M6UEnN0DjzSxusT10Xh?=
 =?iso-8859-1?Q?GgkL3h29n/pcyJgLytmg5p6J198oIlhiS2R3GFiNCK3cTq3G9bSxAcoFTL?=
 =?iso-8859-1?Q?CMnlQqCz4Bp2NrHSySrgCP9nK2mGKMZt3Q61A16Me4T4+JP1GXRNpwgBq9?=
 =?iso-8859-1?Q?0ge3LlZDxXWOW9Q/ZXyzgF3xPM+oJ1xrKjdX28sK3C/MEDIMsJA5cFkw/3?=
 =?iso-8859-1?Q?ANtCnG1TxLrOKfxFvEnK6scQnde4tWrFXLtUPTmInP/VtRHSozvisx6tAc?=
 =?iso-8859-1?Q?rgGHbX6M1cxzhO8edCujHI0c34HV5jyHW922izLumfMSEoTuBkZmkkAHSJ?=
 =?iso-8859-1?Q?AOMPs2wLP2G0//0Dfp9g3ni2Dicte94DUV1alsWdSVBwDSLVqT6qJpJXuA?=
 =?iso-8859-1?Q?v/1HQTeU6MJgdQf2Iwb0OGmxMROt0ZKcJtK0b8QtEMJDOBHzvDS75HpQii?=
 =?iso-8859-1?Q?L6XtYjq5+Wc8RGYspU0/9RZ3f1jAUBdHETjogVoWWPk21HL+D9fN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483a1e10-d01d-4fca-0715-08df43febab1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 16:29:04.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnXx+q0Sna55rUfHc/OyKFfK6BluwJvDurRGrD9wqTzQ2YsC57cXNT7W9vihPKgh0EH30fdY2RazaGqLWH9QmvpOTcGLAijwXr5yFTVBH73E+u3OTT66XO3f8oDYGk0c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11015

On Mon, Nov 16, 2026 at 11:12:37AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] i3c: master: svc: NULL dereference of clks[0].id in
>   aml_i3c_init()
> - [Medium] i3c: master: svc: clocks left enabled in
>   svc_i3c_master_remove()
> - [Low] i3c: master: svc: duplicate fast_clk lookup in aml_i3c_init()
> --
>
> commit 260aeb5a4d5c58d3bea32674062960231e4d4d2c
> Author: Junyi Zhao <junyi.zhao@amlogic.com>
>
> i3c: master: svc: Add amlogic a9 support
>
> This commit adds support for the Amlogic A9 EE-domain and AO-domain Silvaco
> I3C controllers, introducing a vendor_init callback to register the AO
> variant's internal clock divider chain and configure the fast_clk rate.
>
> > diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> > index e700392f0801f..0268fc713afdf 100644
> > --- a/drivers/i3c/master/svc-i3c-master.c
> > +++ b/drivers/i3c/master/svc-i3c-master.c
>
> [ ... ]
>
> > @@ -2163,9 +2209,215 @@ static const struct svc_i3c_drvdata npcm845_drvdata = {
>
> [ ... ]
>
> > +	/*
> > +	 * Keep the clk bulk state balanced for the following
> > +	 * clk_bulk_disable_unprepare() calls (error paths and runtime PM).
> > +	 */
> > +	ret = clk_prepare_enable(fclk);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "can't enable fast_clk\n");
> > +
> > +	new_clks = devm_kcalloc(dev, master->num_clks + 1, sizeof(*new_clks),
> > +				GFP_KERNEL);
> > +	if (!new_clks) {
> > +		clk_disable_unprepare(fclk);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	memcpy(new_clks, master->clks,
> > +	       master->num_clks * sizeof(*master->clks));
> > +	new_clks[master->num_clks].id = "fast_clk";
> > +	new_clks[master->num_clks].clk = fclk;
> > +	master->clks = new_clks;
> > +	master->num_clks++;
> > +
> > +	return 0;
> > +}
>
> [Severity: Medium]
> Can unbinding the driver leave fclk and the input clocks enabled when the
> device is not runtime-suspended?
>
> svc_i3c_master_remove() calls pm_runtime_dont_use_autosuspend() and
> pm_runtime_disable(), relying on svc_i3c_runtime_suspend() to call
> clk_bulk_disable_unprepare().  If CONFIG_PM is disabled, runtime PM is
> forbidden via sysfs, or hotjoin is enabled (which holds a runtime PM
> reference not released by i3c_master_unregister()), runtime suspend does
> not run during remove.  When devres then unregisters ao->gate.hw,
> ao->div.hw, and ao->div_en.hw while they are still prepared and enabled,
> clk_unregister() triggers a kernel warning and leaks the prepare and
> enable counts on the parent pclk.

Suppose it is existing problem.

>
> > +
> > +/**
> > + * aml_i3c_init - Amlogic A9 specific init, called with the clocks enabled
> > + * @master: I3C master controller
> > + *
> > + * Register the AO variant's internal divider chain and round/set the fast
> > + * clock rate for both variants.
> > + *
> > + * Return: 0 on success, or a negative error code.
> > + */
> > +static int aml_i3c_init(struct svc_i3c_master *master)
> > +{
> > +	struct device *dev = master->dev;
> > +	struct clk *fclk;
> > +	long fin_freq;
> > +	int ret, i;
> > +
> > +	if (svc_has_quirk(master, AML_I3C_QUIRK_AO)) {
> > +		/*
> > +		 * clk_bulk_get_all() preserves the DT order, and the
> > +		 * binding restricts the AO variant to exactly one clock,
> > +		 * which is always "pclk".  So clks[0] is the input of the
> > +		 * internal divider chain.
> > +		 */
> > +		if (strcmp(master->clks[0].id, "pclk"))
> > +			return dev_err_probe(dev, -EINVAL,
> > +					     "invalid AO input clock\n");
>
> [Severity: Medium]
> Can this trigger a NULL pointer dereference on master->clks or
> master->clks[0].id?
>
> When a device tree node has no clocks, devm_clk_bulk_get_all() returns 0
> and leaves master->clks as NULL, which passes the master->num_clks < 0
> check in svc_i3c_master_probe().  Previously, the fast_clk loop in probe
> ran zero iterations and returned -EINVAL, but aml_i3c_init() now runs
> first and indexes master->clks[0] without checking that master->num_clks
> is at least 1 (or equal to 1 as required by the AO binding).  In addition,
> of_clk_bulk_get() leaves clks[i].id as NULL if clock-names is missing or
> shorter than clocks, which would cause strcmp() here and in the fast_clk
> loop below to dereference NULL.

This one need check.

Frank

>
> > +
> > +		ret = aml_ao_i3c_tail_clocks(master, master->clks[0].clk);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	for (i = 0; i < master->num_clks; i++) {
> > +		if (!strcmp(master->clks[i].id, "fast_clk"))
> > +			break;
> > +	}
> > +
> > +	if (i == master->num_clks)
> > +		return dev_err_probe(dev, -EINVAL,
> > +				     "can't get I3C fast clock\n");
> > +
> > +	fclk = master->clks[i].clk;
> > +	if (IS_ERR(fclk))
> > +		return PTR_ERR(fclk);
>
> [Severity: Low]
> This isn't a bug, but this fast_clk lookup and validation duplicates the
> identical loop in svc_i3c_master_probe() that runs right after
> vendor_init() returns.  Could a shared helper or resolving master->fclk
> once avoid repeating the lookup?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com?part=2
