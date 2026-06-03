Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF65E234964
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493914; cv=fail; b=p0p4/8Po25FYRqOPBP3L2EDjTeI5zgmCqNQo82nT7pxVHibYT+WL7/jy38dTd6YWoA/7IVQUz0TbrlWz3ZSkFlMexj1LKZX79zafEavJb+qO6cq0S5qea+Jd33bhSYbWPIkTRUmEJsz5O0LYQKIHS52DD89R8WwniSaaY1silC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493914; c=relaxed/simple;
	bh=/52W+v3+eqzIjJSh13w4oaJdtWhsmCghM9wCEjpgpRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JuWcp8i+5vZ7VBQ5IwIXOA+2Nl0KxshvHL7xM6fU1FitW9vajaO+/mlSSe+58e7R4kEf3bocVxG42/ppD6JG86070OMrYvHrgUaWpDT+1v0XvGXLpcFVmBO7DpF5nmpAFHJEGKYPlgJsi5y4yy5hjQTYwiJdzD9/uUWK3MVN3bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dWRv7ely; arc=fail smtp.client-ip=52.101.83.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dWRv7ely"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Egq4JnGUM8uKfwDxU5IfMP5NfnxIjLeij5WpHZWKPtTOWOnPsuywX3q6NibQzluJUTo/eyfmHUJbP8+T3F8vfR1xnD4H/yqKZmXXbsS86UEzzdXt2XFsfVoZEyrY/uU88eZb8zQt843Qc2gh7fuoSV3rjI7RUuFjyfNYpWRdo0UiTTcjoXzJyrRlkiyRl4k6jlp0+tZAaIUiWh4ACdBBq2lgWECcdoXir/2xs0cq9SQV8eYhPBmQZHkf8AK/Gs+NkvzsI2HBvpA/MkMt5lPOKMBWV2g9k+k7+8OyJwNzX1k2+9N9K9oMxpuvuphG8yFa1Id3foUs9K2DpkB+U1eosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NvoXCKga/6ELGsMNVHpXOXKyCVg0Hq6KZJbE04Fcrc=;
 b=lLbG3/k7R3y6fI//ttCHsMo8FRYZ0fg4/6q4Q+P3/nN6F/nktxtPJq4RIn8rj7LUBl5fq4VvxS0RgUAUdvWaK+pcjjEulmicetdcQtALiLqT6F7LdVOBMcwGl9335qU1bYrIrR8YwbsxX9hYqSDAcU/P5nvoqKF0FOdcO61CAr0uA7XjJ4L0RATQ5p/yD+um35KOUTOdONChAVBTqPcOCWpB9PPakaPS0EFv5BU2MWJ4tFmv3usHZr5UJ9DfxKO6p7qDxue8cBlBI5rKu1sPZztPVQJgT45HKtnfBb8r73vkFdmGnswb0YpLppHzq9yoXiSJFlFAGwwJi3+RttupTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NvoXCKga/6ELGsMNVHpXOXKyCVg0Hq6KZJbE04Fcrc=;
 b=dWRv7elyPpqKJqqg6ZasrDlD1jUYm5P6grui/ewBnNxTgyGTNUxUD/gM9OhIYMqnCqrX3h+1WDSFyB70xFQAxbUnvTvgPNdXcPdJGuvKalAbkOcqFwPftwazkm2gG9O4wNXbzYPJaT2NCQkf3mUAN0KdI8Ws+PrAfc0gbZYkkeI3dT3lNlK1qBd0D30nffO6HBva2MfGZq11w7dy+pVzOXKq/hDuNySvMUmxc7STgHLHmT4fnBK1hBG29HskScT4udGrsovrS6fUF5Kub5KEMPIjwkEbfk9axKkS7tBrKTnyew5ACz7gCzpYmhjWTJoQ9UnSHp4vtj+GCh2qOjJXNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AM9PR04MB8422.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 13:38:29 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 13:38:29 +0000
Date: Wed, 3 Jun 2026 16:38:25 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
	conor+dt@kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, olteanv@gmail.com
Subject: Re: [PATCH v3 phy-next 14/16] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <20260603133825.l544tnmtn2pqfrzh@skbuf>
References: <20260603132059.503527-1-vladimir.oltean@nxp.com>
 <20260603133350.9FA271F00893@smtp.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603133350.9FA271F00893@smtp.kernel.org>
X-ClientProxiedBy: MR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::14) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AM9PR04MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: 231b0170-365e-4dc4-13a3-08dec1756590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|19092799006|366016|56012099006|11063799006|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2KTBzM+5hZypX7UUiV7ZXajDZ+Gxb8BTkzRQmJ+8SBTXv+5gMAUz0XJJ+iJQsrdXUOjvlyO/rAJ/zwK19vQ8gWithZhZ7BNYnFCWlVaaIHqHFozHyQXtvRvYaumz1VSfJJTcSlQlaFKzcpjGZuAWGaQtJ6GUt9x91q+uskJ4rc9D1Er+FQiiD19+9gTz7HEZMGblWmQg2NuZU2r/fe2Tq2AzuBKpkBlGzi6Mjp/NZWdGNcpk5opuUaWH+zLeX9sz5CHjtJuQcASjET40fCwyxmGX8yGTYQufBhJG7X1KuXuDON7cIRLAntXCIUnmVPUbDvReVQvjzfPGaO4ixAWu53EwbPgdaAhQubJ+gQWhqYEbP5frnEpoSuOAlpZBvSjAQwEXD55oJBfAuYngTSESqweuRpVskN9FevBBXaisb9dXiKFCjzRQ/YpigmS1VLeZCi9vhCmJgVld3VycDiZBzG9NYf2P5r3Y0Ow3GtJN26TF7e1s2nvj4nuDLTeUDKNRqwHWcpDryAVPkG8egWYxo6Fi7XcE3QESPOuIK25geUpRka2zq/fHzoRIZ/DH6v95FNS4pO9fjLiJXk5dCyBt84z0Nlr7ASay/y+9pW+rpOahOQuHUXMFjbvvzWYh0H/eSTCrDCgZ2H10VPKc/MnrOZJMt5SQGUZci2ibDnSW9BgV8DHfKgGfu1ajCyfd6ejW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?thyimy7wiAfmReuCn7IPcXFVT0bSwSnlHKdZfP180eGw8qT3V5TtcPvtiKIu?=
 =?us-ascii?Q?/Hz1tLvhco7ScBEyNcHE7l7CmpPx7HI1mtAhap4aAcvENz5f5lD7hSmNyHgb?=
 =?us-ascii?Q?CTbmTlMdUaHORYtZkzgCR5znSunWvJcaZ/nxVHgvb1gK77YcJa5Gs5votHcv?=
 =?us-ascii?Q?TsrvB879ZGQUe30sD7J575Xux7PmMKIozO5OKttTYg7QndiQcHmRx2iQvoql?=
 =?us-ascii?Q?e4sChYDHlThe4lVrl8bki5+BNqV+b1FG2eVHdqXT+Yyz46bH6Dnf0NFUKddZ?=
 =?us-ascii?Q?f7Op14k2b9ivVwhzgl68+zSaRTjElLBuGSWCOHtLVDMPf8UQUwiN17oUtpUl?=
 =?us-ascii?Q?ZNIGKHQ/nNC+PTWIleIUnsGUWMZ5tSINQYyCFeoEXuPGYwCYunWJy2pA02w9?=
 =?us-ascii?Q?7/LPXkKgcroG3jQCUqR7L0zdU3utrdJd8R+DlYfr1B8R+5+Gn/ObsMAqTAT4?=
 =?us-ascii?Q?R6DdVKPdKIziknfJqstPRmjekAkI+4ww4WGYv+DrERQI/+izlrqVQf9eLIJ9?=
 =?us-ascii?Q?svVYJ4nBKe8FTnNOoL8RlGyfUXrOxnrATi3F3lhLyaIUl36zE1kcMxuNiPgQ?=
 =?us-ascii?Q?r1sAK+khYoJbqE6+O5rvqIZNlG3tqLCz24GxX/rZdbaTMsHsYOEMSFPM5cCk?=
 =?us-ascii?Q?zT5HzeWK6Q36mKARsjbH4wzWnAjQaXOZIQvFfv1qHJYGxjp38o/c89hotG99?=
 =?us-ascii?Q?/DGYQZAdm1iVC8foPeu7dgFk56NcXwCWtGRgHpDmCo0bdeyzGbyTJwDKTC4l?=
 =?us-ascii?Q?Wq8dyRkOPngdO/My3/1TkZ5P1PUlam3UnmcCm0rZoXElCp5ROBcYOetOH+QW?=
 =?us-ascii?Q?6SARToBTBgdqI+TEnJLWT0Vf4xqwKsnhF6VxooCnqEyDKCZF14786mGDVlN0?=
 =?us-ascii?Q?g4KRmnJGGEx1wgluQ2id7G0twDXConWzHH+grqebmyEePECb31kpF2587XOZ?=
 =?us-ascii?Q?gDg95fFPV63YA+bI/Bj7R2d7NrU/CXa4vVNszRyif7UJRbE8Fb1oSJjbt7eQ?=
 =?us-ascii?Q?RziwcdWA92/iYtgKRuWU+H5TZ2s8BG5cIgXwizLk6b4wYLxcwYnN+vGRSutn?=
 =?us-ascii?Q?Q/mosxy+wz+x0DX5X/GqiDe+kS2l3yi6/uCFmCloqh3O2DKRf51JCnaO+gs6?=
 =?us-ascii?Q?+d+wxBIkpVV5KNrv/35Jqcfax5Xk4BFp4lsm1eYkOtO+hi0m8n9BBUT4IElz?=
 =?us-ascii?Q?L2mYsQGqBATnoLv3lLgf30QzF1z82ooTNlqorOebaU4qWSoszOmIjO81ik4I?=
 =?us-ascii?Q?gmpIYNoxFm4uuzKAH4jJ2kYx4zttMpTHAE3aPnXivDobqR48hT+NGwWfFjEX?=
 =?us-ascii?Q?8B/vjq5yN/zuH50QwwiZ6Bo8u5RWw4lVnemWGwg3XUo901+MvH1KCcT2eLhe?=
 =?us-ascii?Q?FR7BbDhEcTb70SLMw7DSpq9Wcmu01Zhn/lkTnE1SUDzz3fvaNB7HAj3ds77Y?=
 =?us-ascii?Q?cLgC4z6MLqlmHM97dVEWnoHzypXaaKX5y1TkJHdK5yMX386wi6Ph+fZEZNii?=
 =?us-ascii?Q?CHfy9Z/2lkDPrHkx6GsTqamdCzNRKjJrzCxG85e5lE5NiC0yNHBqMev0L9Vx?=
 =?us-ascii?Q?a7uTJq+NO98u+IhsVLrsTljIJWjQO+aSlMl1omf1kmJbx+VpgmxC8xIUyoib?=
 =?us-ascii?Q?Go+mgdbKnyZ5SNVm2LXypW5Whocu1fP9ILMDHt4tFusTjZXOdc2qcCSX1MkU?=
 =?us-ascii?Q?MINVE+A16itH219Z6uAkrhpzFuSedSGMFkh3cqsOD+FXeUAuTCAH4XVGrKH3?=
 =?us-ascii?Q?jx+jTpogIgzHgywaVcZroOAA8nwGUqXeiMOUBk/RBbaeJTnwFpmYeYegN6y9?=
X-MS-Exchange-AntiSpam-MessageData-1: PQqqtWliyCqkpaBYog/BrxQibuIaQ6nHW8M=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231b0170-365e-4dc4-13a3-08dec1756590
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 13:38:29.3452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uw/2Ob5S8HGlQEm/Z+prCz11JiWE0RGwFMpkC2PKhERevvB7Ss38PY1yrDcJyB64mzBA6B8rDNQyP+jVPmraOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8422

On Wed, Jun 03, 2026 at 01:33:50PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `if` condition for enforcing the `big-endian` property incorrectly matches the `compatible` string array directly against an `enum`, which will always evaluate to false and cause the requirement to silently fail.
> --
> 
> commit 8bd3982a89722b20a3686e42d4ab3b9f0711ae11
> Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> dt-bindings: phy: lynx-10g: initial document
> 
> This commit adds the schema for the 10G Lynx SerDes used on most QorIQ and
> Layerscape SoCs. It defines the valid compatible strings, PHY cell requirements,
> and enforces SoC-specific constraints such as lane counts and endianness.
> 
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > new file mode 100644
> > index 0000000000000..8cf6027a75b91
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - fsl,ls1046a-serdes1
> > +            - fsl,ls1046a-serdes2
> 
> [Severity: Medium]
> Does this conditional correctly enforce the big-endian property? 
> 
> Since the compatible property is a string array in device trees, evaluating it
> directly against an enum always returns false. Should this use "contains:" 
> with the enum, similar to the preceding if block, so dt_binding_check 
> correctly enforces the requirement?

The tests I did suggest that it does enforce the requirement.

- "make dt_binding_check" passes with the submitted example

- If I replace "fsl,ls1028a-serdes" from the example with
  "fsl,ls1046a-serdes1" but leave everything else as is (implying:
  little endian), I get:

$ make -j 8 DT_CHECKER_FLAGS=-m dt_binding_check DT_SCHEMA_FILES=phy/fsl,lynx-10g.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ../Documentation/devicetree/bindings
  LINT    ../Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dts
  DTC [C] Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dtb
Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dtb: serdes@1ea0000 (fsl,ls1046a-serdes1): 'big-endian' is a required property
        from schema $id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml
