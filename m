Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDA347141A;
	Wed, 22 Jul 2026 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713441; cv=fail; b=LWn5qsj5gg55vjlrFMmBj881+Rc+jxHMgJd6JkMHxkPoH0QBauyMC4HqFE6s471oHUNlOBzmtX24WdLmJckGE1N7Qh7gcwsy8FVd8BeGbujnIjPrUxn/o2uKLVZRsr0Yk9FKgxAKc1UlCOdAPOGDiSQE0v+CvPOfczrgqJd+XVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713441; c=relaxed/simple;
	bh=Z/OHwTiThBUtn8AX2CdIfqNPmTo2lUeej7FhMiSSBpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c6M2TdkUoqwP7/ai4rOBeNEty6sqQL4Tz1eKoX7tQjqp2qwCE01N/xc86Xuwo5sdBNqyYup2l0pATJb9ImbVIAORbsO9510ILRkgr+neEggX6eyiqpy2brT5NQpR0A6ztzNSOiHEt2Wbwd6PKce0tFdwYhjVhplKfgyxM6Y3FX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LpqYL8oH reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LpqYL8oH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ng330tdFoW3mT4XNMGANLyNLKwMnmBvf0C1a+48+l9qlhr0XMTrxBN3Z47dIKhsBfi9ups3puMykfUbRMjslBUKNNgByTIpxWH3JfiGc4Wp1/wFZYzjl1DRDbzNx3jqd3NUfEmW4hgzdsSIHpEaBGjhbjPPyUVE/YrbAMIvfuIWsHPzkEBDxdv2T5TfEZ3NYUwAKtebbDIN0kQDjTfeH50rBNKPF5+vpfkLBEbW6bHuq54drR/QbT1lUi5I9t0f/qukV+iZi+TjGYOIx78KYIM2sgvJx5QIcrXDmpiE5F5O9oVUw9K/CsPE79z7ZxKeB4yUF0BI0tz9J3kfLLTvJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04TKHz2TanF1t/71wDkp2GcjhPObYMDSevrblfm07yY=;
 b=BZqP5HHTAKiHj+GrykL68hvg/wLDKwmFRL5U8Cop5Y5wz7+pAilMHKtdknhVsGuf9gYFE1BbX4cYIxQc5vIcmQEjsyiLwP5EKTDXV+EJG3W9nBevHibyiCa9a5rGyo2HgUjBeLL6nonFOY4VTK8stXrcXADGbJG3bsh/Ge71a8V2ZQJW6TQQ+SRBUdmFibUSM6McXYxsxHCNN5tt01j/kGFfGRXPxQsQzM1dApeHKdFriHbT/KpsBSpdD5nSIdQ70pmDQZcJUhVgY5j6pEPz6FLnykUCMPUjz7Rx7A4fspYBkyS4pQEwNMU/TZaXJP9d0eof2Swg3KYBuB3TH3DRkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04TKHz2TanF1t/71wDkp2GcjhPObYMDSevrblfm07yY=;
 b=LpqYL8oH3Hmf6uLzYhjv0gtUP460xy2a6o1XqaVUSTCQ76pjA3w/E9s054ZC3KEBwS4EvatkOfIGqwlgdrgyPzOEfndTncXZ4U/iVYvYieHiH+pRgDDCTCI/CY15qL0otmHyjdEiWFDQQFOPPf2zvXo+/1fZZDFqNBSUoDh6f42p+kl+AmTTIQbViXofjnNbpXypHNfZJOr90xSxQE/gcpvPXfyu5WOF3BYmlx94XRoCqt15gOor3yFU5SwWeAjaIVdei5uh5/44yKR6Fk+8mQPGi0KzIVNSzYMbg5OEw0yn2ScDuT8isOidO+YLs6MriypT7E/p48fKwTixtHjV1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:43:54 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0223.008; Wed, 22 Jul 2026
 09:43:53 +0000
Date: Wed, 22 Jul 2026 17:45:26 +0800
From: Liu Ying <victor.liu@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v12] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Message-ID: <amCRNuuPkr7fON6k@raspi>
References: <20260722-v6-18-topic-imx93-parallel-display-v12-1-a59dbb4dbc13@nxp.com>
 <20260722082359.E14521F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722082359.E14521F000E9@smtp.kernel.org>
X-ClientProxiedBy: MA5PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::17) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|DUZPR04MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f8c9b4-d6d9-43d6-eddd-08dee7d5bde2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|19092799006|22082099003|18002099003|3023799007|6133799003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	R7dtSFmciKUxrgpGxS1tdlqP0Fzm2chf0jWQcyvMePufoXyZOil0/1OG/beyycV8DQqBVCSDdrRX4TZzeeX9Fgy6t2xruQXuIVYOJopeIs4smQ9jo3SpDRHF4xnFpfCZyAsAr4EmzEPk9vZv3Xxm0VRKlurHrCrHiarTO3HTXr2yI7L0SysRRz/PFYFPqpVtWbAO96retjg10o+XBtlasp3hK8LwpVYyhKgBlfvH+21PKY/E0jaCtVSQMQaNWYmiNVbDUFiXG409lwpkr/HEL0tdICKcPLC6Z/zkKBZMy0qM4k90d9chMUIroghLtO493/21Ac51BP34zWdYASizypRc84P7lrFjqqgOOrljoNIk7CFW0QwHKlkw/uGm13u00fDS0KC9SWi9OW0t6CJ5vo5vZsg08bWJS6yK744axCISDNtmaXFT81S0dtN5bZ6cGDoOiiL6DE9a1hmnw4ckaDO5SetFveqFrcZ3aalkTR/nfU4/xCziz9IJrBSPht6fSnWK5ogj50RlZfRW2XJTZ4kgMa5TobR5aBaB0oO0/8uSevg4c3gEiExUGiQn5jRS6vxfn6P8dhY7zy38fq5zOY8/XJilLTJVq567HAOM5do=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(19092799006)(22082099003)(18002099003)(3023799007)(6133799003)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?5/dJDVoovusMqNiwJVvkzElLp/yakySYfQQbc2ythr7lFvJ/W/rXUc/ALo?=
 =?iso-8859-1?Q?3tvqNnGaPQfUyuAAqlZvWfoIKWEQtd8HFZFLti30Ra5LDIi3LKTaYL5fSd?=
 =?iso-8859-1?Q?bI/LdYoehL/0I0iwYDBi9JjgB90mr9h6VMtNhXh10HFk2QxtPyP8gpJMuA?=
 =?iso-8859-1?Q?dNocFJybRagLl2fR8puPI1f5KjuxD1juuPVNu6xHEItl38VF8H+iLSxDS0?=
 =?iso-8859-1?Q?CpuM4IZGRs5xH/+XyYgNwU6PssVGq/OcgNEOZEW5QjxutwX3o9fRKcUAdy?=
 =?iso-8859-1?Q?9x0gP4x2sKc8o6zorb/udyUkPey7XylPdKlQOOIW5tdBvtriEyNoq3hFDB?=
 =?iso-8859-1?Q?i81eYE5s8P6oFL6w06oQzLi0DtpB/pvO+Sm8brvmdponlj2jQkaJyccim+?=
 =?iso-8859-1?Q?2Atintm6Fn68SOfIqOa3m79BM6lyl7/mGzf3pFtr3/8phyJoqmkkxWlwXB?=
 =?iso-8859-1?Q?na31hOVLI1+frvMVFgxM5mYhIGg7uOwaEo7OzXQruvAByMqH+dBFZ+WDuF?=
 =?iso-8859-1?Q?MhyrJcjrurX1kFdJ2mk6aKTCrTpLYTLEP9d7Lc96vFFhnNiBl6fne7htth?=
 =?iso-8859-1?Q?oo9ca3jD8FlnA4QswpgJBPSyPD7OtnCtC9LajR/CB0N5oNHXW+2qU6ZUL1?=
 =?iso-8859-1?Q?VFDwtNq5NpH83fX21KvchVAel75EDepdxiyLAxvlyDp53JgMOyZGmqvUIC?=
 =?iso-8859-1?Q?IVPU2YYnicnP+PMyygQ86Bwo7ez4KbVpL/94cPTz8PliGMfpJSdIpN43JA?=
 =?iso-8859-1?Q?6h9mP+bNS6GuN+Vy2sJaPyEwSIHNk8/SE8r5cpP5VQy5L1Ez/EGaQAP+Wd?=
 =?iso-8859-1?Q?VWevJcBcOXRTUecw0UO2GDZgRyrJw7UzLMb1XVzhw4HevTfLmyyXDTrS2a?=
 =?iso-8859-1?Q?jozMRUsnP6qkhrD4C++HYraxX9HsZYa5I9zDBmxK7cb3JS+H5b9DcCPoVR?=
 =?iso-8859-1?Q?f+ZS4Z36m+H80Xdwb99Z6QnksyguQgoXeF2SYHbm8cSLzAtsgzgo4QuHPg?=
 =?iso-8859-1?Q?R93CJoJy5W4fsrubSrnfj86iWnW9O9doVv7tbrem9boaJhJ/wt5rxjYyg7?=
 =?iso-8859-1?Q?vi6iHDYn75eeK3wOPfCbUjtR1L9GqXYRPwcjQxagZskunQBgOqKRi83FNj?=
 =?iso-8859-1?Q?awPEuex7uiZM8MDBXjN7jLj3hLL0KR0OqN4PaVANfdE+/30Sdg0Ii2f/bR?=
 =?iso-8859-1?Q?wYs+SxZqmT6qJ9uMfMx4X9YweCIRY5TBLr5vnW+P4j2pfOYW1sVRB8lLZj?=
 =?iso-8859-1?Q?9yiq9cL7jhqRsn/WR9cXxH6oIICEmwFwahddYhT7gn75SeAl1eAzIL/0zp?=
 =?iso-8859-1?Q?DCwXYWRzLsM+GPxL/dClz/hZcm013MfYPvP8Hdn1fiVOPecyMmwpNg8V0E?=
 =?iso-8859-1?Q?Qc8euewLHOwa8VAfFAcpbvCZvO8WLoMxDlTBGlLN7JHpbHSpWSEpHkTcSx?=
 =?iso-8859-1?Q?rKZZG87cApkyqI3CMJu8jNriRS+9YLfAaG4hj62AqDPTa7fB3vzaC2VhMK?=
 =?iso-8859-1?Q?Lhs3lwUGr9UGvG8HaFNPrL0SdsV0pIBxQ+dji2xQeVySgBG0cwLcludGdl?=
 =?iso-8859-1?Q?7Va/J6+27m4Bg3qC8BxZ3kizg4yHry8+PnH+vhb7NqJh7CjoQzQSzFCxJ5?=
 =?iso-8859-1?Q?dhN6f+NIgj7oURW9mMYQkgfIlmJnZRML46ePxtnfi2kfUPB7jMaVsKNkMP?=
 =?iso-8859-1?Q?ot0Hfgz4ZSDPUx+AUpzApxJNlUxIxlau+QORbafxooROxomP0wzhJmZ8CK?=
 =?iso-8859-1?Q?qDMnoLQCYU95dfXutW0hJCmTZt8BRMOcE3qvz2i989/M+ORx19cCOKHzRJ?=
 =?iso-8859-1?Q?ZsERRzBebA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f8c9b4-d6d9-43d6-eddd-08dee7d5bde2
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:43:53.8276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FfVl74v60Qw+RuCdpxi8M6QZad8dQNuWaiejSJq2k8y6Y5US44Q7VQ8GwMYUSITqU4fzT+Xb/Kn5aL9EaTIFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9919

On Wed, Jul 22, 2026 at 08:23:59AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Returning a fallback format for unsupported output formats breaks DRM bridge format negotiation.
> --
> 
> --- Patch [1]: [PATCH v12] drm/bridge: imx: Add i.MX93 parallel display format configuration support ---
> commit 62def9c6e85686d63c6204b71b54383955f8f9d1
> Author: Liu Ying <victor.liu@nxp.com>
> drm/bridge: imx: Add i.MX93 parallel display format configuration support
> 
> This commit introduces a new DRM bridge driver to support parallel display
> format configuration on the NXP i.MX93 and i.MX91 SoCs. It handles format
> conversions for the MEDIAMIX BLK-CTRL DISPLAY_MUX register.
> 
> > diff --git a/drivers/gpu/drm/bridge/imx/imx93-pdfc.c b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
> > new file mode 100644
> > index 0000000000000..b084409d22ef2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
> [ ... ]
> > +static u32 *
> > +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +					    struct drm_bridge_state *bridge_state,
> > +					    struct drm_crtc_state *crtc_state,
> > +					    struct drm_connector_state *conn_state,
> > +					    u32 output_fmt,
> > +					    unsigned int *num_input_fmts)
> > +{
> > +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> > +	u32 *input_fmts;
> > +
> > +	*num_input_fmts = 0;
> > +
> > +	input_fmts = kmalloc_obj(*input_fmts);
> > +	if (!input_fmts)
> > +		return NULL;
> > +
> > +	*num_input_fmts = 1;
> > +
> > +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
> > +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDIA_BUS_FMT_RGB888_1X24\n");
> > +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > +		return input_fmts;
> > +	}
> 
> [Severity: High]
> Does returning a fallback format here break DRM bridge format negotiation?
> 
> When the downstream bridge requests an unsupported output format first,
> drm_atomic_bridge_chain_select_bus_fmts() queries atomic_get_input_bus_fmts()
> to check if the format is supported. By returning MEDIA_BUS_FMT_RGB888_1X24
> instead of 0 formats, this driver falsely claims it can support the requested
> output_fmt.
> 
> The core then proceeds with the unsupported format, which is correctly
> rejected by imx93_pdfc_bridge_atomic_check(), aborting the modeset with
> -EINVAL instead of gracefully negotiating a fallback.

Makes sense.  The reported issue was introduced by v8.  My earlier v5 does
the negotiation correctly.

> 
> Should this instead set *num_input_fmts = 0, free the array, and return NULL
> when the output format is unsupported?

No need to free any array.  Just need to set *num_input_fmts = 0 and then
return NULL when the output format is unsupported.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260722-v6-18-topic-imx93-parallel-display-v12-1-a59dbb4dbc13@nxp.com?part=1

-- 
Regards,
Liu Ying
