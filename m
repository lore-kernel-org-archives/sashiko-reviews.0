Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56092BE02A
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 12:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059031; cv=fail; b=bk+TUg9EN2oYYzgBjZTh/DY+Z4xuuLqUnzL9udNNUA6krjp7VDPA0wNNSX6sIDcJgZ/iwTV75jviwJm59xtECwthfNWKaVrB7luGInsQTegt97+E7K0Ia4D/G2gJ5ZA/wRyhickAz1eS0eBBgDebnSJlkC4jfGPYDPaDv+WXYTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059031; c=relaxed/simple;
	bh=py2fweiAr0ZuhyCo7nPPw1musXwu3sizvu68wy5Pnf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B28is7TzjWyhcnKsHwH0W+ZqSD0H8EZaAlhx5fi6+aq2GNiIAPG+zlHzj5czOG9+56YHENUXdZwjFVS755Quxyjz1EnjERhH0jlWyMYqZFriyB+yq77oA4tqNDgU4E6EomMU4DwHFvlYnTM11o70FuOU8CJOExQn20pxBjtbBF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B6NYqkQ+; arc=fail smtp.client-ip=52.101.69.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B6NYqkQ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpyr7wsQf8zycCxhDItZWmXnXhi9N40Ws2vjmfQMoEUqMTLm9nJ8C0o+JDqEg1MGIRdSt5MPErFjreLLrukdn7sfCLJbukuG2uxVYxp2ASsxGDAaFRzVAcX4Mak6fVHmuRXhEn3HZFYJ0Bny7U5S9NR5hB4eDYHHlc6NiSifY9dbxjyvG1CfEWCS4q2Gg11Fsp2O3ge62DYZykank+ezSp/VAzWqx1LhatW0vv/61EFX6IANsbH/JRKZlCl6zOIotG/q1Unwgy9Ry08pJZUwhLmG5d0detJDYipL5pEZhRfcfRUHacYfTi176lHQtNFT33rFc28XwzQ7f2QJFch1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tnddp4WlPdwnDLOh33frAl42xyO1+ayKOo4z5UbOX64=;
 b=DchMNbLCcw4Pc3CkHxCAvTlbUnRoai8+jJrw4M+uaMz8Cd4aTGmVoUJmUdZBdufUt01zXwMoxf9XnyG3Lrgx5tE4GTzJMIqTn4zVjvFPg/bNFtxq50+SS5oibyHSZZnikYEDwe5pU/szl2pzXBf8AyBZ1QiJkRM9yxB01OjzKtTc2nV9I6wLFBuV+hWILsZFd0RbLAGqIlg4KkAYnvs/DjlC9vX71ASY30tGn0nyqXXoZ1/scbDbk90GIW2ClqvZzCWTnFJ/c06KFmlkpeawrXrayYWy1gQNkTPQvSzpgR58qd3s8jbTD1oNfmT0VhrZqKeeSKE38lnfMedRMhZEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tnddp4WlPdwnDLOh33frAl42xyO1+ayKOo4z5UbOX64=;
 b=B6NYqkQ+Eq5zahs0orBs4+BYILq/gSsfu/DWA4i2WWV26vvq7x9MzPasn+6JdMn7qQrt3i5YXk5+jRu9kAcqkTEbtPv6ODIS1H7IrSGj2nO6MCC56j1I+dEMEDuNPBunRKVL+KZt7I/cI/GY/SSdCnvs7ZOcHidXpi2FcSzLZi9e4aMqSc0KZIH3ZbUw4kq+cUGH761vfnru+BrXNpk64YtuvotD9v4TCbGhI6kC9OASHICwviQriI6Rp+8w2BMR+8lo/kXEwyllz9nidyBJzxrxoPLEk+F9w/sSNPa+Aek8UpFnKXi0nUCo6H+wTDPFkF0chnLnZ2M0YkdMpryrmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 12:50:21 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 12:50:20 +0000
Date: Fri, 29 May 2026 15:50:17 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
	olteanv@gmail.com, vkoul@kernel.org
Subject: Re: [PATCH phy-next 01/13] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <20260529125017.ifqunh52gdzhthdg@skbuf>
References: <20260528172404.733196-2-vladimir.oltean@nxp.com>
 <20260528174044.EBE8A1F000E9@smtp.kernel.org>
 <20260528174508.bqu6ks4rgkysvgdg@skbuf>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528174508.bqu6ks4rgkysvgdg@skbuf>
X-ClientProxiedBy: VE1PR03CA0014.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::26) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DU0PR04MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: da81d237-06f3-4ffa-63f9-08debd80d7b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|19092799006|366016|376014|22082099003|18002099003|11063799006|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	nqepup6Li/6pPMG+jMrhrZYwlr0b+OAbtJUwUPnD5MVXctr63O8l4FTjBRenF607xV8ghd9WWkGafgnUVJcL8djq9n7MrV+Ju2vbME3Qklch/QDmlGsrnA9vGj+QbO2QGO7PZ4Oe+Yik8eN4L9uDOdaWP5x+uVc9c5GWhsQ9U246hr5E2tSIxJRLbUUguUK1229eC6bWzR8XM9bLl3TXVx+NpOcPWY9rmJMgPHI3u4bb30ycwB309ScOmGfjCVTvG9trsOGyQJ+MlJvXnZfVUZgEqS8X3amO6B1/aBA7cn884dYx72Wt8yWVeWdOQ0fsqbiG3AvDri01PSs9+3IwXNHTWfb/u8lTEUeXhwE/L7wuuCckycNSit7NRGxU9uVINxJi9zdZeXy1z6Q2EzopwMFk+xI5x+9XWfl/3jmpWvUpvnA2baekzs8LWkt/44ylI37WR9WuB4L1a/RIpMxvypN0Xj0MSMIMLWIaoFhejj/V+cbhRVJ/vv61VQcwNr9Ilqd8LdLhOmS+7ZzpqzXyWgLoN/jHL2o+tiCBfPGS2rLMruyOZYnKNt0HI0HcEUE0Fn345dUsMHnL3C3ITwtXQPEVb06i4lp4RiYJmd6QgjfvXpRuQpp19lH0IE0MFC3OPpW+w3uGmYlQ2ybCcWTAVQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(19092799006)(366016)(376014)(22082099003)(18002099003)(11063799006)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?wnTqtwN+YI+9RvlGoZLSp+VlcNTZMrw9WOdArC9F9V2DHJR1O5vpTD0EDd?=
 =?iso-8859-1?Q?dOsXvRIAppk9KbgiVHQW4e0nNEw5KmA46xcjDBQ34HpZ32SZLbbU3zBwIx?=
 =?iso-8859-1?Q?xog4CqV2RuHuvsO6Nu9sawgyt37bwuwtdK9S8hVV5S9sBr9necG1o98Dvr?=
 =?iso-8859-1?Q?f9/9+T3m/bodx1iDkcacC0xd4vJk1JvwO3iyjo4GnoKKYjFvN+3n1y0u8C?=
 =?iso-8859-1?Q?2wUYzyroYQITtrqs79qk8FMMAsWMtiIXOpmox6ipfgtzg/zT6JynMSs/xr?=
 =?iso-8859-1?Q?LS2xCsTFQpzmcVoXkU5MEmkvTKLrOaZmYmB0RE1I1GOQWrTuInrMgikHiT?=
 =?iso-8859-1?Q?AifpFp7VpD3eGqP1Mk2WrsAH/XQaDZx/octleBKTIQMdW99hBojXaPYlVC?=
 =?iso-8859-1?Q?phff/AA52HARfZO+UCliapEbcqENpk3vefrjirVzUM+A5ME4aGDm6eeqSD?=
 =?iso-8859-1?Q?7gqUTQShKqsVf2RbDfHqxw9tb+7PPi1qNQXJq3m0PV23VIcM+2APIG7YQH?=
 =?iso-8859-1?Q?yq1NOmb00oJQBwj8oCylgSSYRER7J752aGeTDmq8esMD/g4HsyD/7etw89?=
 =?iso-8859-1?Q?kUAYZjlnliiVYgS5x0vBZqq4dntvaLhdlizPIqfnuLz1YoVFdq3gdyCJdj?=
 =?iso-8859-1?Q?rI0gK3UEZSCU7kWGLDby+BEuQLcs41xxPR7TQWDQxSXrRH+1WBdvDqWNuz?=
 =?iso-8859-1?Q?OxhMG8OBTtKhnHkQ2iofl61KZOjfk4Zsqf12IjCy13l2g7FrT43zQG+fOY?=
 =?iso-8859-1?Q?iIwepFE5WjqjVjKGLkAXW2BJmu+EqEST+wyLXK0Thy1JtBX97LcuupJDUx?=
 =?iso-8859-1?Q?GmNtYjz543du7zn7S+WwOWx7KgdOxATd9rTwNfGWeiiYDFEKwbshiseesp?=
 =?iso-8859-1?Q?jcoMtw/ODvXuakbkikEe67KmL095plwb4RetgEj3jeHfUHpTJLSi00Fzvl?=
 =?iso-8859-1?Q?POv+VUwmScu2/tjMNiXKJaNSbs+xO98XV1atOCHG2STXGTfFPau7L0oXMM?=
 =?iso-8859-1?Q?x54r8DjtGhQgAG3fNRLdt8CAVdRySBF3xKOS1KXWExO9e9BKPQoTfd5mg+?=
 =?iso-8859-1?Q?ba4T4Wm0HQMgciZ069CKSZC4VKlkIp1hTFw5GNI+XpiERtiD/5Vd9jMIi0?=
 =?iso-8859-1?Q?2AgvOWeatWFW3vfDjYEyCzpVCGPMIXPkr8zTvuCRtb+si/aclHPHPSSGzu?=
 =?iso-8859-1?Q?kWKSZGL6dhRriX7UwQg+50snRO17ZC5J3Uw0nzvoIBTN4IzIOTIWYBRJ9g?=
 =?iso-8859-1?Q?Te2eMMxy1CuMasTPnOM+Phj+wmfzG/2VR3zNdjIyxjLDy6gq7H0viqMajm?=
 =?iso-8859-1?Q?vqrCpA1JP49UUNsvTXB5h2OSfkHlVhqU2qIkMkEGlT278zTMjzJP3VrCgT?=
 =?iso-8859-1?Q?bsJn9/NjCd7WbYvys013rmmZUzs7Qi3r+ikaNwioyb9Saj2PZpOVDR63BG?=
 =?iso-8859-1?Q?0bUiytf2LOioiDlhO4D7apd70CzXxzJgdZQzXwAS7gGAaJU7Ip3299/JUV?=
 =?iso-8859-1?Q?hcNigRLyMWR+SJVL80kZRkIpCh4Nct5oi51IXOC/JgakxN6p3SiYbEktjh?=
 =?iso-8859-1?Q?F9FC8G1ffdIqCyOhHUdEYDBGT8Sg4Bnht+wrkKT4MjWq+0//6BkKxxPtAD?=
 =?iso-8859-1?Q?NI+YS8MjY/gq+5044NqEen1oAbrZ3M7ACIrQ3OzpMaB0uA3rZGOXlBapsd?=
 =?iso-8859-1?Q?B7uVZ5slZ0HzVA3z54ZAZU4StRg9tXhcRKSv6zs92par2Oq58FCo5Ims8s?=
 =?iso-8859-1?Q?4LtsYHOqjMJspKVR7Ej7EmA7lMOCuVrUk6xNfopTESDHj8BuUFl1SqSMmS?=
 =?iso-8859-1?Q?UULTaNRnb5I+hERqYWIqnqGXbbYxng8JTcavmSxML8enXFrKfL8F+sjYN1?=
 =?iso-8859-1?Q?rD?=
X-MS-Exchange-AntiSpam-MessageData-1: aVRRCHlHMVSsLL9YCWUQh/5YdY1OQ8zmdMY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da81d237-06f3-4ffa-63f9-08debd80d7b7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 12:50:20.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSbwRCwkN/7+LKoll+TDyg+T5TOXH3Oq1lfa+MgK2IkZUgVZEGghMY4757N/omsBM5RRUZs7XOJl7eIWZuabgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9562

On Thu, May 28, 2026 at 08:45:08PM +0300, Vladimir Oltean wrote:
> On Thu, May 28, 2026 at 05:40:44PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] Invalid JSON Schema syntax for the `reg` property constraint.
> > --
> > 
> > commit e219405276839837989c30627d109ff39c15e361
> > Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> > 
> > dt-bindings: phy: lynx-10g: initial document
> > 
> > This commit adds a new device tree binding schema for the 10G Lynx SerDes.
> > It defines the register map constraints and allows flexibility for the
> > #phy-cells property.
> > 
> > > diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > > new file mode 100644
> > > index 0000000000000..993f076bba4e6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > [ ... ]
> > > patternProperties:
> > >   "^phy@[0-7]$":
> > >     type: object
> > >     description: SerDes lane (single RX/TX differential pair)
> > > 
> > >     properties:
> > >       reg:
> > >         minimum: 0
> > >         maximum: 7
> > 
> > [Severity: Low]
> > Will this cause a meta-schema validation error during make dt_binding_check?
> > 
> > The reg property is parsed as an array type by dt-schema. Applying minimum
> > and maximum directly to an array property is invalid in JSON Schema, as those
> > keywords are only applicable to numeric types.
> > 
> > Should these constraints be wrapped inside an items list?
> > 
> > [ ... ]
> > > allOf:
> > >   - if:
> > >       properties:
> > >         compatible:
> > >           contains:
> > >             enum:
> > >               - fsl,ls1028a-serdes
> > >               - fsl,ls1046a-serdes1
> > >               - fsl,ls1046a-serdes2
> > >               - fsl,ls1088a-serdes1
> > >               - fsl,ls1088a-serdes2
> > >     then:
> > >       patternProperties:
> > >         "^phy@[0-7]$":
> > >           properties:
> > >             reg:
> > >               minimum: 0
> > >               maximum: 3
> > 
> > [Severity: Low]
> > Could the same meta-schema validation issue occur here? 
> > 
> > Since reg is an array, perhaps this constraint would be better enforced by
> > rejecting invalid unit addresses in the then clause entirely, for example,
> > by setting "^phy@[4-7]$": false?
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260528172404.733196-1-vladimir.oltean@nxp.com?part=1
> 
> We have the same pattern in fsl,lynx-28g.yaml and it didn't cause schema
> validation failures there.

Yes, so the dt_binding_check test passed fine:
https://patchwork.kernel.org/project/linux-phy/patch/20260528172404.733196-2-vladimir.oltean@nxp.com/

I will not be making any change to this patch in response to this LLM
feedback, just humans.
