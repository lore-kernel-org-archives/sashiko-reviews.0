Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013061.outbound.protection.outlook.com [52.101.72.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC8305665
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822162; cv=fail; b=hyRZPWxcGoqcWIEw/onr8izOcE8VogUcKSfMIBzFP9DNalJJG5Dtk6K/lKJWhUMOpopi15+aHUm9c53cIaeA53RZtp6VnEQZgSiRg3WNsG+3TSXGW7cWDw+vR6Sba/S5nyGH1erOLVX4dD4TtzCEc+E6CUB84KhYghKUOTNzhBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822162; c=relaxed/simple;
	bh=RsVWIR4Xj9gl6bP3z3sHYXlMIvtmjC2MrHVWx+xX96k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fLyO+6JfKX8CzMvzilhyVePBg3KZdf77BD7+vmV2U6ZSGveaEHF3ozdUTZQTLsc72X1X5VLCaJZaT87orVzitCno/1ELKM0loiWZYfa6g6WZAV5EkL76eBd3LjfnqLr8YRLpATOYdgKmyAV2+isbh+HvmYEq2JwtBNOI7Fa9cDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cKrUfbwe; arc=fail smtp.client-ip=52.101.72.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cKrUfbwe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0xFTD43Tw+ca65HOg/g00zCc18BnI/1bLrcYdN/qrl3OMmG5SuFfiFdaBaRBa7t15drYHwcLFiee3ZR/EMUyvXJRaCXD9Q7Sg1V8LWF1U1Oxt8SNizvK84H9T/QgF7DP7RMQbs0/jPtULc1qJVc7ZOqJvEFMl42FbKfA1s1rueC5zSbusugYFM0yfSoinzz5OL9M1xoQ9T64d0tkvW8LKdWU47a9ZQeHRq5CSc+I+x9v8wZGuXLvwfg1McoDkucGvOm7nwhRB5MUKLxn2OsCTAEBRTKYFpwx3p6XJmUSlXqibsevaKKa3Fa3QbaANgPJMhIgouBMX/YXRladmMv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8JoyLI/oyeQZhAkuRUO/U294phsCzjgMO6fpIno+7U=;
 b=nHtDfnXK+KlFrXWg/tNGA7cxNn5M8Y8X/e3XBePeFX7SWqPBcpJgnFAREed1qi0JoTe9pDCuawkFSB/+ljoRSQCpaKiXVkH9V3u8LxwHtmdsok4lBDusHVGoGTi62gCZPDI9PkCUAHqwsn2aYTK7sxj+UGKfB/aC3oVBNczqGhlI/M5k0YEWbVLQ9QzHFFNRMve40VPz3zJ+uy8bV7CCUHjZdlBMl2P7QMHHfMDgkeMEvUxbj/W0HakohvbDIp/5iOOO6dPwgGfsq7fA6SGVWf/tpfdT8ecjjgSpMyTiql73OUtkemjMOBkOglZoWfVxPnm/o0F9QHxIv/3Vm06nHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8JoyLI/oyeQZhAkuRUO/U294phsCzjgMO6fpIno+7U=;
 b=cKrUfbwezohgShhHjQt7Xi2uC4bfCMk5STYCOCawXrRjnOeW8zPPrQb23OeDAwtPFN7I7ozp5D5swA4xyKSC/OB4ToYNMRbss7MIf10ukPKITyPrihPGI66SgZziw/2pBBxA63Hqf9JkaLJSgk0K0wcHXIPW8CJ2N1Z4uQJHN4NukNWI+zRS1gJgdQzYATqO8BBNCQSByk3lJPDZceZ9H7XCzqUwgqUwhMyjMgWAPZcii2gYeU/q5HBVeCrvmyeW0j4IsfPmKZ2C4nyY2DRS/v5AuWKdSKC5pHLRnK5p20IhA6J0PkPJGcLevxIhiA181SLm5OVZZHi499dFsfoNdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by DBBPR04MB7786.eurprd04.prod.outlook.com
 (2603:10a6:10:1e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:22:36 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 12:22:36 +0000
Date: Tue, 30 Jun 2026 15:22:32 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: ls1028a: describe the Lynx 10G SerDes
Message-ID: <a6j3ezvmcyfbd6yut7gyqsgnj53434nyyykncfnnnlhhi7m6ta@px5k7a2klqka>
References: <20260630110459.516364-1-ioana.ciornei@nxp.com>
 <20260630110459.516364-3-ioana.ciornei@nxp.com>
 <20260630113229.66DAD1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630113229.66DAD1F000E9@smtp.kernel.org>
X-ClientProxiedBy: FR4P281CA0272.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::13) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|DBBPR04MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 5424a9b5-1260-4a83-804c-08ded6a244ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|4143699003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	whQ7QL9GzEoJQLhpjP+csy8zMfABYSKBjerPGyrUh/HdPMfIs4zM6c70oqyy8q0sTerN5LGMvRkfHPFl7g91Meb/AdbtJ5qS6QtJ3tEZ3W61FiIDyfl1uLWWlLo0JlRcTmlzOaP87toQ1OD9r6PKrF68uH1cO/+mCrKahZ7Df3BRiOMf0Un1+zNBHUkApwXwIbnLn9JV6ebWxCFzoFXGlLAMWqxW71DhPw3iA1oPpztISE4rzMI/LQ7V+QggUK3cBcNjhRJMHBcV80xsRQvqs8v3VcviVG9HLFxWCWun5FTwDgDtqINkyzlkclwnL/qi4rnU+MEDMWWMr+r9GZDSTZZk75T67LTbddfNWLGCnE2+76xV1ISkPl+J5mHODXeCXcDiQFO4mBjGseDVFoLQ45px1uRBjlHD/wuttnD+v2+wvcefmP2vtRhMkzPmTTV2DRnzwipYE8Y/DfjMNTV5k7OY9tW2xWZYgkofuUZ8ORiEvGa0nbo0sutkpGKTagF7h9YA+KXJ8sHZ+ZESYSkP8mebFNt0y9f6WEMuXMkQeyFNoa/2WL+Oey0QX6Rh7eUC7EDtX0YGqkllmeWuCWqe/MkHs+pMXfkhROtRtnFifWkqCcjiCZv7ci5OLgm6e6lUybcqeghpeNFsXOxpgJEfMLvA81YcmwluyeEjF1Kwphk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NrvCHGHVX7UJnBk7I2sXMWbhiDDwU5DGFaaMCF3p34AIyfpbr0DZPzP7tplY?=
 =?us-ascii?Q?wUBov7T0+59qBwMdlExa2CBrkwDf4oy/X1XpXuwsm2kWyFwUjlvUsVIdh03W?=
 =?us-ascii?Q?qNzYyUFk8RSGGMdj4fYnlJzOzEqL9yWLF9qMOypLnKAttgYauabuvvkoR7lB?=
 =?us-ascii?Q?2L9PSXIAzpFrRYYvKAlqyG8whxxHIVq7JdJV9yb57nWcMQrsgNE1+Eseb2z9?=
 =?us-ascii?Q?Isl27s9Us/uHif7Ierb40GW3cjfThblDaz0Mt2cFMMMSuEB45LcZz43ouQ3d?=
 =?us-ascii?Q?KKBb2E/eKgyEGha8wHD5gvi/9znNvlRJliDVQcLAr4FIs7wMQ/1vFGHpNSPv?=
 =?us-ascii?Q?VSYsFLTORqqAKqa6Owz+PF+VGf4fSNp5sx/XPjvj9khky2t1Ov4TTOkRl+FC?=
 =?us-ascii?Q?Zy/2i2MhwQk4fq1nXqkXjsh2+e6P6HDwNtlbztA2QjyG85J8kRauhM/PV9FT?=
 =?us-ascii?Q?tr/NhKT3EIxo1OMgLgkECsejmo4CT8rZbYmW0zGQNhOwvhCWVWXtztU7Zvah?=
 =?us-ascii?Q?YffiqPEELtORz5MY+IrR7NC8/4YyUbq2aIDoCObinuCBUL9lCkLvTt+RwgeZ?=
 =?us-ascii?Q?N77rJd0LEmaMtgukr7GM76yLFsOclMq+cZlL60ULQ/PP6CZrEBUXjuDJ23zO?=
 =?us-ascii?Q?Ta9P8bLeIsGPGIwx1KoEocleuASjuEUn994S1xsqO86MCxQqN45qkJ3KGTmk?=
 =?us-ascii?Q?00PsERl29OaCd+WcIqnE+qbMFTWA4FYKxBPVZCzNraP4PJpG4Xhe3x72j+4i?=
 =?us-ascii?Q?zHyAdkKcKihsuhAwp6SDnzF/7LjDSs0w2KBYP/8ake/Xsq5Q+MQJqq5PdIVg?=
 =?us-ascii?Q?FYZY9YoCkOHnRNojQAFpT8wQcovzYSqqOr8OzAHoqVI3Xa3237jOf0+12uf+?=
 =?us-ascii?Q?rlYu1j/LUDIAzWMiwzCO9nnIU6ZD9VgZHJyGsWp38m6+k5wzAHfvRIxNnW1Y?=
 =?us-ascii?Q?czdOF99i2gvVWR9WDcKXCHMC9gYGRo2e/wafxNk1eDyHy6c4BUTa49lHbeJY?=
 =?us-ascii?Q?UbY5PaZQ5TVvzXIoCoAyptLZU7H6WfMFP6H3QkoPt461oBjLgr5F/ruZI3De?=
 =?us-ascii?Q?9Cx12XhDprp3aeP5kZrL0ZNrt0vY8hqCIbESAfFqNpibwjf3chbJmLdEy678?=
 =?us-ascii?Q?9NyosDFiFVLx6X6DiYlnub5D7zImGNzC/XZ2BBL8tXjk6lQ3aY//gAf2g3gs?=
 =?us-ascii?Q?iekv0kz6aZmH1KmhviOGl+LCLygbMnk2BWGJXHdvCssRfcnMOzxf85+sz4aH?=
 =?us-ascii?Q?qxIq65GhY689AJoZ8sEBySDJ5ARGZExmFcKOW3f53cm0KJPuRgGXEcuzxrk0?=
 =?us-ascii?Q?ngU4k5w9S4oItLC7IZdu+LzB/VsD2yfGN5DtX/6Zsyt+c6u7FbQ4IRwZJosU?=
 =?us-ascii?Q?moXBLfSWbFZP+lnDnc31LyCncNxdCX8W5zKxARVGyy8xG6u/pZ3nbZXGE0TP?=
 =?us-ascii?Q?S3TwrcDN6bJqMaIupRxw2ewuz/urJAY6SMr42hDQAz4dvqRWQ3TRKTwYPeeI?=
 =?us-ascii?Q?bcMtzcVl/xFuTc3v0VvgcFC1CMs8MfxPnazwbe/JEJLzmKBh+7hVGQPDavFo?=
 =?us-ascii?Q?jaLgUTRMDqZx1TjTAGvF19ybQgAtnYW3bKtgNo+HG4FcmaSAJYPPYhxuGx5N?=
 =?us-ascii?Q?ahUrJOgJjr8N+98GphXOLOlutTbDFdx/8V5nx8V3jHZRzXQO3OouLjX7UU4D?=
 =?us-ascii?Q?SMVBSoPHR/x2vdAsWrDoi1kjF89hYm7Cd0qEmSoqcnjCyYm3PpYHp+bVLcQ8?=
 =?us-ascii?Q?E/rzsmZqpw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5424a9b5-1260-4a83-804c-08ded6a244ad
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:22:35.9589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOEa3ptEy4DYXs64r9n0xd156/xx5zzteM0+5lzpm0kCe5xkEfsop5q3My4mwo2LKMzbyGOiyb+Fl0DwOZ/Mvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7786

On Tue, Jun 30, 2026 at 11:32:28AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The `reg` property for the `serdes` node incorrectly sets the region size to `0xffff` instead of `0x10000`, causing an off-by-one error in the resource length.
> --
> 
> commit a39aeb25ec050b4deb66ed84479cc1400f6ce47b
> Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> arm64: dts: ls1028a: describe the Lynx 10G SerDes
> 
> This commit describes the Lynx 10G SerDes block and its 4 SerDes lanes found
> on the LS1028A SoC. The node is left disabled at the SoC level so board
> device trees can enable it once consumer nodes use it.
> 
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> [ ... ]
> > @@ -250,6 +250,35 @@ ls1028a_uid: unique-id@1c {
> >  			};
> >  		};
> >  
> > +		serdes: phy@1ea0000 {
> > +			compatible = "fsl,ls1028a-serdes";
> > +			reg = <0x00 0x1ea0000 0x0 0xffff>;
> 
> [Severity: Low]
> Does this reg property specify a length that is off by one byte?
> 
> The reg property size field represents the length of the region in bytes. If
> this is a standard 64KB hardware block, should the size be 0x10000 instead
> of 0xffff?

The size=0x10000 would "fill" the area until the next SerDes block
starts but the size of the SerDes block as described in the RM is even
smaller - 8KB. I will change it to 0x2000.

Ioana
