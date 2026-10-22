Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792681993;
	b=KLcpA5yzy/rfS4VPLdbe8479ttSgFTY7+AR+gz/bovSYb3LsiTCs2Cq+r09DG8aXsaTz
	 B2g+mW0UEKGgK+7VzGAgvkO0MWRIE8fbp212VLgZVl2D+Ss7f3FOtrjsdNDQ45wi3lmVu
	 VH7K4tRbuzQPqgL+xH8bREZr6H6dHvzTLG4Gzunom+IlAIQ9YwbBp9waKlkv05gbVIPXG
	 SfbPYtZ0cryYZjBnkhQ1wNcAza8uNdh8zGgJDhbdg8vrmkp883KfsOb5cz0ITZQIal8i+
	 dyzE00ip6q+CmFNjM3BW5hRkl8z3gEnDuSLXntT8dK5f4wfFHFyP7IeDyGMhqaY/8MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681993;
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
	bh=fwQYeWA6WpfckKPMCUVt61tHDomt1RSUjzCswbbYC88=;
	b=l4wrS5fIttURW78EbqcsqRfZODg1pQ7sIRCy9S/6G8lMvjbkkGEZYs0s/1NNrSG0N5jW
	 1sLD9IIfB6/uxRCXECHMLV2NKmPHDLBUkjD3O3fl9kTlE7bb1U1r+nQrtCQxMDOki7WNq
	 U5YFov2SCjcDLw3tsCLwBOGPceiebjiocMG6MlSTW/4K8qFPzCiQEsY2yi2lDf8nNmOwj
	 Al8ZMjZ1xGr/iXrtvGqSP7lZ48TByfD5Fk8zxrrLL/2+ww3Ml/SqoT8r7jwhWbuqKNsIS
	 r7Cw3TWjjxQ7DnIM21WGM6FtYEa7vEYBGy9ISI6gYHGngxJbczEWoePIAe8Th76XoAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EN9iR502;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.71
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2907B606ACD5;
	Thu, 22 Oct 2026 15:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2907B606ACD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EN9iR502
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQtwT+XyGk6Vxyj5hJHi61F0YsxrT1RiMO60c9KWbrxtPhwmTh7Zg1akuHwZlU8gtndGP/LJ8BVV3lQvyBmmArxi50xAs9QlA/lYjgqjPnRy0xmYJntxLWdKpb5M8jYHJ8t9HTI9NvUG1RZB4e4WzMxf7nqzF0xQuhOPaaKX3qiR3xipKbM0JKrugFrmYJp/Y97hINfmgNgPSoJP0580pMSbx4FM8QJ9EeVHkgc9zToR65315mlhYaCm9wHuty7SQkOsnDHwJ4JuycKxvsCeyxugGK2T4im3aCgzsMzqNW5zU7xr7trtokxs3/dAVWX3gSo/TTEzCbFKucvbue3dQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwQYeWA6WpfckKPMCUVt61tHDomt1RSUjzCswbbYC88=;
 b=BZYWcmj8jIfsnXsE28pLdOuwK7zjIvUdybV1MtjPWDZjqhHLJiw8QUXp8kchqS7GYdu2Iqoe7yFqf0eQzSw2RnsSj3Fb0usCmHbytGuKjBy4lK009kUgn8lQBXWUTQM2UirCjcDSWcgiijVX94MTgm5keDy4TWecoKYc/qdW89jKCDJvgHIIPNeflD/r0yBA5mycEY4DPmib8XT25yqbXNW0q9T39piWHNdgQHM0sxsSv+H/qyZ28Ot9QHAda/A+8aWAMGwbgstgbDnP8hwnXBPl5iBW+nwCvWYJqrhN6qcV7Ok5ZfNmnXIgC9z7jzuT2sX3AmoucHa/oYkeXcOdbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwQYeWA6WpfckKPMCUVt61tHDomt1RSUjzCswbbYC88=;
 b=EN9iR502AZIpMOkS7qWCGBuP065S0mGui5jOHYdlNtBV373m+tLEtsEAb1pNYMUQPd4Qtql6EwOSoVv+JooiN0RrJPwb0FJxGRrRGtbrbsRXph6hON8WDnc+0h8Z9vTDJ9/6Nxg8aldVSS3uiJPHP/QEHGPu7m9AHepZLJRakZ4z57dOTwwRyxhze8SPfk0QHy2XR4J22BhOtpFPhtejDiKEnBH/LBdJCGe8GXO6cAdT4cPa4pGVU2EpzjMkNKb4tQuoAYoFT7a6+fIv0wLfXZUr7HTwM/s55GLINpNkiS+mZh/zTYxTyJjmYRsOlcVuodjBqjd1AnhTS9lVCFCcKw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB12097.eurprd04.prod.outlook.com (2603:10a6:20b:747::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Thu, 22 Oct
 2026 15:13:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 15:13:10 +0000
Date: Thu, 22 Oct 2026 10:13:02 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Petko Manolov <petko.manolov@konsulko.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu
 board
Message-ID: <aton_teIric7IKX8@SMW015318>
References: <20261022140244.3476844-1-petko.manolov@konsulko.com>
 <20261022140244.3476844-2-petko.manolov@konsulko.com>
 <sashiko-outbox-181612@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-181612@kernel.org>
X-ClientProxiedBy: DS1P222CA0023.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:8:44b::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB12097:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e3752a-4a37-4583-eee3-08df304efc2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|261021121427099003|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+ksM/I+wUhuAOPSiHB+XQAsxOFEJ5WpKJYLgr8hhwv4Pgnlt8xkF1o+GHASADA6peatgcvxFIKlylDV9Kj/CqaHvmvXZPZpKmmou2B3pjj0jzf6YItB5SLpXIUcScU9Nbym3MsCKwj7MFk3uYLh6WE0H8Hz0Xlvjmqg1tYhPMmSwc/fkpMLSTaiMJmBYe6px93ift5mSxDfNaOpZHsx/7SSAEDNUXjkSaQasKg6eaS/OVeXp3Eq4cqPh2s8AjwUR6dK36SxFWtswiXMSmrFwRWUeu5hz5KQ4BkvnN6KHnrRdo/S66zOGJvwf32tC8tyC92P+7eUzZpgtTN6A1gcBqkSoiB8zl9sFdRamoFy7NskTgRV6CiDkJCbNRUB/TAzFXXa8FYYb1L92sgNZrOcSUdNZueOnnxCBdAoLoLt9mPN2yT7+xgWVhNwZKOl5rGX0bSqRA6CMLLzQXDQvUs6Nm8SpRFgxsBWBiv732GIpGbMQKKeT/z/Bd9pFFFo1+DKBTjGOAmupbGX/7HGBSLs1gvZ2yVPjLgDmWH7UMoJrPIer51SbxJPBeIxgFYBpA3RBLpB65v9jFmpneKB3GvHc0KBYzvhX+I3K6VLhgjbwhH/67fLr9CfhGZp6gw+FWKY30ooaoN9rELfkTemkg2WGuaO29WqoERMtYiC8yZutAe4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(261021121427099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4iknFGUZbvkbOlfJ5b1AP2COvQCUH6lJDL0toT3WEyOlC2g+7zuDui3n1C7/?=
 =?us-ascii?Q?HSepNSFYZykTZyd4DmGwWyCqJdGowmJ/w3lnVPdSAtQZu0es8ecIxe9tmTxg?=
 =?us-ascii?Q?EHXvH5OmHczL7M9xsb0DGAGU0tN0M4j+9fM9Y6esLVIuVUaDG6ibitmGMIRw?=
 =?us-ascii?Q?8iK0TKRfxNMg2oZc5Fv/jqiHOfzntfbZCwZJsYOzbOAyVXvN5GiCsPlTtp8f?=
 =?us-ascii?Q?Nyyb5dhqz8J4sDsUi5+cK8o9R48bw52RY2vfKB3Z8/sJeE3+hkL/hQYPkpX1?=
 =?us-ascii?Q?42qMOsmc/VDt9UToFBUOTkk5H5C8hK3yNakp6RqKOnQldx3KreyRwN+QZl1Y?=
 =?us-ascii?Q?JAZ4amVO1JIV52r4Sz75fruWx0IP/namMwcWOOwYL1qGdyOltBPdpGIv8x2i?=
 =?us-ascii?Q?G+rEGJDby2TO3dJcvi2PM7/f+hn2Xe76shYAkqt9T3QwTKpWCC2IhL9OtURO?=
 =?us-ascii?Q?I2KBYGpyhx4cAOI7TxOr7zpxHG2gYGy/beSQcrd4WkTtpphllxXOgsiUg2Tk?=
 =?us-ascii?Q?qsQUM8VqBg2YudZgq1E6YjRlfBP3bU2cperiZBUAw2jDz5V/WJpiYKmB4OFS?=
 =?us-ascii?Q?mNFr4m99FI0DHIlHILUBRShr0xfgSEeIaYOvmBoPSaRcuV8ok1JcWQOM5W0A?=
 =?us-ascii?Q?PsQ/lhNtuWiShbl75Ec8p4oxmVpTXKnOIVXmeYTkYji5MDoImWSeToIqiHtd?=
 =?us-ascii?Q?lgYuyS+BdSTlMuIquSySVvTFbF9S8wTFt9FZEgDEelrzurljMjvqfw3HbeTI?=
 =?us-ascii?Q?UVyZOonr2FZGyNNfIP9F22GdisaKHpxgVjPMz048QQf/JK3WP1FZ8JlYUg2Q?=
 =?us-ascii?Q?j2zRuJ3n5yUw1xjEKuFzr8zBa5rwGze9ynkd6LyT4Hi8fYcGQH4w3rkI9D+4?=
 =?us-ascii?Q?3sVjv7nJWlbXPxt5P4AIfGanWBx1or3xwLCcHqmKy7OP2zDW5Yubh5r/1hOa?=
 =?us-ascii?Q?q4fOf0ivA3PRfG1tQEBmGVpn+K0X8lhnEQ+RvBiFxrDZJtrG6wIr3/txalUc?=
 =?us-ascii?Q?Yy3qSuEd3k6ZTXlEtKS6uuVPm2cWcms6dpkE6trL9OnTMvJiYmElDwPUNMtc?=
 =?us-ascii?Q?qh6puNIhQployvd8ZoyfI9At35nSSydvq0iraQYn+2+zerBez7NODsj8I5pE?=
 =?us-ascii?Q?DWN6jATXDISDOUct4vrbcasNzATjJk3C5aWmPTlpLnyS2Ue+/kIhk27IJhpS?=
 =?us-ascii?Q?jMh4YSjgqmk9oXICBY65F+iL035iTkZ5vJ3NNY5fw0kLLTX5FKcfKKCDb6pX?=
 =?us-ascii?Q?1fmRZ334V79lcRkyBYH2DZf8vvpo2k4vBWGg6zxHiroVZ/LFKffKhHatUJCu?=
 =?us-ascii?Q?DCSKBb5mbb5rH1P263CnNF+/T4RfCaS3uU1SByG63vrTObnXRVq9zfZwUwdA?=
 =?us-ascii?Q?ox8aYP/xyEXzXzvV2ASsvVGSL1lwzxz0vNNGn6xycdpRtm6o1VQbgwC/S6U4?=
 =?us-ascii?Q?kwGGzv0Mha6VE1YQ+i1h/CJ7SRN4v7pjAKeBYxTo9izcQ6GHdpvyUy/gNNis?=
 =?us-ascii?Q?9wFhjp0OWLhbiDkTA5uMtg39wOimbJ3KG7hdmGaoyc+/Jr2YSU/9+bxTqzg6?=
 =?us-ascii?Q?9a1L4niIfBTcRwRyMIe6zm/riRw3MNv7EyTZh1BrGDBzsLocyjRxdke5Cngy?=
 =?us-ascii?Q?vYdWY/UOetWSGHCcAjcvqNV8qB/L+7m4FWnf8mpE0mnXGTDdZ5+7QqYx07WI?=
 =?us-ascii?Q?EFfoDUEFW8oox22Bq64GdyYjYzsTgnPxYBq7PAgkwod4xm0boG1Z//bl366T?=
 =?us-ascii?Q?X5Lq9TfHRWjWtbZ3ZOZRyY4NpUohCoAvPuJgQpm00H9fwpv1O9Qp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e3752a-4a37-4583-eee3-08df304efc2e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 15:13:10.8140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EO6bOF3wSIk9H5wuqPNte1bzWfSpP/mGAHyTXwsjqzR/1l1yfLD/51ZhOowCFS9nYYrlexM/br8bTOOpmiCM4d76xGYM6pZsiow/+tRZhHIawgPNeugTzcUgcdeEVemX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12097

On Thu, Oct 22, 2026 at 02:10:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: arm: fsl: undocumented draeger vendor prefix in fsl.yaml
> --
>
> commit 3465979b7c116a128c865587fd61bc41cff5927b
> Author: Petko Manolov <petko.manolov@konsulko.com>
>
> dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
>
> This commit adds the draeger,imx6q-m48 and draeger,imx6dl-m48 board
> compatible strings to Documentation/devicetree/bindings/arm/fsl.yaml.
>
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > index 656f2596e1d53..8f3a04228780a 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -260,6 +260,7 @@ properties:
> >                - boundary,imx6q-nitrogen6x
> >                - compulab,cm-fx6           # CompuLab CM-FX6
> >                - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
> > +              - draeger,imx6q-m48         # Draeger imx6q variant of M48
> >                - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
> >                - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
> >                - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
> > @@ -458,6 +459,7 @@ properties:
> >                - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
> >                - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
> >                - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
> > +              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
> >                - eckelmann,imx6dl-ci4x10
> >                - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
> >                - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
>
> [Severity: Low]
> Both hunks in properties:compatible of
> Documentation/devicetree/bindings/arm/fsl.yaml introduce compatible strings
> with the draeger vendor prefix (draeger,imx6q-m48 and draeger,imx6dl-m48),
> and the follow-up commit 6e00402d882f ("arm: dts: nxp: imx: Add devicetree
> files for M48") uses them as well.
>
> However, patternProperties in
> Documentation/devicetree/bindings/vendor-prefixes.yaml does not appear to
> have a matching "^draeger,.*" entry:

Please add a draeger entry in vendor-prefixes.yaml.

Frank
