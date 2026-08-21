Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF0D4248DC;
	Fri, 21 Aug 2026 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325485; cv=fail; b=XTP1Hf64C1/X/QnA3EXRQJLIN1mjai5AtEq5Ve04f2caLOzPP+pqzQ2auq5PcKNFzDjtj80yfbl8yOyBTgranTDMbFN5/LJ3Qd+N6RnmW17M8RGP0gZYsWUDg6/sgL3A/Jf4Yd/9nYhk/kVj+OEMWH9pS86/fSmZQw3PD2eQbgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325485; c=relaxed/simple;
	bh=nLjc1FPVxh2XQc3ynr7bxBxACgw86lwwpDu6gPPSkY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uu7zigh0NSxMrVY7MBsUHPablF0nUZmt6uvrflazeg7MY1r6sRzlZ3cqzXZw/nhEZBU/NQIjfB3PoL9OA15GHpaQMIgix7eEI8sUciO2k/QQeEz8kuxoqUvfAizty3IkxK2EOI+UF5ihb9PHfW1ykOhc210hLEYHji2tqxIqu8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NDJCEgoI reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NDJCEgoI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZnhuX3J8rgrywjs+wRmQFLa8t/Rz/MX8WWJ2bdK0r71nF4DEbU0m76y89gvR0U1d8NEV/ITEKiROP/I2lD0HfNVuGr8OHBnqSuZsjhPk3uf90H1mKlAvxVByB/df5vWOVlvS8MxVL2+SluQLC7QtjTXv+WoSSqAYKt7mqhxJsh+ay1rN2rX/R+Ijb2QBLD6b8qcPE1qqy7pwfUDtumUHyI/m7VP6DA8db0PbKxm6V+T7qhKkNDx9Snwup0SLpxFJk8InvEqzcEnvOI1FJCTDTqO2BMcBlqv7tHNk8/5nmT0Kl8Kerk5ISjCM2sXIRWv+Q4p+IMi2VmFpXr/bytuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uyp086mnSQWL3YrgZ1kS2DWy/5PDWHQbsqNw/nT29E4=;
 b=sd+4jO4sU+uxOHj1gFWr/vQccvQouyZYdC6HI+cX/+u+OsRQb5n6LvubmfygpuX+CZMEXoBOtZwLBSjUj74ZsW5LcWPgVvsLWTQpkxpjwMPKdUAswFBgVimCjdwPYDjruQhvyxusL3+CmWIq9UMK97s8JDDdbCAbmdBud+7vZm7wygEGeXDSRxDb0L2D9ex/keBZJq4SWf9IAyeKW0o2K9DGyd10yq4AQDWqZ6uvZXs8u71yg82mFxwoU/+Rgod7CrNKNYGBGF7ncrYnHjICqF3iBNTIEV2MqWz7L09GJme6H29c2NjIfPJP1De2X/vcNLWJ16IJ1ONG37sV8eJViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uyp086mnSQWL3YrgZ1kS2DWy/5PDWHQbsqNw/nT29E4=;
 b=NDJCEgoIPIGQVbDKHnBwQUaMFERTMxZrro0zDfol6WR6dmh0RBF7zqSFDpuRo2VtmRG+Z/FUGr6h2v7JmfH50UCzdHczgdv9pdRz6zBUWtGWZky7501av763hUk57EMSE4f6/9xnfSMuIsVHQADhyd4PKXBiFXJWYZbef1qRLwD173D2rEplOQTNmeyFo34TyX6XmnZNejPMcryHx5JFZZCiomlnb4ok9PupmNul/D7nbOgbQ2vgn1BJ0LpinUjDZi+F3C8ItW90R5C0/2fJk+bjwZdpPzq7yTnPGskjTQdRP90ZJXoeF37ZTVoIkRbsWmZl5nGKrziqmJyItjoXsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6867.eurprd04.prod.outlook.com (2603:10a6:208:182::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 15:17:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:17:58 +0000
Date: Fri, 21 Aug 2026 10:17:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: Re: [PATCH v40 5/7] firmware: imx: adds miscdev
Message-ID: <aohsHib0FcMr2qwT@SMW015318>
References: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
 <20260822-imx-se-if-v40-5-74fbce2f2f95@nxp.com>
 <20260821132328.672201F000E9@smtp.kernel.org>
 <GV2PR04MB12271B7774D6971CC40FCE28595A32@GV2PR04MB12271.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV2PR04MB12271B7774D6971CC40FCE28595A32@GV2PR04MB12271.eurprd04.prod.outlook.com>
X-ClientProxiedBy: SA1P222CA0061.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9f8df6-5b7a-4ccb-2c9f-08deff9761fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|19092799006|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GFP3QGJ0XIlq3xY2w8KBPswkHSyVbTU+LHb8xF5wf3w6XoHZZ4xR+yD7B/JS3riD9rHICCwOno2XoGvQLLyyXEvq0Jje7Uq+rsm0Aak+cWl+BeEWcDTbDBJF2UEyIGY6ex44LThc8ppNYG8LtKbDXJO43omgsp+DLHRQ4cobDegrYcLrlBGXVGZaBcg3dqFmZOBXFHcfPP2z68ohBInEWtMnPTH/4Rr1h23HVH3QoFN6chXUnuXEPjeEBViQ+Sy5EUlbQwRY9gTXxTyXkobnC1Nh/0n9pFBXSUWLLjWnJQv/sEdEKhxaAYSyNdnB5bdDODlsy9NzOrILycwUlIdSS1XPGouT3CnnWA5Wx01OQNImnamYjkisvEy6j082zWqoW/Q0XTvJxZNmSfypMaX8JFwQEssKL4rL7UEpGA43qyF6zTSbWVWuuP1J9X7MSAxuunwTLECb7IGuPtCvABvFH56A4H2XuQIT5FPVXz277L48EkgOsygqKKtGkVUShv/5SowZMIiufsu4bhi6bt2zrdOdTRAg+QMlOkon4eeLjgLywG4I5uGcB7OB2TkwC3ztkY8SRZ8RymulBL9v3kYjXMsuqlVjKHw/eNHQasN71sk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?t/tx7mCwVkj3bwkpIU9WSTIq7m0jVTFuqeodCU8aBgl3hfsvuiAW8x68oe?=
 =?iso-8859-1?Q?xcyKlFoQaSvlMMfDo7zELCNUSiXfEZDHmmYtA3S2lQmMrHoVRl4I7h6H4e?=
 =?iso-8859-1?Q?8sKSfDoG0ToYtDpaLNg+RuRHiVPXaMbkUUjtDhQAd/4ILuk9cCxIMsdBS8?=
 =?iso-8859-1?Q?YFZX0+EuYsjEG0FvGZL45pj9nTj0Cp3k8GxcpCCsZWH4mrK58U/sXBqQo9?=
 =?iso-8859-1?Q?Aqm9lCQmeTjj4kDGzu/1qZ8Js7mGLDyOB8UCWC5OOBK79+eD2fGPk2Xr2n?=
 =?iso-8859-1?Q?O44zxB0AbjWXeXiHArNlqRde4L/2mBe1y6I80sACiPLU1cGylbQShRVpvh?=
 =?iso-8859-1?Q?Lnfwt4AbMBAQI/iW6YYSP29KD4ImCBUj0M3+A5k36Zl4lHKuUzSNKnSnrW?=
 =?iso-8859-1?Q?/Tb9DQ8Kpe2cd+27MvVgBufLJaR6kVxMgmxDTPl4h7PBqI1S1VJowh2OQL?=
 =?iso-8859-1?Q?WX2bhv1Gb+C2MPFm/Vrwd6fUgrOt7PWkk33tqMEw40iYBipBzFTjbW9O+0?=
 =?iso-8859-1?Q?9XkxDBbl2j+i3gG/MmWgcDNab8JE9NfX3L85BAhe2ujJan+Tlw9f7UO6XC?=
 =?iso-8859-1?Q?aYkD0s9A7xommz95yyNU32QPXSJxvZ5WHqdOl8kxc7MM9M9GpN652YOOFK?=
 =?iso-8859-1?Q?1BqUQS6sQeIMdOUOg9qG3ZxJlPNclhyvgmN6ZMCoB7CZ7yShaWH6dW2/vE?=
 =?iso-8859-1?Q?eWrBfHEjxNDlIoV04VLJOiy95RV9ra1UbNNBuCjjI6SUrpWoDiqe/Y7NJ8?=
 =?iso-8859-1?Q?PwOwJrVfJ8XtSqDD4CVr3QVJ//+PUzftJ0AE011XkjB8Vt/6NgQdXRFNX/?=
 =?iso-8859-1?Q?Iu7zdAFh7ixTeyZzY+Wc14X+0eFj/llhPMam43FgwTfiHGncxI6Rrfw5FU?=
 =?iso-8859-1?Q?IwnKhWr9h2Z9d7yBiqH5wYbuXhLJiZoVHi1NKBFcjH8Pu6LnZQkXIc9I1o?=
 =?iso-8859-1?Q?DHT7wOxrjz3Zds0MbKEp+Kx8ZzfOL5DYHdi2ix9QmkVraGTJXnXTmWTqdH?=
 =?iso-8859-1?Q?H6tttHXVr9IT8pAvwLoSnMVWC00xQ87CPeLcgE8JFyY1X/0AEVz+iCtA4s?=
 =?iso-8859-1?Q?N7+oLeOjOiR1WkzDr0LWRDXBAs/cedYSM0KUTEDjEuxY1gmIexhPh0usy4?=
 =?iso-8859-1?Q?6l+3H6mrZ5mQP/8EoVC4vLbyaaju+kGuwP1bIwZIqTImrc1voh9ZTtYQYV?=
 =?iso-8859-1?Q?NC4eiv815wOUCVJ8IB/lFDUX46i6UGhVyOF9FB4sVCxl2/1Pk00dvktepz?=
 =?iso-8859-1?Q?3Yc/SHLClPSgBx5N0Xy0rxmkIV/EoXCAYSTF7UkmiRq8ntLMaVwufZ7w9L?=
 =?iso-8859-1?Q?ibnGvHWI8v6n9UXoUhivbDIJVPFgIGmVV8zkeRV9QQdz//fpALySaN4ejF?=
 =?iso-8859-1?Q?6NaMTkUknFBBVPuyMxQ8iFOQJ4zvwW4yLKJbld13FMhPMWMi0eBg0VLjPT?=
 =?iso-8859-1?Q?jcTgs8dQfKRaWd8HhEEd2nDs1F9Mpk0xU4I39TiwY6Akqlbo9J2+BHdVfe?=
 =?iso-8859-1?Q?j59FC59U/QdPCC8FhiwqaG+f/EPitVAA0OS6k5a5bB+UPxsDoigKmY1CeT?=
 =?iso-8859-1?Q?ZLNsie7OCT1uEsGq9QS74I9budTunTllYIS82juelXWub2NfmXxPa3VQWE?=
 =?iso-8859-1?Q?KdHPAsV4YSgSCbW5Z1eUnTlwqOhAOyoAUtBqeRRMQ5zoMQWo2YBaXFWfZ4?=
 =?iso-8859-1?Q?NNTOZEXVKeq2v2yiX+jMM2xONx3dv677Rwat+b0v1t49mnDMuEx5mlDCqo?=
 =?iso-8859-1?Q?79VLm41m/A2E9oOxQEeIPFwsmcFdw48vBRgul/qVWB4udoB+SqkfZuYJHY?=
 =?iso-8859-1?Q?YT4xbH8eD23yBR5uIJ0xsy8FHWLJTnp0Pg4sHZpzbOfblbLtGQFB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9f8df6-5b7a-4ccb-2c9f-08deff9761fb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:17:58.3629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdaoz+TUqS5KUWhH8L+QdIsiBe4OFrgDU3pH+NFbYeJqxIbTs87ryFXWEPFXwnuYemJwPo5IqxLB7xDtm3LfVFXcHy7qwayCmy9nmgLVLVvziu6oYqXyZnmYSxGB9M4d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6867

On Fri, Aug 21, 2026 at 03:13:10PM +0000, Pankaj Gupta (OSS) wrote:
>
> >
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260822-imx-se-if-v40-0-
> > 74fbce2f2f95@nxp.com?part=5
>
> NXP Confidential

Please remove this tag, it is public list.

Frank
