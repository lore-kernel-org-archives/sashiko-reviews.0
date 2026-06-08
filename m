Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83148370D45
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920205; cv=fail; b=NnluNKT3hshiRJhOsdoc4X2ZDrDeEVhSkPg1g94b9BrmTm6nsza2bQAXpUAEH48VzYde9nje4FZZGeD1dXirt7PY/UFy1MWN3g+ypsc8Tt8efeKSGa3h6d64eWTOe5v1RkB9w4jYN1lYiWeMV5Kw/Gi6tW3N8L2AhO5bD8fuYDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920205; c=relaxed/simple;
	bh=IbX6bGe0c7CZMxncTiWCwHIOO4IBIqu7S1d6FQupcL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cWssZKPGi57GziAai/PHZM9zmX/EqWwE//bIh7I9BcyzI9GeZHN6p53Fc2aorz8z5MCXSmQAcOvGX7CnDHbim/yLP05imltnp8zmYMw0VqFLFtkXOG2FO+ea+BZjqetUWLvFywgrNoARexGysUB8WnbzbHbBT42rqQb5cIGiPUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fdguwH6P; arc=fail smtp.client-ip=40.107.159.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fdguwH6P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPFcsrQJxwsaiTInTrk1nHQwC2AqyM0FO+64JS1CpPzCQce1yLjKY5VUKffBSuZ52HHRf2nuOQxUwMitzGXvXcdKJbfk2Z47oGXKfRHPDTosbLdYqFp2q3HuQ4O7WKwP/aFLUNdr8/zwGFea5WpQeG/G+PUFuzjTyWAmAIYDopt/7kgsY2bKGa6YP+K/nLmbF16zrNPSLETnFXTcQusvRieibJvHA+NvegkDNcd592ZrqFH0DlN53QrHdMDj2JfssMeoQH5JA0w63ZS3zgifUyWoxESXOitt6cGsB+LrCibgp+5tCfO3cu10BPWzPmJq6UShw/QbZ8Nc9fr9qRCZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfeVth7SkbxZ27Jo0GRaNXe4Kk7NsReQq7swIUPMFHM=;
 b=pRaTZ7nFPQfUNcdM62EP+SULttH4y2P1UnvR5jfPWHve6r49pslYfT3aPLlYQfYKgxN1bpcFJ04LHaM0sZK7wOY5gbAFCExcWcj9ih0l8LKmWxHo/0RcMnXzuuKRtbYE/wTgrQbStHO0BY3j3M+D47Rp9pHuWvlfHG4fObDAFp7T0xV1JKjEMXp0VezcQArv8WPIknqfTdEt70zBfzUSuvYqR1J2I2G0GU3ck4ssISRoLk1E5Q51BZViBemjELUkOu2HpsvanHlOd3gkh2T+X+sBWcgEXVYDeZJiK8QpwCRQ4SVJ2pSj37sLF2hl5UpSlK0l32jErGD/5cIiyWJp1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfeVth7SkbxZ27Jo0GRaNXe4Kk7NsReQq7swIUPMFHM=;
 b=fdguwH6PBKhQCEIwCb4xaHHIYDaufRAzvjZUK1G/eNgsImw8GqSgBt3YHK9t9hxoN18vfqticwR7EZUA6ZholCVFzTceJ3YBWwDiuTASP1UWdCWNjoP9Y+BtfoGbXmAAze9xYUkReLX4YS40ElRwKABOTNAk3jXNR/ir5j6PT7JyRy1aDs09GK48BbLsHb+tiR8zitqqLgfkuw/EA45bmMD9tKITpTTo8UGVfsp6SIErbzFzWoIp0zWKoNqfzkX7rSChf1/vNk8Y0AnTYihxHJmXtT5c1dv1v7SnXo6utbX1AmECaDe/VQDD4/McFL7gIbugeohO+AAXeHmpfbmdxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AM8PR04MB7907.eurprd04.prod.outlook.com (2603:10a6:20b:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 12:03:20 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 12:03:20 +0000
Date: Mon, 8 Jun 2026 15:03:16 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, sashiko-reviews@lists.linux.dev,
	vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	olteanv@gmail.com
Subject: Re: [PATCH v3 phy-next 14/16] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <20260608120316.km3qcjleehcxpzdi@skbuf>
References: <20260603132059.503527-1-vladimir.oltean@nxp.com>
 <20260603133350.9FA271F00893@smtp.kernel.org>
 <20260603133825.l544tnmtn2pqfrzh@skbuf>
 <20260603-numerate-unbundle-ef259832006d@spud>
 <20260605083737.yryq2a763zhnkjyq@skbuf>
 <20260605202458.GA6304-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605202458.GA6304-robh@kernel.org>
X-ClientProxiedBy: VI1PR07CA0296.eurprd07.prod.outlook.com
 (2603:10a6:800:130::24) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AM8PR04MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: db489f74-518f-4c07-beeb-08dec555eeb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|19092799006|11063799006|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	HjQY7cNznQPs1tcUMRaf11aaaM5LuNPzP2rLM5orwzlDi8Rb6GVzvcJI28RbwC+pGJDrZosPkPzmo6ASi7Ax401EJWVzEkobG40N0d/lfEEmBcsQ0h2p+4BtkL8/TTUdOd4sRA6zdvtMfMRz2qgLHZYK/4cIh7fDX4IBf9CJem8s1AXQFK8RLTj2BSZzwtsY0DA4i4/sLHsXNQokaQUQ8y4/K6w92ZTma4/Y7zoED5SBsw6OaStP07VimqncbonzI4bFTHhJty1tkZRHj4rd94lNZwSqNg2i/HLYVeYvETKZn4nTfXL19QcuNMKtlYlI2E7eBqS/TcioDUEdTGZ7yUlxDohE5CznsDqUc7cDBK+RhkuhH7dKVUFkad2IxHMKDQGGBw9w7+K3GIp0PZMA2cUu1FG5K4WDB0Vk4GHYHDxe9Gu7i8aaostr9IbD2y+WeSdiN5kOW28VwkB2rxUbVtNWPg9MPTElNGzc8VFUlTj9W4Jj6mjKHRJTW306FzLjLH7tf+yIHbmJxRZv4SDb7XKCcorQjtYvGAjniPNW2VS2bYmHNutbhBTW1ZSf6U8Xg1fAwMwRIFjTUukbz63/Xk45D5wwbV0YnURuOJfeRCTJuuHWm8H78x/umbT9QqDRyABRYih3aUNLZopjzihwBQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(19092799006)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vy9mlQD1u6IG9bo9jSlfwmuoyqrp1/Q+KTcghGRN85r5yD4oAnlyTB7ta0QC?=
 =?us-ascii?Q?4fqtfO5C3xIefYYsaqvmcKZdkhjHy/5TI1Hxxri+7O6kVK03nNV+Wzx+0b0z?=
 =?us-ascii?Q?HX07cFdluk+sZr8mGHJQjA2md7jiSNMAIIHsP7A6xSKcLmxhY7+255hRjbFR?=
 =?us-ascii?Q?gK/M3T4lGVsUmgJtzS0B20drD6SmPXM47bTwytfQ3IuEGfMB5CBppVpLTrS/?=
 =?us-ascii?Q?Gf7rSo2AbDmZhoxB2JqeMe5ZXAQ3+2JAMNzekbh0EpPO5/O/G3wfeMEEhNhb?=
 =?us-ascii?Q?r+quocChltpRPNK1H8GvKLlNNFshoMx0f2ggD9gJ34OfwXm9UYZaOzZO6duo?=
 =?us-ascii?Q?b+o31i555u7Rp1kcCYR2wX3aVfTsHyOjbZgy2oaiGCHd/5yBLH1Vq3qx/fgv?=
 =?us-ascii?Q?kgX6JA1ReylRuaKYBkQyeDZlY7BkWS21CAtMeeSgHCd95HwLYt2m113E2UJi?=
 =?us-ascii?Q?bq56w/j3TCw28OWDjahJQqt2aORSa9Uf4CzDnux0qODA486YHNt1rsCxhEij?=
 =?us-ascii?Q?hx/opqPKMS2dNdjNKT4bjvjJLZDi0xnrMZUo4UlSK8m9IBRcBxGEhxGrX3Ls?=
 =?us-ascii?Q?8CINkdrl71B9zfmSgyePhmCn/0fHWdtltOnrlwwQNXNAkoZDEn/g05aB1JNe?=
 =?us-ascii?Q?ZPkSWyIN+6/qdSqM9PySLb2lSwzkc6VOMlb+YBghFg2Va91MfL0yoiSYW79V?=
 =?us-ascii?Q?PdDy6cADbBrmCuHnnzy1HaISgPU9A3oUfG2t8Cp2TKx061Z3yij0U7UBBF8c?=
 =?us-ascii?Q?IdYTrHutd4ouEEIJXHh39sTnJavTWJCoJIN9CkIk+vGh+zVw3fW7LrtmJfy4?=
 =?us-ascii?Q?3v6W9zin/BuKFi/u8jD3uJ+P92TsruZcHDhmM6d8SOfySCA5pIDoA3foFtEV?=
 =?us-ascii?Q?C/vHyrHf6LUgjLbC1OFCpbSl7mtfSz0bCImSBAgHL9BVDkkmFORlduXmmLoU?=
 =?us-ascii?Q?F63mBS/rWRblWwHWPgbx92lpTSVvKPY15rHtDn15pNM2f6UfGeKF0dIjrnwO?=
 =?us-ascii?Q?PCnzOylsHEjfKedSQC730nVIhmHnjFxPRpP5EgA78t5s313DnMf/JtG/9z6h?=
 =?us-ascii?Q?fDa5Ihq78wOBMc7I3WhMIXEANSnT5gUPpe6I/zU0R4IFGt5YIlVvwySdOVKb?=
 =?us-ascii?Q?D32QyloPy5A0xgiqfS9bIpRNDXIEyJUr8GuuJMrySHzG5TMDs2VW8H2rOrYa?=
 =?us-ascii?Q?pzA6X0ljpOY22X8kCj4VtTTap8BNu9p9cz+BPX/OvEBRqbF9giGPwtxp7omy?=
 =?us-ascii?Q?q8PUJQ18BDwzE4kPNVH/I1uk2dCJgv4zs10hGgoKgCN56Nf+P2xyJlr9+f/S?=
 =?us-ascii?Q?mMe/Kgb5kSuv9yCSi6pAA3rntdMqpcxVmi9ekIMdvZfN/kr5CpfQpK+w2on6?=
 =?us-ascii?Q?/7xNuEEQqXawGMqBMUTudF8xNE1rVZjcuN2GWMk3E8p2AZwwgiRaExJhIuXF?=
 =?us-ascii?Q?t20MkPNCIz4okAcf6wWK0vwfPlUzwKg7em5BJnXjinZJMqxsdT0pXKLQ//33?=
 =?us-ascii?Q?fkGZS4TnF8yPTpYni92r/kHLZb8W4tTTjxTFuGfKp/4OdS/U2oQTFF4j4sIl?=
 =?us-ascii?Q?gpzmMDYc1kT+dd9UoeMp14Y4+QjAoPWsZMW96wsr0s3s7WdzqKMq5Ej+4ReT?=
 =?us-ascii?Q?At669V+yb9cASPXx92B+HUFjVfr2vquNb6yWgPUx3eszbrO9XWPAgk2lzcEV?=
 =?us-ascii?Q?ize+S9nRNd+AyAKqfuHHZIttDhx6ev+J4LQflSOyCIFMGGUrvB22DwWQmwXO?=
 =?us-ascii?Q?0rXfil4auJUb8EL9itzilBciJitl2WfYx6ASSsSSH8maArXeFoq6X0vJEJJb?=
X-MS-Exchange-AntiSpam-MessageData-1: GXbWE1h8zUYS0yKhSvIIVkjI9BCefsGon9s=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db489f74-518f-4c07-beeb-08dec555eeb3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 12:03:20.2969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xS8Gno19IKAuyxeAI5By4DwnkCooRpUQXcEUC4xtnW10C9lXW6SsJMURrru5u5AIKlOUSWWY545rMD4jnVYU1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7907

On Fri, Jun 05, 2026 at 03:24:58PM -0500, Rob Herring wrote:
> On Fri, Jun 05, 2026 at 11:37:37AM +0300, Vladimir Oltean wrote:
> > On Wed, Jun 03, 2026 at 04:50:39PM +0100, Conor Dooley wrote:
> > > On Wed, Jun 03, 2026 at 04:38:25PM +0300, Vladimir Oltean wrote:
> > > > On Wed, Jun 03, 2026 at 01:33:50PM +0000, sashiko-bot@kernel.org wrote:
> > > > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > > > - [Medium] The `if` condition for enforcing the `big-endian` property incorrectly matches the `compatible` string array directly against an `enum`, which will always evaluate to false and cause the requirement to silently fail.
> > > > > --
> > > > > 
> > > > > commit 8bd3982a89722b20a3686e42d4ab3b9f0711ae11
> > > > > Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> > > > > 
> > > > > dt-bindings: phy: lynx-10g: initial document
> > > > > 
> > > > > This commit adds the schema for the 10G Lynx SerDes used on most QorIQ and
> > > > > Layerscape SoCs. It defines the valid compatible strings, PHY cell requirements,
> > > > > and enforces SoC-specific constraints such as lane counts and endianness.
> > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > > > > > new file mode 100644
> > > > > > index 0000000000000..8cf6027a75b91
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > > > > > +  - if:
> > > > > > +      properties:
> > > > > > +        compatible:
> > > > > > +          enum:
> > > > > > +            - fsl,ls1046a-serdes1
> > > > > > +            - fsl,ls1046a-serdes2
> > > > > 
> > > > > [Severity: Medium]
> > > > > Does this conditional correctly enforce the big-endian property? 
> > > > > 
> > > > > Since the compatible property is a string array in device trees, evaluating it
> > > > > directly against an enum always returns false. Should this use "contains:" 
> > > > > with the enum, similar to the preceding if block, so dt_binding_check 
> > > > > correctly enforces the requirement?
> > > > 
> > > > The tests I did suggest that it does enforce the requirement.
> > > 
> > > Yeah, sashiko just doesn't understand how this works without "contains".
> > > "contains" is only actually required for validation purposes if there's
> > > fallback compatibles and you're trying to get a partial match.
> 
> Not exactly. The missing part is the schema is fixed up so the above is 
> converted to:
> 
> compatible:
>   minItems: 1
>   maxItems: 1
>   items:
>      - enum:
>          - fsl,ls1046a-serdes1
>          - fsl,ls1046a-serdes2
> 
> If we didn't do that, the above is not what we want here, but 'contains' 
> is as that's the loosest condition and works regardless of how many 
> entries compatible has. That's what you should do here.
> 
> This fixup used to be a lot more widespread when we used the DT YAML 
> format and everything was decoded to an an array or matrix. The fixups 
> saved a lot of boilerplate. That's less true now, so maybe getting rid 
> of more fixups like this case would be better.

Thanks for the explanation, it makes sense now.

I ran "dt-mk-schema -j Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml"
and I can see the following, which seems to check out:

    "http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml": {
        "$filename": "/opt/linux/net-phy-upstreaming/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml",
        "$id": "http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml#",
        "$schema": "http://devicetree.org/meta-schemas/core.yaml#",
        "additionalProperties": false,
        "allOf": [
            {
               {
                "if": {
                    "properties": {
                        "compatible": {
                            "items": [
                                {
                                    "enum": [
                                        "fsl,ls1046a-serdes1",
                                        "fsl,ls1046a-serdes2"
                                    ]
                                }
                            ],
                            "maxItems": 1,
                            "minItems": 1,
                            "type": "array"
                        }
                    }
                },
                "then": {
                    "required": [
                        "big-endian"
                    ]
                }
               }
            }
        ]
    }

I can send a v4 replacing the constraint with:

allOf:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - fsl,ls1028a-serdes
              - fsl,ls1046a-serdes1
              - fsl,ls1046a-serdes2
              - fsl,ls1088a-serdes1
              - fsl,ls1088a-serdes2
    then:
      patternProperties:
        "^phy@[0-7]$":
          properties:
            reg:
              minimum: 0
              maximum: 3
  - if:
      properties:
        compatible:
          contains:
            enum:
              - fsl,ls1046a-serdes1
              - fsl,ls1046a-serdes2
    then:
      properties:
        big-endian: true
      required:
        - big-endian

since you've said that we shouldn't rely on this fixup anymore. I see
you gave me a Reviewed-by and I deliberately am not adding a fallback
compatible, but I can do so anyway.

> > Yeah, I have no clear understanding of the json-schema syntax either, I
> > just copied from another place where it was clear that the intention was
> > to have multiple matches on nodes having a single compatible string each.
> > 
> > But maybe it would be good from DT bindings maintainers to teach LLMs
> > where they get things wrong in this repo?
> > https://github.com/masoncl/review-prompts/blob/main/kernel/subsystem/dt-bindings.md
> 
> Yes, there's a few things it consistently gets wrong. I've looked at 
> this and I can go write more instructions (and fix some things that seem 
> wrong), but how do I know if it really works? First, I'd be testing with 
> a different LLM as that's what I have access to. Second, how do I know 
> if no warning is just the indeterminate nature of LLMs?

If you have a lot of time on your hands, the question "was this concern
considered and dismissed, or not considered?" should be able to be
answered.

In the sashiko web UI for the patch set, there is a "View Raw Log" link
for each patch:
https://sashiko.dev/#/patchset/20260603131914.503053-1-vladimir.oltean%40nxp.com
This gives you its reasoning process and its internal findings (which it
tries to dismiss again in a later stage, before reporting them):
https://sashiko.dev/#/log/67856
```json
{
  "findings": [
    {
      "problem": "The `if` condition for enforcing the `big-endian` property incorrectly matches the `compatible` string array directly against an `enum`, which will always evaluate to false and cause the requirement to silently fail.",
      "severity": "Medium",
      "severity_explanation": "In Device Tree schema validation, the `compatible` property is processed as a JSON string array. Inside an `if` block, standard JSON schema rules apply. Using `properties: compatible: enum:` evaluates whether the array itself exactly equals one of the scalar strings in the enum, which is structurally impossible. As a result, the condition will always evaluate to false, and the `big-endian` requirement for `fsl,ls1046a-serdes1` and `fsl,ls1046a-serdes2` will never be enforced by `dt_binding_check`. The check must be updated to use `properties: compatible: contains: enum:` to correctly evaluate the elements within the array, similar to the preceding `if` block.",
      "preexisting": false,
      "locations": [
        {
          "file": "Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml",
          "function_or_symbol": null,
          "line": 91,
          "code_snippet": "  - if:\n      properties:\n        compatible:\n          enum:\n            - fsl,ls1046a-serdes1\n            - fsl,ls1046a-serdes2\n    then:\n      required:\n        - big-endian",
          "why_this_location_matters": "This conditional block incorrectly omits `contains:`, rendering the entire schema validation rule for the `big-endian` property ineffective."
        }
      ]
    }
  ]
}
```

> What's really needed is for sashiko to incorporate feedback like any
> other developer.  Otherwise, it's going to be like some certain
> reviewers we've banned.

I don't think that process is in place right now - the learning process
from mailing list discussions is human driven and not autonomous.
Nor would it be immediately obvious how to automate it, if you consider
the risk of pollution from certain reviewers, which you've also pointed
out. But as a reviewer and maintainer, I think you are in a good
position to write your experience down in the dt-schema skill and see
how it goes from there.
