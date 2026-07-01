Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8C360ED2;
	Wed,  1 Jul 2026 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918181; cv=fail; b=k7/f+HmSohfYk+Z+7XaZlLDJR4r2mNJtyniSVNAsxZwvjbSKtZU658fAeuhQuBp4PbYofWqsDAjw6wTZfYKi95LcOKpM9pBANk7vffrMrmqhnSLQca3Vhvwc1RAaLhsIYKomkUi2Xc2xDBo/qmR63pi2MXMn4dsm+SCQIRDBi3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918181; c=relaxed/simple;
	bh=x1MfN1eEhFPIGeSQ2DYnPhBcer4Opw5ryDnipwO8kb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S/lFSmqJH2nCIRghqRJoZvsRPqcvg2G2SEHYtrXb3LonDAvfUs7hg2VDIcYA8smhq6FwK0miEVS7cahithIRM+YlR6VsAqWb+xKBu+GRMfngA3KfRh14/RUSPkmuc70DRVPQqO00/YUnCP04fQrVrTwuAb2dTSz40hIQ4ARAc+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h1fKRAgM reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h1fKRAgM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guYOyXTy4VTTjCcex4L6YyyWqpqNjCLudp1I8cxBUqPS7dQ/s8LCkhF0avcHcQnii3aymzg1drsYxWco/Nm4Zp6I/D48ZFab6BCbKDZyc3nwPSDmSWcNc2KYPrVdiGGfd7yk6Xi+7UZaf7p6t3n5SxGZkZqPcBBziJA/NtU834M6a505Cw3ZXpBvQwNcbKPwiMlOJpP4WO59iAcKTbz1hcmBgeEfkwAz+8Y5xXiywQTpNDYqcuFjJ14HRgMxeOUHI4AL1JlW3VKkID4WnssOkVOKx6fhB0pUbGPBPz9nkC/nHfvtHuZi0xG9v6eh0UINjK/FXRFG1A0wx513dxeByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzgHgoTx6NJ5dqJLjzlZ09JXRL5pIi2CPlG0SRSqfGQ=;
 b=CvROs7+gNAQw5HUKmPQep5C7MhquyiZ+LC9yq7hYURI7TM9uYkcWXukZ3pALYQWLVkOIJxB6Gu4ZmpGcLElXfDYCSwpwMyLDLQyk6GSscaRy3AF+XS8StdNdA9a+GPaNI2l3iROrryOPHjObmCHJR40m02aK02p1XgANejp8awytDplLzla5rhJfL0cvZRpnf038XPpGwBR4d67U7928Ub8lFGtWY9yOKAl7tFI258TQYNy82n7DOcUiZmMI7rGtnElUz3ui723dEFX8zBmRWEbbb+DTrsHZQDEzToZcTeIFTLbLuwEzFP7s8TYSNbWe1vx1T8fiPKvR/Tm/FbRUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzgHgoTx6NJ5dqJLjzlZ09JXRL5pIi2CPlG0SRSqfGQ=;
 b=h1fKRAgMwQJmgNhf1tUZTf9fkNmkngCnZJgcCxknxRDGjF32E40XuB+rZy+GP8jflSlBLB68BXsv2uyBtuxAr1OuhBcdED10TQhMPFLUEzUBtHXENnrtFS4P3zOzoUBoi2mi/jZ5cenbh3zPtUoU+hpQCelij9FBtSI3j81wPsSAEe33ZOzHBLs/fXR92IOJWQh0vfG10rkzCxmL5vvNHepqPlfHriSebJjLNReeay5gxf5t/vFCCau5pH+aVwcc90QNAlM+V8dUccde9467chfUwcNNHEXBwCfzU5nFchpb9/c1gQcyKGP0vDZ0O0Y/I1DJQI75oBMqx85DF++RVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10847.eurprd04.prod.outlook.com (2603:10a6:150:20a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 15:02:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 15:02:53 +0000
Date: Wed, 1 Jul 2026 10:02:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com,
	imx@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH v6 1/1] arm64: dts: add tqma9596la-mba95xxca
Message-ID: <akUsE6A6lX0mgM5g@SMW015318>
References: <20260701082611.3126036-1-alexander.stein@ew.tq-group.com>
 <20260701084522.5A5301F000E9@smtp.kernel.org>
 <15795907.O9o76ZdvQC@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15795907.O9o76ZdvQC@steina-w>
X-ClientProxiedBy: SA1P222CA0160.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10847:EE_
X-MS-Office365-Filtering-Correlation-Id: e738a682-8379-44ad-9439-08ded781d36b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|18002099003|22082099003|11063799006|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	h8YYwRK50eFtU/xr9UV2ZXTjAjLbc61yXVo1QTtBcPvxqGjIVp91FpJiZzrDSnBrYF5fosQdissZY14ARJIS4g/qAyN238TsMAHf/ks1HbVh95cq20k1UOLcOvXrbQEEYhZkQdt+pc+FwkmIDAF3NUTEm1Zg2cXmpTw4VBaDeW57G681uoQUF2S0xmQL2Td9NLClvitH+ZM85eTGdmMrX/NolS19Da43pY3NAMsn0xT8N5txVRBRypXHeMGgwUc/AZEY7fG2apthLg8UzH20BP6mjXWjwXAF0T7mMNUZz8KLBkqS3c29YOgzAn5jwT0txNcPCfAjXfI55HxTenaqt8FvWaZpD8k95BfkYZ1/B5DYvccppdB8X+aDKe2Ix0UGKes1nIV1/4jlmaRSi3HbU3922ldYK+pNbQJ2znVbQmtXqi5dp+Ye8a3fCpv9QPxKVjCdWGL1nsu1TU/q/WwE2o5up6xpWiVoveiPFgEd2ytA8MHHRfgWfR/q6c4nt9VkKRXj3A/Xq0YRvoZmks8ZHcglJxyvDqgxtVMQym3nd3w2ptcTBMewdvt5FBOLZabhIOzdxJVYebjwsk15LgQ0+P84E666uPhYHBX2T/B2UrM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zQJ6vlgkdz739MzSH9azL0KF19+EHOZI3AhcqEZu5MV3gE4GCRCwEZUV2M?=
 =?iso-8859-1?Q?5MjiItAErYXd/h2J9gr76RDHdz9a2I7CjSTzUkSz/stANQRCcVCsRTUzjl?=
 =?iso-8859-1?Q?eoCmJcqe2ftwJKuaLwycfcBi+N5QatjIM+TNVTq65R2efoQffJ9y6VI94M?=
 =?iso-8859-1?Q?Og2TYZOvlXp7qSDNnh/qGSQL+7WYdF0cEnXL62yW5TIk82BwHTtHc8CkXC?=
 =?iso-8859-1?Q?UpXmZBvwNFJOrrC0VIL+jpcG1ErtmktaZB0nHqwfjLYzMq0oJ7Z6r/Mk20?=
 =?iso-8859-1?Q?dcDWWlGW6pfhCNCUPVWz3r4iUzBMQSZIberVMBBm8/NYEqesjbsNsps8Sv?=
 =?iso-8859-1?Q?U54GCF7+DJ8wiGpFA4zz8ba2BbIkQtZS4o2KG/hkcZut7ItlN5DIJ2jPd9?=
 =?iso-8859-1?Q?apYeEMQnxOQcAaNZiGsqhx2KRjxihgdm+zVd3pvoz9cj4edmk+aYbBM13D?=
 =?iso-8859-1?Q?cNGAUKlz+SUQAOUHlTStWb6joQUTAiykjdsvNpvbVqoLMOU4t7/m+2Ej1X?=
 =?iso-8859-1?Q?nquGOxjcB3QqcQ+Xvcl8X5zy7u00x+gVLDWYcVnXY5rCbd+pD+mrPaKhnL?=
 =?iso-8859-1?Q?zzpYii4K0kFJh8jDDq2M1nW654CtUwKjCoeWMpYvsaEZMcbU9+/E9T7far?=
 =?iso-8859-1?Q?k+8zHK2X4nqUWfm8nIGkMF3VHT9LLkIWYAx8MxicyFyvxiXGwoFTUVVo/c?=
 =?iso-8859-1?Q?d993rDItKfVFo2C99l4ICtW2jjLVP6Kh7My2CmxDK3LsHOQyy1UB23Kfr8?=
 =?iso-8859-1?Q?N4Vvx+phxyK21CMz/eBpR0C3K4vRyDZDxtLV2DXYushSlxxxWJFPqkHdJ8?=
 =?iso-8859-1?Q?sKIVP4mbG19OnHQ9EBqm4ppB9QkcGnKMEeHCc/0WVgpm6OWC4iWEVQZa3T?=
 =?iso-8859-1?Q?RXO4PQukoUcQxq9XPpSwld/xZQYspkkgcxAMj0PLoXY9ZrL6XkrTvXloYp?=
 =?iso-8859-1?Q?/PTS3R/W1AulnJz3NjndKn/DldEhXLQUcvb1kvdJ2T5iROrzno89EdX1wH?=
 =?iso-8859-1?Q?6nqq4R3T0PBMe50o/1ZWxS3NvRplPHqsSMLkFmqBBCeHTba2Wz0iV9uhre?=
 =?iso-8859-1?Q?Vt3Ow3tK2i3RjmFOMUPUhIM19/870QJkDjPF2tQy0XTZvQIqTdQ5R/i1MU?=
 =?iso-8859-1?Q?G9F123/NGbdwtiypaz5RPcW+sGvKevxEtZ8HnbXZpenATMCsb/gWbAVdBY?=
 =?iso-8859-1?Q?7Fey6ylfVGK6uYKgwrqSEt+foPMhjW6HhMw6A0JioKdEbOgO8WFx9R2x3w?=
 =?iso-8859-1?Q?+g5EsqzBQwzmxM1R/ekJkcyAXgGLK9PS3oAPxfLxHMXaX6NVCGZvNr3sFU?=
 =?iso-8859-1?Q?FXZa0KTuv9y3hEizCYc+IpcfSqt4MqQqQ9EsQL8zpzXsJC+e6VGJpiyFxO?=
 =?iso-8859-1?Q?GQYiMdG8Xxpi6H0/gH5jVgxrDLNNhtWwxubHZ0dW/BkKrs9DqS5wMtsp98?=
 =?iso-8859-1?Q?Id5MLlV76qSGHl9i7KIhwWh1N58car9Q2QgFJwB5Rp2qGqsQKt7QWw14gn?=
 =?iso-8859-1?Q?Mjvj/wvKctTLnWcjqX4o91R27HnLg+HCFHCwPwb9bklnazEkCW9SEC52Zo?=
 =?iso-8859-1?Q?LWrJIKYtv0JjLWgGJlS3oPJqyAZF8598148iC5qxKPzscmPXDaJASbTh1+?=
 =?iso-8859-1?Q?E5Rr5j4ikIF2ZunnzI1G0f1tzdIaG8SiOc/xbJZN3ZB7xrx24xq97kKlww?=
 =?iso-8859-1?Q?SrcbXBH7Zxtb0Rbq3XUTdrwIy5waBNDxes5WXRsBIG0WoxfRF0QZ6x/0Ax?=
 =?iso-8859-1?Q?2HdPq2zmnR6dGE7P/vG5vg4lhms+zdxKJ95ZRrET1+CfVQ8Q5unxH7Kn6E?=
 =?iso-8859-1?Q?QxC3pBmkL8ifjCZRZ/q8+g1ru8sqL1ExrUeh7oUZgzOkPg6hfkV/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e738a682-8379-44ad-9439-08ded781d36b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 15:02:53.3940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIRlc2R2qfYSCw/xdrjnAR5A813H1UxgY2T3OsJSHiYMKNiiLbGkPgBRLuUJuPwUQbbpmkpXjPyKjfdei/XO0sFBKlvUIjArk6FOyasZfYFJRlUtUfDWW+PwPcBB13D2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10847

On Wed, Jul 01, 2026 at 10:50:11AM +0200, Alexander Stein wrote:
> Hi,
>
> here some comments about the findings.
>
> Am Mittwoch, 1. Juli 2026, 10:45:22 CEST schrieb sashiko-bot@kernel.org:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [High] Hardware components (PWM fan and 10G SFP) remain permanently unpowered due to disabled regulators
> > - [Low] Dead code: Unreferenced `pinctrl_ethphy0` node
> > --
> >
> > commit f54617810555494fd6b435aa3ac070a14b264e01
> > Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> >
> > arm64: dts: add tqma9596la-mba95xxca
> >
> > This adds support for TQMa95xxLA modules, designed to be soldered
> > on a carrier board. MBa95xxCA is a carrier reference board / starter kit
> > design. Enable the external accessible PCIe controllers as host, add
> > clocking and reset GPIO.
> >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > > new file mode 100644
> > > index 0000000000000..e90f37bbdcd80
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> >
...
> >
> > > +	pinctrl_ethphy0: ethphy0grp {
> > > +		fsl,pins = <IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_GPIO1_IO_BIT9		0x1100>;
> > > +	};
> >
> > [Severity: Low]
> > Is this pinctrl group missing a reference?
> >
> > It defines pin configuration for the ethphy0 IRQ pin, but doesn't seem to be
> > referenced by the ethphy0 node (e.g., via pinctrl-0) or any other node.
>
> This pad is connected to gpio1 which is under control of the system manager,
> so Cortex-A55 (Linux) has no access to it.

If not one refer it, it will never be set to GPIO at all.

Frank

>
> Best regards
> Alexander
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/


