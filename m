Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019067;
	b=W3/p4QrnFqptAwlEu0KienzdLO1lGzUssOelO3kF95QjEMzCzO9jSclwEybnS8Z6oROt
	 ChUIU/xOpxt9PJJ7T4NpCYkxIka7JA+s+wUSepNAJMyDyNIx7Y/qpa13bUjb99PfBQGrx
	 NenydrKP0Qu4961muM2m8dIB0jHDT1Al1o0CpuDFnrisxWHU2dLB69ACpdrG6loeLzEPs
	 Y7gFV2qAjMJO4/nvOwcZETs8ts7bLtotQQQp1cNEP0hTsUfi6MyH2prN+222VgaREl4K3
	 JDp3bLIVAjXDYxPAx4Y8kky6+aTiy1kZzZySzsr934GZbUXG6eTD1mfFouARwZAmr4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019067;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=K5+PUQVXvibepomb75g2zHyM919jvYRnt95kyCGZGE4=;
	b=SCtls+RIEmBPzKD1W+H/znwlK2i5HZp5iW30qzHGzuG/S57e2zhz837LJZc8gzmoIeJN
	 Ak55YD6bH96Vabl1uyvfGuJQq77LpSSQGhA2aWOeVBHSRyA+3Z031zopqasyjEhvmEKM9
	 Sb+bKusnXbPKAIyGfyR8LrWNvc6hnUF1TmwsGVu/LR52ZRn//2yqj7e14jVvlC8Vn7mCp
	 ozOCSeYxPiVCZOZulmZ3jQcrcbP4Z7VCyPCDE+NNfvKWPjn2E/YAO10DovwR0j+1yUqVN
	 FwLOJ6rTpkuvaErrSb8E9G9NfPGjiM1D7Cv0/EJUdsxhOBm2clvrE5KgeVMaA4civMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xP5N1JJ8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.3
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC560A381E;
	Wed, 18 Nov 2026 16:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5BC560A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xP5N1JJ8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OX6+wGD4+/uw5aD2XTL4Hx87dexfP98Q4blGyKZ35PKBSHIltnBIBQutp3PeR9FJTZgs/HFiVMpu14PYqfqvAtlhvMPuk8a6OTImR119g1YxRKq6+zEK/eDssSBN82b99OFtxjsFaOTMBWUYHO2Vk1WqpbZond7sM4u8cNS1fG82vqwX7xA8lv0/UsT+3kEgr9J9ujx+scgmLPn/Xzet38AZIAYeBRnEu07LLf8tlS6kk6MVG3P5mkSCBXl35rVhklnKtD1xB0mvQOUJjZsHRwiBgiIoae6HNxtgKaGKd14QdhTWVyx97JQp0Qyp3vnoOAApJNf/U64l9rvsYeEiDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5+PUQVXvibepomb75g2zHyM919jvYRnt95kyCGZGE4=;
 b=dICkIOuBZVXvCf/nQ0dM0CsLaf7ggspghlFT/OBa/MQm1gXIS/qtotpp1MYXz+kS+JLXkBJ+prXIdtG88FwklKTueaFHBALBWMsS9ETwR3oZhMTFChs0ivZjSqpfRFBDKGZRJ8Xtjsd5qYae6wcRh9MB3dM5/lQJkZFy6ZOhlFVT3HmpCYekq/Rf4IDhwpwnjBtU4F7I2ZIwCchlcuepg9j7fyRvhSo5CUHcHZRMyjGYUI/tJ3m1PgIRnSZ0Ml5XNpKanf0T6cXhYlwoOmbvJJYqPscqGYprZUx2sjXVMDuRmrAL9YV4iDsOAiNTpgRz4Y6B39wUIEZyZtaYRXE6aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5+PUQVXvibepomb75g2zHyM919jvYRnt95kyCGZGE4=;
 b=xP5N1JJ8KPfqKONKFDz2GjD+vqDJB5gTtOteiX5qBbkBiHPFV6iMMbSaofZzCMQjeYBQAwtonn7Wx5KwJj/0M6rVtvUPcbYcGeimOcKOge56N37DmK3Sc4izr1XBnUFhoTiWW7FPSbHtyOHXdCPCleBVlzzCP7gleUKQK0FdrnCWUjKLEZ8ujBgI/FObfoSUbebrOGV9cjIF0TrAm7yN3mkYRGp6SXCNLp4CACT+oWGO0gz9qCklaV9vOxO+H5JQtIZ1iTW54lNOyTBM65sZ0a6pYkn2zMuAY4zvZOIO9ADZ5LYF09PkfW8MeYTc881l79vv8xwNbkd67vU+NtA9VA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMDPR04MB11679.eurprd04.prod.outlook.com (2603:10a6:20b:716::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:24:23 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:24:23 +0000
Date: Wed, 18 Nov 2026 10:24:16 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx8q: Remove undocumented,
 unapproved aliases
Message-ID: <av3RME_CJPOuUd60@SMW015318>
References: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261117133842.245262-4-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-218903@kernel.org>
 <c3082671-9d0d-4a29-9e05-17ae9d4ca997@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3082671-9d0d-4a29-9e05-17ae9d4ca997@oss.qualcomm.com>
X-ClientProxiedBy: PH8P221CA0050.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMDPR04MB11679:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da141d7-5266-4712-b9b6-08df45906824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|56012099006|261022105027099003|4143699003|11063799006|10067099003|261026140227099003|261026121527099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nrPOrdYYcq8J1MHG2lqcmCkRczhMM1s4g8Q6SoYobzIoV+wZB+KsUNvwvJLqI3V1tUBg7dJH9ewlrFqCtjcL/pZYGL1zdx+P73a/ksB37R61xt0vXTFLUKT5lZahWQYGuyccLgsdzuqMdn06sYzij3gPsU6owF1CDUsa6DH9nOllkZv9Xc/6+pqWlTcN5c3lrOtEDOXOEN/Kh2XFd2QtqKJSyaHJCaWt1L3f/U64SsgbyAtYg8euOL/HGCHl2OLctUqS1ZpFAtZwq8OxGIShmo5jzilyVhRAI+meU/x6RP+E/HdA8uUfs05KnUNBcd4/hwdLsdKjBz+cSGKJShvBsS1U5uKi+DfdW93WXmOvsHrVhrSehra0aTztEMSAiJXLY1OtYisVWtG3i6x9sMpsI6IFK3Thy/K45tUR4ncgTBit8gPH61hWabjeQ5vEK2iAF/2WWlq/ghojJKP7Tqc76gL6TyhraKl9LWxdZV3lmgbMzrabd1vbaHzhpOxWinZoNLTxT81AcwlhonjlVDygFZJf3V1pqH7e7bKBLqHZqF+41CxWnxqoKlb+Bn0u70+XZDYcB9SmjZnqWbj0UOYghGFzYXmzkghGLidQau43ONJ70Wy286jFE5GtDV9Q6EtmRTMHSwxfFfrYuHqhSK4rPpyYbEmEvk14egqs/HCMBL4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(56012099006)(261022105027099003)(4143699003)(11063799006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uy7bcxF6w5F3Aul+GcJO0l9rE45R0WALqfSuQoNCILZBwLktfgHilDPAW9Bz?=
 =?us-ascii?Q?q2i3GLfNI49b5Tb64UiU5aInHJcJudT3kBYKCWJD9yaPszo1YDo+YsjomZGT?=
 =?us-ascii?Q?+0NenpInie5ywvvFFpF+5w7uZArzf6m/OPoRLRCnVJM+v/FjjBjXKFaaMJYJ?=
 =?us-ascii?Q?uz3yx8XYh0mqmN96ryU1F1bo+vfRgTKFOAnihHOPYrrvuXVrCJaarBcBitZx?=
 =?us-ascii?Q?QTsAA4iDweCdxUfBfGDoplg3qWZgDmJu54CY/P6xyydTv3dI9TFNFMKAw902?=
 =?us-ascii?Q?Z+givubWcIScl6C3qmte+OHKj9ub3QAnBkiv+a7dm6IQ+fbP7JcjF4AfUanU?=
 =?us-ascii?Q?4RVqUBcLlWLQD2SaqDgLx2Ehnjpy3350wzEsFyf7LiZ052aO3zVNMl1jVg7f?=
 =?us-ascii?Q?ricpEr3EGJiz5OVe3gNYwVCcG3v8cDEV9T2GktUgrYwfegXxMdnv6t0YKlGb?=
 =?us-ascii?Q?p9nU4MZ5T5L7TQee5R9uypMCVJurfbuijWtZUtvP6QvaPoNlcvP30umSEcOk?=
 =?us-ascii?Q?2KVYPQIIc8G05IPbq2clYZS39uZ/IXH9+5YAETWvmztVJJ/nZd7ow9/Ulcn5?=
 =?us-ascii?Q?JNvR6ESnAeBjqrI43Vh30YniyujbtdojW8XdZZC5Gm9c+5lOcTcCRUIDOjrI?=
 =?us-ascii?Q?E01T/DDVXsYlzivUqWCXhfN0R/B/2BZAA5CK7mCpXol+u54fXmtA653mtYNT?=
 =?us-ascii?Q?4IqtiFGNU5IrBpiedW5LK8ArVROwwqe+st4N3u1mRGsMO+WQWFewq5wdbw0E?=
 =?us-ascii?Q?AQUrKpQKvJeNyPImwQZYPEmJaw0Ezj9M4aBCf+Bk4luDWGtsbf1retFJeXoz?=
 =?us-ascii?Q?6C+vhLUsfKJRPQyysY1Tcg0ldrCJqGNGuaQ2uwmRYtimFQSbSdwVbWqA0uot?=
 =?us-ascii?Q?2Sk+Oy1uPQ0oDXFj9a2hHXBj5B90R91AKeDFJsoxhygKOz/wgibOtvy1ppvj?=
 =?us-ascii?Q?nTSUP6w8OQxz4h2cwNUw84TzZCQADSMifJ4S6BrwK2diLrnhxGTFf0YqUC6A?=
 =?us-ascii?Q?CU1iUWjBr+8Eowx4m7GMbvZ4xBzXKRLoxJVr51ixzXlet3JoUN1Opl0F/0JO?=
 =?us-ascii?Q?uKbm3Ryjkpbi3EK0j7JjfCwjDyzvEgJvRGaC8LxFySmbO4ed+A48TzFG3LoI?=
 =?us-ascii?Q?lZi1FngycQVNCHo1MOBuWsX8r1S+uZopjEwJMfx6r/DM8ze2hkSW3peNhcip?=
 =?us-ascii?Q?5oBDvb3SbGq2t/SO1mMKfI+iJaQ/aDwe47QpQkL87KMconLQsyLdbY6xqpM8?=
 =?us-ascii?Q?4EBudgg/wDUu23OezqYDPRfo+Bs0w68ok0lhlDU0dGYLNUP6Xy3h85IGNqtG?=
 =?us-ascii?Q?xlngXMkWMd1oQJ01pR6tcit7qOWZzl4311JUg4Kr2FAUnK8mMNv7h8FqFbUa?=
 =?us-ascii?Q?valKA15C/CKjFH++6S350IzmWQmqzoApmo0S54K4bogp2a4eYeK6lbQceMG3?=
 =?us-ascii?Q?6oHhkmEs4Bkvz/zKEO4sHOpv3gn7+Dkcy16XZGCyQL/KHhXdlpx8FwLKAydM?=
 =?us-ascii?Q?rnzzGDt2YYSsdLvMKxPwqBgqImeiibNtR5z/1JM29geX4IhaVDkPF9s9M9Ae?=
 =?us-ascii?Q?APpGSUul7lod12Y0wF7YQ3W/HQPaLVpBgmgjx9QDz6iIPqT/PLs2zI6AiBNo?=
 =?us-ascii?Q?CbipwaIEjl8jT3iJmmvELW3gtGa2VLcDkHiVRx14YwCUAfeSJDS9Hfu3guVA?=
 =?us-ascii?Q?vcH9/U5ELCeidPAgfh3u04VRQLg9zrNHq6kpntMDshCx4lwJFg+7z95b86jQ?=
 =?us-ascii?Q?h1pqYc5fGZqE6UFvoSXzJK27IhtElPm7ClgVaEp/t1GyZPP2VT56?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da141d7-5266-4712-b9b6-08df45906824
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:24:23.7530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuRNB7bJLbIFHAKJYkfvDqWF/tI/nCUpWmqQfOVTuzkaIBGQfWML6vsUwCsZlDc9/i+9s4+t2T03/e70AOIEJQj2DHlx6L03FvDCHNXTRt+rtSFtJd/6+mrWZA0823NS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11679

On Wed, Nov 18, 2026 at 01:10:30PM +0100, Krzysztof Kozlowski wrote:
> On 17/11/2026 14:47, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [High] arm64: dts: imx8q: removing vpu-core aliases breaks
> >   vpu_core_probe()
>
> That's intentional. Users should not add undocumented ABI and rely on that.

This is problem. vpu need know hardware instance ID to talk with firmware.
What's prefer methods to fix this problem?
- Add fsl,id ?
- some old platform use "cell-index"

Frank

>
> Best regards,
> Krzysztof
