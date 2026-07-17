Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E0D2165EA;
	Fri, 17 Jul 2026 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784292579; cv=fail; b=TRB729VwZT+CnQ4lDdofOuD6HugfVX6ty8RrlQi6PRuJW08qDddpeikTGmCCD7OHKS2wKo0RKWNepXmzJXDyHksSrkrzfiFVNZnHVjdBQhkak59IOIBXgBAOTd65GNDQSQSBcwjUYV98K/kTp0QSuY1K7LJCgPcynmNMi/j+ONs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784292579; c=relaxed/simple;
	bh=tBNBhv3KESEkOjPqH0Ou1ekIfgfBcbIqghKyx4DqkCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B/UFujnpCnv7DZimuMvZdWGaPMWBk0nv+3eyj8EsCTH9etBV2UjhJpE6N/ETtXfAv6ZM0Q8vPtqBVTA/S9O0v7C56f/C7ZhqkaEq2yj+qkQVQzNg6lWn5x7TOnFWxXV+wFC+M7dXmasQ8y/vEo4SPpBx0nrEcRBH92SWkalUr5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gAXU1E9n; arc=fail smtp.client-ip=40.107.159.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gAXU1E9n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVVVV2OJ2rk2yyhB43lR+0XNR9Sf2a7kjC4q2OrR46rvOOrSkKRqX1PhTiy2GVLq5e85kk8jvaTaxY/Qo2w7xxdmWGdXLKgHDw4S24d7bJ2cD+8oSDQsxtT3vfIaPW5KjhS+LYzUKYrljTG8hS8HG0rHm23iWqkIVTrgpCCNJfG831SZlFcJ3R+TNS/Niq2mSc1TPza78Vl3rjMRt0CjM3Y/D6u5CGRcLfy/ds/pFhZColDBb/vigswLIMQgUqKYP6zFTlgh3mnztHqctN6d7fGWJ7gaFnqFWnI6/7BTuPKM65PMviwl2ij8wuwb3vCDz31ft/a5+gJD4fO3+OKWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfQesn14yUsvkEs3rB6Lbe2k7LcEpfkgLp/oVsvn1zQ=;
 b=Q4AA1ViEFHwHGQUyUfuJ4DUGI+KlvB0H/SyZkSi2FnEk3ymyUzy1TeHgqJR1yP9583HVYwExRNsSOpcFKQDWp9IY/EWe1SgqtkGnIfjhPrETVeSxileZ0TFPK/4WKWhQMF9qIdfIXRqqGAadp1pTuYJhULw4snRvb6XpwLpZrCV4tPDN4Oi5BbEOEH8B2F2jPH3m9ZjBOQyTuIJoQ78Byo+q+1CJhnS/e1KkVCIIZmkPdcT3GDzAhuNqD0UMp74XdOvgxnJ8QnDlyHKGfwSCvWbkzcgs25/jRfbtMB9+2CZKjheMXy62A9bS9O+yAcQoVVp/qDGCghKSHPwFdQCkuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfQesn14yUsvkEs3rB6Lbe2k7LcEpfkgLp/oVsvn1zQ=;
 b=gAXU1E9nmeY56in8ouy7mCIN3Ynd3r6vx1YhtEW428UiATo9Fjocyt3oyPNuplPNYwzWpklZ1+KoUTKXaUWROGLxHxeMusxHU7HlfyPBli3ztWNd8EfeJEqvsHD88TMtCeWsLPoXNMFd4OHe4gmReuDBDS8yvSJRV1OTME6pQXU3JTq0cHZWhS4wmxyQ0ck7rZdoqA7bYI+gPzgy6O4/ZGbwQyUwD7E4AlkjCTAalpxQGRY8Km+64Ug84rFmlH5XXur+jrMPYpTBb9OfLmbUMXoNm0HU/nRr2pgfMq5HWiwH4ji8Eo8pri0gxKmawZlCJWXILoPuVQ6TXnfxjKIrFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by VE1PR04MB7407.eurprd04.prod.outlook.com
 (2603:10a6:800:1ab::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:49:33 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:49:32 +0000
Date: Fri, 17 Jul 2026 15:49:28 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/11] arm64: dts: lx2160a: explicitly enable serdes_1
 node
Message-ID: <2236nfta2gms555mcetel7ojvychatt6z4vypgwxyeljr2nqva@hjwixlln6i2a>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
 <20260717120635.2118610-2-ioana.ciornei@nxp.com>
 <20260717122225.2D5BB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717122225.2D5BB1F000E9@smtp.kernel.org>
X-ClientProxiedBy: FR4P281CA0442.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::14) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|VE1PR04MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1cc7bd-65ce-4b5e-2076-08dee401d901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|19092799006|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	rM91Q4KEARB3JJBf8I0FJtmOuIdt4kpAqTtROK+cPsemgb4AlfM125xmRU0blIBAMzZvzgi6683r/bcWDRM7DsWLiJ8HJ+yikwXtHa9lUZlMT/ZDZPRJRspIwPjaGVXgiZlKYHJ8/g8qH3lDZsKM8eSaTMQDeG+NANQmn56ablc2+y1oyQ6sc9HNaF2TnFSn6kd20ZEan7E7ae1AAj9shrTn2z97rkR8VqhhnQPztuCMJuRnwWiLmViTfDFKSyIvB0I8h8c4Ij2arJAJv27/Rgvesxfyws8zdk0Ad8Y9dBMzy29/A+eyRrw3NkAGHTg3wL1J4kIW4yXnynb2ewkJgY67AuS1KEaB/BZ2i7v+ob5Ai4KPL4Fqv19EpmemeZy9NXeFmTeiT7iRayPlM2p7EvDk8fejImV6KYsRod2qdJOdyul0bxiFD6Hd9bp3V9yEt3D3CfqJB4GWGGSo06vNSB/xYaNMq+RI6ywGc4ZBWqk0I3DQiY6S2x4+bSzqthUdBd4bBKx1iUUpUc5CXxxJ321kFhzXdsa/4+3KLir+HKg2r4n+DB1dGCTEJLob0mnn/IrsmSHEn3TQa6AW2Cb4oPgA/xhJqb/jWRnfVMZRihqXJvHpZISAouKgUuTLG1qvhMs5CsTHbpjH3xnykO7y94Pi3PFj/HqS234Rf2eNmiA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(19092799006)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+0daa0exVHzetUZFR0x++nAMYRiP5qbpIDRNfXpUz15nZM6OCfT4y1pasuMK?=
 =?us-ascii?Q?peTgQcV6blaCmO+51AqjmVEVjwxJyS/VaUxF/deMdHX4TK20sPU89grC7bKM?=
 =?us-ascii?Q?CkUXmWuJT78MObdNr4BIid5xuFyoFPupnqujs/zbfmvft+fH3gsUom0Td2Oc?=
 =?us-ascii?Q?ASqXshh7mpRMWPvrxzAemDjsYJpmw7RUnebrLr8vwIDSUFhxoVx1rOUEEi2f?=
 =?us-ascii?Q?9wwUh/+gttDSFO7RwVRZExT6YWe2TUD4ImQooq1ozi1g13QlAUmnnGO7xSD6?=
 =?us-ascii?Q?D4opKGRHB4Qkk4Yxo9SCadGkkl98PuywBo/fZszdDsT7lUj29fXeC40LK9W/?=
 =?us-ascii?Q?1A/SFUgoRifyT9ftwAk3LduIuZ1Pqk0wN6ucjdMyU2Y+QfvrWISR/+8+L0uN?=
 =?us-ascii?Q?HLZ4M/CY0DZOxrll7quuCxSKoyGLX2BljUOuLyBZKpONEsLqbfJuzHRb4ANp?=
 =?us-ascii?Q?ulhTpp9f7Y5GzVf8CFbmHRccVa6KZdMUa6LtxHFzFdtp08e1qOt3UD82JViU?=
 =?us-ascii?Q?mQ9201Z34Jibvp7asV4zkXYHoDPDf1by+9Cwf69/36nJbD9H0H9MFoEJC186?=
 =?us-ascii?Q?dbWXkygrM0JBEZzN0a2axUt7zY3Xz6u0tIaprQtjWxjH54PiT32N2NHVIo7j?=
 =?us-ascii?Q?rLWaIfwuuhpn67vPAsKUbfU7LgXfYji5s9xoHUijdeyB1XwLDKRz5ofwg1Wf?=
 =?us-ascii?Q?Fv5JewkhJV9o8zu/E9r5sneMWyGYL/p+w0ieQzU8uo3oaRFUMrBFaatQ5fur?=
 =?us-ascii?Q?D0OqvUKnHWCyhJaMfdYqqixse6JwxUuyT4wua16fv5ieXHQ4eb2B3N5uElzN?=
 =?us-ascii?Q?6GalamrIjagBMro9vqUlfi7qDjTSxcEQ0DS22oXUCCAbqFXdDGWnXD3SfJAu?=
 =?us-ascii?Q?ZHaR59VS9ZPWF0AKHkiEREs9H1kP6ZUe/bgrXXvSEH/Lb9L0UiKRQUghclDz?=
 =?us-ascii?Q?nnIByT9pIup9nr9CXp7pwFTvbm65eD9fDUrghmtEr0snLGEWOXVEd/rGK7CB?=
 =?us-ascii?Q?b9rh9XkIl5BBNtsO0ZfXWGzCppcSKNDiuHUtWFPBh41CsMR4eU284nrji3xL?=
 =?us-ascii?Q?5/n4B0P6s8pukqUcy+uDoIgSi0PvsrTuzsfHqdwpbg0PGRYPvd9W0tufZ5FF?=
 =?us-ascii?Q?Gn7cSipJoKRpB0cJdzfxNWqf4vnCqPhHbj56+NKxlBFyf6N1TCYhk1vWTtjg?=
 =?us-ascii?Q?86VUM7Ck4TgG9JusVPmwIjVhnIfz/YCs7HRxhDUdqyUG9iAh4hPiwwjiETRx?=
 =?us-ascii?Q?wyDN2+5FvtshMtAyEKJphHW3VRTZraGULR5YRZTcc2oQ9ZNxf6y6uoWxS4AY?=
 =?us-ascii?Q?qXkW4sIxu22kZJ6bYbM921+4FLn6g4KsuZCLL89+EFyWOHTYyWLgkerpo8Si?=
 =?us-ascii?Q?AUKrBI9oBAtkV40h4PmagsOVZkI9J3JDJfPvDHu3VewIgCvsEpMcoOqWdVO5?=
 =?us-ascii?Q?XBWneXaBSY2+NDK05AOABL2vkscad5xE8VxLltea7FisQp1wrzAB6JuGD5CT?=
 =?us-ascii?Q?0w0SOH+shpX4mdgeOpGqTJSn7bHH2ZvhQj9UIHteu+mg4i4jh8YrTDVFzIe1?=
 =?us-ascii?Q?i/3YHJ5rQTGhT/vR3aW4z/l/9OYDuZ5yYkV6qi0eo9Lyi+veOSMCBEC7NJRs?=
 =?us-ascii?Q?kIevkGVn7VxVpA6s8HuVN1ApnGygSFVsITSef9VpTHS4EPmZ980ahJeB6C3i?=
 =?us-ascii?Q?IH7ZmZL6MYYwoFj2zfo742V1m218Ffa7lD50qyLUKfr1aaolLMeiQ1zmHjmy?=
 =?us-ascii?Q?HkoYWXfbgA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1cc7bd-65ce-4b5e-2076-08dee401d901
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:49:32.0912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRonhScPLz6Qs5x3Y02ysJMkn+Fsm3r6VVg83YLdJ7319szvEdW5VTFllpG4+hSjkwtHQBszlYDBKNBTwRE85g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7407

On Fri, Jul 17, 2026 at 12:22:24PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Incomplete device tree update: the patch claims to explicitly enable the `serdes_1` node in "all board DT files" to prepare for an SoC default change, but misses several LX2160A and LX2162A board files.
> --
> 
> --- Patch [1]: [PATCH v3 01/11] arm64: dts: lx2160a: explicitly enable serdes_1 node ---
> commit d3826fcfc7d054169418a33dbec45e352c709bff
> Author: Ioana Ciornei <ioana.ciornei@nxp.com>
> 
> arm64: dts: lx2160a: explicitly enable serdes_1 node
> 
> This commit enables the serdes_1 node in board-specific device tree files.
> This change prepares for a subsequent update that will set the default
> status of the serdes_1 node to disabled in the main SoC device tree.
> 
> > Explicitly enable the serdes_1 node in all board DT files. This is
> > needed in order to be able to change the default status of the node to
> > "disabled" from the SoC DT file.
> 
> [Severity: High]
> Does this commit miss updating several other lx2160a and lx2162a board
> files?
> 
> If the default status in the SoC device tree file is changed to disabled,
> it appears boards that rely on serdes_1 for high-speed IO (PCIe,
> networking, SATA) might be left without functional interfaces.
> 
> Could the following board files also need the serdes_1 node enabled:
> - arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dts
> - arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> - arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
> - arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
> 
> Is there a reason these files were omitted from this patch?

This is not a valid concern.

The above listed board files were not updated because they are not
active users of the serdes_1 node (no MAC node is currently referencing
it), thus enabling it is not necessary.

Ioana
