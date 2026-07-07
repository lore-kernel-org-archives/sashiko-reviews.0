Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2501B3EB0FF;
	Tue,  7 Jul 2026 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783449563; cv=fail; b=Qr9uoPYa+L9toGPUM9NzSZlOiXU0vg2pbecDOenYSqPSWtf57XGnYD5Qp30sGqn/w02FoCE3XiXrur0suPDQX/K5lHA8nFleZNgQNrQ9rlyb6BclxQrWeApit5/W/MBrDXcUfn3tOC3KqbQAM4v0iIiIrQvcybekZM84q1G8oN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783449563; c=relaxed/simple;
	bh=WkGCbB9gz/q3glUQa2H5s0ZM/i80uyDUEjNS27d5Cfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=No/Ts5J49he5g2yb5TWr1pXBxSJ6YhLNAywFQfpooFTqObJGGMWL+GDBJu/d6DsSd1RuR799K4/aSwHbFRWldusKPwog5qHQAB9Xjoy3bDRKnqCxYSsE1AXKVTLv0eGZgj7DtTrCuxE60ccQ74EERI0La701k1X2f22TfUJzkAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dnaB9DPN reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dnaB9DPN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PX05SF4R1OFP2ApswCoF8yLQiixSgnk22TCy3Be8oGRz3ORFEOwsTBJP4Sl3Zr4m3EWcStiU4dC4b5BLEp60QjmldH/+elzHVjUbu7yhHP0CWZwQKLv+mE6/oUM/M+lJywgN6pQLTVv54YG4ba5PYwnUZGBQcizFRjxsiTIYd3yJ5j0tfBWrsf7KFqR7lUxSVZpjpp82SxNwZuIQCpRNf1g4fA0OrcNGXytXTxKueFR6QaIQhpJ0SkvwMLrzu79F7u2zNHrrNK/yb4ITzXLfY0soUetqT+DaKG/8sRMLunpf9xR5yLkaeeD8IksB0FpUlojXpENMTdqBlkwczQgQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZ8ETfVP2AEBwUBxry7WQO4H2pLTi5cw7+q8So0bGVQ=;
 b=MZK04IbeJoaM5MgOPTS06c7Pp70vnqf2m4r9FMmplRVNw1aPUpIo8P376d/F8mxl4eLDVAvjYxqsI1xstiXy8arcXDYxkJmX9bkzBDxM6lvXDFMGSOVTPa/Qf/uolOXuHg/xzf5wF4gNAAyl/zcreqOXo1WM+GKVehkUfh5HPbwNOIQX4lXWfZBpzAnYKm9x60HoIcAmSJTc1sIU0mpWJB/DX+UHT5zcqwQgHNh+PhyYehxlQHEd21/NzYTwVHWudZd9clKPeio+yNLZfP+fY5lEJHl9A4q5OtjtslgdKSrjnQS4QXd09zUOrMYK4V02halziHNfVsH82K1xmassKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZ8ETfVP2AEBwUBxry7WQO4H2pLTi5cw7+q8So0bGVQ=;
 b=dnaB9DPN4nJrULzFuohCyUHxHA8BeGO4MzVjT5n01EC8hR648hD52FQdZKQEgAjED7g5SZz6roCbj+OMJdi/jziQJIzNVAdmOi1gPKTyP/1MzEoAnAmu1JHAp6hb0wnj4sKm4TKpxWhgkJCs4ywMQsTMC0/4elCbpLIaXpEI8wlx+32ueuppt95A9OwEkb1ZOwcCTrXZGAlNrQYqi6U+fUYJ5WLyaES8NwzPvalOZlTdCHyM1N4uNaFQyAn78CcxJXXLmDbJjTwUqJGhcgS2pUZR5zPHsIgr/oLqJ3koEqd6FvWvhMPQG5mn11ufbBgHX5zCKfmX/9exn2BKOOngwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8309.eurprd04.prod.outlook.com (2603:10a6:20b:3fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 18:39:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 7 Jul 2026
 18:39:17 +0000
Date: Tue, 7 Jul 2026 13:39:09 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Frank.Li@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: arm: add MBa93xxCA as mainboard for
 TQMa91xxCA and TQMa91xxLA SOM
Message-ID: <ak1HzWkelgKjYiut@SMW015318>
References: <20260707091424.1702245-1-alexander.stein@ew.tq-group.com>
 <20260707091424.1702245-2-alexander.stein@ew.tq-group.com>
 <20260707092008.B7E771F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707092008.B7E771F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8P221CA0044.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: 205a6ac1-e401-40f6-4a19-08dedc570d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|22082099003|56012099006|4143699003|18002099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	kgZydP2JJPbgSys78RR22LnIvo8wDgh6jI3FmA8zAIhRycvl2o4ltDSLPTFS79Lexe0RJAzzj2yZ4+0f3Wa+ws4pchBPMR6C++NILwPJ+PMW8CWXNn3O4ktXeROOjqNsLi6lFgR32a/bf9yudviHU7f6I0GluiNdOlHAtEJFKIDGixZZ+W4l5Mue43g8owpR34b2iuSqqY4YlfKRuCnzFZgGbx+RHRAW2tVfUrvw5i+kEXw9RLP8lqBWU061vsqkccfZ5HJsBLYkvYrf3hPejndIa5pBlxxu1lYrjBSekqyE+0Kk4+aE75EAY97Mack+ePVoWNE2/y2wy/2nDV/GFZdYuueZlQUSK9Pc6zw0N19AQkj1jIHSg6g70GRx1y9iakXKWw1T9/3qtOmwSjF+n1eGs5B0wptMcQXiCyHVjSzFkj8l3LVeDIQlpCINUp8zih8QcmwuoiH14g07N+ZBce9gPe52bDhTA0NYPOJao/YUiukw0FiS//aVgh6xtkmEO7oN6UB1UrTM8S37gDJEQEH9hfNiFI9CJ7ZELq8sSx3Sol0IuUpvZWF20yQe0zmTfbAxZfU4uXHx+wkMm3SlYTCVypAa0cMdoHm/iDIR5Og=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(22082099003)(56012099006)(4143699003)(18002099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?myOBlybO1T28R1azfOBPMy4QC0kDo3htSzyyNdFs0P/AI3duHiVHj/CTxJ?=
 =?iso-8859-1?Q?1+52FefFnrwkncVj/a3/DIxJzXn9UGzA6NuK/MqnCIdLe8popCIEgD3z9W?=
 =?iso-8859-1?Q?7oaQsEkMb1lIhtgOhiTNlLLT2BCqVZk/S1JMzMqzRHSTbu1OwNkqI8rPJ2?=
 =?iso-8859-1?Q?xcPo/zy2kFAm0TSwQd8lPw3l7c31xHBbZuvJacWRnyZMB8V1ow5Ru/hteq?=
 =?iso-8859-1?Q?2Zxv2XoA0aIru94q89p4O95bZoi0re9eSJZJeUsCqpLXI3316XfW72aham?=
 =?iso-8859-1?Q?fucFySQhB10MMXv1a7uH+mWr44q/ppxTTJGpOmtzY3/d0M2EzaXGYy3idy?=
 =?iso-8859-1?Q?cbDQZ74L9BcOGWw7ZcnoNiUP4Y+X+bLsB9lDcVH20JSbTN5l+LPtMN8EED?=
 =?iso-8859-1?Q?yRqxYiP4G+7syHgjhKFO1Ep8UEFomJJI58EVob4XGz+J9OT/M9RZdeAZCg?=
 =?iso-8859-1?Q?OLejRJI0TqXXjvSU36iBbzauEyZ8BkQW4+h//g5uHVvkAXFoDuIUMztInt?=
 =?iso-8859-1?Q?CLkbm76rbAZ9G3sBFI+uL7VLIxliaHjGdXu+sdAKEDa8GJo/eFSZPgEVrE?=
 =?iso-8859-1?Q?3yfyHCxa/Jeo0omkavq+wzN0+L0dSAQwvyiz+otnVdhiAfzb34i5uzYcC9?=
 =?iso-8859-1?Q?IFD64SV5W1Nw0OdJrrQssHcJ3IT4xLJze4hBtXOmEH/BIFGnjX/eEhMefm?=
 =?iso-8859-1?Q?43k5rGM6XX2lw9ONGAiTMlCrtlO/24PD6hD7g3YhVO9dUkdca2mQQwy9U8?=
 =?iso-8859-1?Q?BP5soGefRpb9BohLRtZStEUTcm+xowGUMt+oOs30TeqsOmlIGEqlnbwwc0?=
 =?iso-8859-1?Q?uidUXzhpBwEWYbTzSonA3xJMFmarFxgwrdkDeLmmnKiaupYVyVHY5rKhAe?=
 =?iso-8859-1?Q?mzurV0neV1nBi/sqzBDbI6buGFV4CeF0VigSbrMzJgWjrl8Zv9hfPDQy4n?=
 =?iso-8859-1?Q?ZTmooC4Lfsu0WvoTmdcWlJ6cmXuZFmPrBEc6FUu5fqdvrR6Kw+2//kgtts?=
 =?iso-8859-1?Q?0/pFK6jusqyIxrXktg7qD4IHPh6HT7BkfPghunRojHvKBWvPjHYh+M+wtl?=
 =?iso-8859-1?Q?J2aNtQeSbXHhE+acxIHbSfjc1fv+AsiGIzY0pyeFhiF59Jol7lY6fbCrbd?=
 =?iso-8859-1?Q?qC+JuwJPFXL7GCETZshBAXUNjuO/RwMp2YxHx0JMoRlragqjrmByAMenVN?=
 =?iso-8859-1?Q?f5efvAKXkeSBTpXP/SKTJCTHfO0FxCOqtT4UyqwTsMUic3aRuPKG351rQg?=
 =?iso-8859-1?Q?ILWVJe+5oNH0fcP2EWsldi86+jUO7/W8qKGNwzLUMpHSelkIhrbp5nk5IF?=
 =?iso-8859-1?Q?UvYl6OwCXMSIFkoLMhDsCn7aFrTlsrxQ18lU9e6k5iQIxbizeNptydfxNu?=
 =?iso-8859-1?Q?H3DddnJK25pGpI6GqENlyLoQqj82JhtrNRA/okSfrpt0mRtlo20TGkeNjJ?=
 =?iso-8859-1?Q?jVNkRv8suBl9fZrOH792Vatz0rL4N5n2XJ/4tAIiq/kcchWdJAHGNEIiwb?=
 =?iso-8859-1?Q?0SBUDJkb/Ir28tIa49yUonpFqjQrGBYbM3DwVO35EWg9opTE22HCGHQA1Z?=
 =?iso-8859-1?Q?XwOKJDhUZDa2NsZV82o+XOXEGfLlnX9aEQm8DHpuoj1mjiHB34DJGnh0Tv?=
 =?iso-8859-1?Q?h8v576NjQd0F5B3KVtIGEgVpti3sNO3e0tF38b809tYsv7TFMAHXDAIoZI?=
 =?iso-8859-1?Q?pBDjJBWzblaMEwpzcRRjsdYK/EQStvzkDU7kJjV8v2U9LGsRBdOVnZBeB+?=
 =?iso-8859-1?Q?Hja+ivqiJ3QAZ57eEtBOFw09x9FhokzB/FfzojSvii/9jX+oo/lmFxk+FN?=
 =?iso-8859-1?Q?MP27UzhBneB2HtIY9E686hvinDFQADJVd/bXn/06c9PkSwLQdPO9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205a6ac1-e401-40f6-4a19-08dedc570d2a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 18:39:17.7812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeMvWbbb1Ne2kfHGlTJXxZCZyB4waKWzX8ULT8bK0yDLrGkq7RRbjvdkTzyY33mDrWE6hcGABTASi2D3Nc0HsNnyM9Vkh4b5zVgmHU8Ex0oH35/+uLNZsMSEAmUPkjPX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8309

On Tue, Jul 07, 2026 at 09:20:07AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch introduces duplicated and repetitive text in the dt-binding description block and contains a factual typo in the commit message.
> --
>
> --- Patch [1]: [PATCH 1/2] dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and TQMa91xxLA SOM ---
> commit 3332dfa95ce8d051969053f3ea74bbf075143869
> Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>
> dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and TQMa91xxLA SOM
>
> This commit documents the MBa93xxCA starterkit mainboard for the TQMa91xxCA
> and TQMa91xxLA System-on-Modules. It adds the corresponding compatible string
> and updates the board descriptions in the fsl.yaml binding.
>
> > TQMa93xxLA and TQMa93xxCA are two series of feature compatible SOM
> > using NXP i.MX91 SOC in 11x11 mm package.
>
> [Severity: Low]
> This isn't a bug, but there appears to be a typo in the SOM series names here.
> Should TQMa93xxLA and TQMa93xxCA be TQMa91xxLA and TQMa91xxCA since they use
> the i.MX91 SOC?

Look likes correct, please double check it.

Frank

>
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > index 86876311ec59a..84c4311cf7c30 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> [ ... ]
> >            soldered on an adapter board or for the connector variant
> >            MBa91xxLA mainboard is a single board computer using the solderable
> >            SOM variant
> > +          MBa91xxCA mainboard can be used as starterkit for the SOM soldered
> > +          on an adapter board or for the connector variant to demonstrate parallel
> > +          display and majority of interfaces while MBa93xxCA starterkit mainboard
> > +          is focused on communication interfaces without display support.
> >          items:
>
> [Severity: Low]
> This isn't a bug, but it looks like the new description block duplicates the
> existing phrasing for the MBa91xxCA board instead of replacing it.
>
> The context above this addition already contains fragments like soldered on an
> adapter board or for the connector variant which seem to originate from the
> older description of the MBa91xxCA board.
>
> Could the previous, redundant sentences describing the MBa91xxCA mainboard be
> removed to avoid duplication in the final schema text?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260707091424.1702245-1-alexander.stein@ew.tq-group.com?part=1
