Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC473CF68E
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648665; cv=fail; b=pFC76zgNKgMLND6HJUG16t0jWP0ziEl5kHCCcDDqlOEIF4rmiBeNEksMzn29Rd8gO0pA0+iZrgHW20PsNthEpdRmpwPu1c+ET1G25/UazTpezeOnGmes66GWWtCTF0yE70g3owyx4D5QTxiKi8LIQ5t5phPWqOdUq/cP3dFaHb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648665; c=relaxed/simple;
	bh=vAYfvhFXCwgF9GUtNcdSXuKChEPR5wtkEgdA7xcd3ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U3uk0f+TgTKbouC8kuy2Xd12iujbwU8L4x4BNoYJR0bCFffivlLdU61n3/JPspSlDiuxlSc9+oeEWFrh/M5YkJ+e/1LjmiG7Qfls+DZf2bpVF7iYbpn2m3ccsmFRTR7wijGtQwRrzzpQU5ZbA//cbxaGZ4cktEqDRULXdbk167A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JqiPJDVp; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JqiPJDVp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZEaseueILQWpXqfW7nSl/ns/RljIXcBRmo6ITwDTuy0Q/3gG/i5TlP2mJFIiS651LXrXNTyypch6xW0apAvx+5XswQUWizJQZMaMXlSmDY5npAQFj6FvrGu9kVZJ3qMjXhFyY8mg6eJbS+8iLL1FAk/WeNaWA7T42kgoIV7IHj1DY3jt9HLfe6rlEOfkDij3it4VS/R+uExHWQnOXFz+6VFEVqXB3aMmghOLSlJOcM8qRjPRwOGGXDiqfW+SOF+OVY7wDm6EdN5uygT7O3oziLF6B+t5SCnyyf/NMqJj3y3VcjLUMjxKH7mrk2D3/l2NDlJv365OFTdqHq79SGBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDfTYEJXknXEcNN3B+2j3MWih85Kmab+QPA0sW0FYu8=;
 b=wiRT7m7XG9hbGYVF5kO3VQzOC1hHt6/uOwcKeAvGUbdW2scDc5J5NvllQweId5mX9L2eSu2JX6uCbueLpihlKAxeV0IHMr4W8g5gUdAO+Cwq4tYPEPLoM24GRwlZcDrDtUFpkbtu87dB43Km/bR+zhY1YffBhxEG5vJRwWazT6CTuiYzcI8jXFi4lCI9e6qyg15sDuZkEOgeUB9mvSfqylP/MKxQXbtrrOKttmMnSQzZcwwCUYtmFx1ySimtj/sAcfgkAgW/LjI/L3wo0fW9lnWEpMB5igOe5F4STpGj5mNjxV9BFOJ/PDemwS/jw+S9mwF3EehoJ+RnNrU62kDTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDfTYEJXknXEcNN3B+2j3MWih85Kmab+QPA0sW0FYu8=;
 b=JqiPJDVpNEzZhtmaYTN1hkHkLE+jHHzC9uQEeTT1fUu1O5+JHIVowY5luVEz6/MlgnPb0FizssDXoHg9enieLiuEznMc0hxYOf0eC6C/MIdfjd5s7wVmfelqgzAqLHe9uzfUpj6yLhYkSc8Lf8rfGHNhYUSF4v2pixKQSIuKf7bAaAK50jD6fzsDZL/AhCNtMtabQ7hfT24dFhFfkIkWuf4Zj7b2ZjbcnxMxkAnAK5i4ynqZxVG5c7V7CkwCCvc4l8xkzhZykewUZOaDW+9PmgslnB18ZaEyL9528JjJezK3H63iNf4X8047VP854911PZWMniHTqBJMEp1BDEUKRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by GV4PR04MB11404.eurprd04.prod.outlook.com (2603:10a6:150:299::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 08:37:41 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 08:37:41 +0000
Date: Fri, 5 Jun 2026 11:37:37 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, vkoul@kernel.org,
	neil.armstrong@linaro.org, conor+dt@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	olteanv@gmail.com
Subject: Re: [PATCH v3 phy-next 14/16] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <20260605083737.yryq2a763zhnkjyq@skbuf>
References: <20260603132059.503527-1-vladimir.oltean@nxp.com>
 <20260603133350.9FA271F00893@smtp.kernel.org>
 <20260603133825.l544tnmtn2pqfrzh@skbuf>
 <20260603-numerate-unbundle-ef259832006d@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-numerate-unbundle-ef259832006d@spud>
X-ClientProxiedBy: BE1P281CA0481.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::14) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|GV4PR04MB11404:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ef690c-edb9-4151-7333-08dec2ddb4aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|19092799006|366016|376014|1800799024|3023799007|22082099003|56012099006|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NbQtd5RUc/xKg+JV5gz3sk4AQmWKy+q62TXCL52XlD092Od+GEzyWnPHDe9oznr6LOdh0YHfsn8gVYMJcYnt7Pqh5KCRTF+6+BrODiYY0XMsCQ0X/3VN6kHs/ASf5UAzCSPDOK63zTDH3QeAAItVL479gCNiD/9uM/phfcRwQGovOWxS4yFdrtI6NpKLxyTo4w0J1SH2te7Cv39RwKKlt/adnXHyrQxAZB1X/kZjyGgmQEIkfGNENYFirR+OfvsASHzk2tO14/shitfVh9eVtTATka9t2fylKTEFq3rbX4SDf8KZEZ7CZBZW17fcpHqqbTAnSY1MZN3Ekq8H7n3ZNx3UJBkXcGp5kmZrEoyRpmYnpEgPEzint3fWFDS02bANMx+piccqazJaCK2bOtSVgkVjHmHIg7zRQ4Y+Pj2fuT5hk9xalltyzZKeG/sbIrJ1/xOfg9KXfipj9i34+5MvriocwVtrN/kT/3Xvz0mdD+BwlxUJ6ebx3lRUAM3Qk4zU2LFsx1ijLot2NpKTuUyYYfl5WdiZmTutFhzoYsu0AXTGDx1tk0t8WPAXQLnj/9U+bwVviB6zNreKgeBdz085nX6RimbAI/JsXldVcy+1VLqSWtYOq1cWwrwU1JYTb61ii/01RyRfHzPjMKLBKNYwliz8c3PoKRjmI36X6PpqNiiIdU7PFkfPMDAPMciC2VNsVpR464rwHskHt5lugW7GLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(19092799006)(366016)(376014)(1800799024)(3023799007)(22082099003)(56012099006)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YPAk8V5s9TKjDYLie1nKXaLYu2zb1KwWqnchr367rzXnhCGZRhv2NcjrZqEV?=
 =?us-ascii?Q?6+4i2idkrHJ1zNXwhbj/17beyfPNZXm7N2/CgmKB8+AYMdZdfvSiFO5Mjucz?=
 =?us-ascii?Q?NTDcykcCKRvXrqlRgsTW7w813f++dWzjGbQKTYZK3pa93lOYQy3swpM1czxx?=
 =?us-ascii?Q?aC18a7hOY75IehKOPke2FhqEGTkxorqBCytfEKXDhTip5kquSoKFvGz/ZNiy?=
 =?us-ascii?Q?GkTZ02lGs2/sw6K5qiVt64lI1Rmshp0xMXeJvSL8x6s0A/zxTxYnLUIV8522?=
 =?us-ascii?Q?/7kRQCrHgS2IHSlrF0z8Lm5V6GZsdGSF3bGddXDf+2Y1ft9hPaw3ImcLRO4y?=
 =?us-ascii?Q?VnLFqQimcNMAaYV/Ge2th773bQRuHvdAwN40tk+dYUsx6nFo5wUrKUg+WC+r?=
 =?us-ascii?Q?jQYpSqxTV5WureM+dBohiP4h3Om2qaMj80SzahW8WpMxyRBLlxGVcsyQvT2B?=
 =?us-ascii?Q?/Z+k8moQrmqxI9XVN0xSMPus1Nu5W6QD/m2Oi756ewDbfG9rUpSL8AsSZixS?=
 =?us-ascii?Q?FE1igwG7oOnZc5dBjVR07St1Til5Geq+ykr04A2Og0wwZQFHw067L5QzCMBa?=
 =?us-ascii?Q?UbdVLbQexFQT6P9Qpyaz7SneuGC+0drYMsfXTH2UubyuDEOdaKcEONQ9r4Oy?=
 =?us-ascii?Q?2zj7AHMlUQQw7qtRBEJkPCahqsD4Tg/h42TbUDBzsHukA4luIpLv5mg8HQVv?=
 =?us-ascii?Q?7ol70nnsITfLXdojTiLIoOHJpJ4ua9PH/3Q7JjoJfj7aKVpe5PIxBUtVDqGM?=
 =?us-ascii?Q?4JkrHv/UkTj1ui9EecwEgPBs9VZDACQXFnhVZN6S1o+PzuXYNfnKR2MctD39?=
 =?us-ascii?Q?sM5JoLp/4alBQYV555hvPUyWrOi5/9nONfgoGv17WWBkdFebizbrL0futfSH?=
 =?us-ascii?Q?rcmQPd5rGDCukAv88Z5JYuylXh8V1u1f+GP+wEbj9jMyq6moWJViyKgbbxJ+?=
 =?us-ascii?Q?W+kMf0lTF3n9qCkWXK8zwLPlDASbsntx1JLwp4v9/i1sNCo3mB+wNSaUqOM+?=
 =?us-ascii?Q?AsLOTiaQu0OumI+3DQhzBSUzD7xPZR7F5F8dynX0jEq379/yhQoU0wWTTbFX?=
 =?us-ascii?Q?FXnt9l/ErNgBBOEFuRGf7EGdQk+7RUy6nlMES1Xn9u4yVFJHQWm5bqM0oZ+O?=
 =?us-ascii?Q?bAE1ZNo98mHqDq1GO6+qAGfkOXJ24Nmz++LZEnIAKJl+08dQw/ljeJuwNn3o?=
 =?us-ascii?Q?KquSVnoi5K9Cy0SbC8UnokL3VodDx8sAJDsj5lgWgPr5sSnmrSGsIOtWOwuR?=
 =?us-ascii?Q?w/dQyd24270uEfixBtwe1/mRxEr9mgulA61zpOO0snbRjiU11M/ZictcmAOa?=
 =?us-ascii?Q?0SrcaIBsW/zaVlj+Tr1myGWQklcHPq2Jwli2YreXkENS7zLDnA1Wbu5BlhBp?=
 =?us-ascii?Q?AkzQKRLs0rI5mGufWGZNTJJggBpazcP3c93sEIDHDgQTEpSJa/AVE84ATWLF?=
 =?us-ascii?Q?rPdBvwbG9BwkQEDEKb2rfj4HvWKSTV3WK3M06F6zZ3BURsBqx4Ql4AM+ucL2?=
 =?us-ascii?Q?jNrg8XhLnOCJ87tbEKJWPeqxMVfkjMJVw9rKJHj6kaULXARUS/cf5x+VdxbS?=
 =?us-ascii?Q?6LpAsnbd/3mNPPeCzZe+0cpRKc7JS0HFlVpYBU7JeFG3rSlvgXDDBXsxBv8F?=
 =?us-ascii?Q?r7PoCR56OahfpRu317VAVDOIiwzkAsWi8O0JmthTf0xtleb4EekjD8zupXZh?=
 =?us-ascii?Q?lyB1DKytczY4IeHg3E/CcnRpRjukQmbJM+y+uyhd3NLFrsFOrcJ9f+fR0m5q?=
 =?us-ascii?Q?cM3GkePudqhuybiEsDrdnSrPP0rlWyyZd4hLsrhlQi4UKKte2CIQGTU93xQL?=
X-MS-Exchange-AntiSpam-MessageData-1: I+lNuIPX81jaYkXG+LRS/J1Gy3GTFkIhQG4=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ef690c-edb9-4151-7333-08dec2ddb4aa
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:37:40.9822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXUmmMJPLMOb9vP5heV6xwnvJaRrjYJCf699FZ5PNMorOZ9uwqAnOChCH7PtysGQ/SQ2Z5QRbE5SwwdIQkE7AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11404

On Wed, Jun 03, 2026 at 04:50:39PM +0100, Conor Dooley wrote:
> On Wed, Jun 03, 2026 at 04:38:25PM +0300, Vladimir Oltean wrote:
> > On Wed, Jun 03, 2026 at 01:33:50PM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] The `if` condition for enforcing the `big-endian` property incorrectly matches the `compatible` string array directly against an `enum`, which will always evaluate to false and cause the requirement to silently fail.
> > > --
> > > 
> > > commit 8bd3982a89722b20a3686e42d4ab3b9f0711ae11
> > > Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> > > 
> > > dt-bindings: phy: lynx-10g: initial document
> > > 
> > > This commit adds the schema for the 10G Lynx SerDes used on most QorIQ and
> > > Layerscape SoCs. It defines the valid compatible strings, PHY cell requirements,
> > > and enforces SoC-specific constraints such as lane counts and endianness.
> > > 
> > > > diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > > > new file mode 100644
> > > > index 0000000000000..8cf6027a75b91
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          enum:
> > > > +            - fsl,ls1046a-serdes1
> > > > +            - fsl,ls1046a-serdes2
> > > 
> > > [Severity: Medium]
> > > Does this conditional correctly enforce the big-endian property? 
> > > 
> > > Since the compatible property is a string array in device trees, evaluating it
> > > directly against an enum always returns false. Should this use "contains:" 
> > > with the enum, similar to the preceding if block, so dt_binding_check 
> > > correctly enforces the requirement?
> > 
> > The tests I did suggest that it does enforce the requirement.
> 
> Yeah, sashiko just doesn't understand how this works without "contains".
> "contains" is only actually required for validation purposes if there's
> fallback compatibles and you're trying to get a partial match.

Yeah, I have no clear understanding of the json-schema syntax either, I
just copied from another place where it was clear that the intention was
to have multiple matches on nodes having a single compatible string each.

But maybe it would be good from DT bindings maintainers to teach LLMs
where they get things wrong in this repo?
https://github.com/masoncl/review-prompts/blob/main/kernel/subsystem/dt-bindings.md
